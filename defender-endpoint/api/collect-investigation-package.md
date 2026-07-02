---
title: Collect investigation package API
description: Use this API to create calls related to the collecting an investigation package from a device.
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
ms.date: 11/13/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Collect investigation package API

## API description

Collect investigation package from a device.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'Alerts Investigation'. For more information, see: [Create and manage roles](../user-roles.md)
- The user needs to have access to the device, based on device group settings. For more information, see: [Create and manage device groups](../machine-groups.md)

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.CollectForensics|'Collect forensics'|
|Delegated (work or school account)|Machine.CollectForensics|'Collect forensics'|

## HTTP request

```http
POST https://api.security.microsoft.com/api/machines/{id}/collectInvestigationPackage
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|
|Content-Type|string|application/json. **Required**.|

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|Comment|String|Comment to associate with the action. **Required**.|

## Response

If successful, this method returns 201 - Created response code and [Machine Action](machineaction.md) in the response body. If a collection is already running, this returns 400 Bad Request.

## Example

### Request

Here is an example of the request.

```http
POST https://api.security.microsoft.com/api/machines/fb9ab6be3965095a09c057be7c90f0a2/collectInvestigationPackage
```

```json
{
  "Comment": "Collect forensics due to alert 1234"
}
```
