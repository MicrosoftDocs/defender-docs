---
title: Delete IP address range - Data Enrichment API
description: This article describes the delete IP address range request in the Defender for Cloud Apps Data Enrichment API.
ms.date: 01/29/2023
ms.topic: reference
---
# Delete IP address range - Data Enrichment API



Run the DELETE request to delete an IP address range.

## HTTP request

```rest
DELETE /api/v1/subnet/<ip_range_id>/
```

## Example

### Request

Here's an example of the request.

```rest
curl -X DELETE -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/subnet/<ip_range_id>/"
```

If you run into any problems, we're here to help. To get assistance or support for your product issue, please [open a support ticket](/defender-xdr/contact-defender-support).