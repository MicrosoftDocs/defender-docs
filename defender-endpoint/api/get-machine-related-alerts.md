---
title: Get machine related alerts API
description: Learn how to use the Get machine related alerts API. This API allows you to retrieve all alerts that are related to a specific device in Microsoft Defender for Endpoint.
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

# Get machine related alerts  API

## API description

Retrieves all [Alerts](alerts.md) related to a specific device.

## Limitations

- You can query on devices last updated according to your configured retention period.
- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'View Data'. For more information about permissions, see: [Create and manage roles](../user-roles.md).
- The user needs to have access to the device, based on device group settings. For more information about device group settings, see: [Create and manage device groups](../machine-groups.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Alert.ReadWrite.All|'Read and write all alerts'|
|Delegated (work or school account)|Alert.ReadWrite|'Read and write alerts'|

## HTTP request

```http
GET /api/machines/{id}/alerts
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful and device exists: 200 OK with list of [alert](alerts.md) entities in the body. If device was not found: 404 Not Found.
