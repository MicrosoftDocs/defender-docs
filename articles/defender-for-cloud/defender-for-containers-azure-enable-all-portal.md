---
title: Enable all Defender for Containers components on AKS via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Azure Kubernetes Service (AKS) clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on AKS via portal

This article walks you through enabling all Microsoft Defender for Containers components on your Azure Kubernetes Service (AKS) clusters using the Azure portal. This comprehensive approach ensures you get full protection including vulnerability scanning, runtime threat detection, and security posture management.

## Article contents

- [Prerequisites](#prerequisites)
- [Enable Defender plan](#enable-defender-for-containers-plan)
- [Configure components](#configure-plan-components)
- [Monitor deployment](#monitor-deployment-progress)
- [Deploy Defender sensor](#deploy-the-defender-sensor)
- [Verify deployment](#verify-component-deployment)
- [Enable diagnostics](#enable-diagnostic-logs-recommended)
- [Advanced configuration](#configure-custom-workspace-optional)

> [!NOTE]
> This guide covers the complete setup process for new deployments. If you already have Defender for Containers enabled and need to fix or add components, see [Deploy specific components](defender-for-containers-azure-deploy-portal.md).

## When to use this guide

Use this guide if you're:

- Setting up Defender for Containers on Azure for the first time
- Want to enable all security features at once
- Need comprehensive protection for all your AKS clusters

If you already have Defender for Containers enabled and need to deploy specific components, see [Deploy specific Defender for Containers components on Azure (AKS)](defender-for-containers-azure-deploy-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

## Enable Defender for Containers plan

The first step is to enable the Defender for Containers plan on your subscription:

1. Sign in to the [Azure portal](https://portal.azure.com).

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

The Defender sensor provides runtime threat detection for your AKS clusters. If it's not automatically deployed after enabling the plan, manually trigger deployment:

### Deploy to all AKS clusters

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select "Azure Kubernetes Service clusters should have Defender profile enabled".

    :::image type="content" source="media/tutorial-enable-containers-azure/recommendation-search.png" alt-text="Screenshot of the recommendations page that shows where to search for and find the Azure Kubernetes service cluster recommendation is located." lightbox="media/tutorial-enable-containers-azure/recommendation-search.png":::

1. Select all AKS clusters that need the sensor.

1. Select **Fix**.

    :::image type="content" source="media/tutorial-enable-containers-azure/affected-fix.png" alt-text="Screenshot of the recommendation with the affected resources selected that shows you how to select the fix button." lightbox="media/tutorial-enable-containers-azure/affected-fix.png":::

1. Review the deployment configuration.

1. Select **Fix X resources** to deploy.

### Deploy to specific clusters

1. Navigate to your AKS cluster.

1. Under **Settings**, select **Defender**.

1. Select **Enable Microsoft Defender for Containers**.

1. Configure settings:
   - Enable runtime protection
   - Configure resource limits
   - Set namespace exclusions

1. Select **Save**.

### Verify sensor deployment

```bash
# Check Defender profile
az aks show -g <resource-group> -n <cluster-name> --query securityProfile.defender

# Check pods
kubectl get pods -n kube-system -l app=microsoft-defender

# View DaemonSet
kubectl get daemonset -n kube-system microsoft-defender-sensor
```

The sensor should be running on all nodes within 5-10 minutes.

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
