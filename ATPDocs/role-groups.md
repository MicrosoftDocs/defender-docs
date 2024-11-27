---
title: Role groups | Microsoft Defender for Identity
description: Learn about working with Microsoft Defender for Identity role groups.
ms.date: 01/15/2024
ms.topic: conceptual
---

# Microsoft Defender for Identity role groups

Microsoft Defender for Identity offers role-based security to safeguard data according to your organization's specific security and compliance needs. We recommend that you use role groups to manage access to Defender for Identity, segregating responsibilities across your security team and granting only the amount of access that users need to do their jobs.

## Unified role-based access control (RBAC)

Users that are already [Global Administrators](/entra/identity/role-based-access-control/permissions-reference) or [Security Administrators](/entra/identity/role-based-access-control/permissions-reference) on your tenant's Microsoft Entra ID are also automatically Defender for Identity administrator. Microsoft Entra Global and Security Administrators don't need extra permissions to access Defender for Identity.

For other users, enable and use Microsoft 365 role-based access control (RBAC) to create custom roles and to support more Entra ID roles such as Security operator or Security Reader by default to manage access to Defender for Identity.

When creating your custom roles, make sure that you apply the permissions listed in the following table:

|Defender for Identity access level | Minimum required Microsoft 365 unified RBAC permissions      |
| ------------------------------------- | ------------------------------------------------------------ |
|**Administrators**                             | - `Authorization and settings/Security settings/Read` <br/>- `Authorization and settings/Security settings/All permissions` <br/> - `Authorization and settings/System settings/Read`<br/>- `Authorization and settings/System settings/All permissions`<br/> - `Security operations/Security data/Alerts (manage)`<br/> -`Security operations/Security data /Security data basics (Read)`<br/>- `Authorization and settings/Authorization/All permissions` <br> - `Authorization and settings/Authorization/Read` |
|**Users**                               | - `Security operations/Security data /Security data basics (Read)`<br/>- `Authorization and settings/System settings/Read`<br/>- `Authorization and settings/Security settings/Read`<br/>- `Security operations/Security data/Alerts (manage)`<br/>- `microsoft.xdr/configuration/security/manage` |
|**Viewers**                            | - `Security operations/Security data /Security data basics (Read)`<br/>- `Authorization and settings / System settings (Read and manage)` <br>- `Authorization and settings / Security setting (All permissions)` |

For more information, see [Custom roles in role-based access control for Microsoft Defender XDR](/microsoft-365/security/defender/custom-roles) and [Create custom roles with Microsoft Defender XDR Unified RBAC](/microsoft-365/security/defender/create-custom-rbac-roles).

> [!NOTE]
> Information included from the [Defender for Cloud Apps activity log](classic-mcas-integration.md#activities) may still contain Defender for Identity data. This content adheres to existing Defender for Cloud Apps permissions.
> 
> Exception: If you have configured [Scoped deployment](/defender-cloud-apps/scoped-deployment) for Microsoft Defender for Identity alerts in the Microsoft Defender for Cloud Apps portal, these permissions do not carry over and you will have to explicitly grant the Security operations \ Security data \ Security data basics (read) permissions for the relevant portal users.

## Required permissions Defender for Identity in Microsoft Defender XDR

The following table details the specific permissions required for Defender for Identity activities in [Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-security-center-mdi).

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

| Activity      | Least required permissions                                      |
| ------------------- | ---------------------- |
| **Onboard Defender for Identity** (create workspace)   |  [Security Administrator](/entra/identity/role-based-access-control/permissions-reference) |
| **Configure Defender for Identity settings**      | One of the following Microsoft Entra roles:<br>- [Security Administrator](/entra/identity/role-based-access-control/permissions-reference)<br>- [Security Operator](/entra/identity/role-based-access-control/permissions-reference)<br> **Or** <br>The following [Unified RBAC permissions](#unified-role-based-access-control-rbac):<br />- `Authorization and settings/Security settings/Read`<br/>- `Authorization and settings/Security settings/All permissions`<br/>- `Authorization and settings/System settings/Read`<br/>- `Authorization and settings/System settings/All permissions` |
|**View Defender for Identity settings**      | One of the following Microsoft Entra roles:<br>- [Global Reader](/entra/identity/role-based-access-control/permissions-reference)<br>- [Security Reader](/entra/identity/role-based-access-control/permissions-reference) <br> **Or** <br>The following [Unified RBAC permissions](#unified-role-based-access-control-rbac):<br />- `Authorization and settings/Security settings/Read` <br/>- `Authorization and settings/System settings/Read`|
|**Manage Defender for Identity security alerts and activities**                           | One of the following Microsoft Entra roles:<br>- [Security Operator](/entra/identity/role-based-access-control/permissions-reference)<br> **Or** <br>The following [Unified RBAC permissions](#unified-role-based-access-control-rbac):<br />- `Security operations/Security data/Alerts (Manage)`<br/>- `Security operations/Security data /Security data basics (Read)` |
| **View Defender for Identity security assessments** <br> (now part of Microsoft Secure Score) | [Permissions](/microsoft-365/security/defender/microsoft-secure-score#required-permissions) to access Microsoft Secure Score <br> **And** <br> The following [Unified RBAC permissions](#unified-role-based-access-control-rbac): `Security operations/Security data /Security data basics (Read)`|
|**View the Assets / Identities page**|[Permissions](/defender-cloud-apps/manage-admins) to access Defender for Cloud Apps <br> **Or** <br> One of the Microsoft Entra roles required by [Microsoft Defender XDR](/microsoft-365/security/defender/m365d-permissions) |
|**Perform Defender for Identity response actions** |A [custom role](/microsoft-365/security/defender/create-custom-rbac-roles) defined with permissions for **Response (manage)**<br> **Or** <br> One of the following Microsoft Entra roles:<br>- [Security Operator](/entra/identity/role-based-access-control/permissions-reference) |


## Defender for Identity security groups

Defender for Identity provides the following security groups to help manage access to Defender for Identity resources:

- **Azure ATP *(workspace name)* Administrators**
- **Azure ATP *(workspace name)* Users**
- **Azure ATP *(workspace name)* Viewers**

The following table lists the activities available for each security group:

|Activity |Azure ATP *(workspace name)* Administrators|Azure ATP *(Workspace name)* Users|Azure ATP *(Workspace name)* Viewers|
|----|----|----|----|
|**Change health issue status**|Available|Not available|Not available|
|**Change security alert status** (reopen, close, exclude, suppress)|Available|Available|Not available|
|**Delete workspace**|Available|Not available|Not available|
|**Download a report**|Available|Available|Available|
|**Sign in**|Available|Available|Available|
|**Share/Export security alerts** (via email, get link, download details)|Available|Available|Available|
|**Update Defender for Identity configuration** (updates)|Available|Not available|Not available|
|**Update Defender for Identity configuration** (entity tags, including both sensitive and honeytoken)|Available|Available|Not available|
|**Update Defender for Identity configuration** (exclusions)|Available|Available|Not available|
|**Update Defender for Identity configuration** (language)|Available|Available|Not available|
|**Update Defender for Identity configuration** (notifications, including both email and syslog)|Available|Available|Not available|
|**Update Defender for Identity configuration** (preview detections) |Available|Available|Not available|
|**Update Defender for Identity configuration** (scheduled reports) |Available|Available|Not available|
|**Update Defender for Identity configuration** (data sources, including directory services, SIEM, VPN, Defender for Endpoint)|Available|Not available|Not available|
|**Update Defender for Identity configuration** (sensor management, including downloading software, regenerating keys, configuring, deleting)|Available|Not available|Not available|
|**View entity profiles and security alerts**|Available|Available|Available|

## Add and remove users

Defender for Identity uses Microsoft Entra security groups as a basis for role groups.

Manage your role groups from [Groups management page](https://aad.portal.azure.com/#blade/Microsoft_AAD_IAM/GroupsManagementMenuBlade/AllGroups) on the Azure portal. Only Microsoft Entra users can be added or removed from security groups.

## Next step

> [!div class="step-by-step"]
> [Configure a Directory Service account for Microsoft Defender for Identity »](directory-service-accounts.md)
