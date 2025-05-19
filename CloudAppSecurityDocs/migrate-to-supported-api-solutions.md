---
title: Migrate to Supported API Solutions
description: Learn how to transition to APIs that support the management of activities and alerts data from multiple workloads in Microsoft Defender for Cloud Apps.
ms.date: 05/19/2025
ms.topic: article
ms.service: defender-for-cloud-apps
ms.custom: migration, API, security, monitoring
----

# Migrate from Defender for Cloud Apps SIEM Agent to Supported APIs


## Mapping Legacy SIEM Fields to New API Schemas
The legacy Defender for Cloud Apps SIEM agent output logs in Common Event Format (CEF) with specific fields for alerts and activities. The new APIs do not have an exact one-to-one field mapping for every CEF attribute; however, they provide equivalent or enhanced data through their schemas. While exact schema equivalence isn't available due to structural differences, the recommended APIs provide equivalent data enriched by context from multiple Microsoft Defender workloads. Transitioning to these APIs will enhance security operations by offering comprehensive and integrated insights. 

> To ensure continuity and access to data currently available through Microsoft Defender for Cloud Apps SIEM agents, we recommend transitioning to the following supported APIs:
>
> - For alerts and activities, see: [Microsoft Defender XDR Streaming API](/defender-xdr/streaming-api).
> - For Microsoft Entra ID Protection logon events, see [IdentityLogonEvents](/defender-xdr/advanced-hunting-identitylogonevents-table) table in the advanced hunting schema. 
> - For Microsoft Graph Security Alerts API, see: [List alerts_v2](/graph/api/security-list-alerts_v2?view=graph-rest-1.0&tabs=http&preserve-view=true)
> - To view Microsoft Defender for Cloud Apps alerts data in the Microsoft Defender XDR incidents API, see [Microsoft Defender XDR incidents APIs and the incidents resource type](/graph/api/security-list-alerts_v2?view=graph-rest-1.0&tabs=http&preserve-view=true)

The table below compares the legacy SIEM agent’s CEF fields to the nearest equivalent fields in the Defender XDR Streaming API (advanced hunting event schema) and the Microsoft Graph Security Alerts API. This will help you identify where to find the same information when migrating:


| CEF Field (MDA SIEM)                  | Description                                                 | Defender XDR Streaming API (CloudAppEvents/AlertEvidence/AlertInfo)                             | Graph Security Alerts API (v2)                                 |
|---------------------------------------|-------------------------------------------------------------|--------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| `start`                               | Activity or alert timestamp                                 | `Timestamp`                                                                                      | `firstActivityDateTime`                                        |
| `end`                                 | Activity or alert timestamp                                 | None                                                                                             | `lastActivityDateTime`                                         |
| `rt`                                  | Activity or alert timestamp                                 | `createdDateTime`                                                                                | `createdDateTime` / `lastUpdateDateTime` / `resolvedDateTime`  |
| `msg`                                 | Alert or activity description (human-readable)              | Closest structured fields: `actorDisplayName`, `ObjectName`, `ActionType`, `ActivityType`        | `description`                                                  |
| `suser`                               | Activity or alert subject user                              | `AccountObjectId`, `AccountId`, `AccountDisplayName`                                             | See `userEvidence` resource type                               |
| `destinationServiceName`              | Originating app (e.g., SharePoint, Box)                     | `CloudAppEvents > Application`                                                                   | See `cloudApplicationEvidence` resource type                   |
| `cs<X>Label`, `cs<X>`                 | Dynamic fields (e.g., target user, object)                  | `Entities`, `Evidence`, `additionalData`, `ActivityObjects`                                      | Various `alertEvidence` resource types                         |
| `EVENT_CATEGORY_*`                    | High-level activity category                                | `ActivityType` / `ActionType`                                                                    | `category`                                                     |
| `<name>`                              | Matched policy name                                         | `Title`, `alertPolicyId`                                                                         | `Title`, `alertPolicyId`                                       |
| `<ACTION>` (Activities)               | Specific activity type                                      | `ActionType`                                                                                     | N/A                                                            |
| `externalId` (Activities)             | Event ID                                                    | `ReportId`                                                                                       | N/A                                                            |
| `requestClientApplication` (activities)| User agent of client device                                | `UserAgent`                                                                                      | N/A                                                            |
| `Dvc` (activities)                    | Client device IP                                            | `IPAddress`                                                                                      | N/A                                                            |
| `externalId` (Alert)                  | Alert ID                                                    | `AlertId`                                                                                        | `id`                                                           |
| `<alert type>`                        | Alert type (e.g., ALERT_CABINET_EVENT_MATCH_AUDI)           | -                                                                                                | -                                                              |
| `Src` / `c6a1` (alerts)               | Source IP                                                   | `IPAddress`                                                                                      | `ipEvidence` resource type                                     |


## Related content

- [Generic SIEM integration](siem.md)
- [Microsoft Sentinel integration (Preview)](siem-sentinel.md)