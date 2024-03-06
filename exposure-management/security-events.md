---
title: Explore security events in Microsoft Security Exposure Management
description: Learn how to work with security events in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 03/06/2024
---

# Explore security events

Security events in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md)  track initiative and metric score drop incidents in order to determine how they affect organizational security posture.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Prerequisites

[Learn about](exposure-insights-overview.md#security-events) security events

## Review security events

1. in the [Microsoft Defender portal](https://security.microsoft.com), select **Exposure management -> Exposure insights -> Events**.

1. Select the time range you need in the calendar drop down.
1. To filter by initiative score drop events or metric score drop events, select *filter* or the score drop event quantity.
1. Select a specific event to open it in initiatives or metrics.

<!--## View security events
-->
<!--The Exposure Overview page shows the last five events in chronological order. Select the **View all events** button to view a complete list of all events occurring in your organization over the past 90 days.-->
<!--The following information is available to review from the Events overview page:

- **Event**
- **Date**
- **Type**

:::image type="content" source="./media/events-navigation.png" alt-text="Screenshot of the Security Exposure Management Events window.":::
should this be rearranged so first access events then talk about drift events and then the details?-->
<!--
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
-->
## Next steps

- [Work with security initiatives](initiatives.md)
- [Work with security metrics](security-metrics.md)
