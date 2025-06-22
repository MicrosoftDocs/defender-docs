---
title: Get the device secure score
description: Retrieves the organizational device secure score.
ms.service: defender-endpoint
author: denisebmsft
ms.author: deniseb
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

# Get device secure score

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](../microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

Retrieves your [Microsoft Secure Score for Devices](/defender-vulnerability-management/tvm-microsoft-secure-score-devices). A higher Microsoft Secure Score for Devices means your endpoints are more resilient from cybersecurity threat attacks.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

Permission type|Permission|Permission display name
:---|:---|:---
Application|Score.Read.All|'Read Threat and Vulnerability Management score'
Delegated (work or school account)|Score.Read|'Read Threat and Vulnerability Management score'

## HTTP request

```http
GET /api/configurationScore
```

## Request headers

Name|Type|Description
:---|:---|:---
Authorization|String|Bearer {token}. **Required**.

## Request body

Empty

## Response

If successful, this method returns 200 OK, with the device secure score data in the response body.

## Example

### Request example

Here is an example of the request.

```http
GET https://api.securitycenter.microsoft.com/api/configurationScore
```

### Response example

Here is an example of the response.

> [!NOTE]
> The response list shown here may be truncated for brevity.

```json
{
    "@odata.context": "https://api.securitycenter.microsoft.com/api/$metadata#ConfigurationScore/$entity",
    "time": "2019-12-03T09:15:58.1665846Z",
    "score": 340
}
```

## See also

- [OData queries with Microsoft Defender for Endpoint](exposed-apis-odata-samples.md)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
