---
title: Import Indicators API
description: Learn how to use the Import batch of Indicator API in Microsoft Defender for Endpoint.
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
ms.custom: api
ms.subservice: reference
search.appverid: met150
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Import Indicators API

## API description

Submits or Updates batch of [Indicator](ti-indicator.md) entities.

CIDR notation for IPs isn't supported.

## Limitations

- Rate limitations for this API are 30 calls per minute.
- There's a limit of 15,000 active [Indicators](ti-indicator.md) per tenant.
- Maximum batch size for one API call is 500.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Get started](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Ti.ReadWrite.All|`Read and write All Indicators`|
|Delegated (work or school account)|Ti.ReadWrite|`Read and write Indicators`|

## HTTP request

```http
POST https://api.security.microsoft.com/api/indicators/import
```

## Request headers

| Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|
|Content-Type|string|application/json. **Required**.|

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|Indicators|List<[Indicator](ti-indicator.md)>|List of [Indicators](ti-indicator.md). **Required** |

## Response

- If successful, this method returns 200 - OK response code with a list of import results per indicator, see the following example.
- If not successful: this method return 400 - Bad Request. Bad request usually indicates incorrect body.

## Example

### Request example

Here's an example of the request.

```http
POST https://api.security.microsoft.com/api/indicators/import
```

```json
{
    "Indicators":
    [
        {
            "indicatorValue": "220e7d15b011d7fac48f2bd61114db1022197f7f",
            "indicatorType": "FileSha1",
            "title": "demo",
            "application": "demo-test",
            "expirationTime": "2021-12-12T00:00:00Z",
            "action": "Alert",
            "severity": "Informational",
            "description": "demo2",
            "recommendedActions": "nothing",
            "rbacGroupNames": ["group1", "group2"]
        },
        {
            "indicatorValue": "2233223322332233223322332233223322332233223322332233223322332222",
            "indicatorType": "FileSha256",
            "title": "demo2",
            "application": "demo-test2",
            "expirationTime": "2021-12-12T00:00:00Z",
            "action": "Alert",
            "severity": "Medium",
            "description": "demo2",
            "recommendedActions": "nothing",
            "rbacGroupNames": []
        }
    ]
}
```

### Response example

Here's an example of the response.

```json
{
    "value": [
        {
            "id": "2841",
            "indicator": "220e7d15b011d7fac48f2bd61114db1022197f7f",
            "isFailed": false,
            "failureReason": null
        },
        {
            "id": "2842",
            "indicator": "2233223322332233223322332233223322332233223322332233223322332222",
            "isFailed": false,
            "failureReason": null
        }
    ]
}
```
