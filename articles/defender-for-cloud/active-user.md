---
title: Assign recommendations to an active user
author: Elazark
ms.author: elkrieger
description: Learn how to assign recommendations to active users in Defender for Cloud to enhance security and streamline remediation processes.
ms.topic: how-to
ms.date: 05/06/2025
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

1. Review the Recommendation owner column. If no owner is assigned, the recommendation column will suggest an owner.

    :::image type="content" source="media/active-user/recommended-owner.png" alt-text="Screenshot that shows where the recommended owner column is located on the recommendations page." lightbox="media/active-user/recommended-owner.png":::

1. Select a recommendation that doesn't have an owner assigned.

1. The Recommendation owner and set due date section will suggest the top active user on the affected resource.

    :::image type="content" source="media/active-user/suggested-user.png" alt-text="Screenshot that shows the top suggested active user on the resource." lightbox="media/active-user/suggested-user.png":::

1. Select **Assign owner & set due date**.

1. Review the activity and confidence assigned to the top 3 suggested users.

    :::image type="content" source="media/active-user/select-active-user.png" alt-text="Screenshot that shows the activity and confidence assigned to the top 3 suggested users." lightbox="media/active-user/select-active-user.png":::

1. Select **More info** to view more information about the user.

1. Select an owner from the list of suggested users or add a user manually.

1. Select a remediation timeframe.

1. (Optional) Toggle **Apply grace period**.

1. (Optional) Set email notifications.

1. Select **Create**.
