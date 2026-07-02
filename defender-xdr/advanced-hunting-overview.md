---
title: Advanced hunting overview in Microsoft Defender XDR
description: Learn about advanced hunting queries in Microsoft Defender and how to use them to proactively find threats and weaknesses in your network.
ms.service: defender-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - m365initiative-m365-defender
  - tier1
ms.custom:
- cx-ti
- cx-ah
- seo-marvel-apr2020
- msecd-doc-authoring-1012
ms.topic: overview
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.date: 05/12/2026

---

# Proactively hunt for threats with advanced hunting in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Advanced hunting is a query-based threat hunting tool that you use to explore up to 30 days of raw data. You can proactively inspect events in your network to locate threat indicators and entities. The flexible access to data enables unconstrained hunting for both known and potential threats.

Advanced hunting supports two modes: guided and advanced. Use [guided mode](advanced-hunting-query-builder.md) if you're not yet familiar with Kusto Query Language (KQL) or if you prefer the convenience of a query builder. Use [advanced mode](advanced-hunting-query-language.md) if you're comfortable using KQL to create queries from scratch.

**To start hunting, see [Choose between guided and advanced modes to hunt in the Microsoft Defender portal](advanced-hunting-modes.md).**

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=a3a3cfd9-6699-4e0d-b372-b0ecf4493eb5]

You can use the same threat hunting queries to build custom detection rules. These rules run automatically to check for and then respond to suspected breach activity, misconfigured machines, and other findings.

Advanced hunting supports queries that check a broader data set coming from:

- Microsoft Defender for Endpoint
- Microsoft Defender for Office 365
- Microsoft Defender for Cloud Apps
- Microsoft Defender for Identity
- Microsoft Sentinel

To use advanced hunting, [turn on Microsoft Defender XDR](m365d-enable.md). To use advanced hunting with Microsoft Sentinel, [connect Microsoft Sentinel to the Defender portal](/unified-secops-platform/microsoft-sentinel-onboard).

For more information on advanced hunting in Microsoft Defender for Cloud Apps data, see [Advanced hunting in Defender for Cloud Apps (video)](https://learn-video.azurefd.net/vod/player?id=ffdedc73-6edf-45a9-8c90-566296e8d4ec).

## Get access

You need to be assigned permissions before you can run advanced hunting queries. You have the following options:

- [Microsoft Defender XDR Unified role based access control (URBAC)](manage-rbac.md):
  - **Advanced Hunting access (Email & Collaboration tables)**: Membership assigned with the **Security operations** \> **Raw data** \> **Email & collaboration metadata (read)** URBAC permission. This permission provides access to:
    - **EmailEvents**
    - **EmailUrlInfo**
    - **EmailAttachmentInfo**
    - **EmailPostDeliveryEvents**
    - **CampaignInfo**
    - **FileMaliciousContentInfo**
    - **MessageEvents**
    - **MessagePostDeliveryEvents**
    - **MessageUrlInfo**
    - **UrlClickEvents**
    - **Email entity metadata**
  - **Advanced Hunting access (Alerts & behaviors tables)**: Membership assigned with the **Security operations** \> **Security data** \> **Security data basics (read)** URBAC permission. This permission provides access to the *Alerts & behaviors* schema, but not the *Email & collaboration* schema.

- [Email & collaboration permissions in the Microsoft Defender portal](/defender-office-365/mdo-portal-permissions): Membership in one of the following Email & Collaboration role groups provides access to email data tables in advanced hunting:
  - **Security Administrator**
  - **Security Operator**
  - **Security Reader**

- [Exchange Online permissions](/exchange/permissions-exo/permissions-exo): To access Exchange Online data surfaced in advanced hunting, users must be members of one of the following Exchange Online role groups:
  - **View-Only Organization Management**
  - **View-Only Configuration**
  - **Security Reader**
  - **Global Reader**

- [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in one of the following Microsoft Entra roles grants full read access to all advanced hunting data:
  - **Global Administrator**
  - **Security Administrator**
  - **Security Reader**
  - **Global Reader**

  Your access to endpoint data is determined by role-based access control (RBAC) settings in Microsoft Defender for Endpoint. For more information, see [Manage access to Microsoft Defender XDR with Microsoft Entra global roles](m365d-permissions.md).

## Data freshness and update frequency

Advanced hunting data falls into two distinct types, each with a different consolidation process.

### Event or activity data

Event or activity data populates tables about alerts, security events, system events, and routine assessments. Advanced hunting receives this data almost immediately after the sensors that collect them successfully transmit it to the corresponding cloud services. For example, you can query event data from healthy sensors on workstations or domain controllers almost immediately after they're available on Microsoft Defender for Endpoint and Microsoft Defender for Identity.

To collect even more event properties, you can turn on [aggregated reporting](/defender-endpoint/aggregated-reporting).

### Entity data

Entity data populates tables with information about users and devices. Entity data comes from relatively static sources like Active Directory entries and dynamic sources like event logs. To provide fresh data, tables are updated every hour with a record that contains the latest, most comprehensive data set about each entity, including health status and tags.

## Quotas and usage parameters

To keep the service performant and responsive, advanced hunting sets various quotas and usage parameters (also known as "service limits"). These quotas and parameters apply separately to queries run manually and to queries run using [custom detection rules](custom-detection-rules.md). Be mindful of these limits if you regularly run multiple queries. [Apply optimization best practices](advanced-hunting-best-practices.md) to minimize disruptions.

The following table describes the available quotas and usage parameters.

| Quota or parameter | Size | Refresh cycle | Description |
| --- | --- | --- | --- |
| Date range | 30 days for Defender XDR data unless streamed through Microsoft Sentinel | Every query | Each query can look up Defender XDR data from up to the past 30 days, or longer if streamed through Microsoft Sentinel |
| Result set | 100,000 rows | Every query | Each query can return up to 100,000 records. |
| Timeout | 10 minutes | Every query | Each query can run for up to 10 minutes. If it doesn't complete within 10 minutes, the service displays an error. |
| CPU resources | Based on tenant size | Every 15 minutes | The portal displays a warning whenever a query runs and the tenant consumes over 10% of allocated resources. [Queries are blocked](advanced-hunting-errors.md) if the tenant reaches 100% until after the next 15-minute cycle. |
| Results size limit | 64 MB | Every query | The limit for overall size of the results data, which doesn't just refer to the number of records. Factors such as the number of columns, data types, and field lengths also contribute to the result size.<br><br>If the query result exceeds the 64-MB size limit, the portal returns the maximum number of records it can within this limit and displays a message indicating that the displayed results are partial due to size constraints. |

In the unified Microsoft Defender portal, you can run queries over Microsoft Sentinel tables by onboarding a workspace. [Log analytics workspace limits](/azure/azure-monitor/service-limits#log-analytics-workspaces) therefore also apply.

For advanced hunting in multitenant organizations, see [Quotas in advanced hunting in multitenant management](/unified-secops-platform/mto-advanced-hunting#quotas).

> [!NOTE]
> A separate set of quotas and parameters apply to advanced hunting queries performed through the API. [Read about advanced hunting APIs](api-advanced-hunting.md).

## Time zone

### Queries

Advanced hunting uses UTC (Universal Time Coordinated) for all data.

![Screenshot of the custom time range option in advanced hunting query settings.](media/advanced-hunting-overview/custom-time-range.png)

Write queries in UTC.

### Results

Microsoft Defender XDR converts advanced hunting results to the [timezone](m365d-time-zone.md) you set.

## Extend data retention with Streaming APIs

To extend the 30-day retention for advanced hunting, see the following resources:

- Microsoft Defender XDR [Streaming API](/defender-xdr/streaming-api)
- Microsoft Defender for Endpoint [Raw Data Streaming API](/defender-endpoint/api/raw-data-export)

> [!NOTE]
> Data retention starts from the first day that you implement and enable the streaming API.

## Related content

- [Choose between guided and advanced hunting modes](advanced-hunting-modes.md)
- [Build hunting queries using guided mode](advanced-hunting-query-builder.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Microsoft Graph security API](/graph/api/resources/security-api-overview#advanced-hunting)
- [Custom detections overview](custom-detections-overview.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
