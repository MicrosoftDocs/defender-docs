---
title: Configure Defender for Containers on Arc-enabled Kubernetes
description: Learn how to configure advanced settings for Microsoft Defender for Containers on Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on Arc-enabled Kubernetes

This article explains how to configure advanced settings for Defender for Containers on your Arc-enabled Kubernetes clusters.

## Configuration areas

Jump to the configuration you need:

### Core settings

- [Configure runtime protection](#configure-runtime-protection)
- [Configure vulnerability scanning](#configure-vulnerability-scanning)
- [Configure security policies](#configure-security-policies)

### Distribution-specific

- [Rancher configuration](#rancher-specific-configuration)
- [VMware Tanzu configuration](#configure-for-vmware-tanzu)

### Advanced features

- [Configure alerts](#configure-alerts-and-notifications)
- [Resource optimization](#configure-resource-optimization)
- [Multi-cluster policies](#configure-multi-cluster-policies)

> [!TIP]
> Start with [runtime protection](#configure-runtime-protection) and [distribution-specific](#configure-for-specific-distributions) settings for your environment.

## Configure runtime protection

### Exclude namespaces from monitoring

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-config
  namespace: mdc
data:
  excludedNamespaces: |
    - kube-system
    - kube-public
    - azure-arc
    - mdc
```

Apply the configuration:

```bash
kubectl apply -f defender-config.yaml
kubectl rollout restart deployment/microsoft-defender-controller -n mdc
```

### Configure monitoring scope

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-scope
  namespace: mdc
data:
  monitoringScope: |
    includeNamespaces:
      - production
      - staging
    excludeLabels:
      - monitoring: disabled
      - defender: exclude
```

## Configure for specific distributions

### Rancher-specific configuration

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-rancher
  namespace: mdc
data:
  rancherConfig: |
    monitorCattleSystem: false
    excludeRancherNamespaces: true
    customAuditPath: /var/log/rancher/audit.log
```

### Configure for VMware Tanzu

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-tanzu
  namespace: mdc
data:
  tanzuConfig: |
    enablePSP: true
    monitorSystemNamespaces: false
    customLogPath: /var/log/kubernetes/audit.log
```

## Configure vulnerability scanning

### Set up private registry scanning

```bash
# Create registry credentials
kubectl create secret docker-registry registry-creds \
    --docker-server=<registry-url> \
    --docker-username=<username> \
    --docker-password=<password> \
    --namespace=mdc

# Update Defender configuration
kubectl patch configmap microsoft-defender-config -n mdc --type merge -p '
{
  "data": {
    "registryCredentials": "registry-creds"
  }
}'
```

### Configure scan frequency

```azurecli
# Update extension configuration
az k8s-extension update \
    --name microsoft.azuredefender.kubernetes \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --configuration-settings \
        scanFrequency=24h \
        scanOnPush=true
```

### Air-gapped registry configuration

For disconnected environments:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-airgap
  namespace: mdc
data:
  airgapConfig: |
    localRegistry: "internal-registry.company.com"
    skipTLSVerify: false
    caCertificate: |
      -----BEGIN CERTIFICATE-----
      [Your CA Certificate]
      -----END CERTIFICATE-----
```

## Configure security policies

### Apply custom policies

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-policies
  namespace: mdc
data:
  customPolicies: |
    - name: "block-privileged-pods"
      enabled: true
      enforcement: "deny"
    - name: "require-resource-limits"
      enabled: true
      enforcement: "audit"
    - name: "restrict-host-network"
      enabled: true
      enforcement: "deny"
```

### Configure CIS benchmark settings

```bash
# Enable specific CIS controls
az k8s-extension update \
    --name microsoft.azuredefender.kubernetes \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --configuration-settings \
        cisControls="1.1.1,1.2.1,2.1.1,3.1.1,4.1.1"
```

## Configure alerts and notifications

### Set up alert rules

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-alerts-config
  namespace: mdc
data:
  alertRules: |
    - name: "high-severity-only"
      severity: ["High", "Critical"]
      enabled: true
      notification:
        email: security-team@company.com
        webhook: https://webhook.company.com/defender
    - name: "privilege-escalation"
      categories: ["PrivilegeEscalation", "DefenseEvasion"]
      enabled: true
      notification:
        teams: true
```

### Configure webhook notifications

```bash
# Set webhook URL
kubectl create secret generic webhook-config \
    --from-literal=url=https://webhook.company.com/defender \
    --from-literal=token=<webhook-token> \
    -n mdc
```

## Configure resource optimization

### Adjust resource limits

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-resources
  namespace: mdc
data:
  resourceLimits: |
    sensor:
      memory: "512Mi"
      cpu: "200m"
    collector:
      memory: "256Mi"
      cpu: "100m"
```

### Configure node affinity

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: microsoft-defender-sensor
  namespace: mdc
spec:
  template:
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/worker
                operator: Exists
              - key: kubernetes.io/os
                operator: In
                values:
                - linux
```

### Edge deployment optimization

For resource-constrained edge environments:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-edge-config
  namespace: mdc
data:
  edgeOptimization: |
    reducedTelemetry: true
    localProcessing: true
    batchSize: 100
    flushInterval: 300s
```

## Configure multi-cluster policies

For organizations with multiple Arc clusters:

```azurecli
# Apply policy initiative to resource group
az policy assignment create \
    --name "DefenderForContainersArc" \
    --scope "/subscriptions/<sub-id>/resourceGroups/<rg-name>" \
    --policy-set-definition "/providers/Microsoft.Authorization/policySetDefinitions/[defender-arc-initiative-id]" \
    --params '{
        "logAnalyticsWorkspace": {"value": "<workspace-id>"},
        "excludedNamespaces": {"value": ["kube-system", "azure-arc"]},
        "enableAutoProvisioning": {"value": true}
    }'
```

## Configure compliance scanning

### Enable specific compliance standards

```bash
# Configure compliance standards
az k8s-extension update \
    --name microsoft.azuredefender.kubernetes \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --configuration-settings \
        complianceStandards="CIS,PCI-DSS,NIST" \
        complianceScanInterval="12h"
```

### Custom compliance rules

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-compliance-custom
  namespace: mdc
data:
  customRules: |
    - id: "CUSTOM-001"
      name: "Ensure custom labels"
      description: "All pods must have company labels"
      query: |
        .metadata.labels."company.com/team" != null and
        .metadata.labels."company.com/env" != null
```

## Configure for specific scenarios

### High-security environments

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-high-security
  namespace: mdc
data:
  securityConfig: |
    enforceNetworkPolicies: true
    blockPrivilegedContainers: true
    requireSignedImages: true
    enableAuditAllActions: true
```

### Development environments

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-dev-config
  namespace: mdc
data:
  devConfig: |
    reducedAlerts: true
    excludeTestNamespaces: true
    suppressInfoAlerts: true
```

## Monitor configuration changes

```kusto
// Query configuration changes
ConfigurationChange
| where Computer contains "<cluster-name>"
| where ConfigChangeType == "Files" or ConfigChangeType == "Software"
| where TimeGenerated > ago(24h)
| project TimeGenerated, Computer, ConfigChangeType, FieldsChanged
| order by TimeGenerated desc
```

## Troubleshooting configuration

If configuration changes aren't taking effect:

1. Verify ConfigMap is applied:

   ```bash
   kubectl get configmap -n mdc microsoft-defender-config -o yaml
   ```

1. Restart Defender components:

   ```bash
   kubectl rollout restart deployment -n mdc
   ```

1. Check logs for configuration errors:

   ```bash
   kubectl logs -n mdc deployment/microsoft-defender-controller | grep -i config
   ```

## Related content

- [Verify your configuration](defender-for-containers-arc-verify.md)
- [Remove Defender for Containers](defender-for-containers-arc-remove.md)
