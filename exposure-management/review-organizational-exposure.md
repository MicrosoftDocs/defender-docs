---
title: Review organizational exposure
description: This article describes the Microsoft Security Exposure Management overview dashboard and how it works.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Review organizational exposure

<!--
* glance into APs and how to get strated inevstigating them
  -->
[!INCLUDE [prerelease](../includes//prerelease.md)]

The Microsoft Security Exposure Management dashboard allows you to get a snapshot of your organizational exposure and initiatives with the Overview dashboard.  It allows you to consider your security concerns in a focused way and provides a means to drill down into:

- [Asset overview](#asset-overview)
- [Key initiatives](#key-initiatives)
- [Top or most exposed metrics](#top-metrics)
- [Critical asset summary](#critical-asset-summary)
- [Critical asset management](#critical-asset-management)
- [View in device inventory and in advanced hunting](#view-in-device-inventory-and-in-advanced-hunting)
- [Recent security events](#recent-security-events)

It can be found at [Microsoft Security Exposure Management Overview](https://security.microsoft.com/exposure-overview) in the [Microsoft Defender portal](https://security.microsoft.com/). You can access them in the Microsoft Defender portal by going to **Exposure Management -> Overview**.

:::image type="content" source="./media/security-exposure-management/exposure-management-overview.png" alt-text="Screenshot of the security exposure management overview page.":::

### Asset overview

With assets overview, you can quickly see your organization's exposed assets. The overview includes all your onboarded devices, those discovered devices not yet onboarded, internet facing devices, and cloud resources. Knowing what is exposed allows you to address any asset exposure risks.

### Key initiatives

Key initiatives are made up of initiatives that are marked as favorites in [Initiatives](initiatives.md), and any newly added recommended initiatives. Select an individual key initiative to see the initiative summary or open its page. You can also navigate to all initiatives from this section.

:::image type="content" source="./media/security-exposure-management/key-initiatives.png" alt-text="Screenshot of Security Exposure Management Overview key initiatives section":::

:::image type="content" source="./media/security-exposure-management/key-initiatives-example_summary.png" alt-text="Screenshot of an Overview key initiatives summary window.":::

### Top metrics

The top metrics section identifies the security metrics with the most significant exposure. It shows you the current exposure value, 14 day change trend, and associated recommendations. Drilling down into an individual security metric takes you to its metric page. You can also access all metrics from this section.

### Critical asset summary

The critical asset summary shows you how many critical assets you have and how many have attack paths that put them at risk. It allows you to drill down further to:

- Manage critical assets
- View critical devices in the inventory
- View critical assets from an advanced hunting view

#### Critical asset management

You can access the [Critical asset management](critical-asset-management.md) section from the Critical asset summary. It allows users to manage the criticality level of predefined asset of interests identified by Microsoft and create custom classification rules to detect critical assets. You can also access Critical asset management from **Settings > Microsoft XDR > Rules > Critical asset management** <!-- i put in rules for clarity but it shouldnt really be bolded. -->

:::image type="content" source="./media/security-exposure-management/critical-asset-management-summary.png" alt-text="Screenshot of Critical asset management in the Critical asset summary window.":::

#### View in device inventory and in advanced hunting

The Security Exposure Management Overview allows you to review critical devices in your inventory and critical issues in [Advanced hunting](../defender/advanced-hunting-overview.md). The following views take you to a predefined filter or query for the topics: <!-- is device inventory endpoint related and if so what happens if the customer doesnt have endpoint? -->
You can access these headings from the device inventory:

- Critical devices
- Critical devices with high risk
- Highly exposed critical devices
- Internet-facing critical devices

The following are accessible in advanced hunting:

- Critical identities
- Critical cloud resources  

:::image type="content" source="./media/security-exposure-management/critical-asset-management-devices-advanced-hunting.png" alt-text="Screenshot of the Security Exposure Management Overview view in device inventory and advanced hunting section":::

### Recent security events

The Recent security events section displays security events from the past week <!-- confirm--> sorted by all events or by either initiatives or metrics drift. Select the **View all events** button to view a complete list of all events occurring in your organization.
<!--## Security Initiatives

Microsoft Security Exposure Management Security Initiatives are a means to measure the maturity of an organization's various security concerns, priorities, and threats.  You can review your product specific and threat specific initiatives as well as customize scores and prioritize the initiatives on the overview dashboard.

[Initiatives](https://security.microsoft.com/exposure-initiatives) can be accessed through the dashboard or in the [Microsoft Defender portal](https://security.microsoft.com/) through the navigation bar under **Exposure Management -> Exposure Insights -> Initiatives**.

:::image type="content" source="./media/security-exposure-management/initiatives-dashboard.png" alt-text="screenshot of the initiatives dashboard":::

For more information, see [Review security initiatives](initiatives.md).-->

## Next steps

For more information, see:

- [Explore cross-workload attack surfaces](attack-surface-management-overview.md)
- [Identify and manage critical assets](critical-asset-management.md)
- [Improve security insights with exposure insights](exposure-insights-overview.md)
- [!INCLUDE [support](../includes//support.md)]

## See also
