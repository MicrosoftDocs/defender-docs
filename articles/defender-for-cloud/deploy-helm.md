---
title: Install Defender for Containers sensor Using Helm
description: Learn how to install the Microsoft Defender for Containers sensor on Kubernetes clusters using Helm.
author: Elazark
ms.topic: how-to
ms.date: 01/22/2026
ms.author: elkrieger
ai-usage: ai-assisted
---

# Install Defender for Containers sensor by using Helm

This article describes how to install and configure the Microsoft Defender for Containers sensor on AKS, EKS, and GKE clusters by using Helm. You learn about prerequisites, enabling Defender for Containers, and step-by-step deployment instructions for different environments.

## General prerequisites

Implement all prerequisite requirements for the Defender for Containers sensor as described in the [Defender sensor network requirements](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-arc%2Caks-removeprofile-api&pivots=defender-for-container-aks%23network-requirements).

- Enable Defender for Containers in the target subscription or security connector:
    - Azure subscription: [Enable Defender for Containers on AKS via portal](defender-for-containers-azure-enable-portal.md)
    - Amazon Web Services (AWS): [Enable Defender for Containers on AWS (EKS) via portal](defender-for-containers-aws-enable-portal.md)
    - Google Cloud Project (GCP): [Enable Defender for Containers on GCP (GKE) via portal](defender-for-containers-gcp-enable-portal.md)
    - Arc-enabled Kubernetes (ARC): [Enable Defender for Containers on Arc-enabled Kubernetes via portal](defender-for-containers-arc-enable-portal.md)

- Ensure the following components of the Defender for containers plan are enabled:
   - Defender sensor
   - Security findings
   - Registry access

## Install the sensors Helm chart

Depending on your deployment type, follow the relevant instructions to install the Defender for Containers sensor by using Helm:

### [AKS & AKS Automatic](#tab/aks)

#### Prerequisites

**AKS automatic Only**: Run the following command for AKS Automatic:

    ```bash
    # Update Azure CLI to the latest version 
    az upgrade 
    
    # If you don't have the AKS preview extension installed yet 
    az extension add --name aks-preview 
    
    # Update the AKS extension specifically 
    az extension update --name aks-preview
    ```

**AKS and AKS Automatic**:

- Helm version 3.8 or later (the available version supports OCI)

- Resource group owner role for the target cluster.

- Azure resource ID for the target cluster

  > [!NOTE]
  > To generate a list of your AKS clusters' Azure resource IDs, use the following command with a `<SUBSCRIPTION_ID>` and `<RESOURCE_GROUP>`:
  >
  >```bash
  >az aks list \
  >--subscription <SUBSCRIPTION_ID> \
  >--resource-group <RESOURCE_GROUP> \
  >--query "[].id" \
  >-o tsv
  >```

- Remove any **conflicting policies**. These policy assignments cause the available version of the sensor to be deployed on your cluster. 
    - Locate the ID for the conflicting policy `64def556-fbad-4622-930e-72d1d5589bf5` in the [list of policy definitions for your subscription](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyMenuBlade/~/Definitions).
    - Run the [delete_conflicting_policies.sh](https://github.com/microsoft/Microsoft-Defender-For-Containers/blob/main/scripts/delete_conflicting_policies.sh) script to remove conflicting policies by using the Azure CLI.
    - Run the script with the command:

    ```azurecli   
    delete_conflicting_policies.sh <CLUSTER_AZURE_RESOURCE_ID>
    ```
    
    > [!NOTE]
    > This script removes resource group and subscription level policies for setting up the GA version of Defender for Containers. It can affect clusters other than the one you're configuring.

#### Installation

Use the [install_defender_sensor_aks.sh](https://github.com/microsoft/Microsoft-Defender-For-Containers/blob/main/scripts/install_defender_sensor_aks.sh) script to install the Defender for Containers sensor and remove any existing deployment.

Run the script with the command:
    
```azurecli
install_defender_sensor_aks.sh --id <CLUSTER_AZURE_RESOURCE_ID> --version <VERSION> [--release_train <RELEASE_TRAIN>] [--antimalware]
```

Replace the placeholder text `<CLUSTER_AZURE_RESOURCE_ID>`, `<RELEASE_TRAIN>`, and `<VERSION>` with your own values. 

- Replace `<VERSION>` with:
  - `latest` for the most recent version.
  - A specific semantic version.
    
- Replace <RELEASE_TRAIN> with:
  - `stable` (default).
  - `public` for the preview version.
    
- The flag `--antimalware` enables antimalware scanning.

> [!NOTE]
> This script sets a new `kubeconfig` context and might create a Log Analytics workspace in your Azure account.

### [EKS and GKE](#tab/eks-and-gke)

## Prerequisites

- Helm version 3.8 or later (the available version supports OCI)

- Resource group owner role for the security connector.

- Ensure the cluster account is connected to Microsoft Defender for Cloud. Learn how to [connect your AWS account](quickstart-onboard-aws.md) or [connect your GCP project](quickstart-onboard-gcp.md) to your Defender for Cloud.

- Run the [az resource show](/cli/azure/resource#az-resource-show) CLI command to get the security connector resource ID for the account your cluster belongs to.

    For example:
     ```azurecli
        az resource show \
        --name <connector-name> \
        --resource-group <resource-group-name> \
        --resource-type "Microsoft.Security/securityConnectors" \
        --subscription <subscription-id> \
        --query id -o tsv
    ```
     In this example, replace the placeholder text `<connector-name>`, `<resource-group-name>`, and `<subscription-id>` with your values.

## Installation

1. Use the [install_defender_sensor_mc.sh](https://github.com/microsoft/Microsoft-Defender-For-Containers/blob/main/scripts/install_defender_sensor_mc.sh) script to install the Defender for Containers sensor and remove any existing deployment.

1. Set the `kubeconfig` context to the target cluster by using the command:

   ```azurecli
   install_defender_sensor_mc.sh --id <SECURITY_CONNECTOR_AZURE_RESOURCE_ID> --version <VERSION> --distribution <DISTRIBUTION> [--release_train <RELEASE_TRAIN>] [--antimalware]
   ```
    
    Replace the placeholder text `<SECURITY_CONNECTOR_AZURE_RESOURCE_ID>`, `<RELEASE_TRAIN>`, `<VERSION>`, and `<DISTRIBUTION>` with your own values.
   
  - Replace `<SECURITY_CONNECTOR_AZURE_RESOURCE_ID>` with the Azure resource ID of your security connector.
      
    > [!NOTE]
    > This script might create a Log Analytics workspace in your Azure account.
    >
    > This script tests for an arc managed deployment of the Defender for Containers Sensor. If one exists, the script removes it prior to deploying the sensor by using helm.

   - Replace `<VERSION>` with:
    - `latest` for the most recent version.
    - A specific semantic version.
            
   - Replace `<DISTRIBUTION>` with: 
      - `eks`
      - `gke`
      - `eksautomode`. 
            
   - Replace <RELEASE_TRAIN> with:
      - `stable` (default).
      - `public` for the preview version.
        
   - The flag `--antimalware` enables antimalware scanning.
      
---

### Verify the installation

Verify that the installation succeeded by using the command:

```bash
helm list --namespace mdc
```

The installation is successful if the `STATUS` field displays **deployed**.

## Configure security rules for gated deployment

> [!IMPORTANT]
> For Helm installations:
> 
> - **Subscription Support Warning**: When you create rules, your selected subscription might show as `not supported for Gated deployment`. This status occurs because you installed the Defender for Containers components by using Helm rather than through the dashboard's automatic installation.
>  - **Skip Auto-Installation**: If you're prompted to enable gating in the third tab of the security rule edit window, make sure to select **Skip**. This option enables autoinstallation, which conflicts with your existing Helm deployment.
> 
>     :::image type="content" source="media/deploy-helm/edit-vulnerability-assessment-rule.png" alt-text="Screenshot showing the third tab of the security rule edit window." lightbox="media/deploy-helm/edit-vulnerability-assessment-rule.png":::

Define security rules to control what can be deployed into your Kubernetes clusters. These rules help you block or audit container images based on security criteria, such as images with too many vulnerabilities. 

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to the **Defender for Cloud** > **Environment settings**.

1. Select **Security rules**.

1. Select **Gated deployment** > **Vulnerability assessment**.

1. Select a rule to edit it or select **+ Add rule** to create a new one.

## Handle existing recommendations

> [!IMPORTANT]
> If you set up the sensor by using Helm, **ignore** existing recommendations.

Depending on your deployment type, select the relevant recommendation to view any existing recommendations in the Azure portal:

- **Azure**: [Azure Kubernetes Service clusters should have Defender profile enabled - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9/showSecurityCenterCommandBar~/false)

    :::image type="content" source="media/deploy-helm/recommendation-aks.png" alt-text="Screenshot of the Azure portal that shows the Defender profile recommendation for AKS. The screenshot highlights the recommendation to enable the Defender profile." lightbox="media/deploy-helm/recommendation-aks.png":::

- **Multicloud**: [Azure Arc-enabled Kubernetes clusters should have the Defender extension installed - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6/showSecurityCenterCommandBar~/false)

    :::image type="content" source="media/deploy-helm/recommendation-arc.png" alt-text="Screenshot of the Azure portal that shows the Defender extension recommendation for Arc-enabled Kubernetes clusters. The screenshot highlights the recommendation to install the Defender extension." lightbox="media/deploy-helm/recommendation-arc.png":::

## Upgrade an existing Helm-based deployment

Run the following command to update an existing Helm-based deployment:

```bash
helm upgrade microsoft-defender-for-containers \
oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
--version <version> \
--reuse-values
```

## Related content

- [Common questions about protecting containers](faq-defender-for-containers.yml)
