---
title: What's new in Microsoft Defender XDR Unified role-based access control (RBAC)
description: See what features are available in the latest release of Microsoft Defender XDR Unified role-based access control (RBAC)
search.appverid: met150
ms.service: defender-xdr
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
  - m365-security-compliance
  - tier2
ms.topic: conceptual
ms.date: 11/17/2024
---

# What's new in Microsoft Defender XDR Unified role-based access control (RBAC)

This article provides information about new features and important product updates for the latest release of Microsoft Defender XDR Unified role-based access control (RBAC).

## November 2024

### Microsoft Defender for Cloud Apps permissions are now integrated with Microsoft Defender XDR Unified role-based access control (RBAC)

You can control access and grant granular permissions for Microsoft Defender for Cloud Apps as part of the Microsoft Defender XDR Unified RBAC model. For more information, see [Map Microsoft Defender for Cloud Apps permissions to the Microsoft Defender XDR Unified RBAC permissions](compare-rbac-roles.md#map-microsoft-defender-for-cloud-apps-permissions-to-the-microsoft-defender-xdr-unified-rbac-permissions). To activate the Defender for Cloud Apps workload, see [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md).

## May 2024

The permissions model to access *Email & collaboration* schema in advanced hunting for Microsoft Defender for Office 365 customers has been updated to align with Threat Explorer.

As part of this change, customers who are using Microsoft Defender XDR Unified RBAC with Defender for Office 365 should use the **Security operations \ Raw data \ Email & collaboration metadata (read)** permission to grant analysts access to the *Email & collaboration* schema in advanced hunting.

Users with the **Security operations \ Security data \ Security data basics (read)** permission for Defender for Office 365 will no longer have access to the *Email & collaboration* schema in advanced hunting, but will keep their access to the *Alerts & behaviors* schema.

## January 2024

Microsoft Defender XDR Unified RBAC is now generally available to GCC High and DoD customers. To learn more about the supported workloads and supported data sources, see [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md).

The process of importing roles from individual workloads' RBAC models into Microsoft Defender XDR Unified RBAC has been improved. Admins can now view the permissions and assignment of a role before importing it by clicking the role name at the roles to import selection stage.

## December 2023

### Microsoft Defender XDR Unified RBAC is now generally available

Microsoft Defender XDR Unified RBAC is now generally available. This offering is also available to GCC Moderate customers. To learn more about the supported workloads and supported data sources, see [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md).

## October 2023

<a name='exchange-online-permission-management-for-microsoft-defender-for-office-365-is-now-supported-in-microsoft-365-defender-unified-role-based-access-control-rbac-providing-full-integration-of-defender-for-office-365-roles-and-permissions'></a>

### Exchange Online permission management for Microsoft Defender for Office 365 is now supported in Microsoft Defender XDR Unified role-based access control (RBAC) providing full integration of Defender for Office 365 roles and permissions

Microsoft Defender XDR Unified Role-Based Access Control (RBAC) model now supports all security permission management scenarios for Microsoft Defender for Office 365.

In addition to the existing support for scenarios that are controlled by Email & collaboration roles (configured in the Microsoft Defender portal at <https://security.microsoft.com/emailandcollabpermissions>), Microsoft Defender XDR Unified RBAC now also supports the management of protection-related Exchange Online permissions, which could previously only be managed in the Exchange admin center (EAC) at <https://admin.exchange.microsoft.com/#/adminRoles>. To learn more about the Exchange Online permissions that are now supported, see [Exchange Online permissions mapping](compare-rbac-roles.md#exchange-online-permissions-mapping).

## September 2023

<a name='export-roles-for-microsoft-365-defender-unified-role-based-access-control-rbac'></a>

### Export roles for Microsoft Defender XDR Unified role-based access control (RBAC)

Now you can easily export your existing roles in Defender XDR Unified RBAC to a CSV file. The exported file will include details such as the role name, the included permissions, the assigned users or user groups, and assigned data sources. When a role has multiple assignments, each assignment will be listed on a separate row in the CSV file. The CSV also includes a snapshot of the Defender XDR Unified RBAC activation status for each workload available on the tenant. For more information, see [Edit, delete and export roles](./edit-delete-rbac-roles.md#export-roles).

## August 2023

### Detection tuning and Security settings permissions

You can now assign a new granular permission called **Detection tuning (manage)** in Microsoft Defender XDR Unified RBAC. Granting the **Detection Tuning (manage)** permission allows security operations analysts to create and manage Custom Detection, Alerts Tuning, and Threat Indicators of Compromise rules without granting them the full **Security Settings (manage)** permission. </br> </br> You can add the new permissions to a custom role by selecting **Authorization and settings \ Security settings** when creating or updating the role. For more information, see [Create custom roles with Microsoft Defender XDR Unified RBAC](create-custom-rbac-roles.md).

The **Security settings** permission name has been updated to **Core security settings**. This change has no impact on existing roles and permissions.

<a name='microsoft-defender-vulnerability-management-permissions-are-now-integrated-with-microsoft-365-defender-unified-role-based-access-control-rbac'></a>

### Microsoft Defender Vulnerability Management permissions are now integrated with Microsoft Defender XDR Unified role-based access control (RBAC)

You can now control access and grant granular permissions for Microsoft Defender Vulnerability Management as part of the Microsoft Defender XDR Unified RBAC model. For more information, see [Microsoft Defender 365 Unified role-based access control (RBAC)](manage-rbac.md). You can add the new permissions to a custom role by selecting them from the **Security posture** permissions group when creating the role. For more information, see [Create custom roles with Microsoft Defender XDR Unified RBAC](create-custom-rbac-roles.md).

<a name='microsoft-secure-score-permissions-integration-with-microsoft-365-defender-unified-role-based-access-control-rbac-is-now-in-public-preview'></a>

### Microsoft Secure Score permissions integration with Microsoft Defender XDR Unified role-based access control (RBAC) is now in Public Preview

You can control access and grant granular permissions for the Microsoft Secure Score experience as part of the Microsoft Defender XDR Unified RBAC model. For more information, see [Manage permissions with Microsoft Defender XDR Unified role-based access control(RBAC)](./microsoft-secure-score.md#manage-permissions-with-microsoft-365-defender-unified-role-based-access-controlrbac).

<a name='a-new-file-collection-permission-in-microsoft-365-defender-unified-rbac-is-now-in-public-preview'></a>

### A new file collection permission in Microsoft Defender XDR Unified RBAC is now in Public Preview

You can now assign a new granular permission in Microsoft Defender XDR Unified RBAC that allows users to collect or download files for analysis. This permission enables Microsoft Defender for Endpoint users download files directly from the file page and during a live response investigation in the live response console. You can add the new permission to a custom role by selecting it from the **Security operations** permissions group when creating the role. For more information, see [Create custom roles with Microsoft Defender XDR Unified RBAC](create-custom-rbac-roles.md).

For more information on what's new with other Microsoft Defender security products, see:

- [What's new in Microsoft Defender Vulnerability Management](/defender-vulnerability-management/whats-new-in-microsoft-defender-vulnerability-management)
- [What's new in Microsoft Defender for Endpoint](/defender-endpoint/whats-new-in-microsoft-defender-endpoint)
- [What's new in Microsoft Defender XDR](whats-new.md)
- [What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)
- [What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)
