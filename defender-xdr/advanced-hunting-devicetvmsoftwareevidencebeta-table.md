---
title: DeviceTvmSoftwareEvidenceBeta table in the advanced hunting schema
description: Learn how to use the DeviceTvmSoftwareEvidenceBeta table in the advanced hunting schema.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
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
ms.date: 03/28/2025
---

# DeviceTvmSoftwareEvidenceBeta

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


> [!IMPORTANT]
> The `DeviceTvmSoftwareEvidenceBeta` table is currently in beta. Once it leaves beta, the final table name changes and column names might also change. The modifications are likely to break queries that are still using previous names. Users are advised to review and adjust their queries when this table is finalized. 

The `DeviceTvmSoftwareEvidenceBeta` table in the advanced hunting schema contains data from [Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt) related to the [software evidence section](/defender-vulnerability-management/tvm-software-inventory#software-evidence). This table allows you to view evidence of where a specific software was detected on a device. You can use this table, for example, to identify the file paths of specific software. Use this reference to construct queries that return information from the table.

Microsoft Defender for Endpoint data populates this advanced hunting table. If your organization didn't deploy the service in Microsoft Defender XDR, queries that use the table aren’t going to work or return any results. For more information about how to deploy Defender for Endpoint in Defender XDR, read [Deploy supported services](deploy-supported-services.md).


For information on other tables in the advanced hunting schema, see [the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `DeviceId` | `string` | Unique identifier for the device in the service |
| `SoftwareVendor` | `string` | Name of the software publisher |
| `SoftwareName` | `string` | Name of the software product |
| `SoftwareVersion` | `string` | Version number of the software product |
| `RegistryPaths` | `dynamic` | Registry paths where evidence indicating the existence of the software on a device was detected |
| `DiskPaths` | `dynamic` | Disk paths where file-level evidence indicating the existence of the software on a device was detected |
| `LastSeenTime` | `string` | Date and time when the device was last seen by this service |

## Read more

- [Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt)
- [Proactively hunt for threats](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)

