---
title: Review Resources Exempted from Recommendations
description: Learn how to exempt resources in Microsoft Defender for Cloud so they're not taken into account.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 05/25/2025
#customer intent: As a user, I want to learn how to exempt recommendations in Microsoft Defender for Cloud so that I can customize the security recommendations for my environment.
---

# Review resources that are exempted from recommendations

In Microsoft Defender for Cloud, you can [exempt protected resources from Defender for Cloud security recommendations](exempt-resource.md). This article describes how to review and work with exempted resources.

## Review exempted resources in the portal

When you exempt a resource, it doesn't prompt security recommendations. You can review and manage exempted resources in the Defender for Cloud portal.

### Review exempted resources on the Recommendations page

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Select **Recommendation status**.

1. Select **Exempted**.

1. Select **Apply**.

    :::image type="content" source="media/review-exemptions/exempted-resources.png" alt-text="Screenshot of the recommendations page that shows Recommendation status, Exempted, and Apply." lightbox="media/review-exemptions/exempted-resources.png":::

1. Select a resource to review it.

### Review exempted resources on the Inventory page

You can also find all exempted resources on the **Inventory** page.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Inventory**.

1. Select **Add filter**.

    :::image type="content" source="media/review-exemptions/inventory-exemptions.png" alt-text="Screenshot that shows the Defender for Cloud asset inventory page and the filter to find resources with exemptions."  lightbox="media/review-exemptions/inventory-exemptions.png":::

1. Select **Contains exemptions**.

1. Select **Yes**.

1. Select **OK**.

## Review exempted resources with Azure Resource Graph

[Azure Resource Graph (ARG)](/azure/governance/resource-graph/) provides instant access to resource information across your cloud environments with robust filtering, grouping, and sorting capabilities. You can quickly and easily [query information](/azure/governance/resource-graph/first-query-portal) by using [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query/).

To view all recommendations that have exemption rules:

1. In the **Recommendations** page, select **Open query**.
1. Enter the following query and select **Run query**.

    ```kusto
    securityresources
    | where type == "microsoft.security/assessments"
    // Get recommendations in useful format
    | project
    ['TenantID'] = tenantId,
    ['SubscriptionID'] = subscriptionId,
    ['AssessmentID'] = name,
    ['DisplayName'] = properties.displayName,
    ['ResourceType'] = tolower(split(properties.resourceDetails.Id,"/").[7]),
    ['ResourceName'] = tolower(split(properties.resourceDetails.Id,"/").[8]),
    ['ResourceGroup'] = resourceGroup,
    ['ContainsNestedRecom'] = tostring(properties.additionalData.subAssessmentsLink),
    ['StatusCode'] = properties.status.code,
    ['StatusDescription'] = properties.status.description,
    ['PolicyDefID'] = properties.metadata.policyDefinitionId,
    ['Description'] = properties.metadata.description,
    ['RecomType'] = properties.metadata.assessmentType,
    ['Remediation'] = properties.metadata.remediationDescription,
    ['Severity'] = properties.metadata.severity,
    ['Link'] = properties.links.azurePortal
    | where StatusDescription contains "Exempt"    
    ```

## Get a notification when users create exemptions

To keep track of how users exempt resources from recommendations, we created an Azure Resource Manager template (ARM template). The template deploys a logic app playbook and all necessary API connections to notify you when an exemption is created.

- Learn more about the playbook by reading the blog post [How to keep track of Resource Exemptions in Microsoft Defender for Cloud](https://techcommunity.microsoft.com/t5/azure-security-center/how-to-keep-track-of-resource-exemptions-in-azure-security/ba-p/1770580).
- Locate the ARM template in the [Microsoft Defender for Cloud GitHub repository](https://github.com/Azure/Azure-Security-Center/tree/master/Workflow%20automation/Notify-ResourceExemption).
- [Use this automated process](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Security-Center%2Fmaster%2FWorkflow%2520automation%2FNotify-ResourceExemption%2Fazuredeploy.json) to deploy all components.

## Related content

[Review security recommendations](review-security-recommendations.md)
