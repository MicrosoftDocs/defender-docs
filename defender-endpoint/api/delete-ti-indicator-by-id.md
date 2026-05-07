---
title: Delete Indicator API.
description: Learn how to use the Delete Indicator API to delete an Indicator entity by ID in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Delete Indicator API

## API description

Deletes an [Indicator](ti-indicator.md) entity by ID.

## Limitations

Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Get started](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Ti.ReadWrite.All|'Read and write Indicators'|

## HTTP request

```http
Delete https://api.security.microsoft.com/api/indicators/{id}
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If Indicator exists and deleted successfully - 204 OK without content.

If Indicator with the specified ID wasn't found - 404 Not Found.

## Example

### Request

Here's an example of the request.

```http
DELETE https://api.security.microsoft.com/api/indicators/995
```
