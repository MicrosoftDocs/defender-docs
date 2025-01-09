---
title: Configure admin notifications
description: This article provides instructions for setting admin preferences in Defender for Cloud Apps.
ms.date: 01/29/2023
ms.topic: how-to
---
# Configure admin notifications



Microsoft Defender for Cloud Apps allows you to customize your admin notification settings. The notification settings allow admins to specify if they would like to receive email notifications for alerts.

## Customize your notifications

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **My account**, select **My email notifications**.

1. In the **My email notifications** page, set the email notification preferences for emails you receive from the system. You can set the severity that determines which alerts and violations you want to receive emails. The severity is set per policy. When violations are triggered, you receive email notification depending on the setting here and the Severity setting in the policy that was violated. Emails are sent to the alias associated with the administrator user account you used to sign in to Defender for Cloud Apps.

    > [!NOTE]
    >
    > - Notifications are not sent for Microsoft Entra IPC events.

    ![notification settings.](media/notification-settings.png)

1. When you're done, select **Save**.

## Next steps

> [!div class="nextstepaction"]
> [Set up cloud discovery](set-up-cloud-discovery.md)

[!INCLUDE [Open support ticket](includes/support.md)]
