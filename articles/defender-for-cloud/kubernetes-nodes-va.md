---
title: Kubernetes Nodes Vulnerability Assessment
description: Learn about Defender for Containers vulnerability assessment for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: conceptual
---

# Kubernetes node vulnerability assessment

Defender for Cloud can scan the [VMs that host Kubernetes nodes](./kubernetes-nodes-overview.md#protection-for-kubernetes-nodes) to assess vulnerabilities to the OS and installed software. Recommendations for remediation are generated for the customer security team to review and remediate as part of the [shared responsibility](./kubernetes-nodes-overview.md#shared-responsibility-of-kubernetes-nodes) to maintain the Kubernetes nodes of a cluster.

## Prerequisite

Vulnerability assessment of the nodes must be [enabled by turning on the **Agentless scanning for machines**](./kubernetes-nodes-overview.md#enable-agentless-scanning-for-machines) option in the Defender for Containers, Defender Cloud Security Posture Management, or Defender for Servers P2 plan.

## Review the Kubernetes node vulnerability recommendations

If vulnerabilities are found for a Kubernetes node, a recommendation is generated for the customer to review. To review Kubernetes node recommendations for remediation in the Azure portal:

1. Select **Recommendations** from the **Defender for Cloud** menu.
:::image type="content" source="media/kubernetes-nodes-va/recommendations-list.png" alt-text="Screenshot of selecting the recommendations submenu of the Defender for Cloud pane." lightbox="media/kubernetes-nodes-va/recommendations-list.png":::

1. Select the **AKS nodes should have vulnerability findings resolved** recommendation.
:::image type="content" source="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png" alt-text="Screenshot showing the selection of the nodes recommendation line." lightbox="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png":::

1. The full details of the Kubernetes node recommendation are shown. Along with a full description of the vulnerability, other details such as the name of the affected Kubernetes node pool and its cluster are presented.
:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details.png" alt-text="Screenshot showing the details of the recommendation for the Kubernetes node." lightbox="media/kubernetes-nodes-va/recommendation-node-details.png":::

1. Select the **Findings** tab to view a list of CVEs relating to the Kubernetes node.
:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-findings.png" alt-text="Screenshot of selecting the findings tab to view a list of CVEs related to the Kubernetes node." lightbox="media/kubernetes-nodes-va/recommendation-node-details-findings.png":::

1. Selecting one of the CVE lines opens a pane giving full details about the CVE and all the Kubernetes node resources that also have this vulnerability.
:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-cve-detail.png" alt-text="Screenshot of the pane showing all the details of the CVE and Kubernetes node resources affected." lightbox="media/kubernetes-nodes-va/recommendation-node-cve-details.png":::

In the details pane, the **Node pool instances** section shows the nodes to be affected by the remediation. The **More affected resources** shows other nodes that have the same CVE and should be remediated as well.

## Remediate Kubernetes node vulnerabilities

Kubernetes node vulnerabilities are remediated by updating the node pool VM image version. The customer upgrades the node pool, as part of the shared responsibility between the Kubernetes service and the customer. The customer upgrades the node pool in one of two ways - either upgrade the node pool VM image and/or the cluster's Kubernetes service, to a newer version. **It is recommended to upgrade the node pool VM image first.** In some cases, the customer needs to upgrade the cluster's Kubernetes service version and the node pool VM image version to remediate the vulnerability.

> [!IMPORTANT]
> The cluster's Kubernetes version and the node pool VM image can be [set to auto-upgrade](/azure/aks/upgrade-cluster#configure-automatic-upgrades). These versions should be [regularly upgraded](/azure/aks/upgrade-cluster) to provide maximum security for you AKS resources.

### Upgrade the node pool VM image

1. Select the `Fix` button in the recommendations pane.
:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-select-fix.png" alt-text="Screenshot showing the details of the recommendation for the Kubernetes node and the highlighted Fix button." lightbox="media/kubernetes-nodes-va/recommendation-node-details-select-fix.png":::

1. To upgrade the node pool VM image, select the **Update Image** button or select **Upgrade Kubernetes** to upgrade the cluster Kubernetes service version.
:::image type="content" source="media/kubernetes-nodes-va/node-pool-overview.png" alt-text="Screenshot showing the overview details of the Kubernetes node pool for updating its image." lightbox="media/kubernetes-nodes-va/node-pool-overview.png":::
