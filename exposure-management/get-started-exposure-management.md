---
title: Start using Microsoft Security Exposure Management
description: Learn how to start using the Microsoft Security Exposure Management dashboard to resolve prioritized exposure risks and monitor internet-facing assets.
ms.topic: overview
ms.author: dlanger
author: dlanger
ms.date: 06/28/2026
ms.custom: sfi-image-nochange
ai-usage: ai-assisted
---

# Start using Microsoft Security Exposure Management

The [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) dashboard in the Microsoft Defender portal gives security teams a consolidated, action-oriented view of exposure risk. It consolidates signals from cloud resources and devices, combining internet exposure vulnerabilities, security misconfigurations, and broader risk factors into a single experience, and organizes work around two core actions: **Resolve Now** and **Monitor Exposure**.

## Access Microsoft Security Exposure Management

Microsoft Security Exposure Management is integrated into the Microsoft Defender portal at [security.microsoft.com](https://security.microsoft.com). Navigate to **Exposure Management** > **Overview** to open the dashboard.

Before you start, review [Prerequisites and support](prerequisites.md) for licensing, permissions, and environment requirements.

:::image type="content" source="./media/get-started-exposure-management/exposure-management-overview.png" alt-text="Screenshot of the Exposure Management Overview dashboard showing Resolve Now and Monitor Exposure sections." lightbox="./media/get-started-exposure-management/exposure-management-overview.png":::

## Resolve Now

The **Resolve Now** section surfaces prioritized, actionable items across three categories, focused on internet-exposed and business-critical assets:

- **Patch** — Software updates that address known vulnerabilities, prioritized by internet exposure and business criticality.
- **Mitigate** — Risks you can't immediately patch (primarily zero-day vulnerabilities) with suggested compensating controls.
- **Fix** — Misconfigurations and security weaknesses, particularly around internet-exposed cloud assets that increase your attack surface.

Select any item to drill into the details and follow the linked remediation workflows.

## Monitor Exposure

The **Monitor Exposure** section provides a real-time view of your organization's external attack surface and security posture across domains.

### Internet Exposed Resources

The **Internet Exposed Resources** table shows the breakdown of your internet-facing assets by type: cloud assets, devices, and shadow resources. Use this view to quickly understand the external attack surface where your assets are visible to the internet.

### Domain initiative scores

Domain initiative scores show your organization's current security posture as a percentage versus a target score, across five domains: Code, Endpoint, Cloud, Identity, and SaaS. Use these scores to track progress and identify which domains need the most attention to reach your target posture.

## Next steps

- [Overview of attack paths](work-attack-paths-overview.md).
- [Identify and manage critical assets](critical-asset-management.md).
- [Improve security insights with exposure insights](exposure-insights-overview.md).
