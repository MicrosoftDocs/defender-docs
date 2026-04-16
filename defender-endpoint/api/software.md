---
title: Software methods and properties
description: Retrieves top recent alerts.
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
ms.date: 03/01/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Software resource type

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## Properties

|Property|Type|Description|
|---|---|---|
|id|String|Software ID|
|Name|String|Software name|
|Vendor|String|Software publisher name|
|Weaknesses|Long|Number of discovered vulnerabilities|
|publicExploit|Boolean|Public exploit exists for some of the vulnerabilities|
|activeAlert|Boolean|Active alert is associated with this software|
|exposedMachines|Long|Number of exposed devices|
|impactScore|Double|Exposure score impact of this software|
