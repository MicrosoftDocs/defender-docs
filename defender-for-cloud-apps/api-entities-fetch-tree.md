---
title: Fetch entity tree - Entities API
description: This article describes the fetch entity tree request in the Defender for Cloud Apps Entities API.
ms.date: 01/29/2023
ms.topic: reference
---
# Fetch entity tree - Entities API



> [!NOTE]
> This request is not available for Microsoft 365 Cloud App Security.

Run the GET request to fetch all entities related to the entity matching the specified primary key. If the entity is a user, fetches all accounts associated with the user. If the entity is an account, fetches the entity's parent and siblings.

## HTTP request

```rest
GET /api/v1/entities/<pk>/retrieve_tree/
```

## Request URL parameters

| Parameter | Description |
| --- | --- |
| pk | The ID of the entity |

## Example

### Request

Here is an example of the request.

```rest
curl -XGET -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/entities/<pk>/retrieve_tree/"
```

### Response

Returns the specified entity tree in JSON format.

```json
{
  // entity tree record
}
```

[!INCLUDE [Open support ticket](includes/support.md)]
