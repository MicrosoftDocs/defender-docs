---
title: Deploy Defender for Containers on Azure (AKS) programmatically
description: Learn how to enable Microsoft Defender for Containers on Azure Kubernetes Service (AKS) clusters using CLI, PowerShell, or Infrastructure as Code.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on Azure (AKS) programmatically

This article describes how to enable Microsoft Defender for Containers on Azure Kubernetes Service (AKS) clusters using programmatic methods.

> [!TIP]
> For Azure portal deployment instructions, see [Deploy Defender for Containers on Azure (AKS) using Azure portal](defender-for-containers-azure-deploy-portal.md).

## Prerequisites

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

Additionally:
- Azure CLI or Azure PowerShell installed
- Appropriate permissions to create and modify AKS clusters
- Owner or Contributor role on the subscription

## Enable Defender for Containers

### [Azure CLI](#tab/azure-cli)

```azurecli
# Enable Defender for Containers on subscription
az security pricing create \
    --name Containers \
    --tier Standard

# Enable all components
az security auto-provisioning-setting update \
    --name ContainersSensor \
    --auto-provision On

az security auto-provisioning-setting update \
    --name ContainersVulnerabilityAssessment \
    --auto-provision On
```

### [PowerShell](#tab/powershell)

```powershell
# Enable Defender for Containers
Set-AzSecurityPricing `
    -Name "Containers" `
    -PricingTier "Standard"

# Enable auto-provisioning
Set-AzSecurityAutoProvisioningSetting `
    -Name "ContainersSensor" `
    -EnableAutoProvision

Set-AzSecurityAutoProvisioningSetting `
    -Name "ContainersVulnerabilityAssessment" `
    -EnableAutoProvision
```

### [ARM Template](#tab/arm)

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
                "subPlan": "DefenderForContainersAks"
            }
        }
    ]
}
```

---

## Deploy the Defender sensor

### [Azure CLI](#tab/azure-cli-deploy)

```azurecli
# Deploy to specific AKS cluster
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --enable-defender

# Deploy with monitoring enabled
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --enable-defender \
    --enable-azure-monitor-metrics
```

### [PowerShell](#tab/powershell-deploy)

```powershell
# Enable Defender on AKS cluster
$cluster = Get-AzAksCluster `
    -Name <cluster-name> `
    -ResourceGroupName <resource-group>

$cluster.SecurityProfile = @{
    Defender = @{
        LogAnalyticsWorkspaceResourceId = "/subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>"
        SecurityMonitoring = @{
            Enabled = $true
        }
    }
}

$cluster | Set-AzAksCluster
```

### [Helm](#tab/helm-deploy)

```bash
# Add Defender Helm repository
helm repo add defender https://aka.ms/defender-for-containers/helm
helm repo update

# Install Defender sensor
helm install microsoft-defender-sensor defender/microsoft-defender-sensor \
    --namespace mdc \
    --create-namespace \
    --set credentials.workspaceId=<WORKSPACE_ID> \
    --set credentials.workspaceKey=<WORKSPACE_KEY> \
    --set clusterName=<CLUSTER_NAME>
```

---

## Assign a custom Log Analytics workspace (optional)

To assign a custom workspace programmatically:

### [Azure CLI](#tab/azure-cli-workspace)

```azurecli
# Configure custom workspace
az aks update \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --workspace-resource-id "/subscriptions/<subscription-id>/resourceGroups/<workspace-rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>"
```

### [PowerShell](#tab/powershell-workspace)

```powershell
# Configure custom workspace
Set-AzAksCluster `
    -Name <cluster-name> `
    -ResourceGroupName <resource-group> `
    -WorkspaceResourceId "/subscriptions/<subscription-id>/resourceGroups/<workspace-rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>"
```

### [ARM Template](#tab/arm-workspace)

```json
{
    "type": "Microsoft.ContainerService/managedClusters",
    "apiVersion": "2024-01-01",
    "name": "[parameters('clusterName')]",
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
```

---

## Enable diagnostic logging

Configure diagnostic settings programmatically:

### [Azure CLI](#tab/azure-cli-diag)

```azurecli
# Create diagnostic setting
az monitor diagnostic-settings create \
    --name DefenderDiagnostics \
    --resource /subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.ContainerService/managedClusters/<cluster-name> \
    --logs '[
        {
            "category": "kube-audit-admin",
            "enabled": true
        },
        {
            "category": "guard",
            "enabled": true
        }
    ]' \
    --workspace /subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>
```

### [PowerShell](#tab/powershell-diag)

```powershell
# Configure diagnostic settings
$log = @()
$log += New-AzDiagnosticSettingLogSettingsObject `
    -Category "kube-audit-admin" `
    -Enabled $true

$log += New-AzDiagnosticSettingLogSettingsObject `
    -Category "guard" `
    -Enabled $true

New-AzDiagnosticSetting `
    -Name "DefenderDiagnostics" `
    -ResourceId "/subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.ContainerService/managedClusters/<cluster-name>" `
    -WorkspaceId "/subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>" `
    -Log $log
```

---

## Infrastructure as Code examples

### Terraform

```hcl
resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }

  microsoft_defender {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_security_center_subscription_pricing" "example" {
  tier          = "Standard"
  resource_type = "Containers"
  subplan       = "DefenderForContainersAks"
}
```

### Bicep

```bicep
resource aksCluster 'Microsoft.ContainerService/managedClusters@2024-01-01' = {
  name: clusterName
  location: location
  properties: {
    securityProfile: {
      defender: {
        logAnalyticsWorkspaceResourceId: workspaceId
        securityMonitoring: {
          enabled: true
        }
      }
    }
  }
}

resource defenderPricing 'Microsoft.Security/pricings@2024-01-01' = {
  name: 'Containers'
  properties: {
    pricingTier: 'Standard'
    subPlan: 'DefenderForContainersAks'
  }
}
```

## Batch deployment script

Deploy to multiple clusters:

```bash
#!/bin/bash
# Deploy Defender to all AKS clusters in subscription

# Get all AKS clusters
clusters=$(az aks list --query "[].{name:name, rg:resourceGroup}" -o tsv)

# Enable Defender on each cluster
while IFS=$'\t' read -r name rg; do
    echo "Enabling Defender on cluster: $name"
    az aks update \
        --name "$name" \
        --resource-group "$rg" \
        --enable-defender \
        --no-wait
done <<< "$clusters"
```

## Next steps

- [Verify deployment](defender-for-containers-azure-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-azure-configure.md)
- [Enable all components via portal](defender-for-containers-azure-enable-all-portal.md)