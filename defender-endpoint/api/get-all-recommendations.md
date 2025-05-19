---
title: List all recommendations
description: Retrieves a list of all security recommendations affecting the organization.
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

# List all recommendations

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](../microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Business](/defender-business)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

[!include[Prerelease information](../../includes/prerelease.md)]

Retrieves a list of all security recommendations affecting the organization.


## API description

Returns information about all security recommendations affecting the organization.

*URL:* GET:/api/recommendations
<br>Supports [OData V4 queries](https://www.odata.org/documentation/).
<br>OData supported operators:
<br>```$filter``` on:  ```id```, ```productName```, ```vendor```, ```recommendedVersion```, ```recommendationCategory```, ```subCategory```, ```severityScore```, ```remediationType```, ```recommendedProgram```, ```recommendedVendor```, and ```status``` properties.
<br>```$top``` with max value of 10,000.
<br>```$skip```.
<br>See examples at [OData queries with Microsoft Defender for Endpoint](exposed-apis-odata-samples.md).

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

Permission type|Permission|Permission display name
:---|:---|:---
Application|SecurityRecommendation.Read.All|'Read Threat and Vulnerability Management security recommendation information'
Delegated (work or school account)|SecurityRecommendation.Read |'Read Threat and Vulnerability Management security recommendation information'

## HTTP request

```http
GET /api/recommendations
```

## Request headers

Name|Type|Description
:---|:---|:---
Authorization|String|Bearer {token}. **Required**.

## Request body

Empty

## Response

If successful, this method returns 200 OK with the list of security recommendations in the body.

## Example

### Request

Here is an example of the request.

```http
GET https://api.securitycenter.microsoft.com/api/recommendations
```

### Response

Here is an example of the response.

```json
{
    "@odata.context": "https://api.securitycenter.microsoft.com/api/$metadata#Recommendations",
    "value": [
        {
            "id": "va-_-microsoft-_-edge_chromium-based",
            "productName": "edge_chromium-based",
            "recommendationName": "Update Microsoft Edge Chromium-based to version 127.0.2651.74",
            "weaknesses": 762,
            "vendor": "microsoft",
            "recommendedVersion": "127.0.2651.74",
            "recommendedVendor": "",
            "recommendedProgram": "",
            "recommendationCategory": "Application",
            "subCategory": "",
            "severityScore": 0,
            "publicExploit": true,
            "activeAlert": false,
            "associatedThreats": [
                "71d9120e-7eea-4058-889a-1a60bbf7e312"
            ],
            "remediationType": "Update",
            "status": "Active",
            "configScoreImpact": 0,
            "exposureImpact": 1.1744086343876479,
            "totalMachineCount": 261,
            "exposedMachinesCount": 193,
            "nonProductivityImpactedAssets": 0,
            "relatedComponent": "Edge Chromium-based",
            "hasUnpatchableCve": false,
            "tags": [
            "internetFacing"
            ],
            "exposedCriticalDevices": 116
        }
     ]
}
```

## See also

- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Vulnerability management security recommendations](/defender-vulnerability-management/tvm-security-recommendation)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
