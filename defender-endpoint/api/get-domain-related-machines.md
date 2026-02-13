---
title: Get domain-related machines API
description: Learn how to use the Get domain-related machines API to get machines that communicated to or from a domain in Microsoft Defender for Endpoint.
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
ms.date: 11/11/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Get domain-related machines API

## API description

Retrieves a collection of [Machines](machine.md) that have communicated to or from a given domain address.

## Limitations

- You can query on devices last updated according to your configured retention period.
- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.
- Responses are limited to 500 devices in results.

## Permissions

When obtaining a token using user credentials:

- The user must have at least the following role permission: `View Data`. For more information, see [Create and manage roles](../user-roles.md).

- Responses include only devices that the user can access, based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|`Machine.ReadWrite.All`|`Read and write all machine information`|
|Delegated (work or school account)|`Machine.ReadWrite`|`Read and write machine information`|

## HTTP request

```http
GET /api/domains/{domain}/machines
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|`Bearer {token}`. <br/> **Required**.|

## Request body

Empty

## Response

If successful, and the domain exists:
- 200 OK with list of [machine](machine.md) entities

If domain doesn't exist:
- 200 OK with an empty set

## Example

### Request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/domains/api.security.microsoft.com/machines
```
