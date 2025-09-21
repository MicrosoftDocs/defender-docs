---
title: Generate block script - cloud discovery API
description: This article describes the discovery_block_scripts request in the Defender for Cloud Apps cloud discovery API.
ms.date: 01/29/2023
ms.topic: reference
---
# Generate block script - cloud discovery API



> [!NOTE]
> This request is not available for Microsoft 365 Cloud App Security.

Run the GET request to get a block script for your network appliance.

## HTTP request

```rest
GET /api/discovery_block_scripts/
```

## Request URL parameters

| Parameter | Description |
| --- | --- |
| format | The format of the network appliance. |

The following formats are currently supported:

| Appliance | Format |
| --- | --- |
| BlueCoat ProxySG | 102 |
| Cisco ASA | 104 |
| Fortinet FortiGate | 108 |
| Juniper SRX | 129 |
| Palo Alto | 112 |
| Websense | 135 |
| Zscaler | 120 |

> [!NOTE]
> If you can't find your appliance, generate a block script manually using the portal.

## Response

This request returns the block script as text.

## Example

### Request

Here is an example of the request.

Bearer token: 
```rest
curl -XGET -H "Authorization:Bearer <your_token>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/discovery_block_scripts/?format=102&type=banned"
```

Legacy token: 
```rest
curl -XGET -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/discovery_block_scripts/?format=102&type=banned"
```

> [!NOTE]
> This API supports both `token` and `bearer` options. When using the `token` option, enter the token you generated in the **API Token** tab.
> When using the `bearer` option, provide the token you generated through Azure AD Graph.

### Response example

```text
url.domain=application.com deny
url.domain=application.be deny
url.domain=application.co deny
```

[!INCLUDE [Open support ticket](includes/support.md)]
