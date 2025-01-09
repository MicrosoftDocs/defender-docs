---
title: List - Data Enrichment API
description: This article describes the list request in the Defender for Cloud Apps Data Enrichment API.
ms.date: 01/29/2023
ms.topic: reference
---
# List - Data Enrichment API



Run the GET or POST request to fetch a list of IP ranges matching the specified filters.

## HTTP request

```rest
GET /api/v1/subnet/
```

```rest
POST /api/v1/subnet/
```

## Request BODY parameters

| Parameter | Description |
| --- | --- |
| filters | Filter objects with all the search filters for the request, see [IP range filters](api-data-enrichment.md#filters) for more details |
| sortDirection | The sorting direction. Possible values are: `asc` and `desc` |
| sortField | Fields used to sort IP ranges. Possible values are:<br />- **category**: The category of the IP range<br />- **tags**: The tags of the IP range<br />- **name**: The name of the IP range |
| skip | Skips the specified number of records |
| limit | Maximum number of records returned by the request |

## Example

### Request

Here is an example of the request.

```rest
curl -XPOST -H "Authorization:Token <your_token_key>" -H "Content-Type: application/json" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/subnet/" -d '{
  "filters": {
    // some filters
  },
  "skip": 5,
  "limit": 10
  // ...
}'
```

### Response

Returns a list of IP ranges in JSON format. For information about the response fields, see [Properties](api-data-enrichment.md#properties).

```json
{
  "total": 1 // total number of records
  "hasNext": false // whether there is more data to show or not.
  "data": [
    {
      // returned records
      "_id": "5fd767259cd24bb563567d7c",
      "name": "range name",
      "subnets": [
        {
          "mask": 112,
          "address": "0000:0000:0000:0000:0000:ffff:c5c6:0000",
          "originalString": "197.198.192.20/16"
        }
      ],
      "location": {
        "name": "United States",
        "latitude": 39.5035514831543,
        "longitude": -99.01830291748047,
        "countryCode": "US",
        "countryName": "United States"
      },
      "organization": "isp name",
      "tags": [
        {
          "_id": "5ce2aaf42207ad108c76fa3a",
          "id": "000000290000000000000000",
          "target": 1,
          "type": 2,
          "name": "Contoso",
          "nameTemplate": {
            "template": "SAGE_BUILTIN_TAG_CONTOSO_NAME"
          },
          "description": "IP addresses used by Contoso",
          "descriptionTemplate": {
            "template": "SAGE_BUILTIN_TAG_CONTOSO_DESCRIPTION"
          },
          "visibility": 0,
          "status": 0,
          "_tid": 113348336
        }
      ],
      "category": 5,
      "lastModified": 1607952165309.8032,
      "_tid": 113348336
    }
  ]
}
```

[!INCLUDE [Open support ticket](includes/support.md)]
