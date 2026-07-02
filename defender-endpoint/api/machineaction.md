---
title: machineAction resource type
description: Learn about the methods and properties of the MachineAction resource type in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
ms.topic: reference
ms.custom: api
ms.subservice: reference
ms.date: 11/13/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# MachineAction resource type

- For more information, see [Response Actions](../respond-machine-alerts.md).

## Properties

|Property|Type|Description|
|---|---|---|
|ID|Guid|Identity of the [Machine Action](machineaction.md) entity.|
|type|Enum|Type of the action. Possible values are: `RunAntiVirusScan`, `Offboard`, `LiveResponse`, `CollectInvestigationPackage`, `Isolate`, `Unisolate`, `StopAndQuarantineFile`, `RestrictCodeExecution`, and `UnrestrictCodeExecution`.|
|scope|string|Scope of the action. `Full` or `Selective` for Isolation, `Quick` or `Full` for antivirus scan.|
|requestor|String|Identity of the person that executed the action.|
|externalID|String|Id the customer can submit in the request for custom correlation.|
|requestSource|string|The name of the user/application that submitted the action.|
|commands|array|Commands to run. Allowed values are PutFile, RunScript, GetFile.|
|cancellationRequestor|String|Identity of the person that canceled the action.|
|requestorComment|String|Comment that was written when issuing the action.|
|cancellationComment|String|Comment that was written when canceling the action.|
|status|Enum|Current status of the command. Possible values are: `Pending`, `InProgress`, `Succeeded`, `Failed`, `TimeOut`, and `Cancelled`.|
|machineId|String|ID of the [machine](machine.md) on which the action was executed.|
|computerDnsName|String|Name of the [machine](machine.md) on which the action was executed.|
|creationDateTimeUtc|DateTimeOffset|The date and time when the action was created.|
|cancellationDateTimeUtc|DateTimeOffset|The date and time when the action was canceled.|
|lastUpdateDateTimeUtc|DateTimeOffset|The last date and time when the action status was updated.|
|title|String|Machine action title.|
|relatedFileInfo|Class|Contains two Properties. string `fileIdentifier`, Enum `fileIdentifierType` with the possible values: `Sha1`, `Sha256`, and `Md5`.|

## Json representation

```json
{
        "id": "5382f7ea-7557-4ab7-9782-d50480024a4e",
        "type": "Isolate",
        "scope": "Selective",
        "requestor": "Analyst@TestPrd.onmicrosoft.com",
        "requestorComment": "test for docs",
        "status": "Succeeded",
        "machineId": "7b1f4967d9728e5aa3c06a9e617a22a4a5a17378",
        "computerDnsName": "desktop-test",
        "creationDateTimeUtc": "2019-01-02T14:39:38.2262283Z",
        "lastUpdateDateTimeUtc": "2019-01-02T14:40:44.6596267Z",
        "relatedFileInfo": null
}
```
