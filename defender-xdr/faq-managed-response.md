---
title: FAQs related to Microsoft Defender Experts for XDR Managed response
ms.reviewer:
description: Frequently asked questions related to managed response notifications
ms.service: defender-experts-for-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
audience: ITPro
ms.collection:
  - m365-security
  - tier1
ms.topic: faq
ms.custom: 
- cx-ti
- cx-dex
search.appverid: met150
ms.date: 04/30/2026
---

# Understanding managed response

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

This article lists questions you or your SOC team might have regarding [Managed response](managed-detection-and-response-xdr.md).

## General information

| Questions | Answers |
|---------|---------|
|**What is Managed response?** | Microsoft Defender Experts for XDR offers **Managed response** where the experts manage the entire remediation process for incidents that require them. This process includes investigating the incident to identify the root cause, determining the required response actions, and taking those actions on your behalf.|
|**What actions are in scope for Managed response?** | All actions found below are in scope for Managed response for any device and user that isn't excluded.<br><br>*For devices*<ul><li>Isolate machine<br><li>Release machine from isolation<br><li>Stop and quarantine file<br><li>Restrict app execution<br><li>Remove app restriction</ul><br>*For users*<ul><li>Disable user<br><li>Enable user<li>Soft-delete emails</ul> 
|**Can I customize the extent of Managed response?** | You can configure the extent to which our experts do Managed response actions on your behalf by excluding certain devices and users (individually or by groups) either during onboarding or later by modifying your service's settings. [Read more about excluding device groups](get-started-xdr.md#exclude-devices-and-users-from-remediation) |
|**What support do Defender Experts offer for excluded assets?** | If the experts determine that you need to perform response actions on excluded devices or users, they notify you through various customizable methods and direct you to your Microsoft Defender portal. From your portal, you can view a detailed summary of the investigation process and the required response actions in the portal and perform these required actions directly. Similar capabilities are also available through Defender APIs, in case you prefer using a security information and event management (SIEM), IT service management (ITSM), or any other third-party tool. |
|**How am I going to be informed about the response actions?** | Response actions that the experts complete on your behalf and any pending ones that you need to perform on your excluded assets are displayed in the **Managed response** panel in your Defender portal's **Incidents** page. <br><br>In addition, you receive an email containing a link to the incident and instructions to view the Managed response in the portal. Moreover, if you have integration with Microsoft Sentinel or APIs, you also receive notifications within those tools by looking for Defender Experts statuses. For more information, see [FAQs related to Microsoft Defender Experts for XDR incident notifications](faq-incident-notifications-xdr.md).|
|**Can I customize Managed response based on actions?** | No. If you have devices or users that are high-value or sensitive, add them to your exclusion list. The experts don't take any action on them and only provide guidance if they're impacted by an incident.|

## Understanding managed response notifications

### In Microsoft Defender portal and Graph Security API

| Questions | Answers |
|---------|---------|
| **How do I know whether a Defender Experts analyst has started working on an incident?** | When Defender Experts determine that an incident needs investigation (whether due to the service or detection source involved, severity level, your defined scoped coverage, or other reasons), they update the incident's **Assigned to** field to *Defender Experts*. When the experts start investigating the incident, they update its **Status** field to *In progress*.|
| **How do I know whether a Defender Experts analyst has resolved an incident?** | When a Defender Experts analyst resolves an incident, they update the incident's **Status** field to _Resolved_. |
| **How do I know what conclusion led a Defender Experts analyst to resolve an incident?** | When Defender Experts complete their investigation on an incident, they modify the incident's **Classification** and **Determination** fields and provide an **Investigation summary** in the Managed response flyout panel in your Microsoft Defender portal.|
| **How do I know what actions a Defender Experts analyst took in my tenant when investigating an incident?** | For each incident they investigate, the Defender Experts analyst summarizes any actions they performed within your tenant in the incident's **Investigation summary** located in the **Managed response** flyout panel in your Microsoft Defender portal.<br><br>You can also retrieve information about these actions, and the times they signed into your tenant, by [searching your audit logs](auditing.md) either on the Microsoft Purview portal or through the Office 365 Management Activity API.|
| **How do I know whether a Defender Experts analyst has sent any response actions for my SOC team?** | The Defender Experts analyst publishes the response actions they recommend your SOC team to perform on an incident in an incident's **Managed response** flyout panel in your Microsoft Defender portal.<br><br>At this time, the incident's **Assigned to** field is updated to _Customer_ and its **Status** is updated to _Awaiting Customer Action_.<br><br>Your incident contacts, which you have [designated](get-started-xdr.md#tell-us-who-to-contact-for-important-matters) in **Settings** > **Defender Experts** > **Notification contacts** in your Microsoft Defender portal, also receive a corresponding email notification if there are response actions requiring your attention. You also receive a Teams notification if you set it up in **Settings** > **Defender Experts** > **Teams** in your Microsoft Defender portal. |
| **How do I ask a Defender Experts analyst questions about an investigation or response action?** | After a Defender Experts analyst publishes their investigation summary and recommended response actions in the **Managed response** flyout panel of a True Positive incident, you can use the **Chat** tab in the same panel to ask the Defender Experts team questions about the incident and their investigation.<br><br>Alternatively, your designated incident contacts can directly respond to the Teams notification they received from Defender Experts to ask any questions you might have.|
| **How do I know which incidents have pending response actions?** | The Defender Experts card in your Microsoft Defender portal home page includes a link that displays a message (for example, _3 incidents awaiting your action_). Selecting this link directs you to a filtered list of incidents specifically requiring your attention.<br><br>You can filter the incident queue in your Microsoft Defender portal by selecting **Assigned to** as _Customer_ or **Status** as _Awaiting Customer Action_.|

### In Microsoft Sentinel

| Questions | Answers |
|---------|---------|
| **How do I get Defender Experts updates in Sentinel?** | If you enable the data connector between Microsoft Defender XDR and Microsoft Sentinel, updates made by Defender Experts in Defender to incidents are synchronized with Microsoft Sentinel. [Learn more](/azure/sentinel/connect-microsoft-365-defender).<br><br>The **Assigned to**, **Status**, and **Classification** fields in Microsoft Defender XDR incidents are mapped to the corresponding fields in Sentinel, namely **Owner**, **Status**, and **Reason for closing**.|
| **How do I get Defender Experts updates in Sentinel to automatically trigger a playbook?** | To get Defender Experts updates, first, set up automation rules in Sentinel that are triggered by the following Defender Experts updates:<ul><li>When the **Owner** field in Microsoft Sentinel is updated to _Defender Experts_ or _Customer_.</li><li> When the **Status** field in Microsoft Sentinel is updated to _Active_ or _Closed_, which corresponds to Microsoft Defender XDR **Status** _Active_ and _In Progress_ respectively.</li><li>When Sentinel **Tag** _Awaiting Customer Action_ gets added, which corresponds to Microsoft Defender XDR **Status** _Awaiting Customer Action_.</li></ul>Next, set up playbooks in Microsoft Sentinel to automatically sync incident updates or [send incident notifications into other apps](/azure/sentinel/tutorial-respond-threats-playbook).<ul><li>Send email, or Teams message, or Slack message to your SOC team when a Defender Experts analyst is assigned to an incident.</li><li>Send SMS or phone call via Azure Communications Services or Twilio connector to your SOC lead when Defender Experts publishes response action for your team.</li><li>Create a task or ticket in apps such as Azure DevOps, ServiceNow, Jira, ZenDesk, FreshService, PagerDuty, etc. for your IT Ops team. </li></ul>|
| **How can I access managed response actions published by Defender Experts from Sentinel?** | Once Defender Experts publish managed response actions for an incident in your Microsoft Defender portal, the **Owner** field is updated to _Customer_ automatically, and the tag _Awaiting Customer Action_ is available in Sentinel. You can use these field changes as a trigger to review the managed response panel for the corresponding incident in the Microsoft Defender portal.|

### In third-party SIEM, SOAR, or ITSM apps

| Questions | Answers |
|---------|---------|
| **How do I get Defender Experts updates from Microsoft Defender XDR to sync into third-party security information and event management (SIEM), security orchestration, automation and response (SOAR), or IT service management (ITSM) apps?** | You can get Defender Experts updates from Microsoft Defender XDR through the Graph Security API. For more information, see [Access managed response through Graph API](managed-detection-and-response-xdr.md#access-managed-response-through-graph-api).<br></br>To initiate the synchronization process:<ol><li>Establish the mapping between fields in Microsoft Defender XDR and the corresponding fields in the desired application. Determine whether the sync should be uni- or bi-directional and ensure that the other application supports that. <li>Develop, test, and deploy your sync integration. In most cases, it's recommended to periodically poll the Graph Security API every minute or so to check for updates.<li>Periodically validate that the field mapping is up to date.</ol>|
| **Can I sync managed response actions published by Defender Experts in Microsoft Defender portal to third-party SIEM, SOAR, or ITSM apps?** | Once Defender Experts publish managed response actions for an incident in your Microsoft Defender portal, the **Assigned to** field is changed to _Customer_ and the **Status** field is updated to _Awaiting Customer Action_. You can sync these fields via the Graph Security API and then use these changes as a trigger to review the managed response actions in the Microsoft Defender portal.<br><br>Managed response actions are expected to be available in the Graph Security API later this year, at which time it will be possible to sync them with your third-party apps.|

### In other communication services

| Questions | Answers |
|---------|---------|
| **Can I get Defender Experts updates from Microsoft Defender XDR in email?** | When a Defender Experts analyst publishes recommended response actions to an incident, your designated incident contacts receive an email notification to the email addresses specified in **Settings** > **Defender Experts** > **Notification contacts** in your Microsoft Defender portal.<br><br>Additionally, you can [configure a Logic App](/connectors/connector-reference/connector-reference-logicapps-connectors) to send all incident updates to your designated email addresses automatically.|
| **Can I get Defender Experts updates from Microsoft Defender XDR in Microsoft Teams?** | You can access two-way chat functionality through an incident's **Managed response** flyout panel in your Microsoft Defender portal.<br><br>You receive notifications when a Managed response is posted and can engage in real-time chat conversations with Defender Experts directly within Microsoft Teams. [Learn more about setting up Teams](get-started-xdr.md#receive-managed-response-notifications-and-updates-in-microsoft-teams).|
| **Can I get Defender Experts updates from Microsoft Defender XDR as SMS or phone call updates, or in third-party communications services such as Slack?** | You can [configure a Logic App](/connectors/connector-reference/connector-reference-logicapps-connectors) to send notifications from communication services such as Slack, Twilio, Azure Communication Services, and more.|


### See also

- [Managed detection and response](managed-detection-and-response-xdr.md)
- [FAQs related to Microsoft Defender Experts for XDR incident notifications](faq-incident-notifications-xdr.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
