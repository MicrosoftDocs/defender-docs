---
title: Get IP statistics API
description: Get the latest stats for your IP using Microsoft Defender for Endpoint.
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
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Get IP statistics API

## API description

Retrieves the statistics for the given IP.
This statistic information is based on data from the past 30 days.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.
- Maximum Value for Lookbackhours is 720 Hours(30days).

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'View Data'. For more information, see [Create and manage roles](../user-roles.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Ip.Read.All|'Read IP address profiles'|
|Delegated (work or school account)|Ip.Read.All|'Read IP address profiles'|

## HTTP request

```http
GET /api/ips/{ip}/stats
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request URI parameters

|Name|Type|Description|
|---|---|---|
|lookBackHours|Int32|Defines the hours we search back to get the statistics. Defaults to 30 days. **Optional**.|

## Request body

Empty

## Response

If successful and ip exists - 200 OK with statistical data in the body. IP is valid but doesn't exist - organizationPrevalence 0, IP is invalid - HTTP 400.

## Example

### Request example

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/ips/10.209.67.177/stats?lookBackHours=48
```

### Response example

Here's an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#microsoft.windowsDefenderATP.api.InOrgIPStats",
    "ipAddress": "10.209.67.177",
    "organizationPrevalence": 63515,
    "orgFirstSeen": "2017-07-30T13:36:06Z",
    "orgLastSeen": "2017-08-29T13:32:59Z"
}
```

|Name|Description|
|---|---|
|Organization prevalence|The distinct count of devices that opened network connection to this IP.|
|Org first seen|The first connection for this IP in the organization.|
|Org last seen|The last connection for this IP in the organization.|
