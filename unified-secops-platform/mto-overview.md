---
title: Microsoft Defender multitenant management
description: Learn about multitenant management for Microsoft Defender XDR and Microsoft Sentinel in the Microsoft Defender portal.
ms.service: unified-secops-platform
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
ms.topic: overview
ms.date: 07/16/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender for Office 365 P2
---

# Microsoft Defender multitenant management

Multitenant management for Microsoft Defender XDR and Microsoft Sentinel in the Defender portal provides your security operations teams with a single, unified view of all the tenants you manage. This view enables your teams to quickly investigate incidents and perform advanced hunting across data from multiple tenants, improving your security operations.

## Microsoft Sentinel support

For each tenant, the Defender portal allows you to connect to one primary workspace and multiple secondary workspaces for Microsoft Sentinel. In the context of this article, a workspace is a Log Analytics workspace with Microsoft Sentinel enabled.

If you have tenants with Microsoft Sentinel workspaces onboarded to the Defender portal, you're able to:

- Triage incidents and alerts across Security Information and Event Management (SIEM) and eXtended Detection and Response (XDR) data.
- Proactively search for SIEM and XDR data across multiple tenants.
- Manage cases across multiple tenants.

Each workspace must be onboarded to the Defender portal for each of your tenants separately, as you would in a single-tenant scenario.

For more information, see:

- [Connect Microsoft Sentinel to Microsoft Defender XDR](microsoft-sentinel-onboard.md)
- [Multitenant organizations documentation](/azure/active-directory/multi-tenant-organizations/)
- [Multiple Microsoft Sentinel workspaces in the Defender portal](/azure/sentinel/workspaces-defender-portal)

## Feature availability

Multitenant management is also available to US government customers. Refer to the table below for specific scenarios for GCC, GCC High, DoD, and Commercial customers.

| Scenario | Availability |
| ------ | ------ |
| Multitenant management | Available to all GCC, GCC High, DoD, and Commercial customers. |
| Cross-cloud collaboration | - Both DoD and GCC High customers can manage tenants in each other's clouds. </br></br> - GCC customers can manage tenants in the Commercial cloud. |

## Benefits of multitenant management

Some of the key benefits you get with multitenant management for Defender XDR and the Microsoft Sentinel in the Defender portal include:

- **A centralized place to manage incidents and cases across tenants**: A unified view provides SOC analysts with all the information they need to investigate incidents and cases across multiple tenants, eliminating the need to sign in and out of each one.

- **Streamlined threat hunting**: Multi-tenancy support enables SOC teams use Microsoft Defender XDR advanced hunting capabilities to create Kusto Query Language (KQL) queries that proactively hunt for threats across multiple tenants.

- **Multi-customer management for partners**: Managed Security Service Provider (MSSP) partners can now gain visibility into cases, security incidents, alerts, and threat hunting across multiple customers through a single pane of glass.

<a name='whats-included-in-multi-tenant-management-in-microsoft-365-defender'></a>

## What's included in multitenant management

The following key capabilities are available for each tenant you have access to in multitenant management for Microsoft Defender XDR and Microsoft Sentinel in the Defender portal:

| Capability | Description |
| ---------- | ----------- |
| **Incidents & alerts** > **[Incidents](mto-incidents-alerts.md)** | Manage incidents originating from multiple tenants. |
| **Incidents & alerts** > **[Alerts](mto-incidents-alerts.md)** | Manage alerts originating from multiple tenants. |
| **[Cases](cases-overview.md)** | Manage cases originating from multiple tenants. |
| **Hunting** > **[Advanced hunting](mto-advanced-hunting.md)** | Proactively hunt for intrusion attempts and breach activity across multiple tenants at the same time. |
| **Hunting** > **[Custom detection rules](/defender-xdr/custom-detections-overview)** | View and manage custom detection rules across multiple tenants. |
| **Assets** > **Devices** > **[Tenants](mto-tenant-devices.md)** | For all tenants and at a tenant-specific level, explore the device counts across different values such as device type, device value, onboarding status, and risk status. |
| **Endpoints** >**Vulnerability Management** > **[Dashboard](mto-dashboard.md)** | The Microsoft Defender Vulnerability Management dashboard provides both security administrators and security operations teams with aggregated vulnerability management information across multiple tenants. |
| **Endpoints** > **Vulnerability management** > **[Tenants](mto-dashboard.md)** | For all tenants and at a tenant-specific level, explore vulnerability management information across different values such as exposed devices, security recommendations, weaknesses, and critical CVEs. |
| **Configuration** > **Settings** | Lists the tenants you have access to. Use this page to view and manage your tenants. |

## Next steps

- [Set up Microsoft Defender multitenant management](mto-requirements.md)
