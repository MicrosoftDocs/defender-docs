---
title: Get started with Microsoft Security Exposure Management
description: This article describes how to start using Microsoft Security Exposure Management.
keywords: Microsoft Security Exposure Management, cyber security,
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

# Get started with Microsoft Security Exposure Management

 The article describes how to get started with Security Exposure Management.

[!INCLUDE [prerelease](../includes//prerelease.md)]

 Security Exposure Management is available with any E5 or P2 license, and is available as soon as you sign up for any E5 or P2 license. Initially, your data uses the default settings in Security Exposure Management.


## Reviewing security exposure state

On the Exposure Management Overview dashboard dashboard you can review the state of your organizational exposure. Use the Overview dashboard as a starting point for organizational posture and exposure, and drill down as needed.


:::image type="content" source="./media/exposure-management-overview.png" alt-text="Screenshot of the security exposure management overview page.":::

## Review assets

Get a quick view of your organization's exposed assets. The overview includes all your onboarded devices, those discovered devices not yet onboarded, internet facing devices, and cloud resources. Knowing what is exposed allows you to address any asset exposure risks.

## Review key initiatives

Key initiatives are made up of initiatives that are marked as favorites in the [Initiatives](initiatives.md) page, and any newly added recommended initiatives. Select an individual key initiative to see the initiative summary or open its page. You can also navigate to all initiatives from this section.

:::image type="content" source="./media/key-initiatives.png" alt-text="Screenshot of Security Exposure Management Overview key initiatives section":::

:::image type="content" source="./media/key-initiatives-example_summary.png" alt-text="Screenshot of an Overview key initiatives summary window.":::

## Review top metrics

The top metrics section identifies the security metrics with the most significant exposure. It shows you the current exposure value, 14 day change trend, and associated recommendations. Drilling down into an individual security metric takes you to its metric page. You can also access all metrics from this section.


## Review critical assets

The critical asset summary shows you how many critical assets you have and how many have attack paths that put them at risk. It allows you to drill down further to:

- Manage critical assets
- View critical devices in the inventory
- View critical assets from an advanced hunting view


### Manage critical assets

In [Critical asset management](critical-asset-management.md) you can manage the criticality level of predefined asset of interests identified by Microsoft, and create custom classification rules to detect critical assets. 

:::image type="content" source="./media/critical-asset-management-summary.png" alt-text="Screenshot of Critical asset management in the Critical asset summary window.":::

### View assets in inventory/advanced hunting

You can review critical assets in the context of the Defender XDR inventory and in Defender XDR [advanced hunting](/microsoft-365/security/defender/advanced-hunting-overview.md).


In the device inventory you can access:

- Critical devices
- Critical devices with high risk
- Highly exposed critical devices
- Internet-facing critical devices

In advanced hunting you can access:

- Critical identities
- Critical cloud resources  

:::image type="content" source="./media/critical-asset-management-devices-advanced-hunting.png" alt-text="Screenshot of the Security Exposure Management Overview view in device inventory and advanced hunting section":::



## Review recent security events

The Recent security events section displays security events from the past week <!-- confirm--> sorted by all events or by either initiatives or metrics drift. Select the **View all events** button to view a complete list of all events occurring in your organization.





<!--## Security Initiatives

Microsoft Security Exposure Management Security Initiatives are a means to measure the maturity of an organization's various security concerns, priorities, and threats.  You can review your product specific and threat specific initiatives as well as customize scores and prioritize the initiatives on the overview dashboard.

[Initiatives](https://security.microsoft.com/exposure-initiatives) can be accessed through the dashboard or in the [Microsoft Defender portal](https://security.microsoft.com/) through the navigation bar under **Exposure Management -> Exposure Insights -> Initiatives**.

:::image type="content" source="./media/initiatives-dashboard.png" alt-text="screenshot of the initiatives dashboard":::

For more information, see [Review security initiatives](initiatives.md).-->

## Next steps

- [Explore cross-workload attack surfaces](attack-surface-management-overview.md)
- [Identify and manage critical assets](critical-asset-management.md)
- [Improve security insights with exposure insights](exposure-insights-overview.md)

