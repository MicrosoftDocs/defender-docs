---
title: DeviceBaselineComplianceAssessment table in the advanced hunting schema
description: Learn about the baseline compliance assessment snapshot, indicating the status of various security configurations related to baseline profiles on devices in Microsoft Defender XDR.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: v-sgoyagoy
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
ms.topic: reference
ms.date: 11/20/2024
---

# DeviceBaselineComplianceAssessment (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**
- Microsoft Defender XDR
- Microsoft Defender for Endpoint

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `DeviceBaselineComplianceAssessment` table in the advanced hunting schema contains baseline compliance assessment snapshot, which indicates the status of various security configurations related to baseline profiles on devices. 

For information on other tables in the advanced hunting schema, see [the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `DeviceId` | `string` | Unique identifier for the device in the service |
| `DeviceName` | `string` | Fully qualified domain name (FQDN) of the device |
| `OSPlatform` | `string` | Platform of the operating system running on the device. This indicates specific operating systems, including variations within the same family, such as Windows 11, Windows 10 and Windows 7. |
| `OSVersion` | `string` | Version of the operating system running on the device |
| `ConfigurationId` | `string` | Unique identifier for a specific configuration |
| `ProfileId` | `string` | Unique identifier for the profile |
| `IsCompliant` | `nullable bool` | Indicates whether the device that initiated the event is compliant or not |
| `IsApplicable` | `boolean` | Indicates whether the configuration or policy is applicable |
| `Source` | `dynamic` | The registry path or other location used to determine the current device setting |
| `RecommendedValue` | `dynamic` | Set of expected values for the current device setting to be compliant |
| `CurrentValue` | `dynamic` | Set of detected values found on the device |
| `IsExempt` | `boolean` | Indicates whether the device is exempt from having the baseline configuration |


## Related topics

- [Proactively hunt for threats](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
- [Overview of Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]