---
title: Deploy Defender sensor and Azure Policy to clusters using security recommendations
description: Learn how to deploy the Microsoft Defender for Containers sensor and Azure Policy for Kubernetes to AKS, Amazon EKS, and Google Kubernetes Engine clusters by using Microsoft Defender for Cloud security recommendations.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 01/29/2026
---

# Deploy Defender sensor and Policy to clusters using security recommendations

This article explains how to deploy the Microsoft Defender for Containers sensor and Azure Policy for Kubernetes to clusters by remediating security recommendations after you [enable the Defender for Containers plan in Microsoft Defender for Cloud](defender-for-containers-enable-portal.md).

For clusters that aren’t running in Azure Kubernetes Service (AKS), Defender for Cloud uses Azure Arc–enabled Kubernetes to deploy the required extensions.

---

# [Azure Kubernetes Service (AKS)](#tab/aks)

For AKS clusters, recommendations activate built-in AKS security capabilities, including the Defender profile and Azure Policy add-on.

## Prerequisites

- [Defender for Containers enabled on your Azure subcription](defender-for-containers-enable-portal.md?tab=aks).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-containers-network-requirements-aks.md)]

## Deploy components

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Go to **Microsoft Defender for Cloud** > **Recommendations**.

3. Search for AKS-related recommendations, such as:

   - **Azure Kubernetes Service clusters should have Defender profile enabled**
   - **Azure Policy for Kubernetes should be installed and enabled**

4. Select a recommendation.

5. Select the affected AKS clusters.

6. Follow the remediation steps to apply the fix.

## Verify deployment

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

2. Confirm the recommendation status changes to **Healthy**.

3. In the AKS cluster resource, verify:
   - Defender profile is enabled
   - Azure Policy add-on is installed

---

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

For EKS clusters, Defender uses Azure Arc–enabled Kubernetes to deploy the Defender sensor and Azure Policy extensions.

## Prerequisites

- [Defender for Containers enabled on your AWS connector](defender-for-containers-enable-portal.md?tab=eks). 

- [Review and, if needed, configure required AWS permissions and control plane access for Defender for Containers capabilities](defender-for-containers-aws-permissions.md).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy components

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Go to **Microsoft Defender for Cloud** > **Recommendations**.

3. Look for recommendations such as:

   - **EKS clusters should have Microsoft Defender's extension for Azure Arc installed**
   - **Arc-enabled Kubernetes clusters should have Defender extension installed**

4. Select the recommendation.

5. Select the EKS clusters.

6. Follow the remediation steps to:
   - Connect clusters to Azure Arc (if not already connected)
   - Install the Defender extension
   - Install the Azure Policy extension (if applicable)

## Verify deployment

1. Go to **Microsoft Defender for Cloud** > **Recommendations** and confirm the recommendation becomes **Healthy**.

2. Open the Arc-enabled cluster resource in Azure.

3. Select **Extensions** and verify:

   - **Microsoft Defender for Containers** status is **Succeeded**
   - **Azure Policy for Kubernetes** status is **Succeeded** (if enabled)

## Manage the Defender extension from the Arc-enabled Kubernetes resource (optional)

You can also inspect and manage the Defender for Containers extension directly from the Azure Arc-enabled Kubernetes resource:

1. In the Azure portal, open **Azure Arc**.

1. Select **Kubernetes clusters**, then select your cluster.

1. Select **Extensions**.

1. Verify that **Microsoft Defender for Containers** shows **Succeeded**.

1. Select the extension to view its status and configuration.

---

# [Google Kubernetes Engine (GKE)](#tab/gke)

For GKE clusters, Defender uses Azure Arc–enabled Kubernetes to deploy the Defender sensor and Azure Policy extensions.

## Prerequisites

- [Defender for Containers enabled on your GCP connector](defender-for-containers-enable-portal.md?tab=eks). 

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy components

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Go to **Microsoft Defender for Cloud** > **Recommendations**.

3. Look for recommendations such as:

   - **GKE clusters should be connected to Azure Arc**
   - **Arc-enabled Kubernetes clusters should have Defender extension installed**

4. Select the recommendation.

5. Select the GKE clusters.

6. Follow the remediation steps to:
   - Connect clusters to Azure Arc (if required)
   - Install the Defender extension
   - Install the Azure Policy extension (if applicable)

## Verify deployment

1. In **Microsoft Defender for Cloud** > **Recommendations**, confirm the recommendation becomes **Healthy**.

2. Open the Arc-enabled cluster resource.

3. Select **Extensions** and verify:

   - **Microsoft Defender for Containers** status is **Succeeded**
   - **Azure Policy for Kubernetes** status is **Succeeded** (if enabled)

## Manage the Defender extension from the Arc-enabled Kubernetes resource (optional)

You can also inspect and manage the Defender for Containers extension directly from the Azure Arc-enabled Kubernetes resource:

1. In the Azure portal, open **Azure Arc**.

1. Select **Kubernetes clusters**, then select your cluster.

1. Select **Extensions**.

1. Verify that **Microsoft Defender for Containers** shows **Succeeded**.

1. Select the extension to view its status and configuration.

# [Arc-enabled Kubernetes](#tab/arc)

For Kubernetes clusters connected to Azure using Azure Arc that aren’t running in Azure Kubernetes Service (AKS), Amazon EKS, or Google Kubernetes Engine (GKE), Defender for Cloud deploys components as Azure Arc Kubernetes extensions when you remediate security recommendations.

## Prerequisites

- [Defender for Containers enabled on your Azure subscription](defender-for-containers-enable-portal.md?tab=aks).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy components

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Go to **Microsoft Defender for Cloud** > **Recommendations**.

3. Look for recommendations such as:

   - **Arc-enabled Kubernetes clusters should have Defender extension installed**
   - **Arc-enabled Kubernetes clusters should have Azure Policy extension installed**

4. Select the recommendation.

5. Select the affected clusters.

6. Follow the remediation steps to:

   - Install the **Microsoft Defender for Containers** extension  
   - Install the **Azure Policy for Kubernetes** extension (if applicable)

## Verify deployment

1. Go to **Microsoft Defender for Cloud** > **Recommendations** and confirm the recommendation becomes **Healthy**.

2. Open the Arc-enabled cluster resource in Azure.

3. Select **Extensions** and verify:

   - **Microsoft Defender for Containers** status is **Succeeded**
   - **Azure Policy for Kubernetes** status is **Succeeded** (if enabled)

## Manage the Defender extension from the Arc-enabled Kubernetes resource (optional)

You can also inspect and manage the Defender for Containers extension directly from the Azure Arc-enabled Kubernetes resource:

1. In the Azure portal, open **Azure Arc**.

1. Select **Kubernetes clusters**, then select your cluster.

1. Select **Extensions**.

1. Verify that **Microsoft Defender for Containers** shows **Succeeded**.

1. Select the extension to view its status and configuration.

---

## Related content

- [Enable Defender for Containers in Microsoft Defender for Cloud](defender-for-containers-enable-portal.md)

- [Enable Defender for Containers using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)
