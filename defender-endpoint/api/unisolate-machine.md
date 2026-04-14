---
title: Release device from isolation API
description: Use this API to create calls related to release a device from isolation.
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
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Release device from isolation API

## API description

Undo isolation of a device.

When isolating a device, only certain processes and destinations are allowed. Devices that are behind a full VPN tunnel won't be able to reach the Microsoft Defender for Endpoint cloud service after the device is isolated. We recommend using a split-tunneling VPN for Microsoft Defender for Endpoint and Microsoft Defender Antivirus cloud-based protection-related traffic.

## Limitations

Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

## Prerequisites

### Supported operating systems

- Full isolation is available for devices on Windows 10, version 1703.
- Full isolation is available in **public preview** for all supported Microsoft Defender for Endpoint on Linux listed in [System requirements](../mde-linux-prerequisites.md).
- Selective isolation is available for devices on Windows 10, version 1709 or later.

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'Active remediation actions'. For more information, see: [Create and manage roles](../user-roles.md).
- The user needs to have access to the device, based on device group settings. For more information, see: [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.Isolate|'Isolate machine'|
|Delegated (work or school account)|Machine.Isolate|'Isolate machine'|

## HTTP request

```http
POST https://api.security.microsoft.com/api/machines/{id}/unisolate
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

If successful, this method returns 201 - Created response code and [Machine Action](machineaction.md) in the response body.

If you send multiple API calls to remove isolation for the same device, it returns "pending machine action" or HTTP 400 with the message "Action is already in progress".

## Example

### Request

Here is an example of the request.

```http
POST https://api.security.microsoft.com/api/machines/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/unisolate
```

```json
{
  "Comment": "Unisolate machine since it was clean and validated"
}
```
