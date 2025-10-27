---
title: Configure email notifications for alerts and attack paths
description: Learn how to fine-tune the Microsoft Defender for Cloud security alert emails to ensure the right people receive timely notifications.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 09/10/2025
ms.custom: mode-other
zone_pivot_groups: defender-portal-experience
#customer intent: As a user, I want to learn how to customize email notifications for alerts and attack paths in Microsoft Defender for Cloud.
---

::: zone pivot="defender-portal"

# Configure email notifications for alerts and attack paths

Microsoft Defender for Cloud allows you to configure email notifications for alerts and attack paths through the unified Defender portal experience. The NextGen portal enhances notification management by integrating with the centralized Cloud Infrastructure dashboard and Exposure Management insights, ensuring that security teams receive timely notifications for the most critical threats across their cloud environment.

Configuring email notifications allows for the delivery of timely notifications to the appropriate recipients. When you modify the email notification settings, you can define preferences for the severity levels of alerts. You can also define preferences for the risk level of externally-driven attack paths that trigger notifications. Notifications focus on real, exploitable threats rather than broad scenarios. By default, subscription owners receive email notifications for high-severity alerts and attack paths.

The email notification settings work seamlessly with the Cloud Scopes and Unified RBAC system, allowing you to configure scoped notifications based on your organizational structure and access controls.

Defender for Cloud's **Email notifications** settings page allows you to define preferences for notification emails including:

- ***who* should be notified** - Emails can be sent to select individuals or to anyone with a specified Azure role for a subscription, with enhanced integration to Cloud Scopes for granular notification control.
- ***what* they should be notified about** - Modify the severity levels for which Defender for Cloud should send out notifications, with enhanced correlation to Exposure Management risk prioritization.

:::image type="content" source="./media/configure-email-notifications/email-notification-settings.png" alt-text="Screenshot showing how to configure the details of the contact who is to receive emails about alerts and attack paths." lightbox="media/configure-email-notifications/email-notification-settings.png":::

::: zone-end

::: zone pivot="azure-portal"

## Configure email notifications for alerts and attack paths

Microsoft Defender for Cloud allows you to configure email notifications for alerts and attack paths. Configuring email notifications allows for the delivery of timely notifications to the appropriate recipients. When you modify the email notification settings, you can define preferences for the severity levels of alerts. You can also define preferences for the risk level of externally-driven attack paths that trigger notifications. Notifications focus on real, exploitable threats rather than broad scenarios. By default, subscription owners receive email notifications for high-severity alerts and attack paths.

Defender for Cloud's **Email notifications** settings page allows you to define preferences for notification emails including:

- ***who* should be notified** - Emails can be sent to select individuals or to anyone with a specified Azure role for a subscription.
- ***what* they should be notified about** - Modify the severity levels for which Defender for Cloud should send out notifications.

:::image type="content" source="./media/configure-email-notifications/email-notification-settings.png" alt-text="Screenshot showing how to configure the details of the contact who is to receive emails about alerts and attack paths." lightbox="media/configure-email-notifications/email-notification-settings.png":::

::: zone-end

## Email frequency

To avoid alert fatigue, Defender for Cloud limits the volume of outgoing emails. For each email address, Defender for Cloud sends:

|Alert type | Severity/Risk level | Email volume |
|--|--|--|
| Alert | High | Four emails per day |
| Alert | Medium | Two emails per day |
| Alert | Low | One email per day |
| Attack path | Critical | One email per 30 minutes |
| Attack path | High | One email per hour |
| Attack path | Medium | One email per two hours |
| Attack path | Low | One email per three hours |

## Availability

Required roles and permissions: Security Admin, Subscription Owner, or Contributor.

## Customize the email notifications in the portal

You can send email notifications to individuals or to all users with specific Azure roles.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. Select **email notifications**.

1. Define the recipients for your notifications with one or both of these options:

    - From the dropdown list, select from the available roles.
    - Enter specific email addresses separated by commas. There's no limit to the number of email addresses that you can enter.

1. Select the notification types:

    - **Notify about alerts with the following severity (or higher)** and select a severity level.
    - **Notify about attack paths with the following risk level (or higher)** and select a risk level.

1. Select **Save**.

## Customize the email notifications with an API

You can also manage your email notifications through the supplied REST API. For full details, see the [SecurityContacts API documentation](/rest/api/defenderforcloud-composite/security-contacts?view=rest-defenderforcloud-composite-latest&preserve-view=true).

This API is an example request body for the PUT request when creating a security contact configuration:

URI: `https://management.azure.com/subscriptions/<SubscriptionId>/providers/Microsoft.Security/securityContacts/default?api-version=2020-01-01-preview`

```json
{
    "properties": {
        "emails": "admin@contoso.com;admin2@contoso.com",
        "notificationsByRole": {
            "state": "On",
            "roles": ["AccountAdmin", "Owner"]
        },
        "alertNotifications": {
            "state": "On",
            "minimalSeverity": "Medium"
        },
        "phone": ""
    }
}
```

## Related content

- [Security alerts - a reference guide](alerts-reference.md) - Learn about the security alerts you might see in Microsoft Defender for Cloud's Threat Protection module.
- [Manage and respond to security alerts in Microsoft Defender for Cloud](manage-respond-alerts.md) - Learn how to manage and respond to security alerts.
- [Identify and remediate attack paths](how-to-manage-attack-path.md).
- [Investigating risk with security explorer/attack paths](concept-attack-path.md)
- [Workflow automation](workflow-automations.md) - Automate responses to alerts with custom notification logic.
