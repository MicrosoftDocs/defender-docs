---
title: Upload files to the live response library
description: Learn how to upload a file to the live response library.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint
---

# Upload files to the live response library

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## API description

Upload file to live response library.

> [!TIP]
> You can also upload live response files from the [Library management](../configure-libraries-live-response.md) page in the Microsoft Defender portal.

## Limitations

- File max size limitation is 20MB.
- Rate limitations for this API are 100 calls per minute and 1500 calls per
    hour.

## Permissions

One of the following permissions is required to call this API. To learn more,
including how to choose permissions, see [Get started](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Library.Manage|Manage live response library|
|Delegated (work or school account)|Library.Manage|Manage live response library|

## HTTP request

Upload

```HTTP
POST https://api.security.microsoft.com/api/libraryfiles
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer\<token>. Required.|
|Content-Type|string|multipart/form-data. Required.|

## Request body

In the request body, supply a form-data object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|File|File content|The file to be uploaded to live response library.Required|
|Description|String|Description of the file.|
|ParametersDescription|String|(Optional) Parameters required for the script to run. Default value is an empty string.|
|OverrideIfExists|Boolean|(Optional) Whether to override the file if it already exists. Default value is an empty string.|

## Response

- If successful, this method returns 200 - OK response code and the uploaded
    live response library entity in the response body.

- If not successful: this method returns 400 - Bad Request.
    Bad request usually indicates incorrect body.

## Example

Request

Here is an example of the request using curl.

```CURL
curl -X POST https://api.security.microsoft.com/api/libraryfiles -H
"Authorization: Bearer \$token" -F "file=\@mdatp1.png" -F
"ParametersDescription=test"
-F "HasParameters=true" -F "OverrideIfExists=true" -F "Description=test
description"
```
