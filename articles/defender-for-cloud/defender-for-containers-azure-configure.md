---
title: Configure Defender for Containers on Azure (AKS)
description: Learn how to configure advanced settings for Microsoft Defender for Containers on AKS clusters, including how to add or remove components after initial deployment.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Configure Defender for Containers on Azure (AKS)

This article explains how to configure advanced settings for Defender for Containers on your AKS clusters. It also covers how to add or remove components after initial deployment.

## Configure plan components

You can enable or disable specific Defender for Containers components:

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your Azure subscription.

1. Select **Settings** for the Containers plan.

1. Turn components on or off:
   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

    :::image type="content" source="media/defender-for-containers-enable-plan-aks/containers-settings-aks.png" alt-text="Screenshot that shows turning on components for AKS." lightbox="media/defender-for-containers-enable-plan-aks/containers-settings-aks.png":::

1. Select **Continue** and **Save**.

## Add or remove components

After initial deployment, you might need to add components that you skipped or remove unnecessary ones.

### Deploy Defender sensor to existing clusters

If the Defender sensor wasn't deployed initially:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Azure Kubernetes Service clusters should have Defender profile enabled".

1. Select the clusters missing the sensor.

1. Select **Fix** to deploy.

Or use Azure CLI:

```azurecli
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --enable-defender
```

### Add Azure Policy extension

To add policy assessment to existing deployments:

```azurecli
az aks enable-addons \
    --addons azure-policy \
    --name <cluster-name> \
    --resource-group <resource-group>
```

### Remove Defender sensor

To remove the Defender sensor while keeping other components:

```azurecli
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --disable-defender
```

### Remove Policy add-on

To remove the Azure Policy add-on:

```azurecli
az aks disable-addons \
    --addons azure-policy \
    --name <cluster-name> \
    --resource-group <resource-group>
```

## Best practices

1. **Regular reviews**: Review configuration monthly.
1. **Test changes**: Test configuration changes in non-production first.
1. **Document settings**: Maintain documentation of custom configurations.
1. **Monitor impact**: Watch for performance impact after changes.
1. **Track exclusions**: Document why certain clusters or components are excluded.

## Related content

- [Verify your configuration](defender-for-containers-azure-verify.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
