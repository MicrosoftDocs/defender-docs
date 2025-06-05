---
title: Deploy Defender for Containers on Azure (AKS)
description: Learn how to enable Microsoft Defender for Containers on Azure Kubernetes Service (AKS) clusters using various deployment methods.
ms.topic: how-to
ms.date: 06/04/2025
ms.custom: devx-track-azurecli
---

# Deploy Defender for Containers on Azure (AKS)

This article explains how to enable Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters using Azure CLI, PowerShell, or ARM templates.

> [!TIP]
> For Azure portal deployment instructions, see [Deploy Defender for Containers on Azure (AKS) using Azure portal](defender-for-containers-azure-deploy-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

## Enable Defender for Containers

Choose your preferred deployment method:

### [Azure CLI](#tab/azure-cli)

```azurecli
# Enable Defender for Containers on a subscription
az security pricing create \
    --name 'Containers' \
    --tier 'Standard'

# Enable all extensions
az security pricing extension create \
    --name 'Containers' \
    --pricing-tier 'Standard' \
    --extension-name 'AgentlessDiscoveryForKubernetes' \
    --extension-value '{"enabled":"true"}'

az security pricing extension create \
    --name 'Containers' \
    --pricing-tier 'Standard' \
    --extension-name 'ContainerRegistriesVulnerabilityAssessments' \
    --extension-value '{"enabled":"true"}'
```

### [PowerShell](#tab/powershell)

```powershell
# Enable Defender for Containers
Set-AzSecurityPricing `
    -Name "Containers" `
    -PricingTier "Standard"

# Enable extensions
$extensions = @{
    "AgentlessDiscoveryForKubernetes" = @{"enabled" = "true"}
    "ContainerRegistriesVulnerabilityAssessments" = @{"enabled" = "true"}
}

foreach ($ext in $extensions.GetEnumerator()) {
    Set-AzSecurityPricingExtension `
        -Name "Containers" `
        -ExtensionName $ext.Key `
        -ExtensionValue ($ext.Value | ConvertTo-Json)
}
```

### [ARM template](#tab/arm-template)

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "resources": [
        {
            "type": "Microsoft.Security/pricings",
            "apiVersion": "2024-01-01",
            "name": "Containers",
            "properties": {
                "pricingTier": "Standard",
                "extensions": [
                    {
                        "name": "AgentlessDiscoveryForKubernetes",
                        "isEnabled": "true"
                    },
                    {
                        "name": "ContainerRegistriesVulnerabilityAssessments", 
                        "isEnabled": "true"
                    }
                ]
            }
        }
    ]
}
```

Deploy the template:

```azurecli
az deployment sub create \
    --location eastus \
    --template-file defender-containers.json
```

---

## Deploy the Defender sensor

After enabling Defender for Containers, the Defender sensor is automatically deployed to your AKS clusters through Azure Policy. This process typically takes 5-10 minutes.

### Monitor deployment status

```azurecli
# Check if the Defender extension is installed
az k8s-extension show \
    --name microsoft-defender \
    --cluster-type managedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group>
```

### Manual deployment (if needed)

If automatic deployment doesn't occur:

```azurecli
# Install the Defender extension manually
az k8s-extension create \
    --name microsoft-defender \
    --extension-type microsoft.azuredefender.kubernetes \
    --cluster-type managedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --configuration-settings \
        logAnalyticsWorkspaceResourceID=<workspace-resource-id> \
        auditLogPath=/var/log/kube-apiserver/audit.log
```

## Enable Azure Policy for Kubernetes

Azure Policy for Kubernetes is required for security recommendations:

```azurecli
# Enable Azure Policy add-on
az aks enable-addons \
    --addons azure-policy \
    --name <cluster-name> \
    --resource-group <resource-group>
```

## Configure diagnostic logs

Enable diagnostic logs for runtime threat detection:

```azurecli
# Create diagnostic setting
az monitor diagnostic-settings create \
    --name "AKS-Diagnostics" \
    --resource "/subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.ContainerService/managedClusters/<cluster-name>" \
    --logs '[
        {"category": "kube-apiserver", "enabled": true},
        {"category": "kube-audit", "enabled": true},
        {"category": "kube-controller-manager", "enabled": true},
        {"category": "kube-scheduler", "enabled": true},
        {"category": "guard", "enabled": true}
    ]' \
    --workspace <log-analytics-workspace-id>
```

## Assign a custom Log Analytics workspace (optional)

[!INCLUDE[defender-for-containers-assign-workspace-aks](includes/defender-for-containers-assign-workspace-aks.md)]

## Next steps

- [Verify your Defender for Containers deployment](defender-for-containers-azure-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-azure-configure.md)
- [Enable all components via portal](defender-for-containers-aks-enable-all-portal.md)