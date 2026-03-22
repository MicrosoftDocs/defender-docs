---
title: Batch Delete Indicators API
description: Learn how to use the Batch Delete Indicators API to delete indicator entities by ID in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.subservice: reference
ms.reviewer: itsela
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.custom: api
search.appverid: met150
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Batch Delete Indicators

## API description

Deletes [Indicator](ti-indicator.md) entities by ID.

## Limitations

- Rate limitations for this API are 30 calls per minute and 1,500 calls per hour.

- Batch size limit of up to 500 [Indicator](ti-indicator.md) IDs.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Get started](apis-intro.md).

| Permission type | Permission | Permission display name |
|---|---|---|
| Application | Ti.ReadWrite.All | 'Read and write Indicators' |

## HTTP request

```http
POST https://api.security.microsoft.com/api/indicators/BatchDelete
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization | String | Bearer {token}. **Required**.|

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|IndicatorIds|List *String* |A list of the IDs of the indicators to be removed. **Required**|

## Response

- If Indicators all existed and were deleted successfully - 204 OK without content.

- If indicator IDs list is empty or exceeds size limit - 400 Bad Request.

- If any indicator ID is invalid - 400 Bad Request.

- If requestor isn't exposed to any indicator's device groups - 403 Forbidden.

- If any Indicator ID wasn't found - 404 Not Found.

## Example

### Request

Here's an example of the request.

```http
POST https://api.security.microsoft.com/api/indicators/BatchDelete
```

```json
{
    "IndicatorIds": [ "1", "2", "5" ]
}
```
