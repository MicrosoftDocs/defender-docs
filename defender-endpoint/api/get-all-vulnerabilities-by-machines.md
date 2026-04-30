---
title: Get all vulnerabilities by machine and software
description: Retrieves a list of all the vulnerabilities affecting the organization by Machine and Software
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
ms.date: 11/16/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# List vulnerabilities by machine and software

Retrieves a list of all the vulnerabilities affecting the organization per [machine](machine.md) and [software](software.md).

This API can be used for [Power BI integration](api-power-bi.md).

- If the vulnerability has a fixing KB, it will appear in the response.
- Supports [OData V4 queries](https://www.odata.org/documentation/). OData supported operators:
  - `$filter`is supported on the following properties:
    - `id`
    - `cveId`
    - `machineId`
    - `fixingKbId`
    - `productName`
    - `productVersion`
    - `severity`
    - `productVendor`
  - `$stop` with max value of 10,000.
  - `$skip`

  See examples at [OData queries with Microsoft Defender for Endpoint](exposed-apis-odata-samples.md).

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Vulnerability.Read.All|'Read Threat and Vulnerability Management vulnerability information'|
|Delegated (work or school account)|Vulnerability.Read|'Read Threat and Vulnerability Management vulnerability information'|

## HTTP request

```http
GET /api/vulnerabilities/machinesVulnerabilities
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 OK with the list of vulnerabilities in the body.

## Example

### Request example

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/vulnerabilities/machinesVulnerabilities
```

### Response example

Here's an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#Collection(microsoft.windowsDefenderATP.api.PublicAssetVulnerabilityDto)",
    "value": [
        {
            "id": "5afa3afc92a7c63d4b70129e0a6f33f63a427e21-_-CVE-2020-6494-_-microsoft-_-edge_chromium-based-_-81.0.416.77-_-",
            "cveId": "CVE-2020-6494",
            "machineId": "5afa3afc92a7c63d4b70129e0a6f33f63a427e21",
            "fixingKbId": null,
            "productName": "edge_chromium-based",
            "productVendor": "microsoft",
            "productVersion": "81.0.416.77",
            "severity": "Low"
        },
        {
            "id": "7a704e17d1c2977c0e7b665fb18ae6e1fe7f3283-_-CVE-2016-3348-_-microsoft-_-windows_server_2012_r2-_-6.3.9600.19728-_-3185911",
            "cveId": "CVE-2016-3348",
            "machineId": "7a704e17d1c2977c0e7b665fb18ae6e1fe7f3283",
            "fixingKbId": "3185911",
            "productName": "windows_server_2012_r2",
            "productVendor": "microsoft",
            "productVersion": "6.3.9600.19728",
            "severity": "Low"
        },
        ...
    ]

}
```
