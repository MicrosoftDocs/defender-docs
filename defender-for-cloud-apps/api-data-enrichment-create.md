---
title: Create IP address range - Data Enrichment API
description: This article describes the create IP address range request in the Defender for Cloud Apps Data Enrichment API.
ms.date: 01/29/2023
ms.topic: reference
---
# Create IP address range - Data Enrichment API



Run the POST request to add a new IP address range.

## HTTP request

```rest
POST /api/v1/subnet/create_rule/
```

## Request BODY parameters

| Parameter | Description |
| --- | --- |
| name | The unique name of the range |
| category | The id of the range category. Providing a category helps you easily recognize activities from interesting IP addresses. Possible values include:<br /><br />**1**: Corporate<br />**2**: Administrative<br />**3**: Risky<br />**4**: VPN<br />**5**: Cloud provider<br />**6**: Other |
| subnets | An array of masks as strings (IPv4 / IPv6) |
| organization (Optional) | The registered ISP |
| tags (Optional) | An array of new or existing objects including the tag name, id, description, name template, and tenant id |

## Example

### Request

Here is an example of the request.

```rest
curl -XPOST -H "Authorization:Token <your_token_key>" -H "Content-Type: application/json" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/subnet/create_rule/" -d '{
  "name":"range name",
  "category":5,
  "organization":"Microsoft",
  "subnets":[
    "192.168.1.0/24",
    "192.168.2.0/16"
  ],
  "tags":[
    "existing tag"
  ]
}'
```

### Response

Returns the id of the new range as a string.

[!INCLUDE [Open support ticket](includes/support.md)]
