---
title: Set device value API
description: Learn how to specify the value of a device using a Microsoft Defender for Endpoint API.
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

# Set device value API

## API description

Set the device value of a specific [Machine](machine.md).<br>
See [assign device values](/defender-vulnerability-management/tvm-assign-device-value) for more information.

## Limitations

- You can post on devices last seen according to your configured retention period.
- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'Manage security setting'. For more information, see [Create and manage roles](../user-roles.md).
- The user needs to have access to the machine, based on machine group settings. For more information, see [Create and manage machine groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.ReadWrite.All|'Read and write all machine information'|
|Delegated (work or school account)|Machine.ReadWrite|'Read and write machine information'|

## HTTP request

```http
POST https://api.security.microsoft.com/api/machines/{machineId}/setDeviceValue
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
|DeviceValue|Enum|Device value. Allowed values are: 'Normal', 'Low' and 'High'. **Required**.|

## Response

If successful, this method returns 200 - Ok response code and the updated Machine in the response body.

## Example

### Request

Here is an example of a request that adds machine tag.

```http
POST https://api.security.microsoft.com/api/machines/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/setDeviceValue
```

```json
{
  "DeviceValue" : "High"
}
```
