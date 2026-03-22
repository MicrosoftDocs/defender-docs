---
title: Score methods and properties
description: Retrieves your organization's exposure score, device secure score, and exposure score by device group
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

# Score resource type

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## Properties

|Property|Type|Description|
|---|---|---|
|Score|Double|The current score.|
|Time|DateTime|The date and time in which the call for this API was made.|
|RbacGroupName|String|The device group name.|
|RbacGroupId|String|The device group ID.|
