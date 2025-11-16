---
title: User resource type
description: Retrieve recent Microsoft Defender for Endpoint alerts related to users.
ms.service: defender-endpoint
ms.author: kesharab
author: KesemSharabi
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
ms.date: 11/16/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business

---

# User resource type


Method|Return Type|Description
---|---|---
[List User related alerts](get-user-related-alerts.md)|[alert](alerts.md) collection|List all the alerts that are associated with a [user](user.md).
[List User related devices](get-user-related-machines.md)|[machine](machine.md) collection|List all the devices that were logged on by a [user](user.md).

