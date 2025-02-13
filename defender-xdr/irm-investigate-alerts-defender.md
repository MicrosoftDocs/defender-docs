---
title: Investigate insider risk threats in the Microsoft Defender portal with insights from Microsoft Purview Insider Risk Management
description: Investigate insider risk threats in the Microsoft Defender portal with insights from Microsoft Purview Insider Risk Management.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
ms.topic: conceptual
search.appverid: 
  - MOE150
  - MET150
ms.date: 01/17/2025
appliesto:
- ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
- <a href="https://learn.microsoft.com/unified-secops-platform/" target="_blank">Microsoft's unified security operations platform</a>
---
# Investigate insider risk threats in the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information in this article relates to a prereleased product, which may be substantially modified before it's commercially released. Microsoft makes no warranties expressed or implied, with respect to the information provided here.

[Microsoft Purview Insider Risk Management alerts](/purview/insider-risk-management-activities#alert-dashboard) in the Microsoft Defender portal are vital for protecting an organization's sensitive information and maintaining security. These alerts and insights from Microsoft Purview Insider Risk Management help identify and mitigate internal threats like data leaks and intellectual property theft by employees or contractors. Monitoring these alerts allows organizations to address security incidents proactively, ensuring sensitive data remains protected and compliance requirements are met.

One key benefit of monitoring insider risk alerts is the unified view of all alerts related to a user, allowing security operations center (SOC) analysts to correlate alerts from [Microsoft Purview Insider Risk Management](/purview/insider-risk-management-solution-overview) with other Microsoft security solutions. Additionally, having these alerts in the Microsoft Defender portal enables seamless integration with advanced hunting capabilities, enhancing the ability to investigate and respond to incidents effectively.

Another advantage is the automatic synchronization of alert updates between [Microsoft Purview](/purview/purview-portal) and the Defender portals, ensuring real-time visibility and reducing the chances of oversight. This integration strengthens an organization's ability to detect, investigate, and respond to insider threats, thereby enhancing overall security posture.

You can manage insider risk management alerts in the Microsoft Defender portal by navigating to **Incidents & alerts**, where you can:

- View all insider risk alerts grouped under incidents in the Microsoft Defender portal [incident queue](incident-queue.md#incident-queue).
- View insider risk alerts correlated with other Microsoft solutions, like [Microsoft Purview Data Loss Prevention](/purview/dlp-learn-about-dlp) and [Microsoft Entra ID](/entra/fundamentals/whatis), under a single incident.
- View individual insider risk alerts in the [alert queue](investigate-alerts.md).
- Filter by service source on the incident and alert queues.
- Hunt for all activities and all alerts related to the user in the insider risk alert.
- View a user's insider risk activity summary and risk level in the user entity page.

## Know before you begin

If you're new to Microsoft Purview and insider risk management, consider reading the following articles:

- [Learn about Microsoft Purview](/purview/purview)
- [Learn about Microsoft Purview Insider Risk Management](/purview/insider-risk-management)
- [Microsoft Purview data security solutions](/purview/purview-security)

## Prerequisites

To investigate insider risk management alerts in the Microsoft Defender portal, you need to do the following:

- Confirm your Microsoft 365 subscription supports insider risk management access. Know more about [subscription and licensing](/purview/insider-risk-management-configure#subscriptions-and-licensing).
- Confirm your access to Microsoft Defender XDR. See [Microsoft Defender XDR licensing requirements](prerequisites.md#licensing-requirements).

Data sharing with other security solutions must be turned on in the **Data sharing** settings in Microsoft Purview Insider Risk Management. Turning on **Share user risk details with other security solutions** in the Microsoft Purview portal enables users with the correct permissions to review user risk details in the user entity pages in the Microsoft Defender portal. See [Share alert severity levels with other Microsoft security solutions](/purview/insider-risk-management-settings-dlp-sync#share-alert-severity-levels-with-other-microsoft-security-solutions) for more information.

:::image type="content" source="/defender-xdr/media/insider-risk-alerts/irm-toggle-settings-small.png" alt-text="Highlighting the setting in the Microsoft Purview portal required for insider risk alerts to show in Defender XDR.":::

## Permissions and roles

### Microsoft Defender XDR roles

The following permissions are essential to access insider risk management alerts in the Microsoft Defender portal:

- Security Operator
- Security Reader

For more information about Microsoft Defender XDR roles, see [Manage access to Microsoft Defender XDR with Microsoft Entra global roles](m365d-permissions.md).

### Microsoft Purview Insider Risk Management roles

You must also be a member of one of the following insider risk management role groups to view and manage insider risk management alerts in the Microsoft Defender portal:

- Insider Risk Management
- Insider Risk Management Analysts
- Insider Risk Management Investigators

For more information on these role groups, see [Enable permissions for insider risk management](/purview/insider-risk-management-configure#step-1-required-enable-permissions-for-insider-risk-management).

## Investigation experience in the Microsoft Defender portal

### Incidents

Insider risk management alerts related to a user are correlated to a single incident to ensure a holistic approach to incident response. This correlation allows SOC analysts to have a unified view of all alerts about a user coming from Microsoft Purview Insider Risk Management and various Defender products. Unifying all alerts also allows SOC analysts to view the details of devices involved in the alerts.

:::image type="content" source="/defender-xdr/media/insider-risk-alerts/xdr-irm-incident-small.png" alt-text="Sample of an incident with insider risk alerts from Microsoft Purview Insider Risk Management." lightbox="/defender-xdr/media/insider-risk-alerts/xdr-irm-incident.png":::

You can filter incidents by choosing Microsoft Purview Insider Risk Management under **Service source**.

### Alerts

All insider risk management alerts are also visible in the Microsoft Defender portal's alert queue. Filter these alerts by choosing Microsoft Purview Insider Risk Management under **Service source**. 

Here's an example of an insider risk management alert in the Microsoft Defender portal:

:::image type="content" source="/defender-xdr/media/insider-risk-alerts/xdr-irm-alert-small.png" alt-text="Sample of an insider risk alerts from Microsoft Purview Insider Risk Management." lightbox="/defender-xdr/media/insider-risk-alerts/xdr-irm-alert.png":::

Any updates made to an insider risk management alert in the Microsoft Purview or the Microsoft Defender portals are automatically reflected in both portals. These updates might include:

- Alert status
- Severity
- Activity that generated the alert
- Trigger information
- Classification

The updates are reflected in both portals within 30 minutes of the alert generation or update.

### Advanced hunting

Use advanced hunting to further investigate insider risk events and behaviors. Refer to the table below for a summary of insider risk management data available in advanced hunting.

|Table name|Description|
|:---|:---|
|[AlertInfo](advanced-hunting-alertinfo-table.md)|Insider risk management alerts are available as part the AlertInfo table, which contains information about alerts from various Microsoft security solutions.|
|[AlertEvidence](advanced-hunting-alertevidence-table.md)|Insider risk management alerts are available as part of the AlertEvidence table, which contains information about entities associated with alerts from various Microsoft security solutions.|
|DataSecurityBehaviors|This table contains insights into potentially suspicious user behavior that violates the default or customer-defined policies in Microsoft Purview.|
|DataSecurityEvents|This table contains enriched events about user activities that violate the default or customer-defined policies in Microsoft Purview.|

In the example below, we use the **DataSecurityEvents** table to investigate potentially suspicious user behavior. In this case, the user uploaded a file to Google Drive, which can be viewed as suspicious behavior if a company doesn't support file uploads to Google Drive.

:::image type="content" source="/defender-xdr/media/insider-risk-alerts/irm-adv-hunting-small.png" alt-text="Advanced hunting page showing a query using the tables related to insider risk behaviors and events." lightbox="/defender-xdr/media/insider-risk-alerts/irm-adv-hunting.png":::

## Integrate insider risk management data through Graph API

You can use Microsoft Security Graph API to integrate insider risk management alerts, insights, and indicators with other SIEM tools, data lakes, ticketing systems, and the like.

Refer to the table below to find insider risk management data in specific APIs.

|Table name|Description|Mode|
|:---|:---|:---|
|[Incidents](/graph/api/resources/security-incident)|Includes all insider risk incidents in the Defender XDR unified incident queue|Read/Write|
|[Alerts](/graph/api/resources/security-alert)|Includes all insider risk alerts shared with Defender XDR unified alert queue|Read/Write|
|[Advanced hunting](/graph/api/security-security-runhuntingquery)|Includes all insider risk management data in advanced hunting including Alerts, Behaviors, and Events|Read|

> [!NOTE]
> Insider risk alert information can be accessed in both the Alerts and Advanced hunting graph namespace. Insider risk behaviors and events in advanced hunting can be accessed in the Graph API by [passing KQL queries in the API](/graph/api/security-security-runhuntingquery).

For customers using [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference), we recommend migrating to Microsoft Security Graph API to ensure richer metadata and bi-directional support for IRM data.

## Impact to Microsoft Sentinel users

Microsoft Sentinel customers [exporting Microsoft Purview Insider Risk Management alert information](/purview/insider-risk-management-settings-dlp-sync#export-alert-information-to-siem-solutions) to integrate insider risk alert data are advised to migrate to the [Microsoft Defender XDR-Microsoft Sentinel connector](/azure/sentinel/connect-microsoft-365-defender?tabs=MDE).

If the Defender XDR-Microsoft Sentinel connector is turned on, insider risk management alerts are automatically integrated into Microsoft Sentinel. The schema for alerts is the same schema exposed in Graph API. The alert schema exposed through the Defender XDR-Microsoft Sentinel connector covers all existing fields exported and provides additional metadata for insider risk management alerts.

> [!NOTE]
> When the Defender XDR-Microsoft Sentinel connector is turned on, Microsoft Purview Insider Risk Management data becomes accessible in Microsoft Sentinel regardless of role-based access control settings.

To integrate additional insider risk management data like behaviors and events into Microsoft Sentinel, we recommend onboarding Microsoft Sentinel to Microsoft Defender to get a unified view of your entire security operations center. Onboarding helps you bring insider risk management alerts and other data from Microsoft Sentinel into Microsoft Defender, allowing cross-table hunting and other powerful workflows. To onboard, see [Connect Microsoft Sentinel to Microsoft Defender](/unified-secops-platform/microsoft-sentinel-onboard).

## Next steps

After investigating an insider risk incident or alert, you can do any of the following:

- Continue to respond to the alert in the Microsoft Purview portal.
- Use advanced hunting to investigate other insider risk management events in the Microsoft Defender portal.