---
title: Moving to Microsoft's unified SecOps platform
description: Learn about the different security roles involved in transitioning to Microsoft's unified SecOps platform from Microsoft Sentinel in the Azure portal.
ms.service: unified-secops-platform
ms.author: bagol
author: batamig
ms.date: 11/22/2024
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: conceptual
# customer intent: As a security professional, I want to understand the benefits and process of transitioning to Microsoft's unified SecOps platform so I can effectively plan my organization's migration from the standalone Microsoft Sentinel portal before its decommissioning.
---

# Moving to Microsoft's unified SecOps platform

Microsoft's unified security operations (SecOps) platform provides a single platform for end-to-end security operations (SecOps). This platform combines services like [Microsoft Defender XDR](/defender-xdr/microsoft-365-defender), [Microsoft Sentinel](/azure/sentinel/overview), [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management), and [Microsoft Security Copilot](/copilot/security/microsoft-security-copilot) within the Microsoft Defender portal. The unified SecOps platform provides multi-tenant and multi-workspace capabilities, a single incident queue, alert correlation, and automatic attack disruption to ensure streamlined workflows and enhances security operations efficiency.

Starting in May 2026, customers using the Microsoft Sentinel experience in the Azure portal will be redirected to the unified SecOps platform in the Microsoft Defender portal. Microsoft Sentinel in the Azure portal will be decommissioned on July 1, 2026. To prepare for this change, we recommend that customers that are still using the Microsoft Sentinel experience in the Azure portal proactively move to Microsoft's unified SecOps platform in the Microsoft Defender portal.

For more information, see the relevant documentation for each feature and [Capability differences between portals](/azure/sentinel/microsoft-sentinel-defender-portal##capability-differences-between-portals).

## Benefits of moving to unified SecOps

Moving to the unified SecOps platform offers the following benefits, and more:

| **Benefit**      | **Description**                                   |
|--------------------|--------------------------------------------|
| **Streamlined operations**                   | Manage all security incidents, alerts, and investigations from a single, unified interface.                                                                                                                    |
| **Enhanced threat detection**                | Leverage advanced AI and machine learning for faster and more accurate threat detection and response. Benefit from an improved signal-to-noise ratio and enhanced alert correlation, ensuring critical threats are addressed promptly. |
| **New features**                             | Access robust tools like Case Management for organizing and managing security incidents.                                                                                                                       |
| **Embedded Security Copilot experience**              | Enjoy a seamless experience for incident summaries, guided investigation, auto-generated Microsoft Teams messages, code analysis, and more.                                                                    |
| **Unified hunting, incidents, and investigation** | Benefit from a comprehensive view for more efficient threat detection and response.                                                                                                                            |
| **Enhanced visibility and reduced risk exposure** | Analyze attack paths to see how a cyber attacker could exploit vulnerabilities. Use guided recommendations to reduce exposure and prioritize actions based on potential impact.                                  |
| **Tailored post-incident recommendations**   | Prevent similar or repeat cyberattacks with tailored recommendations tied to Microsoft Security Exposure Management initiatives.                              |

For more information, see [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal).

## Move to unified SecOps as a security architect

The following content is relevant for security architects on a SecOps team that's moving from Microsoft Sentinel in the Azure portal to unified SecOps in the Defender portal:


| Feature | Details |
|---------|---------|
|**Access**     | - [Plan roles and permissions](overview-plan.md#plan-roles-and-permissions), including role-based access control (RBAC) <br>    - [Configure roles and permissions](overview-deploy.md#configure-roles-and-permissions) <br><br> The minimal required permission for an analyst to view Microsoft Sentinel data is to delegate permissions for the Azure RBAC Sentinel Reader role. These permissions are also applied to the unified portal. Without these permissions, the Microsoft Sentinel navigation menu isn't available on the unified portal, despite the analyst having access to the Microsoft Defender portal. <br><br>A best practice is to have all Microsoft Sentinel related resources in the same Azure resource group, then delegate Microsoft Sentinel role permissions (like the Sentinel Reader role) at the resource group level that contains the Microsoft Sentinel workspace. By doing this, the role assignment applies to all the resources that support Microsoft Sentinel.      |
|**Multiple workspaces and tenants**     |   - [Multiple Microsoft Sentinel workspaces in the Defender portal](/azure/sentinel/prepare-multiple-workspaces) <br>- [Extend Microsoft Sentinel across workspaces and tenants](/azure/sentinel/extend-sentinel-across-workspaces-tenants) <br>    - [Microsoft Defender multitenant management](mto-overview.md)      |
|**Log tiering and retention**     |  - [When to use auxiliary logs in Microsoft Sentinel](/azure/sentinel/basic-logs-use-cases) <br>- [Log retention plans in Microsoft Sentinel](/azure/sentinel/log-plans)<br>    - [Set up a table with the Auxiliary plan for low-cost data ingestion and retention in your Log Analytics workspace](/azure/azure-monitor/logs/create-custom-table-auxiliary) <br>    - [Microsoft Sentinel in the Defender portal: threat management](/azure/sentinel/microsoft-sentinel-defender-portal#threat-management) <br><br>Microsoft Sentinel classifies security data as primary security data and secondary security data. For primary security data, which you want to monitor closely, we recommend the analytic tier. For secondary security data, we recommend auxiliary. Both types of data are accessible for queries in the **Advanced hunting** page in the Defender portal.      |

## Move to unified SecOps as a security engineer

The following content is relevant for security engineers on a SecOps team that's moving from Microsoft Sentinel in the Azure portal to unified SecOps in the Defender portal:


| Feature | Details |
|---------|---------|
|**Data collection**     |  - [Microsoft Sentinel data connectors](/azure/sentinel/connect-data-sources?tabs=defender-portal) <br>- Experience in the Defender portal: [Visibility of connectors used by the unified security operations platform](/azure/sentinel/microsoft-sentinel-defender-portal), [Defender for Cloud](/azure/sentinel/microsoft-sentinel-defender-portal), and [DLP data](/azure/sentinel/microsoft-sentinel-defender-portal)     |
|**Automation**     |   [Automation in the Microsoft Defender portal](/azure/sentinel/automation/automation#automation-in-the-microsoft-defender-portal)      |
|**Ecosystem**     |  Distribute content across workspaces using one of the following methods: <br>    - [Deploy content as code from your repository](/azure/sentinel/ci-cd)<br> - [Microsoft Defender multitenant management](mto-overview.md)       |
|**SOC optimization**     |  [Optimize your security operations](/azure/sentinel/soc-optimization/soc-optimization-access?toc=%2Funified-secops-platform%2Ftoc.json&bc=%2Funified-secops-platform%2Fbreadcrumb%2Ftoc.json&tabs=defender-portal)       |
|**APIs**     | - [Microsoft Sentinel in the Defender portal: Capability differences between portals](/azure/sentinel/microsoft-sentinel-defender-portal)  <br>- [Microsoft Sentinel REST API reference](/rest/api/securityinsights/)        |

<!--add bookmark for API related information-->
<!--add bookmarks for data connector specifics, also add content there re mdc and dlp items. that's on ed-->
## Move to unified SecOps as a security analyst or manager

The following content is relevant for security analysts or security managers on a SecOps team that's moving from Microsoft Sentinel in the Azure portal to unified SecOps in the Defender portal:

| Feature | Details |
|-------------|-------------|
| **Incident and alert management** |[Alert correlation and incident merging in the Microsoft Defender portal](/defender-xdr/alerts-incidents-correlation?view=o365-worldwide) <br><br> The streamlined incident triage workflow in the Defender portal may require some retraining of analysts and updates to existing SOC processes. For example, incidents may now contain multiple cross-security domain alerts, reducing the number of required analysts and potentially combining tier 1 and tier 2 analysts. |
| **Attack disruption** | - [Automatic attack disruption](/defender-xdr/automatic-attack-disruption) <br> - [Details and results of an automatic attack disruption action](/defender-xdr/autoad-results) <br> - [Exclude assets from automated responses](/defender-xdr/automatic-attack-disruption-exclusions) |
| **Advanced hunting** | - [Advanced hunting with Microsoft Sentinel data in Microsoft Defender](/defender-xdr/advanced-hunting-microsoft-defender) <br> - [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal) |
| **Entities and user and entity behavior analytics (UEBA)** | - [Advanced threat detection with UEBA](/azure/sentinel/identify-threats-with-entity-behavior-analytics) <br> - [Enable UEBA](/azure/sentinel/enable-entity-behavior-analytics?tabs=defender) <br> - [Microsoft Sentinel UEBA reference](/azure/sentinel/ueba-reference) <br> - [Investigate users](/defender-xdr/investigate-users) <br> - [Device entity pages](/defender-xdr/entity-page-device) <br> - [Global search](/defender-xdr/microsoft-365-defender-portal#global-search) |
| **Case management** | [Manage cases in Microsoft's unified security operations platform](/unified-secops-platform/cases-overview) |
| **Security Copilot integration** | - [Summarize incidents](/microsoft-365/security/defender/security-copilot-m365d-incident-summary) <br> - [Summarize identities](/defender-xdr/security-copilot-defender-identity-summary) <br> - [Use guided response](/microsoft-365/security/defender/security-copilot-m365d-guided-response) <br> - [Analyze files](/microsoft-365/security/defender/copilot-in-defender-file-analysis) <br> - [Analyze scripts and codes](/microsoft-365/security/defender/security-copilot-m365d-script-analysis) <br> - [Create incident reports](/microsoft-365/security/defender/security-copilot-m365d-create-incident-report) <br> - [Generate KQL queries for hunting](/microsoft-365/security/defender/advanced-hunting-security-copilot) <br> - [Summarize device information](/microsoft-365/security/defender/copilot-in-defender-device-summary) |
| **Threat intelligence** | Extra features are available in the Defender portal with unified SecOps, including: <br> - [Threat analytics](/defender-xdr/threat-analytics) <br> - [Intel profiles](https://techcommunity.microsoft.com/blog/defenderthreatintelligence/whats-new-intel-profiles-deliver-crucial-information-context-about-threats/3780076) <br> - [Searching and pivoting with the Intel explorer](/defender/threat-intelligence/searching-and-pivoting) <br> - [Intel projects](/defender/threat-intelligence/using-projects) <br> For more information, see [Microsoft Sentinel in the Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal?toc=%2Funified-secops-platform%2Ftoc.json&bc=%2Funified-secops-platform%2Fbreadcrumb%2Ftoc.json). |
| **Visualization and reporting with workbooks** | - [Visualize and monitor your data by using workbooks with Microsoft Sentinel](/azure/sentinel/monitor-your-data?tabs=defender-portal) <br> - [Azure Workbooks](/azure/azure-monitor/visualize/workbooks-overview) <br> - [Microsoft Sentinel in the Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal?toc=%2Funified-secops-platform%2Ftoc.json&bc=%2Funified-secops-platform%2Fbreadcrumb%2Ftoc.json) |

<!--do we have nothing in docs about intel profiles?-->
<!--add bookmark for workbooks related information-->


## Related content

- **Webinar**: [Transition to the Unified SOC Platform: Deep Dive and Interactive Q&A for SOC Professionals](https://www.youtube.com/watch?v=WIM6fbJDkK4)
- **Blog**: [Technical FAQs for the unified SOC platform](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/unified-security-operations-platform---technical-faq/4189136)
- **Community**: [Microsoft Community Hub](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/frequently-asked-questions-about-the-unified-security-operations-platform/4212048)
