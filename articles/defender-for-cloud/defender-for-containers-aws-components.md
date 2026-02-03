---
title: Configure AWS settings for Defender for Containers components
description: Learn how to configure required AWS settings for Microsoft Defender for Containers components, including control plane access, audit logging, and registry scanning.
ms.topic: how-to
ms.date: 02/01/2026
ms.author: elkrieger
author: Elazark
---

# Configure AWS settings for Defender for Containers components

Some Microsoft Defender for Containers components depend on AWS configuration outside of Microsoft Defender for Cloud. After you [enable the Containers plan on your AWS connector](defender-for-containers-enable-portal.md?tab=eks), configure the relevant AWS settings so Defender for Cloud can collect the data required for those components.

This configuration is relevant if you enabled one or more of the following Defender for Containers components:

- Agentless threat protection
- Kubernetes API access
- Registry access

## Enable audit logging

**Required if you enabled:** Agentless threat protection

Audit logs are required for Defender for Cloud to analyze Kubernetes control plane activity and generate control plane threat detections.

Enable Kubernetes audit logging for each EKS cluster:

```bash
aws eks update-cluster-config \
  --name <cluster-name> \
  --logging '{"clusterLogging":[{"types":["audit","authenticator"],"enabled":true}]}'
```

## Configure Kubernetes control plane access 

**Required if you enabled:** Agentless discovery for Kubernetes

Defender for Cloud requires access to the Kubernetes API server. You must map the role `MDCContainersAgentlessDiscoveryK8sRole` into the EKS cluster.

Choose one of the following methods.

### Option 1: Use the Python onboarding script

Run the onboarding script from the Microsoft Defender for Cloud repository.

**Python onboarding repository script:**  
https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Onboarding/AWS/ReadMe.md

The script automatically adds the required role mapping to the `aws-auth` ConfigMap.

### Option 2: Use eksctl

Create the IAM identity mapping manually:

```bash
eksctl create iamidentitymapping \
  --cluster my-cluster \
  --region region-code \
  --arn arn:aws:iam::account:role/MDCContainersAgentlessDiscoveryK8sRole \
  --group system:masters \
  --no-duplicate-arns
```
## Configure ECR vulnerability scanning

**Required if you enabled:** Registry access

1. Go to your **AWS connector** settings in Microsoft Defender for Cloud.

1. Select **Configure** next to the **Containers** plan.

1. Verify **Registry access** is enabled.

1. Images pushed to **Amazon ECR** are automatically scanned within 24 hours.

## Related content

- [Enable Defender for Containers in Microsoft Defender for Cloud](defender-for-containers-enable-portal.md)