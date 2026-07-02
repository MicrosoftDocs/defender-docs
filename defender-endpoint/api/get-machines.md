---
title: List machines API
description: Learn how to use the List machines API to retrieve a collection of machines that have communicated with Microsoft Defender for Endpoint cloud.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.topic: reference
ms.collection:
- m365-security
- tier3
- must-keep
ms.subservice: reference
ms.custom: api
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# List machines API

## API description

Retrieves a collection of [Machines](machine.md) that have communicated with Microsoft Defender for Endpoint.

Supports [OData V4 queries](https://www.odata.org/documentation/). OData supported operators:

- `$filter` on the following properties:
  - `computerDnsName`
  - `id`
  - `version`
  - `deviceValue`
  - `aadDeviceId`
  - `machineTags`
  - `lastSeen`
  - `exposureLevel`
  - `onboardingStatus`
  - `lastIpAddress`
  - `healthStatus`
  - `osPlatform`
  - `riskScore`
  - `rbacGroupId`
- `$top` with max value of 10,000.
- `$skip`

See examples at [OData queries with Defender for Endpoint](exposed-apis-odata-samples.md)

## Limitations

- You can get devices last seen according to your configured retention period.
- Maximum page size is 10,000.
- Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials, the user needs to have at least the following role permission: `View Data`. For more information, see: [Create and manage roles](../user-roles.md).

Responses include only devices that the user has access to, based on device group settings. For more information, see: [Create and manage device groups](../machine-groups.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.ReadWrite.All|'Read and write all machine information'|
|Delegated (work or school account)|Machine.ReadWrite|'Read and write machine information'|

## HTTP request

```http
GET https://api.security.microsoft.com/api/machines
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, and the machines exist, you see `200 OK` with list of [machine](machine.md) entities in the body. If there are no recent machines, you see `404 Not Found`.

## Example

### Request example

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/machines
```

### Response example

Here's an example of the response.

```http
HTTP/1.1 200 OK
Content-type: application/json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#Machines",
    "value": [
        {
            "id": "1e5bc9d7e413ddd7902c2932e418702b84d0cc07",
            "computerDnsName": "mymachine1.contoso.com",
            "firstSeen": "2018-08-02T14:55:03.7791856Z",
            "lastSeen": "2018-08-02T14:55:03.7791856Z",
            "osPlatform": "Windows10" "Windows11",
            "version": "1709",
            "osProcessor": "x64",
            "lastIpAddress": "172.17.230.209",
            "lastExternalIpAddress": "167.220.196.71",
            "osBuild": 18209,
            "healthStatus": "Active",
            "rbacGroupId": 140,
            "rbacGroupName": "The-A-Team",
            "riskScore": "Low",
            "exposureLevel": "Medium",
            "isAadJoined": true,
            "aadDeviceId": "80fe8ff8-2624-418e-9591-41f0491218f9",
            "machineTags": [ "test tag 1", "test tag 2" ]
        }
        ...
    ]
}
```
