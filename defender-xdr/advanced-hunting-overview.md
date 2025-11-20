---
title: Overview - Advanced hunting
description: Learn about advanced hunting queries in Microsoft Defender and how to use them to proactively find threats and weaknesses in your network.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection: 
  - m365-security
  - m365initiative-m365-defender
  - tier1
ms.custom:
- cx-ti
- cx-ah
- seo-marvel-apr2020
ms.topic: overview
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
search.appverid: met150
ms.date: 11/19/2025

---

# Proactively hunt for threats with advanced hunting in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


Advanced hunting is a query-based threat hunting tool that lets you explore up to 30 days of raw data. You can proactively inspect events in your network to locate threat indicators and entities. The flexible access to data enables unconstrained hunting for both known and potential threats.

Advanced hunting supports two modes, guided and advanced. Use [guided mode](advanced-hunting-query-builder.md) if you aren't yet familiar with Kusto Query Language (KQL) or prefer the convenience of a query builder. Use [advanced mode](advanced-hunting-query-language.md) if you're comfortable using KQL to create queries from scratch. 

**To start hunting, read [Choose between guided and advanced modes to hunt in the Microsoft Defender portal](advanced-hunting-modes.md).**

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=a3a3cfd9-6699-4e0d-b372-b0ecf4493eb5]

You can use the same threat hunting queries to build custom detection rules. These rules run automatically to check for and then respond to suspected breach activity, misconfigured machines, and other findings.

Advanced hunting supports queries that check a broader data set coming from:

- Microsoft Defender for Endpoint
- Microsoft Defender for Office 365
- Microsoft Defender for Cloud Apps
- Microsoft Defender for Identity
- Microsoft Sentinel

To use advanced hunting, [turn on Microsoft Defender XDR](m365d-enable.md). Or to use advanced hunting with Microsoft Sentinel, [connect Microsoft Sentinel to the Defender portal](/unified-secops-platform/microsoft-sentinel-onboard). 

For more information on advanced hunting in Microsoft Defender for Cloud Apps data, see the [video](https://learn-video.azurefd.net/vod/player?id=ffdedc73-6edf-45a9-8c90-566296e8d4ec). 

## Get access

You need to be assigned permissions before you can run Advanced Hunting queries. You have the following options:

- [Microsoft Defender XDR Unified role based access control (URBAC)](manage-rbac.md):
  - **Read-only Advanced Hunting access (Email & Collaboration tables)**: Membership assigned with the **Security operations** \> **Security data** \> **Security data basic (read)** URBAC permission. This permission provides access to:
    - **EmailEvents**
    - **EmailUrlInfo**
    - **EmailAttachmentInfo**
    - **UrlClickEvents**
    - **Email entity metadata**

- [Email & collaboration permissions in the Microsoft Defender portal](/defender-office-365/mdo-portal-permissions): Membership in one of the following Email & Collaboration role groups provides access to email data tables in Advanced Hunting:
  - **Security Administrator**
  - **Security Operator**
  - **Security Reader**

- [Exchange Online permissions](/exchange/permissions-exo/permissions-exo): To access Exchange Online data surfaced in Advanced Hunting, users must be members of one of the following Exchange Online role groups:
  - **View-Only Organization Management**
  - **View-Only Configuration**
  - **Security Reader**
  - **Global Reader**

- [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in one of the following Microsoft Entra roles grants full read access to all Advanced Hunting data:
  - **Global Administrator**
  - **Security Administrator**
  - **Security Reader**
  - **Global Reader**

  Also, your access to endpoint data is determined by role-based access control (RBAC) settings in Microsoft Defender for Endpoint. For more information, see [Manage access to Microsoft Defender XDR with Microsoft Entra global roles](m365d-permissions.md).

## Data freshness and update frequency

Advanced hunting data can be categorized into two distinct types, each consolidated differently.

### **Event or activity data**

Event or activity data populates tables about alerts, security events, system events, and routine assessments. Advanced hunting receives this data almost immediately after the sensors that collect them successfully transmit them to the corresponding cloud services. For example, you can query event data from healthy sensors on workstations or domain controllers almost immediately after they're available on Microsoft Defender for Endpoint and Microsoft Defender for Identity. 

To collect even more event properties, you have the option of turning on [aggregated reporting](/defender-endpoint/aggregated-reporting).

### **Entity data**

Entity data populates tables with information about users and devices. This data comes from both relatively static data sources and dynamic sources, such as Active Directory entries and event logs. To provide fresh data, tables are updated every hour to insert a record that contains the latest, most comprehensive data set about each entity, including other useful information such as health status and tags.


## Time zone

### Queries

Advanced hunting data uses the UTC (Universal Time Coordinated) timezone. 
![Screenshot of custom time range.](/defender/media/custom-time-range.png)

Queries should be created in UTC.

### Results

Advanced hunting results are converted to the [timezone](m365d-time-zone.md) set in Microsoft Defender XDR.

## To extend the 30 days retention for Advanced Hunting, you can use Streaming APIs

In order to extend the 30 days retention for Advanced Hunting, see the following resources:

- Microsoft Defender XDR [Streaming API](/defender-xdr/streaming-api)
- Microsoft Defender for Endpoint [Raw Data Streaming API](/defender-endpoint/api/raw-data-export)

> [!NOTE]
> The data retained is from the first day that you implement and enable the streaming API.

## Related content

- [Choose between guided and advanced hunting modes](advanced-hunting-modes.md)
- [Build hunting queries using guided mode](advanced-hunting-query-builder.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Microsoft Graph security API](/graph/api/resources/security-api-overview#advanced-hunting)
- [Custom detections overview](custom-detections-overview.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
