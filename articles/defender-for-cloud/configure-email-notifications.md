---
title: Configure email notifications for alerts and attack paths
description: Learn how to fine-tune the Microsoft Defender for Cloud security alert emails to ensure the right people receive timely notifications.
ms.topic: how-to
ms.author: elkrieger
author: ElazarK
ms.date: 05/26/2026
ms.custom: mode-other
#customer intent: As a user, I want to learn how to customize email notifications for alerts and attack paths in Microsoft Defender for Cloud.
---

# Configure email notifications for alerts and attack paths

Microsoft Defender for Cloud lets you configure email notifications for alerts and attack paths. You can choose who gets notified and when they get notified. You can also set severity thresholds for alerts and risk thresholds for externally driven attack paths. Notifications focus on real, exploitable threats instead of broad scenarios. By default, subscription owners receive email notifications for high-severity alerts and attack paths.

Defender for Cloud's **Email notifications** settings page lets you set:

- ***who* should be notified**: Emails can go to specific individuals or to users in selected Azure roles for a subscription.
- ***what* they should be notified about**: You can choose the severity levels that trigger notifications.

:::image type="content" source="./media/configure-email-notifications/email-notification-settings.png" alt-text="Screenshot showing how to configure the details of the contact who is to receive emails about alerts and attack paths." lightbox="media/configure-email-notifications/email-notification-settings.png":::

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

To customize email notifications in the Azure portal:

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

You can also manage email notifications through the REST API. For details, see the [Security contacts REST API reference](/rest/api/defenderforcloud-composite/security-contacts?view=rest-defenderforcloud-composite-latest&preserve-view=true).

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

- [Security alerts reference guide](alerts-reference.md): Learn which security alerts can appear in Microsoft Defender for Cloud.
- [Manage and respond to security alerts in Microsoft Defender for Cloud](manage-respond-alerts.md): Learn response workflows for active alerts.
- [Identify and remediate attack paths](how-to-manage-attack-path.md): Learn how to investigate and reduce attack-path risk.
- [Investigate risk with security explorer and attack paths](concept-attack-path.md): Learn how security explorer maps attack paths and exposure.
- [Workflow automation in Defender for Cloud](workflow-automations.md): Automate alert response with custom notification logic.

