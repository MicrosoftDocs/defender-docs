---
title: Investigation resource type
description: Microsoft Defender for Endpoint Investigation entity.
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
ms.date: 11/11/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Business
---

# Investigation resource type

Represent an Automated Investigation entity in Defender for Endpoint.

For more information, see [Overview of automated investigations](../automated-investigations.md).

## Properties

|Property|Type|Description|
|---|---|---|
|ID|String|Identity of the investigation entity.|
|startTime|DateTime Nullable|The date and time when the investigation was created.|
|endTime|DateTime Nullable|The date and time when the investigation was completed.|
|cancelledBy|String|The ID of the user/application that canceled that investigation.|
|State|Enum|The current state of the investigation. Possible values are: 'Unknown', 'Terminated', 'SuccessfullyRemediated', 'Benign', 'Failed', 'PartiallyRemediated', 'Running', 'PendingApproval', 'PendingResource', 'PartiallyInvestigated', 'TerminatedByUser', 'TerminatedBySystem', 'Queued', 'InnerFailure', 'PreexistingAlert', 'UnsupportedOs', 'UnsupportedAlertType', 'SuppressedAlert'.|
|statusDetails|String|Additional information about the state of the investigation.|
|machineId|String|The ID of the device on which the investigation is executed.|
|computerDnsName|String|The name of the device on which the investigation is executed.|
|triggeringAlertId|String|The ID of the alert that triggered the investigation.|

## Json representation

```json
{
    "id": "63004",
    "startTime": "2020-01-06T13:05:15Z",
    "endTime": null,
    "state": "Running",
    "cancelledBy": null,
    "statusDetails": null,
    "machineId": "e828a0624ed33f919db541065190d2f75e50a071",
    "computerDnsName": "desktop-test123",
    "triggeringAlertId": "da637139127150012465_1011995739"
}
```
