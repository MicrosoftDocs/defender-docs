---
title: Threat analytics in Microsoft Defender XDR
ms.reviewer: 
description: Learn about emerging threats and attack techniques and how to stop them. Assess their impact to your organization and evaluate your organizational resilience.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security 
- m365initiative-m365-defender 
- tier1
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-ta
- seo-marvel-apr2020
search.appverid: met150
ms.date: 11/12/2024
---

# Threat analytics in Microsoft Defender XDR


[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender XDR

[!INCLUDE [Prerelease](../includes/prerelease.md)]

Threat analytics is our in-product threat intelligence solution from expert Microsoft security researchers. It's designed to assist security teams to be as efficient as possible while facing emerging threats, such as:

- Active threat actors and their campaigns
- Popular and new attack techniques
- Critical vulnerabilities
- Common attack surfaces
- Prevalent malware

You can access threat analytics either from the upper left-hand side of Microsoft Defender portal's navigation bar, or from a dedicated dashboard card that shows the top threats to your org, both in terms of known impact, and in terms of your exposure.

:::image type="content" source="/defender/media/threat-analytics/ta_inlandingpage_mtp.png" alt-text="Screenshot of the threat analytics landing page" lightbox="/defender/media/threat-analytics/ta_inlandingpage_mtp.png":::

Getting visibility on active or ongoing campaigns and knowing what to do through threat analytics can help equip your security operations team with informed decisions.

With more sophisticated adversaries and new threats emerging frequently and prevalently, it's critical to be able to quickly:

- Identify and react to emerging threats
- Learn if you're currently under attack
- Assess the impact of the threat to your assets
- Review your resilience against or exposure to the threats
- Identify the mitigation, recovery, or prevention actions you can take to stop or contain the threats

Each report provides an analysis of a tracked threat and extensive guidance on how to defend against that threat. It also incorporates data from your network, indicating whether the threat is active and if you have applicable protections in place.

## Required roles and permissions
The following roles and permissions are required to access Threat analytics in the Defender portal: 
- **Security data basics (read)**—to view threat analytics report, related incidents and alerts, and impacted assets
- **Vulnerability management (read)** and **Secure Score (read)**—to see related exposure data and recommended actions

By default, access to services available in the Defender portal are managed collectively using [Microsoft Entra global roles](m365d-permissions.md). If you need greater flexibility and control over access to specific product data, and aren't yet using the [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md) for centralized permissions management, we recommend creating custom roles for each service. [Learn more about creating custom roles](custom-roles.md)

>[!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.
>
> You'll have visibility to all threat analytics reports even if you have just one of the products supported. However, you're required to have each product and role to see that product's specific incidents, assets, exposure, and recommended actions associated with the threat. 

## View the threat analytics dashboard

The threat analytics dashboard ([security.microsoft.com/threatanalytics3](https://security.microsoft.com/threatanalytics3)) highlights the reports that are most relevant to your organization. It summarizes the threats in the following sections:

- **Latest threats**—lists the most recently published or updated threat reports, along with the number of active and resolved alerts.
- **High-impact threats**—lists the threats that have the highest impact to your organization. This section lists threats with the highest number of active and resolved alerts first.
- **Highest exposure threats**—lists threats to which your organization has the highest exposure. Your exposure level to a threat is calculated using two pieces of information: how severe the vulnerabilities associated with the threat are, and how many devices in your organization could be exploited by those vulnerabilities.

:::image type="content" source="/defender/media/threat-analytics/ta_dashboard_mtp.png" alt-text="Screenshot of the threat analytics dashboard," lightbox="/defender/media/threat-analytics/ta_dashboard_mtp.png":::

Select a threat from the dashboard to view the report for that threat. You can also select the **Search** field to key in a keyword that's related to the threat analytics report that you'd like to read.

#### View reports by category

You can filter the threat report list and view the most relevant reports according to a specific threat type or by type of report.

- **Threat tags**—assist you in viewing the most relevant reports according to a specific threat category. For example, the **Ransomware** tag includes all reports related to ransomware.
- **Report types**—assist you in viewing the most relevant reports according to a specific report type. For example, the **Tools & techniques** tag includes all reports that cover tools and techniques.

The different tags have equivalent filters that assist you in efficiently reviewing the threat report list and filtering the view based on a specific threat tag or report type. For example, to view all threat reports related to ransomware category, or threat reports that involve vulnerabilities.

The Microsoft Threat Intelligence team adds threat tags to each threat report. The following threat tags are currently available:
  - Ransomware
  - Extortion
  - Phishing
  - Hands on keyboard
  - Activity group
  - Vulnerability
  - Attack campaign
  - Tool or technique

Threat tags are presented at the top of the threat analytics page. There are counters for the number of available reports under each tag.

:::image type="content" source="/defender/media/threat-analytics/ta-dashboard-tags.png" alt-text="Screenshot of the threat analytics report tags." lightbox="/defender/media/threat-analytics/ta-dashboard-tags.png":::

To set the types of reports you want in the list, select **Filters**, choose from the list, and select **Apply**. 

  :::image type="content" source="/defender/media/threat-analytics/ta-threattag-filters-mtp-tb.png" alt-text="Screenshot of the Filters list." lightbox="/defender/media/threat-analytics/ta-threattag-filters-mtp.png":::

If you set more than one filter, the threat analytics reports list can also be sorted by threat tag by selecting the threat tags column:

  :::image type="content" source="/defender/media/threat-analytics/ta-taglist-mtp.png" alt-text="Screenshot of the threat tags column." lightbox="/defender/media/threat-analytics/ta-taglist-mtp.png":::

## View a threat analytics report

Each threat analytics report provides information in several sections:

- [**Overview**](#overview-quickly-understand-the-threat-assess-its-impact-and-review-defenses)
- [**Analyst report**](#analyst-report-get-expert-insight-from-microsoft-security-researchers)
- [**Related incidents**](#related-incidents-view-and-manage-related-incidents)
- [**Impacted assets**](#impacted-assets-get-list-of-impacted-devices-users-mailboxes-apps-and-cloud-resources)
- [**Endpoints exposure**](#endpoints-exposure-know-the-deployment-status-of-security-updates)
- [**Recommended actions**](#recommended-actions-review-list-of-mitigations-and-the-status-of-your-devices)

### Overview: Quickly understand the threat, assess its impact, and review defenses

The **Overview** section provides a preview of the detailed analyst report. It also provides charts that highlight the impact of the threat to your organization, and your exposure through misconfigured and unpatched devices.

:::image type="content" source="/defender/media/threat-analytics/ta_overview_mtp.png" alt-text="Screenshot of the overview section of a threat analytics report." lightbox="/defender/media/threat-analytics/ta_overview_mtp.png":::


#### Assess impact on your organization

Each report includes charts designed to provide information about the organizational impact of a threat:

- **Related incidents**—provides an overview of the impact of the tracked threat to your organization with the following data:
  - Number of active alerts and the number of active incidents they're associated with
  - Severity of active incidents
- **Alerts over time**—shows the number of related **Active** and **Resolved** alerts over time. The number of resolved alerts indicates how quickly your organization responds to alerts associated with a threat. Ideally, the chart should be showing alerts resolved within a few days.
- **Impacted assets**—shows the number of distinct assets that currently have at least one active alert associated with the tracked threat. Alerts are triggered for mailboxes that received threat emails. Review both org- and user-level policies for overrides that cause the delivery of threat emails.

#### Review security resilience and posture

Each report includes charts that provide an overview of how resilient your organization is against a given threat:

- **Recommended actions**—shows the **Action status** percentage, or the number of points you've achieved to improve your security posture. Perform the recommended actions to help address the threat. You can view the breakdown of points by **Category** or **Status**.
- **Endpoints exposure**—shows the number of vulnerable devices. Apply security updates or patches to address vulnerabilities exploited by the threat.


### Analyst report: Get expert insight from Microsoft security researchers

In the **Analyst report** section, read through the detailed expert write-up. Most reports provide detailed descriptions of attack chains, including tactics and techniques mapped to the MITRE ATT&CK framework, exhaustive lists of recommendations, and powerful [threat hunting](advanced-hunting-overview.md) guidance.

[Learn more about the analyst report](threat-analytics-analyst-reports.md)

### Related incidents: View and manage related incidents

The **Related incidents** tab provides the list of all incidents related to the tracked threat. You can assign incidents or manage alerts linked to each incident. 

:::image type="content" source="/defender/media/threat-analytics/ta_related_incidents_mtp.png" alt-text="Screenshot of the related incidents section of a threat analytics report." lightbox="/defender/media/threat-analytics/ta_related_incidents_mtp.png":::

> [!NOTE]
> Incidents and alerts associated with the threat are sourced from Defender for Endpoint, Defender for Identity, Defender for Office 365, Defender for Cloud Apps, and Defender for Cloud.

### Impacted assets: Get list of impacted devices, users, mailboxes, apps, and cloud resources

The **Impacted assets** tab shows the assets impacted by the threat over time. It displays: 
- Assets affected by active alerts
- Assets affected by resolved alerts
- All assets, or the total number of assets affected by active and resolved alerts

Assets are divided into the following categories:
- Devices
- Users
- Mailboxes
- Apps
- Cloud resources

:::image type="content" source="/defender/media/threat-analytics/ta_impacted_assets_mtp.png" alt-text="Screenshot of the impacted assets section of a threat analytics report." lightbox="/defender/media/threat-analytics/ta_impacted_assets_mtp.png":::

### Endpoints exposure: Know the deployment status of security updates

The **Endpoints exposure** section provides your organization's **Exposure level** to the threat, which is calculated based on the severity of the vulnerabilities and misconfigurations exploited by the said threat, and the number of devices with these weaknesses. 

This section also provides the deployment status of supported software security updates for vulnerabilities found on onboarded devices. It incorporates data from [Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt), which also provides detailed drill-down information from various links in the report.

:::image type="content" source="/defender/media/threat-analytics/ta_mitigations_mtp2.png" alt-text="The Endpoints exposure section of a threat analytics report" lightbox="/defender/media/threat-analytics/ta_mitigations_mtp2.png":::

### Recommended actions: Review list of mitigations and the status of your devices

In the **Recommended actions** tab, review the list of specific actionable recommendations that can help you increase your organizational resilience against the threat. The list of tracked mitigations includes supported security configurations, such as:
  - Cloud-delivered protection  
  - Potentially unwanted application (PUA) protection
  - Real-time protection

:::image type="content" source="/defender/media/threat-analytics/ta_mitigations_mtp.png" alt-text="The Recommended actions section of a threat analytics report showing vulnerability details" lightbox="/defender/media/threat-analytics/ta_mitigations_mtp.png":::

## Set up email notifications for report updates

You can set up email notifications that will send you updates on threat analytics reports. To create email notifications, follow the steps in [get email notifications for Threat analytics updates in Microsoft Defender XDR](m365d-threat-analytics-notifications.md).

## Other report details and limitations

When looking at the threat analytics data, remember the following factors:

- The checklist in the **Recommended actions** tab only displays recommendations tracked in [Microsoft Secure Score](microsoft-secure-score.md). Check the **Analyst report** tab for more recommended actions that aren't tracked in Secure Score.
- The recommended actions don't guarantee complete resilience and only reflect the best possible actions needed to improve it.
- Antivirus-related statistics are based on Microsoft Defender Antivirus settings. 
- The **Misconfigured devices** column in the main Threat analytics page shows the number of devices affected by a threat when the threat's related recommended actions aren't turned on. However, if Microsoft researchers don't link any recommended actions, the **Misconfigured devices** column shows the status *Not available*.  
- The **Vulnerable devices** column in the main Threat analytics page shows the number of devices running software that are vulnerable to any of the vulnerabilities linked to the threat. However, if Microsoft researchers don't link any vulnerabilities, the **Vulnerable devices** column shows the status *Not available*.

## See also

- [Proactively find threats with advanced hunting](advanced-hunting-overview.md)
- [Understand the analyst report section](threat-analytics-analyst-reports.md)
- [Assess and resolve security weaknesses and exposures](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
