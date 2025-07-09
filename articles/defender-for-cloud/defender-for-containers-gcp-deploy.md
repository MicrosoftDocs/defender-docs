---
title: Deploy Defender for Containers on GCP (GKE) programmatically
description: Learn how to enable Microsoft Defender for Containers on Google Kubernetes Engine (GKE) clusters using CLI, API, or Infrastructure as Code.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on GCP (GKE) programmatically

This article describes how to enable Microsoft Defender for Containers on Google Kubernetes Engine (GKE) clusters using programmatic methods.

> [!TIP]
> For Azure portal deployment instructions, see [Deploy Defender for Containers on GCP (GKE) using Azure portal](defender-for-containers-gcp-deploy-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additionally for GCP:
- gcloud CLI installed and configured
- Appropriate GCP project permissions
- Azure CLI installed for connector creation

## Create a GCP connector

### Using Azure CLI

```azurecli
# Create resource group for connector
az group create --name <resource-group> --location <location>

# Create GCP connector
az security connector create \
    --name <connector-name> \
    --resource-group <resource-group> \
    --hierarchy-identifier <gcp-project-id> \
    --environment-name GCP \
    --offerings "[{
        'offeringType': 'DefenderForContainersGke',
        'nativeCloudConnection': {
            'serviceAccountEmailAddress': 'microsoft-defender-containers@<project-id>.iam.gserviceaccount.com',
            'workloadIdentityProviderId': '<project-number>'
        }
    }]"
```

### Using REST API

```bash
curl -X PUT \
  "https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Security/securityConnectors/{connectorName}?api-version=2024-01-01" \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "hierarchyIdentifier": "{gcpProjectId}",
      "environmentName": "GCP",
      "offerings": [
        {
          "offeringType": "DefenderForContainersGke"
        }
      ]
    }
  }'
```

## Configure GCP permissions

### Create service account and assign roles

```bash
# Set project
export PROJECT_ID=<your-project-id>
gcloud config set project $PROJECT_ID

# Create service account
gcloud iam service-accounts create microsoft-defender-containers \
    --display-name="Microsoft Defender for Containers"

# Assign required roles
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:microsoft-defender-containers@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/container.viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:microsoft-defender-containers@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/containerregistry.ServiceAgent"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:microsoft-defender-containers@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/cloudasset.viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:microsoft-defender-containers@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/artifactregistry.reader"

# Create and download key
gcloud iam service-accounts keys create defender-key.json \
    --iam-account=microsoft-defender-containers@$PROJECT_ID.iam.gserviceaccount.com
```

### Configure Workload Identity Federation

```bash
# Create Workload Identity Pool
gcloud iam workload-identity-pools create defender-pool \
    --location="global" \
    --display-name="Defender for Containers Pool"

# Create provider
gcloud iam workload-identity-pools providers create-oidc defender-provider \
    --location="global" \
    --workload-identity-pool="defender-pool" \
    --issuer-uri="https://login.microsoftonline.com/<tenant-id>" \
    --allowed-audiences="api://AzureSecurityCenter"

# Grant access
gcloud iam service-accounts add-iam-policy-binding \
    microsoft-defender-containers@$PROJECT_ID.iam.gserviceaccount.com \
    --role="roles/iam.workloadIdentityUser" \
    --member="principalSet://iam.googleapis.com/projects/$PROJECT_NUMBER/locations/global/workloadIdentityPools/defender-pool/*"
```

## Enable Defender for Containers

### Using Azure CLI

```azurecli
# Enable Defender plan
az security pricing create \
    --name Containers \
    --tier Standard

# Update connector with offering details
az security connector update \
    --name <connector-name> \
    --resource-group <resource-group> \
    --offerings "[{
        'offeringType': 'DefenderForContainersGke',
        'nativeCloudConnection': {
            'serviceAccountEmailAddress': 'microsoft-defender-containers@<project-id>.iam.gserviceaccount.com',
            'workloadIdentityProviderId': 'projects/<project-number>/locations/global/workloadIdentityPools/defender-pool/providers/defender-provider'
        },
        'dataPipelineNativeCloudConnection': {
            'serviceAccountEmailAddress': 'microsoft-defender-containers@<project-id>.iam.gserviceaccount.com',
            'workloadIdentityProviderId': 'projects/<project-number>/locations/global/workloadIdentityPools/defender-pool/providers/defender-provider'
        },
        'auditLogsAutoProvisioningFlag': true,
        'defenderAgentAutoProvisioningFlag': true,
        'policyAgentAutoProvisioningFlag': true
    }]"
```

## Connect GKE clusters to Azure Arc

### Using gcloud and Azure CLI

```bash
# Get GKE cluster credentials
gcloud container clusters get-credentials <cluster-name> \
    --zone <zone> \
    --project $PROJECT_ID

# Connect to Azure Arc
az connectedk8s connect \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --location <location> \
    --tags "Datacenter=GCP" "Environment=Production"
```

### Batch connection script

```bash
#!/bin/bash
# Connect all GKE clusters to Azure Arc

# Get all GKE clusters
clusters=$(gcloud container clusters list --format="value(name,zone)")

# Connect each cluster
while IFS=$'\t' read -r name zone; do
    echo "Connecting cluster: $name"
    
    # Get credentials
    gcloud container clusters get-credentials "$name" --zone "$zone"
    
    # Connect to Arc
    az connectedk8s connect \
        --name "$name" \
        --resource-group <resource-group> \
        --location <location> \
        --no-wait
done <<< "$clusters"
```

## Deploy the Defender sensor

### Manual deployment

```bash
# Download deployment YAML
curl -o defender-sensor-gke.yaml https://aka.ms/defender-for-containers-sensor-gke

# Update with your workspace details
sed -i 's/WORKSPACE_ID/<your-workspace-id>/g' defender-sensor-gke.yaml
sed -i 's/WORKSPACE_KEY/<your-workspace-key>/g' defender-sensor-gke.yaml

# Deploy to cluster
kubectl apply -f defender-sensor-gke.yaml
```

### Using Helm

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
    --set clusterName=<CLUSTER_NAME> \
    --set gke.enabled=true
```

## Infrastructure as Code examples

### Terraform

```hcl
# Configure Defender for Containers on GCP
resource "azurerm_security_center_subscription_pricing" "containers" {
  tier          = "Standard"
  resource_type = "Containers"
  subplan       = "DefenderForContainersGke"
}

# Create GCP connector
resource "azurerm_security_center_connector" "gcp" {
  name                = "gcp-connector"
  resource_group_name = azurerm_resource_group.example.name
  hierarchy_identifier = var.gcp_project_id
  environment_name     = "GCP"
  
  offering {
    type = "DefenderForContainersGke"
    
    native_cloud_connection {
      service_account_email = "microsoft-defender-containers@${var.gcp_project_id}.iam.gserviceaccount.com"
      workload_identity_provider_id = "projects/${var.gcp_project_number}/locations/global/workloadIdentityPools/defender-pool/providers/defender-provider"
    }
  }
}
```

### ARM Template

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "connectorName": {
      "type": "string"
    },
    "gcpProjectId": {
      "type": "string"
    }
  },
  "resources": [
    {
      "type": "Microsoft.Security/securityConnectors",
      "apiVersion": "2024-01-01",
      "name": "[parameters('connectorName')]",
      "properties": {
        "hierarchyIdentifier": "[parameters('gcpProjectId')]",
        "environmentName": "GCP",
        "offerings": [
          {
            "offeringType": "DefenderForContainersGke",
            "auditLogsAutoProvisioningFlag": true,
            "defenderAgentAutoProvisioningFlag": true,
            "policyAgentAutoProvisioningFlag": true
          }
        ]
      }
    }
  ]
}
```

## Configure GKE Binary Authorization

```bash
# Create attestor
gcloud container binauthz attestors create defender-attestor \
    --attestation-authority-note=defender-note \
    --attestation-authority-note-project=$PROJECT_ID

# Create policy
cat > binary-auth-policy.yaml <<EOF
admissionWhitelistPatterns:
- namePattern: gcr.io/$PROJECT_ID/*
defaultAdmissionRule:
  evaluationMode: REQUIRE_ATTESTATION
  enforcementMode: ENFORCED_BLOCK_AND_AUDIT_LOG
  requireAttestationsBy:
  - projects/$PROJECT_ID/attestors/defender-attestor
EOF

# Apply policy
gcloud container binauthz policy import binary-auth-policy.yaml
```

## Next steps

- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
- [Deploy via portal](defender-for-containers-gcp-deploy-portal.md)
