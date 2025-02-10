---
title: Discover sensitive data
description: Learn how to discover resources with sensitive data types in the Data and AI security dashboard in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 02/10/2025
#customer intent: As a security administrator, I want to discover sensitive data so that I can protect it.
---

# Discover sensitive data

Microsoft Defender for Cloud detects resources with sensitive info types, helping you identify and protect sensitive data in your cloud environment. The sensitive data discovery feature in Defender for Cloud scans your cloud resources to identify sensitive data types, such as credit card numbers and social security numbers. This feature helps you locate sensitive data in your cloud environment and take steps to protect it.

## Prerequisites

- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md).
- Enable [sensitive data discovery](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan).
- Enable [Defender for Storage](tutorial-enable-storage-plan.md).
- Enable [Defender for Databases](tutorial-enable-databases-plan.md).

**Roles and permissions**: 

- **Permissions**:

    - Microsoft.Security/assessments/read
    - Microsoft.Security/assessments/subassessments/read
    - Microsoft.Security/alerts/read

- **Role** - the minimum required privileged role-based access control role of **Security explorer**.

- Register each relevant Azure subscription to the [Microsoft.Security resource provider](/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider).

## View resources with sensitive data

Resources containing sensitive data are at risk of exposure to unauthorized users. The sensitive data discovery feature in Defender for Cloud helps you identify resources with sensitive data types, enabling you to take proactive steps to prevent data breaches.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Defender for Cloud** > **Data and AI security dashboard**.

1. Locate the Data closer look section and select **View all resources with sensitive info types**.

    :::image type="content" source="media/discover-sensitive-data/view-all-resources.png" alt-text="Screenshot of the Data and AI security dashboard that shows where the view all resources with sensitive data type button is located." lightbox="media/discover-sensitive-data/view-all-resources.png":::

1. Select **search**.

    :::image type="content" source="media/discover-sensitive-data/search-button.png" alt-text="Screenshot that shows where the search button is located on the Cloud Security Explorer page." lightbox="media/discover-sensitive-data/search-button.png":::

1. Review each record found and select **View details** to see more information about the resource.

1. Select the Resource name to view all recommendations and alerts associated with the resource.

1. [Remediate the recommendations](implement-security-recommendations.md).

1. [Respond to the security alerts](managing-and-responding-alerts.yml#respond-to-a-security-alert).

## Related content

- [Remediate recommendations](implement-security-recommendations.md)
- [Respond to security alerts](managing-and-responding-alerts.yml#respond-to-a-security-alert)
