---
title: Overview of Kubernetes Nodes Protection
description: Learn about Defender for Containers vulnerability assessment and malware detection for Kubernetes nodes.
ms.date: 03/09/2026
ms.topic: overview
---

# Kubernetes node protection in Microsoft Defender for Cloud

Microsoft Defender for Cloud helps protect supported Azure Kubernetes Service (AKS) nodes by providing vulnerability assessment and malware detection for the virtual machines (VMs) that run your cluster workloads.

These protections help you identify vulnerabilities and detect malware on the nodes that support your cluster.

## Protections for Kubernetes nodes

Defender for Cloud provides the following protections for supported Kubernetes nodes:

- [Vulnerability assessment](kubernetes-nodes-va.md) identifies known vulnerabilities on node software and surfaces recommendations to help you remediate them.

- [Malware detection](kubernetes-nodes-malware.md) scans nodes for malware and generates security alerts when malware is detected.

For support details, view the [support matrix for Defender for Containers](support-matrix-defender-for-containers.md).

## How Kubernetes node protection works

Kubernetes node protection uses agentless, snapshot-based scanning of node pool disks.

This capability relies on **Agentless scanning for machines**. When that feature is enabled in a supported plan, Defender for Cloud can scan supported Kubernetes nodes and surface findings in recommendations and alerts.

For more information about the underlying architecture, see [Agentless scanning architecture](concept-agentless-data-collection.md).

## Shared responsibility

Responsibility for Kubernetes nodes is shared between the managed Kubernetes service and your organization.

- The managed Kubernetes service provides supported node VM images and updated versions.
- You configure node pools based on your workload requirements.
- You are responsible for upgrading node pool VM versions to adopt newer images and improve your security posture.

## Related content

- [Vulnerability assessment for Kubernetes nodes](kubernetes-nodes-va.md)

- [Malware detection for Kubernetes nodes](kubernetes-nodes-malware.md)