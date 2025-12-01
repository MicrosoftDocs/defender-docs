---
title: Enable Defender for Containers on Arc-enabled Kubernetes via portal
description: Learn how to enable Microsoft Defender for Containers on your Arc-enabled Kubernetes clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Enable Defender for Containers on Arc-enabled Kubernetes via portal

This article shows you how to enable Microsoft Defender for Containers on your Arc-enabled Kubernetes clusters through the Azure portal. You can choose to enable all security features at once for comprehensive protection, or selectively deploy specific components based on your requirements.

## When to use this guide

Use this guide if you want to:

- Set up Defender for Containers on Arc-enabled clusters for the first time
- Enable all security features for comprehensive protection
- Selectively deploy specific components
- Fix or add missing components to an existing deployment
- Deploy using a controlled, selective approach
- Exclude certain clusters from protection

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additional Arc-specific requirements:

- CNCF-certified Kubernetes cluster (on-premises or IaaS)
- Cluster version 1.19 or later
- Outbound HTTPS connectivity to Azure endpoints
- Azure CLI installed locally or Azure Cloud Shell

## Connect your cluster to Azure Arc

If your Kubernetes cluster isn't already connected to Azure Arc, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Azure Arc** in the Azure portal.

1. Select **Kubernetes clusters** from the left menu.

1. Select **Add**.

1. Select **Add a Kubernetes cluster with Azure Arc**.

1. Follow the connection instructions:
   - Select or create a resource group
   - Enter a cluster name
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

1. Go to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select the subscription that contains your Arc-enabled cluster.

1. Turn on the **Containers** plan.

    :::image type="content" source="media/tutorial-enable-containers-azure/containers-enabled-aks.png" alt-text="Screenshot of the Defender plans page that shows where to toggle the containers plan switch to on is located." lightbox="media/tutorial-enable-containers-azure/containers-enabled-aks.png":::

## Configure plan components

1. Select **Settings** next to the Containers plan.

1. Choose your deployment approach:
   - **Enable all components** (recommended): Enable all features for comprehensive protection
   - **Enable specific components**: Select only the components you need

   :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

   > [!NOTE]
   > To disable automatic installation of components during the onboarding process, select **Edit configuration** for the **Containers** plan. The advanced options appear, and you can disable automatic installation for each component.

   Available components:
   - **Agentless discovery for Kubernetes** - Discovers all Kubernetes clusters
   - **Agentless container vulnerability assessment** - Scans container images
   - **Defender DaemonSet** - Runtime threat detection
   - **Azure Policy for Kubernetes** - Security recommendations

1. Select **Continue** and then **Save**.

## Deploy all components

Follow these steps to enable comprehensive protection for all your Arc-enabled clusters.

### Deploy extensions to Arc-enabled clusters

#### Option 1: Deploy via recommendations (recommended)

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Azure Arc-enabled Kubernetes clusters should have Defender extension installed".

    :::image type="content" source="media/tutorial-enable-containers-azure/extension-recommendation.png" alt-text="Microsoft Defender for Cloud's recommendation for deploying the Defender sensor for Azure Arc-enabled Kubernetes clusters." lightbox="media/tutorial-enable-containers-azure/extension-recommendation.png":::

1. Select the recommendation.

1. Select your Arc-enabled clusters.

    > [!IMPORTANT]
    > Select the check box next to the cluster name, not the hyperlinked name itself.

1. Select **Fix** to automatically deploy the extensions.

   :::image type="content" source="media/defender-for-kubernetes-azure-arc/security-center-deploy-extension.gif" alt-text="Animated screenshot that shows deploying a Defender sensor for Azure Arc by using remediation in Defender for Cloud.":::

#### Option 2: Deploy manually

1. Go to your Arc-enabled Kubernetes cluster.

1. Under **Settings**, select **Extensions**.

1. Select **+ Add**.

1. Install the **Microsoft Defender for Containers** extension:
   - Search for "Microsoft Defender"
   - Select the extension
   - Configure the Log Analytics workspace
   - Complete installation

1. Repeat to install **Azure Policy for Kubernetes** extension if needed.

### Deploy the Defender sensor

After installing the extension, deploy the Defender sensor to your Arc-enabled clusters:

#### Option 1: Deploy through recommendations

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Azure Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select the recommendation.

1. Select your Arc-enabled clusters where you want to deploy the sensor.

1. Select **Fix**.

1. Review the deployment configuration:
   - Log Analytics workspace assignment
   - Resource allocation settings
   - Namespace configuration

1. Select **Fix X resources** to deploy.

#### Option 2: Deploy via Arc cluster

1. Go to your Arc-enabled Kubernetes cluster.

1. Under **Settings**, select **Extensions**.

1. Verify the **Microsoft Defender** extension shows as **Succeeded**.

1. If the sensor pods aren't running, select the extension and choose **Manage**.

1. Configure deployment settings:
   - Enable runtime protection
   - Set resource limits if needed
   - Configure namespace exclusions

1. Select **Apply**.

### Verify sensor deployment

After deployment, verify the sensor is running:

```bash
# Check sensor pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Check DaemonSet status
kubectl get ds microsoft-defender-collector-ds -n kube-system
```

All nodes should have a running sensor pod within 5-10 minutes.

### Configure Log Analytics workspace

During extension deployment, you can:

1. Select an existing Log Analytics workspace or create a new one.

1. Use the default workspace: DefaultWorkspace-[subscription-id]-[region].

1. Or select a custom workspace in a [supported region](support-matrix-defender-for-containers.md).

### Enable vulnerability scanning

For Arc-enabled clusters, configure registry scanning:

1. If you're using Azure Container Registry:
   - Vulnerability scanning is automatically enabled
   - Ensure the Azure Container Registry is in the same subscription or connected

1. For private registries:

   ```bash
   # Create registry credentials
   kubectl create secret docker-registry regcred \
       --namespace mdc \
       --docker-server=<registry-url> \
       --docker-username=<username> \
       --docker-password=<password>
   ```

1. Update the extension configuration to use credentials.

## Next steps

- [Verify deployment](defender-for-containers-arc-verify.md)
- [Deploy programmatically](defender-for-containers-arc-enable-programmatically.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
