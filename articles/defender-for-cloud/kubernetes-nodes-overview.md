---
title: Overview of Kubernetes Nodes Protection
description: Learn about Defender for Containers vulnerability assessment and malware detection for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: overview
---

# Overview of Defender for Containers protection of Kubernetes (K8s) nodes
Defender for Containers runs vulnerability assessment and malware detection of the K8s cluster control plane and workloads. In addition, Defender for Containers can also assess vulnerabilities and discover malware threats in an K8s node.

> [!Note]
> Protection of K8s nodes is presently offered for Microsoft Azure Kubernetes Services (AKS).

## K8s node VMs

A K8s node is hosted on a VM supported by the K8s service. A cluster has ***node pools*** (or ***node groups***). A node pool is a set of nodes with the same supported VM type and version. The K8s service allows the customer to configure a cluster, including node pools and the VM type for each node pool as required for the applications running in the cluster.

## Shared responsibility of K8s nodes

The responsibility for maintaining the K8s nodes is shared between the K8s service and the customer.

- **The K8s service** maintains and patches the OS and software of its supported node host VMs by providing updated versions.
- **The customer** is responsible for initially configuring the Kubernetes node pools based on the requirements of the applications running in the cluster. The customer is also responsible for updating the node pool as required for applications running in the cluster and to improve security.

## Vulnerability assessment

  The K8s nodes are frequently scanned and an inventory of the OS and software applications are created. The inventory is then searched for known vulnerabilities. When vulnerabilities are found, recommendations are generated and the customer can review them to decide what action to take.

## Malware detection

When malware is detected in a K8s node, a security alert is generated to enable the security team to review and remediation.

## The vulnerability assessment and malware detection process

Snapshots are taken of node host VM disks for scanning. The scan generates an OS and software inventory list which is reviewed to determine what software should be updated. See the [Agentless scanning architecture description](./concept-agentless-data-collection.md#how-agentless-scanning-works) for details.

## Prerequisites

Vulnerability assessment and malware detection for node VM hosts can be enabled by turning on the **Agentless scanning for machines** option in the Defender for Containers plan.
