---
title: Assign a recommendation to an Active User
author: Elazark
ms.author: elkrieger
description: Learn how to assign recommendations to Active Users in Defender for Cloud to enhance security and streamline remediation processes.
ms.topic: how-to
ms.date: 05/06/2025
#customer intent: As a security administrator, I want to assign recommendations to Active Users in Defender for Cloud to enhance security and streamline remediation processes.
---

# Assign a recommendation to an Active User

Defender for Cloud’s Active User feature helps security administrators identify the most active users responsible for remediation recommendations. Security administrators must monitor and address potential threats such as attack paths and their associated recommendations to secure cloud resources. 

The Active User feature suggests up to three potential active users. The suggestion is based on the users control plane activities on the specific resource, its related resource group, or the associated subscription. This feature improves the speed and efficiency of the remediation process and strengthens overall security posture. 

Security administrators can assign and the recommendation directly to the most appropriate user from the suggested active user list. The assigned user receives a notification and a due date for remediation, which eliminates the need for manual investigation to determine responsibility. This approach streamlines the workflow and saves time for security teams.

## Prerequisites

- [Enable the Defender for Cloud Security Posture Management (CSPM) plan](tutorial-enable-cspm-plan.md).

- You have one of the following roles and permissions: 
  - Security Administrator
  - Owner
  - Contributor

- [Review the Cloud availability](support-matrix-cloud-environment.md).

## Assign a recommendation to an active user

Defender for Cloud's Active User feature suggests up to three potential Active Users. It bases its suggestions on their control plane activities on the specific resource, its related resource group, or the associated subscription per recommendation.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Defender for Cloud** > **Recommendations**.

1. Review the Recommendation owner column.

    :::image type="content" source="media/active-user/recommended-owner.png" alt-text="Screenshot that shows where the recommended owner column is located on the recommendations page." lightbox="media/active-user/recommended-owner.png":::

1. Select a recommendation with a suggested owner.

1. The *Recommendation owner and set due date* section suggests the top Active User on the affected resource.

    :::image type="content" source="media/active-user/suggested-user.png" alt-text="Screenshot that shows the top suggested Active User on the resource." lightbox="media/active-user/suggested-user.png":::

1. Select **Assign owner & set due date**.

1. Review the activity and confidence assigned to the top three suggested users.

    :::image type="content" source="media/active-user/select-active-user.png" alt-text="Screenshot that shows the activity and confidence assigned to the top three suggested users." lightbox="media/active-user/select-active-user-zoom.png":::

1. Select **More info** to view more information about the user, including, name, email address, the user's manager, department, role, and last activities.

1. (Recommended) Select an owner from the list of suggested users.

1. (Optional) Select **add a user manually** if you don't want to assign any of the suggested users.

1. (Optional) Select a remediation timeframe.

1. (Optional) Toggle **Apply grace period**.

1. (Optional) Set email notifications.

1. Select **Create**.

If you selected to set an email notification, the Active User receives an email with the recommendation details and a link to the recommendation in Defender for Cloud.

## Next step

> [!div class="nextstep"]
> [Remediate recommendations](implement-security-recommendations.md)
