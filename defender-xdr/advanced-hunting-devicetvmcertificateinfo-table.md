---
title: DeviceTvmCertificateInfo table in the advanced hunting schema
description: Learn about certificate information for devices in the organization from the DeviceTvmCertificateInfo table in the advanced hunting schema.
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

# DeviceTvmCertificateInfo (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**
- Microsoft Defender XDR
- Microsoft Defender for Endpoint

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `DeviceTvmCertificateInfo` table in the advanced hunting schema contains data from [Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt) related to certificate information for devices in the organization. Use this reference to construct queries that return information from the table.

For information on other tables in the advanced hunting schema, see [the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `DeviceId` | `string` | Unique identifier for the device in the service |
| `Thumbprint` | `string` | Unique identifier for the certificate |
| `Path` | `string` | The location of the certificate |
| `SerialNumber` | `string` | Unique identifier for the certificate within a certificate authority's systems |
| `IssuedTo` | `dynamic` | Entity that a certificate belongs to; can be a device, an individual, or an organization |
| `IssuedBy` | `dynamic` | Entity that verified the information and signed the certificate |
| `FriendlyName` | `string` | Easy-to-understand version of a certificate's title |
| `SignatureAlgorithm` | `string` | Hashing algorithm and encryption algorithm used |
| `KeySize` | `string` | Size of the key used in the signature algorithm |
| `ExpirationDate` | `string` | The date and time beyond which the certificate is no longer valid |
| `IssueDate` | `string` | The earliest date and time when the certificate became valid |
| `SubjectType` | `string` | Indicates if the holder of the certificate is a CA or end entity |
| `KeyUsage` | `string` | The valid cryptographic uses of the certificate's public key |
| `ExtendedKeyUsage` | `string` | Other valid uses for the certificate |


## Related topics

- [Overview of Microsoft Defender Vulnerability Management](/windows/security/threat-protection/microsoft-defender-atp/next-gen-threat-and-vuln-mgt)
- [Proactively hunt for threats](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
