---
title: Kubernetes Nodes Vulnerability Assessment
description: Learn about Defender for Containers vulnerability assessment for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: conceptual
---

# Kubernetes (K8s) node vulnerability assessment

Defender for Containers can scan the [VMs that host K8s nodes](./kubernetes-nodes-overview.md#k8s-node-vms) to assess vulnerabilities to the OS and installed software. Recommendations for remediation are generated for the customer security team to review and remediate as part of the [shared responsibility](./kubernetes-nodes-overview.md#shared-responsibility-of-k8s-nodes) to maintain the K8s nodes of a cluster.

## How vulnerability assessment is done

- Scan disk
- Frequency
- Recommendations
- Review
- Remediation

## Prerequisite

Vulnerability assessment of the nodes must be [enabled by turning on the **Agentless scanning for machines**](./kubernetes-nodes-overview.md#prerequisite---enable-agentless-scanning-for-machines) option in the Defender for Containers, Defender Cloud Security Posture Management, or Defender for Servers P2 plan.

## Review the K8s node vulnerability recommendations

If vulnerabilities are found for a K8s node, a recommendation is generated for the customer to review. To review K8s node recommendations for remediation in the Azure portal:

1. Select **Recommendations** from the **Defender for Cloud** menu.

:::image type="content" source="media/kubernetes-nodes-va/recommendations-list.png" alt-text="Screenshot of selecting the recommendations submenu of the Defender for Cloud pane." lightbox="media/kubernetes-nodes-va/recommendations-list.png":::

1. Select the **AKS nodes should have vulnerability findings resolved** recommendation.

:::image type="content" source="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png" alt-text="Screenshot showing the selection of the nodes recommendation line." lightbox="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png":::

1. The full details of the K8s node recommendation are shown. Along with a full description of the vulnerability, other details such as the name of the affected K8s node pool and its cluster are presented.

:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details.png" alt-text="Screenshot showing the details of the recommendation for the K8s node." lightbox="media/kubernetes-nodes-va/recommendation-node-details.png":::

1. Select the **Findings** tab to view a list of CVEs relating to the K8s node.

:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-findings.png" alt-text="Screenshot of selecting the findings tab to view a list of CVEs related to the K8s node." lightbox="media/kubernetes-nodes-va/recommendation-node-details-findings.png":::

The category column indicates whether a vulnerability has a new node pool VM image or cluster Kubernetes version is available to remediate the vulnerability.

1. Selecting one of the CVE lines opens a pane giving full details about the CVE and all the K8s node resources that also have this vulnerability.

:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-cve-detail.png" alt-text="Screenshot of the pane showing all the details of the CVE and K8s node resources affected." lightbox="media/kubernetes-nodes-va/recommendation-node-cve-details.png":::

## Remediate K8s node vulnerabilities

K8s node vulnerabilities are remediated by updating the node pool VM image version. The node pool is updated by the customer, as part of the shared responsibility between the K8s service and the customer. The customer updates the node pool in one of two ways - either update the node pool VM image and/or update the cluster's K8s service to a newer version. **It is recommended to update the node pool VM image first.** In some cases, the customer may need to update the cluster's K8s service version as well as the node pool VM image version to remediate the vulnerability.

> [!NOTE]
> The cluster's Kubernetes version and the node pool VM image can be [set to auto-update](/azure/aks/upgrade-cluster#configure-automatic-upgrades). These versions should be [regularly updated](/azure/aks/upgrade-cluster) to provide maximum security for you AKS resources.

### Update the node pool VM image

1. Select the `Fix` button in the recommendations pane.

:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-select-fix.png" alt-text="Screenshot showing the details of the recommendation for the K8s node and the highlighted Fix button." lightbox="media/kubernetes-nodes-va/recommendation-node-details-select-fix.png":::

1. To update the node pool VM image, select the **Update Image** button

:::image type="content" source="media/kubernetes-nodes-va/node-pool-overview.png" alt-text="Screenshot showing the overview details of the K8s node pool for updating its image." lightbox="media/kubernetes-nodes-va/node-pool-overview.png":::

1. To update the cluster K8s service version, select the **Update Kubernetes** button

:::image type="content" source="media/kubernetes-nodes-va/node-pool-overview.png" alt-text="Screenshot showing the overview details of the recommendation for the K8s node for updating its K8s version." lightbox="media/kubernetes-nodes-va/node-pool-overview.png":::
