---
title: Connect Microsoft Sentinel to the Microsoft Defender portal
description: Learn how to connect your Microsoft Sentinel environment to the Defender portal to unify your security operations.
ms.service: unified-secops-platform
f1.keywords: 
  - NOCSH
ms.author: cwatson
author: cwatson-cat
ms.localizationpriority: high
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- m365solution-getstarted
- highpri
- tier1
- usx-security
ms.topic: how-to
search.appverid: 
- MOE150
- MET150
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.date: 01/08/2025
---

# Connect Microsoft Sentinel to the Microsoft Defender portal

Microsoft Sentinel is generally available within Microsoft's unified security operations (SecOps) platform in the Microsoft Defender portal. When you onboard Microsoft Sentinel to the Defender portal with Microsoft Defender XDR, you unify capabilities like incident management and advanced hunting. Reduce tool switching and build a more context-focused investigation that expedites incident response and stops breaches faster. For more information, see:

- Blog post: [General availability of the Microsoft's unified security operations platform](https://aka.ms/unified-soc-announcement)
- Blog post: [Frequently asked questions about the unified security operations platform](https://techcommunity.microsoft.com/t5/microsoft-sentinel-blog/frequently-asked-questions-about-the-unified-security-operations/ba-p/4212048)
- [Microsoft Sentinel in the Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2263690)
- [Microsoft Defender XDR integration with Microsoft Sentinel](/azure/sentinel/microsoft-365-defender-sentinel-integration)

For preview, Microsoft Sentinel is available in the Defender portal without Microsoft Defender XDR or an E5 license.

## Prerequisites

Before you begin, review the feature documentation to understand the product changes and limitations.

- [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)
- [Advanced hunting in the Microsoft Defender portal](/defender-xdr/advanced-hunting-microsoft-defender)
- [Alerts, incidents, and correlation in Microsoft Defender XDR](/defender-xdr/alerts-incidents-correlation)
- [Automation with the unified security operations platform](/azure/sentinel/automation#automation-with-the-unified-security-operations-platform)

The Microsoft Defender portal supports a single Microsoft Entra tenant and the connection to one workspace at a time. In the context of this article, a workspace is a Log Analytics workspace with Microsoft Sentinel enabled.

### Microsoft Sentinel prerequisites

To onboard and use Microsoft Sentinel in the Defender portal, you must have the following resources and access:

- A Log Analytics workspace that has Microsoft Sentinel enabled
- The data connector for Microsoft Defender XDR enabled in Microsoft Sentinel for incidents and alerts. Install the Defender XDR solution and configure the data connector to connect Microsoft Sentinel to the Defender portal. For more information, see [Discover and manage Microsoft Sentinel out-of-the-box content](/azure/sentinel/sentinel-solutions-deploy). Within the Defender XDR data connector, the configuration option to connect incident and alerts is turned off and disabled after you onboard Microsoft Sentinel to the Defender portal.
- An Azure account with the appropriate roles to onboard, use, and create support requests for Microsoft Sentinel in the Defender portal. You won't see workspaces in the unified SecOps portal that you don't have permissions to onboard. The following table highlights some of the key roles needed.

  |Task |Microsoft Entra or Azure built-in role required |Scope  |
  |---------|---------|---------|
  |Onboard Microsoft Sentinel to the Defender portal|[Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) or [security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator) in Microsoft Entra ID|Tenant|
  |Connect or disconnect a workspace with Microsoft Sentinel enabled|[Owner](/azure/role-based-access-control/built-in-roles#owner) or </br>[User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator) and [Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor) |- Subscription for Owner or User Access Administrator roles </br></br>- Subscription, resource group, or workspace resource for Microsoft Sentinel Contributor |
  |View Microsoft Sentinel in the Defender portal|[Microsoft Sentinel Reader](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-reader) |Subscription, resource group, or workspace resource  |
  |Query Sentinel data tables or view incidents  |[Microsoft Sentinel Reader](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-reader) or a role with the following actions:</br>- Microsoft.OperationalInsights/workspaces/read</br>- Microsoft.OperationalInsights/workspaces/query/read</br>- Microsoft.SecurityInsights/Incidents/read</br>- Microsoft.SecurityInsights/incidents/comments/read</br>- Microsoft.SecurityInsights/incidents/relations/read</br>- Microsoft.SecurityInsights/incidents/tasks/read|Subscription, resource group, or workspace resource       |
  |Take investigative actions on incidents |[Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor) or a role with the following actions:</br>- Microsoft.OperationalInsights/workspaces/read</br>- Microsoft.OperationalInsights/workspaces/query/read</br>- Microsoft.SecurityInsights/incidents/read</br>- Microsoft.SecurityInsights/incidents/write</br>- Microsoft.SecurityInsights/incidents/comments/read</br>- Microsoft.SecurityInsights/incidents/comments/write</br>- Microsoft.SecurityInsights/incidents/relations/read</br>- Microsoft.SecurityInsights/incidents/relations/write</br>- Microsoft.SecurityInsights/incidents/tasks/read</br>- Microsoft.SecurityInsights/incidents/tasks/write    |Subscription, resource group, or workspace resource  |
  |Create a support request |[Owner](/azure/role-based-access-control/built-in-roles#owner) or </br> [Contributor](/azure/role-based-access-control/built-in-roles#contributor) or </br> [Support request contributor](/azure/role-based-access-control/built-in-roles#support-request-contributor) or  a custom role with Microsoft.Support/*|Subscription  |

  After you connect Microsoft Sentinel to the Defender portal, your existing Azure role-based access control (RBAC) permissions allow you to work with the Microsoft Sentinel features that you have access to. Continue to manage roles and permissions for your Microsoft Sentinel users from the Azure portal. Any Azure RBAC changes are reflected in the Defender portal. For more information about Microsoft Sentinel permissions, see [Roles and permissions in Microsoft Sentinel | Microsoft Learn](/azure/sentinel/roles) and [Manage access to Microsoft Sentinel data by resource | Microsoft Learn](/azure/sentinel/resource-context-rbac).

### Microsoft's unified SecOps platform prerequisites 

To unify capabilities with Defender XDR in Microsoft's unified SecOps platform, you must have the following resources and access:

- Licensing for Defender XDR, as described in [Microsoft Defender XDR prerequisites](/microsoft-365/security/mtp/prerequisites)
- Account for Defender XDR is a member of the same Microsoft Entra tenant with which Microsoft Sentinel is associated
- Access to Microsoft Defender XDR in the Defender portal, as described in [Microsoft Defender XDR prerequisites](/microsoft-365/security/mtp/prerequisites#required-permissions)

## Onboard Microsoft Sentinel

To connect a Microsoft Sentinel workspace to the Defender portal, complete the following steps. If you're onboarding Microsoft Sentinel without Defender XDR (preview) there is an extra step to trigger the connection with Microsoft Sentinel and Defender portal. 

1. Go to the [Microsoft Defender portal](https://security.microsoft.com/) and sign in.
1. To onboard Microsoft Sentinel without Defender XDR in the Defender portal: 
   1. To trigger the connection with Microsoft Sentinel, select **Investigation & response** > **Incidents**.
   1. Wait a few minutes for the connection to complete. 
1. In the Defender portal, select **Overview**.
1. Select **Connect a workspace**.
1. Choose the workspace you want to connect and select **Next**.
1. Read and understand the product changes associated with connecting your workspace. 
1. Select **Connect**.

After your workspace is connected, the banner on the **Overview** page shows that your environment is ready. The **Overview** page is updated with new sections that include metrics from Microsoft Sentinel like the number of data connectors and automation rules.

## Explore Microsoft Sentinel features in the Defender portal

After you connect your workspace to the Defender portal, **Microsoft Sentinel** is on the left-hand side navigation pane. If you have Defender XDR enabled, pages like  **Overview**, **Incidents**, and **Advanced Hunting** have unified data from Microsoft Sentinel and Defender XDR. If you don't have Defender XDR enabled, these pages just include data from Microsoft Sentinel (preview). For more information about the unified capabilities and differences between portals, see  [Microsoft Sentinel in the Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2263690).

Many of the existing Microsoft Sentinel features are integrated into the Defender portal. For these features, notice that the experience between Microsoft Sentinel in the Azure portal and Defender portal are similar. Use the following articles to help you start working with Microsoft Sentinel in the Defender portal. When using these articles, keep in mind that your starting point in this context is the [Defender portal](https://security.microsoft.com/) instead of the Azure portal.

- Search
  - [Search across long time spans in large datasets](/azure/sentinel/search-jobs?tabs=defender-portal)
  - [Restore archived logs from search](/azure/sentinel/restore)
- Threat management
  - [Visualize and monitor your data by using workbooks](/azure/sentinel/monitor-your-data?tabs=defender-portal)
  - [Conduct end-to-end threat hunting with Hunts](/azure/sentinel/hunts)
  - [Use hunting bookmarks for data investigations](/azure/sentinel/bookmarks)
  - [Use hunting Livestream in Microsoft Sentinel to detect threat](/azure/sentinel/livestream)
  - [Hunt for security threats with Jupyter notebooks](/azure/sentinel/notebooks-hunt)
  - [Add indicators in bulk to Microsoft Sentinel threat intelligence from a CSV or JSON file](/azure/sentinel/indicators-bulk-file-import?tabs=defender-portal)
  - [Work with threat indicators in Microsoft Sentinel](/azure/sentinel/work-with-threat-indicators?tabs=defender-portal)
  - [Understand security coverage by the MITRE ATT&CK framework](/azure/sentinel/mitre-coverage)
- Content management
  - [Discover and manage Microsoft Sentinel out-of-the-box content](/azure/sentinel/sentinel-solutions-deploy?tabs=defender-portal)
  - [Microsoft Sentinel content hub catalog](/azure/sentinel/sentinel-solutions-catalog)
  - [Deploy custom content from your repository](/azure/sentinel/ci-cd)
- Configuration
  - [Find your Microsoft Sentinel data connector](/azure/sentinel/data-connectors-reference)
  - [Create custom analytics rules to detect threats](/azure/sentinel/create-analytics-rules?tabs=defender-portal)
  - [Work with near-real-time (NRT) detection analytics rules in Microsoft Sentinel](/azure/sentinel/create-nrt-rules?tabs=defender-portal)
  - [Create watchlists](/azure/sentinel/watchlists-create?tabs=defender-portal)
  - [Manage watchlists in Microsoft Sentinel](/azure/sentinel/watchlists-manage)
  - [Create automation rules](/azure/sentinel/create-manage-use-automation-rules)
  - [Create and customize Microsoft Sentinel playbooks from content templates](/azure/sentinel/use-playbook-templates)

Find Microsoft Sentinel settings in the Defender portal under **System** > **Settings** > **Microsoft Sentinel**.

## Offboard Microsoft Sentinel

You can only have one workspace connected to the Defender portal at a time. If you want to connect to a different workspace that has Microsoft Sentinel enabled, disconnect the current workspace and connect the other workspace.

1. Go to the [Microsoft Defender portal](https://security.microsoft.com/) and sign in.
1. In the Defender portal, under **System**, select **Settings** > **Microsoft Sentinel**.
1. On the **Workspaces** page, select the connected workspace and **Disconnect workspace**.
1. Provide a reason why you're disconnecting the workspace. 
1. Confirm your selection.

   When your workspace is disconnected, the **Microsoft Sentinel** section is removed from the left-hand side navigation of the Defender portal. Data from Microsoft Sentinel is no longer included on the Overview page.

If you want to connect to a different workspace, from the **Workspaces** page, select the workspace and **Connect a workspace**.

## Related content

- [Microsoft Sentinel in the Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2263690)
- [Advanced hunting in the Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2264410)
- [Automatic attack disruption in Microsoft Defender XDR](/defender-xdr/automatic-attack-disruption)
- [Investigate incidents in Microsoft Defender portal](/defender-xdr/investigate-incidents)
- [Optimize your security operations](/azure/sentinel/soc-optimization/soc-optimization-access?tabs=defender-portal)
