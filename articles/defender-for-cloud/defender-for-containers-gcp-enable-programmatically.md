---
title: Deploy Defender for Containers Components on GCP (GKE) Programmatically
description: Learn how to deploy Microsoft Defender for Containers components on GKE clusters using CLI, REST API, and automation tools.
ms.topic: how-to
ms.date: 06/04/2025
ai-usage: ai-assisted
---

# Deploy Defender for Containers components on GCP (GKE) programmatically

This article explains how to deploy Defender for Containers components on your Google Kubernetes Engine (GKE) clusters using command-line tools, APIs, and automation methods.

## Article contents

Jump to the deployment method you need:

- [Enable Defender plan](#enable-defender-for-containers-plan)
  - Azure CLI
  - REST API
- [Create GCP connector](#create-gcp-connector)
  - Azure CLI
  - REST API
- [Configure GCP permissions](#configure-gcp-permissions)
  - gcloud CLI
  - Service account setup
- [Deploy Arc and extensions](#deploy-arc-and-defender-extensions)
  - [Connect GKE to Azure Arc](#connect-gke-to-azure-arc)
  - [Deploy Defender sensor](#deploy-defender-sensor)
  - [Deploy Azure Policy extension](#deploy-azure-policy-extension)
- [Configure agentless features](#configure-agentless-features)
- [Batch deployment](#batch-deployment-with-scripts)
- [Infrastructure as Code](#deploy-using-infrastructure-as-code)
  - Terraform

> [!TIP]
> For a guided portal experience, see [Enable all components via portal](defender-for-containers-gcp-enable-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Required tools:

- Azure CLI (version 2.40.0 or later)
- gcloud CLI configured with appropriate credentials
- `kubectl` configured for your GKE clusters
- Helm 3 (for Kubernetes deployments)

## Enable Defender for Containers plan

### [Azure CLI](#tab/azure-cli)

```azurecli
# Set variables
SUBSCRIPTION_ID="<your-subscription-id>"

# Enable Defender for Containers
az security pricing create \
    --name "Containers" \
    --subscription $SUBSCRIPTION_ID \
    --tier "Standard"

# Configure components
az security pricing update \
    --name "Containers" \
    --subscription $SUBSCRIPTION_ID \
    --tier "Standard" \
    --subplan "DefenderForContainersGke"
```

### [REST API](#tab/rest-api)

```bash
# Enable the plan
curl -X PUT \
  "https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Security/pricings/Containers?api-version=2024-01-01" \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "pricingTier": "Standard",
      "subPlan": "DefenderForContainersGke"
    }
  }'
```

---

## Create GCP connector

### [Azure CLI](#tab/azure-cli-connector)

```azurecli
# Create resource group
az group create --name "DefenderForContainers-RG" --location "eastus"

# Create GCP connector
az security gcpconnector create \
    --connector-name "my-gcp-connector" \
    --resource-group "DefenderForContainers-RG" \
    --hierarchy-identifier "<project-id>" \
    --offerings '{
      {
        "offeringType": "DefenderForContainersGke",
        "nativeCloudConnection": {
          "serviceAccountEmailAddress": "microsoft-defender@<project-id>.iam.gserviceaccount.com",
          "workloadIdentityProviderId": "projects/<project-number>/locations/global/workloadIdentityPools/<pool-name>/providers/<provider-name>"
        },
        "dataPipelineNativeCloudConnection": {
          "serviceAccountEmailAddress": "microsoft-defender-data@<project-id>.iam.gserviceaccount.com",
          "workloadIdentityProviderId": "projects/<project-number>/locations/global/workloadIdentityPools/<pool-name>/providers/<provider-name>"
        }
      }
    }'
```

### [REST API](#tab/rest-api-connector)

```bash
curl -X PUT \
  "https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Security/securityConnectors/{connectorName}?api-version=2024-01-01" \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "hierarchyIdentifier": "<project-id>",
      "offerings": [{
        "offeringType": "DefenderForContainersGke",
        "nativeCloudConnection": {
          "serviceAccountEmailAddress": "microsoft-defender@<project-id>.iam.gserviceaccount.com",
          "workloadIdentityProviderId": "projects/<project-number>/locations/global/workloadIdentityPools/<pool-name>/providers/<provider-name>"
        }
      }]
    }
  }'
```

---

## Configure GCP permissions

### [gcloud CLI](#tab/gcloud)

```bash
# Set project
gcloud config set project <project-id>

# Create service account
gcloud iam service-accounts create microsoft-defender-containers \
    --display-name="Microsoft Defender for Containers"

# Assign roles
gcloud projects add-iam-policy-binding <project-id> \
    --member="serviceAccount:microsoft-defender-containers@<project-id>.iam.gserviceaccount.com" \
    --role="roles/container.viewer"

gcloud projects add-iam-policy-binding <project-id> \
    --member="serviceAccount:microsoft-defender-containers@<project-id>.iam.gserviceaccount.com" \
    --role="roles/securitycenter.admin"

# Enable APIs
gcloud services enable container.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable containeranalysis.googleapis.com
```

### [Script](#tab/script)

Create and run this setup script:

```bash
#!/bin/bash
# setup-gcp-defender.sh

PROJECT_ID="<project-id>"
SERVICE_ACCOUNT="microsoft-defender-containers"

# Create service account
gcloud iam service-accounts create $SERVICE_ACCOUNT \
    --project=$PROJECT_ID \
    --display-name="Microsoft Defender for Containers"

# Assign required roles
ROLES=(
    "roles/container.viewer"
    "roles/securitycenter.admin"
    "roles/artifactregistry.reader"
    "roles/containeranalysis.occurrences.viewer"
)

for role in "${ROLES[@]}"; do
    gcloud projects add-iam-policy-binding $PROJECT_ID \
        --member="serviceAccount:$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com" \
        --role="$role"
done

# Enable required APIs
APIS=(
    "container.googleapis.com"
    "cloudresourcemanager.googleapis.com"
    "containeranalysis.googleapis.com"
    "artifactregistry.googleapis.com"
)

for api in "${APIS[@]}"; do
    gcloud services enable $api --project=$PROJECT_ID
done

echo "Setup complete for project: $PROJECT_ID"
```

---

## Deploy Arc and Defender extensions

### Connect GKE to Azure Arc

### [Azure CLI](#tab/azure-cli-arc)

```bash
# Set variables
CLUSTER_NAME="my-gke-cluster"
RESOURCE_GROUP="DefenderForContainers-RG"
REGION="eastus"
GCP_ZONE="us-central1-a"

# Get cluster credentials
gcloud container clusters get-credentials $CLUSTER_NAME --zone $GCP_ZONE

# Connect to Arc
az connectedk8s connect \
    --name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $REGION \
    --tags "Environment=Production" "Provider=GCP"
```

### [Script](#tab/script-arc)

```bash
#!/bin/bash
# connect-gke-to-arc.sh

# Connect multiple GKE clusters to Arc
CLUSTERS=("prod-gke" "dev-gke" "staging-gke")
ZONES=("us-central1-a" "us-west1-b" "us-east1-c")
RESOURCE_GROUP="DefenderForContainers-RG"

for i in "${!CLUSTERS[@]}"; do
    cluster="${CLUSTERS[$i]}"
    zone="${ZONES[$i]}"
    
    echo "Connecting cluster: $cluster"
    
    # Get credentials
    gcloud container clusters get-credentials $cluster --zone $zone
    
    # Connect to Arc
    az connectedk8s connect \
        --name $cluster \
        --resource-group $RESOURCE_GROUP \
        --location eastus
done
```

---

### Deploy Defender sensor

### [Azure CLI](#tab/azure-cli-sensor)

```bash
# Install Defender extension
az k8s-extension create \
    --name microsoft-defender \
    --extension-type microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --configuration-settings \
        "logAnalyticsWorkspaceResourceID=/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}" \
        "auditLogPath=/var/log/kube-apiserver/audit.log"
```

### [Helm](#tab/helm-sensor)

```bash
# Add Defender Helm repository
helm repo add mdc https://azuredefender.azurecr.io/helm/v1/repo
helm repo update

# Create namespace
kubectl create namespace mdc

# Install Defender sensor
helm install microsoft-defender mdc/azuredefender \
    --namespace mdc \
    --set cluster.name=$CLUSTER_NAME \
    --set azure.workspaceId=<workspace-id> \
    --set azure.workspaceKey=<workspace-key> \
    --set cluster.distribution=gke
```

---

### Deploy Azure Policy extension

### [Azure CLI](#tab/azure-cli-policy)

```bash
# Install Azure Policy extension
az k8s-extension create \
    --name azurepolicy \
    --extension-type Microsoft.PolicyInsights \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

### [Helm](#tab/helm-policy)

```bash
# Install Azure Policy using Helm
helm repo add azure-policy https://raw.githubusercontent.com/Azure/azure-policy/master/extensions/policy-addon-kubernetes/helm-charts
helm repo update

helm install azure-policy-addon azure-policy/azure-policy-addon-arc-clusters \
    --namespace kube-system \
    --set azurepolicy.env.resourceid="/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Kubernetes/connectedClusters/{clusterName}"
```

---

## Configure agentless features

### Enable vulnerability scanning

```azurecli
# Update connector with vulnerability scanning
az security gcpconnector update \
    --connector-name "my-gcp-connector" \
    --resource-group "DefenderForContainers-RG" \
    --offerings '{
      {
        "offeringType": "DefenderForContainersGke",
        "containerVulnerabilityAssessment": {
          "enabled": true
        }
      }
    }'
```

### Enable audit log collection

```bash
# Enable audit logs on GKE
gcloud container clusters update $CLUSTER_NAME \
    --zone $GCP_ZONE \
    --enable-cloud-logging \
    --logging=SYSTEM,WORKLOAD,API_SERVER
```

## Batch deployment with scripts

### [PowerShell](#tab/powershell-batch)

```powershell
# Deploy to multiple GKE clusters
$clusters = @(
    @{Name="prod-gke"; Zone="us-central1-a"},
    @{Name="dev-gke"; Zone="us-west1-b"}
)

$resourceGroup = "DefenderForContainers-RG"

foreach ($cluster in $clusters) {
    Write-Host "Processing cluster: $($cluster.Name)"
    
    # Get credentials
    gcloud container clusters get-credentials $cluster.Name --zone $cluster.Zone
    
    # Connect to Arc
    az connectedk8s connect `
        --name $cluster.Name `
        --resource-group $resourceGroup `
        --location eastus
    
    # Install Defender extension
    az k8s-extension create `
        --name microsoft-defender `
        --extension-type microsoft.azuredefender.kubernetes `
        --cluster-type connectedClusters `
        --cluster-name $cluster.Name `
        --resource-group $resourceGroup
}
```

### [Bash](#tab/bash-batch)

```bash
#!/bin/bash
# deploy-defender-gke.sh

RESOURCE_GROUP="DefenderForContainers-RG"
WORKSPACE_ID="<workspace-id>"
PROJECT_ID="<project-id>"

# Function to deploy Defender to a GKE cluster
deploy_defender() {
    local cluster_name=$1
    local zone=$2
    
    echo "Deploying to cluster: $cluster_name"
    
    # Get credentials
    gcloud container clusters get-credentials $cluster_name --zone $zone
    
    # Connect to Arc
    az connectedk8s connect \
        --name $cluster_name \
        --resource-group $RESOURCE_GROUP \
        --location eastus
    
    # Install Defender extension
    az k8s-extension create \
        --name microsoft-defender \
        --extension-type microsoft.azuredefender.kubernetes \
        --cluster-type connectedClusters \
        --cluster-name $cluster_name \
        --resource-group $RESOURCE_GROUP \
        --configuration-settings \
            "logAnalyticsWorkspaceResourceID=$WORKSPACE_ID"
    
    # Enable audit logging
    gcloud container clusters update $cluster_name \
        --zone $zone \
        --enable-cloud-logging \
        --logging=SYSTEM,WORKLOAD,API_SERVER
}

# Deploy to all clusters
deploy_defender "prod-gke-cluster" "us-central1-a"
deploy_defender "dev-gke-cluster" "us-west1-b"
```

---

## Deploy using Infrastructure as Code

### [Terraform](#tab/terraform)

```hcl
# Configure Defender for Containers on GCP
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

# Enable Defender for Containers
resource "azurerm_security_center_subscription_pricing" "containers" {
  tier          = "Standard"
  resource_type = "Containers"
  subplan       = "DefenderForContainersGke"
}

# Create GCP connector
resource "azurerm_security_center_gcp_connector" "main" {
  name                = "gcp-connector"
  resource_group_name = azurerm_resource_group.main.name
  project_id          = var.gcp_project_id

  offering {
    type = "DefenderForContainersGke"
    
    native_cloud_connection {
      service_account_email = google_service_account.defender.email
      workload_identity_provider_id = google_iam_workload_identity_pool_provider.defender.name
    }
  }
}

# Create GCP service account
resource "google_service_account" "defender" {
  account_id   = "microsoft-defender-containers"
  display_name = "Microsoft Defender for Containers"
  project      = var.gcp_project_id
}

# Assign IAM roles
resource "google_project_iam_member" "defender_viewer" {
  project = var.gcp_project_id
  role    = "roles/container.viewer"
  member  = "serviceAccount:${google_service_account.defender.email}"
}

resource "google_project_iam_member" "defender_security" {
  project = var.gcp_project_id
  role    = "roles/securitycenter.admin"
  member  = "serviceAccount:${google_service_account.defender.email}"
}

# Enable required APIs
resource "google_project_service" "container" {
  project = var.gcp_project_id
  service = "container.googleapis.com"
}

resource "google_project_service" "containeranalysis" {
  project = var.gcp_project_id
  service = "containeranalysis.googleapis.com"
}
```

---

## Next steps

- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md)
- [Deploy sensor using Helm for more control](deploy-helm.md)
