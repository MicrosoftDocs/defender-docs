---
title: Initiate file upload - cloud discovery API
description: This article describes the upload_url request in the Defender for Cloud Apps cloud discovery API.
ms.date: 01/29/2023
ms.topic: reference
---
# Initiate file upload - cloud discovery API



Run the GET request to initiate the upload process. This call, the first of the three, returns a URL that will later be used to perform the upload (PUT) request.

## HTTP request

```rest
GET /api/v1/discovery/upload_url/
```

## Request URL parameters

| Parameter | Description |
| --- |--- |
| filename | Name of the file you want to upload to cloud discovery processing |
| source | The type of cloud discovery log file being uploaded |

The following source types are currently supported:

- BLUECOAT
- BARRACUDA
- BARRACUDA_NEXT_GEN_FW
- BARRACUDA_NEXT_GEN_FW_WEBLOG
- BARRACUDA_SYSLOG
- BLUECOAT_SYSLOG
- CHECKPOINT
- CHECKPOINT_CEF_SYSLOG
- CHECKPOINT_SMART_VIEW_TRACKER
- CHECKPOINT_XML
- CISCO_ASA
- CISCO_ASA_FIREPOWER_SYSLOG
- CISCO_ASA_SYSLOG
- CISCO_FIREPOWER_V6_SYSLOG
- CISCO_FWSM
- CISCO_FWSM_SYSLOG
- CISCO_IRONPORT_PROXY
- CISCO_IRONPORT_PROXY_SYSLOG
- CISCO_IRONPORT_WSA_II
- CISCO_IRONPORT_WSA_III
- CISCO_SCAN_SAFE
- CLAVISTER_SYSLOG
- CONTENTKEEPER_SYSLOG
- CORRATA
- FORCEPOINT
- FORCEPOINT_LEEF_SYSLOG
- FORTIGATE
- FORTIGATE_SYSLOG
- FORTIOS_SYSLOG
- GENERIC_CEF
- GENERIC_CEF_SYSLOG
- GENERIC_LEEF
- GENERIC_LEEF_SYSLOG
- GENERIC_W3C
- GENERIC_W3C_SYSLOG
- I_FILTER
- I_FILTER_SYSLOG
- IBOSS
- JUNIPER_SRX_SD_SYSLOG
- JUNIPER_SRX_SYSLOG
- JUNIPER_SRX_WELF_SYSLOG
- JUNIPER_SSG_SYSLOG
- MACHINE_ZONE_MERAKI
- MACHINE_ZONE_MERAKI_SYSLOG
- MCAFEE_SWG
- MCAFEE_SWG_SYSLOG
- MENLO_SECURITY_CEF
- MICROSOFT_ISA_W3C
- OPEN_SYSTEMS_SECURE_WEB_GATEWAY
- PALO_ALTO
- PALO_ALTO_LEEF
- PALO_ALTO_LEEF_SYSLOG
- PALO_ALTO_SYSLOG
- SONICWALL_SYSLOG
- SOPHOS_CYBEROAM_SYSLOG
- SOPHOS_SG
- SOPHOS_SG_SYSLOG
- SOPHOS_XG
- SOPHOS_XG_SYSLOG
- SQUID
- SQUID_NATIVE
- SQUID_NATIVE_SYSLOG
- STORMSHIELD_SYSLOG
- WANDERA_SYSLOG
- WATCHGUARD_XTM_SYSLOG
- WEBSENSE_SIEM_CEF_SYSLOG
- WEBSENSE_V7_5
- ZSCALER
- ZSCALER_CEF_SYSLOG
- ZSCALER_QRADAR_SYSLOG
- ZSCALER_SYSLOG

> [!NOTE]
>
> - When using a custom parser, Defender for Cloud Apps will use the custom parser attached to the selected data source.
> - If you can't find your file format, perform a manual upload using the portal.

## Response parameters

| Parameter | Description |
| --- | --- |
| url | The target URL that will perform your cloud discovery upload. |
| provider | Either "azure" or "aws", an indication whether the upload is target to Windows Azure Storage and AWS S3 storage. |

## Example

### Request

Here is an example of the request.

```rest
curl -XGET -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/discovery/upload_url/?filename=my_discovery_file.txt&source=GENERIC_CEF"
```

### Response

Here is an example of the JSON response.

```json
{
  "url": "https://<initiate_file_upload_response_url>",
  "provider": "azure"
}
```

[!INCLUDE [Open support ticket](includes/support.md)]
