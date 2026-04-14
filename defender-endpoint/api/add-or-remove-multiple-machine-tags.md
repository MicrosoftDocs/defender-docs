---
title: Add or remove a tag for multiple machines
description: Learn how to use the Add or Remove machine tags API to add or remove a tag for multiple devices in Microsoft Defender for Endpoint.
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

# Add or remove a tag for multiple machines

## API description

Adds or removes a tag for the specified set of machines.

## Limitations

- You can post on machines last seen according to your configured retention period.
- Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.
- We can add or remove a tag for up to 500 machines per API call.

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'Manage security setting'. For more information, see: [Create and manage roles](../user-roles.md).
- The user needs to have access to the machine, based on machine group settings. For more information, see: [Create and manage machine groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Defender for Endpoint APIs](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.ReadWrite.All|'Read and write all machine information'|
|Delegated (work or school account)|Machine.ReadWrite|'Read and write machine information'|

## HTTP request

```http
POST https://api.security.microsoft.com/api/machines/AddOrRemoveTagForMultipleMachines
```

[!INCLUDE [Improve request performance](../../includes/improve-request-performance.md)]

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|
|Content-Type|string|application/json. **Required**.|

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|Value|String|The tag name. **Required**.|
|Action|Enum|Add or Remove. Allowed values are: 'Add' or 'Remove'. **Required**.|
|MachineIds|List (String)|List of machine IDs to update. Required.|

## Response

If successful, this method returns 200 - Ok response code and the updated machines in the response body.

## Example Request

To remove machine tags, set the Action to 'Remove' instead of 'Add' in the request body.

Here's an example of a request that adds a tag to multiple machines.

```http
POST https://api.security.microsoft.com/api/machines/AddOrRemoveTagForMultipleMachines
```

```json
{
  "Value" : "Tag",
  "Action": "Add",
  "MachineIds": ["34e83ca3feea4dae2353006ba389262c033a025e",
  "2a398439b4975924e87a65943972bc702469b329",
  "a610c00c65fdf79960cc0077d9d8c569d23f09a5"]
}
```
