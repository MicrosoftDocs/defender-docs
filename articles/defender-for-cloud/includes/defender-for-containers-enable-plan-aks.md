---
ms.author: dacurwin
author: dcurwin
ms.service: defender-for-cloud
ms.topic: include
ms.date: 06/01/2023
---

## Enable the plan

1. In Defender for Cloud, select **Settings**, and then select the relevant subscription.

1. On the [Defender plans](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/pricingTier) page, select **Containers** > **Settings**.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/containers-settings.png" alt-text="Screenshot of the page for Defender plans." lightbox="../media/defender-for-containers-enable-plan-gke/containers-settings.png":::

    > [!TIP]
    > If the subscription already has Defender for Kubernetes or Defender for container registries enabled, an update notice appears. Otherwise, the only option is **Containers**.
    >
    > :::image type="content" source="../media/release-notes/defender-plans-deprecated-indicator.png" alt-text="Screenshot that shows Defender for Kubernetes and Defender for container registries plans in a deprecated state, along with upgrade information.":::

1. Turn on the relevant component.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="../media/defender-for-containers-enable-plan-gke/container-components-on.png":::

    > [!NOTE]
    >
    > - Defender for Containers customers who joined before August 2023 and don't have **Agentless discovery for Kubernetes** turned on as part of Defender cloud security posture management (CSPM) when they enabled the plan must manually enable the **Agentless discovery for Kubernetes** extension within the Defender for Containers plan.
    > - When you turn off Defender for Containers, the components are set to **Off**. They're not deployed to any more containers, but they're not removed from containers where they're already installed.

### Enablement method per capability

By default, when you enable the plan through the Azure portal, [Microsoft Defender for Containers](../defender-for-containers-introduction.md) is configured to automatically enable all capabilities and install all required components to provide the protections that the plan offers. This configuration includes the assignment of a default workspace.

If you don't want to enable all capabilities of the plans, you can manually select which specific capabilities to enable by selecting **Edit configuration** for the **Containers** plan. Then, on the **Settings & monitoring** page, select the capabilities that you want to enable.
You can also modify this configuration from the [Defender plans](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/pricingTier) page after initial configuration of the plan.

For detailed information on the enablement method for each capability, see the [support matrix](../support-matrix-defender-for-containers.md).

### Roles and permissions

Learn more about the [roles for provisioning Defender for Containers extensions](../permissions.md#roles-used-to-automatically-provision-agents-and-extensions).

### Assign a custom workspace for the Defender sensor

You can [assign a custom workspace](../defender-for-containers-enable.md?pivots=defender-for-container-aks&tabs=aks-deploy-portal%2ck8s-deploy-asc%2ck8s-verify-asc%2ck8s-remove-arc%2caks-removeprofile-api#assign-a-custom-workspace) through Azure Policy.

### Manual deployment of the Defender sensor or Azure policy agent without automatic provisioning by using recommendations

Capabilities that require sensor installation can also be deployed on one or more Kubernetes clusters. Use the appropriate recommendation:

| Sensor | Recommendation |
|--|--|
| Defender sensor for Kubernetes | [Azure Kubernetes Service clusters should have Defender profile enabled](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9) |
| Defender sensor for Azure Arc-enabled Kubernetes | [Azure Arc-enabled Kubernetes clusters should have the Defender extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6) |
| Azure Policy agent for Kubernetes | [Azure Kubernetes Service clusters should have the Azure Policy Add-on for Kubernetes installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/08e628db-e2ed-4793-bc91-d13e684401c3) |
| Azure Policy agent for Azure Arc-enabled Kubernetes | [Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/0642d770-b189-42ef-a2ce-9dcc3ec6c169) |

To deploy the Defender sensor on specific clusters:

1. On the Microsoft Defender for Cloud **Recommendations** page, open the **Enable enhanced security** security control or search for one of the preceding recommendations. (You can also use the preceding links to open the recommendation directly.)

1. View all clusters without a sensor by opening the **Unhealthy** tab.

1. Select the clusters where you want to deploy the sensor, and then select **Fix**.

1. Select **Fix X resources**.

## Deploy the Defender sensor: All options

You can enable the Defender for Containers plan and deploy all of the relevant components by using the Azure portal, the REST API, or an Azure Resource Manager template. For detailed steps, select the relevant tab.

After the Defender sensor is deployed, a default workspace is automatically assigned. You can [assign a custom workspace](../defender-for-containers-enable.md?pivots=defender-for-container-aks&tabs=aks-deploy-portal%2ck8s-deploy-asc%2ck8s-verify-asc%2ck8s-remove-arc%2caks-removeprofile-api#assign-a-custom-workspace) in place of the default workspace through Azure Policy.

> [!NOTE]
> The Defender sensor is deployed to each node to provide the runtime protections and collect signals from those nodes by using [eBPF technology](https://ebpf.io/).

### [Azure portal](#tab/aks-deploy-portal)

### Use the Fix button from the Defender for Cloud recommendation

You can use Azure portal pages to enable the Defender for Cloud plan and set up automatic provisioning of all the necessary components for defending your Kubernetes clusters at scale. The process is streamlined.

A dedicated Defender for Cloud recommendation provides:

- Visibility into which of your clusters has the Defender sensor deployed.
- A **Fix** button to deploy the sensor to clusters that don't have it.

To deploy the sensor:

1. On the Microsoft Defender for Cloud **Recommendations** page, open the **Enable enhanced security** security control.

1. Use the filter to find the recommendation named **Azure Kubernetes Service clusters should have Defender profile enabled**.

    > [!TIP]
    > Notice the **Fix** icon in the **Actions** column.

1. Select the clusters to see the details of the healthy and unhealthy resources (clusters with and without the sensor).

1. In the list of unhealthy resources, select a cluster. Then select **Remediate** to open the pane with the remediation confirmation.

1. Select **Fix X resources**.

### [REST API](#tab/aks-deploy-rest)

### Use the REST API to deploy the Defender sensor

To install `securityProfile` on an existing cluster by using the REST API, run the following `PUT` command:

```rest
PUT https://management.azure.com/subscriptions/{{Subscription ID}}/resourcegroups/{{Resource Group}}/providers/Microsoft.Kubernetes/connectedClusters/{{Cluster Name}}/providers/Microsoft.KubernetesConfiguration/extensions/microsoft.azuredefender.kubernetes?api-version=2020-07-01-preview
```

Here's the request URI:

`https://management.azure.com/subscriptions/{{SubscriptionId}}/resourcegroups/{{ResourceGroup}}/providers/Microsoft.ContainerService/managedClusters/{{ClusterName}}?api-version={{ApiVersion}}`

The request query has these parameters:

| Name           | Description                        | Mandatory |
|----------------|------------------------------------|-----------|
| `SubscriptionId` | Cluster's subscription ID          | Yes       |
| `ResourceGroup`  | Cluster's resource group           | Yes       |
| `ClusterName`    | Cluster's name                     | Yes       |
| `ApiVersion`     | API version; must be 2022-06-01 or later | Yes       |

This is the request body:

```rest
{
  "location": "{{Location}}",
  "properties": {
    "securityProfile": {
            "defender": {
                "logAnalyticsWorkspaceResourceId": "{{LAWorkspaceResourceId}}",
                "securityMonitoring": {
                    "enabled": true,
                }
            }
        }
    }
}
```

The request body has these parameters:

| Name | Description | Mandatory |
|--|--|--|
| `location` | Cluster's location | Yes |
| `properties.securityProfile.defender.securityMonitoring.enabled` | Determines whether to enable or disable Microsoft Defender for Containers on the cluster | Yes |
| `properties.securityProfile.defender.logAnalyticsWorkspaceResourceId` | Azure resource ID for the Log Analytics workspace | Yes |

### [Azure CLI](#tab/k8s-deploy-cli)

### Use the Azure CLI to deploy the Defender sensor

1. Sign in to Azure:

    ```azurecli
    az login
    az account set --subscription <your-subscription-id>
    ```

    > [!IMPORTANT]
    > Ensure that you use the same subscription ID for `<your-subscription-id>` as the one that's associated with your AKS cluster.

1. Enable the Defender sensor on your containers:

    - Run the following command to create a new cluster with the Defender sensor enabled:

      ```azurecli
      az aks create --enable-defender --resource-group <your-resource-group> --name <your-cluster-name>
      ```

    - Run the following command to enable the Defender sensor on an existing cluster:

      ```azurecli
      az aks update --enable-defender --resource-group <your-resource-group> --name <your-cluster-name>
      ```

    Here are the supported configuration settings on the Defender sensor type:

    | Property | Description |
    |----------|-------------|
    | `logAnalyticsWorkspaceResourceId` | *Optional*. Full resource ID of your own Log Analytics workspace.<br>If you don't provide one, the default workspace of the region is used.<br><br>To get the full resource ID, run the following command to display the list of workspaces in your subscriptions in the default JSON format:<br>```az resource list --resource-type Microsoft.OperationalInsights/workspaces -o json```<br><br>The Log Analytics workspace's resource ID has the following syntax:<br>`/subscriptions/{your-subscription-id}/resourceGroups/{your-resource-group}/providers/Microsoft.OperationalInsights/workspaces/{your-workspace-name}` <br>Learn more in [Log Analytics workspaces](/azure/azure-monitor/logs/log-analytics-workspace-overview). |

    You can include these settings in a JSON file and specify the JSON file in the `az aks create` and `az aks update` commands with this parameter: `--defender-config <path-to-JSON-file>`. The format of the JSON file must be:

    ```json
    {"logAnalyticsWorkspaceResourceId": "<workspace-id>"}
    ```

    Learn more about AKS CLI commands in [az aks](/cli/azure/aks).

1. To verify that the sensor was successfully added, run the following command on your machine with the `kubeconfig` file pointed to your cluster:

    ```console
    kubectl get pods -n kube-system
    ```

    When the sensor is added, you should see a pod called `microsoft-defender-XXXXX` in the `Running` state. It might take a few minutes for pods to be added.

### [Resource Manager](#tab/aks-deploy-arm)

### Use Azure Resource Manager to deploy the Defender sensor

To use Azure Resource Manager to deploy the Defender sensor, you need a Log Analytics workspace on your subscription. Learn more in [Log Analytics workspaces](/azure/azure-monitor/logs/log-analytics-workspace-overview).

> [!TIP]
> If you're new to Resource Manager templates, start here: [What are Azure Resource Manager templates?](/azure/azure-resource-manager/templates/overview).

To install `securityProfile` on an existing cluster by using Resource Manager:

```json
{ 
    "type": "Microsoft.ContainerService/managedClusters", 
    "apiVersion": "2022-06-01", 
    "name": "string", 
    "location": "string",
    "properties": {
        …
        "securityProfile": { 
            "defender": { 
                "logAnalyticsWorkspaceResourceId": "logAnalyticsWorkspaceResourceId",
                "securityMonitoring": {
                    "enabled": true
                }
            }
        }
    }
}
```
