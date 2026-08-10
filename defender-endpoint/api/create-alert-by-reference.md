---
title: Create alert from event API
description: Learn how to use the Create alert API to create a new Alert on top of Event in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
ms.date: 11/11/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Create alert API

## API description

Creates new [Alert](alerts.md) on top of **Event**.

- **Microsoft Defender for Endpoint Event** is required for the alert creation.
- You need to supply three parameters from the Event in the request: **Event Time**, **Machine ID**, and **Report ID**. See example below.
- You can use an event found in Advanced Hunting API or Portal.
- If there existing an open alert on the same Device with the same Title, the new created alert is merged with it.
- An automatic investigation starts automatically on alerts created via the API.

## Limitations

Rate limitations for this API are 15 calls per minute.

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: *Alerts investigation*. For more information, see [Create and manage roles](../user-roles.md).

- The user needs to have access to the device associated with the alert, based on device group settings. For more information, see [Create and manage device groups](../machine-groups.md).

One of the following permissions is required to call this API. For more information on how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Alert.ReadWrite.All|'Read and write all alerts'|
|Delegated (work or school account)|Alert.ReadWrite|'Read and write alerts'|

## HTTP request

```http
POST https://api.security.microsoft.com/api/alerts/CreateAlertByReference
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|
|Content-Type|String|application/json. **Required**.|

## Request body

In the request body, supply the following values (all are required):

|Property|Type|Description|
|---|---|---|
|eventTime|DateTime(UTC)|The precise time of the event as string, as obtained from advanced hunting. For example, `2018-08-03T16:45:21.7115183Z`. **Required**.|
|reportId|String|The reportId of the event, as obtained from advanced hunting. **Required**.|
|machineId|String|Id of the device on which the event was identified. **Required**.|
|severity|String|Severity of the alert. The property values are: 'Low', 'Medium' and 'High'. **Required**.|
|title|String|Title for the alert. **Required**.|
|description|String|Description of the alert. **Required**.|
|recommendedAction|String|Security officer needs to take this action when analyzing the alert. **Required**.|
|category|String|Category of the alert. The property values are: "General", "CommandAndControl", "Collection", "CredentialAccess", "DefenseEvasion", "Discovery", "Exfiltration", "Exploit", "Execution", "InitialAccess", "LateralMovement", "Malware", "Persistence", "PrivilegeEscalation", "Ransomware", "SuspiciousActivity" **Required**.|

## Response

If successful, this method returns 200 OK, and a new [alert](alerts.md) object in the response body. If event with the specified properties (_reportId_, _eventTime_ and _machineId_) wasn't found - 404 Not Found.

## Example

### Request

Here's an example of the request.

```http
POST https://api.security.microsoft.com/api/alerts/CreateAlertByReference
```

```json
{
    "machineId": "1e5bc9d7e413ddd7902c2932e418702b84d0cc07",
    "severity": "Low",
    "title": "example",
    "description": "example alert",
    "recommendedAction": "nothing",
    "eventTime": "2018-08-03T16:45:21.7115183Z",
    "reportId": "20776",
    "category": "Exploit"
}
```
