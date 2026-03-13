---
title: List all recommendations
description: Retrieves a list of all security recommendations affecting the organization.
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
  - Microsoft Defender for Business
---

# List all recommendations

Retrieves a list of all security recommendations affecting the organization.

## API description

Returns information about all security recommendations affecting the organization.

*URL:* GET:/api/recommendations:

- Supports [OData V4 queries](https://www.odata.org/documentation/). OData supported operators:
  - `$filter` on the following properties:
    - `id`
    - `productName`
    - `vendor`
    - `recommendedVersion`
    - `recommendationCategory`
    - `subCategory`
    - `severityScore`
    - `remediationType`
    - `recommendedProgram`
    - `recommendedVendor`
    - `status`
  - `$top` with max value of 10,000.
  - `$skip`

See examples at [OData queries with Microsoft Defender for Endpoint](exposed-apis-odata-samples.md).

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|SecurityRecommendation.Read.All|'Read Threat and Vulnerability Management security recommendation information'|
|Delegated (work or school account)|SecurityRecommendation.Read|'Read Threat and Vulnerability Management security recommendation information'|

## HTTP request

```http
GET /api/recommendations
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 OK with the list of security recommendations in the body.

## Example

### Request

Here is an example of the request.

```http
GET https://api.security.microsoft.com/api/recommendations
```

### Response

Here is an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#Recommendations",
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
