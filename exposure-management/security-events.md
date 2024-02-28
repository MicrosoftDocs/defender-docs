---
title: Explore security events
description: This article describes Microsoft Security Exposure Management events and how it works.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Explore security events

[!INCLUDE [prerelease](../includes//prerelease.md)]
<!--Event types including the logic for each type -->
Microsoft Security Exposure Management Security Events present and track initiative and metric drift incidents in order to determine how they affect the organizations security posture.
<!--The Microsoft Security Exposure Management Security Events provides information about any posture management changes detected, enabling customers to make adjustments to maintain a robust security posture. It measures the drift, or worsening in the metric status. In particular, Security Events handles *Initiative Drift Events* and *Metric Drift Events*.

- *Metric drift events* notify customers when there's a new exposure measured by the security metrics. They're evaluated based on the impact on the score and its weight. If there's a decrease of at least 2% since yesterday of at least 2%, meaning exposure grew by 2%, the change is considered a drift event.
- *Initiative drift events* notify customers when security initiatives decrease. We assess *Initiative drift events* based on how it impacts the score. If there's a decrease of at least 2% since yesterday, the change is classified as a drift event.-->

You can find [Events](https://security.microsoft.com/exposure-events) in the [Microsoft Defender portal](https://security.microsoft.com). To navigate to Events, go to **Security Exposure Management -> Exposure Insights -> Events**.

## View security events

<!--The Exposure Overview page shows the last five events in chronological order. Select the **View all events** button to view a complete list of all events occurring in your organization over the past 90 days.-->
The following information is available to review from the Events overview page:

- **Event**
- **Date**
- **Type**

:::image type="content" source="./media/events-navigation.png" alt-text="Screenshot of the Security Exposure Management Events window.":::
<!--should this be rearranged so first access events then talk about drift events and then the details?-->

You can choose to sort events by type, either metric or initiative drift events. Metric drift events display a change greater than two percent in exposure measured by each [security metric](security-metrics.md) and initiative drift events measure the change in exposure of [security initiatives](initiatives.md) greater than two percent. Selecting an event takes you to either the metric or initiative that experienced a drift event.

> [!NOTE]
> Drift amount is currently not configurable. Additionally, affected entities are not included in the drift notification.

## Review drift event

You can drill down into each individual initiative drift or metric drift event. The overview displays different content based on the type of drift event.

### Initiative drift event

You can view the following information for each initiative drift event:

- **Description** of the event
- **Related threats**
- **Top related metrics**
- **Related security metrics**
- Related **Security recommendations** and a means to manage them
- **History** depicted as a graph based on the time range chosen
- Dates with change events by date and:
 - **Related metrics** by number
 - **Change** as a percentage

### Metric drift event

You can view the following information for each metric drift event:

- Description
- Related security recommendations and a means to manage them
- Specific affected items and the number they make of the total
- Last state update
- Event category
- Current value
- Weight
- Score impact

You can also edit the metric value by editing its weight. This customizes the metric to your organization's business priorities.

## Next steps

For more information, see:

- [Secure Score](secure-score.md)
- [!INCLUDE [support](../includes//support.md)]
