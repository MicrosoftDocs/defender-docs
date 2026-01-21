---
title: Map Microsoft Defender XDR Unified role-based access control (RBAC) permissions
description: Compare permissions and access to Microsoft Defender XDR Security portal experiences using role-based access control (RBAC)
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection:
- m365-security
- tier3
ms.custom:
ms.topic: concept-article
ms.date: 12/15/2025
ms.reviewer:
search.appverid: met150
appliesto:
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender XDR
- Microsoft Defender for Identity
- Microsoft Defender for Office 365 P2
- Microsoft Defender Vulnerability Management
- Microsoft Defender for Cloud
- Microsoft Defender for Cloud Apps
---

# Map Microsoft Defender XDR Unified role-based access control (RBAC) permissions

All permissions listed within the Microsoft Defender XDR Unified RBAC model align to existing permissions in the individual RBAC models. After you activate the Microsoft Defender XDR Unified RBAC model, the permissions and assignments configured in your imported roles replace the existing roles in the individual RBAC models.

This article describes how existing roles and permissions in the available Microsoft Defender workloads and in Microsoft Entra ID map to the roles and permission in the Microsoft Defender XDR Unified RBAC model.

[!INCLUDE[Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This strategy helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

<a name='map-microsoft-365-defender-unified-rbac-permissions-to-existing-rbac-permissions'></a>

## Map Microsoft Defender XDR Unified RBAC permissions to existing RBAC permissions

> [!IMPORTANT]
> As of February 2025, the Microsoft Defender XDR Unified RBAC model is the default permissions model for new Microsoft Defender Endpoint organizations. New organizations can't export roles and permissions from the original permissions model. Existing organizations with roles and permissions assigned or exported before February maintain their current roles and permissions configuration.
>
> As of March 2025, the Microsoft Defender XDR Unified RBAC model is the default permissions model for new Microsoft Defender for Identity organizations. New organizations can't export roles and permissions from the original permissions model. Existing organizations with roles and permissions assigned or exported before March maintain their current roles and permissions configuration.

Use the tables in the following sections to learn more about how your existing individual RBAC role definitions map to your new Microsoft Defender XDR Unified RBAC roles:

- [Microsoft Defender for Endpoint and Defender Vulnerability Management](#map-defender-for-endpoint-and-defender-vulnerability-management-permissions-to-the-microsoft-365-defender-rbac-permissions)
- [Microsoft Defender for Office 365](#map-defender-for-office-365-permissions-to-the-microsoft-365-defender-unified-rbac-permissions)
- [Microsoft Defender for Identity](#map-microsoft-defender-for-identity-permissions-to-the-microsoft-365-defender-unified-rbac-permissions)
- [Microsoft Defender for Cloud Apps](#map-microsoft-defender-for-cloud-apps-permissions-to-the-microsoft-defender-xdr-unified-rbac-permissions)
- [Microsoft Defender for Cloud](#unified-rbac-roles-in-microsoft-defender-for-cloud)
- [Microsoft Entra Global roles access](#azure-active-directory-global-roles-access)

<a name='map-defender-for-endpoint-and-defender-vulnerability-management-permissions-to-the-microsoft-365-defender-rbac-permissions'></a>

### Map Defender for Endpoint and Defender Vulnerability Management permissions to the Microsoft Defender XDR RBAC permissions

|Defender for Endpoint and Defender Vulnerability Management permissions|Microsoft Defender XDR Unified RBAC permission|
|---|---|---|
|View data - Security operations|Security operations \ Security data \ Security data basics (read)|
|View data - Defender Vulnerability Management|Security posture \ Posture management \ Vulnerability management (read)|
|Alerts investigation|Security operations \ Security data \ Alerts (manage)|
|Active remediation actions - Security operations|Security operations \ Security data \ Response (manage)|
|Active remediation actions - Defender Vulnerability Management - Exception handling|Security posture \ Posture management \ Exception handling (manage)|
|Active remediation actions - Defender Vulnerability Management - Remediation handling|Security posture \ posture management \ Remediation handling (manage)|
|Active remediation actions - Defender Vulnerability Management - Application handling|Security posture \ Posture management \ Application handling (manage)|
|Defender Vulnerability management – Manage security baselines assessment profiles|Security posture \ posture management \ Security baselines assessment (manage)|
|Live response capabilities|Security operations \ Basic live response (manage)|
|Live response capabilities - advanced|Security operations \ Advanced live response (manage) <br/> Security operations \ Security data \ File collection (manage)|
|Manage security settings in the Security Center | Authorization and settings \ Security settings \ Core security settings (manage) <br/> Authorization and settings\Security settings \ Detection tuning (manage)|
|Manage portal system settings|Authorization and settings \ System setting (Read and manage)|
|Manage endpoint security settings in Microsoft Intune|Not supported - this permission is managed in the Microsoft Intune admin center|

<a name='map-defender-for-office-365-permissions-to-the-microsoft-365-defender-unified-rbac-permissions'></a>

### Map Defender for Office 365 permissions to the Microsoft Defender XDR Unified RBAC permissions

Use the following tables to learn how your existing Email & collaboration and protection-related Exchange Online permissions for Defender for Office 365 map to the new Microsoft Defender XDR Unified RBAC permissions:

- [Email & collaboration permissions mapping](#email--collaboration-permissions-mapping)
- [Exchange Online permissions mapping](#exchange-online-permissions-mapping)

#### Email & collaboration permissions mapping

You configured Email & collaboration permissions in the Defender portal at <https://security.microsoft.com/emailandcollabpermissions>.

|Email & collaboration permission|Type|Microsoft Defender XDR Unified RBAC permission|
|---|---|---|
|Global Reader|Role group|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read) <br/> Security operations \ Security data \ Response (manage) <br/> Authorization and settings \ Security settings \ Core security settings (read) <br/> Authorization and settings \ System setting (read)|
|Organization Management|Role group|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read) <br/> Security operations \ Security data \ Response (manage) <br/> Security operations \ Security data \ Email advanced actions (manage) <br/> Security operations \ Security data \ Email quarantine (manage) <br/> Authorization and settings \ Authorization (Read and manage) <br/> Authorization and settings \ Security setting (All permissions) <br/> Authorization and settings \ System settings (Read and manage)|
|Security Administrator|Role group|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read) <br/> Security operations \ Security data \ Response (manage) <br/> Security operations \ Security data \ Email quarantine (manage) <br/> Authorization and settings \ Authorization (read) <br/> Authorization and settings \ Security setting (All permissions) <br/> Authorization and settings \ System settings (Read and manage)|
|Security Reader|Role group|Security operations \ Security data \Security data basics (read) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read) <br/> Security operations \ Security data \ Response (manage) <br/> Authorization and settings \ Security settings \ Core security settings (read) <br/> Authorization and settings \ System setting (read)|
|Audit Logs|Role|Security operations \ Security data \ Security data basics (read)|
|Manage Alerts|Role|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage)|
|Preview|Role|Security operations\ Security operations \ Raw data (Email & collaboration) \ Email & collaboration content (read)|
|Quarantine|Role|Security operations \ Security data \ Email quarantine (manage)|
|Role Management|Role|Authorization and settings \ Authorization (Read and manage)|
|Search and Purge|Role|Security operations \ Security data \ Email advanced actions (manage)|
|View-Only Manage Alerts|Role|Security operations \ Security data \ Security data basics (read)|
|View-Only Recipients|Role|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read)|
|View-only Audit Logs|Role|Security operations \ Security data \ Security data basics (read)|

#### Exchange Online permissions mapping

You configured protection-related Exchange Online permissions in the Exchange admin center (EAC) at <https://admin.exchange.microsoft.com/#/adminRoles>.

|Exchange Online permission|Type|Microsoft Defender XDR Unified RBAC permission|
|---|---|---|
|Hygiene Management|Role group|Security operations \ Security data \ Email quarantine (manage) <br/> Authorization and settings \ Security settings \ Core security settings (manage) <br/> Authorization and settings \ Security settings \ Detection tuning (manage)|
|Organization Management|Role group|Security operations \ Raw data (email & collaboration) \ Email & collaboration metadata (read) <br/> Authorization and settings \ Security settings \ Core security settings (manage) <br/> Authorization and settings \ Security settings \ Detection tuning (manage) <br/> Authorization and settings \ System settings (Read and manage)|
|Security Administrator|Role group|Authorization and settings \ Security settings \ Detection tuning (manage) <br/> Authorization and settings \ System settings (Read and manage)|
|View-Only Organization Management|Role group|Authorization and settings \ Security settings (Read-only) <br/> Authorization and settings \ System settings (Read-only)|
|Tenant AllowBlockList Manager|Role|Authorization and settings \ Security settings \ Detection tuning (manage)|
|View-only Recipients|Role|Security operations \ Raw data (email & collaboration) \ Email & collaboration metadata (read)|

<a name='map-microsoft-defender-for-identity-permissions-to-the-microsoft-365-defender-unified-rbac-permissions'></a>

<a name='map-microsoft-defender-for-cloud-apps-permissions-to-the-microsoft-defender-xdr-unified-rbac-permissions-preview'></a>

### Map Microsoft Defender for Identity permissions to the Microsoft Defender XDR Unified RBAC

|Defender for Identity permission|Defender XDR Unified RBAC permission|
|---|---|
|MDI admin|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage) <br/> Authorization and settings \ Authorization (Read and manage) <br/> Authorization and settings \ Security setting (All permissions) <br/> Authorization and settings \ System settings (Read and manage)|
|MDI user|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage) <br/> Authorization and settings \ Security setting (All permissions) <br/> Authorization and settings \ System setting (read)|
|MDI viewer|Security operations \ Security data \ Security data basics (read) <br/> Authorization and settings \ Security settings \ Core security settings (read) <br/> Authorization and settings \ System setting (read)|

> [!NOTE]
> Defender for Identity experiences also adhere to permissions granted from [Microsoft Defender for Cloud Apps](https://security.microsoft.com/cloudapps/permissions/roles). For more information, see [Microsoft Defender for Identity role groups](https://go.microsoft.com/fwlink/?linkid=2202729).
> Exception: If you configured [Scoped deployment](/defender-cloud-apps/scoped-deployment) for Microsoft Defender for Identity alerts in Microsoft Defender for Cloud Apps, these permissions don't carry over. You need to explicitly grant the Security operations \ Security data \ Security data basics (read) permissions for the relevant portal users.

<a name='map-microsoft-defender-for-cloud-apps-permissions-to-the-microsoft-365-defender-unified-rbac-permissions'></a>

### Map Microsoft Defender for Cloud Apps permissions to the Microsoft Defender XDR Unified RBAC permissions

> [!IMPORTANT]
>
> - Virtually all app governance experiences are controlled by Microsoft Entra ID roles **only**. The only exception is the [OAuthAppInfo table in advanced hunting](advanced-hunting-oauthappinfo-table.md). Unified RBAC permissions in Defender for Cloud Apps grant access to the app governance data in this specific table.
>
> - In the [unified alerts and incidents experiences in Defender XDR](investigate-alerts.md), access to app governance data is controlled by Microsoft Entra ID **only**.
>
>   For more information about permissions in app governance, see [App governance roles](/defender-cloud-apps/app-governance-get-started#roles).
>
> - [Activating Defender for Cloud Apps integration with Defender XDR Unified RBAC](activate-defender-rbac.md) has the following results:
>   - Microsoft Entra ID roles continue to function as normal.
>   - The following [built-in scoped roles in Defender for Cloud Apps](/defender-cloud-apps/manage-admins#roles-and-permissions) are no longer supported:
>     - **App/instance admin**
>     - **User group admin**
>     - **Cloud Discovery global admin**
>     - **Cloud Discovery report admin**

|Defender for Cloud Apps permission|Defender XDR Unified RBAC permission|
|---|---|
|Local Global administrator|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage) <br/> Authorization and settings \ Authorization (all permissions) <br/> Authorization and settings \ Security settings (all permissions) <br/> Authorization and settings \ System settings (all permissions)|
|Local Security operator|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage) <br/> Authorization and settings \ Authorization (read) <br/> Authorization and settings \ Security setting (all permissions) <br/> Authorization and settings \ System setting (read)|
|Local Security reader|Security operations \ Security data \ Security data basics (read) <br/> Authorization and settings \ Authorization (read) <br/> Authorization and settings \ Security settings \ Security settings (read) <br/> Authorization and settings \ System settings (read)|
|Local Compliance administrator|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage) <br/> Authorization and settings \ Authorization (read) <br/> Authorization and settings \ Security settings \ Security settings (all permissions) <br/> Authorization and settings \ System settings (read)|

### Unified RBAC roles in Microsoft Defender for Cloud

Unified Role-Based Access Control (uRBAC) lets you manage permissions across Microsoft Defender for Cloud resources using a consistent model. Roles define what actions users can perform and assign roles carefully to maintain least-privilege access.

The following table lists the available uRBAC roles and their permissions.

|Role|Permissions|Description|
|---|---|---|
|**Security data basics**: Security operations / Security data / Security data basics (read)|Read|Access alerts, incidents, investigations, hunting, devices, cloud assets, and reports. Includes cloud inventory and threat protection.|
|**Alerts**: Security operations / Security data / Alerts (manage)|Manage|Manage alerts, investigations, scans, device tags, and packages. Includes cloud threat protection features.|
|**Vulnerability Management**: Security posture / Posture management / Vulnerability management (read)|Read|View vulnerability data: software inventory, weaknesses, missing KBs, baselines, hunting, and devices. Includes data lake (Preview).|
|**Exposure Management**: Security posture / Posture management / Exposure Management (read); Security posture / Posture management / Exposure Management (manage)|Read/Manage|View or manage exposure insights, including Secure Score, recommendations, initiatives, and metrics.|

> [!NOTE]
> Roles can be combined for broader access, but always apply least-privilege principles. Some capabilities might require more permissions or feature enablement.

<a name='azure-active-directory-global-roles-access'></a>

### Microsoft Entra Global roles access

Users assigned with Microsoft Entra global roles might also have access to the [Microsoft Defender portal](https://security.microsoft.com).

Use this table to learn about the permissions assigned by default for each workload (Defender for Endpoint, Defender Vulnerability Management, Defender for Office and Defender for Identity) in Microsoft Defender XDR Unified RBAC to each global Microsoft Entra role.

|Microsoft Entra role|Microsoft Defender XDR Unified RBAC assigned permissions for all workloads|Microsoft Defender XDR Unified RBAC assigned permissions – workload specific|
|---|---|---|
|Global administrator|Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage) <br/> Security operations \ Security data \ Response (manage) <br/> Security posture \ Posture management \ Exposure Management (read) <br/> Security posture \ Posture management \ Exposure Management (manage) <br/> Authorization and settings \ Authorization (Read and manage) <br/> Authorization and settings \ Security settings (All permissions) <br/> Authorization and settings \ System settings (Read and manage) |_**Defender for Endpoint and Defender Vulnerability Management permissions only permissions**_ <br/> Security operations \ Basic live response (manage) <br/> Security operations \ Advanced live response (manage) <br/> Security operations  \ Security data \ File collection (manage) <br/> Security posture \ Posture management \ Vulnerability management (read) <br/> Security posture \ Posture management \ Exception handling (manage) <br/> Security posture \ Posture management \ Remediation handling (manage) <br/> Security posture \ Posture management \ Application handling (manage) <br/> Security posture \ Posture management \ Security baseline assessment (manage) <br/> <br/> _**Defender for Office only permissions**_ <br/> Security operations \ Security data \ Email quarantine (manage) <br/> Security operations \ Security data \ Email advanced actions (manage) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read)|
|Security administrator|Same as Global administrator|Same as Global administrator|
|Global reader|Security operations \ Security data \ Security data basics (read) <br/> Security posture \ Posture management \ Exposure Management (read) <br/>|_**Defender for Endpoint and Defender Vulnerability Management permissions only permissions**_ <br/> Security posture \ Posture management \ Vulnerability management (read) <br/> <br/> _**Defender for Office only permissions**_ <br/> Security operations \ Security data \ Response (manage) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read) <br/> Authorization and settings \ Authorization (read) <br/><br/>_**Defender for Office and Defender for Identity only permissions**_ <br/> Authorization and settings \ Security settings \ Core security settings (read) <br/> Authorization and settings \ System settings (read)|
|Security reader|Security operations \ Security data \ Security data basics (read) <br/> Security posture \ Posture management \ Exposure Management (read) <br/>|_**Defender for Endpoint and Defender Vulnerability Management permissions only permissions**_ <br/> Security posture \ Posture management \ Vulnerability management (read) <br/> <br/> _**Defender for Office only permissions**_ <br/> Security operations \ Security data \ Response (manage) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read) <br/><br/>_**Defender for Office and Defender for Identity only permissions**_ <br/> Authorization and settings \ Security settings \ Core security settings (read) <br/> Authorization and settings \ System settings (read)|
|Security operator|Security operations \ Security data \ Security data basics (read) <br/> Security posture \ Posture management \ Exposure Management (read) <br/> Security operations \ Security data \ Response (manage) <br/> Security posture \ Posture management \ Secure Score (read) <br/> Authorization and settings \ Security settings (All permissions)|_**Defender for Endpoint and Defender Vulnerability Management permissions only permissions**_<br/> Security operations  \ Security data \ Basic live response (manage) <br/> Security operations  \ Security data \ Advanced live response (manage) <br/> Security operations \ Security data \ File collection (manage) <br/> Security posture \ Posture management \ Vulnerability management (read) <br/> Security posture \ Posture management \ Exception handling (manage) <br/> Security posture \ Posture management \ Remediation handling (manage) <br/> <br/>_**Defender for Office only permissions**_ <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read) <br/> Authorization and settings \ System settings (Read and manage) <br/> <br/>_**Defender for Identity only permissions**_ <br/> Authorization and settings \ System settings (read)|
|Exchange Administrator|Security posture \ Posture management \ Exposure Management (read) <br/> Security posture \ Posture management \ Exposure Management (manage) |_**Defender for Office only permissions**_ <br/> Security operations \ Security data \ Security data basic (read) <br/> Security operations \ Raw data (Email & collaboration) \ Email & collaboration metadata (read) <br/> Authorization and settings \ System settings (Read and manage)|
|SharePoint Administrator|Security posture \ Posture management \ Exposure Management (read) <br/> Security posture \ Posture management \ Exposure Management (manage)|not applicable|
|Service Support Administrator|Security posture \ Posture management \ Exposure Management (read) |not applicable|
|User Administrator|Security posture \ Posture management \ Exposure Management (read) |not applicable|
|HelpDesk Administrator|Security posture \ Posture management \ Exposure Management (read) |not applicable|
|Compliance administrator|not applicable|_**Defender for Office only permissions**_ <br/> Security operations \ Security data \ Security data basics (read) <br/> Security operations \ Security data \ Alerts (manage)|
|Compliance data administrator|not applicable|Same as Compliance administrator|
|Billing admin|not applicable|not applicable|

> [!NOTE]
> By activating the Microsoft Defender XDR Unified RBAC model, users with the Security Reader and Global Reader roles are granted read-only access to resources from workloads integrated into the model. However, accessing Microsoft Defender for Endpoint device data requires more configuration before Security Reader permissions take effect. For details, see the [Before you begin section](/defender-endpoint/rbac).

### Sample permission mappings of Microsoft Sentinel built-in roles to Microsoft Defender XDR Unified RBAC roles

These are examples of the permissions that can be assigned to the users based on their roles in Microsoft Sentinel. As Unified RBAC provides the option to have more granular permissions on Microsoft Defender XDR, you can utilize that granularity to separate certain Microsoft Defender XDR permissions on Tier level as well. For example, you can apply Live Response Basic to Tier 1, but Live Response Advanced permission to Tier 2.

If some users need only read access to Microsoft Sentinel SIEM raw data, they can also utilize Log Analytics [Granular RBAC](/azure/azure-monitor/logs/granular-rbac-log-analytics) functionality to scope access to only specific data saved in Log Analytics workspace. Please note that Granular RBAC will not scope access to Microsoft Sentinel incidents, alerts, watchlists, UEBA, TI, or any other Microsoft Sentinel SIEM features.

| Group | Role | Scope | Notes |
|---|---|---|---|
| Security Analysts | Microsoft Sentinel Responder | Microsoft Sentinel's Resource Group | View data, incidents, workbooks, and other Microsoft Sentinel resources. Manage incidents (assign, dismiss, etc.) |
| Security Analysts | Microsoft Sentinel Playbook Operator | Microsoft Sentinel's Resource Group (or the Resource Group where Playbooks are stored) | List, view and run playbooks. To attach playbooks to analytics rules, Microsoft Sentinel Contributor role is needed |
| Security Analysts | Security Operator Unified RBAC role | Microsoft Defender portal | View, investigate, and respond to security threats alerts<br />Manage Microsoft Defender XDR security settings<br />List of URBAC permissions equivalent for Security Operator Entra ID role are listed on this link:<br />/defender-xdr/compare-rbac-roles#microsoft-entra-global-roles-access |
| Security Engineer | Microsoft Sentinel Contributor | Microsoft Sentinel's Resource Group | View data, incidents, workbooks, and other Microsoft Sentinel resources. Manage incidents (assign, dismiss, etc.). Create and edit workbooks, analytics rules, and other Microsoft Sentinel resources. |
| Security Engineer | Logic Apps Contributor | Microsoft Sentinel's Resource Group (or the Resource Group where Playbooks are stored) | Run and modify playbooks.<br />Attach playbooks to analytics rules and automation rules. |
| Security Engineer | Monitoring Contributor | Subscription and/or Resource group and/or An existing data collection rule | Create or edit data collection rules |
| Security Engineer | Log Analytics Contributor | Microsoft Sentinel's Resource Group | Use the Search feature |
| Security Engineer | Virtual Machine Contributor Azure Connected Machine Resource Administrator | Virtual machines, virtual machine scale sets Arc-enabled servers | Deploy DCR associations (i.e. to assign rules to the machine) |
| Security Engineer | Template Spec Contributor | Microsoft Sentinel's Resource Group | Deploy v2.0 solutions from Content hub. |
| Security Engineer | Security Administrator Unified RBAC role | Microsoft Defender portal | Monitor security-related policies across Microsoft Defender XDR services<br />Manage security threats and alerts<br />View reports<br /><br />List of URBAC permissions equivalent for Security Administrator Entra ID role are listed on this link:<br />/defender-xdr/compare-rbac-roles#microsoft-entra-global-roles-access |
| Security Architect | Microsoft Sentinel Contributor | Microsoft Sentinel's Resource Group | View data, incidents, workbooks, and other Microsoft Sentinel resources. Manage incidents (assign, dismiss, etc.). Create and edit workbooks, analytics rules, and other Microsoft Sentinel resources. |
| Security Architect | User Access Administrator | Microsoft Sentinel's Resource Group | This is privileged role! This permission is needed to onboard Microsoft Sentinel SIEM to Microsoft Defender portal. |
| Security Architect | Security Administrator | Entara ID Tenant level | This is a privileged role! Users with this role have permissions to manage security-related features in the Microsoft 365 Defender portal, Microsoft Entra ID Protection, Microsoft Entra Authentication, Azure Information Protection, and Microsoft Purview compliance portal.<br /><br />This permission is needed to onboard Microsoft Sentinel SIEM to Microsoft Defender portal, offboard the workspace, or change primary/secondary workspace. |

## Next steps

- [Import existing RBAC roles](import-rbac-roles.md)
- [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
