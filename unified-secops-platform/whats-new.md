---
title: "What's new for Microsoft's unified security operations?"
description: Lists the new features and functionality available for Microsoft unified security operations.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: bagol
author: batamig
ms.localizationpriority: medium
ms.date: 07/16/2025
manager: orspodek
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: concept-article
---

# What's new for Microsoft unified security operations

This article lists recent features added for unified security operations in the Microsoft Defender portal.

## July 2025

- [For new customers only: Automatic onboarding and redirection to the Microsoft Defender portal](#for-new-customers-only-automatic-onboarding-and-redirection-to-the-microsoft-defender-portal)
- [No limit on the number of workspaces you can onboard to the Defender portal](#no-limit-on-the-number-of-workspaces-you-can-onboard-to-the-defender-portal)
- [Microsoft Sentinel in the Azure portal to be retired July 2026](#microsoft-sentinel-in-the-azure-portal-to-be-retired-july-2026)

### For new customers only: Automatic onboarding and redirection to the Microsoft Defender portal

For this update, new Microsoft Sentinel customers are customers who are [onboarding the first workspace in their tenant to Microsoft Sentinel](/azure/sentinel/quickstart-onboard) after **July 1, 2025**.

Starting on **July 1 2025**, such new customers who are also:

- not Azure Lighthouse-delegated users and
- who have the permissions of a subscription [Owner](/azure/role-based-access-control/built-in-roles#owner) or a [User access administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator)

Have their workspaces automatically onboarded to the Defender portal together with onboarding to Microsoft Sentinel. Users of such workspaces, who also aren't Azure Lighthouse-delegated users, see links in Microsoft Sentinel in the Azure portal that redirect them to the Defender portal.

For example:

:::image type="content" source="media/whats-new/redirect-no-defender.png" alt-text="Screenshot of a redirect link in the Azure portal.":::

Such users use Microsoft Sentinel in the Defender portal only.

New customers who don't have relevant permissions aren't automatically onboarded to the Defender portal, but they do still see redirection links in the Azure portal, together with prompts to have a user with relevant permissions manually onboard the workspace to the Defender portal.

This change streamlines the onboarding process and ensures that new customers can immediately take advantage of unified security operations capabilities without the extra step of manually onboarding their workspaces.

For more information, see:

- [Onboard Microsoft Sentinel](/azure/sentinel/quickstart-onboard)
- [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)
- [Changes for new customers](https://aka.ms/changes-for-sentinel-customers-july-25)

### No limit on the number of workspaces you can onboard to the Defender portal

There is no longer any limit to the number of workspaces you can onboard to the Defender portal.

Limitations still apply to the number of workspaces you can include in a Log Analytics query, and in the number of workspaces you can or should include in a scheduled analytics rule. 

For more information, see:

- [Connect Microsoft Sentinel to the Microsoft Defender portal](microsoft-sentinel-onboard.md)
- [Multiple Microsoft Sentinel workspaces in the Defender portal](/azure/sentinel/workspaces-defender-portal)
- [Extend Microsoft Sentinel across workspaces and tenants](/azure/sentinel/extend-sentinel-across-workspaces-tenants)

### Microsoft Sentinel in the Azure portal to be retired July 2026

Microsoft Sentinel is [generally available in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal), including for customers without Microsoft Defender XDR or an E5 license. This means that you can use Microsoft Sentinel in the Defender portal even if you aren't using other Microsoft Defender services.

Starting in **July 2026**, Microsoft Sentinel will be supported in the Defender portal only, and any remaining customers using the Azure portal will be automatically redirected.

If you're currently using Microsoft Sentinel in the Azure portal, we recommend that you start planning your transition to the Defender portal now to ensure a smooth transition and take full advantage of the [unified security operations experience offered by Microsoft Defender](/unified-secops-platform/overview-unified-security).

For more information, see:

- [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)
- [Transition your Microsoft Sentinel environment to the Defender portal](/azure/sentinel/move-to-defender)
- [Planning your move to Microsoft Defender portal for all Microsoft Sentinel customers](https://techcommunity.microsoft.com/blog/microsoft-security-blog/planning-your-move-to-microsoft-defender-portal-for-all-microsoft-sentinel-custo/4428613) (blog)

## June 2025

### Case management now generally available in the Defender multitenant portal

The Microsoft Defender portal's case management feature is now generally available in the Defender multitenant portal. For more information, see [View and manage cases across multiple tenants in the Microsoft Defender multitenant portal](mto-manage-cases.md).

## May 2025

- [Unified role-based access control in multitenant portal (Preview)](#unified-role-based-access-control-in-multitenant-management-preview)
- [All Microsoft Sentinel use cases generally available in the Defender portal](#all-microsoft-sentinel-use-cases-generally-available-in-the-defender-portal)
- [Case management now available for the Defender multitenant portal (Preview)](#case-management-now-available-for-the-defender-multitenant-portal-preview)

### Unified role-based access control in multitenant management (Preview)

Unified role-based access control (URBAC) is now available in the Microsoft Defender multitenant management portal. You can create, delete, import, and edit roles in the multitenant management portal. This capability provides a comprehensive view of permissions and access for your tenants, and a centralized administration to manage these permissions.

For more information, see [Manage unified role-based access control in multitenant management](mto-urbac.md).

### All Microsoft Sentinel use cases generally available in the Defender portal

All Microsoft Sentinel use cases that are in general availability, including [multi-tenant](mto-overview.md) and [multi-workspace](/azure/sentinel/workspaces-defender-portal) capabilities and support for all government and commercial clouds, are now also supported for general availability in the Defender portal.

We recommend that you [onboard your workspaces to the Defender portal](microsoft-sentinel-onboard.md) to take advantage of a single location for all your security operations. For more information, see:

- [The Best of Microsoft Sentinel - now in Microsoft Defender](https://techcommunity.microsoft.com/blog/MicrosoftThreatProtectionBlog/the-best-of-microsoft-sentinel-%E2%80%94-now-in-microsoft-defender/4415822) (blog)
- [Transition your Microsoft Sentinel environment to the Defender portal](/azure/sentinel/move-to-defender?toc=%2Funified-secops-platform%2Ftoc.json&bc=%2Funified-secops-platform%2Fbreadcrumb%2Ftoc.json)
- [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)

### Case management now available for the Defender multitenant portal (Preview)

SecOps teams for large organizations and managed security service providers (MSSPs) must manage cases across multiple tenants. This can now be done without leaving the Defender multitenant portal.

For more information, see [View and manage cases across multiple tenants in the Microsoft Defender multitenant portal](mto-manage-cases.md).

## April 2025

- [Merge incidents manually (Preview)](#merge-incidents-manually-preview)
- [Multi workspace and multi tenant support for Microsoft Sentinel (Preview)](#multi-workspace-and-multi-tenant-support-for-microsoft-sentinel-preview)
- [Case management now generally available](#case-management-now-generally-available)

### Merge incidents manually (Preview)

If two incidents should be merged because they describe the same attack story, but aren't merged for any of the reasons listed in ["When incidents aren't merged"](/defender-xdr/alerts-incidents-correlation#when-incidents-arent-merged), you can now merge the incidents manually after you fix the underlying reasons.

For example, if the incidents weren't merged because they were assigned to two different people, you can remove the assignment of one of the incidents and then merge the incidents manually.

To understand more about merging incidents, see [Alert correlation and incident merging in the Microsoft Defender portal](/defender-xdr/alerts-incidents-correlation).

For instructions on merging incidents manually, see [Merge incidents manually in the Microsoft Defender portal](/defender-xdr/merge-incidents-manually).


### Multi workspace and multi tenant support for Microsoft Sentinel (Preview)

Microsoft Sentinel now supports multiple workspaces in the Defender portal, using one primary workspace per tenant and multiple secondary workspaces.

A primary workspace's alerts are correlated with Defender XDR data, which results in incidents that include alerts from Microsoft Sentinel's primary workspace and Defender XDR. All other onboarded workspaces are considered secondary workspaces. Incidents are created based on the workspace’s data and won't include Defender XDR data.

If you're working with multiple tenants and multiple workspaces per tenant, you can also use Microsoft Defender multitenant management to view incidents and alerts, and to hunt for data in Advanced hunting, across both multiple workspaces and tenants.

For more information, see:

- [Multiple Microsoft Sentinel workspaces in the Defender portal](/azure/sentinel/workspaces-defender-portal)
- [Connect Microsoft Sentinel to the Microsoft Defender portal](microsoft-sentinel-onboard.md)
- [Microsoft Defender multitenant management](mto-overview.md)
- [View and manage incidents and alerts in Microsoft Defender multitenant management](mto-incidents-alerts.md)
- [Advanced hunting in Microsoft Defender multitenant management](mto-advanced-hunting.md)

### Cross-cloud multitenant management (Preview)

Multitenant management in Microsoft Defender now supports managing tenants in other Microsoft cloud environments. Security operations teams operating in government cloud environments can now manage their entire security operations, including tenants in other Microsoft cloud environments, in a single pane of glass. For more information, see [Manage tenants in other Microsoft cloud environments](mto-cross-cloud.md).

### Case management now generally available

The Microsoft Defender portal's case management feature is now generally available. For more information, see [Manage security operations cases natively in the Microsoft Defender portal](cases-overview.md).

## January 2025

- [Unified threat intelligence](#unified-threat-intelligence)
- [Manage SecOps work natively with case management (Preview)](#case-management-preview)
- [Unified device timeline in Microsoft Defender portal (Preview)](#unified-device-timeline-in-microsoft-defender-portal-preview)
- [SOC optimization updates for unified coverage management](#soc-optimization-updates-for-unified-coverage-management)

### Unified threat intelligence

Microsoft Sentinel-powered threat intelligence has moved in the Defender portal to **Intel management**, unifying threat intelligence features. In the Azure portal, the location remains unchanged.

:::image type="content" source="media/whats-new/intel-management-navigation.png" alt-text="Screenshot showing new menu placement for Microsoft Sentinel threat intelligence.":::

Along with the new location, the management interface streamlines the creation and curation of threat intel with these key features:

- Define relationships as you create new STIX objects.
- Curate existing threat intelligence with the new relationship builder.
- Create multiple objects quickly by copying common metadata from a new or existing TI object with the duplicate feature.
- Use advanced search to sort and filter your threat intelligence objects without even writing a Log Analytics query.

For more information, see the following articles:

- [Uncover adversaries with threat intelligence across the Defender portal](threat-intelligence-overview.md)
- [New STIX objects in Microsoft Sentinel](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/announcing-public-preview-new-stix-objects-in-microsoft-sentinel/4369164)
- [Understand threat intelligence](/azure/sentinel/understand-threat-intelligence#create-and-manage-threat-intelligence)

### Case management (Preview)

Case management is the first installment of an end-to-end solution that provides seamless management of your security work. SecOps teams maintain security context, work more efficiently and respond faster to attacks when they manage case work without leaving the Defender portal. Here's the initial set of scenarios and features that case management supports.

- Define your own case workflow with custom status values
- Assign tasks to collaborators and configure due dates
- Handle escalations and complex cases by linking multiple incidents to a case
- Manage access to your cases using RBAC

This is just the start. Stay tuned for additional capabilities as we evolve this solution.

For more information, see the following articles:

- [Manage security operations cases natively in the Microsoft Defender portal](cases-overview.md)
- [Microsoft Sentinel blog - Improve SecOps collaboration with case management](https://techcommunity.microsoft.com/blog/MicrosoftSentinelBlog/improve-secops-collaboration-with-case-management/4369044)

### Unified device timeline in Microsoft Defender portal (Preview)

The **unified device timeline**, a single, cohesive view that integrates device activity from Microsoft Sentinel and Defender XDR into a single timeline, is now available in Preview. This feature streamlines security investigations by enabling analysts to access all relevant device activities in one place, reducing the need to switch between platforms and lowering incident response times.

For more information, see [Device entity page in Microsoft Defender](/defender-xdr/entity-page-device#timeline-tab).

### SOC optimization updates for unified coverage management

In workspaces enabled for unified security operations, SOC optimizations now support both SIEM and XDR data, with detection coverage from across Microsoft Defender services. 

In the Defender portal, the **SOC optimizations** and **MITRE ATT&CK** pages also now provide extra functionality for threat-based coverage optimizations to help you understand the impact of the recommendations on your environment and help you prioritize which to implement first.

Enhancements include:

|Area | Details|
|-----|--------|
|**SOC optimizations Overview page** | - A **High**, **Medium**, or **Low** score for your current detection coverage. This sort of scoring can help you decide which recommendations to prioritize at a glance. <br><br>- An indication of the number of active Microsoft Defender products (services) out of all available products. This helps you understand whether there's a whole product that you're missing in your environment. |
| **Optimization details side pane**,<br> shown when you drill down to a specific optimization| - Detailed coverage analysis, including the number of user-defined detections, response actions, and products you have active. <br><br>- Detailed spider charts that show your coverage across different threat categories, for both user-defined and out-of-the-box detections. <br><br>- An option to jump to the specific threat scenario in the **MITRE ATT&CK** page instead of viewing MITRE ATT&CK coverage only in the side pane.<br><br>- An option to **View full threat scenario** to drill down to even further details about the security products and detections available to provide security coverage in your environment. |
|**MITRE ATT&CK page** | - A new toggle to view coverage by threat scenario. If you've jumped to the **MITRE ATT&CK** page from either a recommendation details side pane or from the **View full threat scenario** page, the **MITRE ATT&CK** page is pre-filtered for your threat scenario. <br><br>- The technique details pane, shown on the side when you select a specific MITRE ATT&CK technique, now shows the number of active detections out of all available detections for that technique. |

For more information, see [Optimize your security operations](/azure/sentinel/soc-optimization/soc-optimization-access?toc=%2Funified-secops-platform%2Ftoc.json&bc=%2Funified-secops-platform%2Fbreadcrumb%2Ftoc.json&tabs=defender-portal) and [Understand security coverage by the MITRE ATT&CK framework](/azure/sentinel/mitre-coverage).

## December 2024

- [New SOC optimization recommendations based on similar organizations (Preview)](#new-soc-optimization-recommendations-based-on-similar-organizations-preview)
- [Microsoft Sentinel workbooks now available to view directly in the Microsoft Defender portal](#microsoft-sentinel-workbooks-now-available-to-view-directly-in-the-microsoft-defender-portal)

### New SOC optimization recommendations based on similar organizations (Preview)

SOC optimizations now include new recommendations for adding data sources to your workspace based on the security posture of other organizations in similar industries and sectors as you, and with similar data ingestion patterns.

For more information, see [SOC optimization reference of recommendations](/azure/sentinel/soc-optimization/soc-optimization-reference).

### Microsoft Sentinel workbooks now available to view directly in the Microsoft Defender portal

Microsoft Sentinel workbooks are now available for viewing directly in the Microsoft Defender portal. Now, in the Defender portal, when you select **Microsoft Sentinel > Threat management > Workbooks**, you remain in the Defender portal instead of a new tab being opened for workbooks in the Azure portal. Continue tabbing out to the Azure portal only when you need to edit your workbooks.

Microsoft Sentinel workbooks are based on Azure Monitor workbooks, and help you visualize and monitor the data ingested to Microsoft Sentinel. Workbooks add tables and charts with analytics for your logs and queries to the tools already available.

For more information, see [Visualize and monitor your data by using workbooks in Microsoft Sentinel](/azure/sentinel/monitor-your-data) and [Connect Microsoft Sentinel to Microsoft Defender XDR](microsoft-sentinel-onboard.md).

## Related content

For more information on what's new with other Microsoft Defender security products and Microsoft Sentinel, see:

- [What's new in Microsoft Sentinel](/azure/sentinel/whats-new)
- [What's new in Microsoft Defender XDR](/defender-xdr/whats-new)
- [What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)
- [What's new in Microsoft Defender for Endpoint](/defender-endpoint/whats-new-in-microsoft-defender-endpoint)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)
- [What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)
- [What's new in Microsoft Security Exposure Management](/security-exposure-management/whats-new)

You can also get product updates and important notifications through the [message center](https://admin.microsoft.com/Adminportal/Home#/MessageCenter).
