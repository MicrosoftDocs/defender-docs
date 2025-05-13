---
title: Get recommendation by Id
description: Retrieves a security recommendation by its ID.
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
ms.date: 12/18/2020
---

# Get recommendation by ID

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](../microsoft-defender-endpoint.md)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

[!include[Prerelease information](../../includes/prerelease.md)]

Retrieves a security recommendation by its ID.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

Permission type|Permission|Permission display name
:---|:---|:---
Application|SecurityRecommendation.Read.All|'Read Threat and Vulnerability Management security recommendation information'
Delegated (work or school account)|SecurityRecommendation.Read|'Read Threat and Vulnerability Management security recommendation information'

## HTTP request

```http
GET /api/recommendations/{id}
```

## Request headers

Name|Type|Description
:---|:---|:---
Authorization|String|Bearer {token}. **Required**.

## Request body

Empty

## Response

If successful, this method returns 200 OK with the security recommendations in the body.

## Example

### Request example

Here's an example of the request.

```http
GET https://api.securitycenter.microsoft.com/api/recommendations/va-_-google-_-chrome
```

### Response example

Here's an example of the response.

```json
{
    "@odata.context": "https://api.securitycenter.microsoft.com/api/$metadata#Recommendations/$entity",
    "id": "va-_-google-_-chrome",
    "productName": "chrome",
    "recommendationName": "Update Chrome",
    "weaknesses": 38,
    "vendor": "google",
    "recommendedVersion": "",
    "recommendationCategory": "Application",
    "subCategory": "",
    "severityScore": 0,
    "publicExploit": false,
    "activeAlert": false,
    "associatedThreats": [],
    "remediationType": "Update",
    "status": "Active",
    "configScoreImpact": 0,
    "exposureImpact": 3.9441860465116285,
    "totalMachineCount": 6,
    "exposedMachinesCount": 5,
    "nonProductivityImpactedAssets": 0,
    "relatedComponent": "Chrome",
    "tags": [
    "internetFacing"
    ],
    "exposedCriticalDevices": 116
}
```

## Related topics

- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Defender Vulnerability Management security recommendation](/defender-vulnerability-management/tvm-security-recommendation)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
