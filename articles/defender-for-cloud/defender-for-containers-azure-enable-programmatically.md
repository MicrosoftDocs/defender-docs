---
title: Deploy Defender for Containers on Azure (AKS) programmatically
description: Learn how to programmatically deploy Microsoft Defender for Containers components on AKS clusters using Azure CLI, REST API, and automation tools.
ms.topic: how-to
ms.date: 06/04/2025
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

> [!NOTE]
> When you enable the Defender for Containers plan, the Defender sensor is typically deployed automatically. Use the following methods for manual deployment only if the sensor isn't automatically deployed after plan enablement.

### Choose your deployment method

**AKS built-in addon:**
- Automatically provisioned and updated by Azure
- Managed through AKS security profile
- Simplest deployment option
- Updates handled automatically with AKS cluster updates

**Helm chart deployment:**
- Provides flexible deployment options for DevOps and infrastructure-as-code scenarios
- Allows integration into CI/CD pipelines
- Gives you control over sensor updates and versioning
- Supports both preview and GA versions
- Requires manual updates but offers more customization

### 1. AKS built-in addon

You can deploy the sensor through:

#### [Azure CLI](#tab/aks-cli)

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

#### [REST API](#tab/aks-rest)

```bash
# Set variables
SUBSCRIPTION_ID="<subscription-id>"
RG="<resource-group>"
CLUSTER="<cluster-name>"
TOKEN="<bearer-token>"
WORKSPACE_ID="/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}"

# Enable Defender sensor via REST API
curl -X PATCH \
  "https://management.azure.com/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RG}/providers/Microsoft.ContainerService/managedClusters/${CLUSTER}?api-version=2023-01-01" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "securityProfile": {
        "defender": {
          "logAnalyticsWorkspaceResourceId": "'${WORKSPACE_ID}'",
          "securityMonitoring": {
            "enabled": true
          }
        }
      }
    }
  }'
```

#### [Infrastructure as Code (IaC)](#tab/aks-iac)

##### ARM template

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

Deploy the template:

```azurecli
az deployment group create \
    --resource-group myResourceGroup \
    --template-file defender-aks.json \
    --parameters clusterName=myAKSCluster location=eastus workspaceResourceId=/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}
```

##### Bicep

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
  }
}

output clusterId string = aksCluster.id
```

##### Terraform

```hcl
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
}
```

---

### 2. Helm chart deployment

Unlike other options that are autoprovisioned and updated automatically, Helm lets you flexibly deploy the Defender sensor. This approach is especially useful in DevOps and infrastructure-as-code scenarios. With Helm, you can integrate deployment into CI/CD pipelines and control all sensor updates. You can also choose to receive preview and GA versions.

You can deploy the sensor by using:

#### [Installation script](#tab/helm-script)

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

#### [Manual Helm installation](#tab/helm-manual)

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

#### [Helm with custom values](#tab/helm-custom)

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

### Batch deployment of Defender sensor to multiple clusters

Use these scripts when you need to deploy the Defender sensor to multiple AKS clusters at once, such as during initial rollout or when onboarding multiple clusters to Defender for Containers.

#### [PowerShell](#tab/powershell-batch)

```powershell
# Deploy Defender sensor to all AKS clusters in subscription
$clusters = Get-AzAksCluster

foreach ($cluster in $clusters) {
    Write-Host "Enabling Defender sensor for cluster: $($cluster.Name)"
    
    # Enable Defender sensor
    az aks update `
        --resource-group $cluster.ResourceGroupName `
        --name $cluster.Name `
        --enable-defender
}
```

#### [Bash](#tab/bash-batch)

```bash
#!/bin/bash
# deploy-defender-sensor-batch.sh
# Deploys Defender sensor to multiple AKS clusters

# Get all AKS clusters
clusters=$(az aks list --query "[].{name:name, resourceGroup:resourceGroup}" -o tsv)

# Deploy Defender sensor to each cluster
while IFS=$'\t' read -r name rg; do
    echo "Enabling Defender sensor for cluster: $name"
    
    # Enable Defender sensor
    az aks update \
        --resource-group "$rg" \
        --name "$name" \
        --enable-defender
        
done <<< "$clusters"
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
  }
}

output clusterId string = aksCluster.id
```

### [Terraform](#tab/terraform)

```hcl
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
}
```

---

## Next steps

- [Verify deployment](defender-for-containers-azure-verify.md)
- [Configure advanced settings](defender-for-containers-azure-configure.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
