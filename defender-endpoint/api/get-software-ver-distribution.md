---
title: List software version distribution
description: Retrieves a list of your organization's software version distribution
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

# List software version distribution

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

Retrieves a list of your organization's software version distribution.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Software.Read.All|'Read Threat and Vulnerability Management Software information'|
|Delegated (work or school account)|Software.Read|'Read Threat and Vulnerability Management Software information'|

## HTTP request

```http
GET /api/Software/{Id}/distributions
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}.**Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 OK with a list of software distributions data in the body.

## Example

### Request example

Here is an example of the request.

```http
GET https://api.security.microsoft.com/api/Software/microsoft-_-edge/distributions
```

### Response example

Here's an example of the response.

```json

{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#Distributions",
    "value": [
        {
            "version": "11.0.17134.1039",
            "installations": 1,
            "vulnerabilities": 11
        },
        {
            "version": "11.0.18363.535",
            "installations": 750,
            "vulnerabilities": 0
        }
        ...
    ]
}
```
