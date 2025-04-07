---
title: Offboard machine API
description: Learn how to use an API to offboard a device from Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 08/29/2024
---

# Offboard machine API

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint](../microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

## API description

Offboard device from Defender for Endpoint.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

  [!include[Machine actions note](../../includes/machineactionsnote.md)]

> [!NOTE]
> - This API is supported on Windows 11, Windows 10, version 1703 and later; on Windows Server 2019 and later; and on Windows Server 2012 R2 and Windows Server 2016 when using the [new, unified agent for Defender for Endpoint](../update-agent-mma-windows.md#upgrade-to-the-new-unified-agent-for-defender-for-endpoint).
> - This API is not supported on macOS or Linux devices.
> - Running the offboarding API only stops the sensor service from running, but it does not remove the onboarding information from the registry like an offboarding script does.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|`Machine.Offboard`|`Offboard machine`|
|Delegated (work or school account)|`Machine.Offboard`|`Offboard machine`|

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

When obtaining a token using user credentials:

- The user must have an appropriate role assigned (see [Permission options](../user-roles.md#permission-options)).

- The user must have access to the device, based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).

Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.  

## HTTP request

```http
POST https://api.security.microsoft.com/api/machines/{id}/offboard
```

The machine ID can be found in the URL when you select the device. Generally, it's a 40 digit alphanumeric number that can be found in the URL.

## Request headers

Name|Type|Description
---|---|---
Authorization|String|Bearer {token}. **Required**.
Content-Type|string|application/json. **Required**.

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|Comment|String|Comment to associate with the action. **Required**.|

## Response

If successful, this method returns `200 - Created response` code and [Machine Action](machineaction.md) in the response body.

## Example

### Request

Here's an example of the request. If there's no JSON comment added, it errors out with code `400`.

```http
POST https://api.security.microsoft.com/api/machines/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/offboard
```

```json
{
  "Comment": "Offboard machine by automation"
}
```

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
