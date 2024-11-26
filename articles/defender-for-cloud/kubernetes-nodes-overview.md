---
title: Overview of Kubernetes Nodes Protection
description: Learn about Defender for Containers vulnerability assessment and malware detection for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: overview
---

# Overview of Defender for Containers protection of Kubernetes (K8s) nodes

In addition to protecting the K8s cluster control plane and workloads, Defender for Containers also protects K8s nodes.

## K8s node VMs

A K8s node is hosted on a VM supported by the K8s service. A cluster has ***node pools*** (or ***node groups***). A node pool is a set of nodes having the same supported VM type and version. The K8s service allows the customer to configure a cluster, including the VM type of its node pools, as necessary for the applications running in the cluster.

## Shared responsibility of K8s nodes

The responsibility for maintaining the K8s nodes is shared between the K8s service and the customer.

- **The K8s service** maintains and patches the OS and the software of its supported node VM images by providing upgraded versions.
- **The customer** is responsible for initially configuring the Kubernetes node pools based on the requirements of the applications running in the cluster. The customer is also responsible for upgrading the node pool VM version as required to improve security, and support the applications running in the cluster.

## K8s node protections

The following protections are provided for K8s nodes:

- [Vulnerability assessment](kubernetes-nodes-va.md) - An inventory of K8s node software is analyzed for known vulnerabilities. Recommendations are generated for the customer to review and remediate.

- [Malware detection](kubernetes-nodes-malware.md) - K8s nodes are analyzed for malware. A security alert is generated for the customer to review and remediate.

> [!Note]
> Malware detection for AKS nodes is available only for Defender for Containers or Defender for Servers P2 enabled environments that have **Agentless scanning for machines** enabled.

The K8s nodes protections are provided by taking snapshots of node pool disks for scanning. See the [Agentless scanning architecture description](./concept-agentless-data-collection.md#how-agentless-scanning-works) for details.

## Enable agentless scanning for machines

Protection for K8s nodes is enabled by enabling **Agentless scanning for machines** in the Defender for Containers, Defender Cloud Security Posture Management, or Defender for Servers P2 plan.

To enable agentless scanning for machines in the Defender for Containers plan in the Azure portal:

1. Select the relevant subscription.
2. Select **Environment Settings** from the **Defender for Cloud** menu.
3. Select **Settings** for the **Defender for Container** plan.

:::image type="content" source="media/kubernetes-nodes-overview/settings-plans-containers-settings-select.png" alt-text="Screenshot of selecting the settings option of Defender for Containers plan." lightbox="media/kubernetes-nodes-overview/settings-plans-containers-settings-select.png":::

1. In the settings pane, turn on **Agentless scanning for machines** toggle.

:::image type="content" source="media/kubernetes-nodes-overview/agentless-scanning-for-machines.png" alt-text="Screenshot of turning on the agentless scanning for machines toggle." lightbox="media/kubernetes-nodes-overview/agentless-scanning-for-machines.png":::

1. Select **Save**.
