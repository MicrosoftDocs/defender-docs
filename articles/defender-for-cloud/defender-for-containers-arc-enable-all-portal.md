---
title: Enable all Defender for Containers components on Arc-enabled Kubernetes via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Arc-enabled Kubernetes clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on Arc-enabled Kubernetes via portal

This article walks you through enabling all Microsoft Defender for Containers components on your Arc-enabled Kubernetes clusters using the Azure portal. This ensures comprehensive protection for your on-premises and IaaS Kubernetes environments.

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

1. Toggle the **Containers** plan to **On**.

    :::image type="content" source="media/tutorial-enable-containers-azure/containers-enabled-aks.png" alt-text="Screenshot of the Defender plans page that shows where to toggle the containers plan switch to on is located." lightbox="media/tutorial-enable-containers-azure/containers-enabled-aks.png":::

## Configure all plan components

1. Select **Settings** next to the Containers plan.

1. Ensure all components are enabled:
   - **Agentless discovery for Kubernetes** - Discovers all Kubernetes clusters
   - **Agentless container vulnerability assessment** - Scans container images
   - **Defender DaemonSet** - Runtime threat detection
   - **Azure Policy for Kubernetes** - Security recommendations

1. Select **Continue** and then **Save**.

## Deploy extensions to Arc-enabled clusters

### Option 1: Deploy via recommendations (recommended)

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Azure Arc-enabled Kubernetes clusters should have Defender extension installed".

    :::image type="content" source="media/tutorial-enable-containers-azure/extension-recommendation.png" alt-text="Microsoft Defender for Cloud's recommendation for deploying the Defender sensor for Azure Arc-enabled Kubernetes clusters." lightbox="media/tutorial-enable-containers-azure/extension-recommendation.png":::

1. Select the recommendation.

1. Select your Arc-enabled clusters.

    > [!IMPORTANT]
    > Don't select the clusters by their hyperlinked names. Select anywhere else in the relevant row.

1. Select **Fix** to automatically deploy the extensions.

### Option 2: Deploy manually

1. Navigate to your Arc-enabled Kubernetes cluster.

1. Under **Settings**, select **Extensions**.

1. Select **+ Add**.

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

## Verify extension deployment

1. In your Arc-enabled cluster, navigate to **Extensions**.

1. Verify both extensions show as **Succeeded**:
   - Microsoft Defender for Containers
   - Azure Policy for Kubernetes

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

### Exclude specific clusters

You can exclude specific Arc-enabled clusters from automatic provisioning:

1. Navigate to your Arc-enabled Kubernetes cluster.

1. Under **Overview**, select **Tags**.

1. Add one of these tags:
   - For Defender sensor: `ms_defender_container_exclude_sensors` = `true`
   - For Azure Policy: `ms_defender_container_exclude_azurepolicy` = `true`

## Monitor ongoing security

After setup, regularly:

1. **Review recommendations** - Address security issues identified for your Arc-enabled clusters
2. **Investigate alerts** - Respond to runtime threats detected by the Defender sensor
3. **Track compliance** - Monitor adherence to security standards and benchmarks
4. **Scan images** - Review vulnerability findings for container images

## Best practices

1. **Enable all components** - Get comprehensive protection by enabling all available features
2. **Regular monitoring** - Check the Containers dashboard weekly for new findings
3. **Alert response** - Investigate high-severity alerts immediately
4. **Image hygiene** - Regularly update base images and remove vulnerable packages
5. **Network segmentation** - Implement network policies to limit container communication

## Troubleshooting

If extensions fail to install:

1. Check cluster connectivity:

   ```bash
   kubectl get nodes
   az connectedk8s show -n <cluster-name> -g <resource-group>
   ```

2. Verify outbound connectivity to required endpoints.

3. Check extension status:

   ```bash
   az k8s-extension show --name microsoft.azuredefender.kubernetes --cluster-name <cluster-name> --resource-group <resource-group> --cluster-type connectedClusters
   ```

4. Review pod status:

   ```bash
   kubectl get pods -n mdc
   ```

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
