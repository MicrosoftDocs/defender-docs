---
title: Get Investigation object API
description: Use this API to create calls related to get Investigation object
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
ms.date: 11/11/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Get Investigation API

## API description
Retrieves specific [Investigation](investigation.md) by its ID.
<br> ID can be the investigation ID or the investigation triggering alert ID.

## Limitations

Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

## Permissions

 When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'View Data'. For more information, see [Create and manage roles](../user-roles.md).

One of the following permissions is required to call this API. TFor more information on how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Alert.ReadWrite.All|'Read and write all alerts'|
|Delegated (work or school account)|Alert.ReadWrite|'Read and write alerts'|

## HTTP request

```http
GET https://api.security.microsoft.com/api/investigations/{id}
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200, Ok response code with an [Investigations](investigation.md) entity.
