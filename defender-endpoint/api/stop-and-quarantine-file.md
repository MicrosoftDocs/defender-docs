---
title: Stop and quarantine file API
description: Learn how to stop running a file on a device and delete the file in Microsoft Defender for Endpoint. See an example.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 11/13/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Stop and quarantine file API

## API description

Stop execution of a file on a device and delete it.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

You can only take this action if:

- The device you're taking the action on is running Windows 10, version 1703 or later, or Windows 11
- The file does not belong to trusted third-party publishers or is not signed by Microsoft
- Microsoft Defender Antivirus must at least be running on Passive mode. For more information, see: [Microsoft Defender Antivirus compatibility](/windows/security/threat-protection/microsoft-defender-antivirus/microsoft-defender-antivirus-compatibility).

## Permissions

 When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'Active remediation actions'. For more information, see: [Create and manage roles](../user-roles.md).
- The user needs to have access to the device, based on device group settings. For more information, see: [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.StopAndQuarantine|'Stop And Quarantine'|
|Application|Machine.ReadWrite.All|'Read and write all machine information'|
|Delegated (work or school account)|Machine.StopAndQuarantine|'Stop And Quarantine'|

## HTTP request

```http
POST https://api.security.microsoft.com/api/machines/{id}/StopAndQuarantineFile
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|
|Content-Type|string|application/json. **Required**.|

## Request body
In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|Comment|String|Comment to associate with the action. **Required**.|
|Sha1|String|Sha1 of the file to stop and quarantine on the device. **Required**.|

## Response

If successful, this method returns 201 - Created response code and [Machine Action](machineaction.md) in the response body.

## Example

### Request

Here's an example of the request.

```http
POST https://api.security.microsoft.com/api/machines/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/StopAndQuarantineFile
```

```json
{
  "Comment": "Stop and quarantine file on machine due to alert 441688558380765161_2136280442",
  "Sha1": "87662bc3d60e4200ceaf7aae249d1c343f4b83c9"
}
```
