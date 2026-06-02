---
title: Discover sensitive data in cloud resources
description: Learn how to discover resources with sensitive data types in the Data and AI security dashboard in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 06/02/2026
author: ElazarK
ms.author: elkrieger
#customer intent: As a security administrator, I want to discover sensitive data so that I can protect it.
---

# Discover sensitive data in cloud resources

Use sensitive data discovery in Microsoft Defender for Cloud to find cloud resources that expose sensitive information. This article shows you how to open sensitive data findings in the Data and AI security dashboard and investigate related recommendations and alerts. If you plan to follow these steps, complete the prerequisites in the next section first.

## Prerequisites

Before you can discover sensitive data in your cloud resources, complete the following prerequisites:

- Enable Defender cloud security posture management (Defender CSPM). For setup instructions, see [Enable Defender CSPM](tutorial-enable-cspm-plan.md).
- Enable sensitive data discovery. For setup instructions, see [Enable Defender CSPM plan components](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan).
- Enable Defender for Storage. For setup instructions, see [Enable Defender for Storage](tutorial-enable-storage-plan.md).
- Enable Defender for Databases. For setup instructions, see [Enable Defender for Databases](tutorial-enable-databases-plan.md).
- Register each relevant Azure subscription to the Microsoft.Security resource provider. For setup instructions, see [Register resource provider](/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider).

## View resources with sensitive data

Resources with sensitive data are at risk of unauthorized access. Use this procedure to identify those resources and investigate the related findings.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Data and AI security dashboard**.

1. In **Data closer look**, select **View all resources with sensitive info types**.

    :::image type="content" source="media/discover-sensitive-data/view-all-resources.png" alt-text="Screenshot of the Data and AI security dashboard that shows where the view all resources with sensitive data type button is located." lightbox="media/discover-sensitive-data/view-all-resources.png":::

1. Select **Search**.

    :::image type="content" source="media/discover-sensitive-data/search-button.png" alt-text="Screenshot that shows where the search button is located on the Cloud Security Explorer page." lightbox="media/discover-sensitive-data/search-button.png":::

1. Review each record found and select **View details** to see more information about the resource.

1. Select the resource name to view all recommendations and alerts associated with that resource.

1. Remediate recommendations. For guidance, see [Implement security recommendations](implement-security-recommendations.md).

1. Respond to the related alerts. For guidance, see [Respond to a security alert](manage-respond-alerts.md#respond-to-a-security-alert).

## Related content

- [Remediate recommendations](implement-security-recommendations.md)
- [Respond to security alerts](manage-respond-alerts.md#respond-to-a-security-alert)

