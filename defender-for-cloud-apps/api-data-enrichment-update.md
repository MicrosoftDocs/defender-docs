---
title: Update IP address range - Data Enrichment API
description: This article describes the update IP address range request in the Defender for Cloud Apps Data Enrichment API.
ms.date: 01/29/2023
ms.topic: reference
---
# Update IP address range - Data Enrichment API



Run the POST request to update an existing IP address range.

> [!IMPORTANT]
> This endpoint isn't built for partial updates. All required parameters must be passed and any optional parameters will get an empty value if not passed.

## HTTP request

```rest
POST /api/v1/subnet/<ip_range_id>/update_rule/
```

## Request BODY parameters

| Parameter | Type | Description |
| --- | --- | --- |
| name | string | The unique name of the range |
| category | int | The ID of the range category. Providing a category helps you easily recognize activities from interesting IP addresses. Possible values include:<br /><br />**1**: Corporate<br />**2**: Administrative<br />**3**: Risky<br />**4**: VPN<br />**5**: Cloud provider<br />**6**: Other |
| subnets | list | An array of masks as strings (IPv4 / IPv6) |
| organization (Optional) | string | The registered ISP |
| tags (Optional) | list | An array of new or existing objects including the tag name, ID, description, name template, and tenant ID |

## Example

### Request

Here's an example of the request.

```rest
curl -XPOST -H "Authorization:Token <your_token_key>" -H "Content-Type: application/json" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/subnet/<ip_range_id>/update_rule/" -d '{
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

If you run into any problems, we're here to help. To get assistance or support for your product issue, please [open a support ticket](/defender-xdr/contact-defender-support).
