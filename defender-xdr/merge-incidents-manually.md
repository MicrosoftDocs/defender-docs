---
title: Merge incidents manually in the Microsoft Defender portal
description: Learn how to merge two or more incidents into a single incident in the Microsoft Defender portal, to help you investigate incidents more efficiently and effectively and resolve them more quickly and accurately.
ms.service: defender-xdr
ms.author: yelevin
author: yelevin
ms.localizationpriority: medium
manager: raynew
audience: ITPro
ms.collection: 
- m365-security
- tier2
- usx-security
- sentinel-only
ms.topic: how-to
ms.date: 11/21/2024
search.appverid: met150
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
---

# Merge incidents manually in the Microsoft Defender portal

Incidents are automatically created in the Microsoft Defender portal when suspicious activities are detected. When two or more incidents describe parts of the same attack story, Defender usually merges two or more incidents into a single incident automatically, to help you investigate incidents more efficiently and effectively and resolve them more quickly and accurately.

Sometimes, however, the automatic merging doesn't happen, due to certain conditions that prevent it. To learn more about when incidents are or aren't merged, see [Incident correlation and merging](alerts-incidents-correlation.md#incident-correlation-and-merging). In these circumstances, or if you decide independently that two or more (unmerged) incidents are related and should be investigated as a single unit, you can merge them manually. This article explains how to do so.


