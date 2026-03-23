---
title: Submit or Update Indicator API
description: Learn how to use the Submit or Update Indicator API to submit or update a new Indicator entity in Microsoft Defender for Endpoint.
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
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Submit or Update Indicator API

## API description

Submits or Updates new [Indicator](ti-indicator.md) entity.

CIDR notation for IPs isn't supported.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.
- There's a limit of 15,000 active indicators per tenant.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Get started](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Ti.ReadWrite.All|`Read and write All Indicators`|
|Delegated (work or school account)|Ti.ReadWrite|`Read and write Indicators`|

## HTTP request

```http
POST https://api.security.microsoft.com/api/indicators
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|
|Content-Type|string|application/json. **Required**.|

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|indicatorValue|String|Identity of the [Indicator](ti-indicator.md) entity. **Required**|
|indicatorType|Enum|Type of the indicator. Possible values are: `FileSha1`, `FileMd5`, `CertificateThumbprint`, `FileSha256`, `IpAddress`, `DomainName`, and `Url`. **Required**|
|action|Enum|The action that is taken if the indicator is discovered in the organization. Possible values are: `Alert`, `Warn`, `Block`, `Audit`, `BlockAndRemediate`, `AlertAndBlock`, and `Allowed`. **Required**. The `GenerateAlert` parameter must be set to `TRUE` when creating an action with `Audit`.|
|application|String|A user-friendly name for the content blocked by the indicator. If specified, this text will be shown in the blocking notification in place of the blocked filename or domain. This field only works for new indicators; it doesn't update the value on an existing indicator. **Optional**|
|title|String|Indicator alert title. **Required**|
|description|String|Description of the indicator. **Required**|
|expirationTime|DateTimeOffset|The expiration time of the indicator. **Optional**|
|severity|Enum|The severity of the indicator. Possible values are: `Informational`, `Low`, `Medium`, and `High`. **Optional**|
|recommendedActions|String|TI indicator alert recommended actions. **Optional**|
|rbacGroupNames|String|Comma-separated list of RBAC group names the indicator would be applied to. **Optional**|
|educateUrl|String|Custom notification/support URL. Supported for Block and Warn action types for URL indicators. **Optional**|
|generateAlert|Enum|**True** if alert generation is required, **False** if this indicator shouldn't generate an alert.|

## Response

- If successful, this method returns 200 - OK response code and the created / updated [Indicator](ti-indicator.md) entity in the response body.
- If not successful: this method return 400 - Bad Request. Bad request usually indicates incorrect body.

## Example

### Request

Here's an example of the request.

```http
POST https://api.security.microsoft.com/api/indicators
```

```json
{
    "indicatorValue": "220e7d15b011d7fac48f2bd61114db1022197f7f",
    "indicatorType": "FileSha1",
    "title": "test",
    "application": "demo-test",
    "expirationTime": "2020-12-12T00:00:00Z",
    "action": "AlertAndBlock",
    "severity": "Informational",
    "description": "test",
    "recommendedActions": "nothing",
    "rbacGroupNames": ["group1", "group2"]
}
```
