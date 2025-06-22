---
title: User resource type
description: Retrieve recent Microsoft Defender for Endpoint alerts related to users.
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

# User resource type

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](../microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Business](/defender-business)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

Method|Return Type|Description
---|---|---
[List User related alerts](get-user-related-alerts.md)|[alert](alerts.md) collection|List all the alerts that are associated with a [user](user.md).
[List User related devices](get-user-related-machines.md)|[machine](machine.md) collection|List all the devices that were logged on by a [user](user.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
