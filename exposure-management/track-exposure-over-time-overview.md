---
title: Track exposure over time
description: This article provides an overview of how to track exposure over time with Microsoft Exposure Management.
keywords: Microsoft Exposure Management, exposure insights, cyber security
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.subservice:
ms.localizationpriority: medium
ms.collection: 
- Tier1
- m365-security
search.appverid: met150
audience: ITPro
ms.date: 11/28/2023
---

# Track exposure over time overview

[!INCLUDE [prerelease](../../includes/prerelease.md)]

Tracking events over time provides important insights into an organization's risk exposure over a period of time. The information can help security decision makers manage exposure. Exposure tracking is discussed further in the following sections:

- [History](history.md)
- [Security Events](security-events.md)

## History

Microsoft Security Exposure Management provides a means to record the chronological history and log a series of exposure events over time. The security event history page typically includes details about each exposure event. For instance, the date and time it occurred and the nature of the event such as metric drift, vulnerability discovery, new threat.

For more information, see [History](history.md).

## Security Events

The Microsoft Security Exposure Management Security Events provides information about any posture management changes detected, enabling customers to make adjustments to maintain a robust security posture. It measures the drift, or worsening in the metric status. In particular, Security Events handles *Initiative Drift Events* and *Metric Drift Events*.

- *Metric drift events* notify customers when there's a new exposure measured by the security metrics. They're evaluated based on the impact on the score and its weight. If there's a decrease of at least 2% since yesterday of at least 2%, meaning exposure grew by 2%, the change is considered a drift event.
- *Initiative drift events* notify customers when security initiatives decrease. We assess *Initiative drift events* based on how it impacts the score. If there's a decrease of at least 2% since yesterday, the change is classified as a drift event.
- 
 See [Security events](security-events.md) for more information.
<!-- To access [Events](https://security.microsoft.com/exposure-events), go to **Exposure Management -> Exposure Insights -> Events**. -->

:::image type="content" source="../../media/security-exposure-management/events-navigation.png" alt-text="Screenshot of the Exposure management Events window.":::

For more information, see [Security Events](security-events.md).

## Next steps

For more information, see:

- [History](history.md)
- [Security Events](security-events.md)
- [!INCLUDE [support](../../includes/support.md)]

## See also
