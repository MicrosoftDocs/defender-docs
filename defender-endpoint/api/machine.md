---
title: Machine resource type
description: Learn about the methods and properties of the Machine resource type in Microsoft Defender for Endpoint.
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
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Business
---

# Machine resource type

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## Properties

|Property|Type|Description|
|---|---|---|
|id|String|[machine](machine.md) identity.|
|computerDnsName|String|[machine](machine.md) fully qualified name.|
|firstSeen|DateTimeOffset|First date and time where the [machine](machine.md) was observed by Microsoft Defender for Endpoint.|
|lastSeen|DateTimeOffset|Time and date of the last received full device report. A device typically sends a full report every 24 hours. <br> NOTE: This property doesn't correspond to the last seen value in the UI. It pertains to the last device update.|
|osPlatform|String|Operating system platform.|
|onboardingstatus|String|Status of machine onboarding. Possible values are: `onboarded`, `CanBeOnboarded`, `Unsupported`, and `InsufficientInfo`.|
|osProcessor|String|Operating system processor. Use osArchitecture property instead.|
|version|String|Operating system Version.|
|osBuild|Nullable long|Operating system build number.|
|lastIpAddress|String|Last IP on local NIC on the [machine](machine.md).|
|lastExternalIpAddress|String|Last IP through which the [machine](machine.md) accessed the internet.|
|healthStatus|Enum|[machine](machine.md) health status. Possible values are: `Active`, `Inactive`, `ImpairedCommunication`, `NoSensorData`, `NoSensorDataImpairedCommunication`, and `Unknown`.|
|rbacGroupName|String|Machine group Name.|
|rbacGroupId|String|Machine group ID.|
|riskScore|Nullable Enum|Risk score as evaluated by Microsoft Defender for Endpoint. Possible values are: `None`, `Informational`, `Low`, `Medium`, and `High`.|
|aadDeviceId|Nullable representation Guid|Microsoft Entra Device ID (when [machine](machine.md) is Microsoft Entra joined).|
|machineTags|String collection|Set of [machine](machine.md) tags.|
|exposureLevel|Nullable Enum|Exposure level as evaluated by Microsoft Defender for Endpoint. Possible values are: `None`, `Low`, `Medium`, and `High`.|
|deviceValue|Nullable Enum|The [value of the device](/defender-vulnerability-management/tvm-assign-device-value). Possible values are: `Normal`, `Low`, and `High`.|
|ipAddresses|IpAddress collection|Set of ***IpAddress*** objects. See [Get machines API](get-machines.md).|
|osArchitecture|String|Operating system architecture. Possible values are: `32-bit`, `64-bit`. Use this property instead of osProcessor.|
