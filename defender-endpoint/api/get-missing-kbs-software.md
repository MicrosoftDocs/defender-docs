---
title: Get missing KBs by software ID
description: Retrieves missing security updates by software ID
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
ms.date: 11/16/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Get missing KBs by software ID

Retrieves missing KBs (security updates) by software ID

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md) for details.

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Software.Read.All|'Read Threat and Vulnerability Management Software information'|
|Delegated (work or school account)|Software.Read|'Read Threat and Vulnerability Management Software information'|

## HTTP request

```http
GET /api/Software/{Id}/getmissingkbs
```

## Request header

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 OK, with the specified software missing kb data in the body.

## Example

### Request

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/Software/microsoft-_-edge/getmissingkbs
```

### Response

Here's an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#Collection(microsoft.windowsDefenderATP.api.PublicProductFixDto)",
    "value": [
         {
            "id": "4540673",
            "name": "March 2020 Security Updates",
            "productsNames": [
                "edge"
            ],
            "url": "https://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB4540673",
            "machineMissedOn": 240,
            "cveAddressed": 14
         },
         ...
        ]
}
```
