---
title: Deploy Defender for Containers on Azure (AKS) programmatically
description: Learn how to programmatically deploy Microsoft Defender for Containers components on AKS clusters using Azure CLI, REST API, and ARM templates.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Deploy Defender for Containers on Azure (AKS) programmatically

This article describes methods to programmatically deploy Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters.

> [!TIP]
> For a guided portal experience, see [Enable Defender for Containers via portal](defender-for-containers-azure-enable-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

Additionally, ensure you have:

- Azure CLI version 2.40.0 or later
- Appropriate RBAC permissions (Contributor or Security Admin)

## Enable Defender for Containers plan

To enable the Defender for Containers plan on your subscription, see [Enable Microsoft Defender for Cloud](connect-azure-subscription.md). You can enable the plan through the Azure portal, REST API, or Azure Policy.

## Deploy the Defender sensor

When you enable the Defender for Containers plan, the Defender sensor automatically deploys on your AKS clusters by default.

If automatic provisioning is disabled, or if you need to manually deploy the sensor, use one of the following methods.

### [Azure CLI](#tab/aks-cli)

To deploy the Defender sensor to a specific AKS cluster:

```azurecli
az aks update \
    --resource-group myResourceGroup \
    --name myAKSCluster \
    --enable-defender
```

To deploy with a custom Log Analytics workspace:

```azurecli
az aks update \
    --resource-group myResourceGroup \
    --name myAKSCluster \
    --enable-defender \
    --defender-config logAnalyticsWorkspaceResourceId=/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}
```

### [ARM template](#tab/aks-arm)

Deploy the following ARM template to enable the Defender sensor on an AKS cluster:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "clusterName": {
      "type": "string"
    },
    "location": {
      "type": "string"
    },
    "workspaceResourceId": {
      "type": "string"
    }
  },
  "resources": [
    {
      "type": "Microsoft.ContainerService/managedClusters",
      "apiVersion": "2023-01-01",
      "name": "[parameters('clusterName')]",
      "location": "[parameters('location')]",
      "properties": {
        "securityProfile": {
          "defender": {
            "logAnalyticsWorkspaceResourceId": "[parameters('workspaceResourceId')]",
            "securityMonitoring": {
              "enabled": true
            }
          }
        }
      }
    }
  ]
}
```

Deploy the template using the Azure CLI:

```azurecli
az deployment group create \
    --resource-group myResourceGroup \
    --template-file defender-aks.json \
    --parameters clusterName=myAKSCluster location=eastus workspaceResourceId=/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}
```

---

## Deploy Azure Policy add-on

The Azure Policy add-on for AKS enables you to apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner.

To enable the Azure Policy add-on:

```azurecli
az aks enable-addons \
    --addons azure-policy \
    --name myAKSCluster \
    --resource-group myResourceGroup
```

## Deploy components by using recommendations

You can also deploy capabilities manually by using Defender for Cloud recommendations:

| Sensor | Recommendation |
|--|--|
| Defender sensor for Kubernetes | [Azure Kubernetes Service clusters should have Defender profile enabled](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9) |
| Defender sensor for Azure Arc-enabled Kubernetes | [Azure Arc-enabled Kubernetes clusters should have the Defender extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6) |
| Azure Policy agent for Kubernetes | [Azure Kubernetes Service clusters should have the Azure Policy Add-on for Kubernetes installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/08e628db-e2ed-4793-bc91-d13e684401c3) |
| Azure Policy agent for Azure Arc-enabled Kubernetes | [Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/0642d770-b189-42ef-a2ce-9dcc3ec6c169) |

## Next steps

- [Verify deployment](defender-for-containers-azure-verify.md)
- [Configure advanced settings](defender-for-containers-azure-configure.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
