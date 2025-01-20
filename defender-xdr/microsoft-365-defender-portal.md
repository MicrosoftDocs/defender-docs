---
title: Microsoft Defender XDR in the Microsoft Defender portal
description: Learn about Microsoft Defender XDR and how other services complement in the Microsoft Defender portal.
search.appverid: met150
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-manage
  - usx-security
ms.custom:
  - admindeeplinkDEFENDER
  - intro-overview
ms.topic: conceptual
ms.date: 01/10/2025
---

# Microsoft Defender XDR in the Microsoft Defender portal

The Microsoft Defender portal at <https://security.microsoft.com> combines protection, detection, investigation, and response to threats across your entire organization and all its components, in a central place. The Defender portal emphasizes quick access to information, simpler layouts, and bringing related information together for easier use. It includes Microsoft Defender XDR and features and capabilities of other Microsoft security solutions that you have provisioned access to.

To learn more about the services that are part of the Microsoft Defender portal, see the following resources:

- **[Microsoft Defender for Endpoint in the Microsoft Defender portal](microsoft-365-security-center-mde.md)**
- **[Microsoft Defender for Office 365 in the Microsoft Defender portal](microsoft-365-security-center-mdo.md)**
- **[Microsoft Defender for Identity in the Microsoft Defender portal](/defender-for-identity/microsoft-365-security-center-mdi)**
- **[Microsoft Defender for Cloud Apps in the Microsoft Defender portal](/defender-cloud-apps/microsoft-365-security-center-defender-cloud-apps)**
- **[Microsoft Defender for Cloud alerts and incidents in the Microsoft Defender portal](microsoft-365-security-center-defender-cloud.md)**
- **[Microsoft Purview Data Loss Prevention alerts in the Microsoft Defender portal](dlp-investigate-alerts-defender.md)**
- **[Microsoft Defender Vulnerability Management in the Microsoft Defender portal](/defender-vulnerability-management/defender-vulnerability-management)**
- **[Microsoft Security Copilot embedded experience in the Microsoft Defender portal](security-copilot-in-microsoft-365-defender.md)**
- **[Microsoft Defender for IoT enterprise monitoring in the Microsoft Defender portal](/azure/defender-for-iot/organizations/eiot-defender-for-endpoint)**
- **[Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)**

[!INCLUDE [unified-soc-preview](../includes/unified-soc-preview.md)]

Watch this short video to learn about the Defender portal.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=d97b17c8-8900-4a18-a099-7d30d9a316ea]

## What to expect

Microsoft Defender XDR correlates signals from various Microsoft security solutions in the Microsoft Defender portal to help security teams investigate and respond to attacks into a set of unified experiences for:

- Incidents & alerts
- Hunting
- Actions & submissions
- Threat analytics

The Microsoft Defender portal emphasizes *unity, clarity, and common goals*. Searching for entities and notifications are also unified in the portal.

> [!NOTE]
> In the Microsoft Defender portal, customers see only the security features their subscription includes. For example, if you have Defender for Office 365 but not Defender for Endpoint, you see features and capabilities for Defender for Office 365, but not for device protection.

## Incident and alert investigations

Microsoft Defender XDR [correlates alerts and events](alerts-incidents-correlation.md) from all Microsoft security solutions across all assets in your entire organization into incidents. **Incidents** are a collection of alerts that are related to a single threat or attack. Incidents are prioritized based on the severity of the threat and the potential impact on your organization.

:::image type="content" source="/defender/media/incidents-queue/incidents-ss-incidents.png" alt-text="The Incidents page in the Microsoft Defender portal." lightbox="/defender/media/incidents-queue/incidents-ss-incidents.png":::

Selecting an incident name displays a page that demonstrates the value of centralizing security information as you get better insights into the full extend of a threat, from email, to identity, to endpoints.

:::image type="content" source="/defender/media/incidents-overview/incidents-ss-incident-summary.png" alt-text="Screenshot that shows the attack story page for an incident in the Microsoft Defender portal." lightbox="/defender/media/incidents-overview/incidents-ss-incident-summary.png":::

Take the time to review the incidents in your environment, drill down into each alert, and practice building an understanding of how to access the information and determine next steps in your analysis.

For more information, see [Incidents in the Microsoft Defender portal](incidents-overview.md).

## Hunting

You can build custom detection rules and hunt for specific threats in your environment. **Hunting** uses a query-based threat hunting tool that lets you proactively inspect events in your organization to locate threat indicators and entities. These rules run automatically to check for, and then respond to, suspected breach activity, misconfigured machines, and other findings.

For more information, see [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](advanced-hunting-overview.md).

## Actions and submissions

**Actions** are tasks performed on entities in the Microsoft Defender portal. Actions can be performed on an asset like a device or user, can be performed on a single entity or on multiple entities at once, and be performed manually or automatically. 

Automated actions are capabilities within Microsoft Defender XDR that help you address alerts and incidents automatically and speedily respond to attacks. Automated actions include:

- [Automated investigation and response](m365d-autoir.md)
- [Attack disruption](automatic-attack-disruption.md)
- [Deception](deception-overview.md)

These actions can be reviewed and managed in the [**Action Center**](m365d-action-center.md) page in the Microsoft Defender portal.

You can submit files, email and email attachments, URLs, or Teams messages in the **Submissions** page to Microsoft for further analysis. For more information, see the [Submission guide](submission-guide.md).

## Threat analytics

[**Threat analytics**](threat-analytics.md) is the Microsoft Defender XDR threat intelligence solution from expert Microsoft security researchers. It's designed to assist security teams to be as efficient as possible while facing emerging threats like:

- Active threat actors and their campaigns
- Popular and new attack techniques
- Critical vulnerabilities
- Common attack surfaces
- Prevalent malware

## Microsoft Defender XDR settings

You can manage settings for Microsoft Defender XDR in the **Settings > Microsoft Defender XDR** page in the Microsoft Defender portal. The settings page is where you can configure the following:

- Email notifications for [incidents](m365d-notifications-incidents.md), [response actions](m365d-response-actions-notifications.md), and [threat analytics reports](m365d-threat-analytics-notifications.md).
- [Permissions and roles](m365d-permissions.md)
- [Streaming API](streaming-api.md)
- [Asset rule management](configure-asset-rules.md)
- [Alert tuning](investigate-alerts.md#tune-an-alert)
- Critical asset management

## Unified search and notifications

### Global search

The Microsoft Defender portal's search function is located at the top of the page. As you type, suggestions are provided so that it's easier to find entities. The enhanced search results page centralizes the results from all entities.

:::image type="content" source="/defender/media/microsoft-365-defender-portal/search-panel.png" alt-text="Screenshot of the search bar in the Microsoft Defender portal." lightbox="/defender/media/microsoft-365-defender-portal/search-panel.png":::

Search results are categorized by sections related to your search terms. You can search across the following entities in the Microsoft Defender portal:

- **Devices** - supported for Defender for Endpoint, Defender for Identity, Defender for Cloud, and Microsoft Sentinel.
- **Users** - supported for Defender for Endpoint, Defender for Identity, Defender for Cloud Apps, and Microsoft Sentinel.
- **Files, IPs, and URLs** - same capabilities as in Defender for Endpoint.
  > [!NOTE]
  > IP and URL searches are based on exact match and don't appear in the search results page – they lead directly to the entity page.
- **Microsoft Defender Vulnerability Management** - same capabilities as in Defender for Endpoint (vulnerabilities, software, and recommendations).

Search also provides results from relevant links in the Microsoft Tech Community portal, relevant documentation in Microsoft Learn, navigation items within the portal, and a link where you can provide feedback. Search history is stored in your browser and is accessible for the next 30 days.

### Notifications

Notifications are messages that inform you about important events or updates in the Defender portal. They help you stay on top of your security tasks and alerts.

:::image type="content" source="/defender/media/microsoft-365-defender-portal/notifications-panel.png" alt-text="Screenshot of the notifications icon in the Microsoft Defender portal." lightbox="/defender/media/microsoft-365-defender-portal/notifications-panel.png":::

Notifications are in the top bar of the portal's user interface. You can access them by clicking on the notification icon, which looks like a bell. A number on the icon indicates that you have that number of unread notifications.

Notifications can tell you about various types of events or updates:

- Success: when an action or task has been completed successfully like scanning a device or applying a policy.
- Ongoing: when an action is in progress.
- Information: when there is some information that you might find useful.
- Warning: when there is a potential issue or risk that you should be aware of like a device that is out of compliance or a policy that needs to be updated.
- Error: when there is an error or failure that requires your attention like an incident is deleted or merged, a scan that failed, or a policy that could not be applied.

Each notification has a title and content that provides relevant information about the event or update. Each notification also has a timestamp that shows when the notification was generated.

You can hide notifications from your view. You can dismiss a single notification by clicking on the *x* icon on the right side of the notification. You can also dismiss all notifications in the list with a single click by using *dismiss all* at the top of the notification panel.

Dismissing a notification does not delete it from the portal. You can always view your dismissed notifications by selecting  *show dismissed* at the bottom of the notification panel.

Notifications are sorted by their generated time in the notification panel, with the most recent ones displayed first. You can scroll through the list of notifications to see older ones.

## Training for security analysts

With this learning path from Microsoft Learn, you can understand Microsoft Defender XDR and how it can help identify, control, and remediate security threats.

|Training:|Mitigate threats using Microsoft Defender XDR|
|---|---|
|![Microsoft Defender XDR training icon.](/defender/media/microsoft-365-defender/m365-defender-secure-organization.svg)|Analyze threat data across domains and rapidly remediate threats with built-in orchestration and automation in Microsoft Defender XDR. This learning path aligns with exam SC-200: Microsoft Security Operations Analyst.<p> 9 hr 31 min - Learning Path - 11 Modules|

> [!div class="nextstepaction"]
> [Start >](/training/paths/sc-200-mitigate-threats-using-microsoft-365-defender/)

## See also

- [What's new in Microsoft Defender XDR](whats-new.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
