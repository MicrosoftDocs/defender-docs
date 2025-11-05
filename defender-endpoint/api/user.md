---
title: User resource type
description: Retrieve recent Microsoft Defender for Endpoint alerts related to users.
ms.service: defender-endpoint
ms.author: bagol
author: batamig
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
ms.date: 03/01/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business

---
# User resource type

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]




[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

Method|Return Type|Description
---|---|---
[List User related alerts](get-user-related-alerts.md)|[alert](alerts.md) collection|List all the alerts that are associated with a [user](user.md).
[List User related devices](get-user-related-machines.md)|[machine](machine.md) collection|List all the devices that were logged on by a [user](user.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]

