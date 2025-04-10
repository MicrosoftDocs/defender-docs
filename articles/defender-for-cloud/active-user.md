---
title: Assign recommendations to an active user
author: Elazark
ms.author: elkrieger
description: Learn how to assign recommendations to active users in Defender for Cloud to enhance security and streamline remediation processes.
ms.topic: how-to
ms.date: 04/10/2025
#customer intent: As a security administrator, I want to assign recommendations to active users in Defender for Cloud to enhance security and streamline remediation processes.
---

# Assign recommendations to an active user

Defender for Cloud's active user feature helps security administrators quickly identify the most active users who are responsible for remediating recommendations. Security administrators must monitor and address potential threats that are presented as attack paths and their associated recommendations to secure cloud resources.

The active user feature suggests up to three potential active users based on their control plane activities performed on the specific resource, its related resource group, or the associated subscription per recommendation. The active user feature improves the speed and efficiency of the remediation process, enhancing overall security measures.

## Prerequisites

- [Enable the Defender for Cloud Security Posture Management (CSPM) plan](tutorial-enable-cspm-plan.md).

- You have one of the following roles and permissions: 
  - Security Administrator
  - Owner
  - Contributor

- [Review the Cloud availability](support-matrix-cloud-environment.md).

## Assign a recommendation to an active user

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Defender for Cloud** > **Recommendations**.

1. Select a recommendation.

1.