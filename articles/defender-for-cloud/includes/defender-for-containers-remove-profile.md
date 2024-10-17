---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 06/01/2023
ms.author: dacurwin
author: dcurwin
---
## Remove the Defender sensor

To remove this (or any) Defender for Cloud extension, it's not enough to turn off automatic provisioning:

- Enabling automatic provisioning potentially affects *existing* and *future* machines.
- Disabling automatic provisioning for an extension affects only the *future* machines. Nothing is uninstalled when you disable automatic provisioning.

> [!NOTE]
> To disable the Defender for Containers plan entirely, go to **Environment settings** and turn off **Microsoft Defender for Containers**.

Nevertheless, to ensure that the Defender for Containers components aren't automatically provisioned to your resources from now on, disable automatic provisioning of the extensions. Follow the instructions in [Configure auto provisioning for agents and extensions from Microsoft Defender for Cloud](../monitoring-components.md).

You can remove the extension by using the REST API or a Resource Manager template, as explained on the following tabs.

### [REST API](#tab/aks-removeprofile-api)

### Use the REST API to remove the Defender sensor from AKS

To remove the extension by using the REST API, run the following `PUT` command:

```rest
https://management.azure.com/subscriptions/{{SubscriptionId}}/resourcegroups/{{ResourceGroup}}/providers/Microsoft.ContainerService/managedClusters/{{ClusterName}}?api-version={{ApiVersion}}
```

The command includes these parameters:

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
                "securityMonitoring": {
                    "enabled": false
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

### [Azure CLI](#tab/k8s-remove-cli)

### Use the Azure CLI to remove the Defender sensor

1. Run the following commands:

    ```azurecli
    az login
    az account set --subscription <subscription-id>
    az aks update --disable-defender --resource-group <your-resource-group> --name <your-cluster-name>
    ```

    Removing the extension might take a few minutes.

1. To verify that you successfully removed the extension, run the following command:

    ```console
    kubectl get pods -n kube-system | grep microsoft-defender
    ```

    When the extension is removed, the `get pods` command doesn't return any pods. Deletion of the pods might take a few minutes.

### [Resource Manager](#tab/aks-removeprofile-resource-manager)

### Use Azure Resource Manager to remove the Defender sensor from AKS

To use Azure Resource Manager to remove the Defender sensor, you need a Log Analytics workspace on your subscription. Learn more in [Log Analytics workspaces](/azure/azure-monitor/logs/log-analytics-workspace-overview).

> [!TIP]
> If you're new to Resource Manager templates, start here: [What are Azure Resource Manager templates?](/azure/azure-resource-manager/templates/overview).

The relevant template and parameters to remove the Defender sensor from AKS are:

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
                "securityMonitoring": {
                    "enabled": false
                }
            }
        }
    }
}
```

---
