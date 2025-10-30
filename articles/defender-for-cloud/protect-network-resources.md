---
title: Protecting your network resources
description: This document addresses recommendations in Microsoft Defender for Cloud that help you protect your Azure network resources and stay in compliance with security policies.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 10/30/2025
ms.custom: sfi-image-nochange
---
# Protect network resources

Microsoft Defender for Cloud continuously analyzes the security state of your Azure resources for network security best practices. When Defender for Cloud identifies potential security vulnerabilities, it creates recommendations that guide you through the process of configuring the needed controls to harden and protect your resources.

Review Defender for Cloud [networking recommendations](recommendations-reference-networking.md).

This article addresses recommendations that apply to your Azure resources from a network security perspective. Networking recommendations center around next generation firewalls, Network Security Groups, JIT VM access, overly permissive inbound traffic rules, and more. For a list of networking recommendations and remediation actions, see [Managing security recommendations in Microsoft Defender for Cloud](review-security-recommendations.md).

## Review networking resources and their recommendations

The [inventory page](asset-inventory.md) allows you to view your resources by type. With the resource type filter you can narrow down the visibile resources to only show the networking resources that exist in your environment.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Inventory**.

    :::image type="content" source="media/protect-network-resources/inventory.png" alt-text="Screenshot that shows where teh inventory page is located in Defender for Cloud." lightbox="media/protect-network-resources/inventory.png":::

1. Select the **Resource type** filter.

1. Enter **Network**. 

    :::image type="content" source="./media/protect-network-resources/network-filters-inventory.png" alt-text="Asset inventory network resource types." lightbox="./media/protect-network-resources/network-filters-inventory.png":::

1. Select the relevant resource types.

1. Select **Apply**.

1. Hover over the recommendation indicator to see the number of active recommendations for each resource.

    :::image type="content" source="./media/protect-network-resources/resource-recommendations" alt-text="Screenshot that shows the active recommendations for a resources." lightbox="./media/protect-network-resources/resource-recommendations":::

## Next steps

To learn more about recommendations that apply to other Azure resource types, see the following:

- [Protecting your machines and applications in Microsoft Defender for Cloud](./asset-inventory.md)
