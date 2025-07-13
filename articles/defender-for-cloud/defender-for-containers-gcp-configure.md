---
title: Configure Defender for Containers on GCP (GKE)
description: Learn how to configure advanced settings for Microsoft Defender for Containers on GKE clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on GCP (GKE)

This article explains how to configure advanced settings for Defender for Containers on your GKE clusters.

## Configuration areas

Jump to the configuration you need:

### Core settings

- [Configure runtime protection](#configure-runtime-protection)
- [Configure vulnerability scanning](#configure-vulnerability-scanning)
- [Configure security policies](#configure-security-policies)

### GCP-specific features

- [Workload Identity configuration](#configure-workload-identity)
- [Binary Authorization setup](#configure-binary-authorization)
- [GKE Autopilot settings](#configure-gke-autopilot)

### Advanced features

- [Configure alerts](#configure-alerts-and-notifications)
- [Performance optimization](#performance-optimization)
- [Multi-project setup](#configure-multi-project-setup)

> [!TIP]
> Most organizations start with [runtime protection](#configure-runtime-protection) and [GCP-specific features](#configure-workload-identity).

## Configure runtime protection

### Exclude namespaces from monitoring

Create a ConfigMap to exclude specific namespaces:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-config
  namespace: kube-system
data:
  excludedNamespaces: |
    - kube-system
    - kube-public
    - gke-system
    - istio-system
```

Apply and restart the sensor:

```bash
kubectl apply -f defender-config.yaml
kubectl rollout restart daemonset/microsoft-defender-sensor -n kube-system
```

### Configure GKE-specific monitoring

Configure monitoring for GKE-specific resources:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-gke-config
  namespace: kube-system
data:
  gkeFeatures: |
    monitorWorkloadIdentity: true
    monitorGKEAutopilot: true
    includeSystemPods: false
    monitorNodePools: true
```

## Configure vulnerability scanning

### Configure GCR/Artifact Registry scanning

Configure enhanced scanning for Google registries:

```bash
# Enable vulnerability scanning for all repositories
for repo in $(gcloud artifacts repositories list --format="value(name)"); do
    gcloud artifacts repositories update $repo \
        --enable-vulnerability-scanning \
        --location=LOCATION
done

# Grant permissions for scanning
gcloud projects add-iam-policy-binding PROJECT_ID \
    --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/artifactregistry.reader"
```

### Configure scan exclusions

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-scan-config
  namespace: kube-system
data:
  excludedRegistries: |
    - gcr.io/PROJECT_ID/test-*
    - gcr.io/PROJECT_ID/dev-*
  excludedImages: |
    - */debug:*
    - */test:*
  scanFrequency: "24h"
  scanOnPush: "true"
```

### Configure private registry access

For private Artifact Registry repositories:

```bash
# Create secret for private registry
kubectl create secret docker-registry gcr-secret \
    --docker-server=gcr.io \
    --docker-username=_json_key \
    --docker-password="$(cat keyfile.json)" \
    --namespace=kube-system

# Reference in Defender configuration
kubectl patch configmap microsoft-defender-config -n kube-system --type merge -p '
{
  "data": {
    "registryCredentials": "gcr-secret"
  }
}'
```

## Configure security policies

### Deploy GKE-specific policies

Apply GKE security best practices:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-gke-policies
  namespace: kube-system
data:
  policies: |
    - name: "enforce-workload-identity"
      enabled: true
      action: "alert"
    - name: "require-binary-authorization"
      enabled: true
      action: "block"
    - name: "enforce-pod-security-standards"
      enabled: true
      level: "restricted"
```

### Configure Pod Security Standards

```bash
# Enable Pod Security Standards on namespace
kubectl label namespace production \
    pod-security.kubernetes.io/enforce=restricted \
    pod-security.kubernetes.io/audit=restricted \
    pod-security.kubernetes.io/warn=restricted

# Configure admission controller
kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: secure-namespace
  labels:
    pod-security.kubernetes.io/enforce: restricted
    pod-security.kubernetes.io/enforce-version: latest
EOF
```

## Configure Workload Identity

### Enable Workload Identity for Defender

```bash
# Enable Workload Identity on cluster
gcloud container clusters update CLUSTER_NAME \
    --workload-pool=PROJECT_ID.svc.id.goog

# Create Kubernetes service account
kubectl create serviceaccount defender-sensor -n kube-system

# Bind to GCP service account
kubectl annotate serviceaccount defender-sensor -n kube-system \
    iam.gke.io/gcp-service-account=defender-for-containers@PROJECT_ID.iam.gserviceaccount.com

# Create IAM policy binding
gcloud iam service-accounts add-iam-policy-binding \
    defender-for-containers@PROJECT_ID.iam.gserviceaccount.com \
    --role roles/iam.workloadIdentityUser \
    --member "serviceAccount:PROJECT_ID.svc.id.goog[kube-system/defender-sensor]"
```

### Update Defender deployment

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: microsoft-defender-sensor
  namespace: kube-system
spec:
  template:
    spec:
      serviceAccountName: defender-sensor
      nodeSelector:
        iam.gke.io/gke-metadata-server-enabled: "true"
```

## Configure Binary Authorization

### Create attestor

```bash
# Create attestor
gcloud container binauthz attestors create defender-attestor \
    --attestation-authority-note=defender-note \
    --attestation-authority-note-project=PROJECT_ID

# Add public key
gcloud container binauthz attestors public-keys add \
    --attestor=defender-attestor \
    --pgp-public-key-file=./key.pub
```

### Create and apply policy

```yaml
# binary-auth-policy.yaml
admissionWhitelistPatterns:
- namePattern: gcr.io/PROJECT_ID/approved/*
defaultAdmissionRule:
  requireAttestationsBy:
  - projects/PROJECT_ID/attestors/defender-attestor
  enforcementMode: ENFORCED_BLOCK_AND_AUDIT_LOG
globalPolicyEvaluationMode: ENABLE
```

Apply the policy:

```bash
gcloud container binauthz policy import binary-auth-policy.yaml
```

## Configure GKE Autopilot

### Autopilot-specific settings

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-autopilot
  namespace: kube-system
data:
  autopilotConfig: |
    enableNodeAutoProvisioning: true
    respectAutoscalingLimits: true
    minimalResourceRequests: true
    tolerations:
      - key: "cloud.google.com/gke-autopilot"
        operator: "Exists"
```

### Resource configuration for Autopilot

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: microsoft-defender-sensor
spec:
  template:
    spec:
      containers:
      - name: defender-sensor
        resources:
          requests:
            cpu: "50m"
            memory: "100Mi"
          limits:
            cpu: "100m"
            memory: "200Mi"
```

## Configure alerts and notifications

### Set up alert routing

Configure alert routing to Google Cloud operations:

```bash
# Create notification channel
gcloud alpha monitoring channels create \
    --display-name="Defender Alerts" \
    --type=email \
    --channel-labels=email_address=security@example.com

# Create Pub/Sub topic for alerts
gcloud pubsub topics create defender-alerts

# Grant permissions
gcloud pubsub topics add-iam-policy-binding defender-alerts \
    --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/pubsub.publisher"
```

### Configure alert suppression

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-alerts-config
  namespace: kube-system
data:
  suppressionRules: |
    - alertType: "K8S_PrivilegedContainer"
      namespaces: ["kube-system", "gke-system"]
      duration: "24h"
    - alertType: "K8S_ExposedDashboard"
      labels:
        app: "monitoring"
      duration: "7d"
```

## Performance optimization

### Adjust resource limits for GKE

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: microsoft-defender-sensor
  namespace: kube-system
spec:
  template:
    spec:
      containers:
      - name: microsoft-defender-sensor
        resources:
          limits:
            memory: "400Mi"
            cpu: "150m"
          requests:
            memory: "150Mi"
            cpu: "50m"
```

### Configure node affinity for GKE node pools

```yaml
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: cloud.google.com/gke-nodepool
            operator: NotIn
            values:
            - system-pool
          - key: cloud.google.com/gke-preemptible
            operator: NotIn
            values:
            - "true"
```

## Configure multi-project setup

### Connect multiple GCP projects

```bash
# Script to connect multiple projects
#!/bin/bash
PROJECTS=("project-1" "project-2" "project-3")

for PROJECT in "${PROJECTS[@]}"; do
    echo "Configuring project: $PROJECT"
    
    # Set project
    gcloud config set project $PROJECT
    
    # Create service account
    gcloud iam service-accounts create microsoft-defender-containers \
        --display-name="Microsoft Defender for Containers"
    
    # Assign roles
    gcloud projects add-iam-policy-binding $PROJECT \
        --member="serviceAccount:microsoft-defender-containers@$PROJECT.iam.gserviceaccount.com" \
        --role="roles/container.viewer"
done
```

## Integration with GCP services

### Configure Cloud Logging export

```bash
# Create log sink for Defender alerts
gcloud logging sinks create defender-alerts \
    storage.googleapis.com/defender-alerts-bucket \
    --log-filter='resource.type="k8s_cluster" AND jsonPayload.alertType=~"K8S_.*"'

# Grant permissions
gsutil iam ch serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com:objectCreator \
    gs://defender-alerts-bucket
```

### Enable GKE audit logging

```bash
# Update cluster with comprehensive audit logging
gcloud container clusters update CLUSTER_NAME \
    --enable-cloud-logging \
    --logging=SYSTEM,WORKLOAD,API_SERVER

# Configure log retention
gcloud logging buckets update _Default \
    --location=global \
    --retention-days=30
```

## Compliance configuration

### Enable CIS GKE Benchmark

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-compliance-config
  namespace: kube-system
data:
  compliance: |
    standards:
      - "CIS-GKE-1.4.0"
      - "PCI-DSS-3.2.1"
      - "GKE-Security-Best-Practices"
    scanFrequency: "daily"
    autoRemediate: false
    reportFormat: "json"
```

### Custom compliance rules

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-custom-compliance
  namespace: kube-system
data:
  customRules: |
    - name: "gke-workload-identity-required"
      description: "All pods must use Workload Identity"
      severity: "High"
      condition: |
        metadata.annotations["iam.gke.io/gcp-service-account"] != null
    - name: "binary-authorization-enabled"
      description: "Binary Authorization must be enabled"
      severity: "Critical"
```

## Monitor configuration changes

```kusto
// Query configuration changes in Log Analytics
ConfigurationChange
| where Computer contains "gke"
| where ConfigChangeType == "Files" or ConfigChangeType == "Software"
| where TimeGenerated > ago(24h)
| project TimeGenerated, Computer, ConfigChangeType, FieldsChanged
| order by TimeGenerated desc
```

## Next steps

- [Verify your configuration](defender-for-containers-gcp-verify.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md)
