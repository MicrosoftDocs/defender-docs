---
title: Connect Microsoft Sentinel to the Microsoft Defender portal
description: Learn how to connect your Microsoft Sentinel environment to the Defender portal to unify your security operations.
ms.service: unified-secops-platform
f1.keywords: 
  - NOCSH
ms.author: bagol
author: batamig
ms.localizationpriority: high
manager: orspodek
audience: ITPro
ms.collection: 
- m365-security
- m365solution-getstarted
- highpri
- tier1
- usx-security
- zerotrust-solution
- msftsolution-secops
ms.topic: how-to
search.appverid: 
- MOE150
- MET150
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.date: 07/16/2025
---

# Connect Microsoft Sentinel to the Microsoft Defender portal

Microsoft Sentinel is generally available in the Microsoft Defender portal, with or without Microsoft Defender XDR or an E5 license. Using Microsoft Sentinel in the Defender portal together with Microsoft Defender XDR services, you unify capabilities like incident management and advanced hunting. Reduce tool switching and build a more context-focused investigation that expedites incident response and stops breaches faster. 

This article is relevant for customers whose Microsoft Sentinel workspaces are not yet connected to the Defender portal. In many cases, customers onboarding to Microsoft Sentinel after **July 1, 2025** are automatically onboarded to the Defender portal.

For more information, see:

- [What are unified security operations?](overview-unified-security.md)
- [Microsoft Sentinel in the Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2263690)
- [Microsoft Defender XDR integration with Microsoft Sentinel](/azure/sentinel/microsoft-365-defender-sentinel-integration)

## Prerequisites

Before you begin, review the feature documentation to understand the product changes and limitations.

- [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)
- [Advanced hunting in the Microsoft Defender portal](/defender-xdr/advanced-hunting-microsoft-defender)
- [Alerts, incidents, and correlation in Microsoft Defender XDR](/defender-xdr/alerts-incidents-correlation)
- [Microsoft Sentinel automation in the Defender portal](/azure/sentinel/automation#automation-with-the-unified-security-operations-platform)

The Microsoft Defender portal supports a single Microsoft Entra tenant and the connection to a primary workspace and multiple secondary workspaces. If you have only one workspace when you onboard Microsoft Sentinel, that workspace is designated as the primary workspace. For more information, see [Multiple Microsoft Sentinel workspaces in the Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2310579). In the context of this article, a workspace is a Log Analytics workspace with Microsoft Sentinel enabled.

### Microsoft Sentinel prerequisites

To onboard and use Microsoft Sentinel in the Defender portal, you must have the following resources and access:

- A Log Analytics workspace that has Microsoft Sentinel enabled

- An Azure account with the appropriate roles to onboard, use, and create support requests for Microsoft Sentinel in the Defender portal. You won't see workspaces in the Defender portal to onboard where you don't have the required permissions. The following table highlights some of the key roles needed.

  |Task |Microsoft Entra or Azure built-in role required |Scope  |
  |---------|---------|---------|
  |**Onboard Microsoft Sentinel to the Defender portal**|One of the following in Microsoft Entra ID:<br><br> - [Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) AND subscription [Owner](/azure/role-based-access-control/built-in-roles#owner) <br>- [Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator) AND subscription [Owner](/azure/role-based-access-control/built-in-roles#owner) <br>- [Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) AND [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator) AND [Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor) <br>- [Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator) AND [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator) AND [Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor)|Tenant|
  |**Connect or disconnect a secondary workspace**|One of the following:<br><br>- [Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) AND subscription [Owner](/azure/role-based-access-control/built-in-roles#owner)<br>- [Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator) AND subscription [Owner](/azure/role-based-access-control/built-in-roles#owner)<br>- [Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) AND [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator) AND [Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor)<br>- [Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator) AND [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator) AND [Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor)<br>- Subscription [Owner](/azure/role-based-access-control/built-in-roles#owner)<br>- [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator) AND [Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor)|- Subscription Owner or User Access Administrator roles </br></br>- Subscription, resource group, or workspace resource for Microsoft Sentinel Contributor |
  |**Change the primary workspace**|[Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) or [security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator) in Microsoft Entra ID|Tenant|
  |**View Microsoft Sentinel in the Defender portal**|[Microsoft Sentinel Reader](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-reader) |Subscription, resource group, or workspace resource  |
  |**Query Microsoft Sentinel data tables or view incidents**  |[Microsoft Sentinel Reader](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-reader) or a role with the following actions:</br>- Microsoft.OperationalInsights/workspaces/read</br>- Microsoft.OperationalInsights/workspaces/query/read</br>- Microsoft.SecurityInsights/Incidents/read</br>- Microsoft.SecurityInsights/incidents/comments/read</br>- Microsoft.SecurityInsights/incidents/relations/read</br>- Microsoft.SecurityInsights/incidents/tasks/read|Subscription, resource group, or workspace resource       |
  |**Take investigative actions on incidents** |[Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor) or a role with the following actions:</br>- Microsoft.OperationalInsights/workspaces/read</br>- Microsoft.OperationalInsights/workspaces/query/read</br>- Microsoft.SecurityInsights/incidents/read</br>- Microsoft.SecurityInsights/incidents/write</br>- Microsoft.SecurityInsights/incidents/comments/read</br>- Microsoft.SecurityInsights/incidents/comments/write</br>- Microsoft.SecurityInsights/incidents/relations/read</br>- Microsoft.SecurityInsights/incidents/relations/write</br>- Microsoft.SecurityInsights/incidents/tasks/read</br>- Microsoft.SecurityInsights/incidents/tasks/write    |Subscription, resource group, or workspace resource  |
  |**Create a support request** |[Owner](/azure/role-based-access-control/built-in-roles#owner) or </br> [Contributor](/azure/role-based-access-control/built-in-roles#contributor) or </br> [Support request contributor](/azure/role-based-access-control/built-in-roles#support-request-contributor) or  a custom role with Microsoft.Support/*|Subscription  |

  After you connect Microsoft Sentinel to the Defender portal, your existing Azure role-based access control (RBAC) permissions allow you to work with the Microsoft Sentinel features that you have access to. Continue to manage roles and permissions for your Microsoft Sentinel users from the Azure portal, as any Azure RBAC changes are reflected in the Defender portal. 

  For more information, see [Roles and permissions in Microsoft Sentinel](/azure/sentinel/roles) and [Manage access to Microsoft Sentinel data by resource](/azure/sentinel/resource-context-rbac).

  > [!IMPORTANT]
  > Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

### Unified security operations prerequisites

To unify Microsoft Defender XDR and Microsoft Sentinel security operations in the Defender portal, you must have the following resources and access:

- Licensing for Defender XDR, as described in [Microsoft Defender XDR prerequisites](/microsoft-365/security/mtp/prerequisites)
- Account for Defender XDR is a member of the same Microsoft Entra tenant with which Microsoft Sentinel is associated
- Access to Microsoft Defender XDR in the Defender portal, as described in [Microsoft Defender XDR prerequisites](/microsoft-365/security/mtp/prerequisites#required-permissions)

If applicable, complete these prerequisites:

|Service  |Prerequisite  |
|---------|---------|
|**Microsoft Purview Insider Risk Management**    |  If your organization uses Microsoft Purview Insider Risk Management, integrate that data by enabling the data connector **Microsoft 365 Insider Risk Management** on your primary workspace for Microsoft Sentinel. Disable that connector on any secondary workspaces for Microsoft Sentinel that you plan to onboard to the Defender portal. <br><br>- Install the **Microsoft Purview Insider Risk Management** solution from the **Content hub** on the primary workspace.<br>- Configure the data connector. <br><br>For more information, see [Discover and manage Microsoft Sentinel out-of-the-box content](/azure/sentinel/sentinel-solutions-deploy).        |
|**Microsoft Defender for Cloud**     | To stream Defender for Cloud incidents that are correlated across all subscriptions of the tenant to the primary workspace for Microsoft Sentinel: <br><br>-  Connect the **Tenant-based Microsoft Defender for Cloud (Preview)** data connector in the primary workspace.<br>  - Disconnect the **Subscription-based Microsoft Defender for Cloud (Legacy)** alerts connector from all workspaces in the tenant. <br><br>If you don't want to stream correlated tenant data for Defender for Cloud to the primary workspace, continue to use the **Subscription-based Microsoft Defender for Cloud (Legacy)** connector on your workspaces. For more information, see [Ingest Microsoft Defender for Cloud incidents with Microsoft Defender XDR integration](/azure/sentinel/ingest-defender-for-cloud-incidents).        |

## Onboard Microsoft Sentinel

This procedure describes how to onboard a Microsoft Sentinel-enabled workspace to the Defender portal.

1. Go to the [Microsoft Defender portal](https://security.microsoft.com/) and sign in.

1. If you're a Microsoft Sentinel-only customer without licenses for Defender services, and are onboarding your first workspace to Defender, start by triggering the connection to Microsoft Sentinel.

    In the Defender portal, select **Investigation & response** > **Incidents**, and then wait a few minutes for the connection to complete. This step isn't needed for any subsequent workspaces you onboard to Defender.
  
1. Select **Home** > **Connect a workspace**.

1. Select the workspaces you want to connect and select **Next**.

1. Select the **Primary workspace**.

1. Read and understand the product changes associated with connecting your workspace. 

1. Select **Connect**.

After your workspace is connected, the banner on the **Home** page shows that your environment is ready. The **Home** page is updated with new sections that include metrics from Microsoft Sentinel, like the number of data connectors and automation rules.

## Explore Microsoft Sentinel features in the Defender portal

After you connect your workspace to the Defender portal, **Microsoft Sentinel** is on the left-hand side navigation pane. If you have Defender XDR enabled, pages like  **Home**, **Incidents**, and **Advanced Hunting** have unified data from the primary workspace for Microsoft Sentinel and Defender XDR. If you don't have Defender XDR enabled, these pages just include data from Microsoft Sentinel. For more information about the unified capabilities and differences between portals, see  [Microsoft Sentinel in the Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2263690).

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

## Change the primary workspace  

You can only have one primary workspace connected to the Defender portal at a time. But you can change the primary workspace.

1. In the [Defender portal](https://security.microsoft.com/), go to **System** > **Settings** > **Microsoft Sentinel** > **Workspaces**.
1. Select the name of the workspace that you want to make primary.
1. Select **Set as primary**.
1. Read and understand the product changes associated with changing the primary workspace.
1. Select **Confirm and proceed**.

When you switch the primary workspace for Microsoft Sentinel, the Defender XDR connector is connected to the new primary and disconnected from the former one automatically. For more information, see [Multiple Microsoft Sentinel workspaces in the Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2310579).

## Offboard Microsoft Sentinel

If you decide to offboard a workspace from the Defender portal, disconnect the workspace from the settings for Microsoft Sentinel.

1. Go to the [Microsoft Defender portal](https://security.microsoft.com/) and sign in.
1. In the Defender portal, under **System**, select **Settings** > **Microsoft Sentinel**.
1. On the **Workspaces** page, select the connected workspace and **Disconnect workspace**.
1. Provide a reason why you're disconnecting the workspace. 
1. Confirm your selection.

   When your workspace is disconnected, the **Microsoft Sentinel** section is removed from the left-hand side navigation of the Defender portal. Data from Microsoft Sentinel is no longer included on the **Home** page.

If you want to connect to a different workspace, from the **Workspaces** page, select the workspace and **Connect a workspace**.

## Related content

- [Microsoft Sentinel in the Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2263690)
- [Advanced hunting in the Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2264410)
- [Automatic attack disruption in Microsoft Defender XDR](/defender-xdr/automatic-attack-disruption)
- [Investigate incidents in Microsoft Defender portal](/defender-xdr/investigate-incidents)
- [Optimize your security operations](/azure/sentinel/soc-optimization/soc-optimization-access?tabs=defender-portal)
