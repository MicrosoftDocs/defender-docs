---
title: Configure Defender for Containers on Azure (AKS)
description: Learn how to configure advanced settings for Microsoft Defender for Containers on AKS clusters, including how to add or remove components after initial deployment.
ms.topic: how-to
ms.date: 06/04/2025
ai-usage: ai-assisted
---

# Configure Defender for Containers on Azure (AKS)

This article explains how to configure advanced settings for Defender for Containers on your AKS clusters. It also covers how to add or remove components after initial deployment.

## Configuration areas

Jump to the configuration you need:

### Component management

- [Add or remove components](#add-or-remove-components)
- [Deploy components selectively](#deploy-components-selectively)

### Core settings

- [Configure runtime protection](#configure-runtime-protection)

### Optimization

- [Configure compliance scanning](#configure-compliance-scanning)
- [Performance optimization](#performance-optimization)

> [!TIP]
> Most organizations start with [configuring runtime protection](#configure-runtime-protection) and [vulnerability scanning](#configure-vulnerability-scanning). If you need to add or remove components after initial deployment, see [Add or remove components](#add-or-remove-components).

## Add or remove components

After initial deployment, you might need to add components that you skipped or remove unnecessary ones.

### Check component deployment status

1. Go to **Inventory** > filter by AKS resources.

1. Check each AKS cluster for:
   - Defender sensor status
   - Policy extension status

### Add missing components

#### Deploy Defender sensor to existing clusters

If the Defender sensor wasn't deployed initially, follow these steps:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Azure Kubernetes Service clusters should have Defender profile enabled".

1. Select the clusters missing the sensor.

1. Select **Fix** to deploy.

Or use Azure CLI:

```azurecli
# Enable Defender profile
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --enable-defender
```

Or use Helm for more control:

```bash
# Add Defender Helm repository
helm repo add mdc https://azuredefender.azurecr.io/helm/v1/repo
helm repo update

# Install Defender sensor
helm install defender-sensor mdc/azuredefender \
    --namespace kube-system \
    --set cluster.name=<cluster-name>
```

For detailed Helm configuration options, see [Deploy Defender sensor using Helm](deploy-helm.md).

#### Add Azure Policy extension

To add policy assessment to existing deployments, follow these steps:

1. Go to **Azure Policy**.

1. Search for "Configure Azure Policy extension on Azure Kubernetes Service clusters".

1. Create an assignment for your AKS clusters.

Or use CLI:

```azurecli
# Install Azure Policy add-on
az aks enable-addons \
    --addons azure-policy \
    --name <cluster-name> \
    --resource-group <resource-group>
```

### Remove specific components

To remove components while keeping others:

#### Remove Defender sensor only

```azurecli
# Disable Defender profile
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --disable-defender
```

#### Remove Policy add-on only

```azurecli
# Disable Azure Policy add-on
az aks disable-addons \
    --addons azure-policy \
    --name <cluster-name> \
    --resource-group <resource-group>
```

## Deploy components selectively

### Deploy to specific clusters only

To deploy the sensor only to selected AKS clusters:

1. Go to **Recommendations** and find "Azure Kubernetes Service clusters should have Defender profile enabled".

1. Select only the clusters where you want the sensor.

1. Follow the remediation steps for selected clusters only.

### Deploy Azure Policy extension selectively

To deploy policy assessment only to specific clusters:

1. Go to **Policy** > **Definitions**.

1. Search for "Configure Azure Policy extension on Azure Kubernetes Service clusters".

1. Create an assignment scoped to specific resource groups or clusters.

## Configure runtime protection

### Enable or disable plan components

You can enable or disable specific Defender for Containers components:

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. Select **Settings** for the Containers plan.

1. Turn components on or off:
   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Runtime threat protection**

1. Select **Continue** and **Save**.

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

1. Go to **Azure Policy** > **Definitions**.
1. Search for "Configure Defender for Containers".
1. Create an assignment with your preferred settings.

## Configure compliance scanning

### Enable CIS benchmark scanning

1. Go to **Microsoft Defender for Cloud** > **Regulatory compliance**.
1. Add the **CIS Kubernetes Benchmark** standard.
1. Set the assessment frequency.

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

### Optimize for large clusters

For clusters with more than 100 nodes:

1. Increase Defender sensor resources
1. Configure pod priority classes
1. Use node selectors for dedicated security nodes
1. Implement resource quotas

## Troubleshooting component issues

### Fix sensor deployment issues

For clusters missing the Defender sensor:

1. Verify the cluster is healthy.

1. Check for conflicting policies or admission controllers.

1. Deploy the sensor manually if needed by using the recommendation remediation.

### Sensor pods not starting

```bash
# Check pod status
kubectl describe pods -n kube-system -l app=microsoft-defender

# Common issues:
# - Image pull errors: Check network connectivity
# - Permission denied: Verify RBAC settings
# - Resource constraints: Check node resources
```

### Policy add-on issues

```bash
# Check Azure Policy pods
kubectl get pods -n kube-system -l app=azure-policy

# If pods are failing, check logs
kubectl logs -n kube-system -l app=azure-policy
```

## Best practices

1. **Regular reviews**: Review configuration monthly.
1. **Test changes**: Test configuration changes in non-production first.
1. **Document settings**: Maintain documentation of custom configurations.
1. **Monitor impact**: Watch for performance impact after changes.
1. **Backup settings**: Export configurations before major changes.
1. **Track exclusions**: Document why certain clusters or components are excluded.

## Related content

- [Verify your configuration](defender-for-containers-azure-verify.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
- [Deploy sensor using Helm](deploy-helm.md)
