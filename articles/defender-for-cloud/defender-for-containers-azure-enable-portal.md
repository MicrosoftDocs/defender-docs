---
title: Enable Defender for Containers on AKS via portal
description: Learn how to enable Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 06/04/2025
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

1. On the Defender plans page, find the **Containers** row and toggle the Status to **On**.

    :::image type="content" source="media/tutorial-enable-containers-azure/containers-enabled-aks.png" alt-text="Screenshot of the Defender plans page that shows where to toggle the containers plan switch to on is located." lightbox="media/tutorial-enable-containers-azure/containers-enabled-aks.png":::

## Configure plan components

After enabling the plan, configure which components to enable:

1. Select **Settings** in the Containers plan row.

1. In the Settings page, you see all available components.

1. Turn on all components:
   - **Agentless discovery for Kubernetes** - Provides visibility into your Kubernetes clusters
   - **Agentless container vulnerability assessment** - Scans container images for vulnerabilities
   - **Defender DaemonSet** - Provides runtime threat detection
   - **Azure Policy for Kubernetes** - Enables security recommendations and compliance

    :::image type="content" source="media/defender-for-containers-enable-plan-aks/containers-settings-aks.png" alt-text="Screenshot that shows turning on Defender for Containers components." lightbox="media/defender-for-containers-enable-plan-aks/containers-settings-aks.png":::

1. Select **Continue**.

## Review and save settings

1. Review the monitoring coverage page to see what resources are protected.

1. Review the components that you enable:
   - Container vulnerability assessments
   - Kubernetes runtime protection
   - Discovery of unprotected clusters
   - Security posture management

1. Select **Continue**.

1. Review the configuration summary and select **Save**.

## Monitor deployment progress

After saving, Defender for Cloud automatically begins deploying the necessary components to your AKS clusters:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Filter recommendations by **Resource type** = **Kubernetes services**.

1. Look for these key recommendations:
   - "Azure Kubernetes Service clusters should have Defender profile enabled"
   - "Azure Policy for Kubernetes should be installed and enabled on your clusters"

1. Select each recommendation to see the affected resources and remediation progress.

## Deploy the Defender sensor

The Defender sensor provides runtime threat detection for your AKS clusters. If the sensor isn't automatically deployed after you enable the plan, manually trigger the deployment:

### Deploy to all AKS clusters

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select "Azure Kubernetes Service clusters should have Defender profile enabled".

    :::image type="content" source="media/tutorial-enable-containers-azure/recommendation-search.png" alt-text="Screenshot of the recommendations page that shows where to search for and find the Azure Kubernetes service cluster recommendation is located." lightbox="media/tutorial-enable-containers-azure/recommendation-search.png":::

1. Select all AKS clusters that need the sensor.

1. Select **Fix**.

    :::image type="content" source="media/tutorial-enable-containers-azure/affected-fix.png" alt-text="Screenshot of the recommendation with the affected resources selected that shows you how to select the fix button." lightbox="media/tutorial-enable-containers-azure/affected-fix.png":::

1. Review the deployment configuration.

1. Select **Fix X resources** to deploy.

> [!NOTE]
> You can also deploy the Defender sensor using Helm for more control over the deployment configuration. For Helm deployment instructions, see [Deploy the Defender sensor using Helm](defender-for-containers-azure-enable-programmatically.md#deploy-the-defender-sensor).

### Deploy to specific clusters

1. Go to your AKS cluster.

1. Under **Settings**, select **Defender**.

1. Select **Enable Microsoft Defender for Containers**.

1. Configure the settings:
   - Enable runtime protection
   - Configure resource limits
   - Set namespace exclusions

1. Select **Save**.

## Deploy specific components (optional)

If you need to deploy only specific components instead of all components:

### Deploy Azure Policy for Kubernetes only

To enable only the Azure Policy add-on for security recommendations without runtime protection:

1. Go to your AKS cluster in the Azure portal.

1. Under **Settings**, select **Policies**.

1. Select **Enable Azure Policy**.

1. Wait for the policy add-on to install (typically 5-10 minutes).

### Enable vulnerability scanning only

To enable only vulnerability scanning without runtime protection:

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. In the Containers plan row, select **Settings**.

1. Enable only **Agentless container vulnerability assessment**.

1. Disable other components.

1. Select **Continue** and then **Save**.

## Enable diagnostic logs (recommended)

For the best runtime protection, enable diagnostic logs:

1. Go to your AKS cluster.

1. Under **Monitoring**, select **Diagnostic settings**.

1. Select **+ Add diagnostic setting**.

1. Configure the following settings:
   - Name: Enter a descriptive name
   - Select these log categories:
     - kube-apiserver
     - kube-audit
     - kube-controller-manager
     - kube-scheduler
     - guard
   - Destination: Send to Log Analytics workspace

1. Select **Save**.

## Configure custom workspace (optional)

By default, Defender for Containers uses a default Log Analytics workspace. To use a custom workspace:

1. Go to **Azure Policy**.

1. Search for "Configure Microsoft Defender for Containers to use a custom workspace".

1. Assign this policy to your subscription or resource group.

1. Enter your custom workspace ID in the policy parameters.

## Exclude specific clusters (optional)

You can exclude specific AKS clusters from automatic provisioning by applying tags:

1. Go to your AKS cluster.

1. Under **Overview**, select **Tags**.

1. Add one of these tags:
   - For Defender sensor: `ms_defender_container_exclude_sensors` = `true`
   - For Azure Policy: `ms_defender_container_exclude_azurepolicy` = `true`

## Monitor ongoing security

After setup, regularly:

1. **Review recommendations** - Address security issues identified for your AKS clusters
1. **Investigate alerts** - Respond to runtime threats detected by the Defender sensor
1. **Track compliance** - Monitor adherence to security standards and benchmarks
1. **Scan images** - Review vulnerability findings for container images

## Best practices

1. **Enable all components** - Get comprehensive protection by enabling all available features
1. **Regular monitoring** - Check the Containers dashboard weekly for new findings
1. **Automated remediation** - Use Azure Policy to enforce security configurations
1. **Image hygiene** - Regularly update base images and remove vulnerable packages
1. **Network segmentation** - Implement network policies to limit container communication

## Clean up resources

If you want to disable Defender for Containers, follow these steps:

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. Turn the **Containers** plan **Off**.

1. Select **Save**.

This process stops new security assessments and removes the Defender components from your clusters.

## Next steps

- [Verify deployment](defender-for-containers-azure-verify.md)
- [Configure advanced settings for Defender for Containers](defender-for-containers-azure-configure.md)
- [Investigate and respond to runtime security alerts](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters)
- [Review and remediate vulnerability findings](defender-for-containers-vulnerability-assessment-azure.md)
- [Deploy using programmatic methods](defender-for-containers-azure-enable-programmatically.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
