---
title: Track and respond to emerging threats with Microsoft Defender for Endpoint threat analytics
ms.reviewer:
description: Understand emerging threats and attack techniques and how to stop them. Assess their impact to your organization and evaluate your organizational resilience.
search.appverid: met150
ms.service: defender-endpoint
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dolmont
audience: ITPro
ms.collection:
  - m365-security
  - m365initiative-defender-endpoint
  - tier1
  - mde-edr
ms.topic: conceptual
ms.subservice: edr
ms.date: 12/18/2023
---

# Track and respond to emerging threats through threat analytics

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

With more sophisticated adversaries and new threats emerging frequently and prevalently, it's critical to be able to quickly:

- Assess the impact of new threats
- Review your resilience against or exposure to the threats
- Identify the actions you can take to stop or contain the threats

Threat analytics is a set of reports from expert Microsoft security researchers covering the most relevant threats, including:

- Active threat actors and their campaigns
- Popular and new attack techniques
- Critical vulnerabilities
- Common attack surfaces
- Prevalent malware

Each report provides a detailed analysis of a threat and extensive guidance on how to defend against that threat. It also incorporates data from your network, indicating whether the threat is active and if you have applicable protections in place.

Watch this short video to learn more about how threat analytics can help you track the latest threats and stop them.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4bw1f]

## Required roles and permissions
The following table outlines the roles and permissions required to access Threat Analytics. Roles defined in the following table refer to custom roles in individual portals and aren't connected to global roles in Microsoft Entra ID, even if similarly named.

| **One of the following roles are required for Microsoft Defender XDR**  | **One of the following roles are required for Defender for Endpoint**  | **One of the following roles are required for Defender for Office 365** | **One of the following roles are required for Defender for Cloud Apps** | 
|---------|---------|---------|---------|
| Threat Analytics | Alerts and incidents data: <ul><li>View data- security operations</li></ul>Defender Vulnerability Management mitigations:<ul><li>View data - Threat and vulnerability management</li></ul> | Alerts and incidents data:<ul> <li>View-only manage alerts</li> <li>Manage alerts</li> <li>Organization configuration</li><li>Audit logs</li> <li>View-only audit logs</li><li>Security reader</li> <li>Security admin</li><li>View-only recipients</li> </ul> Prevented email attempts: <ul><li>Security reader</li> <li>Security admin</li><li>View-only recipients</li> | Not available for Defender for Cloud Apps or MDI users |

## View the threat analytics dashboard

The threat analytics dashboard is a great jump off point for getting to the reports that are most relevant to your organization. It summarizes the threats in the following sections:

- **Latest threats**: Lists the most recently published threat reports, along with the number of devices with active and resolved alerts.
- **High-impact threats**: Lists the threats that have the highest impact to the organization. This section ranks threats by the number of devices that have active alerts.
- **Highest exposure threats**: Lists threats to which your organization has the highest exposure. Your exposure level to a threat is calculated using two pieces of information: how severe the vulnerabilities associated with the threat are, and how many devices in your organization could be exploited by those vulnerabilities.

Select a threat from the dashboard to view the report for that threat.

:::image type="content" source="media/ta-dashboard.png" alt-text="The threat analytics dashboard" lightbox="media/ta-dashboard.png":::

## View a threat analytics report

Each threat analytics report provides information in three sections: 
- [**Overview**](#overview-quickly-understand-the-threat-assess-its-impact-and-review-defenses)
- [**Analyst report**](#analyst-report-get-expert-insight-from-microsoft-security-researchers)
- [**Related incidents**](#related-incidents-view-and-manage-related-incidents)
- [**Impacted assets**](#impacted-assets-get-list-of-impacted-devices-users-mailboxes-apps-and-cloud-resources)
- [**Endpoints exposure**](#endpoints-exposure-know-the-deployment-status-of-security-updates)
- [**Recommended actions**](#recommended-actions-review-list-of-mitigations-and-the-status-of-your-devices)

### Overview: Quickly understand the threat, assess its impact, and review defenses

The **Overview** section provides a preview of the detailed analyst report. It also provides charts that highlight the impact of the threat to your organization and your exposure through misconfigured and unpatched devices.

:::image type="content" source="media/ta-overview.png" alt-text="The Overview section of a threat analytics report" lightbox="media/ta-overview.png":::
_Overview section of a threat analytics report_

#### Assess the impact to your organization

Each report includes charts designed to provide information about the organizational impact of a threat:

- **Related incidents**: Provides an overview of the impact of the tracked threat to your organization with the following data:
  - Number of active alerts and the number of active incidents they're associated with
  - Severity of active incidents
- **Alerts over time**: Shows the number of related **Active** and **Resolved** alerts over time. The number of resolved alerts indicates how quickly your organization responds to alerts associated with a threat. Ideally, the chart should be showing alerts resolved within a few days.
- **Impacted assets**: Shows the number of distinct assets that currently have at least one active alert associated with the tracked threat. Alerts are triggered for mailboxes that received threat emails. Review both org- and user-level policies for overrides that cause the delivery of threat emails.

#### Review security resilience and posture

Each report includes charts that provide an overview of how resilient your organization is against a given threat:

- **Recommended actions**: Shows the **Action status** percentage, or the number of points you've achieved to improve your security posture. Perform the recommended actions to help address the threat. You can view the breakdown of points by **Category** or **Status**.
- **Endpoints exposure**: Shows the number of vulnerable devices. Apply security updates or patches to address vulnerabilities exploited by the threat.

### Analyst report: Get expert insight from Microsoft security researchers

Go to the **Analyst report** section to read through the detailed expert write-up. Most reports provide detailed descriptions of attack chains, including tactics and techniques mapped to the MITRE ATT&CK framework, exhaustive lists of recommendations, and powerful [threat hunting](/defender-xdr/advanced-hunting-overview) guidance.

[Learn more about the analyst report](threat-analytics-analyst-reports.md)

### Related incidents: View and manage related incidents

The **Related incidents** tab provides the list of all incidents related to the tracked threat. You can assign incidents or manage alerts linked to each incident. 

:::image type="content" source="media/ta-related-incidents.png" alt-text="Screenshot of the related incidents section of a threat analytics report." lightbox="media/ta-related-incidents.png":::

### Impacted assets: Get list of impacted devices, users, mailboxes, apps, and cloud resources

An asset is considered impacted if it's affected by an active, unresolved alert. The **Impacted assets** tab lists the following types of impacted assets:

- **Devices**: Endpoints that have unresolved Microsoft Defender for Endpoint alerts. These alerts typically fire on sightings of known threat indicators and activities.
- **Users**:
- **Mailboxes**: Mailboxes that have received email messages that have triggered Microsoft Defender for Office 365 alerts. While most messages that trigger alerts are typically blocked, user- or org-level policies can override filters.
- **Apps**:
- **Cloud resources**:

:::image type="content" source="media/ta-impacted-assets.png" alt-text="Screenshot of the impacted assets section of a threat analytics report." lightbox="media/ta-impacted-assets.png":::

### Endpoints exposure: Know the deployment status of security updates

The **Endpoints exposure** section provides your organization's **Exposure level** to the threat, which is calculated based on the severity of the vulnerabilities and misconfigurations exploited by the said threat, and the number of devices with these weaknesses. 

This section also provides the deployment status of supported software security updates for vulnerabilities found on onboarded devices. It incorporates data from [Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt), which also provides detailed drill-down information from various links in the report.

:::image type="content" source="media/ta-mitigations2.png" alt-text="The Endpoints exposure of a threat analytics report" lightbox="media/ta-mitigations2.png":::

### Recommended actions: Review list of mitigations and the status of your devices

In the **Recommended actions** tab, review the list of specific actionable recommendations that can help you increase your organizational resilience against the threat. The list of tracked mitigations includes supported security configurations, such as:
  - Cloud-delivered protection  
  - Potentially unwanted application (PUA) protection
  - Real-time protection

:::image type="content" source="media/ta-mitigations.png" alt-text="The Recommended actions section of a threat analytics report showing vulnerability details" lightbox="media/ta-mitigations.png":::


## Additional report details and limitations

When using the reports, keep the following in mind:

- Data is scoped based on your role-based access control (RBAC) scope. You'll see the status of devices in [groups that you can access](machine-groups.md).
- Charts reflect only mitigations that are tracked. Check the report overview for more mitigations that aren't shown in the charts.
- Mitigations don't guarantee complete resilience. The provided mitigations reflect the best possible actions needed to improve resiliency.
- Devices are counted as "unavailable" if they haven't transmitted data to the service.
- Antivirus-related statistics are based on Microsoft Defender Antivirus settings. Devices with third-party antivirus solutions can appear as "exposed".

## Related articles

- [Proactively find threats with advanced hunting](/defender-xdr/advanced-hunting-overview)
- [Understand the analyst report section](threat-analytics-analyst-reports.md)
- [Assess and resolve security weaknesses and exposures](/defender-vulnerability-management/defender-vulnerability-management)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
