---
title: Protecting your network resources
description: This document addresses recommendations in Microsoft Defender for Cloud that help you protect your Azure network resources and stay in compliance with security policies.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 11/02/2025
---
# Protect network resources

Microsoft Defender for Cloud continuously analyzes the security state of your Azure resources for network security best practices. When Defender for Cloud identifies potential security vulnerabilities, it creates recommendations that guide you through the process of configuring the needed controls to harden and protect your resources.

Review Defender for Cloud [networking recommendations](recommendations-reference-networking.md).

This article addresses recommendations that apply to your Azure resources from a network security perspective. Networking recommendations center around next generation firewalls, Network Security Groups, Just In Time (JIT) Virtual Machine (VM) access, overly permissive inbound traffic rules, and more. For a list of networking recommendations and remediation actions, see [Managing security recommendations in Microsoft Defender for Cloud](review-security-recommendations.md).

## Review networking resources and their recommendations

The [inventory page](asset-inventory.md) shows your resources by type. Use the resource type filter to see only the networking resources in your environment.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Inventory**.

    :::image type="content" source="media/protect-network-resources/inventory.png" alt-text="Screenshot that shows where the inventory page is located in Defender for Cloud." lightbox="media/protect-network-resources/inventory.png":::

1. Select the **Resource type** filter.

1. Enter **Network**. 

    :::image type="content" source="./media/protect-network-resources/network-filters-inventory.png" alt-text="Asset inventory network resource types." lightbox="./media/protect-network-resources/network-filters-inventory.png":::

1. Select the relevant resource types.

1. Select **Apply**.

1. Hover over the recommendation indicator to see the number of active recommendations for each resource.

    :::image type="content" source="./media/protect-network-resources/resource-recommendations.png" alt-text="Screenshot that shows the active recommendations for a resource." lightbox="./media/protect-network-resources/resource-recommendations.png":::

1. Select a resource to view the affiliated recommendations.

1. Select a recommendation.

1. [Remediate the recommendation](implement-security-recommendations.md).

## Next step

> [!div class="nextstep"]
> [Remediate recommendations](implement-security-recommendations.md)
