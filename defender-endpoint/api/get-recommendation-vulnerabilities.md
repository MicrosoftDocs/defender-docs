---
title: List vulnerabilities by recommendation
description: Retrieves a list of vulnerabilities associated with the security recommendation.
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
ms.date: 11/13/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# List vulnerabilities by recommendation

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

Retrieves a list of vulnerabilities associated with the security recommendation.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Vulnerability.Read.All|'Read Threat and Vulnerability Management security recommendation information'|
|Delegated (work or school account)|Vulnerability.Read|'Read Threat and Vulnerability Management security recommendation information'|

## HTTP request

```http
GET /api/recommendations/{id}/vulnerabilities
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 OK, with the list of vulnerabilities associated with the security recommendation.

## Example

### Request example

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/recommendations/va-_-google-_-chrome/vulnerabilities
```

### Response example

Here is an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#Collection(Analytics.Contracts.PublicAPI.PublicVulnerabilityDto)",
    "value": [
        {
            "id": "CVE-2019-13748",
            "name": "CVE-2019-13748",
            "description": "Insufficient policy enforcement in developer tools in Google Chrome prior to 79.0.3945.79 allowed a local attacker to obtain potentially sensitive information from process memory via a crafted HTML page.",
            "severity": "Medium",
            "cvssV3": 6.5,
            "exposedMachines": 0,
            "publishedOn": "2019-12-10T00:00:00Z",
            "updatedOn": "2019-12-16T12:15:00Z",
            "publicExploit": false,
            "exploitVerified": false,
            "exploitInKit": false,
            "exploitTypes": [],
            "exploitUris": []
        }
        ...
     ]
}
```
