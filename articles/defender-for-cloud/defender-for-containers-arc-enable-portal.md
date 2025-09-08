---
title: Enable Defender for Containers on Arc-enabled Kubernetes via portal
description: Learn how to enable Microsoft Defender for Containers on your Arc-enabled Kubernetes clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 06/04/2025
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
   > If you want to disable automatic installation of components during the onboarding process, select **Edit configuration** for the **Containers** plan. The advanced options appear, and you can disable automatic installation for each component.

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
    > Select the checkbox next to the cluster name, not the hyperlinked name itself.

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
kubectl get daemonset -n kube-system microsoft-defender-sensor
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

## Deploy specific components (optional)

If you need selective deployment or to fix issues with existing deployments:

### Check component status

1. Go to **Inventory** and filter by Arc-enabled Kubernetes resources.

1. Check each cluster for:
   - Arc connectivity status
   - Defender extension status
   - Policy extension status

1. Go to **Recommendations** and search for Arc-specific recommendations.

### Deploy missing components

If you disable automatic installation of any component, you can deploy it using these recommendations:

| Component | Recommendation |
|--|--|
| Defender extension for Azure Arc-enabled Kubernetes | [Azure Arc-enabled Kubernetes clusters should have the Defender extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6) |
| Azure Policy extension for Azure Arc-enabled Kubernetes | [Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/0642d770-b189-42ef-a2ce-9dcc3ec6c169) |

#### Deploy the Defender sensor to specific clusters

To deploy the sensor only to selected Arc-enabled clusters:

1. Go to **Recommendations** and find "Azure Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select only the clusters where you want the sensor.

1. Follow the remediation steps for selected clusters only.

#### Deploy via Arc portal

1. Go to your Arc-enabled Kubernetes cluster.

1. Select **Extensions** > **+ Add**.

1. Search for and add the Microsoft Defender extension.

1. Configure:
   - Log Analytics workspace
   - Resource limits
   - Namespace exclusions

### Configure by cluster distribution

#### Rancher clusters

For Rancher RKE and RKE2 clusters:

1. Configure the audit log path:
   - RKE: `/var/log/kubernetes/audit.log`
   - RKE2: `/var/log/kube-audit/audit.log`

#### VMware Tanzu

For Tanzu clusters:

1. Ensure audit logging is enabled.
1. Set appropriate PSP or PSA policies.
1. Configure network policies if required.

#### OpenShift

- Ensure Security Context Constraints (SCCs) allow Defender components
- Configure appropriate project/namespace permissions
- Review OpenShift-specific network policies

### Deploy by environment type

#### On-premises clusters

Consider the following items:

1. **Private registries**: Configure authentication.

   ```bash
   kubectl create secret docker-registry regcred \
     --namespace mdc \
     --docker-server=<registry> \
     --docker-username=<username> \
     --docker-password=<password>
   ```

1. **Proxy configuration**: If using proxy.
1. **Air-gapped**: Use local image repository.

#### Edge locations

For edge computing scenarios:

1. Consider bandwidth limitations
1. Configure appropriate resource limits
1. Set up local log aggregation

### Configure exclusions

To exclude specific Arc-enabled clusters from automatic provisioning:

1. Go to your Arc-enabled Kubernetes cluster.

1. Under **Overview**, select **Tags**.

1. Add one of these tags:
   - For Defender sensor: `ms_defender_container_exclude_sensors` = `true`
   - For Azure Policy: `ms_defender_container_exclude_azurepolicy` = `true`

## Configure additional settings

### Enable diagnostic logs

1. In your Arc cluster, select **Diagnostic settings**.

1. Add a diagnostic setting with all log categories.

1. Send the logs to your Log Analytics workspace.

### Configure alert notifications

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Email notifications**.

1. Set up the recipients and alert severity levels.

## Troubleshooting

### Extension installation fails

1. **Check Arc connectivity**:

   ```bash
   az connectedk8s show \
     --name <cluster-name> \
     --resource-group <resource-group>
   ```

1. **Review prerequisites**:
   - Supported Kubernetes version
   - Arc agents healthy
   - Network connectivity

### Extension unhealthy

1. Check pod status:

   ```bash
   kubectl describe pods -n mdc
   ```

1. Common issues:
   - **ImagePullBackOff**: Registry access issues
   - **CrashLoopBackOff**: Configuration problems
   - **Pending**: Resource constraints

### No security alerts

1. Verify audit logs are accessible
1. Check log path configuration
1. Ensure proper RBAC permissions
1. Test with sample alert

### Sensor pods not starting

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

## Monitor ongoing security

After setup, regularly:

1. **Review recommendations** - Address security issues for Arc-enabled clusters.
1. **Investigate alerts** - Respond to runtime threats detected.
1. **Track compliance** - Monitor adherence to CIS benchmarks.
1. **Update components** - Keep Arc and Defender extensions current.
1. **Monitor partial deployments** - Track which clusters have protection if using selective deployment.

## Best practices

1. **Start with non-production**: Test on dev/test clusters first for selective deployment.
1. **Enable all components**: Get comprehensive protection when possible.
1. **Configure exclusions carefully**: Only exclude nonproduction namespaces.
1. **Monitor resource usage**: Ensure adequate cluster capacity.
1. **Regular updates**: Keep extensions and Arc agents current.
1. **Alert response**: Establish procedures for security alerts.
1. **Document exclusions**: Track why certain clusters are excluded in selective deployments.
1. **Deploy incrementally**: When using selective deployment, add one component at a time.
1. **Monitor each step**: Verify each component before proceeding to the next.

## Advanced configuration

### Custom resource limits

```yaml
resources:
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 200m
    memory: 256Mi
```

### Multi-cluster deployment

To deploy to multiple clusters, use the following approaches:

1. Use Azure Policy for at-scale deployment.
1. Create custom initiatives.
1. Use tags for targeting.
1. Automate with scripts.

## Clean up resources

To disable Defender for Containers:

1. Go to **Environment settings**.

1. Choose either:
   - Set **Containers** to **Off** to disable the plan
   - Delete the entire connector to remove all configurations

1. To remove extensions:
   - Go to your Arc cluster
   - Select **Extensions**
   - Delete both Defender and Policy extensions

## Next steps

- [Verify deployment](defender-for-containers-arc-verify.md)
- [Configure advanced settings](defender-for-containers-arc-configure.md)
- [Deploy programmatically](defender-for-containers-arc-enable-programmatically.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
