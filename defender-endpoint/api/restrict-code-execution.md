---
title: Restrict app execution API
description: Use this API to create calls related to restricting an application from executing.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
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
ms.date: 11/13/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Restrict app execution API

## API description

Restrict execution of all applications on the device except a predefined set.

## Limitations

Rate limitations for this API are 100 calls per minute and 1500 calls per hour.

## Prerequisites

- This action is available for devices on Windows 10, version  1709 or later, and on Windows 11.
- This feature is available if your organization uses Microsoft Defender Antivirus.
- This action needs to meet the Windows Defender Application Control code integrity policy formats and signing requirements. For more information, see: [Code integrity policy formats and signing](/windows/device-security/device-guard/requirements-and-deployment-planning-guidelines-for-device-guard#code-integrity-policy-formats-and-signing).

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'Active remediation actions'. For more information, see: [Create and manage roles](../user-roles.md).
- The user needs to have access to the device, based on device group settings. For more information, see: [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.RestrictExecution|'Restrict code execution'|
|Delegated (work or school account)|Machine.RestrictExecution|'Restrict code execution'|

## HTTP request

```http
POST https://api.security.microsoft.com/api/machines/{id}/restrictCodeExecution
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

## Response

If successful, this method returns 201 - Created response code and [Machine Action](machineaction.md) in the response body.

If you send multiple API calls to restrict app execution for the same device, it returns "pending machine action" or HTTP 400 with the message "Action is already in progress".

## Example

### Request

Here is an example of the request.

```http
POST https://api.security.microsoft.com/api/machines/1e5bc9d7e413ddd7902c2932e418702b84d0cc07/restrictCodeExecution
```

```json
{
  "Comment": "Restrict code execution due to alert 1234"
}
```
