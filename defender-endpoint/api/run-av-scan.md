---
title: Run antivirus scan API
description: Use this API to create calls related to running an antivirus scan on a device.
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
  - Microsoft Defender for Business
---

# Run antivirus scan API

## API description

Initiate Microsoft Defender Antivirus scan on a device.

A Microsoft Defender Antivirus scan can run alongside other antivirus solutions, whether Microsoft Defender Antivirus is the active antivirus solution or not. Microsoft Defender Antivirus can be in Passive mode. For more information, see [Microsoft Defender Antivirus compatibility](../microsoft-defender-antivirus-compatibility.md).

## Limitations

Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

## Prerequisites

### Supported operating systems

- Windows 10, version  1709 or later, and on Windows 11.
- Linux Servers. See [Supported Linux distributions](../mde-linux-prerequisites.md#supported-linux-distributions)
- macOS. See [Microsoft Defender for Endpoint on macOS](../microsoft-defender-endpoint-mac.md#system-requirements)

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'Active remediation actions'. For more information, see: [Create and manage roles](../user-roles.md).
- The user needs to have access to the device, based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.Scan|'Scan machine'|
|Delegated (work or school account)|Machine.Scan|'Scan machine'|

## HTTP request

```http
POST https://api.security.microsoft.com/api/machines/{id}/runAntiVirusScan
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|
|Content-Type|string|application/json|

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|Comment|String|Comment to associate with the action. **Required**.|
|ScanType|String|Defines the type of the Scan. **Required**.|

**ScanType** controls the type of scan to perform and can be one of the following:

- **Quick**: Perform quick scan on the device
- **Full**: Perform full scan on the device

## Response

If successful, this method returns 201, Created response code and _MachineAction_ object in the response body.

If you send  multiple API calls to run an antivirus scan for the same device, it returns "pending machine action" or HTTP 400 with the message "Action is already in progress".

## Example

### Request

Here is an example of the request.

```http
POST https://api.security.microsoft.com/api/machines/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/runAntiVirusScan
```

```json
{
  "Comment": "Check machine for viruses due to alert 3212",
  "ScanType": "Full"
}
```
