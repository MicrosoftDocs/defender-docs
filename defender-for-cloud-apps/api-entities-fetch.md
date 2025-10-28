---
title: Fetch - Entities API
description: This article describes the fetch request in the Defender for Cloud Apps Entities API.
ms.date: 01/29/2023
ms.topic: reference
---
# Fetch - Entities API



> [!NOTE]
> This request is not available for Microsoft 365 Cloud App Security.

Run the GET request to fetch the entity matching the specified primary key.

## HTTP request

```rest
GET /api/v1/entities/<pk>/
```

## Request URL parameters

| Parameter | Description |
| --- | --- |
| pk | A dictionary with the entity ID, SaaS, and instance details encoded as a base64 string. For example: `{"id":"00aa00aa-bb11-cc22-dd33-44ee44ee44ee","saas":11161,"inst":0}` encoded as a base64 string. |

## Example

### Request

Here's an example of the request.

```rest
curl -XPOST -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/entities/<pk>/"
```

### Response

Returns the specified entity in JSON format.

```json
{
  // entity record
}
```

[!INCLUDE [Open support ticket](includes/support.md)]
