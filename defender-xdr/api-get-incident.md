---
title: Get incident API
description: Learn how to use the Get incidents API to get a single incident in Microsoft Defender XDR.
ms.service: defender-xdr
ms.author: macapara
author: mjcaparas
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
 - m365-security
 - tier3
 - must-keep
ms.topic: reference
ms.custom: api
search.appverid: met150
ms.date: 04/15/2025
appliesto:
 - Microsoft Defender XDR
---

# Get incident information API

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!include[Microsoft Defender for Endpoint API URIs for US Government](../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../includes/improve-request-performance.md)]

> [!NOTE]
> **Try our new APIs using MS Graph security API**. Find out more at: [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview).

## API description

Retrieves a specific incident by its ID

## Limitations

1. Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

One of the following permissions is required to call this API.

| Permission type|Permission|Permission display name |
|---|---|---| 
|Application|Incident.Read.All|`Read all Incidents`|
|Application|Incident.ReadWrite.All|`Read and write all Incidents`|
|Delegated (work or school account)|Incident.Read|`Read Incidents`|
|Delegated (work or school account)|Incident.ReadWrite|`Read and write Incidents`|

> [!NOTE]
>
> When obtaining a token using user credentials:
>
> - The user needs to have at least the following role permission: `View Data`
> - The response will only include incidents that the user is exposed to

## HTTP request

```console
GET .../api/incidents/{id}
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns `200 OK`, and the incident entity in the response body.
If incident with the specified ID wasn't found - 404 Not Found.

## Example

### Request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/incidents/{id}
```

## Related content

[Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
