---
title: Score methods and properties
description: Retrieves your organization's exposure score, device secure score, and exposure score by device group
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 03/01/2025
---

# Score resource type

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]


**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](../microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

[!include[Prerelease information](../../includes/prerelease.md)]

## Methods

Method|Return Type|Description
:---|:---|:---
[Get exposure score](get-exposure-score.md)|[Score](score.md)|Get the organizational exposure score.
[Get device secure score](get-device-secure-score.md)|[Score](score.md)|Get the organizational device secure score.
[List exposure score by device group](get-machine-group-exposure-score.md)|[Score](score.md)|List scores by device group.

> [!NOTE]
> Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.  

## Properties

Property|Type|Description
:---|:---|:---
Score|Double|The current score.
Time|DateTime|The date and time in which the call for this API was made.
RbacGroupName|String|The device group name.
RbacGroupId|String|The device group ID.

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
