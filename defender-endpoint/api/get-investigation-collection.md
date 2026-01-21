---
title: List Investigations API
description: Use this API to create calls related to get Investigations collection.
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
ms.date: 11/11/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# List Investigations API

## API description

Retrieves a collection of [Investigations](investigation.md).

Supports [OData V4 queries](https://www.odata.org/documentation/). OData supported operators:

- `$filter` on the following properties:
  - `startTime`
  - `id`
  - `state`
  - `machineId`
  - `triggeringAlertId`
- `$stop` with max value of 10,000.
- `$skip`

See examples at [OData queries with Microsoft Defender for Endpoint](exposed-apis-odata-samples.md)

## Limitations

- Maximum page size is 10,000.
- Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials:
 - The user needs to have at least the following role permission: `View Data`. For more information, see: [Create and manage roles](../user-roles.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Alert.ReadWrite.All|`Read and write all alerts` |
|Delegated (work or school account)|Alert.ReadWrite|`Read and write alerts` |

## HTTP request

```http
GET https://api.security.microsoft.com/api/investigations
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200, Ok response code with a collection of [Investigations](investigation.md) entities.

## Example

### Request example

Here's an example of a request to get all investigations:

```http
GET https://api.security.microsoft.com/api/investigations
```

### Response example

Here's an example of the response:

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#Investigations",
    "value": [
        {
            "id": "63017",
            "startTime": "2020-01-06T14:11:34Z",
            "endTime": null,
            "state": "Running",
            "cancelledBy": null,
            "statusDetails": null,
            "machineId": "a69a22debe5f274d8765ea3c368d00762e057b30",
            "computerDnsName": "desktop-gtrcon0",
            "triggeringAlertId": "da637139166940871892_-598649278"
        }
        ...
    ]
}
```
