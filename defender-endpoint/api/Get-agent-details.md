---
title: Get scan agent by ID
description: Learn how to use the "Get-Agent-Details" API.
keywords: apis, graph api, supported apis, agent details, definition
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
ms.date: 11/10/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender Vulnerability Management
---

# Get scan agent ID

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## API description

Retrieves the details for a specified agent by its ID.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials:

- To view data the user needs to have at least the following role permission: `ViewData` or `TvmViewData`. For more information, see: [Create and manage roles](../user-roles.md)

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.Read.All|Read all scan information.|
|Delegated (work or school account)|Machine.Read.All|Read all scan information.|

## HTTP request

```http
GET /api/DeviceAuthenticatedScanAgents
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 - OK response code with the details of the specified agent.

## Example request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/DeviceAuthenticatedScanAgents/7f3d76a6976818553e996875dc91f55df6b26625
```

## Response example

```json
{
"@odata.context": "https://api.security.microsoft.com/api/$metadata#DeviceAuthenticatedScanAgents/$entity",
    "value": [
    {
    "id": "47df41a0c-asad-4fd6d3-bbea-a93dbc0bfcaa_4edd75b2407a5b64d704b4e53d74f15",
    "machineId": "4ejh675b240118fbehiuiy5b64d704b4e53d15",
    "lastSeen": "2022-05-08T12:18:41.538203Z",
    "computerDnsName": "TEST_DOMAIN",
    "AssignedApplicationId": "9E0FA0EB-0A51-4357-9C87-C21BFBE07571",
    "ScannerSoftwareVersion": "7.1.1",
    "LastCommandExecutionTimestamp": "2022-05-08T12:18:41.538203Z",
    "mdeClientVersion": "10.8295.22621.1195"
    },
   ]
}

```
