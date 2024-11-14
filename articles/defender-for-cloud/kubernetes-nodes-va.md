---
title: Kubernetes Nodes Vulnerability Assessment
description: Learn about Defender for Containers vulnerability assessment for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: conceptual
---

# Kubernetes (K8s) node host vulnerability assessment

Defender for Containers can scan the VMs that host K8s nodes to assess vulnerabilities to the OS and installed software. Recommendations for remediation are generated for the customer security team to review.

> [!Note]
> Protection of K8s nodes is offered for Microsoft Azure Kubernetes Services (AKS).

## K8s node host

A K8s cluster node is hosted on a VM supported by the K8s service. A set of nodes ("node pool" or "node group") must have the same supported VM and version for each node. The K8s service allows the customer to configure a cluster, including the selection of node host VMs, to support the requirements of applications running in the cluster. Maintenance of the node host VM is [a shared responsibility](./kubernetes-nodes-overview.md#share-responsibility-of-k8s-nodes) between the K8s provider and the customer.

## How vulnerability assessment is done

- Scan disk
- Frequency
- Recommendations
- Review
- Remediation

## Prerequisites

Vulnerability assessment for node VM hosts must be enabled by turning on the **Agentless scanning for machines** option in the Defender for Containers, Defender Cloud Security Posture Management, or Defender for Servers P2 plan.

To enable the agentless scanning for machines option in Defender for Containers in the Azure portal:

1. Select the relevant subscription.
1. Select **Environment Settings** from the **Defender for Cloud** menu.
1. Select **Settings** for the **Defender for Container** plan.
    :::image type="content" source="media/kubernetes-nodes-va/settings-plans-containers-settings-select.png" alt-text="Screenshot of the how the agentless scanning for machines option is enabled." lightbox="media/kubernetes-nodes-va/settings-plans-containers-settings-select.png":::

1. In the settings pane, turn on **Agentless scanning for machines**.

    :::image type="content" source="media/kubernetes-nodes-va/agentless-scanning-for-machines.png" alt-text="Screenshot of the how the agentless scanning for machines option is enabled." lightbox="media/kubernetes-nodes-va/agentless-scanning-for-machines.png":::

1. Select **Save**.

## Review the K8s node vulnerability recommendations

If the vulnerability assessment finds vulnerabilities for a K8s node, a recommendation is generated for the customer to review. To review K8s node recommendations for remediation in the Azure portal:

1. Select **Recommendations** from the **Defender for Cloud** menu.
:::image type="content" source="media/kubernetes-nodes-va/recommendations-list.png" alt-text="Screenshot of the how the agentless scanning for machines option is enabled." lightbox="media/kubernetes-nodes-va/recommendations-list.png":::

1. Select the **AKS nodes should have vulnerability findings resolved** recommendation.
:::image type="content" source="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png" alt-text="Screenshot of the how the agentless scanning for machines option is enabled." lightbox="media/kubernetes-nodes-va/recommendations-list-select-nodes-va.png":::

1. The full details of the K8s node recommendation are presented.
:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details.png" alt-text="Screenshot of the how the agentless scanning for machines option is enabled." lightbox="media/kubernetes-nodes-va/recommendation-node-details.png":::

    The recommendation details include a full description of the vulnerability, and other details such as the name of the affected K8s node pool and its cluster.

1. Select the **Findings** tab to view a list of CVEs relating to the K8s node.
:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-details-findings.png" alt-text="Screenshot of the how the agentless scanning for machines option is enabled." lightbox="media/kubernetes-nodes-va/recommendation-node-details-findings.png":::

1. Selecting one of the CVE lines opens a pane giving full details about the CVE and all the K8s node resources that also have this vulnerability.
:::image type="content" source="media/kubernetes-nodes-va/recommendation-node-cve-details.png" alt-text="Screenshot of the how the agentless scanning for machines option is enabled." lightbox="media/kubernetes-nodes-va/recommendation-node-cve-details.png":::

## Describe remediation process in MDC portal
