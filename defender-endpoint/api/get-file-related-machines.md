---
title: Get file-related machines API
description: Learn how to use the Get file-related machines API to get a collection of machines related to a file hash in Microsoft Defender for Endpoint.
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
ms.date: 11/12/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Get file-related machines API

## API description

Retrieves a collection of [Machines](machine.md) related to a given file hash.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.
- Only SHA-1 Hash Function is supported (not MD5 or SHA-256).

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'View Data'. For more information, see [Create and manage roles](../user-roles.md).
- Response will include only devices, that the user have access to, based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.ReadWrite.All|'Read and write all machine information'|
|Delegated (work or school account)|Machine.ReadWrite|'Read and write machine information'|

## HTTP request

```http
GET /api/files/{id}/machines
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful and file exists - 200 OK with list of [machine](machine.md) entities in the body. If file doesn't exist - 200 OK with an empty set.

## Example

### Request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/files/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/machines
```
