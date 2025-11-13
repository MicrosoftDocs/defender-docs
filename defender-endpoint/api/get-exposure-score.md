---
title: Get exposure score
description: Retrieves the organizational exposure score.
ms.service: defender-endpoint
ms.author: kesharab
author: KesemSharabi
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

# Get exposure score

[!include[Prerelease information](../../includes/prerelease.md)]

Retrieves the organizational exposure score.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

Permission type|Permission|Permission display name
---|---|---
Application|Score.Read.All|'Read Threat and Vulnerability Management score'
Delegated (work or school account)|Score.Read|'Read Threat and Vulnerability Management score'

## HTTP request

```http
GET /api/exposureScore
```

## Request headers

Name|Type|Description
---|---|---
Authorization|String|Bearer {token}. **Required**.

## Request body

Empty

## Response

If successful, this method returns 200 OK, with the exposure data in the response body.

## Example

### Request

Here is an example of the request.

```http
GET https://api.security.microsoft.com/api/exposureScore
```

### Response

Here is an example of the response.

> [!NOTE]
> The response list shown here may be truncated for brevity.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#ExposureScore/$entity",
    "time": "2019-12-03T07:23:53.280499Z",
    "score": 33.491554051195706
}
```

## Related articles

- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Defender Vulnerability Management exposure score](/defender-vulnerability-management/tvm-exposure-score)


