---
title: Configure Defender for Containers on Azure (AKS)
description: Learn how to configure advanced settings for Microsoft Defender for Containers on AKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on Azure (AKS)

This article explains how to configure advanced settings for Defender for Containers on your AKS clusters.

## Configuration areas

Jump to the configuration you need:

### Core settings

- [Configure runtime protection](#configure-runtime-protection)
- [Configure vulnerability scanning](#configure-vulnerability-scanning)
- [Configure security policies](#configure-security-policies)

### Advanced features

- [Configure alerts and notifications](#configure-alerts-and-notifications)
- [Configure data collection](#configure-data-collection)
- [Configure workload protection](#configure-workload-protection)

### Optimization

- [Configure compliance scanning](#configure-compliance-scanning)
- [Performance optimization](#performance-optimization)

> [!TIP]
> Most organizations start with [configuring runtime protection](#configure-runtime-protection) and [vulnerability scanning](#configure-vulnerability-scanning).

## Configure runtime protection

### Exclude namespaces from monitoring

To exclude specific namespaces from runtime monitoring:

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
    - azure-arc
```

Apply the configuration:

```bash
kubectl apply -f defender-config.yaml
```

### Adjust threat detection sensitivity

Configure detection sensitivity through Azure Policy:

1. Navigate to **Azure Policy** > **Definitions**.
2. Search for "Configure Defender for Containers".
3. Create an assignment with your preferred settings.

## Configure vulnerability scanning

### Set scanning frequency for ACR

1. Navigate to your Azure Container Registry.
2. Select **Security** > **Defender for Cloud**.
3. Configure scanning settings:
   - **Scan on push**: Enabled (recommended)
   - **Recurring scans**: Weekly (default) or Daily

### Configure scan exclusions

```azurecli
# Exclude specific repositories from scanning
az acr config content-trust update \
    --registry <registry-name> \
    --status disabled \
    --repository <repository-name>
```

### Set vulnerability thresholds

Configure which vulnerabilities trigger alerts:

```json
{
  "vulnerabilityThreshold": {
    "critical": "alert",
    "high": "alert",
    "medium": "warn",
    "low": "info"
  }
}
```

## Configure security policies

### Enable custom Azure Policy initiatives

1. Navigate to **Azure Policy** > **Definitions**.
2. Create a new initiative definition.
3. Add Kubernetes policies relevant to your security requirements.
4. Assign the initiative to your AKS clusters.

### Configure admission control

Enable admission control policies:

```azurecli
# Example: Block containers running as root
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --enable-pod-security-policy
```

### Implement pod security standards

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: production
  labels:
    pod-security.kubernetes.io/enforce: restricted
    pod-security.kubernetes.io/audit: restricted
    pod-security.kubernetes.io/warn: restricted
```

## Configure alerts and notifications

### Set up email notifications

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
2. Select your subscription.
3. Select **Email notifications**.
4. Configure:
   - Email recipients
   - Alert severity levels
   - Notification frequency

### Configure alert suppression rules

```azurecli
# Create a suppression rule
az security alert update \
    --name <alert-name> \
    --status Dismiss \
    --comment "Known false positive"
```

### Create custom alert rules

```kusto
// Custom query for suspicious container activity
ContainerLog
| where LogEntry contains "suspicious_pattern"
| summarize Count = count() by ContainerID, Computer
| where Count > 10
```

## Configure data collection

### Adjust log retention

1. Navigate to your Log Analytics workspace.
2. Select **Usage and estimated costs**.
3. Configure retention period (default: 30 days).

### Configure diagnostic settings

```azurecli
# Update diagnostic settings
az aks diagnostic-settings create \
    --name aks-diagnostics \
    --resource <cluster-resource-id> \
    --logs '[
        {"category": "kube-apiserver", "enabled": true},
        {"category": "kube-audit", "enabled": true},
        {"category": "guard", "enabled": true}
    ]' \
    --workspace <workspace-id>
```

### Configure data collection rules

```json
{
  "dataCollection": {
    "containerLogs": {
      "enabled": true,
      "namespaceFiltering": {
        "mode": "Include",
        "namespaces": ["default", "production"]
      }
    }
  }
}
```

## Configure workload protection

### Enable file integrity monitoring

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-fim-config
  namespace: kube-system
data:
  enabled: "true"
  paths: |
    - /etc
    - /bin
    - /sbin
    - /usr/bin
    - /usr/sbin
```

### Configure process monitoring

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-process-config
  namespace: kube-system
data:
  monitoredProcesses: |
    include:
      - "*"
    exclude:
      - "/usr/bin/kubectl"
      - "/usr/local/bin/helm"
```

### Set up adaptive application controls

1. Navigate to **Microsoft Defender for Cloud** > **Workload protections**.
2. Select **Adaptive application controls**.
3. Configure allowed applications per cluster.

## Configure compliance scanning

### Enable CIS benchmark scanning

1. Navigate to **Microsoft Defender for Cloud** > **Regulatory compliance**.
2. Add the **CIS Kubernetes Benchmark** standard.
3. Configure assessment frequency.

### Customize compliance policies

```azurecli
# Assign CIS Kubernetes Benchmark
az policy assignment create \
    --name "CIS-Kubernetes-Benchmark" \
    --policy-set-definition "/providers/Microsoft.Authorization/policySetDefinitions/[CIS-ID]" \
    --scope "/subscriptions/{subscription-id}/resourceGroups/{resource-group}"
```

### Configure compliance reporting

```powershell
# Export compliance data
$compliance = Get-AzSecurityCompliance
$compliance | Export-Csv -Path "compliance-report.csv"
```

## Performance optimization

### Adjust resource limits

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: microsoft-defender-collector-ds
  namespace: kube-system
spec:
  template:
    spec:
      containers:
      - name: microsoft-defender-collector
        resources:
          limits:
            memory: "500Mi"
            cpu: "200m"
          requests:
            memory: "200Mi"
            cpu: "100m"
```

### Configure node affinity

```yaml
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/os
            operator: In
            values:
            - linux
```

### Optimize for large clusters

For clusters with > 100 nodes:

1. Increase Defender sensor resources
2. Configure pod priority classes
3. Use node selectors for dedicated security nodes
4. Implement resource quotas

## Integration settings

### Microsoft Sentinel integration

```azurecli
# Enable Microsoft Sentinel integration
az security setting update \
    --name "MCAS" \
    --enabled true
```

### SIEM integration

Configure log forwarding to external SIEM:

1. Create Event Hub for streaming
2. Configure diagnostic settings to stream
3. Set up SIEM connector

## Next steps

- [Verify your configuration](defender-for-containers-azure-verify.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
