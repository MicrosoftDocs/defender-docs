---
title: Deploy Defender for Containers on GCP (GKE)
description: Learn how to enable Microsoft Defender for Containers on Google Kubernetes Engine (GKE) clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on GCP (GKE)

This article explains how to enable Microsoft Defender for Containers on your Google Kubernetes Engine (GKE) clusters.

## Prerequisites

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

- GKE cluster running version 1.19 or later
- GCP project with billing enabled
- Required GCP APIs enabled:
  - Kubernetes Engine API
  - Container Registry API
  - Cloud Resource Manager API
  - Cloud Asset API

## Create a GCP connector

### Using Azure portal

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

3. Select **Add environment** > **Google Cloud Platform**.

4. Enter the following details:
   - **Name**: A unique name for your connector
   - **Subscription**: Select your Azure subscription
   - **Resource Group**: Select or create a resource group
   - **Location**: Choose your preferred Azure region
   - **GCP project ID**: Your GCP project ID
   - **Service account key**: Upload the JSON key file

5. Select **Next: Configure access**.

### Configure GCP permissions

1. In your GCP console, create a service account:

    ```bash
    # Create service account
    gcloud iam service-accounts create defender-for-containers \
        --display-name="Defender for Containers"

    # Grant required roles
    gcloud projects add-iam-policy-binding PROJECT_ID \
        --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
        --role="roles/container.viewer"

    gcloud projects add-iam-policy-binding PROJECT_ID \
        --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
        --role="roles/containerregistry.ServiceAgent"

    gcloud projects add-iam-policy-binding PROJECT_ID \
        --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
        --role="roles/cloudasset.viewer"

    gcloud projects add-iam-policy-binding PROJECT_ID \
        --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
        --role="roles/artifactregistry.reader"

    # Create and download key
    gcloud iam service-accounts keys create key.json \
        --iam-account=defender-for-containers@PROJECT_ID.iam.gserviceaccount.com
    ```

1. Upload the key.json file in the Azure portal.

## Enable Defender for Containers

### Using Azure portal

1. In the connector creation wizard, navigate to **Select plans**.

1. Toggle **Containers** to **On**.

1. Configure the following settings:

   - **Agentless container vulnerability assessment**: On
   - **Agentless discovery for Kubernetes**: On
   - **Container registries vulnerability assessments**: On
   - **Runtime threat protection**: On

1. Select **Next: Review and create**.

### Using Azure CLI

```azurecli
# Create GCP connector
az security connector create \
    --name 'myGCPConnector' \
    --resource-group 'myResourceGroup' \
    --location 'eastus' \
    --offerings '[{
        "offeringType": "CspmMonitorGcp"
    }]' \
    --environment-data '{
        "environmentType": "GcpProject",
        "projectDetails": {
            "projectId": "my-gcp-project",
            "projectNumber": "123456789"
        }
    }'

# Enable Defender for Containers
az security pricing create \
    --name 'Containers' \
    --tier 'Standard' \
    --scope "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Security/securityConnectors/{connector-name}"
```

## Deploy the Defender sensor

The Defender sensor is automatically deployed to your GKE clusters after enabling the plan. If manual deployment is needed:

### Automatic deployment verification

```bash
# Check if the admission webhook is configured
kubectl get validatingwebhookconfigurations | grep defender

# Verify DaemonSet deployment
kubectl get daemonset -n kube-system | grep defender
```

### Manual deployment

```bash
# Get GKE cluster credentials
gcloud container clusters get-credentials CLUSTER_NAME \
    --zone ZONE \
    --project PROJECT_ID

# Download the deployment YAML
curl -o defender-sensor-gke.yaml https://aka.ms/defender-for-containers-sensor-gke

# Update the YAML with your workspace details
sed -i 's/WORKSPACE_ID/your-workspace-id/g' defender-sensor-gke.yaml
sed -i 's/WORKSPACE_KEY/your-workspace-key/g' defender-sensor-gke.yaml

# Deploy to your cluster
kubectl apply -f defender-sensor-gke.yaml
```

## Configure GKE-specific settings

### Enable Workload Identity

For enhanced security, configure Workload Identity:

```bash
# Enable Workload Identity on cluster
gcloud container clusters update CLUSTER_NAME \
    --workload-pool=PROJECT_ID.svc.id.goog

# Create Kubernetes service account
kubectl create serviceaccount defender-sa -n kube-system

# Bind to GCP service account
gcloud iam service-accounts add-iam-policy-binding \
    defender-for-containers@PROJECT_ID.iam.gserviceaccount.com \
    --role roles/iam.workloadIdentityUser \
    --member "serviceAccount:PROJECT_ID.svc.id.goog[kube-system/defender-sa]"

# Annotate Kubernetes service account
kubectl annotate serviceaccount defender-sa \
    -n kube-system \
    iam.gke.io/gcp-service-account=defender-for-containers@PROJECT_ID.iam.gserviceaccount.com
```

### Configure GCR/Artifact Registry scanning

Enable vulnerability scanning for your registries:

```bash
# For Artifact Registry
gcloud artifacts repositories update REPOSITORY \
    --location=LOCATION \
    --enable-vulnerability-scanning

# Grant permissions for scanning
gcloud projects add-iam-policy-binding PROJECT_ID \
    --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/artifactregistry.reader"
```

## Configure network settings

For private GKE clusters:

1. Configure Private Google Access:

    ```bash
    gcloud compute networks subnets update SUBNET_NAME \
        --region=REGION \
        --enable-private-ip-google-access
    ```

1. Configure firewall rules:

```bash
# Allow webhook traffic
gcloud compute firewall-rules create allow-defender-webhook \
    --allow tcp:443 \
    --source-ranges 10.0.0.0/8 \
    --target-tags gke-nodes
```

## Verify deployment

After deployment, verify all components are working:

```bash
# Check sensor status
kubectl get pods -n kube-system -l app=microsoft-defender

# Verify connectivity
kubectl logs -n kube-system -l app=microsoft-defender --tail=50

# Check for any errors
kubectl describe pods -n kube-system -l app=microsoft-defender
```

## Deploy using Infrastructure as Code

### Terraform example

```hcl
# Configure Defender for Containers on GCP
resource "azurerm_security_center_subscription_pricing" "containers" {
  tier          = "Standard"
  resource_type = "Containers"
  subplan       = "DefenderForContainersGke"
}

# Create GCP connector
resource "azurerm_security_center_gcp_connector" "example" {
  name                = "example-gcp-connector"
  resource_group_name = azurerm_resource_group.example.name
  project_id          = var.gcp_project_id
  
  offering {
    type = "DefenderForContainersGke"
    
    kubernetes_service {
      cloud_role_arn = google_service_account.defender.email
    }
    
    kubernetes_data_collection {
      cloud_role_arn = google_service_account.defender.email
    }
  }
}
```

### ARM template deployment

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
            "offeringType": "DefenderForContainersGke"
          }
        ]
      }
    }
  ]
}
```

## Next steps

- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md)
