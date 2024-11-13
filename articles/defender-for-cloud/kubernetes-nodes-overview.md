---
title: Overview of Kubernetes Nodes Protection
description: Learn about Defender for Containers vulnerability assessment and malware detection for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: overview
---

# Overview of Defender for Containers protection of Kubernetes (K8s) node hosts
In addition to providing vulnerability assessment and malware detection of the K8s cluster control plane and workloads, Defender for Containers can also assess vulnerabilities and discover malware threats in the K8s node hosts.

## What are K8s node hosts

- K8s cluster nodes are hosted on VMs supported by the K8s service. Each K8s node must have the same supported VM and version for all of its hosts.
- The K8s service allows the customer to configure a cluster, including the selection of node host VMs, to support the requirements of applications running in the cluster.

## Shared responsibility of K8s node hosts

The responsibility for maintaining the K8s node hosts are shared between the K8s service and the customer.

- **The K8s service** maintains the OS and software of its supported node host VMs by providing updated versions.
- **The customer** is responsible for initially configuring the Kubernetes node hosts based on the requirements of the applications running in the cluster. The customer is also responsible for updating the node host VMs as required for applications running in the cluster and for security.

## Vulnerability assessment

  The K8s node hosts are frequently scanned and an inventory of the OS and software applications are created. Known vulnerabilities cause recommendations to be generated for review by the customer.

## Malware detection

When malware is detected in a K8s host VM, a security alert is generated to enable review and remediation.

## How vulnerability assessment and malware detection is performed

Snapshots are taken of node host VM disks for scanning. See the [Agentless scanning architecure description](concept-agentless-data-collection#how-agentless-scanning-works) for details.

## Prerequisites

Vulnerability assessment and malware detection for node host VMs can be enabled by turning on the **Agentless scanning for machines** option in the Defender for Containers plan.
