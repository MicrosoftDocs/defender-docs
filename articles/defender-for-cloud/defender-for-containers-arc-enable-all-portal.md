---
title: Enable all Defender for Containers components on Arc-enabled Kubernetes via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Arc-enabled Kubernetes clusters through the Azure portal.
ms.topic: tutorial
ms.date: 06/04/2025
---

# Tutorial: Enable all Defender for Containers components on Arc-enabled Kubernetes via portal

This tutorial walks you through enabling all Microsoft Defender for Containers components on your Arc-enabled Kubernetes clusters using the Azure portal. This ensures comprehensive protection for your on-premises and IaaS Kubernetes environments.

In this tutorial, you'll learn how to:

> [!div class="checklist"]
> - Connect your Kubernetes cluster to Azure Arc
> - Enable the Defender for Containers plan with all components
> - Deploy the Defender and Azure Policy extensions
> - Configure vulnerability scanning
> - Verify successful deployment

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additional requirements:
- CNCF-certified Kubernetes cluster (on-premises or IaaS)
- Cluster version 1.19 or later
- Outbound HTTPS connectivity to Azure endpoints
- Azure CLI installed locally or Azure Cloud Shell

## Sign in to Azure

Sign in to the [Azure portal](https://portal.azure.com).

## Connect your cluster to Azure Arc

If your Kubernetes cluster isn't already connected to Azure Arc:

1. Navigate to **Azure Arc** in the Azure portal.

1. Select **Kubernetes clusters** from the left menu.

1. Select **Add**.

    :::image type="content" source="media/tutorial-enable-containers-arc/add-arc-cluster.png" alt-text="Screenshot showing the Add button in Azure Arc Kubernetes clusters." lightbox="media/tutorial-enable-containers-arc/add-arc-cluster.png":::

1. Select **Add a Kubernetes cluster with Azure Arc**.

1. Follow the connection instructions:
   - Select or create a resource group
   - Provide a cluster name
   - Choose a region
   - Add tags (optional)

1. In the **Cluster details** tab, copy and run the registration script on your cluster:

    ```bash
    # The portal will generate a script similar to this
    az connectedk8s connect --name <cluster-name> \
        --resource-group <resource-group> \
        --location <region>
    ```

1. Wait for the connection to complete and verify the cluster appears as **Connected**.

## Enable Defender for Containers plan

1. Navigate to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select the subscription containing your Arc-enabled cluster.

    :::image type="content" source="media/tutorial-enable-containers-arc/environment-settings.png" alt-text="Screenshot showing environment settings in Defender for Cloud." lightbox="media/tutorial-enable-containers-arc/environment-settings.png":::

1. Toggle the **Containers** plan to **On**.

    :::image type="content" source="media/tutorial-enable-containers-arc/enable-containers-plan.png" alt-text="Screenshot showing the Containers plan toggle." lightbox="media/tutorial-enable-containers-arc/enable-containers-plan.png":::

## Configure all plan components

1. Select **Settings** next to the Containers plan.

1. Ensure all components are enabled:
   - **Agentless discovery for Kubernetes** - Discovers all Kubernetes clusters
   - **Agentless container vulnerability assessment** - Scans container images
   - **Defender DaemonSet** - Runtime threat detection
   - **Azure Policy for Kubernetes** - Security recommendations

    :::image type="content" source="media/tutorial-enable-containers-arc/all-components-enabled.png" alt-text="Screenshot showing all Defender for Containers components enabled." lightbox="media/tutorial-enable-containers-arc/all-components-enabled.png":::

1. Select **Continue** and then **Save**.

## Deploy extensions to Arc-enabled clusters

### Option 1: Deploy via recommendations (recommended)

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Azure Arc-enabled Kubernetes clusters should have Defender extension installed".

    :::image type="content" source="media/tutorial-enable-containers-arc/arc-recommendation.png" alt-text="Screenshot showing the Arc Defender extension recommendation." lightbox="media/tutorial-enable-containers-arc/arc-recommendation.png":::

1. Select the recommendation.

1. Select your Arc-enabled clusters.

1. Select **Fix** to automatically deploy the extensions.

### Option 2: Deploy manually

1. Navigate to your Arc-enabled Kubernetes cluster.

1. Under **Settings**, select **Extensions**.

1. Select **+ Add**.

    :::image type="content" source="media/tutorial-enable-containers-arc/add-extension.png" alt-text="Screenshot showing the Add extension button." lightbox="media/tutorial-enable-containers-arc/add-extension.png":::

1. Install the **Microsoft Defender for Containers** extension:
   - Search for "Microsoft Defender"
   - Select the extension
   - Configure the Log Analytics workspace
   - Complete installation

1. Repeat to install **Azure Policy for Kubernetes** extension.

## Configure Log Analytics workspace

During extension deployment:

1. Select an existing Log Analytics workspace or create a new one.

1. Use the default workspace: DefaultWorkspace-[subscription-id]-[region].

1. Or select a custom workspace in a [supported region](support-matrix-defender-for-containers.md).

    :::image type="content" source="media/tutorial-enable-containers-arc/configure-workspace.png" alt-text="Screenshot showing Log Analytics workspace configuration." lightbox="media/tutorial-enable-containers-arc/configure-workspace.png":::

## Verify extension deployment

1. In your Arc-enabled cluster, navigate to **Extensions**.

1. Verify both extensions show as **Succeeded**:
   - Microsoft Defender for Containers
   - Azure Policy for Kubernetes

    :::image type="content" source="media/tutorial-enable-containers-arc/extensions-installed.png" alt-text="Screenshot showing installed extensions on Arc cluster." lightbox="media/tutorial-enable-containers-arc/extensions-installed.png":::

1. Select each extension to view configuration details.

## Enable vulnerability scanning

For Arc-enabled clusters, configure registry scanning:

1. If using Azure Container Registry:
   - Vulnerability scanning is automatically enabled
   - Ensure ACR is in the same subscription or connected

1. For other registries:
   - Configure registry credentials in Defender settings
   - Enable scanning for specific registries

## Monitor deployment progress

1. Navigate to **Microsoft Defender for Cloud** > **Workload protections**.

1. Select **Containers**.

1. Your Arc-enabled clusters should appear within 15-30 minutes.

    :::image type="content" source="media/tutorial-enable-containers-arc/containers-dashboard-arc.png" alt-text="Screenshot showing Arc clusters in the Containers dashboard." lightbox="media/tutorial-enable-containers-arc/containers-dashboard-arc.png":::

## View security insights

After deployment completes:

1. **Inventory**: See all your Arc-enabled clusters and their security status.

1. **Recommendations**: View Arc-specific security recommendations:
   - Kubernetes API servers should be accessible only via private endpoints
   - Kubernetes clusters should use RBAC
   - Container images should be deployed from trusted registries

1. **Security alerts**: Monitor runtime threats and suspicious activities.

## Test the deployment

Generate a test security alert:

```bash
# Run this command in your cluster to trigger a benign test alert
kubectl run test-alert --image=nginx --rm -it --restart=Never -- bash -c "echo 'test' > /etc/passwd"
```

Check for the alert in Defender for Cloud within 5-10 minutes.

## Configure additional settings

### Enable diagnostic logs

1. In your Arc cluster, select **Diagnostic settings**.

1. Add diagnostic setting with all log categories.

1. Send to your Log Analytics workspace.

### Configure alert notifications

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Email notifications**.

1. Configure recipients and alert severity levels.

## Clean up resources

To disable Defender for Containers:

1. Navigate to **Environment settings**.

1. Toggle **Containers** to **Off**.

1. To remove extensions:
   - Go to your Arc cluster
   - Select **Extensions**
   - Delete both Defender and Policy extensions

## Next steps

- [Configure advanced settings for Arc-enabled clusters](defender-for-containers-arc-configure.md)
- [Investigate security alerts](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters)
- [Review and implement security recommendations](recommendations-reference-container.md)