---
title: Deploy Defender for Containers Components on AWS (EKS) Programmatically
description: Learn how to deploy Microsoft Defender for Containers components on Amazon EKS clusters using Azure CLI and ARM templates.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Deploy Defender for Containers components on AWS (EKS) programmatically

This article explains how to deploy Defender for Containers components on your Amazon EKS clusters by using command-line tools and automation methods.

> [!TIP]
> For a guided portal experience, see [Enable all components via portal](defender-for-containers-aws-enable-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Required tools:

- Azure CLI (version 2.40.0 or later)
- AWS CLI configured with appropriate credentials
- `kubectl` configured for your EKS clusters

## Enable Defender for Containers

To enable the Defender for Containers plan on your subscription, see [Enable Microsoft Defender for Cloud](connect-azure-subscription.md). You can enable the plan through the Azure portal, REST API, or Azure Policy.

## Connect your AWS account

Before deploying the Defender sensor, connect your AWS account to Microsoft Defender for Cloud. For instructions, see [Connect your AWS account](quickstart-onboard-aws.md).

## Connect EKS clusters to Azure Arc

Connect your EKS clusters to Azure Arc to deploy the Defender sensor. For instructions, see [Connect an existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Deploy the Defender sensor

After connecting your AWS account and EKS clusters to Azure Arc, deploy the Defender sensor extension.

### Deploy using the installation script

The following script installs the Defender for Containers sensor and removes any existing deployment if one exists:

[install_defender_sensor_mc.sh](https://gist.github.com/matannov/00c0bc43f63280f5cf30736b38a54678)

Set your kubeconfig context to the target cluster, and run the script:

```bash
install_defender_sensor_mc.sh <SECURITY_CONNECTOR_AZURE_RESOURCE_ID> <RELEASE_TRAIN> <VERSION> <DISTRIBUTION> [<ARC_CLUSTER_RESOURCE_ID>]
```

Replace the placeholder text with your own values. `ARC_CLUSTER_RESOURCE_ID` is an optional parameter for existing clusters that use the Defender for Containers Arc extension.

### Get the security connector resource ID

To install the Helm chart on an EKS cluster, you need the security connector resource ID for the account your cluster belongs to. Run the following Azure CLI command to get this value:

```azurecli
az resource show \
  --name <connector-name> \
  --resource-group <resource-group-name> \
  --resource-type "Microsoft.Security/securityConnectors" \
  --subscription <subscription-id> \
  --query id -o tsv
```

Replace the placeholder text `<connector-name>`, `<resource-group-name>`, and `<subscription-id>` with your values.

### Parameter values

- For `<RELEASE_TRAIN>`, use `public` for the public preview releases (0.9.x)
- For `<VERSION>`, use `latest` or a specific semantic version
- For `<DISTRIBUTION>`, use `eks`

> [!NOTE]
> This script might create a Log Analytics workspace in your Azure account.

### Deploy using Azure CLI

Alternatively, deploy the Defender sensor extension using Azure CLI:

```azurecli
az k8s-extension create \
    --name microsoft.azuredefender.kubernetes \
    --extension-type microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --configuration-settings \
        logAnalyticsWorkspaceResourceID="/subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>"
```

After deploying the Defender sensor, you can configure additional settings. For more information, see [Configure Defender for Containers sensor deployed with Helm](deploy-helm.md).

## Deploy the Azure Policy extension

Deploy the Azure Policy extension to enable policy enforcement on your EKS clusters:

```azurecli
az k8s-extension create \
    --name azure-policy \
    --extension-type Microsoft.PolicyInsights \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group>
```

## Next steps

- [Verify deployment](defender-for-containers-aws-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-aws-configure.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md)
