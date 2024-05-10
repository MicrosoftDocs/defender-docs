---
title: CloudAuditEvents table in the advanced hunting schema
description: Learn about events from Microsoft Defender for Cloud in the CloudAuditEvents table of the advanced hunting schema
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
ms.topic: reference
ms.date: 12/29/2023
---

# CloudAuditEvents

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- Microsoft Defender XDR

The `CloudAuditEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about [INSERT TEXT]. Use this reference to construct queries that return information from this table.


For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the event was recorded |
| `ReportId` |	`Guid`?? | GUID that uniquely identifies a record in a specific table |
| `DataSource` | `string` | Data source for the cloud audit events, can be ‘GCP’, ‘AWS’, ‘Azure’, ‘Kubernetes Audit’ or other cloud platforms |
| `ActionType` | `string` |	Required field by hunting schema, normalized identifier for the type of activity. Values aligned with OCSF schema  and can be: Unknown, Create, Read, Update, Delete, Other. |
| `OperationName` |	`string` | Audit event operation name as appeared in the raw event schema. Usually includes both resource type and operation. |
| `ResourceId` | `string` |	The cloud resource asset identifier, supporting Azure, GCP or AWS. |
| `IPAddress` | `string` |	The client IP address used to access the cloud resource or control plane. |
| `IsAnonymousProxy` |	`boolean` |	Indicates whether the IP address belongs to a known anonymous proxy |
| `CountryCode` | `string` | Two-letter code indicating the country where the client IP address is geolocated |
| `City` | `string` | City where the client IP address is geolocated |
| `Isp` | `string` | Internet service provider (ISP) associated with the IP address |
| `UserAgent` | `string` | User agent information from the web browser or other client application |
| `RawEventData` | `dynamic` | Full raw event information from the data source in JSON format |
| `AdditionalFields` |	`dynamic` |	Additional information about the event which is not contracted under the schema top level fields. In the first schema iteration, will contain ‘ResourceType’ as inner field, to hold the specific type of the cloud resource as extracted from the ResourceId. |

[INSERT SAMPLE QUERIES]



## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)

