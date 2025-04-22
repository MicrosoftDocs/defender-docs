---
title: Enable API security posture management
description: Learn how to enable API security posture management in Microsoft Defender for Cloud to protect your APIs in Azure API Management.
ms.author: dacurwin
author: dcurwin
ms.topic: how-to
ms.date: 11/05/2024
#customer intent: As a cloud administrator, I want to learn how to enable API security posture management to protect my APIs in Azure API Management.
---

# Enable API security posture with Defender CSPM  

The Defender Cloud Security Posture Management (CSPM) plan in Microsoft Defender for Cloud gives you a complete view of your APIs in Azure API Management. It helps you improve API security by finding misconfigurations and vulnerabilities. This article explains how to enable API security posture management in your Defender CSPM plan and assess your APIs' security. Defender CSPM onboards APIs without an agent and regularly checks for risks and sensitive data exposure. It provides prioritized risk insights and mitigation through API attack path analysis and security recommendations.  

## Prerequisites
  
- Read about [Improve your API security posture](api-security-posture-overview.md).  
- You need a Microsoft Azure subscription. If you don't have one, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial).  
- Enable [Defender for Cloud on your Azure subscription](connect-azure-subscription.md).  
- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.
- The **Subscription Owner** must enable the CSPM plan to access all features.  
- Ensure the APIs you want to protect are published in [Azure API Management](/azure/api-management/api-management-key-concepts). Follow [the instructions](/azure/api-management/get-started-create-service-instance) to set up Azure API Management.

## Enable API security posture management extension
  
1. Sign in to the [Azure portal](https://portal.azure.com/).  
1. Search for and select **Microsoft Defender for Cloud**.  
1. Navigate to **Environment settings**.  
1. Select the relevant subscription in scope.  
1. Go to the Defender CSPM plan and select **Settings**.  
1. Enable **API security posture management**.  

   :::image type="content" source="media/enable-api-security-posture/enable-api-security-posture-management.png" alt-text="Screenshot of Enable API security posture management." lightbox="media/enable-api-security-posture/enable-api-security-posture-management.png":::

1. Select **Save**.  

You'll see a notification message confirming that the settings were saved successfully. Once enabled, APIs start onboarding and appear in your Defender for Cloud Inventory within a few hours.  

## View API inventory

APIs onboarded to the Defender CSPM plan appear in the API security dashboard under **Workload protection** and Microsoft Defender for Cloud **Inventory**.  

1. Navigate to the Cloud Security section of the Defender for Cloud menu and select **API security** under **Advanced Workload protections**.  

   :::image type="content" source="media/enable-api-security-posture/select-api-security.png" alt-text="Screenshot of the API security dashboard." lightbox="media/enable-api-security-posture/select-api-security.png":::

1. The dashboard shows the number of onboarded APIs, broken down by API collections, endpoints, and Azure API Management services. It includes a summary of APIs onboarded for threat detection security coverage with Defender for APIs workload protections plan.  
1. To see APIs onboarded to the Defender CSPM plan for posture protection, apply the filter **Defender plan == Defender CSPM**.  

   :::image type="content" source="media/enable-api-security-posture/filter-defender-cspm.png" alt-text="Screenshot of filtered APIs for Defender CSPM plan for posture." lightbox="media/enable-api-security-posture/filter-defender-cspm.png":::

1. Drill down into the **API collection details** page to review security findings for specific API operations. These are visible in the side context pane when you select an API operation of interest.  

   :::image type="content" source="media/enable-api-security-posture/api-collection-details.png" alt-text="Screenshot of API collection details page." lightbox="media/enable-api-security-posture/api-collection-details.png":::

### API endpoint detailed findings  

1. **Sensitive Information Type**: Provides details on the sensitive information exposed in API URL paths, query parameters, request bodies, and response bodies based on supported data types, along with the source of the information type found. 

1. **Additional Information**: In the case of API response bodies, this shows which HTTP response codes contained sensitive information (such as 2xx, 3xx, 4xx).  

Review API security posture findings along with your API inventory in the Microsoft Defender for Cloud Inventory experience.  

> [!NOTE]
> Sensitive data exposure won't be scanned if the [sensitive data discovery extension](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan) is turned off. Enable sensitive data discovery to scan for sensitive information in your APIs. This setting only affects APIs onboarded to the Defender CSPM plan. If you have the Defender for APIs workload protection plan enabled on the same APIs, they will still be scanned for sensitive data.

1. Navigate to the Microsoft Defender for Cloud menu and select **Inventory**.  
1. Within the **Inventory** page, apply filters by selecting resource types and select **API Management API**, **API Management operation**, and **API Management service** to see all your API assets.  

   :::image type="content" source="media/enable-api-security-posture/inventory-api-assets.png" alt-text="Screenshot of API Management resources in the inventory." lightbox="media/enable-api-security-posture/inventory-api-assets.png":::

## Investigate API security recommendations

API endpoints are continuously assessed for misconfigurations and vulnerabilities, including authentication flaws and inactive APIs. Security recommendations are generated with associated risk factors like external exposure and data sensitivity risks. The importance of the security recommendations is calculated based on these risk factors. Learn more about [risk-based security recommendations](risk-prioritization.md#recommendations).  

To investigate your API security posture recommendations:  

1. Navigate to the Defender for Cloud main menu and select **Recommendations**.  
1. Toggle on **Group by Title** and apply the **Resource Type** filter, selecting **API Management Operation**.  
1. Review the security recommendations, affected resources, risk factors, and risk levels. Take actions to remediate API posture risks.  

   :::image type="content" source="media/enable-api-security-posture/security-recommendations.png" alt-text="Screenshot of API security recommendations." lightbox="media/enable-api-security-posture/security-recommendations.png":::

## Explore API risks and remediate with attack path analysis

The [cloud security explorer](concept-attack-path.md#what-is-cloud-security-explorer) helps you identify potential security risks in your cloud environment by querying the [cloud security graph](concept-attack-path.md#what-is-cloud-security-graph).  

1. Sign in to the [Azure portal](https://portal.azure.com/).  
1. Navigate to **Microsoft Defender for Cloud** > **Cloud Security Explorer**.  
1. Use the built-in query template to quickly identify APIs with security insights.  

   :::image type="content" source="media/enable-api-security-posture/cloud-security-explorer.png" alt-text="Screenshot of Cloud Security Explorer with API security insights query template." lightbox="media/enable-api-security-posture/cloud-security-explorer.png":::

1. Alternatively, [build a custom query with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md) to find API risks and see API endpoints connected to backend compute or data stores. For example, you can see API endpoints routing traffic to virtual machines with remote code vulnerabilities.  

   :::image type="content" source="media/enable-api-security-posture/custom-query.png" alt-text="Screenshot of custom query in Cloud Security Explorer." lightbox="media/enable-api-security-posture/custom-query.png":::

Attack path analysis in Defender for Cloud addresses security issues that pose immediate threats to your cloud applications and environments. [Identify and remediate API-led attack paths](how-to-manage-attack-path.md) to address your most critical API risks that can significantly threaten your organization.  

1. In the Defender for Cloud menu, go to **Attack path analysis**.  
1. Filter by resource type **API Management operation** to investigate API-related attack paths.  

   :::image type="content" source="media/enable-api-security-posture/filter-resource-type.png" alt-text="Screenshot of Attack path analysis filtered by API Management operation." lightbox="media/enable-api-security-posture/filter-resource-type.png":::

1. View the security recommendations for your API endpoints in scope and remediate the recommendations to protect your APIs from high-risk attack surfaces.  

   :::image type="content" source="media/enable-api-security-posture/attack-path.png" alt-text="Screenshot of API security recommendations in Attack path analysis." lightbox="media/enable-api-security-posture/attack-path.png":::

## Offboard API security posture protection

APIs that are part of the Defender CSPM plan can't be offboarded individually. If you want to offboard all APIs from the Defender CSPM plan, go to the Defender CSPM Plan Settings page and disable the API posture extension.  

:::image type="content" source="media/enable-api-security-posture/offboard-api-security-posture.png" alt-text="Screenshot of Disable API security posture management." lightbox="media/enable-api-security-posture/offboard-api-security-posture.png":::

## Related content

- Monitor for API threats using [Defender for APIs Workload Protection](defender-for-apis-deploy.md).
