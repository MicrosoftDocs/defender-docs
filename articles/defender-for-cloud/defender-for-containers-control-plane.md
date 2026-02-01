---
title: Configure Kubernetes control plane access for Defender for Containers
description: Learn how to grant Kubernetes control plane permissions for Microsoft Defender for Containers so Defender for Cloud can access required Kubernetes API data.
ms.topic: how-to
ms.date: 02/01/2026
ms.author: elkrieger
author: Elazark
---

# Configure Kubernetes control plane access for Defender for Containers

Some Microsoft Defender for Containers capabilities require Microsoft Defender for Cloud to access the Kubernetes control plane (Kubernetes API). This article explains how to grant the required permissions.

## When you need to configure control plane permissions

If you enabled Agentless discovery for Kubernetes, you need to configure control plane permissions so Defender for Cloud can access the Kubernetes control plane.

## Grant control plane permissions on Amazon EKS

Grant permissions using one of the following methods.

### Option 1: Use the Python script

Run the Python onboarding repository script to automatically add the required role mapping to your cluster:

- [Python onboarding repository script](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Onboarding/AWS/ReadMe.md)

This script adds the Defender for Cloud role `MDCContainersAgentlessDiscoveryK8sRole` to the `aws-auth` ConfigMap.

### Option 2: Use eksctl

You can manually create the IAM identity mapping:

```bash
eksctl create iamidentitymapping \
  --cluster my-cluster \
  --region region-code \
  --arn arn:aws:iam::account:role/MDCContainersAgentlessDiscoveryK8sRole \
  --group system:masters \
  --no-duplicate-arns
