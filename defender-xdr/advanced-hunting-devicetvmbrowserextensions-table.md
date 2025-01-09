---
title: DeviceTvmBrowserExtensions table in the advanced hunting schema
description: Learn about browser extension installations found on devices as shown in Microsoft Defender Vulnerability Management.
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

# DeviceTvmBrowserExtensions (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- Microsoft Defender XDR
- Microsoft Defender for Endpoint

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

Each row in the `DeviceTvmBrowserExtensions` table contains information about browser extension installations found on devices from [Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt).

For information on other tables in the advanced hunting schema, see [the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `DeviceId` | `string` | Unique identifier for the device in the service |
| `BrowserName` | `string` | Name of the web browser with the extension |
| `ExtensionId` | `string` | Unique identifier for the browser extension |
| `ExtensionName` | `string` | Name of the extension |
| `ExtensionDescription` | `string` | Description from the publisher about the extension |
| `ExtensionVersion` | `string` | Version number of the extension |
| `ExtensionRisk` | `string` | Risk level for the extension based on the permissions it has requested |
| `ExtensionVendor` | `string` | Name of the vendor offering the extension |
| `IsActivated` | `string` | Whether the extension is turned on or off on the devices |
| `InstallationTime` | `datetime` | Date and time when the browser extension was first installed |


## Related topics

- [Proactively hunt for threats](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
- [Overview of Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
