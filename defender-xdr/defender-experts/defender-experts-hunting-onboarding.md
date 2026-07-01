---
title: Subscribe to Microsoft Defender Experts Hunting
ms.reviewer:
description: If you're new to Microsoft Defender and Defender Experts Hunting, this is how you onboard, receive, and set up Defender Experts Notifications.
#customer intent: As a security admin, I want to onboard to Defender Experts Hunting so that I can receive expert threat notifications and respond to security incidents.
ms.service: defender-experts-for-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
  - essentials-get-started
ms.topic: how-to
ms.custom:
- msecd-doc-authoring-1014
- cx-ti
- cx-ean
- msecd-doc-authoring-1012
ai-usage: ai-assisted
ms.date: 06/16/2026
---

# Start using Microsoft Defender Experts Hunting

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender](../microsoft-365-defender.md)

To get started with the Microsoft Defender Experts Hunting service, onboard to the service, set up notification contacts, and configure Defender Experts Notifications.

## Onboard to Defender Experts Hunting

If you're new to Microsoft Defender and Defender Experts Hunting:

1. When you receive your welcome email, select **Log into Microsoft Defender**.
1. Sign in if you already have a Microsoft account. If you don't have a Microsoft account, create one.
1. The Microsoft Defender quick tour introduces you to the security suite, where the capabilities are, and how important they are. Select **Take a quick tour**.
1. Read the short descriptions about what the Microsoft Defender Experts service is and the capabilities it provides. Select **Next**. You see the welcome page:

    ![Screenshot of the Microsoft Defender welcome page with a card for the Defender Experts Hunting service.](./media/onboarding-defender-experts-for-hunting/start-using-defender-experts-for-hunting.png)

## Tell us who to contact for important matters

Defender Experts Hunting lets you set up **Notification contacts**. These contacts are the individuals or groups within your organization that Microsoft needs to notify if there are critical incidents or service updates:

- **Incident notification contacts** – These contacts are persons or teams that Microsoft can notify for any critical incidents or hunting clarifications that require immediate response.

    You can designate the call priority of your incident notification contacts. In an event of a critical incident, Microsoft reaches out to the primary contact first by using the phone number you provided, and then the backup contact if needed.
- **Service review notification contacts** – These contacts are persons or teams that Microsoft can engage with for service updates, reports, and opportunities for feedback.

Set up your notification contacts in the setup wizard when you first onboard to the service, or from the Microsoft Defender portal navigation menu by going to **System** > **Settings** > **Defender Experts** > **Notification contacts**.

<a name="receive-defender-experts-notifications"></a>
## Receive Defender Experts notifications

The Defender Experts Notifications service includes:

- Threat monitoring and analysis, reducing dwell time and the risk to your business
- Hunter-trained artificial intelligence to discover and target both known attacks and emerging threats
- Identification of the most pertinent risks, helping SOCs maximize their effectiveness
- Help in scoping compromises and as much context as can be quickly delivered to enable a swift SOC response

The following screenshot shows a sample Defender Experts Notification:

![Screenshot of a Defender Experts Notification in Microsoft Defender showing the threat title, executive summary, and recommendations.](./media/onboarding-defender-experts-for-hunting/receive-defender-experts-notification.png)

### Where to find Defender Experts Notifications

You can receive Defender Experts Notifications from Defender Experts through the following channels:

- The Defender portal's [Incidents](https://security.microsoft.com/incidents) page
- The Defender portal's [Alerts](https://security.microsoft.com/alerts) page
- OData alerting [Get alerts API](/defender-endpoint/api/get-alerts) and [SIEM integration REST API](/defender-endpoint/configure-siem)
- [DeviceAlertEvents](../advanced-hunting-migrate-from-mde.md#map-devicealertevents-table) table in Advanced hunting
- Your email if you [configure an email notifications rule](defender-experts-hunting-onboarding.md#set-up-defender-experts-email-notifications)
- Your Microsoft Teams if you [set up Defender Experts Teams notifications](#set-up-defender-experts-teams-notifications)

### Filter to view just the Defender Experts Notifications

You can filter your incidents and alerts if you want to only see the Defender Experts Notifications among the many alerts. To filter incidents and alerts to show only Defender Experts Notifications:

1. On the navigation menu, go to **Incidents & alerts** > **Incidents** > select the ![Screenshot of the Filter control used to filter incidents on the Incidents page](./media/onboarding-defender-experts-for-hunting/filter.png) icon.
1. Scroll down to **Service/detection sources** then select the **Microsoft Defender Experts** checkboxes under *Microsoft Defender for Endpoint* and *Microsoft Defender*.
1. Select **Apply**.

### Set up Defender Experts email notifications

You can set up Microsoft Defender to notify you or your staff by using an email about new incidents or updates to existing incidents, including those observed by Microsoft Defender Experts. [Learn more about getting incident notifications by email](../m365d-notifications-incidents.md).

1. In the Microsoft Defender navigation pane, select **Settings** > **Microsoft Defender** > **Email notifications** > **Incidents**.
1. Update your existing email notification rules or create a new one. For more information, see [Auditing](defender-experts-mdr-auditing.md).
1. On the rule's **Notification settings** page, make sure to configure the following values:
    - **Source** – Choose **Microsoft Defender Experts** under **Microsoft Defender** and **Microsoft Defender for Endpoint**.
    - **Alert severity** – Choose the alert severities that trigger an incident notification. For example, if you only want to be informed about high-severity incidents, select High.

### Set up Defender Experts Teams notifications

You can use Microsoft Teams, in addition to email, to receive Defender Experts Notifications.

> [!IMPORTANT]
> To set up Teams notifications, you must have a **Security Administrator** role or higher, and a Microsoft Teams license.

When Teams notifications are enabled:

- A dedicated Defender Experts team and a **Hunting notifications** channel are automatically created.
- Notifications are posted directly into the channel.
- Incident updates appear as replies in the same thread.
- Each notification includes the incident title, incident ID, and a direct link to the Defender portal.

> [!NOTE]
> Teams notifications are a one-way notification experience. Defender Experts have access to messages in the channel but don't monitor or respond to messages posted there. To communicate with Defender Experts, use **Ask Defender Experts** in the Defender portal.

**To set up Teams notifications:**

1. In the Microsoft Defender portal, go to **Settings** > **Defender Experts**.
1. Select **Teams**.
1. Turn on **Notify me on Teams**.
1. Select **Save**. Any notification contacts you added during notification contact setup are also added automatically as members of the Teams channel. 
1. To add additional SOC team members to the created channel, go to **Microsoft Teams** > **Defender Experts team** > **More options (...)** > **Manage team** > **Add member**.

After setup, the system creates the Defender Experts team and the **Hunting notifications** channel, and provides a link to open the Teams channel. A welcome message appears in Teams confirming the setup is complete.

> [!TIP]
> If the setup fails, see [Configuring the Microsoft Defender Experts app in Teams](defender-experts-teams-app-permissions.md) for troubleshooting guidance.

### Generate sample Defender Experts Notifications

You can generate a sample Defender Experts Notification to start experiencing the Defender Experts Hunting service without waiting for an actual critical activity in your environment. By generating a sample notification, you can also test any [email notifications](#set-up-defender-experts-email-notifications) configured in the Microsoft Defender portal for this service. You can also test the configuration of playbooks (if configured for such notifications) and rules in your Security Information and Event Management (SIEM) environment.

A sample Defender Experts Notification appears in your **Incidents** page with the title *Defender Experts: Test Notification from Microsoft Defender Experts*. The notification's title, summary, and recommendations are placeholder text, while the other elements such as alerts are randomly generated from events present in your tenant and aren't actually impacted.

:::image type="content" source="./media/onboarding-defender-experts-for-hunting/sample-den-dexh.png" alt-text="Screenshot of a sample Defender Experts Notification in the Incidents page for Defender Experts Hunting." lightbox="./media/onboarding-defender-experts-for-hunting/sample-den-dexh.png":::

**To generate a sample notification:**

1. In your Microsoft Defender navigation pane, go to **Settings** > **Defender Experts** and then select **Sample notifications**.
1. Select **Generate a sample notification**. A green status message appears, confirming that your sample notification is ready for review.
1. Under **Recently generated Defender Experts Notification**, select a link from the list to view its corresponding generated sample notification. The most recent sample appears at the top of the list. Selecting a link redirects you to the **Incidents** page.

    :::image type="content" source="./media/onboarding-defender-experts-for-hunting/sample-den-links-dexh.png" alt-text="Screenshot of the recently generated Defender Experts Notification links list." lightbox="./media/onboarding-defender-experts-for-hunting/sample-den-links-dexh.png":::

## Next step

- [Access Defender Experts Notifications using Microsoft Graph security API](defender-experts-hunting-graph-api.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/defender-m3d-techcommunity.md)]
