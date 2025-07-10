---
title: Deploy Defender for Containers components on AWS (EKS) programmatically
description: Learn how to deploy Microsoft Defender for Containers components on Amazon EKS clusters using CLI, REST API, and automation tools.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers components on AWS (EKS) programmatically

This article explains how to deploy Defender for Containers components on your Amazon EKS clusters using command-line tools, APIs, and automation methods.

## Article contents

Jump to the deployment method you need:

- [Enable Defender plan](#enable-defender-for-containers-plan)
  - [Azure CLI](#using-azure-cli)
  - [REST API](#using-rest-api)
- [Create AWS connector](#create-aws-connector)
  - [Azure CLI](#using-azure-cli-1)
  - [CloudFormation](#using-cloudformation)
- [Deploy Arc and extensions](#deploy-arc-and-defender-extensions)
  - [Single cluster](#connect-eks-to-azure-arc)
  - [Multiple clusters](#batch-deployment-using-scripts)
- [Infrastructure as Code](#deploy-using-infrastructure-as-code)
  - [Terraform](#terraform-example)
  - [ARM Templates](#deploy-using-arm-templates)

> [!TIP]
> For a guided portal experience, see [Enable all components via portal](defender-for-containers-aws-enable-all-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Required tools:

- Azure CLI (version 2.40.0 or later)
- AWS CLI configured with appropriate credentials
- `kubectl` configured for your EKS clusters
- Helm 3 (for Kubernetes deployments)

## Enable Defender for Containers plan

### Using Azure CLI

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

### Using REST API

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

## Create AWS connector

### Using Azure CLI

```azurecli
# Create resource group
az group create --name "DefenderForContainers-RG" --location "eastus"

# Create AWS connector
az security aws-connector create \
    --connector-name "my-aws-connector" \
    --resource-group "DefenderForContainers-RG" \
    --aws-account-id "<aws-account-id>" \
    --offerings '[
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
    ]'
```

### Using CloudFormation

Create IAM roles using CloudFormation:

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

## Deploy Arc and Defender extensions

### Connect EKS to Azure Arc

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

### Deploy Defender sensor using CLI

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

### Deploy using Helm

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

## Deploy Azure Policy extension

```bash
# Install Azure Policy extension
az k8s-extension create \
    --name azurepolicy \
    --extension-type Microsoft.PolicyInsights \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

## Configure agentless features

### Enable agentless discovery using REST API

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

## Batch deployment using scripts

### PowerShell script for multiple clusters

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

### Bash script for automated deployment

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

## Deploy using ARM templates

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

## Deploy using Infrastructure as Code

### Terraform example

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

## Verify deployment

After deployment, verify components are running:

```bash
# Check Arc connection
az connectedk8s list --resource-group $RESOURCE_GROUP

# Check extensions
az k8s-extension list \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP

# Check pods
kubectl get pods -n mdc
kubectl get pods -n azurepolicy
```

## Next steps

- [Verify deployment](defender-for-containers-aws-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-aws-configure.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md)
