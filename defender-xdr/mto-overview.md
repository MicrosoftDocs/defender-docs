---
title: Microsoft Defender multitenant management
description: Learn about multitenant management for Microsoft Defender XDR and Microsoft Sentinel in the Microsoft unified security operations platform.
ms.service: defender-xdr
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- highpri
- tier1
- usx-security
ms.topic: conceptual
ms.date: 01/27/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender for Office 365 P2
---

# Microsoft Defender multitenant management

Multitenant management for Microsoft Defender XDR and the Microsoft unified security operations platform provides your security operation teams with a single, unified view of all the tenants you manage. This view enables your teams to quickly investigate incidents and perform advanced hunting across data from multiple tenants, improving your security operations.

If you have tenants with a Microsoft Sentinel workspace onboarded to the unified security operations platform, you're able to:

- Triage incidents and alerts across security information and event management (SIEM) and extended detection and response (XDR) data.
- Proactively search for SIEM and XDR data across multiple tenants.

Only one Microsoft Sentinel workspace per tenant is currently supported in the unified security operations platform. So in Microsoft Defender multitenant management, you have SIEM data from one Microsoft Sentinel workspace per tenant.

For more information, see:

- [Connect Microsoft Sentinel to Microsoft Defender XDR](/unified-secops-platform/microsoft-sentinel-onboard)
- [Multitenant organizations documentation](/azure/active-directory/multi-tenant-organizations/)

Multitenant management is also available to US government customers. Refer to the table below for specific scenarios for GCC, GCC High, DoD, and Commercial customers.

| Scenario | Availability |
| ------ | ------ |
|Multitenant management | Available to all GCC, GCC High, DoD, and Commercial customers.|
|Cross cloud collaboration| - Both DoD and GCC High customers can manage tenants in each other's clouds. </br></br> - GCC customers can manage tenants in the Commercial cloud. |

## Benefits of multitenant management

Some of the key benefits you get with multitenant management for Defender XDR and the Microsoft unified security operations platform include:

- **A centralized place to manage incidents across tenants**: A unified view provides SOC analysts with all the information they need to investigate incidents across multiple tenants, eliminating the need to sign in and out of each one.

- **Streamlined threat hunting**: Multi-tenancy support enables SOC teams use Microsoft Defender XDR advanced hunting capabilities to create Kusto Query Language (KQL) queries that proactively hunt for threats across multiple tenants.

- **Multi-customer management for partners**: Managed Security Service Provider (MSSP) partners can now gain visibility into security incidents, alerts, and threat hunting across multiple customers through a single pane of glass.

<a name='whats-included-in-multi-tenant-management-in-microsoft-365-defender'></a>

## What's included in multitenant management

The following key capabilities are available for each tenant you have access to in multitenant management for Microsoft Defender XDR and the Microsoft unified security operations platform:

| Capability | Description |
| ------ | ------ |
|**Incidents & alerts** > **Incidents** | Manage incidents originating from multiple tenants.|
|**Incidents & alerts** > **Alerts** | Manage alerts originating from multiple tenants. |
|**Hunting** > **Advanced hunting**| Proactively hunt for intrusion attempts and breach activity across multiple tenants at the same time.|
|**Hunting** > **Custom detection rules**|View and manage custom detection rules across multiple tenants.|
|**Assets** > **Devices** > **Tenants**| For all tenants and at a tenant-specific level, explore the device counts across different values such as device type, device value, onboarding status, and risk status.|
|**Endpoints** >**Vulnerability Management** > **Dashboard** |The Microsoft Defender Vulnerability Management dashboard provides both security administrators and security operations teams with aggregated vulnerability management information across multiple tenants. |
|**Endpoints** > **Vulnerability management** > **Tenants** |For all tenants and at a tenant-specific level, explore vulnerability management information across different values such as exposed devices, security recommendations, weaknesses, and critical CVEs. |
|**Configuration** > **Settings**|Lists the tenants you have access to. Use this page to view and manage your tenants.|

## Next steps

- [Set up Microsoft Defender multitenant management](mto-requirements.md)
