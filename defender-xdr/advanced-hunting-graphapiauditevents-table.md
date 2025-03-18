---
title: GraphApiAuditEvents table in the advanced hunting schema
description: Learn about the GraphApiAuditEvents table in the advanced hunting schema, which provides information about Microsoft Entra ID API requests made to Microsoft Graph API for resources in the tenant.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: v-mjosephy
author: mjosephym
ms.localizationpriority: medium
manager: rayne-wiselman
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom:
- cx-ti
- cx-ah
ms.topic: reference
ms.date: 03/12/2024
---

# GraphApiAuditEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `GraphApiAuditEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about Microsoft Entra ID API requests made to Microsoft Graph API for resources in the tenant. Use this reference to construct queries that return information from this table.

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `IdentityProvider` | `string` | Identity provider that authenticated the subject of the token |
| `ApiVersion` | `string` | The API version of the event |
| `ApplicationId` | `string` | Unique identifier for the application |
| `ClientRequestId` | `string` | Identifier for the client request sent; if none is available, the operation identifier is used instead |
| `RequestUri` | `string` | Uniform resource identifier (URI) of the request |
| `OperationId` | `string` | Identifier for a batch of requests; the same identifier is used for all requests in a batch but if requests are non-batched, the identifier is unique per request |
| `AccountObjectId` | `string` | Unique identifier for the user making the request |
| `Location` | `string` | Name of the region that served the request |
| `RequestDuration` | `string` | Duration of the request in milliseconds |
| `RequestMethod` | `string` | HTTP method of the request |
| `Timestamp` | `string` | Date and time when the request was recorded |
| `ResponseStatusCode` | `string` | HTTP response status code for the request |
| `Scopes` | `string` | Scopes in token claims |
| `RequesterRoles` | `string` | Denotes the tenant-wide roles assigned to the user making the request|
| `RequestDetails` | `string` | Contains information about the request, like the IP address of the client from where the request occurred, the URI of the request, the user-agent information related to request, the application display name | 
| `UserAgent` | `string` |User agent information from the web browser or other client application|
| `EntityType` | `string` | Type of entity that performed the action | 

## Related articles

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
