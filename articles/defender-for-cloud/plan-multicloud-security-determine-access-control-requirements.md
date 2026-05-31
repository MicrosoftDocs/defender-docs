---
title: Planning multicloud security determine access control requirements guidance
description: Learn about determining access control requirements to meet business goals in multicloud environment with Microsoft Defender for Cloud.
ms.topic: how-to
author: ElazarK
ms.author: elkrieger
ms.date: 05/31/2026
---

# Determine access control requirements

This article is part of a series to provide guidance as you design a cloud security posture management (CSPM) and cloud workload protection platform (CWPP) solution across multicloud resources with Microsoft Defender for Cloud.

## Goal

Determine the permissions and access controls you need in your multicloud deployment.

## Get started

As part of your multicloud solution design, review access requirements for multicloud resources that users can access. As you plan, answer the following questions, take notes, and document why each answer matters.

- Who should have access to recommendations and alerts for multicloud resources?
- Are your multicloud resources and environments owned by different teams? If so, does each team need the same level of access?
- Do you need to limit access to specific resources for specific users and groups? If so, how can you limit access for Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP) resources?
- Does your organization need identity and access management (IAM) permissions to be inherited at the resource group level?
- Do you need to determine any IAM requirements for people who:
  - Implement just-in-time (JIT) virtual machine (VM) access controls for Azure VMs and Amazon Elastic Compute Cloud (Amazon EC2) instances?
  - Perform security operations?

With clear answers available, you can figure out your Defender for Cloud access requirements. Other things to consider:

- Defender for Cloud multicloud capabilities support IAM permission inheritance.
- User permissions at the resource group level where the AWS and GCP connectors reside are inherited automatically for multicloud recommendations and security alerts.

## Next steps

In this article, you learned how to determine access control requirements when you design a multicloud security solution. Continue to the next step to [determine multicloud dependencies](plan-multicloud-security-determine-multicloud-dependencies.md).
