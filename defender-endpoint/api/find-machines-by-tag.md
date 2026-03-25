---
title: Find devices by tag API
description: Find all devices that contain specific tag
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 02/02/2021
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Find devices by tag API

## API description

Find [Machines](machine.md) by [Tag](../machine-tags.md).

`startswith` query is supported.

## Limitations

Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials:

- Responses include only devices that the user have access to based on device group settings. For more information, see: [Create and manage device groups](../machine-groups.md).
- The user needs to have at least the following role permission: 'View Data'. For more information, see: [Create and manage roles](../user-roles.md)
- Responses include only devices that the user have access to based on device group settings. For more information, see: [Create and manage device groups](../machine-groups.md).

The following permission is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.ReadWrite.All|'Read and write all machine information'|
|Delegated (work or school account)|Machine.ReadWrite|'Read and write machine information'|

## HTTP request

```http
GET /api/machines/findbytag?tag={tag}&useStartsWithFilter={true/false}
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request URI parameters

|Name|Type|Description|
|---|---|---|
|tag|String|The tag name. **Required**.|
|useStartsWithFilter|Boolean|When set to true, the search finds all devices with tag name that starts with the given tag in the query. Defaults to false. **Optional**.|

## Request body

Empty

## Response

If successful - 200 OK with list of the machines in the response body.

## Example

### Request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/machines/findbytag?tag=testTag&useStartsWithFilter=true
```
