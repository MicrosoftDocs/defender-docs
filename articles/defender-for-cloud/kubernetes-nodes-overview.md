---
title: Overview of Kubernetes Nodes Protection
description: Learn about Defender for Containers vulnerability assessment and malware detection for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: overview
---

# Overview of Defender for Cloud protection of Kubernetes nodes

In addition to protecting the Kubernetes cluster control plane and workloads, Defender for Cloud also extends security and compliance over the Kubernetes nodes in the customer's multicloud Kubernetes services.

## Protection for Kubernetes nodes

Kubernetes nodes are VMs created by the cloud environment's Kubernetes service to run the Kubernetes cluster's control plane and workload. A cluster's ***node pools*** (or ***node groups***) are a managed set of identical VM type and versions. The Kubernetes service allows the customer to configure a cluster, including the configuration of node pools. A node pool configuration includes setting the number of nodes, and the identical VM type and version of the nodes. The customer determines the configuration of the cluster's node pools according to the requirements of the applications running in it. The customer also manages each node pool as a set - all nodes in the pool are configured and updated together. 

The customer upgrades the node pool VM version to improve node security, as indicated by Defender for Cloud recommendations.

## Shared responsibility of Kubernetes nodes

The responsibility for maintaining the Kubernetes nodes is shared between the Kubernetes service and the customer.

- **The Kubernetes service** maintains and patches the OS and the software of its supported node VM images by providing upgraded versions.
- **The customer** is responsible for initially configuring the Kubernetes node pools based on the requirements of the applications running in the cluster. The customer is also responsible for upgrading the node pool VM version as required to improve security, and support the applications running in the cluster.

## Kubernetes node protections

The following protections are provided for Kubernetes nodes:

- [Vulnerability assessment](kubernetes-nodes-va.md) - Kubernetes node software is scanned for known vulnerabilities. Recommendations are generated for the customer to review and remediate.

- [Malware detection](kubernetes-nodes-malware.md) - Kubernetes nodes are scanned for malware. A security alert is generated for the customer to review and remediate.

> [!Note]
> Malware detection for AKS nodes is available only for Defender for Containers or Defender for Servers P2 enabled environments that have **Agentless scanning for machines** enabled.

The Kubernetes nodes protections are provided by taking snapshots of node pool disks for scanning. See the [Agentless scanning architecture description](./concept-agentless-data-collection.md#how-agentless-scanning-works) for details.

## Enable agentless scanning for machines

Protection for Kubernetes nodes is enabled by toggling on **Agentless scanning for machines** in the Defender for Containers, Defender Cloud Security Posture Management, or Defender for Servers P2 plan.

To enable agentless scanning for machines in the Defender for Containers plan in the Azure portal:

1. Select the relevant subscription.
2. Select **Environment Settings** from the **Defender for Cloud** menu.
3. Select **Settings** for the **Defender for Container** plan.

:::image type="content" source="media/kubernetes-nodes-overview/settings-plans-containers-settings-select.png" alt-text="Screenshot of selecting the settings option of Defender for Containers plan." lightbox="media/kubernetes-nodes-overview/settings-plans-containers-settings-select.png":::

1. In the settings pane, turn on **Agentless scanning for machines** toggle.

:::image type="content" source="media/kubernetes-nodes-overview/agentless-scanning-for-machines.png" alt-text="Screenshot of turning on the agentless scanning for machines toggle." lightbox="media/kubernetes-nodes-overview/agentless-scanning-for-machines.png":::

1. Select **Save**.
