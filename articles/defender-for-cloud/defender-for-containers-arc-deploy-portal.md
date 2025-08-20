---
title: Deploy specific Defender for Containers components on Arc-enabled Kubernetes via portal
description: Learn how to deploy individual Microsoft Defender for Containers components on Arc-enabled Kubernetes clusters when you already have the plan enabled.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy specific Defender for Containers components on Arc-enabled Kubernetes clusters via the portal

This article explains how to deploy specific Defender for Containers components on your Arc-enabled Kubernetes clusters when you already enabled the plan but need to add or fix individual components.

## When to use this guide

Use this guide if you:

- Already enabled Defender for Containers but some components are missing
- Want to deploy to specific Arc-enabled clusters only
- Need to troubleshoot failed component deployments
- Have different security requirements for different clusters
- Want to exclude certain clusters from protection

If you're setting up Defender for Containers for the first time, see [Enable all Defender for Containers components on Arc-enabled Kubernetes](defender-for-containers-arc-enable-all-portal.md).

## Prerequisites

- Defender for Containers plan already enabled on your subscription
- Kubernetes clusters already connected to Azure Arc
- Appropriate Azure RBAC permissions
- Network connectivity from clusters to Azure

## Check component status

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your subscription.
1. Under **Defender plans**, verify **Containers** shows as **On**.
1. Check Arc clusters:
   - Go to **Inventory** > **Containers**
   - Filter by **Environment: Azure Arc**
   - Review protection status for each cluster

## Deploy missing components

### Deploy Defender extension to specific clusters

1. Go to **Recommendations**.
1. Search for "Arc-enabled Kubernetes clusters should have Microsoft Defender's extension installed".
1. Select the recommendation.
1. Filter and select specific clusters:
   - By name
   - By resource group
   - By tags
   - By distribution (Tanzu, Rancher, etc.)
1. Select **Fix**.

### Deploy the Defender sensor

The Defender sensor is essential for runtime threat detection. Deploy it to all or specific clusters:

#### Deploy to specific Arc-enabled clusters

1. Go to **Recommendations**.
1. Search for "Arc-enabled Kubernetes clusters should have Microsoft Defender's extension installed".
1. Select the recommendation.
1. Filter and select specific clusters:
   - By name
   - By resource group
   - By tags
   - By distribution (Tanzu, Rancher, etc.)
1. Select **Fix**.

#### Deploy via Arc portal

1. Navigate to your Arc-enabled Kubernetes cluster.
1. Select **Extensions** under **Settings**.
1. Select **+ Add**.
1. Search for "Microsoft Defender".
1. Configure:
   - Log Analytics workspace
   - Audit log path (distribution-specific)
   - Registry credentials (if needed)
1. Select **Create**.

#### Verify sensor deployment

```bash
# Check pods
kubectl get pods -n mdc

# Check DaemonSet
kubectl get daemonset -n mdc

# View logs
kubectl logs -n mdc -l app=microsoft-defender
```

### Deploy Azure Policy extension (Optional)

For clusters requiring policy enforcement, use the following steps:

1. Go to the Arc-enabled Kubernetes cluster.
1. Select **Extensions** under **Settings**.
1. Select **+ Add**.
1. Search for "Azure Policy".
1. Configure and install the extension.

### Manual extension deployment

For specific configurations, use the following steps:

1. Go to your Arc-enabled cluster.
1. Select **Extensions** > **+ Add**.
1. Select **Microsoft Defender**.
1. Configure the settings:
   - Log Analytics workspace
   - Audit log path (distribution-specific)
   - Registry credentials (if needed)
1. Select **Create**.

## Configure by cluster distribution

### Rancher clusters

For Rancher RKE and RKE2 clusters:

1. Configure the audit log path:
   - RKE: `/var/log/kubernetes/audit.log`
   - RKE2: `/var/log/kube-audit/audit.log`

### VMware Tanzu

For Tanzu clusters:

1. Ensure audit logging is enabled.
1. Set appropriate PSP or PSA policies.
1. Configure network policies if required.

## Deploy by environment type

### On-premises clusters

Consider the following items:

1. **Private registries**: Configure authentication.

   ```bash
   kubectl create secret docker-registry regcred \
     --namespace mdc \
     --docker-server=<registry> \
     --docker-username=<username> \
     --docker-password=<password>
   ```

1. **Proxy configuration**: If using proxy.
1. **Air-gapped**: Use local image repository.

### Edge locations

For edge computing scenarios:

1. Consider bandwidth limitations
2. Configure appropriate resource limits
3. Set up local log aggregation

## Configure exclusions

### Exclude specific clusters

1. **By tags**:
   - Add tag `DefenderExclude: True` to Arc cluster

2. **By configuration**:
   - Don't deploy extension to specific clusters

3. **Namespace exclusion**:

   ```yaml
   apiVersion: v1
   kind: Namespace
   metadata:
     name: development
     annotations:
       microsoft.defender.exclude: "true"
   ```

### Exclude workloads

Configure scan exclusions:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-config
  namespace: mdc
data:
  excludeNamespaces: "kube-system,kube-public,development"
  excludeImages: "*/debug:*,*/test:*"
```

## Verify deployment

### Check extension status

1. In Azure portal:
   - Go to Arc-enabled cluster
   - Select **Extensions**
   - Verify "Microsoft Defender" shows as **Installed**

1. With Azure CLI:

   ```azurecli
   az k8s-extension show \
     --name microsoft.azuredefender.kubernetes \
     --cluster-type connectedClusters \
     --cluster-name <cluster-name> \
     --resource-group <resource-group>
   ```

### Verify on cluster

```bash
# Check pods
kubectl get pods -n mdc

# Check logs
kubectl logs -n mdc -l app=microsoft-defender

# Verify connectivity
kubectl exec -n mdc deploy/microsoft-defender-publisher -- wget -O- https://login.microsoftonline.com
```

## Troubleshooting

### Extension installation fails

1. **Check Arc connectivity**:

   ```bash
   az connectedk8s show \
     --name <cluster-name> \
     --resource-group <resource-group>
   ```

1. **Review prerequisites**:
   - Supported Kubernetes version
   - Arc agents healthy
   - Network connectivity

### Extension unhealthy

1. Check pod status:

   ```bash
   kubectl describe pods -n mdc
   ```

1. Common issues:
   - **ImagePullBackOff**: Registry access issues
   - **CrashLoopBackOff**: Configuration problems
   - **Pending**: Resource constraints

### No security alerts

1. Verify audit logs are accessible
1. Check log path configuration
1. Ensure proper RBAC permissions
1. Test with sample alert

## Advanced configuration

### Custom resource limits

```yaml
resources:
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 200m
    memory: 256Mi
```

### Multi-cluster deployment

To deploy to multiple clusters, use the following approaches:

1. Use Azure Policy for at-scale deployment.
1. Create custom initiatives.
1. Use tags for targeting.
1. Automate with scripts.

## Next steps

- [Verify deployment](defender-for-containers-arc-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-arc-configure.md)
- [Enable all components](defender-for-containers-arc-enable-all-portal.md) - For fresh installations
