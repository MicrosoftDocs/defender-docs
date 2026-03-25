---
title: Get file-related alerts API
description: Learn how to use the Get file-related alerts API to get a collection of alerts related to a given file hash in Microsoft Defender for Endpoint.
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
ms.date: 11/12/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Get file-related alerts API

## API description

Retrieves a collection of alerts related to a given file hash.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.
- Only SHA-1 Hash Function is supported (not MD5 or SHA-256).

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'View Data'. For more information, see [Create and manage roles](../user-roles.md).
- Response will include only alerts, associated with devices, that the user have access to, based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Alert.ReadWrite.All|'Read and write all alerts'|
|Delegated (work or school account)|Alert.ReadWrite|'Read and write alerts'|

## HTTP request

```http
GET /api/files/{id}/alerts
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful and file exists - 200 OK with list of [alert](alerts.md) entities in the body. If file doesn't exist - 200 OK with an empty set.

## Example

### Request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/files/6532ec91d513acc05f43ee0aa3002599729fd3e1/alerts
```
