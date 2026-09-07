---
title: AlertInfo table in the advanced hunting schema
description: Learn about alert generation events in the AlertInfo table of the advanced hunting schema
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
- msecd-doc-authoring-1015
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: reference
ms.date: 08/07/2026
---

# AlertInfo

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]




## Get access
To use advanced hunting or other [Microsoft Defender](microsoft-365-defender.md) capabilities, you need an appropriate role in Microsoft Entra ID. [Read about required roles and permissions for advanced hunting](custom-roles.md).

The `AlertInfo` table contains records from Microsoft Defender services. When Microsoft Sentinel is onboarded to the Defender portal, the table also contains Microsoft Sentinel alerts associated with incidents. Data availability depends on the services deployed and the Sentinel workspaces you can access. For more information, see [Deploy supported services](deploy-supported-services.md) and [Transition your Microsoft Sentinel environment to the Defender portal](/azure/sentinel/move-to-defender).

Also, your access to endpoint data is determined by role-based access control (RBAC) settings in Microsoft Defender for Endpoint. [Read about managing access to Microsoft Defender](m365d-permissions.md).

## AlertInfo

The `AlertInfo` table in the [advanced hunting](advanced-hunting-overview.md) schema contains alert information from Microsoft Defender for Endpoint, Microsoft Defender for Office 365, Microsoft Defender for Cloud Apps, Microsoft Defender for Identity, and onboarded Microsoft Sentinel workspaces. Use this reference to construct queries that return information from this table. Join `AlertInfo` with [`AlertEvidence`](advanced-hunting-alertevidence-table.md) on the `AlertId` column to retrieve the entities and evidence associated with each alert.

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the record was generated |
| `AlertId` | `string` | Unique identifier for the alert |
| `Title` | `string` | Title of the alert |
| `Category` | `string` | Type of threat indicator or breach activity identified by the alert |
| `Severity` | `string` | Indicates the potential impact (high, medium, or low) of the threat indicator or breach activity identified by the alert |
| `ServiceSource` | `string` | Product or service that provided the alert information |
| `DetectionSource` | `string` | Detection technology or sensor that identified the notable component or activity |
| `AttackTechniques` | `string` | MITRE ATT&CK techniques associated with the activity that triggered the alert |

## Related topics
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
