---
title: Assign a Recommendation to an Active User
author: Elazark
ms.author: elkrieger
description: Learn how to assign recommendations to active users in Defender for Cloud to enhance security and streamline remediation processes.
ms.topic: how-to
ms.date: 05/06/2025
#customer intent: As a security administrator, I want to assign recommendations to Active Users in Defender for Cloud to enhance security and streamline remediation processes.
---

# Assign a recommendation to an active user

Microsoft Defender for Cloud has an active user feature that helps security administrators identify the most active users who handle remediation recommendations. To secure cloud resources, security administrators must monitor and address potential threats and their associated recommendations.

The active user feature suggests up to three potential active users. Defender for Cloud makes suggestions based on the users' control plane activities on the specific resource, its related resource group, or the associated subscription. This feature improves the speed and efficiency of the remediation process and strengthens overall security posture.

Security administrators can directly assign the recommendation to the most appropriate user from the suggested active user list. The assigned user receives a notification and a due date for remediation, and no one needs to determine responsibility. This approach streamlines the workflow and saves time for security teams.

## Prerequisites

- [Enable the Defender for Cloud Security Posture Management (Defender CSPM) plan](tutorial-enable-cspm-plan.md).

- Make sure you have one of the following roles and permissions:
  - Security Administrator
  - Owner
  - Contributor

- [Review cloud availability](support-matrix-cloud-environment.md).

## Assign a recommendation to an active user

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Review the **Recommendation owner** column.

    :::image type="content" source="media/active-user/recommended-owner.png" alt-text="Screenshot that shows the Recommended owner column on the Recommendations page." lightbox="media/active-user/recommended-owner.png":::

1. Select a recommendation that has a suggested owner.

1. In the **Recommendation owner and set due date** section, Defender for Cloud suggests the top active user on the affected resource.

    :::image type="content" source="media/active-user/suggested-user.png" alt-text="Screenshot that shows the top suggested active user on the resource." lightbox="media/active-user/suggested-user.png":::

1. Select **Assign owner & set due date**.

1. Review the activity details and confidence of the top three suggested users.

    :::image type="content" source="media/active-user/select-active-user.png" alt-text="Screenshot that shows the activity and confidence of the top three suggested users." lightbox="media/active-user/select-active-user-zoom.png":::

1. To view more information about the user, select **More info**. You can see a user's name, email address, manager, department, role, and last activities.

1. (Recommended) Select an owner from the list of suggested users.

1. (Optional) Select **Add a user manually** if you don't want to assign any of the suggested users.

1. (Optional) Select a remediation time frame.

1. (Optional) Turn on the **Apply grace period** toggle.

1. (Optional) Set email notifications.

1. Select **Create**.

If you set an email notification, the active user receives an email with recommendation details and a link to the recommendation in Defender for Cloud.

## Next step

> [!div class="nextstep"]
> [Remediate recommendations](implement-security-recommendations.md)
