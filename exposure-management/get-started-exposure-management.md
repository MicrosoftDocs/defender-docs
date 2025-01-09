---
title: Start using Microsoft Security Exposure Management
description: This article describes how to start using the Microsoft Security Exposure Management dashboard
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Start using Microsoft Security Exposure Management

This article describes how to start working with the [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) dashboard.

## Reviewing security exposure state

On the Exposure Management > **Overview** dashboard, you can review the overall state of your organizational security exposure.

Use the dashboard as a starting point for a snapshot of organizational posture and exposure, and drill down to details as needed.

:::image type="content" source="./media/get-started-exposure-management/exposure-management-overview.png" alt-text="Screenshot of the security exposure management overview page." lightbox="./media/get-started-exposure-management/exposure-management-overview.png":::

## Connecting your external security and asset management products

To get the most out of Security Exposure Management, connect your external security and asset management products.

By integrating these products, you can enhance visibility and gain deeper insights into your security posture. Data connectors allow for seamless data flow and aggregation, providing a more comprehensive view of potential vulnerabilities and threats.

## Review assets

Get a quick view of your organization's exposed assets.

You can see onboarded devices, discovered devices not yet onboarded, internet facing devices, and cloud resources.

Knowing what is exposed helps you to address asset exposure risks.

## Review key initiatives

**Key initiatives** show initiatives that are marked as favorites in the [initiatives](initiatives.md) page, and any newly added recommended initiatives.

Select an individual key initiative to drill down. You can also navigate to all initiatives.

:::image type="content" source="./media/get-started-exposure-management/key-initiatives.png" alt-text="Screenshot of Security Exposure Management Overview key initiatives section":::

:::image type="content" source="./media/get-started-exposure-management/key-initiatives-example_summary.png" alt-text="Screenshot of an Overview key initiatives summary window." lightbox="./media/get-started-exposure-management/key-initiatives-example_summary.png":::

## Review top metrics

**Top metrics** identifies the security metrics with the most significant exposure.

You can see the current exposure value, a 14 day change trend, and associated recommendations.

Drilling down into an individual security metric takes you to its metric page. You can also access all metrics.

## Review assets in the map

The **Attack surface map** displays your tenant's total and critical device, identity, and cloud assets.

You can select and search on a specific asset type, and open it in the map.

:::image type="content" source="./media/get-started-exposure-management/attack-surface-map-overview.png" alt-text="Screenshot of the dashboard attack surface exposure map." lightbox="./media/get-started-exposure-management/attack-surface-map-overview.png":::

## Review and manage critical assets

The **Critical asset summary** shows you how many critical assets you have and how many have attack paths that put them at risk.

From here you can view and manage critical assets and devices.

In [Critical asset management](critical-asset-management.md), you can manage the criticality level of assets identified by Security Exposure Management, and create custom classification rules to detect other critical assets.

:::image type="content" source="./media/get-started-exposure-management/critical-asset-management-summary.png" alt-text="Screenshot of critical asset management." lightbox="./media/get-started-exposure-management/attack-surface-map-overview.png":::

### View in device inventory and advanced hunting

You can review critical assets in the context of the Defender XDR device inventory and in Defender XDR [advanced hunting](/defender-xdr/advanced-hunting-overview).

The device inventory provides quick links to devices sorted by:

- Critical devices
- Critical devices with high risk
- Highly exposed critical devices
- Internet-facing critical devices

In advanced hunting, you can quickly access queries for:

- Critical identities
- Critical cloud resources  

:::image type="content" source="./media/get-started-exposure-management/critical-asset-management-devices-advanced-hunting.png" alt-text="Screenshot of the Security Exposure Management Overview view in device inventory and advanced hunting section":::

## Examine key initiative score over time

The **Key initiative score over time** graph shows each key initiative, color coded, with score changes over time.

You can hover over points on the timeline to see what the score of the key initiative was on that date.

## Review recent security events

**Recent security events** displays security events from the past week sorted by all events or by either initiatives or metrics drop. Select the **View all events** button to view a complete list of all events in the last 30 days occurring in your organization.

## Next steps

- [Overview of attack paths](work-attack-paths-overview.md).
- [Identify and manage critical assets](critical-asset-management.md).
- [Improve security insights with exposure insights](exposure-insights-overview.md).
