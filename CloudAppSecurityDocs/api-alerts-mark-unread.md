---
title: Mark as unread - Alerts API
description: This article describes the mark as unread request in the Defender for Cloud Apps Alerts API.
ms.date: 01/29/2023
ms.topic: reference
---
# Mark as unread - Alerts API



Run the POST request to mark the alert matching the specified primary key as unread.

## HTTP request

```rest
POST /api/v1/alerts/<pk>/unread/
```

## Request URL parameters

| Parameter | Description |
| --- | --- |
| pk | The ID of the alert |

## Example

### Request

Here is an example of the request.

```rest
curl -XPOST -H "Authorization:Token <your_token_key>" -H "Content-Type: application/json" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/alerts/<pk>/unread/"
```

[!INCLUDE [Open support ticket](includes/support.md)]
