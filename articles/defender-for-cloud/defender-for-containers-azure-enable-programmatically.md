---
title: Deploy Defender for Containers on Azure (AKS) programmatically
description: Learn how to programmatically deploy Microsoft Defender for Containers components on AKS clusters using Azure CLI, REST API, and automation tools.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on Azure (AKS) programmatically

This article provides methods to programmatically deploy Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters.

## Article contents

Jump to the deployment method you need:

- [Enable Defender plan](#enable-defender-for-containers-plan)
  - Azure CLI
  - REST API
  - PowerShell
- [Deploy Defender sensor](#deploy-the-defender-sensor)
  - AKS built-in method
  - Helm deployment
- [Deploy Azure Policy add-on](#deploy-azure-policy-add-on)
  - Azure CLI
  - REST API
- [Configure components](#configure-specific-components)
  - Enable/disable specific features
  - Custom workspace configuration
- [Batch deployment](#batch-deployment-with-scripts)
  - PowerShell script
  - Bash script
- [Infrastructure as Code](#deploy-using-infrastructure-as-code)
  - ARM template
  - Bicep
  - Terraform

> [!TIP]
> For a guided portal experience, see [Enable Defender for Containers via portal](defender-for-containers-azure-enable-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

Additionally, ensure you have:

- Azure CLI version 2.40.0 or later
- Appropriate RBAC permissions (Contributor or Security Admin)
- Access to AKS cluster kubeconfig (for Helm deployments)

## Enable Defender for Containers plan

### [Azure CLI](#tab/azure-cli)

```azurecli
# Enable Defender for Containers on subscription
az security pricing create \
    --name 'Containers' \
    --tier 'Standard'

# Enable with all components
az security pricing update \
    --name 'Containers' \
    --tier 'Standard' \
    --subplan 'DefenderForContainersAks'
```

### [REST API](#tab/rest-api)

```bash
# Set variables
SUBSCRIPTION_ID="<subscription-id>"
TOKEN="<bearer-token>"

# Enable the plan
curl -X PUT \
  "https://management.azure.com/subscriptions/${SUBSCRIPTION_ID}/providers/Microsoft.Security/pricings/Containers?api-version=2024-01-01" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "pricingTier": "Standard",
      "subPlan": "DefenderForContainersAks",
      "extensions": [
        {
          "name": "AgentlessDiscoveryForKubernetes",
          "isEnabled": "True"
        },
        {
          "name": "ContainerRegistriesVulnerabilityAssessments",
          "isEnabled": "True"
        }
      ]
    }
  }'
```

### [PowerShell](#tab/powershell)

```powershell
# Enable Defender for Containers
Set-AzSecurityPricing `
    -Name "Containers" `
    -PricingTier "Standard"

# Configure components
$workspace = Get-AzOperationalInsightsWorkspace `
    -ResourceGroupName "myRG" `
    -Name "myWorkspace"

Set-AzSecurityWorkspaceSetting `
    -Name "default" `
    -Scope "/subscriptions/$subscriptionId" `
    -WorkspaceId $workspace.ResourceId
```

---

## Deploy the Defender sensor

### [AKS built-in method](#tab/aks-builtin)

```azurecli
# Deploy to specific cluster
az aks update \
    --resource-group myResourceGroup \
    --name myAKSCluster \
    --enable-defender

# Deploy with custom resource limits
az aks update \
    --resource-group myResourceGroup \
    --name myAKSCluster \
    --enable-defender \
    --defender-config logAnalyticsWorkspaceResourceId=/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}
```

### [Helm deployment](#tab/helm)

#### Option 1: Using the installation script

Download and use the installation script:

```bash
# Download the script
curl -o install_defender_sensor.sh https://aka.ms/mdc-aks-defender-install-script

# Make it executable
chmod +x install_defender_sensor.sh

# Run the installation
./install_defender_sensor.sh \
    --subscription-id <subscription-id> \
    --resource-group <resource-group> \
    --cluster-name <cluster-name> \
    --location <location>
```

#### Option 2: Manual Helm installation

```bash
# Add the Microsoft Defender Helm repository
helm repo add mdc https://azuredefender.azurecr.io/helm/v1/repo
helm repo update

# Create namespace
kubectl create namespace mdc

# Install the Defender sensor
helm install microsoft-defender mdc/azuredefender \
    --namespace mdc \
    --set azure.subscriptionId=<subscription-id> \
    --set azure.resourceGroup=<resource-group> \
    --set azure.clusterName=<cluster-name> \
    --set azure.workspaceId=<workspace-id> \
    --set azure.workspaceKey=<workspace-key>
```

#### Option 3: Helm with custom values

Create a `values.yaml` file:

```yaml
azure:
  subscriptionId: "<subscription-id>"
  resourceGroup: "<resource-group>"
  clusterName: "<cluster-name>"
  workspaceId: "<workspace-id>"
  workspaceKey: "<workspace-key>"

resources:
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 200m
    memory: 256Mi

nodeSelector:
  kubernetes.io/os: linux

tolerations:
  - key: "node-role.kubernetes.io/master"
    effect: "NoSchedule"
```

Deploy with custom values:

```bash
helm install microsoft-defender mdc/azuredefender \
    --namespace mdc \
    --create-namespace \
    -f values.yaml
```

---

## Deploy Azure Policy add-on

### [Azure CLI](#tab/azure-cli-policy)

```azurecli
# Enable Azure Policy add-on for AKS
az aks enable-addons \
    --addons azure-policy \
    --name myAKSCluster \
    --resource-group myResourceGroup

# Verify installation
az aks show \
    --name myAKSCluster \
    --resource-group myResourceGroup \
    --query addonProfiles.azurepolicy
```

### [REST API](#tab/rest-api-policy)

```bash
# Enable Azure Policy add-on
curl -X PATCH \
  "https://management.azure.com/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RG}/providers/Microsoft.ContainerService/managedClusters/${CLUSTER}?api-version=2023-01-01" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "addonProfiles": {
        "azurepolicy": {
          "enabled": true
        }
      }
    }
  }'
```

---

## Configure specific components

### Enable only vulnerability scanning

```azurecli
# Configure to enable only vulnerability scanning
az security pricing update \
    --name 'Containers' \
    --tier 'Standard' \
    --subplan 'DefenderForContainersAks' \
    --extensions '{
      "name": "ContainerRegistriesVulnerabilityAssessments",
      "isEnabled": "True"
    },
    {
      "name": "AgentlessDiscoveryForKubernetes",
      "isEnabled": "False"
    }'
```

### Configure custom Log Analytics workspace

```azurecli
# Set custom workspace for Defender
az security workspace-setting create \
    --name 'default' \
    --target-workspace '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}'
```

### Exclude specific clusters with tags

```azurecli
# Add exclusion tag to AKS cluster
az aks update \
    --resource-group myResourceGroup \
    --name myAKSCluster \
    --tags "ms_defender_container_exclude_sensors=true"
```

## Batch deployment with scripts

### [PowerShell](#tab/powershell-batch)

```powershell
# Deploy Defender to all AKS clusters in subscription
$clusters = Get-AzAksCluster

foreach ($cluster in $clusters) {
    Write-Host "Enabling Defender for cluster: $($cluster.Name)"
    
    # Enable Defender
    az aks update `
        --resource-group $cluster.ResourceGroupName `
        --name $cluster.Name `
        --enable-defender
    
    # Enable Azure Policy
    az aks enable-addons `
        --addons azure-policy `
        --name $cluster.Name `
        --resource-group $cluster.ResourceGroupName
}
```

### [Bash](#tab/bash-batch)

```bash
#!/bin/bash
# deploy-defender-batch.sh

# Get all AKS clusters
clusters=$(az aks list --query "[].{name:name, resourceGroup:resourceGroup}" -o tsv)

# Deploy Defender to each cluster
while IFS=$'\t' read -r name rg; do
    echo "Enabling Defender for cluster: $name"
    
    # Enable Defender
    az aks update \
        --resource-group "$rg" \
        --name "$name" \
        --enable-defender
    
    # Enable Azure Policy
    az aks enable-addons \
        --addons azure-policy \
        --name "$name" \
        --resource-group "$rg"
        
done <<< "$clusters"
```

---

## Deploy using Infrastructure as Code

### [ARM Template](#tab/arm-template)

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
        },
        "addonProfiles": {
          "azurepolicy": {
            "enabled": true
          }
        }
      }
    }
  ]
}
```

Deploy the template:

```azurecli
az deployment group create \
    --resource-group myResourceGroup \
    --template-file defender-aks.json \
    --parameters clusterName=myAKSCluster location=eastus workspaceResourceId=/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}
```

### [Bicep](#tab/bicep)

```bicep
param clusterName string
param location string = resourceGroup().location
param workspaceResourceId string

resource aksCluster 'Microsoft.ContainerService/managedClusters@2023-01-01' = {
  name: clusterName
  location: location
  properties: {
    securityProfile: {
      defender: {
        logAnalyticsWorkspaceResourceId: workspaceResourceId
        securityMonitoring: {
          enabled: true
        }
      }
    }
    addonProfiles: {
      azurepolicy: {
        enabled: true
      }
    }
  }
}

output clusterId string = aksCluster.id
```

### [Terraform](#tab/terraform)

```hcl
# Enable Defender for Containers
resource "azurerm_security_center_subscription_pricing" "containers" {
  tier          = "Standard"
  resource_type = "Containers"
  subplan       = "DefenderForContainersAks"
}

# Configure AKS with Defender
resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  microsoft_defender {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id
  }

  azure_policy_enabled = true
}
```

---

## Next steps

- [Verify deployment](defender-for-containers-azure-verify.md)
- [Configure advanced settings](defender-for-containers-azure-configure.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
