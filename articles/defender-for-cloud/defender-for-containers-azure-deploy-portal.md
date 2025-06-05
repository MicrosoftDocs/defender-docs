---
title: Deploy Defender for Containers on Azure (AKS) using Azure portal
description: Learn how to enable Microsoft Defender for Containers on Azure Kubernetes Service (AKS) clusters using the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on Azure (AKS) using Azure portal

This article explains how to enable Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters using the Azure portal.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant Azure subscription.

1. On the Defender plans page, toggle the **Containers** plan to **On**.

    :::image type="content" source="media/tutorial-enable-containers-azure/toggle-defender-for-containers.png" alt-text="Screenshot that shows the Defender for Cloud pricing page with the Containers plan toggle highlighted." lightbox="media/tutorial-enable-containers-azure/toggle-defender-for-containers.png":::

1. Select **Settings** to configure the plan components.

## Configure plan components

After enabling the plan, configure which components to enable:

1. In the Settings page, ensure all components are toggled **On**:
   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

    :::image type="content" source="media/tutorial-enable-containers-azure/containers-settings.png" alt-text="Screenshot showing the Defender for Containers components settings page." lightbox="media/tutorial-enable-containers-azure/containers-settings.png":::

1. Select **Continue**.

1. Review the changes and select **Save**.

## Deploy extensions to your AKS clusters

After enabling Defender for Containers, the extensions are automatically deployed to all existing and new AKS clusters in the subscription. This process typically takes a few minutes.

### Monitor deployment progress

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for recommendations related to container security:
   - "Azure Kubernetes Service clusters should have Defender profile enabled"
   - "Azure Policy for Kubernetes should be installed and enabled on your clusters"

1. Select a recommendation to see which clusters are missing the extensions.

### Manual deployment (if needed)

If automatic deployment doesn't occur, you can manually deploy the extensions:

1. Navigate to your AKS cluster in the Azure portal.

1. Under **Settings**, select **Extensions + applications**.

1. Select **+ Add** and search for:
   - **Microsoft Defender for Containers**
   - **Azure Policy for Kubernetes**

1. Follow the installation wizard for each extension.

## Configure diagnostic logs

To ensure proper data collection for runtime threat detection:

1. Navigate to your AKS cluster in the Azure portal.

1. Under **Monitoring**, select **Diagnostic settings**.

1. Select **+ Add diagnostic setting**.

1. Provide a name for the diagnostic setting.

1. Select the following log categories:
   - kube-apiserver
   - kube-audit
   - kube-controller-manager
   - kube-scheduler
   - guard

1. Choose a destination:
   - **Send to Log Analytics workspace** (recommended)
   - Select the DefaultWorkspace-[subscription-id]-[region] or your custom workspace

1. Select **Save**.

## Enable vulnerability scanning for ACR

If you use Azure Container Registry (ACR), ensure vulnerability scanning is enabled:

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. Verify that **Container registries** (under Defender CSPM) is enabled.

1. Navigate to your Azure Container Registry.

1. Under **Security**, verify that vulnerability scanning is configured.

## Verify deployment

After deployment completes, verify that all components are working:

1. Navigate to **Microsoft Defender for Cloud** > **Workload protections**.

1. Select **Containers**.

1. Verify that your AKS clusters appear in the inventory.

1. Check that security recommendations are being generated for your clusters.

For detailed verification steps, see [Verify Defender for Containers deployment on Azure (AKS)](defender-for-containers-azure-verify.md).

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-azure-configure.md)
- [Enable all Defender for Containers components via portal](defender-for-containers-aks-enable-all-portal.md)
- [Troubleshoot Defender for Containers deployment](defender-for-containers-troubleshooting.md)