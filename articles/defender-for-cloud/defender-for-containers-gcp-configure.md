---
title: Configure Defender for Containers on GCP (GKE)
description: Learn how to configure advanced settings for Microsoft Defender for Containers on GKE clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on GCP (GKE)

This article explains how to configure advanced settings for Defender for Containers on your GKE clusters.

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

### Advanced GCR/Artifact Registry settings

Configure enhanced scanning for Google registries:

```bash
# Enable vulnerability scanning for all repositories
for repo in $(gcloud artifacts repositories list --format="value(name)"); do
    gcloud artifacts repositories update $repo \
        --enable-vulnerability-scanning
done

# Configure scanning policies
gcloud artifacts repositories set-iam-policy REPOSITORY \
    policy.json \
    --location=LOCATION
```

Policy example (policy.json):

```json
{
  "bindings": [
    {
      "role": "roles/artifactregistry.reader",
      "members": [
        "serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com"
      ]
    }
  ]
}
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

### Configure Binary Authorization

Integrate with GKE Binary Authorization:

```bash
# Create attestor
gcloud container binauthz attestors create defender-attestor \
    --attestation-authority-note=defender-note \
    --attestation-authority-note-project=PROJECT_ID

# Create policy
cat > binary-auth-policy.yaml << EOF
admissionWhitelistPatterns:
- namePattern: gcr.io/PROJECT_ID/*
defaultAdmissionRule:
  requireAttestationsBy:
  - projects/PROJECT_ID/attestors/defender-attestor
  enforcementMode: ENFORCED_BLOCK_AND_AUDIT_LOG
EOF

# Apply policy
gcloud container binauthz policy import binary-auth-policy.yaml
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

# Create alert policy
gcloud alpha monitoring policies create \
    --notification-channels=CHANNEL_ID \
    --display-name="Defender Security Alerts" \
    --condition-type=metric \
    --condition-display-name="Security Alert"
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

## Configure workload protection

### Enable Workload Identity monitoring

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-workload-config
  namespace: kube-system
data:
  workloadIdentity: |
    enabled: true
    monitorServiceAccounts: true
    alertOnUnauthorizedAccess: true
    excludedServiceAccounts:
      - "default"
      - "node-*"
```

### Configure Pod Security Standards

```bash
# Enable Pod Security Standards
kubectl label namespace default \
    pod-security.kubernetes.io/enforce=restricted \
    pod-security.kubernetes.io/audit=restricted \
    pod-security.kubernetes.io/warn=restricted
```

## Configure compliance scanning

### Enable CIS GKE Benchmark scanning

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
    scanFrequency: "daily"
    autoRemediate: false
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
```

## Integration with GCP services

### Configure Cloud Logging export

```bash
# Create log sink for Defender alerts
gcloud logging sinks create defender-alerts \
    storage.googleapis.com/defender-alerts-bucket \
    --log-filter='resource.type="k8s_cluster" AND jsonPayload.alertType=~"K8S_.*"'
```

### Enable GKE audit logging

```bash
# Update cluster with audit logging
gcloud container clusters update CLUSTER_NAME \
    --enable-cloud-logging \
    --logging=SYSTEM,WORKLOAD,API_SERVER
```

## Next steps

- [Verify your configuration](defender-for-containers-gcp-verify.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md)
