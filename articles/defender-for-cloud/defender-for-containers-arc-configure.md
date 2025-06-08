---
title: Configure Defender for Containers on Arc-enabled Kubernetes
description: Learn how to configure advanced settings for Microsoft Defender for Containers on Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on Arc-enabled Kubernetes

This article explains how to configure advanced settings for Defender for Containers on your Arc-enabled Kubernetes clusters.

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

### OpenShift-specific configuration

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-openshift
  namespace: mdc
data:
  openshiftConfig: |
    enableSCC: true
    auditLogPath: /var/log/openshift-apiserver/audit.log
    monitorOperators: true
    excludeSystemNamespaces: true
```

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
    --name microsoft-defender \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --configuration-settings \
        scanFrequency=24h \
        scanOnPush=true
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
    --name microsoft-defender \
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
    --name microsoft-defender \
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

## Troubleshooting

If you encounter issues:

1. Check the [support matrix](support-matrix-defender-for-containers.md) for compatibility.

1. Review extension logs:

   ```bash
   kubectl logs -n azure-arc deployment/azure-arc-controllers
   ```

1. Verify cluster connectivity to Azure endpoints.

1. Consult the [general troubleshooting guide](/azure/defender-for-cloud/troubleshooting-guide).

## Next steps

- [Verify your configuration](defender-for-containers-arc-verify.md)
- [Remove Defender for Containers](defender-for-containers-arc-remove.md)
