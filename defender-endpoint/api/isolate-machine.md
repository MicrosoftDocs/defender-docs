---
title: Isolate machine API
description: Learn how to use the Isolate machine API to isolate a device from accessing external network in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 03/12/2025
---

# Isolate machine API

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1 or Plan 2](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Business](/defender-business)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

## API description

Isolates a device from accessing external network.

## Limitations

1. Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

[!include[Device actions note](../../includes/machineactionsnote.md)]

> [!IMPORTANT]
> - Full isolation is available for devices on Windows 10, version 1703, and on Windows 11.
> - Full isolation is available for all supported Linux devices. See [Microsoft Defender for Endpoint on Linux](/defender-endpoint/microsoft-defender-endpoint-linux).
> - Selective isolation is available for devices on Windows 10, version 1709 or later, and on Windows 11.
> - When isolating a device, only certain processes and destinations are allowed. Therefore, devices that are behind a full VPN tunnel won't be able to reach the Microsoft Defender for Endpoint cloud service after the device is isolated. We recommend using a split-tunneling VPN for Microsoft Defender for Endpoint and Microsoft Defender Antivirus cloud-based protection-related traffic.
> - Calling this API on unmanaged devices triggers the [contain device from the network](../respond-machine-alerts.md#contain-devices-from-the-network) action. The IsolationType value should be set to 'UnManagedDevice.'

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

Permission type|Permission|Permission display name
:---|:---|:---
Application|Machine.Isolate|'Isolate machine'
Delegated (work or school account)|Machine.Isolate|'Isolate machine'

> [!NOTE]
> When obtaining a token using user credentials:
> - The user needs to have at least the following role permission: 'Active remediation actions.' For more information, see [Create and manage roles](../user-roles.md).
> - The user needs to have access to the device, based on device group settings. See [Create and manage device groups](../machine-groups.md) for more information.
> 
> Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2. 

## HTTP request

```http
POST https://api.securitycenter.microsoft.com/api/machines/{id}/isolate
```

## Request headers

Name|Type|Description
:---|:---|:---
Authorization|String|Bearer {token}. **Required**.
Content-Type|string|application/json. **Required**.

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|:---|:---|:---|
|Comment|String|Comment to associate with the action. **Required**.|
|IsolationType|String|Type of the isolation. Allowed values are: **Full**, **Selective**, or **UnManagedDevice**.|

**IsolationType** controls the type of isolation to perform and can be one of the following:

- Full: Full isolation. Works for managed devices.
- Selective: Restrict only limited set of applications from accessing the network on managed devices. For more information, see [Isolate devices from the network](../respond-machine-alerts.md#isolate-devices-from-the-network).
- UnManagedDevice: The isolation targets unmanaged devices only.

## Response

If successful, this method returns 201 - Created response code and [Machine Action](machineaction.md) in the response body.

## Example

### Request

Here's an example of the request.

```http
POST https://api.securitycenter.microsoft.com/api/machines/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/isolate
```

```json
{
  "Comment": "Isolate machine due to alert 1234",
  "IsolationType": "Full" 
}
```

- To release a device from isolation, see [Release device from isolation](unisolate-machine.md).
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
