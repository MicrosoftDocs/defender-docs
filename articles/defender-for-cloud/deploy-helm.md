---
title: Install Defender for Containers sensor Using Helm
description: Learn how to install and configure the Microsoft Defender for Containers sensor on AKS, EKS, and GKE clusters using Helm, including prerequisites, scripts, and troubleshooting steps.
author: dcurwin
ms.topic: how-to
ms.date: 06/16/2025
ms.author: dacurwin

---

# Install Defender for Containers sensor using Helm

This article describes how to install and configure the Microsoft Defender for Containers sensor on AKS, EKS, and GKE clusters using Helm. You'll learn about prerequisites, enabling Defender for Containers, and step-by-step deployment instructions for different environments.

## General prerequisites

Make sure all prerequisite requirements for the Defender for Containers sensor are met, as described in the [Defender sensor network requirements](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-arc%2Caks-removeprofile-api&pivots=defender-for-container-aks%23network-requirements).

## Step 1: Enable Defender for Containers

If your Defender for Containers plan isn't already enabled, follow these steps:

1. In the Azure portal, go to **Microsoft Defender for Cloud**, and select the subscription for the clusters where you want to install the Helm chart. In EKS and GKE, select the environment with those clusters (the security connector for the EKS or GKE account with the cluster).

1. Under **Cloud Workload Protection (CWP)**, find the **Containers** plan and set the toggle to **On**.

   :::image type="content" source="media/deploy-helm/enable-containers-plan.png" alt-text="Screenshot showing how to enable the Containers plan." lightbox="media/deploy-helm/enable-containers-plan.png":::

1. Next to the **Containers** plan, select **Settings**.

   :::image type="content" source="media/deploy-helm/navigate-to-settings.png" alt-text="Screenshot showing how to select the settings button." lightbox="media/deploy-helm/navigate-to-settings.png":::

1. In the **Settings & monitoring** pane, ensure the following toggles are set to **On**:
   - **Defender sensor**
   - **Security findings**
   - **Registry access**

   :::image type="content" source="media/deploy-helm/verify-correct-toggles.png" alt-text="Screenshot showing how to verify the correct toggles are enabled." lightbox="media/deploy-helm/verify-correct-toggles.png":::

Now you're ready to set up the Defender for Containers sensor with Helm.

## Step 2: Install the sensors Helm chart

### Installation prerequisites

- Helm >= 3.8 (OCI support is GA)
- Resource group owner role for the target cluster (AKS) or security connector (EKS or GKE)
- Azure resource ID for the target cluster

  > [!NOTE]
  > Use the following command to generate a list of your AKS clusters Azure resource IDs given a `<SUBSCRIPTION_ID>` and `<RESOURCE_GROUP>`:
  >
  >```bash
  >az aks list \
  >--subscription <SUBSCRIPTION_ID> \
  >--resource-group <RESOURCE_GROUP> \
  >--query "[].id" \
  >-o tsv
  >```

### AKS

Before you install the sensor, remove any **conflicting policies**. These policy assignments cause the GA version of the sensor to be deployed on your cluster. You can find the list of policy definitions for your subscription at [Policy - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyMenuBlade/~/Definitions). The ID for the conflicting policy is 64def556-fbad-4622-930e-72d1d5589bf5.

Run the following script to remove them using Azure CLI:

[delete_conflicting_policies.sh](https://gist.github.com/matannov/a1830a8333cb7804704ad148edc5c904)

Run the script with the command:

```bash
delete_conflicting_policies.sh <CLUSTER_AZURE_RESOURCE_ID>
```

> [!NOTE]
> This script removes resource group and subscription level policies for setting up the GA version of Defender for Containers, which can affect clusters other than the one you're configuring.

The following script installs the Defender for Containers sensor (and removes any existing deployment, if one exists):

[install_defender_sensor_aks.sh](https://gist.github.com/matannov/8a68d2101bc57af461913f7547891d94)

Run the script with the command:

```bash
install_defender_sensor_aks.sh <CLUSTER_AZURE_RESOURCE_ID> <RELEASE_TRAIN> <VERSION>
```

In the following command, replace the placeholder text `<CLUSTER_AZURE_RESOURCE_ID>`, `<RELEASE_TRAIN>`, and `<VERSION>` with your own values. Use 'public' for the public preview releases (0.9.x). For `<VERSION>`, use 'latest' or a specific semantic version.

> [!NOTE]
> This script sets a new kubeconfig context, and might create a Log Analytics workspace in your Azure account.

### EKS/GKE

The following script installs the Defender for Containers sensor (and removes any existing deployment, if one exists):

[install_defender_sensor_mc.sh](https://gist.github.com/matannov/00c0bc43f63280f5cf30736b38a54678)

Set your kubeconfig context to the target cluster, and run the script with the command:

```bash
install_defender_sensor_mc.sh <SECURITY_CONNECTOR_AZURE_RESOURCE_ID> <RELEASE_TRAIN> <VERSION> <DISTRIBUTION> [<ARC_CLUSTER_RESOURCE_ID>]
```

In the following command, replace the placeholder text `<SECURITY_CONNECTOR_AZURE_RESOURCE_ID>`, `<RELEASE_TRAIN>`, `<VERSION>`, `<DISTRIBUTION>`, and `<ARC_CLUSTER_RESOURCE_ID>` with your own values. For `<SECURITY_CONNECTOR_AZURE_RESOURCE_ID>`:

- Set up a security connector for your AWS or GCP account

  > [!NOTE]
  > To install the Helm chart on an EKS or GKE cluster, make sure the cluster account is connected to Microsoft Defender for Cloud. See [Connect your AWS account](quickstart-onboard-aws.md) or [Connect your GCP project](quickstart-onboard-gcp.md).

- Get its Azure resource ID

  > [!NOTE]
  > To install the Helm chart on an EKS or GKE cluster, you need the security connector resource ID for the account your cluster belongs to. Run the [az resource show](/cli/azure/resource#az-resource-show) CLI command to get this value.
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

Use 'public' for the public preview releases (0.9.x). For `<VERSION>`, use 'latest' or a specific semantic version. For `<DISTRIBUTION>`, use `eks` or `gke`.

> [!NOTE]
> This script can create a Log Analytics workspace in your Azure account.

Run the following command to check that the installation succeeded:

```bash
helm list --namespace mdc
```

You see the STATUS field set to **deployed**.

## Existing recommendation to provision sensor

> [!NOTE]
> If you use Helm to set up the sensor, **ignore** the existing recommendations.

**For AKS**:

[Azure Kubernetes Service clusters should have Defender profile enabled - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9/showSecurityCenterCommandBar~/false)

:::image type="content" source="media/deploy-helm/recommendation-aks.png" alt-text="Screenshot of the Azure portal that shows the Defender profile recommendation for AKS. The screenshot highlights the recommendation to enable the Defender profile." lightbox="media/deploy-helm/recommendation-aks.png":::

**For multicloud**:

[Azure Arc-enabled Kubernetes clusters should have the Defender extension installed - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6/showSecurityCenterCommandBar~/false)

:::image type="content" source="media/deploy-helm/recommendation-arc.png" alt-text="Screenshot of the Azure portal that shows the Defender extension recommendation for Arc-enabled Kubernetes clusters. The screenshot highlights the recommendation to install the Defender extension." lightbox="media/deploy-helm/recommendation-arc.png":::

## Upgrade an existing Helm-based deployment

Run the following command to update an existing Helm-based deployment:

```bash
helm upgrade microsoft-defender-for-containers-sensor \
oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers-sensor \
--devel \
--reuse-values
```

## Next steps

- [Common questions about protecting containers](faq-defender-for-containers.yml)
