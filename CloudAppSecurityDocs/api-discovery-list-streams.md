---
title: List continuous reports - cloud discovery API
description: This article describes the list continuous reports request in the Defender for Cloud Apps cloud discovery API.
ms.date: 01/29/2023
ms.topic: reference
---
# List continuous reports - cloud discovery API



Run the GET request to fetch a list of continuous reports.

## HTTP request

```rest
GET api/discovery/streams/
```

## Example

### Request

Here is an example of the request.

```rest
curl -XGET -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/discovery/streams/"
```

### Response

Returns a list of continuous reports in JSON format.

```json
{
  "anonymizeUsers": false,
  "displayName": "dependency_udp",
  "logType": 223,
  "receiverType": "syslog",
  "protocol": "udp",
  "streamType": 1,
  "isManual": false,
  "created": "2020-12-16T17:23:40.687Z",
  "lastModified": "2021-01-05T13:41:36.104Z",
  "logFilesHistoryCount": 2,
  "supportedEntityTypes": [],
  "supportedTrafficTypes": [1],
  "lastAlertProcessingTime": 1609853011480,
  "lastDataReceived": "2020-12-18T06:33:32.908Z",
  "logFilesFailsCount": 2,
  "currentServicesCollectionName": "discovery_services",
  "globalAggregated": true,
  "readTimeFramesFromSecond": true,
  "timeFrames2": {},
  "validTimeFrames2": [],
  "timeFrames": {},
  "validTimeFrames": [],
  "timeWithoutLogs": 0,
  "sourceStreams": []
}
```

The response object defines the following properties. Properties marked as *optional* may not appear for some continuous reports.

| Field name | Field type | Field description |
|--|--|--|
| anonymizeMachines (*optional*) | boolean | **true** if machine information is anonymized |
| anonymizeUsers (*optional*) | boolean | **true** if user information is anonymized |
| builtInStreamType (*optional*) | int | The built-in type of the continuous report. Possible values are:<br />**0**: PROXY<br />**1**: WINDOWS_DEFENDER |
| comment (*optional*) | string | The comment/description of the continuous report |
| created | date | The creation date of the continuous report |
| displayName | string | The display name of the continuous report |
| isManual (*optional*) | boolean | **true** if the continuous report is manual configured |
| globalAggregated | boolean | **true** if the continuous report data is aggregated into the global report |
| lastDataReceived | date | The date that data was last received |
| lastModified | date | The  date the continuous report was last modified |
| logFilesHistoryCount (*optional*) | int | Count of log files history |
| logType | int | The log type of the continuous report. For possible values, see [Supported log types](#supported-log-types) |
| protocol (*optional*) | string | The protocol (TCP, UDP) used by the continuous report |
| receiverType | string | The receiver type of the continuous report. Possible values include: syslog and ftp |
| snapshotData (*optional*) | boolean | **true** if the data is from snapshot report |
| streamType | int | The type of the continuous report. Possible values are:<br />**1**: INPUT (continuous report automatically created by log collector or data source)<br />**3**: VIEW (continuous report manually created in the portal)<br />**5**: PREVIEW (one-time continuous report created by snapshot report) |
| supportedEntityTypes | list | An array of discovery entity types. Possible values are:<br />**0**: INVALID<br />**1**: USER_NAME<br />**2**: IP_ADDRESS<br />**3**: MACHINE_NAME<br />**4**: RESOURCE |
| supportedTrafficTypes | list | An array of traffic types. Possible values are:<br />**0**: INVALID<br />**1**: TOTAL_BYTES<br />**2**: DOWNLOADED_BYTES<br />**3**: UPLOADED_BYTES |
| timeFrames/timeframes2 | list | An array of time frame objects for the last 7, 30, or 60 days with totals such as: Machine names count or IP addresses count |
| userTags | list | An array of user tags |

## Supported log types

The following log types are currently supported:

| ID  | Log type                             |
| --- | ------------------------------------ |
| 0   | INVALID                              |
| 1   | OTHER                                |
| 100 | LOG_3COM                             |
| 101 | BARRACUDA                            |
| 102 | BLUECOAT                             |
| 103 | CHECKPOINT                           |
| 104 | CISCO_ASA                            |
| 105 | CISCO_SSL_WEBVPN_OR_SVC_VPN          |
| 106 | CISCO_IRONPORT_PROXY                 |
| 107 | CISCO_NETFLOW                        |
| 108 | FORTIGATE                            |
| 109 | JUNIPER_NETWORKS                     |
| 110 | GREENPLUM                            |
| 111 | MICROSFOT_ISA                        |
| 112 | PALO_ALTO                            |
| 113 | SONICWALL                            |
| 114 | SQUID                                |
| 115 | SUN_MICROSYSTEMS_SUNSCREEN_FIREWALL  |
| 116 | SURICATA                             |
| 117 | SYMANTEC_WEB_SECURITY_CLOUD          |
| 118 | WEBSENSE                             |
| 119 | WATCH_GUARD                          |
| 120 | ZSCALER                              |
| 121 | MCAFEE_SWG                           |
| 122 | HP_TIPPING_POINT                     |
| 123 | HP_NETWORKING                        |
| 124 | CISCO_SCAN_SAFE                      |
| 125 | CHECKPOINT_OPSEC_LEA                 |
| 126 | PALO_ALTO_SYSLOG                     |
| 127 | METADATA_ACTIVE_DIRECTORY_LOGIN      |
| 128 | COX_SYSLOG                           |
| 129 | JUNIPER_SRX                          |
| 130 | SOPHOS_SG                            |
| 131 | METADATA_HPE_LOGIN                   |
| 132 | METADATA_CISCO_ISE                   |
| 133 | CISCO_IRONPORT_PROXY_SYSLOG          |
| 134 | ZSCALER_NESTLE                       |
| 135 | WEBSENSE_V7_5                        |
| 136 | FORTIGATE_SYSLOG                     |
| 137 | PAN_DELOITTE                         |
| 138 | WEBSENSE_SIEM_CEF                    |
| 139 | BLUECOAT_SYSLOG                      |
| 140 | CHECKPOINT_SYSLOG                    |
| 141 | CISCO_ASA_SYSLOG                     |
| 142 | CISCO_SCAN_SAFE_SYSLOG               |
| 143 | ZSCALER_SYSLOG                       |
| 144 | MCAFEE_SWG_SYSLOG                    |
| 145 | CHECKPOINT_OPSEC_LEA_SYSLOG          |
| 146 | SQUID_SYSLOG                         |
| 147 | JUNIPER_SRX_SYSLOG                   |
| 148 | SOPHOS_SG_SYSLOG                     |
| 149 | MICROSFOT_ISA_SYSLOG                 |
| 150 | WEBSENSE_SYSLOG                      |
| 151 | WEBSENSE_V7_5_SYSLOG                 |
| 152 | WEBSENSE_SIEM_CEF_SYSLOG             |
| 153 | MACHINE_ZONE_MERAKI                  |
| 154 | MACHINE_ZONE_MERAKI_SYSLOG           |
| 155 | SQUID_NATIVE                         |
| 156 | SQUID_NATIVE_SYSLOG                  |
| 157 | CISCO_FWSM                           |
| 158 | CISCO_FWSM_SYSLOG                    |
| 159 | MICROSOFT_ISA_W3C                    |
| 160 | SONICWALL_SYSLOG                     |
| 161 | MICROSOFT_ISA_W3C_SYSLOG             |
| 162 | SOPHOS_CYBEROAM                      |
| 163 | SOPHOS_CYBEROAM_SYSLOG               |
| 164 | CLAVISTER                            |
| 165 | CLAVISTER_SYSLOG                     |
| 166 | BARRACUDA_SYSLOG                     |
| 167 | CUSTOM_PARSER                        |
| 168 | JUNIPER_SSG                          |
| 169 | JUNIPER_SSG_SYSLOG                   |
| 170 | ZSCALER_QRADAR                       |
| 171 | ZSCALER_QRADAR_SYSLOG                |
| 172 | JUNIPER_SRX_SD                       |
| 173 | JUNIPER_SRX_SD_SYSLOG                |
| 174 | JUNIPER_SRX_WELF                     |
| 175 | JUNIPER_SRX_WELF_SYSLOG              |
| 176 | ADALLOM_PROXY_RAW_TRAFFIC            |
| 177 | CISCO_ASA_FIREPOWER                  |
| 178 | CISCO_ASA_FIREPOWER_SYSLOG           |
| 179 | GENERIC_CEF                          |
| 180 | GENERIC_CEF_SYSLOG                   |
| 181 | GENERIC_LEEF                         |
| 182 | GENERIC_LEEF_SYSLOG                  |
| 183 | GENERIC_W3C                          |
| 184 | GENERIC_W3C_SYSLOG                   |
| 185 | I_FILTER                             |
| 186 | I_FILTER_SYSLOG                      |
| 187 | CHECKPOINT_XML                       |
| 188 | CHECKPOINT_XML_SYSLOG                |
| 189 | CHECKPOINT_SMART_VIEW_TRACKER        |
| 190 | CHECKPOINT_SMART_VIEW_TRACKER_SYSLOG |
| 191 | BARRACUDA_NEXT_GEN_FW                |
| 192 | BARRACUDA_NEXT_GEN_FW_SYSLOG         |
| 193 | BARRACUDA_NEXT_GEN_FW_WEBLOG         |
| 194 | BARRACUDA_NEXT_GEN_FW_WEBLOG_SYSLOG  |
| 195 | WDATP                                |
| 196 | ZSCALER_CEF                          |
| 197 | ZSCALER_CEF_SYSLOG                   |
| 198 | SOPHOS_XG                            |
| 199 | SOPHOS_XG_SYSLOG                     |
| 200 | IBOSS                                |
| 201 | IBOSS_SYSLOG                         |
| 202 | FORCEPOINT                           |
| 203 | FORCEPOINT_SYSLOG                    |
| 204 | FORTIOS                              |
| 205 | FORTIOS_SYSLOG                       |
| 206 | CISCO_IRONPORT_WSA_II                |
| 207 | CISCO_IRONPORT_WSA_II_SYSLOG         |
| 208 | PALO_ALTO_LEEF                       |
| 209 | PALO_ALTO_LEEF_SYSLOG                |
| 210 | FORCEPOINT_LEEF                      |
| 211 | FORCEPOINT_LEEF_SYSLOG               |
| 212 | STORMSHIELD                          |
| 213 | STORMSHIELD_SYSLOG                   |
| 214 | CONTENTKEEPER                        |
| 215 | CONTENTKEEPER_SYSLOG                 |
| 216 | CISCO_IRONPORT_WSA_III               |
| 217 | CISCO_IRONPORT_WSA_III_SYSLOG        |
| 218 | CHECKPOINT_CEF                       |
| 219 | CHECKPOINT_CEF_SYSLOG                |
| 220 | CORRATA                              |
| 221 | CORRATA_SYSLOG                       |
| 222 | CISCO_FIREPOWER_V6                   |
| 223 | CISCO_FIREPOWER_V6_SYSLOG            |
| 224 | MENLO_SECURITY_CEF                   |
| 225 | WATCHGUARD_XTM                       |
| 226 | WATCHGUARD_XTM_SYSLOG                |

[!INCLUDE [Open support ticket](includes/support.md)]
