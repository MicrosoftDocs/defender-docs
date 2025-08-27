---
title: IdentityEvents table in the advanced hunting schema
description: Learn about the IdentityEvents table in the advanced hunting schema, which contains information about identity events obtained from other cloud identity service providers. 
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
ms.date: 08/07/2025
---

# IdentityEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The `IdentityEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about identity events obtained from other cloud identity service providers. Use this reference to construct queries that return information from this table. 

> [!IMPORTANT]
> Some information relates to prereleased product, which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

This advanced hunting table is populated by records from Microsoft Defender for Identity. If your organization hasn’t deployed the service in Microsoft Defender XDR, queries that use the table aren’t going to work or return any results. For more information about how to deploy Defender for Identity in Defender XDR, read [Deploy supported services](deploy-supported-services.md).

>[!NOTE]
>This advanced hunting table is populated only when other identity services like Okta are connected to Defender for Identity. 


For information on other tables in the advanced hunting schema, see the [advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp ` | `datetime` | Date and time when the record was generated  |
| `ReportId ` | `string` | Unique identifier for the event  |
| `AccountId ` | `string` | Unique identifier for the account in the source application |
| `AccountType` | `string` | Type of user account, indicating its general role like User, SystemPrincipal |
| `AccountDisplayName` | `string` | Name displayed in the address book entry for the account user. This is usually a combination of the given name, middle initial, and surname of the user.  |
| `AccountUpn` | `string` | Alternate ID, email, or name for the account in the source application |
| `ActionType` | `string` | Type of activity that triggered the event in the raw format received from the source application | 	
| `ActionResult` | `string` | Result of the action | 	 
| `ActionFailureReason` | `string` | Information explaining why the recorded action failed | 	 
| `IPAddress` | `string` | IP address assigned to the device and used during related network communications |  	 
| `UserAgent` | `string` | User agent information from the web browser or other client application | 	 
| `TargetObjects` | `dynamic` | List of the target objects of this activity. Target object can be user, group, role, domain, application, and more. | 	 
| `Application` | `string` | The source application where this event was received from | 	 
| `ApplicationInstanceId` | `string` | Domain of the source application | 	 
| `ApplicationEventId` | `string` | Raw event ID provided by the source application | 	 
| `ApplicationSessionId` | `string` | Raw session ID provided by the source application | 	 
| `RawEventData` | `dynamic` | Full raw event information from the source application in JSON format | 	 
| `AdditionalFields` | `dynamic` | Additional information about the entity or event |


## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]