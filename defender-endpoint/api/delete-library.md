---
title: Delete a file from the live response library
description: Learn how to delete a file from the live response library.
search.appverid: met150
ms.service: defender-endpoint
f1.keywords:
- NOCSH
ms.author: kesharab
author: KesemSharabi
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
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint

---
# Delete a file from the live response library

[!include[Prerelease information](../../includes/prerelease.md)]

## API description

Delete a file from live response library.

## Limitations

Rate limitations for this API are 100 calls per minute and 1500 calls per
    hour.

## Permissions

One of the following permissions is required to call this API. To learn more,
including how to choose permissions, see [Get started](apis-intro.md).

| Permission type                    | Permission     | Permission display name        |
|------------------------------------|----------------|--------------------------------|
| Application                        | Library.Manage | Manage live response library |
| Delegated (work or school account) | Library.Manage | Manage live response library |

## HTTP request

DELETE https://api.security.microsoft.com/api/libraryfiles/{fileName}

## Request headers

| Name            | Type   | Description               |
|-----------------|--------|---------------------------|
| Authorization   | String | Bearer\<token>\. Required. |

## Request body

Empty

## Response

- If file exists in library and deleted successfully  204 No Content.

- If specified file name was not found  404 Not Found.

## Example

Request

Here is an example of the request.

```HTTP
DELETE https://api.security.microsoft.com/api/libraryfiles/script1.ps1
```


