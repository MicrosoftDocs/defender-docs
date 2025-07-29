---
title: Enable all Defender for Containers components on Arc-enabled Kubernetes via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Arc-enabled Kubernetes clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on Arc-enabled Kubernetes via portal

This article walks you through enabling all Microsoft Defender for Containers components on your Arc-enabled Kubernetes clusters using the Azure portal. This comprehensive approach ensures you get full protection including vulnerability scanning, runtime threat detection, and security posture management for your on-premises and multi-cloud Kubernetes environments.

## Article contents

- [Prerequisites](#prerequisites)
- [Connect cluster to Arc](#connect-your-cluster-to-azure-arc)
- [Enable Defender plan](#enable-defender-for-containers-plan)
- [Configure components](#configure-all-plan-components)
- [Deploy extensions](#deploy-extensions-to-arc-enabled-clusters)
- [Deploy Defender sensor](#deploy-the-defender-sensor)
- [Configure workspace](#configure-log-analytics-workspace)
- [Verify deployment](#verify-extension-deployment)
- [Enable scanning](#enable-vulnerability-scanning)
- [Test and monitor](#test-the-deployment)

> [!NOTE]
> This guide covers the complete setup for new deployments. If you already have Defender for Containers enabled and need to fix or add components, see [Deploy specific components](defender-for-containers-arc-deploy-portal.md).

## When to use this guide

Use this guide if you're:

- Setting up Defender for Containers on Arc-enabled clusters for the first time
- Want comprehensive protection for all your on-premises or multi-cloud clusters
- Need to secure multiple distributions (Rancher, Tanzu, etc.)
- Looking for a guided, visual deployment experience

For selective deployment or troubleshooting existing deployments, see [Deploy specific Defender for Containers components on Arc-enabled Kubernetes](defender-for-containers-arc-deploy-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additional Arc-specific requirements:

- CNCF-certified Kubernetes cluster (on-premises or IaaS)
- Cluster version 1.19 or later
- Outbound HTTPS connectivity to Azure endpoints
- Azure CLI installed locally or Azure Cloud Shell

## Connect your cluster to Azure Arc

If your Kubernetes cluster isn't already connected to Azure Arc:

1. Sign in to the [Azure portal](https://portal.azure.com).

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
    > Select the checkbox next to the cluster name, not the hyperlinked name itself.

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

1. Repeat to install **Azure Policy for Kubernetes** extension if needed.

## Deploy the Defender sensor

After the extension is installed, deploy the Defender sensor to your Arc-enabled clusters:

### Option 1: Deploy via recommendations

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Azure Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select the recommendation.

1. Select your Arc-enabled clusters where the sensor needs to be deployed.

1. Select **Fix**.

1. Review the deployment configuration:
   - Log Analytics workspace assignment
   - Resource allocation settings
   - Namespace configuration

1. Select **Fix X resources** to deploy.

### Option 2: Deploy via Arc cluster

1. Navigate to your Arc-enabled Kubernetes cluster.

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
kubectl get daemonset -n kube-system microsoft-defender-sensor
```

All nodes should have a running sensor pod within 5-10 minutes.

### Check sensor pods

```bash
# List all Defender pods
kubectl get pods -n mdc -l app=microsoft-defender

# Check pod logs for any errors
kubectl logs -n mdc -l app=microsoft-defender --tail=50
```

### Troubleshoot sensor issues

If the sensor isn't deploying correctly:

1. **Check namespace exists**:

   ```bash
   kubectl get namespace mdc
   ```

1. **Verify RBAC permissions**:

   ```bash
   kubectl get clusterrole | grep defender
   kubectl get clusterrolebinding | grep defender
   ```

1. **Check resource constraints**:

   ```bash
   kubectl describe daemonset -n mdc microsoft-defender-sensor
   ```

1. **Review events**:

   ```bash
   kubectl get events -n mdc --sort-by='.lastTimestamp'
   ```

## Configure Log Analytics workspace

During extension deployment:

1. Select an existing Log Analytics workspace or create a new one.

1. Use the default workspace: DefaultWorkspace-[subscription-id]-[region].

1. Or select a custom workspace in a [supported region](support-matrix-defender-for-containers.md).

## Verify extension deployment

1. In your Arc-enabled cluster, navigate to **Extensions**.

1. Verify both extensions show as **Succeeded**:
   - Microsoft Defender for Containers
   - Azure Policy for Kubernetes (if deployed)

1. Select each extension to view configuration details.

## Enable vulnerability scanning

For Arc-enabled clusters, configure registry scanning:

1. If using Azure Container Registry:
   - Vulnerability scanning is automatically enabled
   - Ensure ACR is in the same subscription or connected

1. For private registries:

   ```bash
   # Create registry credentials
   kubectl create secret docker-registry regcred \
       --namespace mdc \
       --docker-server=<registry-url> \
       --docker-username=<username> \
       --docker-password=<password>
   ```

1. Update extension configuration to use credentials.

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

## Distribution-specific considerations

### Rancher

- Configure appropriate namespaces exclusions
- Consider Rancher-specific RBAC settings

### VMware Tanzu

- Enable audit logging if not already configured
- Ensure PSP/PSA policies allow Defender components

## Monitor ongoing security

After setup, regularly:

1. **Review recommendations** - Address security issues for Arc-enabled clusters
1. **Investigate alerts** - Respond to runtime threats detected
1. **Track compliance** - Monitor adherence to CIS benchmarks
1. **Update components** - Keep Arc and Defender extensions current

## Best practices

1. **Enable all components** - Get comprehensive protection
1. **Configure exclusions carefully** - Only exclude non-production namespaces
1. **Monitor resource usage** - Ensure adequate cluster capacity
1. **Regular updates** - Keep extensions and Arc agents current
1. **Alert response** - Establish procedures for security alerts

## Troubleshooting

If extensions fail to install:

1. Check cluster connectivity:

   ```bash
   kubectl get nodes
   az connectedk8s show -n <cluster-name> -g <resource-group>
   ```

1. Verify outbound connectivity to required endpoints.

1. Check extension status:

   ```bash
   az k8s-extension show --name microsoft.azuredefender.kubernetes \
       --cluster-name <cluster-name> \
       --resource-group <resource-group> \
       --cluster-type connectedClusters
   ```

1. Review pod status:

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
- [Review and implement security recommendations](recommendations-reference-container.md)
