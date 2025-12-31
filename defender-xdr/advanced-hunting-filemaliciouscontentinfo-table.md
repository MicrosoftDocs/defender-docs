---
title: FileMaliciousContentInfo table in the advanced hunting schema
description: Learn about the FileMaliciousContentInfo table of the advanced hunting schema
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
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
ms.date: 12/04/2025
---

# FileMaliciousContentInfo (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information relates to prereleased product which might be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `FileMaliciousContentInfo` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about files that were processed by Microsoft Defender for Office 365 in SharePoint Online, OneDrive, and Microsoft Teams. Use this reference to construct queries that return information from this table.

> [!TIP]
> For detailed information about the events types (`ActionType` values) supported by a table, use the built-in schema reference available in Microsoft Defender XDR.

This advanced hunting table is populated by records from Defender for Office 365. If your organization didn't deploy the service in Microsoft Defender XDR, queries that use the table aren’t going to work or return any results. For more information about how to deploy Defender for Office 365 in Defender XDR, read [Deploy supported services](deploy-supported-services.md).

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).



| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the event was generated |
| `Workload`| `string` | Information about the workload from which the URL originated from |
| `FileName`| `string` | Name of the file that the recorded action was applied to |
| `FolderPath`| `string` | Path of the folder containing the file that the recorded action was applied to |
| `FileSize`| `long` | Size of the file in bytes |
| `SHA256`| `string` | SHA-256 of the file that the recorded action was applied to |
| `FileOwnerDisplayName`| `string` | Account recorded as owner of the file |
| `FileOwnerUpn`| `string` | Account recorded as owner of the file|
| `DocumentId`| `string` | Unique identifier of the file |
| `ThreatTypes`| `dynamic` | Verdict from the email filtering stack on whether the email contains malware, phishing, or other threats |
| `ThreatNames`| `string` | Detection name for malware or other threats found|
| `DetectionMethods`| `string` | Methods used to detect malware, phishing, or other threats found in the email |
| `LastModifyingAccountUpn`| `string` | Account that last modified this file |
| `LastModifiedTime`| `datetime` |Date and time the item or related metadata was last modified|
| `FileCreationTime	`| `datetime` | Timestamp of the file creation|
| `ReportId`| `string` | Unique identifier for the event |



## Read more

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
