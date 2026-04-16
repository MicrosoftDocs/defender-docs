---
title: Add, update, or delete a scan definition
description: Learn how to use the add, update, or delete scan definitions.
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
ms.date: 11/10/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender Vulnerability Management
---

# Add, update, or delete a scan definition

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## API description

API to add, update, or delete an authenticated scan.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

- You can post on machines last seen according to your configured retention period.

## Permissions

When obtaining a token using user credentials:

- To view data, the user needs to have at least the following role permission: `ViewData` or `TvmViewData` . For more information, see: [Create and manage roles](../user-roles.md)
- To edit data, the user needs to have at least the following role permission: `ManageSecurity` . For more information, see: [Create and manage roles](../user-roles.md)

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Defender for Endpoint APIs](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.ReadWrite.All|Read and write all scan information.|
|Delegated (work or school account)|Machine.Read.Write|Read and write all scan information.|

## HTTP request

```http
POST https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions
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
|`scanType`|Enum|The type of scan. Possible value is: "Network". **Required**.|
|`scanName`|String|Name of the scan. **Required**.|
|`isActive`|Boolean|Status of whether the scan actively running. **Required**.|
|`target`|String|A comma separated list of targets to scan, either IP addresses or hostnames. **Required**.|
|`intervalInHours`|Int|The interval at which the scan runs. **Required**.|
|`targetType`|String|The target type in the target field. Possible types are "IP Address" or "Hostname". Default value is IP Address. **Required**.|
|`scannerAgent`|Object|machine Id. **Required**.|
|`scanAuthenticationParams`|Object|An object representing the authentication parameters, see [Authentication parameters object properties](./get-authenticated-scan-properties.md#authentication-parameters-object-properties) for expected fields. This property is mandatory when creating a new scan and is optional when updating a scan.|

## Response

If successful, this method returns 200 - Ok response code and the new or updated scan definition in the response body.

## Example request to add a new scan

Here's an example of a request that adds a new scan.

```http
POST https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions
```

```json
 {
"scanType": "Network",
"scanName": "Test Network scan",
"isActive": true,
"target": "127.0.0.1",
"intervalInHours": 1,
"targetType": "Ip",
"scannerAgent": {
    "machineId": "eb663a27ae9d032f61bc268a79eedf14c4b90f77"
},
"scanAuthenticationParams": {
    "@odata.type": "#microsoft.windowsDefenderATP.api.SnmpAuthParams",
    "type": "AuthPriv",
    "username": "username",
    "authProtocol": "authProtocol",
    "authPassword": "authPassword",
    "privProtocol": "privProtocol",
    "privPassword": "privPassword",
    "communityString": "community-string"
    }
}
```

## Example response

Here's an example of the response.

```json
 {
  "@odata.context": "https://api.security.microsoft.com/api/$metadata#DeviceAuthenticatedScanDefinitions/$entity",
  "id": "d14cefe1-0301-488c-ad17-a86c428c3727",
  "scanType": "Network",
  "scanName": "Test Network scan",
  "isActive": true,
  "target": "127.0.0.1",
  "orgId": "0335a792-18d2-424b-aeed-559567054570",
  "intervalInHours": 1,
  "createdBy": "username@test.com",
  "targetType": "Ip",
  "scanAuthenticationParams": null,
  "scannerAgent": {
    "id": "0335a792-18d2-424b-aeed-559567054570_ eb663a27ae9d032f61bc268a79eedf14c4b90f77",
    "machineId": "eb663a27ae9d032f61bc268a79eedf14c4b90f77",
    "machineName": "DESKTOP-TEST",
    "lastSeen": "2025-12-18T14:04:34.2258259Z",
    "assignedApplicationId": "f23c76e1-a6b5-4f77-9468-3a57916c910e",
    "scannerSoftwareVersion": "9.3.15.19",
    "lastCommandExecutionTimestamp": "2025-12-18T13:29:48Z",
    "mdeClientVersion": null
  },
  "latestScan": {
    "status": null,
    "failureReason": null,
    "executionDateTime": null
  },
  "advancedActiveConfiguration": null
}
```

## Example request to update a scan

Here's an example of a request that updates a scan.

```http
PATCH  https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions/aaaabbbb-0000-cccc-1111-dddd2222eeee
```

```json
{
"scanType": "Network",
"scanName": "Test Network scan",
"isActive": true,
"target": "127.0.0.1,127.0.0.2",
"intervalInHours": 1,
"targetType": "Ip",
"scannerAgent": {
    "machineId": "eb663a27ae9d032f61bc268a79eedf14c4b90f77"
},
"scanAuthenticationParams": {
    "@odata.type": "#microsoft.windowsDefenderATP.api.SnmpAuthParams",
    "type": "AuthPriv",
    "username": "username",
    "authProtocol": "authProtocol",
    "authPassword": "authPassword",
    "privProtocol": "privProtocol",
    "privPassword": "privPassword",
    "communityString": "community-string"
    }
}
```

## Response example

Here's an example of the response.

```json
{
  "@odata.context": "https://api.security.microsoft.com/api/$metadata#DeviceAuthenticatedScanDefinitions/$entity%22",
  "id": "d14cefe1-0301-488c-ad17-a86c428c3727",
  "scanType": "Network",
  "scanName": "Test Network scan",
  "isActive": true,
  "target": "127.0.0.1,127.0.0.2",
  "orgId": "0335a792-18d2-424b-aeed-559567054570",
  "intervalInHours": 1,
  "createdBy": "username@test.com",
  "targetType": "Ip",
  "scanAuthenticationParams": null,
  "scannerAgent": {
    "id": "0335a792-18d2-424b-aeed-559567054570_ eb663a27ae9d032f61bc268a79eedf14c4b90f77",
    "machineId": "eb663a27ae9d032f61bc268a79eedf14c4b90f77",
    "machineName": "DESKTOP-TEST",
    "lastSeen": "2025-12-18T14:34:39.3296383Z",
    "assignedApplicationId": "f23c76e1-a6b5-4f77-9468-3a57916c910e",
    "scannerSoftwareVersion": "9.3.15.19",
    "lastCommandExecutionTimestamp": "2025-12-18T14:33:48Z",
    "mdeClientVersion": null
  },
  "latestScan": {
    "status": "Fail",
    "failureReason": null,
    "executionDateTime": "2025-12-18T14:33:49.413596Z"
  },
  "advancedActiveConfiguration": null
}

```

## Example request to delete scans

Here's an example of a request that deletes scans.

```http
POST https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions/BatchDelete
```

```json
{
  "ScanDefinitionIds": ["td32f17af-5cc2-4e4e-964a-4c4ef7d216e2", "ab32g20af-5dd2-4a5e-954a-4c4ef7d216e2"],
}
```
