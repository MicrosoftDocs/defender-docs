---
title: Overview of Kubernetes Nodes Protection
description: Learn about Defender for Containers vulnerability assessment and malware detection for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: overview
---

# Overview of Defender for Containers protection of Kubernetes (K8s) nodes
In addition to providing vulnerability assessment and malware detection of the K8s cluster control plane and workloads, Defender for Containers can also assess vulnerabilities and discover malware threats in an K8s node.

> [!Note]
> Protection of K8s nodes is offered for Microsoft Azure Kubernetes Services (AKS).

## What is a K8s node

- A K8s cluster node is hosted on a VM supported by the K8s service. A set of nodes ("node pool" or "node group") must have the same supported VM and version for each node.
- The K8s service allows the customer to configure a cluster, including the selection of node host VMs, to support the requirements of applications running in the cluster.

## Shared responsibility of K8s nodes

The responsibility for maintaining the K8s nodes are shared between the K8s service and the customer.

- **The K8s service** maintains and patches the OS and software of its supported node host VMs by providing updated versions.
- **The customer** is responsible for initially configuring the Kubernetes node pools or node groups based on the requirements of the applications running in the cluster. The customer is also responsible for updating the node VMs as required for applications running in the cluster and to improve security.

## Vulnerability assessment

  The K8s nodes are frequently scanned and an inventory of the OS and software applications are created. Recommendations are created when known vulnerabilities cause recommendations to be generated for review by the customer.

## Malware detection

When malware is detected in a K8s node, a security alert is generated to enable the security team to review and remediation.

## How vulnerability assessment and malware detection is performed

Snapshots are taken of node host VM disks for scanning. The scan generates an OS and software inventory list which is reviewed to determine what software should be updated. See the [Agentless scanning architecure description](concept-agentless-data-collection#how-agentless-scanning-works) for details.

## Prerequisites

Vulnerability assessment and malware detection for node VM hosts can be enabled by turning on the **Agentless scanning for machines** option in the Defender for Containers plan.
