---
title: Get user-related alerts API
description: Retrieve a collection of alerts related to a given user ID using Microsoft Defender for Endpoint.
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
ms.date: 11/16/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Get user-related alerts API

## API description

Retrieves a collection of alerts related to a given user ID.

## Limitations

Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'View Data.' For more information, see: [Create and manage roles](../user-roles.md).
- Response includes only alerts, associated with devices, that the user have access to, based on device group settings. For more information, see: [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Alert.Read.All|'Read all alerts'|
|Application|Alert.ReadWrite.All|'Read and write all alerts'|
|Delegated (work or school account)|Alert.Read|'Read alerts'|
|Delegated (work or school account)|Alert.ReadWrite|'Read and write alerts'|

## HTTP request

```http
GET /api/users/{id}/alerts
```

**The ID is not the full UPN, but only the user name. (for example, to retrieve alerts for user1@contoso.com use /api/users/user1/alerts)**

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful and user exists - 200 OK. If the user doesn't exist - 200 OK with an empty set.

## Example

### Request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/users/user1/alerts
```
