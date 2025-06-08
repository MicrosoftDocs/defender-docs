---
title: Configure Defender for Containers on Azure (AKS)
description: Learn how to configure advanced settings for Microsoft Defender for Containers on AKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on Azure (AKS)

This article explains how to configure advanced settings for Defender for Containers on your AKS clusters.

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

## Next steps

- [Verify your configuration](defender-for-containers-azure-verify.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
