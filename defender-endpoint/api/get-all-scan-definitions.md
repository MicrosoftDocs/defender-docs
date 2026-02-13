---
title: Get scan definitions
description: Learn how to use the Get all scan definition APIs
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
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender Vulnerability Management
---

# Get scan definitions

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## API description

Retrieves a list of all scan definitions.

## Limitations

Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials, to view data, the user needs to have at least the following role permission: `ViewData` or `TvmViewData` . For more information, see: [Create and manage roles](../user-roles.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.Read.All|Read all scan information.|
|Delegated (work or school account)|Machine.Read.All|Read all scan information.|

## HTTP request

```http
GET /api/DeviceAuthenticatedScanDefinitions
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 - OK response code with a list of authenticated scan definitions.

## Example

### Request example

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions
```

### Response example

Here's an example of the response.

```json
{
"@odata.context": "https://api.security.microsoft.com/api/$metadata#DeviceAuthenticatedScanDefinitions",
    "value": [
    {
    "id": "60c4aa57-ioi3-1290-7ff6-09fr14792a92",
    "scanType": "Network",
    "scanName": "Network-test-scan",
    "isActive": true,
    "target": "127.0.0.1",
    "orgId": "asdf781a0c-792d-46d3-bbea-a93dbc0bfcaa",
    "intervalInHours": 1,
    "createdBy": "test@contoso.com",
    "targetType": "Ip",
    "scanAuthenticationParams": {
    "@odata.type": "#microsoft.windowsDefenderATP.api.SnmpAuthParams"",
        type": "AuthPriv",
        "username": "username",
        "authProtocol": "authProtocol",
        "authPassword": "authPassword",
        "privProtocol": "privProtocol",
        "privPassword": "privPassword",
        "communityString": "community-string"
            },
    "scannerAgent": {
        "id": "4asdff0c-3344-46d3-bxxe-a9334rtgfcaa_eb6df89dfdf9032f61eedf14c4b90f77",
        "machineId": "eb663a27676kjhj61bc268a79eedf14c4t78u7",
        "machineName": "DESKTOP-Test",
        "lastSeen": "2022-12-21T14:34:19.5698988Z",
        "AssignedApplicationId": "9E0FA0EB-0A51-4357-9C87-C21BFBE07571",
        "ScannerSoftwareVersion": "7.1.1",
        "LastCommandExecutionTimestamp": "2022-12-21T14:34:19.5698988Z",
        "mdeClientVersion": "10.8295.22621.1195"
                },
    "latestScan": {
    "status": "Fail",
    "failureReason": null,
    "executionDateTime": "2022-12-21T14:35:55.6702703Z"
        }
    }
    ]
}
```
