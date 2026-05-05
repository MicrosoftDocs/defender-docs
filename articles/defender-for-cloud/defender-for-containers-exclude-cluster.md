---
title: Exclude Kubernetes clusters from automatic Defender sensor deployment
description: Learn how to exclude specific Kubernetes clusters from automatic Defender for Containers sensor deployment by using resource tags.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 05/05/2026
---

# Exclude Kubernetes clusters from automatic Defender sensor deployment

When automatic provisioning is enabled in the Defender for Containers plan, Microsoft Defender for Cloud deploys the Defender sensor to supported Kubernetes clusters.

To manage sensor deployment manually for specific clusters, add an exclusion tag to prevent automatic deployment.

You can use exclusion tags on the following cluster types:

- Azure Kubernetes Service (AKS)
- Amazon Elastic Kubernetes Service (EKS)
- Google Kubernetes Engine (GKE)

> [!NOTE]
> Exclusion tags aren't supported for Arc-enabled Kubernetes clusters in on-premises environments.

## Prerequisites

- [Defender for Containers is enabled](defender-for-containers-enable-plan.md) with automatic provisioning turned on on.

## Exclude a cluster from automatic sensor deployment

To exclude a cluster from automatic Defender sensor deployment:

> [!IMPORTANT]
> Add the exclusion tag before automatic provisioning deploys the Defender sensor. If the Defender sensor is already deployed, adding the tag doesn't remove the existing deployment.

# [AKS](#tab/aks)

To exclude an AKS cluster from automatic Defender sensor deployment:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Kubernetes services**.

1. Select the relevant AKS cluster.

1. Select **Tags**.

1. Add the following tag:

   - **Name**: `ms_defender_container_exclude_sensors`
   - **Value**: `true`

1. Select **Save**.

# [EKS and GKE](#tab/eks-gke)

To exclude an EKS or GKE cluster from automatic Defender sensor deployment, add the exclusion tag to the native cluster resource in AWS or Google Cloud.

Add the following tag:

- **Name**: `ms_defender_container_exclude_sensors`
- **Value**: `true`

---

## Next steps

- Learn how to [install the Defender sensor using Helm](deploy-helm.md).

- Learn how to [deploy Defender components using Azure CLI](defender-for-containers-deploy-azure-cli.md).