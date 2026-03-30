---
title: Get browser extensions permission info
description: Retrieves a list of all permissions required for a browser extension
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
  - Microsoft Defender for Cloud Plan 2
  - Microsoft Defender Vulnerability Management
---

# Get browser extensions permission information

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## API description

Retrieves a list of all the permissions requested by a specific browser extension. This is a static data description and would mainly be used to enhance the data returned by the [Export browser extensions assessment API](get-assessment-browser-extensions.md).

By combining these APIs, you'll be able to see a description of the permissions requested by the browser extensions that come up in the [Export browser extensions assessment](get-assessment-browser-extensions.md) results.

Supports [OData V4 queries](https://www.odata.org/documentation/). OData supported operators:

- `$filter` on the following properties:
  - `id`
  - `name`
  - `description`
  - `cvssV3`
  - `publishedOn`
  - `severity`
  - `updatedOn`
- `$top` with max value of 10,000.
- `$skip`

See examples at [OData queries with Microsoft Defender for Endpoint](exposed-apis-odata-samples.md).

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Software.Read.All|'Read Threat and Vulnerability Management software information'|
|Delegated (work or school account)|Software.Read|'Read Threat and Vulnerability Management software information'|

## HTTP request

```http
GET api/browserextensions/permissionsinfo
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 OK with the list of all permissions requested by a browser extension in the body.

## Example

### Request example

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/browserextensions/permissionsinfo
```

### Response example

Here's an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#BrowserExtension",
    "value": [
{
  "value": [
    {
      "key": "audioCapture",
      "permissionName": "Capture audio from attached mic or webcam",
      "description": "Capture audio from attached mic or webcam. Could be used to listen in on use."
    },
    {
      "key": "app.window.fullscreen.overrideEsc",
      "permissionName": "Prevent escape button from exiting fullscreen",
      "description": "Can prevent escape button from exiting fullscreen."
    },
    {
      "key": "browsingData",
      "permissionName": "Clear browsing data",
      "description": "Clears browsing data which could result in a forensics/logging issues."
    },
    {
      "key": "content_security_policy",
      "permissionName": "Can manipulate default Content Security Policy (CSP)",
      "description": "CSP works as a block/allow listing mechanism for resources loaded or executed by your extensions. Can manipulate default CSP."
    }

            ]
}
    ]
```
