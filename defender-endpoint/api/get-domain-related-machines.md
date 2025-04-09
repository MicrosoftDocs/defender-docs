---
title: Get domain-related machines API
description: Learn how to use the Get domain-related machines API to get machines that communicated to or from a domain in Microsoft Defender for Endpoint.
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
ms.date: 11/03/2024
---

# Get domain-related machines API

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](../microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!Include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!Include[Improve request performance](../../includes/improve-request-performance.md)]

## API description

Retrieves a collection of [Machines](machine.md) that have communicated to or from a given domain address.

## Limitations
 
- You can query on devices last updated according to your configured retention period.
- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.
- Responses are limited to 500 devices in results.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|:---|:---|:---|
|Application|`Machine.Read.All`|`Read all machine profiles`|
|Application|`Machine.ReadWrite.All`|`Read and write all machine information`|
|Delegated (work or school account)|`Machine.Read`|`Read machine information`|
|Delegated (work or school account)|`Machine.ReadWrite`|`Read and write machine information`|

> [!NOTE]
> When obtaining a token using user credentials:
> - The user must have at least the following role permission: `View Data`. For more information, see [Create and manage roles](../user-roles.md).
> - Responses include only devices that the user can access, based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).
> Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.

## HTTP request

```http
GET /api/domains/{domain}/machines
```

## Request headers

|Name|Type|Description|
|:---|:---|:---|
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
GET https://api.securitycenter.microsoft.com/api/domains/api.securitycenter.microsoft.com/machines
```

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
