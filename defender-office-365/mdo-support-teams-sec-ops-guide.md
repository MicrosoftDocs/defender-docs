---
title: Security Operations Guide for Teams protection
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: overview
ms.localizationpriority: medium
search.appverid: 
  - MET150
  - MOE150
ms.collection: 
  - m365-security
  - tier1
description: A prescriptive playbook for SecOps personnel to manage Microsoft Teams protection in Microsoft Defender for Office 365.
ms.service: defender-office-365
ms.date: 07/28/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
---

# Security Operations Guide for Teams protection in Microsoft Defender for Office 365

After you [configure Microsoft Teams protection in Microsoft Defender for Office 365](mdo-support-teams-quick-configure.md), you need to integrate Teams protection capabilities into your Security Operations (SecOps) response processes. This process is critical to ensure a high-quality, reliable approach to protect, detect, and respond to collaboration-related security threats.  

Involving the SecOps team during the deployment/pilot phases ensures your organization is ready to deal with threats. Teams protection capabilities in Defender for Office 365 are natively integrated into the existing Defender for Office 365 and Defender XDR SecOps tools and work flows.

Another important step is to ensure SecOps team members have the appropriate permissions to do their tasks.

<!--- We need links to what permissions, or can we just say Security Administrator --->

## Integrate user reported Teams messages into SecOps incident response

When users report Teams messages as potentially malicious, the reported messages are sent to Microsoft and/or the reporting mailbox as defined by the [user reported settings in Defender for Office 365](submissions-user-reported-messages-custom-mailbox.md).  

The **Teams message reported by user as security risk** alert is automatically generated and correlated to Defender XDR Incidents.  

We strongly recommend that SecOps team members start triage and investigation from the [Defender XDR incidents queue in the Microsoft Defender portal](/defender-office-365/mdo-sec-ops-manage-incidents-and-alerts) or SIEM/SOAR integration.

> [!TIP]
> Currently, **Teams message reported by user as security risk** alerts don't generate automated investigation and response (AIR) investigations.

SecOps team members can review submitted Teams message details in the following locations in the Defender portal:

- The **View submission** action in the Defender XDR incident.
- The **User reported** tab of the **Submissions** page at <https://security.microsoft.com/reportsubmission?viewid=user>:
  - Admins can submit user reported Teams messages to Microsoft for analysis from the **User reported** tab. Entries on the **Teams messages** tab are the result of manually submitting user reported Teams message to Microsoft ([converting the user submission to an admin submission](submissions-admin.md#submit-user-reported-messages-to-microsoft-for-analysis)).
  - Admins can use **Mark and notify** on reported Teams messages to send response email to users who reported messages.

SecOps team members can also use block entries in the Tenant Allow/Block List to block the following indicators of compromise:

- Suspicious URLs as yet unidentified by Defender for Office 365. URL block entries are enforced at time of click in Teams when [Teams integration in Safe Links policies is turned on](mdo-support-teams-quick-configure.md#step-2-verify-safe-links-integration-for-microsoft-teams).
- Files by using the SHA256 hash value.

## Enable SecOps to proactively manage false negatives in Microsoft Teams

SecOps team members can use threat hunting or information from external threat intelligence feeds to proactively respond to false negative Teams messages (bad messages allowed). They can use the information to proactively block threats. For example:

- [Create URL block entries](tenant-allow-block-list-urls-configure.md#create-block-entries-for-urls) in the Tenant Allow/Block List in Defender for Office 365. Block entries apply at time of click for URLs in Teams.  
- [Block domains in Teams using the Tenant Allow/Block List](tenant-allow-block-list-teams-domains-configure.md).
- Submit undetected URLs to Microsoft using [admin submission](submissions-admin.md#report-questionable-urls-to-microsoft).

> [!TIP]
> As previously described, admins can't proactively submit Teams messages to Microsoft for analysis. Instead, they submit user reported Teams messages to Microsoft ([converting the user submission to an admin submission](submissions-admin.md#submit-user-reported-messages-to-microsoft-for-analysis)).

## Enable SecOps to manage false positives in Microsoft Teams

SecOps team members can triage and respond to false positive Teams messages (good messages blocked) on the **Quarantine** page in Defender for Office 365 at <https://security.microsoft.com/quarantine>.

Teams messages detected by zero-hour auto protection (ZAP) are available on the **Teams messages** tab. SecOps team members can [take action](quarantine-admin-manage-messages-files.md#take-action-on-quarantined-teams-messages) on these messages. For example, preview messages, download messages, submit messages to Microsoft for review, and release the messages from quarantine.

> [!TIP]
> Teams messages released from quarantine are available to senders and recipients in the original location in Teams chats and channel posts.

## Enable SecOps to hunt for threats and detections in Microsoft Teams

SecOps team members can proactively hunt for potentially malicious Teams messages, URL clicks in Teams, and file detected as malicious. You can use this information to find potential threats, analyze patterns, and develop custom detections in Defender XDR to automatically generate incidents.

- On the **Explorer** page (Threat Explorer) in the Defender portal at <https://security.microsoft.com/threatexplorerv3>:
  - **Content malware** tab: This tab contains files detected by Safe Attachments for SharePoint, OneDrive, and Microsoft Teams. You can use the [available filters](threat-explorer-real-time-detections-about.md#filterable-properties-in-the-content-malware-view-in-threat-explorer-and-real-time-detections) to hunt on detection data.
  - **URL click** tab: This tab contains all user clicks on URLs in email, in supported Office files in SharePoint and OneDrive, and in Microsoft Teams. You can use the [available filters](threat-explorer-real-time-detections-about.md#filterable-properties-in-the-url-clicks-view-in-threat-explorer) to hunt on detection data.

- On the **Advanced hunting** page in the Defender portal at <https://security.microsoft.com/v2/advanced-hunting>. The following hunting tables are available for Teams-related threats:

  > [!NOTE]
  > The hunting tables are currently in Preview.

  - [MessageEvents](/defender-xdr/advanced-hunting-messageevents-table): Contains raw data about every internal and external Teams message that included a URL. Sender address, Sender display name, Sender type, and more are available in this table.
  - [MessagePostDeliveryEvents](/defender-xdr/advanced-hunting-messagepostdeliveryevents-table): Contains raw data about ZAP events on Teams messages.
  - [MessageUrlInfo](/defender-xdr/advanced-hunting-messageurlinfo-table): Contains raw data about URLs in Teams messages.
  - [UrlClickEvents](/defender-xdr/advanced-hunting-urlclickevents-table): Contains raw data about every allowed or blocked URL click by users in Teams clients.

  SecOps team members can join these hunting tables with other workload tables (for example, EmailEvents or Device-related tables) to gain insight into end to end user activities.

  For example, you can use the following query to hunt for allowed clicks on URLs in Teams messages that were removed by ZAP:

  ```kusto
  MessagePostDeliveryEvents 
  | join MessageUrlInfo on TeamsMessageId 
  | join UrlClickEvents on Url 
  | join EmailUrlInfo on Url 
  | where Workload == "Teams" and ActionType1 == "ClickAllowed" 
  | project TimeGenerated, TeamsMessageId, ActionType, RecipientDetails, LatestDeliveryLocation, Url, ActionType1
  ```

  [Community queries in advanced hunting](https://techcommunity.microsoft.com/blog/microsoftdefenderforoffice365blog/use-community-queries-to-hunt-more-effectively-across-email-and-collaboration-th/4254664) also offers Teams query examples.
