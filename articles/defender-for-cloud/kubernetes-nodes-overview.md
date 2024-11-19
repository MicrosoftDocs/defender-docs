---
title: Overview of Kubernetes Nodes Protection
description: Learn about Defender for Containers vulnerability assessment and malware detection for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: overview
---

# Overview of Defender for Containers protection of Kubernetes (K8s) nodes

Defender for Containers runs vulnerability assessment and malware detection of the K8s cluster control plane and workloads. In addition, Defender for Containers can also assess vulnerabilities and discover malware threats in K8s nodes.

> [!Note]
> Protection of K8s nodes is presently offered for Microsoft Azure Kubernetes Services (AKS).

## K8s node VMs

A K8s node is hosted on a VM supported by the K8s service. A cluster has ***node pools*** (or ***node groups***). A node pool is a set of nodes with the same supported VM type and version. The K8s service allows the customer to configure a cluster, including node pools and the VM type for each node pool as required for the applications running in the cluster.

## Shared responsibility of K8s nodes

The responsibility for maintaining the K8s nodes is shared between the K8s service and the customer.

- **The K8s service** maintains and patches the OS and software of the VMs it supports for nodes by providing updated versions.
- **The customer** is responsible for initially configuring the Kubernetes node pools based on the requirements of the applications running in the cluster. The customer is also responsible for updating the node pool VM version as required to improve security and support the applications running in the cluster.

## Vulnerability assessment

  Vulnerability assessment is provided using Microsoft Defender Vulnerability Management. The K8s nodes are frequently scanned and an inventory of the OS and software applications are created. The inventory is then searched for known vulnerabilities. When vulnerabilities are found, recommendations are generated and the customer can review them to decide what action to take.

## Malware detection

Defender for Containers uses the Microsoft Defender Antivirus anti-malware engine to scan and detect malicious files in K8s nodes. When threats are detected, security alerts are directed into Defender for Cloud and Defender XDR, where they can be investigated and remediated.

> [!Note]
> Malware detection for AKS nodes is available only for Defender for Containers or Defender for Servers P2 enabled environments that have the **agentless scanning for machines** option turned on.

## The vulnerability assessment and malware detection process

Snapshots are taken of node pool VM disks for scanning. The scan generates an OS and software inventory list which is analyzed to determine what software has vulnerabilities and detect installed malware. See the [Agentless scanning architecture description](./concept-agentless-data-collection.md#how-agentless-scanning-works) for details.

## Prerequisite - Enable agentless scanning for machines

Vulnerability assessment and malware detection for nodes must be enabled by turning on the **Agentless scanning for machines** option in the Defender for Containers, Defender Cloud Security Posture Management, or Defender for Servers P2 plan.

To enable the agentless scanning for machines option in Defender for Containers in the Azure portal:

1. Select the relevant subscription.
2. Select **Environment Settings** from the **Defender for Cloud** menu.
3. Select **Settings** for the **Defender for Container** plan.

:::image type="content" source="media/kubernetes-nodes-overview/settings-plans-containers-settings-select.png" alt-text="Screenshot of selecting the settings option of Defender for Containers plan." lightbox="media/kubernetes-nodes-overview/settings-plans-containers-settings-select.png":::

1. In the settings pane, turn on **Agentless scanning for machines**.

:::image type="content" source="media/kubernetes-nodes-overview/agentless-scanning-for-machines.png" alt-text="Screenshot of turning on the agentless scanning for machines option." lightbox="media/kubernetes-nodes-overview/agentless-scanning-for-machines.png":::

1. Select **Save**.
