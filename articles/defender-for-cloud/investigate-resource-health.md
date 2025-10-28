---
title: Tutorial - Investigate the health of your resources
description: 'Tutorial: Learn how to investigate the health of your resources using Microsoft Defender for Cloud.'
ms.topic: tutorial
ms.date: 05/20/2025
ms.custom: sfi-image-blocked
---

# Tutorial: Investigate the health of your resources

The resource health page in Microsoft Defender for Cloud provides a detailed view of a resource’s security posture. It shows applied Defender plans, outstanding recommendations and alerts, and direct actions you can take to improve the resource’s health. If your subscription has a [Microsoft Defender plan](defender-for-cloud-introduction.md), the resource health page also shows any active security alerts for that resource.

:::image type="content" source="media/investigate-resource-health/resource-health-page-virtual-machine.gif" alt-text="Microsoft Defender for Cloud's resource health page showing the health information for a virtual machine":::

In this tutorial, you'll learn how to:

> [!div class="checklist"]
>
> - Access the resource health page for all resource types
> - Evaluate the outstanding security issues for a resource
> - Improve the security posture for the resource

## Prerequisites

Before you begin, make sure that:

You need an Azure subscription. If you don’t have an Azure subscription, create a [free account](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn) before you begin.
- [Microsoft Defender for Cloud is enabled](connect-azure-subscription.md) on your subscription.  
- You’re signed in with an account with one of these permissions:
  - To apply security recommendations: Resource Group Contributor, Resource Group Owner, Subscription Contributor, or Subscription Owner.  
  - To dismiss alerts: Security Admin, Subscription Contributor, or Subscription Owner.

## View a resource’s health information

> [!TIP]
> The examples in this tutorial use a virtual machine, but the resource health page works the same way for all supported resource types.

To view a resource’s health details:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Inventory**.

1. Choose a resource to open its health page.

    :::image type="content" source="media/investigate-resource-health/inventory-select-resource.png" alt-text="Select a resource from the asset inventory to view the resource health page." lightbox="./media/investigate-resource-health/inventory-select-resource.png":::

1. In the left pane, review the subscription, resource status, and monitoring information. You can also see whether enhanced security features are enabled for the resource.

    :::image type="content" source="media/investigate-resource-health/resource-health-left-pane.png" alt-text="The left pane of Microsoft Defender for Cloud's resource health page shows the subscription, status, and monitoring information about the resource. It also includes the total number of outstanding security recommendations and security alerts.":::

1. In the right pane, use the **Recommendations** and **Alerts** tabs to review security findings for the resource.

    :::image type="content" source="media/investigate-resource-health/resource-health-right-pane.png" alt-text="The right pane of Microsoft Defender for Cloud's resource health page has two tabs: recommendations and alerts." lightbox="./media/investigate-resource-health/resource-health-right-pane.png":::

    > [!NOTE]
    > Microsoft Defender for Cloud labels each resource as **healthy** or **unhealthy** depending on its compliance with applicable [security recommendations](security-policy-concept.md).  
    > Even if a resource is marked as **healthy**, the page still lists all related recommendations so you can review its full security posture.

## Evaluate security issues for a resource

The resource health page highlights security recommendations where the resource is **unhealthy** and lists any active security alerts. You can use this view to prioritize and remediate risks directly.

### Remediate a resource

Fix issues identified in Defender for Cloud’s recommendations to meet your organization’s security policies:

1. In the right pane, select a recommendation.

1. Follow the on-screen guidance to apply the recommended remediation.

    > [!TIP]
    > Remediation steps vary by recommendation. To decide which issues to resolve first, consider each recommendation’s severity and its [impact on your secure score](secure-score-security-controls.md).

### Investigate a security alert

Use the alerts tab to review active security alerts for a selected resource.

1. In the right pane, select an alert.

1. Follow the steps in [Respond to security alerts](manage-respond-alerts.md) to review and address the issue.

## Next steps

Learn more about managing and improving your resource security:

- [Respond to security alerts](manage-respond-alerts.md#respond-to-a-security-alert)
- [Review your security recommendations](review-security-recommendations.md)
