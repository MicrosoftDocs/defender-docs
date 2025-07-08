---
title: Enable all Defender for Containers components on AKS via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Azure Kubernetes Service (AKS) clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on AKS via portal

This article walks you through enabling all Microsoft Defender for Containers components on your Azure Kubernetes Service (AKS) clusters using the Azure portal. This comprehensive approach ensures you get full protection including vulnerability scanning, runtime threat detection, and security posture management.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

## Sign in to Azure

Sign in to the [Azure portal](https://portal.azure.com).

## Enable Defender for Containers plan

The first step is to enable the Defender for Containers plan on your subscription:

1. Navigate to **Microsoft Defender for Cloud**.

1. In the left menu, select **Environment settings**.

1. Select the subscription where your AKS clusters are located.

1. On the Defender plans page, locate the **Containers** row and toggle the Status to **On**.

    :::image type="content" source="media/tutorial-enable-containers-azure/containers-enabled-aks.png" alt-text="Screenshot of the Defender plans page that shows where to toggle the containers plan switch to on is located." lightbox="media/tutorial-enable-containers-azure/containers-enabled-aks.png":::

## Configure plan components

After enabling the plan, configure which components to enable:

1. Select **Settings** in the Containers plan row.

1. In the Settings page, you'll see all available components.

1. Ensure all components are toggled **On**:
   - **Agentless discovery for Kubernetes** - Provides visibility into your Kubernetes clusters
   - **Agentless container vulnerability assessment** - Scans container images for vulnerabilities
   - **Defender DaemonSet** - Provides runtime threat detection
   - **Azure Policy for Kubernetes** - Enables security recommendations and compliance

    :::image type="content" source="media/defender-for-containers-enable-plan-aks/containers-settings-aks.png" alt-text="Screenshot that shows turning on Defender for Containers components." lightbox="media/defender-for-containers-enable-plan-aks/containers-settings-aks.png":::

1. Select **Continue**.

## Review and save settings

1. The monitoring coverage page shows what will be protected.

1. Review the components that will be enabled:
   - Container vulnerability assessments
   - Kubernetes runtime protection
   - Discovery of unprotected clusters
   - Security posture management

1. Select **Continue**.

1. Review the configuration summary and select **Save**.

## Monitor deployment progress

After saving, Defender for Cloud automatically begins deploying the necessary components to your AKS clusters:

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Filter recommendations by **Resource type** = **Kubernetes services**.

1. Look for these key recommendations:
   - "Azure Kubernetes Service clusters should have Defender profile enabled"
   - "Azure Policy for Kubernetes should be installed and enabled on your clusters"

1. Select each recommendation to see the affected resources and remediation progress.

## Deploy the Defender sensor

If the Defender sensor isn't automatically deployed, you can manually trigger deployment:

1. Navigate to the Recommendations page.

1. Search for and select the "Azure Kubernetes Service clusters should have Defender profile enabled" recommendation.

    :::image type="content" source="media/tutorial-enable-containers-azure/recommendation-search.png" alt-text="Screenshot of the recommendations page that shows where to search for and find the Azure Kubernetes service cluster recommendation is located." lightbox="media/tutorial-enable-containers-azure/recommendation-search.png":::

1. Select all of the relevant affected resources.

1. Select **Fix**.

    :::image type="content" source="media/tutorial-enable-containers-azure/affected-fix.png" alt-text="Screenshot of the recommendation with the affected resources selected that shows you how to select the fix button." lightbox="media/tutorial-enable-containers-azure/affected-fix.png":::

## Verify component deployment

### Check Defender sensor deployment

1. Navigate to your AKS cluster in the Azure portal.

1. Under **Settings**, select **Extensions + applications**.

1. Verify that **microsoft-defender** extension is installed and shows as **Succeeded**.

### Check Azure Policy deployment

1. In your AKS cluster, under **Settings**, select **Policies**.

1. Verify that Azure Policy is enabled for the cluster.

### Verify vulnerability scanning

1. Navigate to **Microsoft Defender for Cloud** > **Inventory**.

1. Filter by **Resource type** = **Container registries**.

1. Select a container registry to view vulnerability findings.

## View security insights

After deployment completes (typically within 30 minutes), you can start viewing security insights:

1. Navigate to **Microsoft Defender for Cloud** > **Workload protections**.

1. Select **Containers** to view the security dashboard.

1. From here you can:
   - View vulnerable container images
   - See runtime security alerts
   - Review cluster hardening recommendations
   - Track compliance with security standards

## Enable diagnostic logs (recommended)

For optimal runtime protection, enable diagnostic logs:

1. Navigate to your AKS cluster.

1. Under **Monitoring**, select **Diagnostic settings**.

1. Select **+ Add diagnostic setting**.

1. Configure the following:
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

1. Navigate to **Azure Policy**.

1. Search for "Configure Microsoft Defender for Containers to use a custom workspace".

1. Assign this policy to your subscription or resource group.

1. Configure the policy parameters with your custom workspace ID.

## Exclude specific clusters (optional)

You can exclude specific AKS clusters from automatic provisioning by applying tags:

1. Navigate to your AKS cluster.

1. Under **Overview**, select **Tags**.

1. Add one of these tags:
   - For Defender sensor: `ms_defender_container_exclude_sensors` = `true`
   - For Azure Policy: `ms_defender_container_exclude_azurepolicy` = `true`

## Monitor ongoing security

After setup, regularly:

1. **Review recommendations** - Address security issues identified for your AKS clusters
2. **Investigate alerts** - Respond to runtime threats detected by the Defender sensor
3. **Track compliance** - Monitor adherence to security standards and benchmarks
4. **Scan images** - Review vulnerability findings for container images

## Best practices

1. **Enable all components** - Get comprehensive protection by enabling all available features
2. **Regular monitoring** - Check the Containers dashboard weekly for new findings
3. **Automated remediation** - Use Azure Policy to enforce security configurations
4. **Image hygiene** - Regularly update base images and remove vulnerable packages
5. **Network segmentation** - Implement network policies to limit container communication

## Clean up resources

If you want to disable Defender for Containers:

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. Toggle the **Containers** plan to **Off**.

1. Select **Save**.

This will stop new security assessments and remove the Defender components from your clusters.

## Next steps

Now that you've enabled all Defender for Containers components:

- [Configure advanced settings for Defender for Containers](defender-for-containers-azure-configure.md)
- [Investigate and respond to runtime security alerts](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters)
- [Review and remediate vulnerability findings](defender-for-containers-vulnerability-assessment-azure.md)
