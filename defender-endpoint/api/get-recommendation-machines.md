---
title: List devices by recommendation
description: Retrieves a list of devices associated with the security recommendation.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 11/13/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# List devices by recommendation

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

Retrieves a list of devices associated with the security recommendation.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|SecurityRecommendation.Read.All|'Read Threat and Vulnerability Management security recommendation information'|
|Delegated (work or school account)|SecurityRecommendation.Read|'Read Threat and Vulnerability Management security recommendation information'|

## HTTP request

```http
GET /api/recommendations/{id}/machineReferences
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 OK with the list of devices associated with the security recommendation.

## Example

### Request example

Here is an example of the request.

```http
GET https://api.security.microsoft.com/api/recommendations/va-_-google-_-chrome/machineReferences
```

### Response example

Here is an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#MachineReferences",
    "value": [
        {
            "id": "e058770379bc199a9c179ce52a23e16fd44fd2ee",
            "computerDnsName": "niw_pc",
            "osPlatform": "Windows10" "Windows11",
            "rbacGroupName": "GroupTwo"
        }
        ...
    ]
}
```
