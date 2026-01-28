---
title: Add or remove a tag for a machine
description: Learn how to use the Add or Remove machine tags API to adds or remove a tag for a machine in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Add or remove a tag for a machine

## API description

Adds or removes a tag for a specific [device](machine.md).

## Limitations

- You can post on machines last seen according to your configured retention period.

- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

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
POST https://api.security.microsoft.com/api/machines/{id}/tags
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|
|Content-Type|string|application/json. **Required**.|

## Request body

To remove machine tag, set the Action to 'Remove' instead of 'Add' in the request body.

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|Value|String|The tag name. **Required**.|
|Action|Enum|Add or Remove. Allowed values are: 'Add' or 'Remove'. **Required**.|

## Response

If successful, this method returns 200 - Ok response code and the updated Machine in the response body.

## Example Request

Here is an example of a request that adds a machine tag.

```http
POST https://api.security.microsoft.com/api/machines/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/tags
```

```json
{
  "Value" : "test Tag 2",
  "Action": "Add"
}
```
