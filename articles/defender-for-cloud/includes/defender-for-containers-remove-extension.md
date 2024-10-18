---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 07/14/2022
ms.author: dacurwin
author: dcurwin
---
## Remove the Defender sensor

::: zone pivot="defender-for-container-arc"
To remove this (or any) Defender for Cloud extension, it's not enough to turn off automatic provisioning:

- Enabling automatic provisioning potentially affects *existing* and *future* machines.
- Disabling automatic provisioning for an extension affects only the *future* machines. Nothing is uninstalled when you disable automatic provisioning.

> [!NOTE]
> To disable the Defender for Containers plan entirely, go to **Environment settings** and turn off **Microsoft Defender for Containers**.

Nevertheless, to ensure that the Defender for Containers components aren't automatically provisioned to your resources from now on, disable automatic provisioning of the extensions. Follow the instructions in [Configure auto provisioning for agents and extensions from Microsoft Defender for Cloud](../monitoring-components.md).
::: zone-end

You can remove the extension by using Azure portal, the Azure CLI, or the REST API, as explained on the following tabs.

### [Azure portal - Arc](#tab/k8s-remove-arc)

### Use the Azure portal to remove the extension

1. In the Azure portal, open Azure Arc.
1. In the infrastructure list, select **Kubernetes clusters**, and then select the specific cluster.
1. Open the **Extensions** page, which lists extensions on the cluster.
1. Select the extension, and then select **Uninstall**.

    :::image type="content" source="../media/defender-for-kubernetes-azure-arc/extension-uninstall-clusters-page.png" alt-text="Screenshot that shows the button for uninstalling an extension from an Azure Arc-enabled Kubernetes cluster." lightbox="../media/defender-for-kubernetes-azure-arc/extension-uninstall-clusters-page.png":::

### [Azure CLI](#tab/k8s-remove-cli)

### Use the Azure CLI to remove the Defender sensor

1. Remove the Azure Arc extension for Microsoft Defender for Kubernetes by using the following commands:

    ```azurecli
    az login
    az account set --subscription <subscription-id>
    az k8s-extension delete --cluster-type connectedClusters --cluster-name <your-connected-cluster-name> --resource-group <your-rg> --name microsoft.azuredefender.kubernetes --yes
    ```

    Removing the extension might take a few minutes. We recommend that you wait before you try to verify that it was successful.

1. To verify that you successfully removed the extension, run the following commands:

    ```azurecli
    az k8s-extension show --cluster-type connectedClusters --cluster-name <your-connected-cluster-name> --resource-group <your-rg> --name microsoft.azuredefender.kubernetes
    ```

1. Validate that there are no pods under the `mdc` namespace on the cluster. Run the following command with the `kubeconfig` file pointed to your cluster:

    ```console
    kubectl get pods -n mdc
    ```

    Deletion of the pods might take a few minutes.

### [REST API](#tab/k8s-remove-api)

### Use the REST API to remove the Defender sensor

To remove the extension by using the REST API, run the following `DELETE` command:

```rest
DELETE https://management.azure.com/subscriptions/{{Subscription Id}}/resourcegroups/{{Resource Group}}/providers/Microsoft.Kubernetes/connectedClusters/{{Cluster Name}}/providers/Microsoft.KubernetesConfiguration/extensions/microsoft.azuredefender.kubernetes?api-version=2020-07-01-preview
```

The command includes these parameters:

| Name            | In   | Required | Type   | Description                                           |
|-----------------|------|----------|--------|-------------------------------------------------------|
| `Subscription ID` | Path | True     | String | Your Azure Arc-enabled Kubernetes cluster's subscription ID |
| `Resource Group`  | Path | True     | String | Your Azure Arc-enabled Kubernetes cluster's resource group  |
| `Cluster Name`    | Path | True     | String | Your Azure Arc-enabled Kubernetes cluster's name            |

For **Authentication**, your header must have a bearer token (as with other Azure APIs). To get a bearer token, run the following command:

```azurecli
az account get-access-token --subscription <your-subscription-id>
```

The request might take several minutes to complete.

---
