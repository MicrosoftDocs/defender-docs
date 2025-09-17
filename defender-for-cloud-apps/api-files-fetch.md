---
title: Fetch - Files API
description: This article describes the fetch request in the Defender for Cloud Apps Files API.
ms.date: 01/29/2023
ms.topic: reference
---
# Fetch - Files API



> [!NOTE]
>
> - This API is not available for Microsoft 365 Cloud App Security.

Run the GET request to fetch the file matching the specified primary key.

## HTTP request

```rest
GET /api/v1/files/<pk>/
```

## Request URL parameters

| Parameter | Description |
| --- | --- |
| pk | The ID of the file |

## Example

### Request

Here is an example of the request.

```rest
curl -XPOST -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/files/<pk>/"
```

### Response

Returns the specified file.

[!INCLUDE [Open support ticket](includes/support.md)]
