---
title: Review and remediate Kubernetes node vulnerabilities
description: Learn how to review and remediate vulnerability findings for Kubernetes nodes in Microsoft Defender for Cloud.
ms.date: 04/09/2026
ms.topic: how-to
ms.custom: sfi-image-nochange
---

# Review and remediate Kubernetes node vulnerabilities

Defender for Cloud scans the [VMs that host Kubernetes nodes](./kubernetes-nodes-overview.md#protection-for-kubernetes-nodes) for vulnerabilities in the operating system and installed software. When vulnerabilities are detected, Defender for Cloud generates recommendations with detailed findings to help you review and remediate them.

Reviewing and remediating these vulnerabilities is part of the [shared responsibility](./kubernetes-nodes-overview.md#shared-responsibility-of-kubernetes-nodes) for maintaining Kubernetes node security.

## Prerequisites

Before you begin, make sure that:

- You have an Azure subscription. If you don’t have an Azure subscription, create a [free account](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn) before you begin.

- [Microsoft Defender for Cloud is enabled on your subscription](connect-azure-subscription.md) with one of the following plans enabled:
    - Defender for Containers
    - Defender for Servers P2
    - Defender CSPM

- [Agentless scanning for machines](kubernetes-nodes-overview.md#enable-agentless-scanning-for-machines) is enabled.

## Review vulnerability findings for Kubernetes nodes

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select the `AKS nodes should have vulnerability findings resolved` recommendation.

1. Review the recommendation details, including affected node pools and clusters.

   :::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details.png" alt-text="Screenshot showing the details of the recommendation for the Kubernetes node." lightbox="media/kubernetes-nodes-va/recommendation-node-details.png":::

1. Select **Findings** to view the list of CVEs.

   :::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-findings.png" alt-text="Screenshot of selecting the findings tab to view a list of CVEs related to the Kubernetes node." lightbox="media/kubernetes-nodes-va/recommendation-node-details-findings.png":::

1. Select a CVE to view detailed vulnerability information, including affected resources.

## Remediate Kubernetes node vulnerabilities

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select the `AKS nodes should have vulnerability findings resolved` recommendation.

1. Select **Fix**.

   :::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-select-fix.png" alt-text="Screenshot showing the details of the recommendation for the Kubernetes node and the highlighted Fix button." lightbox="media/kubernetes-nodes-va/recommendation-node-details-select-fix.png":::

1. Select **Update image** to apply the latest patched node pool VM image, or **Upgrade Kubernetes** to move the cluster to a newer Kubernetes version.

   :::image type="content" source="media/kubernetes-nodes-va/node-pool-overview.png" alt-text="Screenshot showing the overview details of the Kubernetes node pool for updating its image." lightbox="media/kubernetes-nodes-va/node-pool-overview.png":::

## Next step

Learn how to use the [Cloud Security Explorer to investigate vulnerabilities in a cluster node](cloud-security-explorer-kubernetes-clusters.md#create-a-query-to-identify-vulnerabilities-in-cluster-nodes).
