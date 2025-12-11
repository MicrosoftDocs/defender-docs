---
title: Authenticated scan methods and properties
description: The API response contains Microsoft Defender Vulnerability Management authenticated scans created in your tenant. You can request all the scans, all the scan definitions or add a new network our authenticated scan.
ms.service: defender-endpoint
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
search.appverid: met150
ms.date: 11/10/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender Vulnerability Management

---
# Authenticated scan properties


Learn more about [Windows authenticated scan](/defender-vulnerability-management/windows-authenticated-scan) and [Network authenticated scans](../network-devices.md).

[!Include[Prerelease information](../../includes/prerelease.md)]


## Properties

Property|Data type|Description
:---|:---|:---
id|String| Scan ID.
scanType|Enum|The type of scan. Possible values are: `Windows`, `Network`.
scanName|String|Name of the scan.
isActive|Boolean|Status of whether the scan actively running.
orgId |String| Related organization ID.
intervalInHours|Int|The interval at which the scan runs.
createdBy|String| Unique identity of the user that created the scan.
targetType|String|The target type in the target field. Possible types are `IP Address` or `Hostname`. Default value is IP Address.
target|String| A comma separated list of targets to scan, either IP addresses or hostnames.
scanAuthenticationParams|Object|An object representing the authentication parameters, see [Authentication parameters object properties](#authentication-parameters-object-properties) for expected fields. This property is mandatory when creating a new scan and is optional when updating a scan.
scannerAgent|Object|An object representing the scanner agent, contains the machine Id of the scanning device.

### Authentication parameters object properties

Property|Data type|Description
:---|:---|:---
|@odata.type|Enum|The scan type authentication parameters. Possible values are: `#microsoft.windowsDefenderATP.api.SnmpAuthParams` for `Network` scan type, and `#microsoft.windowsDefenderATP.api.WindowsAuthParams` for `Windows` scan type.|
|type|Enum|The authentication method. Possible values vary based on @odata.type property. <br/> - If @odata.type is `SnmpAuthParams`, possible values are `CommunityString`, `NoAuthNoPriv`, `AuthNoPriv`, `AuthPriv`. <br/> - If `@odata.type` is `WindowsAuthParams` possible values are `Kerberos` or `Negotiate`.|
|KeyVaultUrl|String (Optional)|An optional property that specifies from which KeyVault the scanner should retrieve credentials. If KeyVault is specified there's no need to specify username, password.|
|KeyVaultSecretName|String (Optional)|An optional property that specifies KeyVault secret name from which the scanner should retrieve credentials. If KeyVault is specified there's no need to specify username, password.|
|Domain|String (Optional)|Domain name when using `WindowsAuthParams`.|
|Username|String (Optional)|Username when using `WindowsAuthParams` or the username when choosing `SnmpAuthParams` with any type other than `CommunityString`.|
|IsGMSAUser|Boolean (Optional)|Must be set to true when choosing `WindowsAuthParams`.|
|CommunityString|String (Optional)|Community string to use when choosing `SnmpAuthParams` with `CommunityString`|
|AuthProtocol|String (Optional)|Auth protocol to use with `SnmpAuthParams` and `AuthNoPriv` or `AuthPriv`. Possible values are `MD5`, `SHA1`.|
|AuthPassword|String (Optional)|Auth password to use with `SnmpAuthParams` and `AuthNoPriv` or `AuthPriv`.|
|PrivProtocol|String (Optional)|Priv protocol to use with `SnmpAuthParams` and `AuthPriv`. Possible values are `DES`, `3DES`, `AES`.|
|PrivPassword|String (Optional)|Priv password to use with `SnmpAuthParams` and `AuthPriv`.|
