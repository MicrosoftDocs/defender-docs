---
title: Kubernetes Nodes Vulnerability Assessment
description: Learn about Defender for Containers vulnerability assessment for Kubernetes nodes.
ms.date: 11/15/2024
ms.topic: conceptual
---

# Kubernetes (K8s) node host vulnerability assessment

Defender for Containers can scan the VMs that host K8s nodes to assess vulnerabilities to the OS and installed software. Recommendations for remediation are generated for the customer security team to review.

## What are K8s node hosts

- A K8s cluster node is hosted on a VM supported by the K8s service. A set of nodes ("node pool" or "node group") must have the same supported VM and version for each node.
- The K8s service allows the customer to configure a cluster, including the selection of node host VMs, to support the requirements of applications running in the cluster.

## Describe VA process
- Scan disk
- Frequency
- Recommendations
- Review
- Remediation

## Prerequisites

Vulnerability assessment for node VM hosts must be enabled by turning on the `Agentless scanning for machines` option in the Defender for Containers, Defender Cloud Security Posture Management, or Defender for Servers P2 plan.

To enable agentless scanning for machines option in Defender for Containers, using the Azure portal:

1. Select the relevant subscription.
2. Select **Environment Settings** from the Defender for Cloud menu.
3. In the settings pane, turn on **Agentless scanning for machines**.

    :::image type="content" source="media/kubernetes-nodes-va/agentless-scanning-for-machines.png" alt-text="Screenshot of the how the agentless scanning for machines option is enabled." lightbox="media/kubernetes-nodes-va/agentless-scanning-for-machines.png":::

4. Select **Save**.

## Describe review process in MDC portal

## Describe remediation process in MDC portal
