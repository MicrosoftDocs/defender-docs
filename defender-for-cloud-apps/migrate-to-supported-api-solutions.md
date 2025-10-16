---
title: Migrate to Supported API Solutions
description: This article describes how to transition from the legacy Defender for Cloud Apps SIEM agent to supported APIs.
ms.date: 05/19/2025
ms.topic: article
---

# Migrate from Defender for Cloud Apps SIEM agent to supported APIs

Transitioning from the legacy [Defender for Cloud Apps SIEM agent ](siem.md) to supported APIs enables continued access to enriched activities and alerts data. While the APIs might not have exact one-to-one mappings to the legacy Common Event Format (CEF) schema, they provide comprehensive, enhanced data through integration across multiple Microsoft Defender workloads.

## Recommended APIs for migration

> To ensure continuity and access to data currently available through Microsoft Defender for Cloud Apps SIEM agents, we recommend transitioning to the following supported APIs:
>
> - For alerts and activities, see: [Microsoft Defender XDR Streaming API](/defender-xdr/streaming-api).
> - For Microsoft Entra ID Protection logon events, see [IdentityLogonEvents](/defender-xdr/advanced-hunting-identitylogonevents-table) table in the advanced hunting schema. 
> - For Microsoft Graph Security Alerts API, see: [List alerts_v2](/graph/api/security-list-alerts_v2?view=graph-rest-1.0&tabs=http&preserve-view=true)
> - To view Microsoft Defender for Cloud Apps alerts data in the Microsoft Defender XDR incidents API, see [Microsoft Defender XDR incidents APIs and the incidents resource type](/graph/api/security-list-alerts_v2?view=graph-rest-1.0&tabs=http&preserve-view=true)

## Field Mapping from Legacy SIEM to Supported APIs

The table below compares the legacy SIEM agent’s CEF fields to the nearest equivalent fields in the Defender XDR Streaming API (advanced hunting event schema) and the Microsoft Graph Security Alerts API.


| CEF Field (MDA SIEM)                  | Description                                                 | Defender XDR Streaming API (CloudAppEvents/AlertEvidence/AlertInfo)                             | Graph Security Alerts API (v2)                                 |
|---------------------------------------|-------------------------------------------------------------|--------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| `start`                               | Activity or alert timestamp                                 | `Timestamp`                                                                                      | `firstActivityDateTime`                                        |
| `end`                                 | Activity or alert timestamp                                 | None                                                                                             | `lastActivityDateTime`                                         |
| `rt`                                  | Activity or alert timestamp                                 | `createdDateTime`                                                                                | `createdDateTime` / `lastUpdateDateTime` / `resolvedDateTime`  |
| `msg`                                 | Alert or activity description as shown in the portal in a human readable format             | The closest structured fields that contribute to a similar description: `actorDisplayName`, `ObjectName`, `ActionType`, `ActivityType`        | `description`                                                  |
| `suser`                               | Activity or alert subject user                              | `AccountObjectId`, `AccountId`, `AccountDisplayName`                                             | See `userEvidence` resource type                               |
| `destinationServiceName`              | Activity or alert from the originating app (for example, SharePoint, Box)                     | `CloudAppEvents > Application`                                                                   | See `cloudApplicationEvidence` resource type                   |
| `cs<X>Label`, `cs<X>`                 | Alert or activity dynamic fields (for example, target user, object)                  | `Entities`, `Evidence`, `additionalData`, `ActivityObjects`                                      | Various `alertEvidence` resource types                         |
| `EVENT_CATEGORY_*`                    | High-level activity category                                | `ActivityType` / `ActionType`                                                                    | `category`                                                     |
| `<name>`                              | Matched policy name                                         | `Title`, `alertPolicyId`                                                                         | `Title`, `alertPolicyId`                                       |
| `<ACTION>` (Activities)               | Specific activity type                                      | `ActionType`                                                                                     | N/A                                                            |
| `externalId` (Activities)             | Event ID                                                    | `ReportId`                                                                                       | N/A                                                            |
| `requestClientApplication` (activities)| User agent of the client device in activities                               | `UserAgent`                                                                                      | N/A                                                            |
| `Dvc` (activities)                    | Client device IP                                            | `IPAddress`                                                                                      | N/A                                                            |
| `externalId` (Alert)                  | Alert ID                                                    | `AlertId`                                                                                        | `id`                                                           |
| `<alert type>`                        | Alert type (for example, ALERT_CABINET_EVENT_MATCH_AUDI)           | -                                                                                                | -                                                              |
| `Src` / `c6a1` (alerts)               | Source IP                                                   | `IPAddress`                                                                                      | `ipEvidence` resource type                                     |


## Related content

- [Generic SIEM integration](siem.md)
- [Microsoft Sentinel integration (Preview)](siem-sentinel.md)