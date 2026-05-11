---
title: Naming changes in the Microsoft Defender XDR advanced hunting schema
description: Track and review naming changes tables and columns in the advanced hunting schema
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom:
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: reference
ms.date: 12/10/2025
---

# Advanced hunting schema - Naming changes

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


[!INCLUDE [Prerelease information](../includes/prerelease.md)]

The [advanced hunting schema](advanced-hunting-schema-tables.md) is updated regularly to add new tables and columns. In some cases, existing columns names are renamed or replaced to improve the user experience. Refer to this article to review naming changes that could impact your queries.

Naming changes are automatically applied to queries that are saved in Microsoft Defender XDR, including queries used by custom detection rules. You don't need to update these queries manually. However, you will need to update the following queries:
- Queries that are run using the API
- Queries that are saved elsewhere outside Microsoft Defender XDR

## November 2025
- The Boolean field values in advanced hunting results will change from numeric (`1` and `0`) to textual (`True` and `False`) on February 25, 2026. While your queries and custom detection rules won't be affected by this change, you might want to update your automated processes (for example, scripts, playbooks, or integrations) parsing these values.


- The [`AADSignInEventsBeta`](advanced-hunting-aadsignineventsbeta-table.md) and  [`AADSpnSignInEventsBeta`](advanced-hunting-aadspnsignineventsbeta-table.md) tables are being replaced by [`EntraIdSignInEvents`](advanced-hunting-entraidsigninevents-table.md) and [`EntraIdSpnSignInEvents`](advanced-hunting-entraidspnsigninevents-table.md), respectively. These changes are being made to remove the former tables' preview status and to align them with the existing product branding.

    The `EntraIdSignInEvents` and `EntraIdSpnSignInEvents` tables are now available. The legacy `AADSignInEventsBeta`and `AADSpnSignInEventsBeta` tables will remain in the schema for 30 days to allow time for updating your queries. Your custom detections will be updated automatically and won't require any changes. On December 9, 2025, `AADSignInEventsBeta`and `AADSpnSignInEventsBeta` will be removed from the schema.

## September 2025

In the [AADSignInEventsBeta](./advanced-hunting-aadspnsignineventsbeta-table.md) table, the `AadDeviceId` column is being replaced with a new column, called `EntraIdDeviceId`, to align with current product branding. The legacy `AadDeviceId` column will remain in the schema for 30 days to allow time for updating in your queries. After this period of 30 days, `AadDeviceId` will be removed from the schema.

## May 2025
In the [`IdentityInfo`](advanced-hunting-identityinfo-table.md) table, the `SourceProvider` column was replaced by the `IdentityEnvironment` column. This change was made to streamline the unified `IdentityInfo` table with a similar table in Microsoft Sentinel log analytics. Note that a new column, `SourceProviders` (with an *s*) was added in the unified table. This column refers to the source providers of the accounts for the identity.

## May 2021

The `AppFileEvents` table has been deprecated. The `CloudAppEvents` table includes information that used to be in the `AppFileEvents` table, along with other activities in cloud services.

## March 2021

The `DeviceTvmSoftwareInventoryVulnerabilities` table has been deprecated. Replacing it are the `DeviceTvmSoftwareInventory` and `DeviceTvmSoftwareVulnerabilities` tables.

## February 2021

- In the [EmailAttachmentInfo](advanced-hunting-emailattachmentinfo-table.md) and [EmailEvents](advanced-hunting-emailevents-table.md) tables, the `MalwareFilterVerdict` and `PhishFilterVerdict` columns have been replaced by the `ThreatTypes` column. The `MalwareDetectionMethod` and `PhishDetectionMethod` columns were also replaced by the `DetectionMethods` column. This streamlining allows us to provide more information under the new columns. The mapping is provided below.

    | Table name | Original column name | New column name | Reason for change
    |--|--|--|--|
    | `EmailAttachmentInfo` | `MalwareDetectionMethod` <br> `PhishDetectionMethod` | `DetectionMethods` | Include more detection methods |
    | `EmailAttachmentInfo`  | `MalwareFilterVerdict` <br>`PhishFilterVerdict` | `ThreatTypes` | Include more threat types |
    | `EmailEvents` | `MalwareDetectionMethod` <br> `PhishDetectionMethod` | `DetectionMethods` | Include more detection methods |
    | `EmailEvents` | `MalwareFilterVerdict` <br>`PhishFilterVerdict` | `ThreatTypes` | Include more threat types |


- In the `EmailAttachmentInfo` and `EmailEvents` tables, the `ThreatNames` column was added to give more information about the email threat. This column contains values like Spam or Phish.

- In the [DeviceInfo](advanced-hunting-deviceinfo-table.md) table, the `DeviceObjectId` column was replaced by the `AadDeviceId` column based on customer feedback.

- In the [DeviceEvents](advanced-hunting-deviceevents-table.md) table, several ActionType names were modified to better reflect the description of the action. Details of the changes can be found below.

    | Table name | Original ActionType name | New ActionType name | Reason for change
    |--|--|--|--|
    | `DeviceEvents` | `UsbDriveMount` | `UsbDriveMounted` | Customer feedback |
    | `DeviceEvents` | `UsbDriveUnmount` | `UsbDriveUnmounted` | Customer feedback |
    | `DeviceEvents` | `WriteProcessMemoryApiCall` | `WriteToLsassProcessMemory` | Customer feedback |

## January 2021

| Column name | Original value name | New value name | Reason for change
|--|--|--|--|
| `DetectionSource` | Defender for Cloud Apps | Microsoft Defender for Cloud Apps | Rebranding |
| `DetectionSource` | WindowsDefenderAtp| EDR| Rebranding |
| `DetectionSource` | WindowsDefenderAv | Antivirus | Rebranding |
| `DetectionSource` | WindowsDefenderSmartScreen |  SmartScreen | Rebranding |
| `DetectionSource` | CustomerTI | Custom TI | Rebranding |
| `DetectionSource` | OfficeATP | Microsoft Defender for Office 365 | Rebranding |
| `DetectionSource` | MTP | Microsoft Defender XDR | Rebranding |
| `DetectionSource` | AzureATP | Microsoft Defender for Identity | Rebranding |
| `DetectionSource` | CustomDetection | Custom detection | Rebranding |
| `DetectionSource` | AutomatedInvestigation |Automated investigation | Rebranding |
| `DetectionSource` | ThreatExperts | Microsoft Threat Experts | Rebranding |
| `DetectionSource` | 3rd party TI | 3rd Party sensors | Rebranding |
| `ServiceSource` | Microsoft Defender ATP| Microsoft Defender for Endpoint | Rebranding |
|`ServiceSource` |Microsoft Threat Protection | Microsoft Defender XDR | Rebranding |
| `ServiceSource` | Office 365 ATP |Microsoft Defender for Office 365 | Rebranding |
| `ServiceSource` |Azure ATP |Microsoft Defender for Identity | Rebranding |

`DetectionSource` is available in the [AlertInfo](advanced-hunting-alertinfo-table.md) table. `ServiceSource` is available in the [AlertEvidence](advanced-hunting-alertevidence-table.md) and [AlertInfo](advanced-hunting-alertinfo-table.md) tables. 


## December 2020

| Table name | Original column name | New column name | Reason for change
|--|--|--|--|
| [EmailEvents](advanced-hunting-emailevents-table.md) | `FinalEmailAction` | `EmailAction` | Customer feedback |
| [EmailEvents](advanced-hunting-emailevents-table.md) | `FinalEmailActionPolicy` | `EmailActionPolicy` | Customer feedback |
| [EmailEvents](advanced-hunting-emailevents-table.md) | `FinalEmailActionPolicyGuid` | `EmailActionPolicyGuid` | Customer feedback |


## Related topics
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
