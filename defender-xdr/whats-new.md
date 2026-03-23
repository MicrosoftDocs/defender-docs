---
title: What's new in Microsoft Defender XDR
description: Lists the new features and functionality in Microsoft Defender XDR
search.appverid: met150
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.date: 03/22/2026
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

## March 2026

- **Identity security enhancements**: New identity security capabilities help you monitor and manage identity security for human and non-human identities:
  - **Identity Security dashboard (Preview)**: The **Identity Security** dashboard provides summary cards for identity providers, on-premises identities, SaaS identities, PAM and IGA integrations, and non-human identities. For more information, see [The Identity Security dashboard](/defender-for-identity/dashboard).
  - **Coverage and maturity page (Preview)**: The **Coverage and maturity** page shows your organization's identity security coverage with maturity levels, including Connected, Protected, Fortified, and Resilient, and prioritized setup tasks. For more information, see [Coverage and maturity](identity-security/coverage-maturity.md).
  - **Identity inventory**: The **Identity inventory** page now shows human and non-human identities in separate tabs. Insight cards help you classify critical assets, view highly privileged identities, identify critical Active Directory service accounts, and view cloud application accounts. For more information, see [View the Identity inventory](/defender-for-identity/identity-inventory).
  - **Non-human identities (Preview)**: The **Non-human identities** tab shows non-human identities, including Microsoft Entra ID apps, Active Directory service accounts, Google Workspace apps, and Salesforce apps. For more information, see [Identity inventory](/defender-for-identity/identity-inventory) and [Investigate non-human identities](investigate-non-human-identities.md).
  - **Identity risk score (Preview)**: A new risk score for identities, ranging from 0 to 100, that indicates the likelihood of compromise by MITRE ATT&CK kill chain stage and the potential impact based on criticality and PIM role assignments. The risk score is available in Microsoft Entra ID, where it can be used to inform conditional access policies and identity protection workflows. A new **Risk score** tab on the identity page provides a detailed breakdown of the score. For more information, see [Investigate an identity](investigate-users.md).
  - **Domain investigation page (Preview)**: The **Domain investigation** page shows Active Directory domain security, including domain properties, deployment health, identity summary, service account breakdown, sensitive entities, active recommendations, group policies, and trust relationships. For more information, see [Investigate a domain](/defender-for-identity/investigate-domain).
  - **Identity security recommendations (Preview)**: View recommendations from Active Directory, Microsoft Entra ID, SaaS applications, and supported non-Microsoft identity providers. For more information, see [Identity security recommendations](identity-security/identity-security-recommendations.md).
- To improve accuracy and better protect organizational identities, we've made updates to the Secure Score category calculations. Some security recommendations categorized as **Cloud apps** recommendations are now considered identity‑related and grouped under the **Identity** category. While the total Secure Score remains unchanged, individual identity and app scores may change.
- (Preview) Customers can now use filters on very large incidents with many alerts and entities or hide specific entities to simplify complex incident graphs. By simplifying the graphs, they can focus their investigations on what matters most. [Learn more](investigate-incidents.md#filter-and-focus-the-incident-graph-preview)
- The [proactive user containment (contain user)](/defender-endpoint/respond-machine-alerts#contain-user-from-the-network) action as part of the predictive shielding feature is now generally available. This action infuses activity data with exposure data to identify exposed credentials at risk of being compromised and reused to conduct malicious activity.

## February 2026

- Microsoft Defender Experts for Hunting customers can now set up [Notification contacts](onboarding-defender-experts-for-hunting.md#tell-us-who-to-contact-for-important-matters). These contacts are the individuals or groups that Microsoft needs to notify if there are critical incidents or service updates.
- (GA) The following advanced hunting schema tables are now generally available:
    - The [`IdentityAccountInfo`](advanced-hunting-identityaccountinfo-table.md) table contains information about account information from various sources, including Microsoft Entra ID. It also includes information and link to the identity that owns the account.
    - The [`EntraIdSignInEvents`](advanced-hunting-entraidsigninevents-table.md) table contains information about Microsoft Entra interactive and non-interactive sign-ins.
    - The [`EntraIdSpnSignInEvents`](advanced-hunting-entraidspnsigninevents-table.md) table contains information about Microsoft Entra service principal and managed identity sign-ins.
    - The [`GraphApiAuditEvents`](advanced-hunting-graphapiauditevents-table.md) table provides information about Microsoft Entra ID API requests made to Microsoft Graph API for resources in the tenant.

## January 2026

- (Preview) Custom detections rules in Microsoft Defender now support Near Real-Time (NRT) configuration on [Microsoft Sentinel data](custom-detection-rules.md#tables-that-support-continuous-nrt-frequency).
- (Preview) In advanced hunting, if the query result exceeds the 64-MB size limit, the portal now returns the maximum number of records it can within this limit and displays a message indicating that the displayed results are partial due to size constraints. [Learn more](advanced-hunting-overview.md#quotas-and-usage-parameters)
- (Preview) The [`BehaviorInfo`](advanced-hunting-behaviorinfo-table.md) and [`BehaviorEntities`](advanced-hunting-behaviorentities-table.md) tables in advanced hunting now include additional columns and information about behavior data types and alerts from User and Entity Behavior Analytics (UEBA), providing more insights on the relationships between identified behaviors and entities. [Learn more about UEBA behaviors](/azure/sentinel/entity-behaviors-layer)

## December 2025

- (Preview) Microsoft Security Copilot in Microsoft Defender now includes the Dynamic Threat Detection Agent, an always-on, adaptive backend service that uncovers hidden threats across Defender and Microsoft Sentinel environments. [Learn more](dynamic-threat-detection-agent.md)
- (GA) The [Microsoft Security Copilot Threat Intelligence Briefing Agent in Microsoft Defender](threat-intel-briefing-agent-defender.md) is now generally available. It generates threat intelligence briefings based on the latest threat actor activity and both internal and external vulnerability information in a matter of minutes, helping security teams save time by creating customized, relevant reports.
- (Preview) Microsoft Security Copilot in Microsoft Defender now lets you to hunt for threats using natural language with the [Threat Hunting Agent](advanced-hunting-security-copilot-threat-hunting-agent.md). This agent delivers a complete, conversational threat hunting experience by not only generates queries but also interpreting results, surfacing insights, and guiding you through full hunting sessions.
- (Preview) The following advanced hunting schema tables are now available for preview:
    - The [`CampaignInfo`](advanced-hunting-campaigninfo-table.md) table contains contains information about email campaigns identified by Microsoft Defender for Office 365.
    - The [`FileMaliciousContentInfo`](advanced-hunting-filemaliciouscontentinfo-table.md) table contains information about files that were processed by Microsoft Defender for Office 365 in SharePoint Online, OneDrive, and Microsoft Teams.
- (GA) The [hunting graph](advanced-hunting-graph.md) in advanced hunting is now generally available. It also now has two new predefined threat scenarios that you can use to render your hunts as interactive graphs.
- (GA) Advanced hunting now supports custom functions that use tabular parameters. With tabular parameters, you can pass entire tables as inputs. This approach lets you build more modular, reusable, and expressive logic across your hunting queries. [Learn more](advanced-hunting-custom-functions.md#create-custom-functions-with-tabular-parameters) 

## November 2025

- Microsoft Sentinel customers using the Defender portal, or the Azure portal with the Microsoft Sentinel Defender XDR data connector, now also benefit from Microsoft Threat Intelligence alerts that highlight activity from nation-state actors, major ransomware campaigns, and fraudulent operations. To view these alert types, you must have the **Security Administrator** or **Global Administrator** role. The **Service Source**, **Detection Source**, and **Product Name** values for these alerts are listed as *Microsoft Threat Intelligence*.   For more information, see [Incidents and alerts in the Microsoft Defender portal](incidents-overview.md).
- (Preview) Defender XDR now includes the **predictive shielding** capability, which uses predictive analytics and real-time insights to dynamically infer risk, anticipate attacker progression, and harden your environment before threats materialize. [Learn more](shield-predict-threats.md)
- (Preview) A new **Restrict pod access** response action is now available when [investigating container threats](investigate-respond-container-threats.md) in the Defender portal. This response action blocks sensitive interfaces that allow lateral movement and privilege escalation. 
- (Preview) The [`IdentityAccountInfo`](advanced-hunting-identityaccountinfo-table.md) table in advanced hunting is now available for preview. This table contains information about account information from various sources, including Microsoft Entra ID. It also includes information and link to the identity that owns the account.
- (Preview) Threat analytics now has an **Indicators** tab that provides a list of all indicators of compromise (IOCs) associated with a threat. Microsoft researchers update these IOCs in real time as they find new evidence related to the threat. This information helps your security operations center (SOC) and threat intelligence analysts with remediation and proactive hunting. [Learn more](threat-analytics-indicators.md)
- (Preview) The overview section of [threat analytics](threat-analytics.md) now includes additional details about a threat, such as alias, origin, and related intelligence, providing you with more insights on what the threat is and how it might impact your organization.

## October 2025

- [Microsoft Defender Experts for XDR reports](reports-xdr.md) now include a **Trends** tab that provides you with the monthly volume of investigated and resolved incidents for the last six months. The tab visualizes the data according to the incidents' severity, MITRE tactic, and threat type. This section gives you insight into how Defender Experts are tangibly improving your security operations by showing important operational metrics on a month-over-month basis.
- [Microsoft Defender Experts for Hunting reports](defender-experts-report.md) now include an **Emerging threats** section that details the proactive, hypothesis-based hunts Defender Experts conducted in your environment. Each report also now includes investigation summaries for nearly every hunt that Defender Experts conduct in your environment, regardless of whether they identified a confirmed threat.

## September 2025

- (Preview) Use tasks in the Microsoft Defender portal to break down incident investigations into actionable steps and assign them across your operations teams. Tasks are displayed alongside Security Copilot insights, guided responses, and reports - giving your team a unified view of progress and next steps. When you onboard Microsoft Sentinel to the Defender portal, tasks you create in Microsoft Sentinel through the Azure portal are automatically synchronized to the Defender portal. For more information, see [Streamline incident response using tasks in the Microsoft Defender portal (Preview)](./split-incidents-into-tasks.md)
- (Preview) Investigate incidents by using [Blast radius analysis](investigate-incidents.md#blast-radius-analysis), which is an advanced graph visualization built on the Microsoft Sentinel data lake and graph infrastructure. This feature generates an interactive graph showing possible propagation paths from the selected node to predefined critical targets scoped to the user’s permissions.
- (Preview) In advanced hunting, you can now hunt by using the [hunting graph](advanced-hunting-graph.md), which renders rendering predefined threat scenarios as interactive graphs.

## August 2025

- (Preview) In advanced hunting, you can now enrich your [custom detection rules](custom-detection-rules.md) by creating dynamic alert titles and descriptions, select more impacted entities, and add custom details to display in the alert side panel. Microsoft Sentinel customers that are onboarded to Microsoft Defender also now have the option to customize the alert frequency when the rule is based only on data that is ingested to Sentinel.
- (Preview) The following advanced hunting schema tables are now available for preview:
   - The [`CloudStorageAggregatedEvents`](advanced-hunting-cloudstorageaggregatedevents-table.md) table contains information about storage activity and related events
   - The [`IdentityEvents`](advanced-hunting-identityevents-table.md) table contains information about identity events obtained from other cloud identity service providers
- (Preview) Advanced hunting now lets you investigate Microsoft Defender for Cloud behaviors. For more information, see [Investigate behaviors with advanced hunting](/defender-cloud-apps/behaviors).
- (Preview) In advanced hunting, the number of [query results](advanced-hunting-query-results.md) displayed in the Microsoft Defender portal has been increased to 100,000. 
- (GA) [Microsoft Defender Experts for XDR](dex-xdr-overview.md) and [Microsoft Defender Experts for Hunting](defender-experts-for-hunting.md) customers can now expand their service coverage to include server and cloud workloads protected by Microsoft Defender for Cloud through the respective add-ons, **Microsoft Defender Experts for Servers** and **Microsoft Defender Experts for Hunting - Servers**. [Learn more](faq-cloud-coverage-defender-experts.md)
- (GA) Defender Experts for XDR customers can now [incorporate third-party network signals](third-party-enrichment-defender-experts.md) for enrichment. This feature allows our security analysts to gain a more comprehensive view of an attack's path that allows for faster and more thorough detection and response. It also provides customers with a more holistic view of the threat in their environments.
- (GA) In advanced hunting, you can now [view all your user-defined rules](custom-detection-manage.md)—both custom detection rules and analytics rules—in the **Detection rules** page. This feature also brings the following improvements:
    - You can now filter for *every* column (in addition to **Frequency** and **Organizational scope**).
    - For multiworkspace organizations that have onboarded multiple workspaces to Microsoft Defender, you can now view the **Workspace ID** column and filter by workspace. 
    - You can now view the details pane even for analytics rules.
    - You can now perform the following actions on analytics rules: Turn on/off, Delete, Edit.
 - (GA) The **Sensitivity label** filter is now available in the **Incidents** and **Alerts** queues in the Microsoft Defender portal. This filter lets you filter incidents and alerts based on the sensitivity label assigned to the affected resources. For more information, see [Filters in the incident queue](incident-queue.md#filters-) and [Investigate alerts](investigate-alerts.md).


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



