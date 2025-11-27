---
title: Configure Defender for Containers on AWS (EKS)
description: Learn how to configure and customize Microsoft Defender for Containers settings for your Amazon EKS clusters, including how to add or remove components after initial deployment.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Configure Defender for Containers on AWS

After deploying Defender for Containers on your EKS clusters, configure various settings to customize the security coverage to meet your needs. This article also explains how to add or remove components after initial deployment.

## Configuration areas

Jump to the configuration you need:

### Component management

- [Add or remove components](#add-or-remove-components)
- [Deploy components selectively](#deploy-components-selectively)

### Core settings

- [Enable or disable plan components](#configure-plan-components)

> [!TIP]
> Most organizations start with [configuring plan components](#configure-plan-components). If you need to add or remove components after initial deployment, see [Add or remove components](#add-or-remove-components).

## Add or remove components

After initial deployment, you might need to add components that you skipped or remove unnecessary ones.

### Check component deployment status

1. Go to **Inventory** and filter by AWS resources.

1. Check each EKS cluster for:
   - Arc connectivity status
   - Defender extension status
   - Policy extension status

### Add missing components

#### Connect EKS clusters to Azure Arc

If clusters aren't connected to Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about EKS clusters that need Arc connection.

1. Follow the recommendation to connect your clusters.

1. Use the provided scripts to connect each cluster to Azure Arc.

Or use CLI:

```azurecli
# Connect cluster to Arc
az connectedk8s connect \
    --name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $REGION
```

#### Deploy Defender sensor to existing clusters

After connecting your EKS clusters to Azure Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about installing the Defender extension on Arc-enabled clusters.

1. Select the recommendation and follow the remediation steps.

Or deploy using CLI:

```azurecli
# Install Defender extension
az k8s-extension create \
    --name microsoft-defender \
    --extension-type microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

Or use Helm (for more control):

```bash
# Add Defender Helm repository
helm repo add mdc https://azuredefender.azurecr.io/helm/v1/repo
helm repo update

# Install Defender sensor
helm install defender-sensor mdc/azuredefender \
    --namespace mdc \
    --create-namespace \
    --set cluster.name=$CLUSTER_NAME
```

See [Deploy Defender sensor using Helm](deploy-helm.md) for detailed Helm configuration options.

#### Add Azure Policy extension

To add policy assessment to existing deployments:

```azurecli
# Install Azure Policy extension
az k8s-extension create \
    --name azurepolicy \
    --extension-type Microsoft.PolicyInsights \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

### Remove specific components

To remove components but keep others:

1. Go to your Arc-enabled Kubernetes cluster.

1. Under **Settings**, select **Extensions**.

1. Select the extension to remove (Microsoft Defender or Azure Policy).

1. Select **Uninstall**.

Or use CLI:

```azurecli
# Remove Defender sensor only
az k8s-extension delete \
    --name microsoft-defender \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP

# Remove Policy extension only
az k8s-extension delete \
    --name azurepolicy \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

## Deploy components selectively

### Deploy to specific clusters only

To deploy the sensor only to selected EKS clusters:

1. Connect specific clusters to Azure Arc (not all clusters).

1. Go to **Recommendations** and find "Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select only the clusters where you want the sensor.

1. Follow the remediation steps for the selected clusters.

## Configure plan components

You can enable or disable specific Defender for Containers components:

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your AWS connector.

1. Select **Settings** for the Containers plan.

1. Turn components on or off:
   - **Defender sensor**
   - **Azure Policy for Kubernetes**
   - **K8s API access**
   - **Registry access**

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

1. Select **Continue** and **Save**.

## Troubleshooting component issues

### Fix Arc connectivity issues

For clusters that show as disconnected:

1. Rerun the Arc connection script.

1. Verify network connectivity from the cluster to Azure.

1. Check Arc agent logs: `kubectl logs -n azure-arc -l app.kubernetes.io/component=cluster-agent`

### Fix sensor deployment issues

For clusters missing the Defender sensor:

1. Verify Arc connection is healthy.

1. Check for conflicting policies or admission controllers.

1. Deploy manually if needed: Use remediation from the recommendation.

### Sensor pods not starting

```bash
# Check pod status
kubectl describe pods -n kube-system -l app=microsoft-defender

# Common issues:
# - Image pull errors: Check network connectivity
# - Permission denied: Verify RBAC settings
# - Resource constraints: Check node resources
```

## Best practices

1. **Regular reviews**: Review configuration monthly.
1. **Test changes**: Test configuration changes in non-production environments first.
1. **Document settings**: Maintain documentation of custom configurations.
1. **Monitor impact**: Watch for performance impact after changes.
1. **Backup settings**: Export configurations before major changes.
1. **Track exclusions**: Document why certain clusters or components are excluded.

## Related content

- [Verify your configuration](defender-for-containers-aws-verify.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md)
- [Deploy sensor using Helm](deploy-helm.md)
