---
title: What's new in Microsoft Defender XDR
description: Lists the new features and functionality in Microsoft Defender XDR
search.appverid: met150
ms.service: defender-xdr
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
ms.date: 08/01/2025
manager: deniseb
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
ms.topic: whats-new
---

# What's new in Microsoft Defender XDR

Lists the new features and functionality in Microsoft Defender XDR.

For more information on what's new with other Microsoft Defender security products and Microsoft Sentinel, see:

- [What's new for unified security operations in the Defender portal](/unified-secops-platform/whats-new)
- [What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)
- [What's new in Microsoft Defender for Endpoint](/defender-endpoint/whats-new-in-microsoft-defender-endpoint)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)
- [What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)
- [What's new in Microsoft Defender for Cloud](/azure/defender-for-cloud/release-notes)
- [What's new in Microsoft Sentinel](/azure/sentinel/whats-new)
- [What's new in Microsoft Purview](/purview/whats-new)

You can also get product updates and important notifications through the [message center](https://admin.microsoft.com/Adminportal/Home#/MessageCenter).

## August 2025
- (GA) [Microsoft Defender Experts for XDR](dex-xdr-overview.md) and [Microsoft Defender Experts for Hunting](defender-experts-for-hunting.md) customers can now expand their service coverage to include server and cloud workloads protected by Microsoft Defender for Cloud through the respective add-ons, **Microsoft Defender Experts for Servers** and **Microsoft Defender Experts for Hunting - Servers**. [Learn more](faq-cloud-coverage-defender-experts.md)
- (GA) Defender Experts for XDR customers can now [incorporate third-party network signals](third-party-enrichment-defender-experts.md) for enrichment, which could allow our security analysts to not only gain a more comprehensive view of an attack's path that allows for faster and more thorough detection and response, but also provide customers with a more holistic view of the threat in their environments.
- (GA) In advanced hunting, you can now [view all your user-defined rules](custom-detection-manage.md)—both custom detection rules and analytics rules—in the **Detection rules** page. This feature also brings the following improvements:
    - You can now filter for *every* column (in addition to **Frequency** and **Organizational scope**).
    - For multiworkspace organizations that have onboarded multiple workspaces to Microsoft Defender, you can now view the **Workspace ID** column and filter by workspace. 
    - You can now view the details pane even for analytics rules.
    - You can now perform the following actions on analytics rules: Turn on/off, Delete, Edit.
## July 2025
- (Preview) The [`GraphApiAuditEvents`](advanced-hunting-graphapiauditevents-table.md) table in advanced hunting is now available for preview. This table contains information about Microsoft Entra ID API requests made to Microsoft Graph API for resources in the tenant.

- (Preview) The [`DisruptionAndResponseEvents`](advanced-hunting-disruptionandresponseevents-table.md) table, now available in advanced hunting, contains information about [automatic attack disruption](automatic-attack-disruption.md) events in Microsoft Defender XDR. These events include both block and policy application events related to triggered attack disruption policies, and automatic actions that were taken across related workloads. Increase your visibility and awareness of active, complex attacks disrupted by attack disruption to understand the attacks' scope, context, impact, and actions taken.

## June 2025
- (Preview) Microsoft Copilot now provides suggested prompts as part of incident summaries in the Microsoft Defender portal. Suggested prompts help you get more insights into the specific assets involved in an incident. For more information, see [Summarize incidents with Microsoft Copilot in Microsoft Defender](security-copilot-m365d-incident-summary.md).   
- (GA) In [advanced hunting](advanced-hunting-defender-use-custom-rules.md#use-adx-operator-for-azure-data-explorer-queries), Microsoft Defender portal users can now use the `adx()` operator to query tables stored in Azure Data Explorer. You no longer need to go to log analytics in Microsoft Sentinel to use this operator if you're already in Microsoft Defender.


## May 2025
- (Preview) In advanced hunting, you can now [view all your user-defined rules](custom-detection-manage.md)—both custom detection rules and analytics rules—in the **Detection rules** page. This feature also brings the following improvements:
    - You can now filter for *every* column (in addition to **Frequency** and **Organizational scope**).
    - For multiworkspace organizations that have onboarded multiple workspaces to Microsoft Defender, you can now view the **Workspace ID** column and filter by workspace. 
    - You can now view the details pane even for analytics rules.
    - You can now perform the following actions on analytics rules: Turn on/off, Delete, Edit.


- (Preview) You can now highlight your security operations achievements and the impact of Microsoft Defender using the **unified security summary**. The unified security summary is available in the Microsoft Defender portal and streamlines the process for SOC teams to generate security reports, saving time usually spent on collecting data from various sources and creating reports. For more information, see [Visualize security impact with the unified security summary](security-summary-report.md).
- Defender portal users who have onboarded Microsoft Sentinel and have enabled the [User and Entity Behavior Analytics (UEBA)](/azure/sentinel/ueba-reference) can now take advantage of the new unified [`IdentityInfo` table](advanced-hunting-identityinfo-table.md) in advanced hunting. This latest version now includes the largest possible set of fields common to both Defender and Azure portals. 
- (Preview) The following advanced hunting schema tables are now available for preview to help you look through Microsoft Teams events and related information:
    - The [MessageEvents](advanced-hunting-messageevents-table.md) table contains details about messages sent and received within your organization at the time of delivery
    - The [MessagePostDeliveryEvents](advanced-hunting-messagepostdeliveryevents-table.md) table contains information about security events that occurred after the delivery of a Microsoft Teams message in your organization
    - The [MessageUrlInfo](advanced-hunting-messageurlinfo-table.md) table contains information about URLs sent through Microsoft Teams messages in your organization
     
    
## April 2025

- (Preview) You can now create data security investigations in the Microsoft Defender portal with the integration of Microsoft Purview Data Security Investigations (preview) and Microsoft Defender XDR. This integration allows security operations center (SOC) teams to enhance their investigation and response to potential data security incidents like data breaches or data leaks. For more information, see [Create data security investigations in the Microsoft Defender portal](create-dsi-in-defender.md).

- (Preview) **Contain IP addresses of undiscovered devices**: Containing IP addresses associated with devices that are undiscovered or are not onboarded to Defender for Endpoint is now in preview. Containing an IP address prevents attackers from spreading attacks to other non-compromised devices. See [Contain IP addresses of undiscovered devices](automatic-attack-disruption.md#automated-response-actions) for more information.

- (Preview) The [OAuthAppInfo](advanced-hunting-oauthappinfo-table.md) table is now available for preview in advanced hunting. The table contains information about Microsoft 365-connected OAuth applications registered with Microsoft Entra ID and available in the Defender for Cloud Apps app governance capability.

- The `OnboardingStatus` and `NetworkAdapterDnsSuffix` columns are now available in the [`DeviceNetworkInfo`](advanced-hunting-devicenetworkinfo-table.md) table in advanced hunting.



## March 2025

- (Preview) The incident description has moved within the incident page. The incident description is now displayed after the incident details. For more information, see [Incident details](investigate-incidents.md#incident-details).

- The Microsoft 365 alert policies can now only be managed in the Microsoft Defender portal. For more information, see [Alert policies in Microsoft 365](alert-policies.md).

- You can now link Threat analytics reports when setting up custom detections. [Learn more](threat-analytics.md#set-up-custom-detections-and-link-them-to-threat-analytics-reports)

## February 2025

- (Preview) IP addresses can now be excluded from automated responses in attack disruption. This feature allows you to exclude specific IPs from automated containment actions triggered by attack disruption. For more information, see [Exclude assets from automated responses in automatic attack disruption](automatic-attack-disruption-exclusions.md).

- (Preview) The `PrivilegedEntraPimRoles` column is available for preview in the advanced hunting [IdentityInfo](advanced-hunting-identityinfo-table.md) table. 
- (GA) You can now view how Security Copilot came up with the query suggestion in its [responses](advanced-hunting-security-copilot.md#try-your-first-request) in Microsoft Defender advanced hunting. Select **See the logic behind the query** below the query text to validate that the query aligns with your intent and needs, even if you don't have an expert-level understanding of KQL.

