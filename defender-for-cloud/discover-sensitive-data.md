---
title: Discover sensitive data in cloud resources
description: Learn how to discover resources with sensitive data types in the Data and AI security dashboard in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to discover sensitive data so that I can protect it.
ai-usage: ai-assisted
---

# Discover sensitive data in cloud resources

Use sensitive data discovery in Microsoft Defender for Cloud to find cloud resources that expose sensitive information. This article shows you how to open sensitive data findings in the Data and AI security dashboard and investigate related recommendations and alerts. If you plan to follow these steps, complete the [Prerequisites](#prerequisites) first.

## Prerequisites

Complete these steps before you start:

- [Enable Defender CSPM](tutorial-enable-cspm-plan.md).
- [Enable sensitive data discovery](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan).
- [Enable Defender for Storage](tutorial-enable-storage-plan.md).
- [Enable Defender for Databases](tutorial-enable-databases-plan.md).
- [Register each Azure subscription](/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider) to the Microsoft.Security resource provider.

## View resources with sensitive data

Resources with sensitive data might be exposed to unwanted access. Use these steps to find those resources and review the results.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Data and AI security dashboard**.

1. In Data closer look, select **View all resources with sensitive info types**.

    :::image type="content" source="media/discover-sensitive-data/view-all-resources.png" alt-text="Screenshot of the Data and AI security dashboard that shows where the view all resources with sensitive data type button is located." lightbox="media/discover-sensitive-data/view-all-resources.png":::

1. Select **Search**.

    :::image type="content" source="media/discover-sensitive-data/search-button.png" alt-text="Screenshot that shows where the search button is located on the Cloud Security Explorer page." lightbox="media/discover-sensitive-data/search-button.png":::

1. Review each record found and select **View details** to see more information about the resource.

1. Select the resource name to see its recommendations and alerts.

1. Remediate recommendations. For guidance, see [Implement security recommendations](implement-security-recommendations.md).

1. Respond to the related alerts. For guidance, see [Respond to a security alert](manage-respond-alerts.md#respond-to-a-security-alert).

## Related content

- [Remediate recommendations](implement-security-recommendations.md)
- [Respond to security alerts](manage-respond-alerts.md#respond-to-a-security-alert)

