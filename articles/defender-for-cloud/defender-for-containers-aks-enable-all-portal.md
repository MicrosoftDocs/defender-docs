---
title: Enable all Defender for Containers components on AKS via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Azure Kubernetes Service (AKS) clusters through the Azure portal.
ms.topic: tutorial
ms.date: 06/04/2025
---

# Tutorial: Enable all Defender for Containers components on AKS via portal

This tutorial walks you through enabling all Microsoft Defender for Containers components on your Azure Kubernetes Service (AKS) clusters using the Azure portal. This comprehensive approach ensures you get full protection including vulnerability scanning, runtime threat detection, and security posture management.

In this tutorial, you'll learn how to:

> [!div class="checklist"]
> - Enable the Defender for Containers plan with all components
> - Configure vulnerability scanning for container registries
> - Deploy runtime protection to your AKS clusters
> - Enable security posture management
> - Verify successful deployment

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

## Configure plan components

After enabling the plan, configure which components to enable:

1. Select **Settings** in the Containers plan row.

1. In the Settings page, you'll see all available components.

1. Ensure all components are toggled **On**:
   - **Agentless discovery for Kubernetes** - Provides visibility into your Kubernetes clusters
   - **Agentless container vulnerability assessment** - Scans container images for vulnerabilities
   - **Defender DaemonSet** - Provides runtime threat detection
   - **Azure Policy for Kubernetes** - Enables security recommendations and compliance

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