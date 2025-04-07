---
title: Get missing KBs by device ID
description: Retrieves missing security updates by device ID
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

# Get missing KBs by device ID

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](../microsoft-defender-endpoint.md)
- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

> Want to experience Microsoft Defender Vulnerability Management? Learn more about how you can sign up to the [Microsoft Defender Vulnerability Management public preview trial](/defender-vulnerability-management/get-defender-vulnerability-management).

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

Retrieves missing KBs (security updates) by device ID

## HTTP request

```http
GET /api/machines/{machineId}/getmissingkbs
```
## Permissions

The following permission is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md).

Permission type | Permission | Permission display name
:---|:---|:---
Application | Software.Read.All | 'Read Threat and Vulnerability Management Software information'

## Request header

Name|Type|Description
:---|:---|:---
Authorization | String | Bearer {token}. **Required**.

## Request body

Empty

## Response

If successful, this method returns 200 OK, with the specified device missing kb data in the body.

## Example

### Request

Here is an example of the request.

```http
GET https://api.securitycenter.microsoft.com/api/machines/2339ad14a01bd0299afb93dfa2550136057bff96/getmissingkbs 
```

### Response

Here is an example of the response.


```json
{
    "@odata.context": "https://api.securitycenter.microsoft.com/api/$metadata#Collection(microsoft.windowsDefenderATP.api.PublicProductFixDto)",
    "value": [
        {
            "id": "4540673",
            "name": "March 2020 Security Updates",
            "productsNames": [
                "windows_10",
                "edge",
                "internet_explorer"
            ],
            "url": "https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4540673",
            "machineMissedOn": 1,
            "cveAddressed": 97
        }
        ]
}
```

## Related topics

- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Defender Vulnerability Management software inventory](/defender-vulnerability-management/tvm-software-inventory)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
