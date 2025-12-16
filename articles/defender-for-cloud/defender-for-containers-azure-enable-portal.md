---
title: Enable Defender for Containers on AKS via portal
description: Learn how to enable Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Enable Defender for Containers on AKS via portal

This article shows you how to enable Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters through the Azure portal. You can choose to enable all security features at once for comprehensive protection, or selectively deploy specific components based on your requirements.

## When to use this guide

Use this guide if you want to:

- Set up Defender for Containers on Azure for the first time
- Enable all security features for comprehensive protection
- Selectively deploy specific components
- Fix or add missing components to an existing deployment
- Exclude certain clusters from protection

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

## Enable Defender for Containers plan

First, enable the Defender for Containers plan on your subscription:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. In the left menu, select **Environment settings**.

1. Select the subscription where your AKS clusters are located.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

   :::image type="content" source="media/tutorial-enable-containers-azure/containers-enabled-aks.png" alt-text="Screenshot showing the Containers plan toggle switch on the Defender plans page." lightbox="media/tutorial-enable-containers-azure/containers-enabled-aks.png":::

## Configure plan components

After you enable the plan, review and configure the components. By default, all components are enabled when you turn on the Defender for Containers plan.

1. Select **Settings** in the Containers plan row.

1. In **Settings**, you see all available components.

1. Review the components that are enabled by default:
   - **Agentless scanning for machines** - Scans your machines for installed software, vulnerabilities, and secret scanning without relying on agents or impacting machine performance
   - **Defender sensor** - Deployed on each worker node, collects security related data, required for runtime threat protection
   - **Azure Policy** - Deployed as an agent on your Kubernetes cluster. Provides Kubernetes data plane hardening
   - **Kubernetes API access** - Required for agentless container posture, runtime vulnerability assessment and response actions
   - **Registry access** - Enables agentless vulnerability assessment for registry images

    :::image type="content" source="media/defender-for-containers-enable-plan-aks/containers-settings-aks.png" alt-text="Screenshot that shows Defender for Containers components enabled by default." lightbox="media/defender-for-containers-enable-plan-aks/containers-settings-aks.png":::

1. You can:
   - Keep all components enabled (recommended for comprehensive protection)
   - Disable specific components you don't need
   - Re-enable components if you previously disabled them

1. Select **Continue**.

1. Review the monitoring coverage page to see what resources are protected.

1. Select **Continue**.

1. Review the configuration summary and select **Save**.

### Roles and permissions

Learn more about the [roles for provisioning Defender for Containers extensions](permissions.md#roles-used-to-automatically-configure-agents-and-extensions).

## Monitor deployment progress

After you save your changes, Defender for Cloud automatically starts deploying the selected components to your AKS clusters:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Filter recommendations by **Resource type** = **Kubernetes services**.

1. Look for these key recommendations:
   - "Azure Kubernetes Service clusters should have Defender profile enabled"
   - "Azure Policy for Kubernetes should be installed and enabled on your clusters"

1. Select each recommendation to see the affected resources and remediation progress.

## Deploy the Defender sensor

[!INCLUDE [Install with Helm note](./includes/helm-install-note.md)]

When you enable the Defender sensor setting, it automatically deploys to all AKS clusters in your subscription. If you disable automatic deployment, you can manually deploy the sensor by using the following methods:

### Deploy to a group of selected AKS clusters

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select "Azure Kubernetes Service clusters should have Defender profile enabled".

   :::image type="content" source="media/tutorial-enable-containers-azure/recommendation-search.png" alt-text="Screenshot showing the recommendations page with the Azure Kubernetes Service cluster recommendation highlighted in the search results." lightbox="media/tutorial-enable-containers-azure/recommendation-search.png":::

1. Select the AKS clusters that need the sensor.

1. Select **Fix**.

    :::image type="content" source="media/tutorial-enable-containers-azure/affected-fix.png" alt-text="Screenshot of the recommendation with the affected resources selected that shows you how to select the fix button." lightbox="media/tutorial-enable-containers-azure/affected-fix.png":::

1. Review the deployment configuration.

1. Select **Fix X resources** to deploy.

> [!NOTE]
> You can also deploy the Defender sensor by using Helm for more control over the deployment configuration. For Helm deployment instructions, see [Deploy the Defender sensor using Helm](defender-for-containers-azure-enable-programmatically.md#deploy-the-defender-sensor).

### Deploy to a specific AKS cluster

To deploy the Defender sensor to specific AKS clusters:

1. Go to your AKS cluster in the Azure portal.

1. In the left menu under the cluster name, select **Microsoft Defender for Cloud**.

1. On the Microsoft Defender for Cloud page for your cluster, select **Settings** in the top row, locate the **Defender sensor** row, and toggle it to **On**.

   :::image type="content" source="media/defender-for-containers-enable-plan-aks/defender-sensor-on.png" alt-text="Screenshot of Defender sensor toggled to on." lightbox="media/defender-for-containers-enable-plan-aks/defender-sensor-on.png":::

1. Select **Save**.

### Exclude specific clusters (optional)

You can exclude specific AKS clusters from automatic provisioning by applying tags:

1. Go to your AKS cluster.

1. Under **Overview**, select **Tags**.

1. Add one of these tags:
   - For Defender sensor: `ms_defender_container_exclude_sensors` = `true`
   - For Azure Policy: `ms_defender_container_exclude_azurepolicy` = `true`

## Monitor ongoing security

After setup, regularly:

1. **Manage vulnerabilities** - Review findings of container image vulnerability scans
1. **Review recommendations** - Address security issues identified for your AKS clusters
1. **Investigate alerts** - Respond to runtime threats detected by the Defender sensor
1. **Track compliance** - Monitor adherence to security standards and benchmarks

## Clean up resources

To disable Defender for Containers and remove all deployed components from your AKS clusters, see [Remove Defender for Containers from Azure (AKS)](defender-for-containers-azure-remove.md).

## Next steps

- [Verify deployment](defender-for-containers-azure-verify.md)
- [Configure advanced settings for Defender for Containers](defender-for-containers-azure-configure.md)
- [Investigate and respond to runtime security alerts](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters)
- [Review and remediate vulnerability findings](view-and-remediate-vulnerabilities-containers.md)

