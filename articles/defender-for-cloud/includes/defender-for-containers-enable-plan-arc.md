---
ms.author: dacurwin
author: dcurwin
ms.service: defender-for-cloud
ms.topic: include
ms.date: 06/04/2023

---
## Enable the plan

1. In Defender for Cloud, select **Settings**, and then select the relevant subscription.

1. On the [Defender plans](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/pricingTier) page, select **Defender for Containers** > **Settings**.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/containers-settings.png" alt-text="Screenshot of the page for Defender plans." lightbox="../media/defender-for-containers-enable-plan-gke/containers-settings.png":::

    > [!TIP]
    > If the subscription already has Defender for Kubernetes or Defender for container registries enabled, an update notice appears. Otherwise, the only option is **Defender for Containers**.
    >
    > :::image type="content" source="../media/release-notes/defender-plans-deprecated-indicator.png" alt-text="Screenshot that shows Defender for Kubernetes and Defender for container registries plans in a deprecated state, along with upgrade information.":::

1. Turn on the relevant component.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="../media/defender-for-containers-enable-plan-gke/container-components-on.png":::

    > [!NOTE]
    > When you turn off Defender for Containers, the components are set to **Off**. They're not deployed to any more containers, but they're not removed from containers where they're already installed.

By default, when you enable the plan through the Azure portal, [Microsoft Defender for Containers](../defender-for-containers-introduction.md) is configured to automatically install required components to provide the protections that the plan offers. This configuration includes the assignment of a default workspace.

If you want to disable automatic installation of components during the onboarding process, select **Edit configuration** for the **Containers** plan. The advanced options appear, and you can disable automatic installation for each component.

You can also modify this configuration from the [Defender plans](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/pricingTier) page.

> [!NOTE]
> If you choose to disable the plan at any time after you enable it through the portal, you'll need to manually remove Defender for Containers components deployed on your clusters.

You can [assign a custom workspace](../defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-arc%2Caks-removeprofile-api&pivots=defender-for-container-arc#assign-a-custom-workspace) through Azure Policy.

If you disable the automatic installation of any component, you can easily deploy the component to one or more clusters by using the appropriate recommendation:

- Azure Policy add-on for Kubernetes: [Azure Kubernetes Service clusters should have the Azure Policy add-on for Kubernetes installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/08e628db-e2ed-4793-bc91-d13e684401c3)
- Azure Kubernetes Service profile: [Azure Kubernetes Service clusters should have Defender profile enabled](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9)
- Defender extension for Azure Arc-enabled Kubernetes: [Azure Arc-enabled Kubernetes clusters should have the Defender extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6)
- Azure Policy extension for Azure Arc-enabled Kubernetes: [Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/0642d770-b189-42ef-a2ce-9dcc3ec6c169)

Learn more about the [roles for provisioning Defender for Containers extensions](../permissions.md#roles-used-to-automatically-provision-agents-and-extensions).

## Prerequisites

Before you deploy the sensor, ensure that you:

- [Connect the Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).
- Complete the [prerequisites listed in the documentation for generic cluster extensions](/azure/azure-arc/kubernetes/extensions#prerequisites).

## Deploy the Defender sensor

You can deploy the Defender sensor by using a range of methods. For detailed steps, select the relevant tab.

### [Azure portal](#tab/k8s-deploy-asc)

### Use the Fix button from the Defender for Cloud recommendation

A dedicated Defender for Cloud recommendation provides:

- Visibility into which of your clusters has the Defender sensor deployed.
- A **Fix** button to deploy the sensor to clusters that don't have it.

To deploy the sensor:

1. On the Microsoft Defender for Cloud **Recommendations** page, open the **Enable enhanced security** security control.

1. Use the filter to find the recommendation named **Azure Arc-enabled Kubernetes clusters should have the Defender extension installed**.

    :::image type="content" source="../media/defender-for-kubernetes-azure-arc/extension-recommendation.png" alt-text="Screenshot that shows the Microsoft Defender for Cloud recommendation for deploying the Defender sensor for Azure Arc-enabled Kubernetes clusters." lightbox="../media/defender-for-kubernetes-azure-arc/extension-recommendation.png":::

    > [!TIP]
    > Notice the **Fix** icon in the **Actions** column.

1. Select the sensor to see the details of the healthy and unhealthy resources (clusters with and without the sensor).

1. In the list of unhealthy resources, select a cluster and then select **Remediate** to open the pane with the remediation options.

1. Select the relevant Log Analytics workspace, and then select **Remediate x resource**.

    :::image type="content" source="../media/defender-for-kubernetes-azure-arc/security-center-deploy-extension.gif" alt-text="Animated screenshot that shows deploying a Defender sensor for Azure Arc by using remediation in Defender for Cloud.":::

### [Azure CLI](#tab/k8s-deploy-cli)

### Use the Azure CLI to deploy the Defender sensor

1. Sign in to Azure:

    ```azurecli
    az login
    az account set --subscription <your-subscription-id>
    ```

    > [!IMPORTANT]
    > Ensure that you use the same subscription ID for `<your-subscription-id>` as the one that you used when connecting your cluster to Azure Arc.

1. Run the following command to deploy the sensor on top of your Azure Arc-enabled Kubernetes cluster:

    ```azurecli
    az k8s-extension create --name microsoft.azuredefender.kubernetes --cluster-type connectedClusters --cluster-name <cluster-name> --resource-group <resource-group> --extension-type microsoft.azuredefender.kubernetes
    ```

    Here are the supported configuration settings on the Defender sensor type:

    | Property | Description |
    |----------|-------------|
    | `logAnalyticsWorkspaceResourceID` | *Optional*. Full resource ID of your own Log Analytics workspace.<br>If you don't provide one, the default workspace of the region is used.<br><br>To get the full resource ID, run the following command to display the list of workspaces in your subscriptions in the default JSON format:<br>```az resource list --resource-type Microsoft.OperationalInsights/workspaces -o json```<br><br>The Log Analytics workspace resource ID has the following syntax:<br>`/subscriptions/{your-subscription-id}/resourceGroups/{your-resource-group}/providers/Microsoft.OperationalInsights/workspaces/{your-workspace-name}` <br>Learn more in [Log Analytics workspaces](/azure/azure-monitor/logs/log-analytics-workspace-overview). |
    | `auditLogPath` |*Optional*. Full path to the audit log files.<br>If you don't provide one, the default path `/var/log/kube-apiserver/audit.log` is used.<br>For AKS Engine, the standard path is `/var/log/kubeaudit/audit.log`. |

    The following command shows an example usage of all optional fields:

    ```azurecli
    az k8s-extension create --name microsoft.azuredefender.kubernetes --cluster-type connectedClusters --cluster-name <your-connected-cluster-name> --resource-group <your-rg> --extension-type microsoft.azuredefender.kubernetes --configuration-settings logAnalyticsWorkspaceResourceID=<log-analytics-workspace-resource-id> auditLogPath=<your-auditlog-path>
    ```

### [Resource Manager](#tab/k8s-deploy-resource-manager)

### Use Azure Resource Manager to deploy the Defender sensor

To use Azure Resource Manager to deploy the Defender sensor, you need a Log Analytics workspace on your subscription. Learn more in [Log Analytics workspaces](/azure/azure-monitor/logs/log-analytics-workspace-overview).

You can use the **azure-defender-extension-arm-template.json** Resource Manager template from the Defender for Cloud [installation examples](https://aka.ms/kubernetes-extension-installation-examples).

> [!TIP]
> If you're new to Resource Manager templates, start here: [What are Azure Resource Manager templates?](/azure/azure-resource-manager/templates/overview).

### [REST API](#tab/k8s-deploy-api)

### Use the REST API to deploy the Defender sensor

To use the REST API to deploy the Defender sensor, you need a Log Analytics workspace on your subscription. Learn more in [Log Analytics workspaces](/azure/azure-monitor/logs/log-analytics-workspace-overview).

To manually deploy the sensor by using the REST API, run the following `PUT` command:

```rest
PUT https://management.azure.com/subscriptions/{{Subscription ID}}/resourcegroups/{{Resource Group}}/providers/Microsoft.Kubernetes/connectedClusters/{{Cluster Name}}/providers/Microsoft.KubernetesConfiguration/extensions/microsoft.azuredefender.kubernetes?api-version=2020-07-01-preview
```

The command includes these placeholders:

| Name            | In   | Required | Type   | Description   |
|-----------------|------|----------|--------|---------------|
| `Subscription ID` | Path | True     | String | Your Azure Arc-enabled Kubernetes resource's subscription ID  |
| `Resource Group`   | Path | True     | String | Name of the resource group that contains your Azure Arc-enabled Kubernetes resource |
| `Cluster Name`    | Path | True     | String | Name of your Azure Arc-enabled Kubernetes resource  |

For **Authentication**, your header must have a bearer token (as with other Azure APIs). To get a bearer token, run the following command:

`az account get-access-token --subscription <your-subscription-id>`

Use the following structure for the body of your message:

```json
{ 
"properties": { 
    "extensionType": "microsoft.azuredefender.kubernetes",
"con    figurationSettings": { 
        "logAnalytics.workspaceId":"YOUR-WORKSPACE-ID"
    // ,    "auditLogPath":"PATH/TO/AUDITLOG"
    },
    "configurationProtectedSettings": {
        "logAnalytics.key":"YOUR-WORKSPACE-KEY"
    }
    }
} 
```

The message body includes these properties:

| Property | Description |
| -------- | ----------- |
| `logAnalytics.workspaceId` | Workspace ID of the Log Analytics resource. |
| `logAnalytics.key`         | Key of the Log Analytics resource. |
| `auditLogPath `            | *Optional*. Full path to the audit log files. The default value is `/var/log/kube-apiserver/audit.log`. |

---

## Verify the deployment

To verify that your cluster has the Defender sensor installed on it, follow the steps on one of the following tabs:

### [Azure portal - Defender for Cloud](#tab/k8s-verify-asc)

### Use Defender for Cloud recommendations to verify the status of your sensor

1. On the Microsoft Defender for Cloud **Recommendations** page, open the  **Enable Microsoft Defender for Cloud** security control.

1. Select the recommendation named **Azure Arc-enabled Kubernetes clusters should have the Defender extension installed**.

    :::image type="content" source="../media/defender-for-kubernetes-azure-arc/extension-recommendation.png" alt-text="Screenshot that shows the Defender for Cloud recommendation for deploying the Defender sensor for Azure Arc-enabled Kubernetes clusters." lightbox="../media/defender-for-kubernetes-azure-arc/extension-recommendation.png":::

1. Check that the cluster on which you deployed the sensor is listed as **Healthy**.

### [Azure portal - Azure Arc](#tab/k8s-verify-arc)

### Use the Azure Arc pages to verify the status of your sensor

1. In the Azure portal, open **Azure Arc**.
1. In the infrastructure list, select **Kubernetes clusters**, and then select the specific cluster.
1. Open the **Extensions** page. The page lists the extensions on the cluster. To confirm whether the Defender sensor was installed correctly, check the **Install status** column.

    :::image type="content" source="../media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png" alt-text="Screenshot that shows the Azure Arc page for checking the status of all installed extensions on a Kubernetes cluster." lightbox="../media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png":::

1. For more details, select the extension.

    :::image type="content" source="../media/defender-for-kubernetes-azure-arc/extension-details-page.png" alt-text="Screenshot that shows full details of an Azure Arc extension on a Kubernetes cluster.":::

### [Azure CLI](#tab/k8s-verify-cli)

### Use the Azure CLI to verify that the sensor is deployed

1. Run the following command in the Azure CLI:

    ```azurecli
    az k8s-extension show --cluster-type connectedClusters --cluster-name <your-connected-cluster-name> --resource-group <your-rg> --name microsoft.azuredefender.kubernetes
    ```

1. In the response, look for `"extensionType": "microsoft.azuredefender.kubernetes"` and `"installState": "Installed"`.

    > [!NOTE]
    > The response might show `"installState": "Pending"` for the first few minutes.

1. If the state shows `Installed`, run the following command on your machine with the `kubeconfig` file pointed to your cluster to check that all pods under the `mdc` namespace are in the `Running` state:

    ```console
    kubectl get pods -n mdc
    ```

### [REST API](#tab/k8s-verify-api)

### Use the REST API to verify that the sensor is deployed

To confirm a successful deployment, or to validate the status of your sensor at any time:

1. Run the following `GET` command:

    ```rest
    GET https://management.azure.com/subscriptions/{{Subscription Id}}/resourcegroups/{{Resource Group}}/providers/Microsoft.Kubernetes/connectedClusters/{{Cluster Name}}/providers/Microsoft.KubernetesConfiguration/extensions/microsoft.azuredefender.kubernetes?api-version=2020-07-01-preview
    ```

1. In the response, look in `"extensionType": "microsoft.azuredefender.kubernetes"` for `"installState": "Installed"`.

    > [!TIP]
    > The response might show `"installState": "Pending"` for the first few minutes.

1. If the state shows `Installed`, run the following command on your machine with the `kubeconfig` file pointed to your cluster, to check that all pods under the `mdc` namespace are in the `Running` state:

    ```console
    kubectl get pods -n mdc
    ```

---
