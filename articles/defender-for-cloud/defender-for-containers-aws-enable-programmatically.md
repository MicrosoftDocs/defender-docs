---
title: Deploy Defender for Containers Components on AWS (EKS) Programmatically
description: Learn how to deploy Microsoft Defender for Containers components on Amazon EKS clusters using CLI, REST API, and automation tools.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers components on AWS (EKS) programmatically

This article explains how to deploy Defender for Containers components on your Amazon EKS clusters by using command-line tools, APIs, and automation methods.

## Article contents

Jump to the deployment method you need:

- [Enable Defender plan](#enable-defender-for-containers-plan)
  - Azure CLI
  - REST API
- [Create AWS connector](#create-aws-connector)
  - Azure CLI
  - CloudFormation
- [Deploy Arc and extensions](#deploy-arc-and-defender-extensions)
  - [Connect EKS to Azure Arc](#connect-eks-to-azure-arc)
  - [Deploy Defender sensor](#deploy-defender-sensor)
  - [Deploy Azure Policy extension](#deploy-azure-policy-extension)
- [Configure agentless features](#configure-agentless-features)
  - REST API
  - Azure CLI
- [Batch deployment](#batch-deployment-with-scripts)
  - PowerShell
  - Bash
- [Infrastructure as Code](#deploy-using-infrastructure-as-code)
  - ARM Template
  - Terraform

> [!TIP]
> For a guided portal experience, see [Enable all components via portal](defender-for-containers-aws-enable-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Required tools:

- Azure CLI (version 2.40.0 or later)
- AWS CLI configured with appropriate credentials
- `kubectl` configured for your EKS clusters
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
    --subplan "DefenderForContainersGke,DefenderForContainersEks"
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
      "subPlan": "DefenderForContainersEks"
    }
  }'
```

---

## Create AWS connector

### [Azure CLI](#tab/azure-cli-connector)

```azurecli
# Create resource group
az group create --name "DefenderForContainers-RG" --location "eastus"

# Create AWS connector
az security aws-connector create \
    --connector-name "my-aws-connector" \
    --resource-group "DefenderForContainers-RG" \
    --aws-account-id "<aws-account-id>" \
    --offerings '{
      {
        "offeringType": "DefenderForContainersEks",
        "kubernetesService": {
          "cloudRoleArn": "arn:aws:iam::{accountId}:role/DefenderForCloud-Containers-K8s"
        },
        "kubernetesDataCollection": {
          "cloudRoleArn": "arn:aws:iam::{accountId}:role/DefenderForCloud-DataCollection"
        },
        "containerVulnerabilityAssessment": {
          "cloudRoleArn": "arn:aws:iam::{accountId}:role/DefenderForCloud-ContainerVulnerabilityAssessment"
        }
      }
    }'
```

### [CloudFormation](#tab/cloudformation)

Create IAM roles with CloudFormation:

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: 'Microsoft Defender for Containers - EKS IAM Roles'

Resources:
  DefenderContainersRole:
    Type: AWS::IAM::Role
    Properties:
      RoleName: DefenderForCloud-Containers-K8s
      AssumeRolePolicyDocument:
        Version: '2012-10-17'
        Statement:
          - Effect: Allow
            Principal:
              AWS: !Sub 'arn:aws:iam::${AWS::AccountId}:root'
            Action: 'sts:AssumeRole'
            Condition:
              StringEquals:
                'sts:ExternalId': !Ref ExternalId
      ManagedPolicyArns:
        - arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
        - arn:aws:iam::aws:policy/AmazonEKSServicePolicy
      Policies:
        - PolicyName: DefenderContainersPolicy
          PolicyDocument:
            Version: '2012-10-17'
            Statement:
              - Effect: Allow
                Action:
                  - eks:ListClusters
                  - eks:DescribeCluster
                  - ecr:GetAuthorizationToken
                  - ecr:BatchCheckLayerAvailability
                  - ecr:GetDownloadUrlForLayer
                  - ecr:DescribeRepositories
                  - ecr:ListImages
                  - ecr:DescribeImages
                Resource: '*'

Parameters:
  ExternalId:
    Type: String
    Description: External ID from Microsoft Defender for Cloud
```

Deploy the CloudFormation stack:

```bash
aws cloudformation create-stack \
  --stack-name DefenderForContainers \
  --template-body file://defender-roles.yaml \
  --parameters ParameterKey=ExternalId,ParameterValue=<external-id> \
  --capabilities CAPABILITY_NAMED_IAM
```

---

## Deploy Arc and Defender extensions

### Connect EKS to Azure Arc

### [Azure CLI](#tab/azure-cli-arc)

```bash
# Set variables
CLUSTER_NAME="my-eks-cluster"
RESOURCE_GROUP="DefenderForContainers-RG"
REGION="eastus"

# Connect cluster to Arc
az connectedk8s connect \
    --name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $REGION \
    --tags "Environment=Production" "Team=Security"

# Verify connection
az connectedk8s show \
    --name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

### [Script](#tab/script-arc)

```bash
# Connect multiple clusters
for cluster in cluster1 cluster2 cluster3; do
    aws eks update-kubeconfig --name $cluster
    az connectedk8s connect \
        --name $cluster \
        --resource-group $RESOURCE_GROUP \
        --location $REGION
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

### [REST API](#tab/rest-api-sensor)

```bash
curl -X PUT \
  "https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Kubernetes/connectedClusters/{clusterName}/providers/Microsoft.KubernetesConfiguration/extensions/microsoft-defender?api-version=2022-11-01" \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "extensionType": "microsoft.azuredefender.kubernetes",
      "configurationSettings": {
        "logAnalyticsWorkspaceResourceID": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}"
      }
    }
  }'
```

### [Helm](#tab/helm-sensor)

#### Option 1: Using the installation script

The following script installs the Defender for Containers sensor and removes any existing deployment if one exists:

[install_defender_sensor_mc.sh](https://gist.github.com/matannov/00c0bc43f63280f5cf30736b38a54678)

Set your kubeconfig context to the target cluster, and run the script with the command:

```bash
install_defender_sensor_mc.sh <SECURITY_CONNECTOR_AZURE_RESOURCE_ID> <RELEASE_TRAIN> <VERSION> <DISTRIBUTION> [<ARC_CLUSTER_RESOURCE_ID>]
```

In the following command, replace the placeholder text `<SECURITY_CONNECTOR_AZURE_RESOURCE_ID>`, `<RELEASE_TRAIN>`, `<VERSION>`, `<DISTRIBUTION>`, and `<ARC_CLUSTER_RESOURCE_ID>` with your own values. ARC_CLUSTER_RESOURCE_ID is an optional parameter for existing clusters that use the Defender for Containers arc extension and want to provision the sensor via Helm.

For `<SECURITY_CONNECTOR_AZURE_RESOURCE_ID>`:

- Set up a security connector for your AWS account

  > [!NOTE]
  > To install the Helm chart on an EKS cluster, make sure the cluster account is connected to Microsoft Defender for Cloud. See [Connect your AWS account](quickstart-onboard-aws.md).

- Get its Azure resource ID

  > [!NOTE]
  > To install the Helm chart on an EKS cluster, you need the security connector resource ID for the account your cluster belongs to. Run the [az resource show](/cli/azure/resource#az-resource-show) CLI command to get this value.
  >
  >For example:
  >
  >```azurecli
  >az resource show \
  >  --name <connector-name> \
  >  --resource-group <resource-group-name> \
  >  --resource-type "Microsoft.Security/securityConnectors" \
  >  --subscription <subscription-id> \
  >  --query id -o tsv
  >```
  >
  >In this example, replace the placeholder text `<connector-name>`, `<resource-group-name>`, and `<subscription-id>` with your values.

Use `public` for the public preview releases (0.9.x). For `<VERSION>`, use `latest` or a specific semantic version. For `<DISTRIBUTION>`, use `eks`.

> [!NOTE]
> This script might create a Log Analytics workspace in your Azure account.

#### Option 2: Using standard Helm commands

```bash
# Add Defender Helm repository
helm repo add mdc https://azuredefender.azurecr.io/helm/v1/repo
helm repo update

# Install Defender sensor
helm install defender-sensor mdc/azuredefender \
    --namespace mdc \
    --create-namespace \
    --set cluster.name=$CLUSTER_NAME \
    --set azure.workspaceId=<workspace-id> \
    --set azure.workspaceKey=<workspace-key>
```

After deploying the Defender sensor with Helm, you can configure additional settings and manage your deployment. For more information, see [Configure Defender for Containers sensor deployed with Helm](deploy-helm.md).

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

### [REST API](#tab/rest-api-agentless)

```bash
curl -X PATCH \
  "https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Security/securityConnectors/{connectorName}?api-version=2024-01-01" \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "offerings": [{
        "offeringType": "DefenderForContainersEks",
        "kubernetesService": {
          "enabled": true
        }
      }]
    }
  }'
```

### [Azure CLI](#tab/azure-cli-agentless)

```azurecli
# Update connector with agentless settings
az security aws-connector update \
    --connector-name "my-aws-connector" \
    --resource-group "DefenderForContainers-RG" \
    --offerings '{
      {
        "offeringType": "DefenderForContainersEks",
        "kubernetesService": {
          "enabled": true
        }
      }
    }'
```

---

## Batch deployment with scripts

### [PowerShell](#tab/powershell-batch)

```powershell
# Deploy to multiple EKS clusters
$clusters = @("cluster1", "cluster2", "cluster3")
$resourceGroup = "DefenderForContainers-RG"

foreach ($cluster in $clusters) {
    # Update kubeconfig
    aws eks update-kubeconfig --name $cluster
    
    # Connect to Arc
    az connectedk8s connect `
        --name $cluster `
        --resource-group $resourceGroup `
        --location eastus
    
    # Install extensions
    az k8s-extension create `
        --name microsoft-defender `
        --extension-type microsoft.azuredefender.kubernetes `
        --cluster-type connectedClusters `
        --cluster-name $cluster `
        --resource-group $resourceGroup
}
```

### [Bash](#tab/bash-batch)

```bash
#!/bin/bash
# deploy-defender-eks.sh

RESOURCE_GROUP="DefenderForContainers-RG"
WORKSPACE_ID="<workspace-id>"

# Function to deploy Defender to a cluster
deploy_defender() {
    local cluster_name=$1
    local region=$2
    
    echo "Deploying to cluster: $cluster_name"
    
    # Update kubeconfig
    aws eks update-kubeconfig --name $cluster_name --region $region
    
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
}

# Deploy to all clusters
deploy_defender "prod-eks-cluster" "us-east-1"
deploy_defender "dev-eks-cluster" "us-west-2"
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
    }
  },
  "resources": [
    {
      "type": "Microsoft.Kubernetes/connectedClusters/providers/extensions",
      "apiVersion": "2022-11-01",
      "name": "[concat(parameters('clusterName'), '/Microsoft.KubernetesConfiguration/microsoft-defender')]",
      "properties": {
        "extensionType": "microsoft.azuredefender.kubernetes",
        "configurationSettings": {
          "logAnalyticsWorkspaceResourceID": "[resourceId('Microsoft.OperationalInsights/workspaces', 'defaultWorkspace')]"
        }
      }
    }
  ]
}
```

Deploy the template:

```azurecli
az deployment group create \
    --resource-group DefenderForContainers-RG \
    --template-file defender-extension.json \
    --parameters clusterName=my-eks-cluster location=eastus
```

### [Terraform](#tab/terraform)

```hcl
# Configure Defender for Containers
resource "azurerm_security_center_subscription_pricing" "containers" {
  tier          = "Standard"
  resource_type = "Containers"
  subplan       = "DefenderForContainersEks"
}

# Create AWS connector
resource "azurerm_security_center_aws_connector" "example" {
  name                = "example-aws-connector"
  aws_account_id      = var.aws_account_id
  resource_group_name = azurerm_resource_group.example.name

  offering {
    type = "DefenderForContainersEks"
    
    kubernetes_service {
      cloud_role_arn = "arn:aws:iam::${var.aws_account_id}:role/DefenderForCloud-Containers-K8s"
    }
    
    kubernetes_data_collection {
      cloud_role_arn = "arn:aws:iam::${var.aws_account_id}:role/DefenderForCloud-DataCollection"
    }
  }
}
```

---

## Next steps

- [Verify deployment](defender-for-containers-aws-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-aws-configure.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md)
- [Deploy sensor using Helm for more control](deploy-helm.md)
