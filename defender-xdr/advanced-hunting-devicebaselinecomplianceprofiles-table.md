---
title: DeviceBaselineComplianceProfiles table in the advanced hunting schema
description: Learn about the baseline profiles used for monitoring device baseline compliance in the DeviceBaselineComplianceProfiles table in the advanced hunting schema.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: maccruz
author: samanthagy
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

# DeviceBaselineComplianceProfiles (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `DeviceBaselineComplianceProfiles` table in the advanced hunting schema contains baseline profiles used for monitoring device baseline compliance. Use this reference to construct queries that return information from the table.

This advanced hunting table is populated by records from Microsoft Defender for Endpoint. If your organization hasn’t deployed the service in Microsoft Defender XDR, queries that use the table aren’t going to work or return any results. For more information about how to deploy Defender for Endpoint in Defender XDR, read [Deploy supported services](deploy-supported-services.md).


For information on other tables in the advanced hunting schema, see [the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `ProfileId` | `string` | Unique identifier for the profile |
| `ProfileName` | `string` | Display name of the profile |
| `ProfileDescription` | `string` | Optional description providing additional information related to the profile |
| `OSPlatform` | `dynamic` | Platform of the operating system running on the device. This indicates specific operating systems, including variations within the same family, such as Windows 11, Windows 10 and Windows 7.  |
| `OSVersion` | `string` | Version of the operating system running on the device |
| `BaseBenchmark` | `string` | Industry benchmark on top of which the profile was created |
| `BenchmarkVersion` | `string` | Version of the industry benchmark on top of which the profile was created  |
| `BenchmarkProfileLevel` | `string` | Benchmark compliance level set for the profile |
| `Status` | `boolean` | Indicator of the profile status - can be Enabled or Disabled |
| `CreatedBy` | `string` | Identity of the user account who created the profile |
| `CreatedOn` | `datetime` | Date and time when the profile was created |
| `LastUpdatedBy` | `string` | Identity of the user account who last updated the profile |
| `LastUpdatedOn` | `datetime` | Date and time when the profile was last updated |


## Related topics

- [Proactively hunt for threats](advanced-hunting-overview.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
- [Overview Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
