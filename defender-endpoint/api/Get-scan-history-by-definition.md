---
title: Get scan history by definition
description: Learn how to use the get scan history by definition API
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
ms.date: 11/10/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender Vulnerability Management
  - Microsoft Defender for Business
---

# Get scan history by definition

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## API description 

Retrieves a list of the scan history by definitions.

Supports [OData V4 queries](https://www.odata.org/documentation/). OData supported operators:

- `$top` with max value of 10,000.
- `$skip`

For an example of OData operation usage, see [example $top request](#example-top-request).

## Limitations

Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials, to view data, the user needs to have at least the following role permission: `ViewData` or `TvmViewData` . For more information, see: [Create and manage roles](../user-roles.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.Read.All| Read all scan information.|
|Delegated (work or school account)|Machine.Read.All|Read all scan information.|

## HTTP request

```http
POST api/DeviceAuthenticatedScanDefinitions/GetScanHistoryByScanDefinitionId
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
|ScanDefinitionIds|String|The scan Id. **Required**.|

## Response

If successful, this method returns 200 - OK response code with a list of the scan history by definition.

## Example request

Here's an example of the request.

```http
POST https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions/GetScanHistoryByScanDefinitionId
```

```json
{
    "ScanDefinitionIds": ["4ad8d463-6b3a-4894-b42a-a2de9ea0a8ae", "60c4aa57-c573-4488-8d18-230914792a92", "c6220f67-2cad-4ba3-a2fa-7ded6384da56"]
}
```

## Response example

```json
{
"@odata.context": "https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions/GetScanHistoryByScanDefinitionId",
    "value": [
    {
    "ScanDefinitionIds": "4ad8d463-6b3a-4894-b42a-a2de9ea0a8ae",
    "LastScanned": "2022-12-20T11:14:24.5561791Z",
    "ScanStatus": "Partial Success",
    "ScannerId": "625431694b7d2ca9d07e77ca1b029ef216bebb6d"
    },
    {
    "ScanDefinitionIds": "60c4aa57-c573-4488-8d18-230914792a92",
    "LastScanned": "2022-11-17T15:13:24.5561791Z",
    "ScanStatus": "Partial Success",
    "ScannerId": "625431694b7d2ca9d07e77ca1b029ef216bebb6d"
    },
    {
    "ScanDefinitionIds": "c6220f67-2cad-4ba3-a2fa-7ded6384da56",
    "LastScanned": "2022-11-10T18:15:24.5561791Z",
    "ScanStatus": "Partial Success",
    "ScannerId": "625431694b7d2ca9d07e77ca1b029ef216bebb6d"
    },
   ]
}
```

## Example $top request

Here's an example of a request that returns only 1 session.

```http
POST https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions/GetScanHistoryByScanDefinitionId?$top=1
```

##  $top Response example

```json
{
"@odata.context": "https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions/GetScanHistoryByScanDefinitionId",
    "value": [
    {
    "ScanDefinitionIds": "4ad8d463-6b3a-4894-b42a-a2de9ea0a8ae",
    "LastScanned": "2022-12-20T11:14:24.5561791Z",
    "ScanStatus": "Partial Success",
    "ScannerId": "625431694b7d2ca9d07e77ca1b029ef216bebb6d"
    },
 ]
}
```
