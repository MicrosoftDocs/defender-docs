---
title: Review and remediate Kubernetes node vulnerabilities
description: Learn about Defender for Containers vulnerability assessment for Kubernetes nodes.
ms.date: 04/09/2026
ms.topic: how-to
ms.custom: sfi-image-nochange
---

# Review and remediate Kubernetes node vulnerabilities

Defender for Cloud scans the [VMs that host Kubernetes nodes](./kubernetes-nodes-overview.md#protection-for-kubernetes-nodes) for vulnerabilities in the operating system and installed software. When vulnerabilities are detected, Defender for Cloud generates recommendations to help you review and remediate them as part of the [shared responsibility](./kubernetes-nodes-overview.md#shared-responsibility-of-kubernetes-nodes) for maintaining Kubernetes node security.

## Prerequisites

Before you begin, make sure that:

- You have an Azure subscription. If you don’t have an Azure subscription, create a [free account](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn) before you begin.

- [Microsoft Defender for Cloud is enabled on your subscription](connect-azure-subscription.md) with one of the following plans:
    - Defender for Containers
    - Defender for Servers P2
    - Defender CSPM

- [Agentless scanning for machines](kubernetes-nodes-overview.md#enable-agentless-scanning-for-machines) is enabled.

## Review the Kubernetes node vulnerability recommendations

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select the `AKS nodes should have vulnerability findings resolved` recommendation.

   :::image type="content" source="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png" alt-text="Screenshot showing the selection of the nodes recommendation line." lightbox="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png":::

1. The full details of the Kubernetes node recommendation are shown. Along with a full description of the vulnerability, other details such as the name of the affected Kubernetes node pool and its cluster are presented. -> change to something like review the blabla

   :::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details.png" alt-text="Screenshot showing the details of the recommendation for the Kubernetes node." lightbox="media/kubernetes-nodes-va/recommendation-node-details.png":::

1. Select **Findings**.

   :::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-findings.png" alt-text="Screenshot of selecting the findings tab to view a list of CVEs related to the Kubernetes node." lightbox="media/kubernetes-nodes-va/recommendation-node-details-findings.png":::

1. Select a CVE. (add to view_)

   :::image type="content" source="media/kubernetes-nodes-va/recommendation-node-cve-detail.png" alt-text="Screenshot of the pane showing all the details of the CVE and Kubernetes node resources affected." lightbox="media/kubernetes-nodes-va/recommendation-node-cve-details.png":::

In the details pane, the **Node pool instances** section shows the nodes to be affected by the remediation. The **More affected resources** shows other nodes that have the same CVE and should be remediated as well. (this can be deleted)

## Remediate Kubernetes node vulnerabilities

Kubernetes node vulnerabilities are remediated by updating the node pool VM image version. The customer upgrades the node pool, as part of the shared responsibility between the Kubernetes service and the customer. The customer upgrades the node pool in one of two ways - either upgrade the node pool VM image and/or the cluster's Kubernetes service, to a newer version. **It is recommended to upgrade the node pool VM image first.** In some cases, the customer needs to upgrade the cluster's Kubernetes service version and the node pool VM image version to remediate the vulnerability. (do i need this? can imove it if i need it?)

> [!IMPORTANT]
> The cluster's Kubernetes version and the node pool VM image can be [set to auto-upgrade](/azure/aks/upgrade-cluster#configure-automatic-upgrades). These versions should be [regularly upgraded](/azure/aks/upgrade-cluster) to provide maximum security for you AKS resources. (is this needed?)

### Upgrade the node pool VM image 

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Search for and select **Microsoft Defender for Cloud**.
 
1. Select **Recommendations**.

1. Search for and select the `AKS nodes should have vulnerability findings resolved` recommendation.

   :::image type="content" source="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png" alt-text="Screenshot showing the selection of the nodes recommendation line." lightbox="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png":::

1. Select **Fix**.

   :::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-select-fix.png" alt-text="Screenshot showing the details of the recommendation for the Kubernetes node and the highlighted Fix button." lightbox="media/kubernetes-nodes-va/recommendation-node-details-select-fix.png":::

1. Select **Upgrade Kubernetes** or **Update Image**.

   :::image type="content" source="media/kubernetes-nodes-va/node-pool-overview.png" alt-text="Screenshot showing the overview details of the Kubernetes node pool for updating its image." lightbox="media/kubernetes-nodes-va/node-pool-overview.png":::

## Next step

Learn how to use the [Cloud Security Explorer to investigate vulnerabilities in a cluster node](cloud-security-explorer-kubernetes-clusters.md#create-a-query-to-identify-vulnerabilities-in-cluster-nodes).
