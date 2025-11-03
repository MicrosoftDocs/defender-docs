---
title: Fetch - Activities API
description: This article describes the fetch request in the Defender for Cloud Apps Activities API.
ms.date: 01/29/2023
ms.topic: reference
---
# Fetch - Activities API



Run the GET request to fetch the activity matching the specified primary key.

## HTTP request

```rest
GET /api/v1/activities/<pk>/
```

## Request URL parameters

| Parameter | Description |
| --- | --- |
| pk | The ID of the activity |

## Example

### Request

Here is an example of the request.

```rest
curl -XGET -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/activities/<pk>/"
```

### Response

Returns the specified activity in JSON format.

```json
{
  // activity record
}
```

If you run into any problems, we're here to help. To get assistance or support for your product issue, please [open a support ticket](/defender-xdr/contact-defender-support).
