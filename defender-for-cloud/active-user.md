---
title: Assign a recommendation to an active user
description: Learn how to assign recommendations to active users in Defender for Cloud to enhance security and streamline remediation processes.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to assign recommendations to Active Users in Defender for Cloud to enhance security and streamline remediation processes.
ai-usage: ai-assisted
---

# Assign a recommendation to an active user

Microsoft Defender for Cloud has an active user feature. It helps security admins find the users who most often fix recommendations. To keep cloud resources safe, admins need to track and address potential threats and related recommendations.

The active user feature suggests up to three users. Defender for Cloud bases its suggestions on each user's control plane activity on the resource, its resource group, or the subscription. This feature speeds up fixes and strengthens your security posture.

Admins can assign the recommendation to the best user from the suggested list. That user gets a notification and a due date, so no one has to figure out who is responsible. This approach saves time for security teams.

## Prerequisites

Before you start, make sure you meet these requirements:

- [Enable the Defender for Cloud Security Posture Management (Defender CSPM) plan](tutorial-enable-cspm-plan.md).

- Make sure you have one of the following roles and permissions:
  - Security Administrator
  - Owner
  - Contributor

- [Review cloud availability](support-matrix-defender-for-cloud.md).

## Assign a recommendation

To assign a recommendation to an active user:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Review the **Recommendation owner** column.

    :::image type="content" source="media/active-user/recommended-owner.png" alt-text="Screenshot that shows the Recommended owner column on the Recommendations page." lightbox="media/active-user/recommended-owner.png":::

1. Select a recommendation that has a suggested owner.

1. In the **Recommendation owner and set due date** section, find the top suggested active user for the resource.

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

If you set an email notification, the user gets an email. The email includes the recommendation details and a link to view it in Defender for Cloud.

## Next steps

> [!div class="nextstepaction"]
> [Remediate recommendations](implement-security-recommendations.md)

