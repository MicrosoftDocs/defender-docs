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
ms.custom: 
- cx-ti
- cx-ah
ms.topic: reference
ms.date: 12/29/2023
---

# CloudAuditEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- Microsoft Defender XDR



The `CloudAuditEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about cloud audit events for various cloud platforms protected by the organization's [Microsoft Defender for Cloud](/azure/defender-for-cloud/concept-integration-365#advanced-hunting-in-xdr). Use this reference to construct queries that return information from this table.

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the event was recorded |
| `ReportId` |	`string` | Unique identifier for the event |
| `DataSource` | `string` | Data source for the cloud audit events, can be GCP (for Google Cloud Platform), AWS (for Amazon Web Services), Azure (for Azure Resource Manager), Kubernetes Audit (for Kubernetes), or other cloud platforms |
| `ActionType` | `string` |	Type of activity that triggered the event, can be: Unknown, Create, Read, Update, Delete, Other |
| `OperationName` |	`string` | Audit event operation name as it appears in the record, usually includes both resource type and operation |
| `ResourceId` | `string` |	Unique identifier of the cloud resource accessed |
| `IPAddress` | `string` | The client IP address used to access the cloud resource or control plane |
| `IsAnonymousProxy` |`boolean` |	Indicates whether the IP address belongs to a known anonymous proxy (1) or no (0) |
| `CountryCode` | `string` | Two-letter code indicating the country where the client IP address is geolocated |
| `City` | `string` | City where the client IP address is geolocated |
| `Isp` | `string` | Internet service provider (ISP) associated with the IP address |
| `UserAgent` | `string` | User agent information from the web browser or other client application |
| `RawEventData` | `dynamic` | Full raw event information from the data source in JSON format |
| `AdditionalFields` |	`dynamic` |	Additional information about the audit event  |

## Sample query

To get a sample list of VM creation commands performed in the last seven days:

```kusto
CloudAuditEvents
| where Timestamp > ago(7d)
| where OperationName startswith "Microsoft.Compute/virtualMachines/write"
| extend Status = RawEventData["status"], SubStatus = RawEventData["subStatus"]
| sample 10
```

## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)

