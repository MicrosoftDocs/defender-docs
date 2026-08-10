---
title: Find devices by internal IP API
description: Find devices seen with the requested internal IP in the time range of 15 minutes prior and after a given timestamp
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
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Find devices by internal IP API

## API description

Find [Machines](machine.md) seen with the requested internal IP in the time range of 15 minutes prior and after a given timestamp.

## Limitations

- The given timestamp must be in the past 30 days.
- Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials:

- Responses include only devices that the user have access to based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).

- The user needs to have at least the following role permission: 'View Data'. For more information, see [Create and manage roles](../user-roles.md).

- Responses include only devices that the user have access to based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.ReadWrite.All|'Read and write all machine information'|
|Delegated (work or school account)|Machine.ReadWrite|'Read and write machine information'|

## HTTP request

```http
GET /api/machines/findbyip(ip='{IP}',timestamp={TimeStamp})
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful - 200 OK with list of the machines in the response body.
If the timestamp isn't in the past 30 days - 400 Bad Request.

## Example

### Request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/machines/findbyip(ip='10.248.240.38',timestamp=2019-09-22T08:44:05Z)
```
