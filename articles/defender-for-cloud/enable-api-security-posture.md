---
title: Enable API security posture management
description: Learn how to enable API security posture management in Microsoft Defender for Cloud to protect your APIs.
ms.author: elkrieger
author: Elazark
ms.topic: how-to

ms.date: 04/25/2025
ms.custom: sfi-image-nochange, references_regions
#customer intent: As a cloud administrator, I want to learn how to enable API security posture management to protect my APIs in Azure API Management, Function Apps, and Logic Apps.
---

# Enable API security posture with Defender CSPM  

The Defender Cloud Security Posture Management (CSPM) plan in Microsoft Defender for Cloud gives you a complete view of your APIs across Azure API Management, Function Apps, and Logic Apps. It helps you improve API security by finding misconfigurations and vulnerabilities. This article explains how to enable API security posture management in your Defender CSPM plan and assess your API security. Defender CSPM onboards APIs without an agent and regularly checks for risks and sensitive data exposure. It provides prioritized risk insights and mitigation through API attack path analysis and security recommendations.

> [!NOTE]
> API discovery and security posture capabilities in Microsoft Defender for Cloud now also support **Function Apps** and **Logic Apps**. This feature is currently available in **Preview**. 

## Prerequisites
  
- Read about [Improve your API security posture](api-security-posture-overview.md).  
- You need a Microsoft Azure subscription. If you don't have one, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial).  
- Enable [Defender for Cloud on your Azure subscription](connect-azure-subscription.md).  
- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.
- The **Subscription Owner** must enable the CSPM plan to access all features.  
- Ensure the APIs you want to protect are deployed in [Azure API Management](/azure/api-management/api-management-key-concepts), [Function Apps](/azure/azure-functions/functions-overview), or [Logic Apps](/azure/logic-apps/logic-apps-overview).

## Cloud and region support

API Security Posture Management within Defender CSPM is available in the Azure commercial cloud, in the following regions:

- Asia (Southeast Asia, EastAsia)
- Australia (Australia East, Australia Southeast, Australia Central, Australia Central 2)
- Brazil (Brazil South, Brazil Southeast)
- Canada (Canada Central, Canada East)
- Europe (West Europe, North Europe)
- India (Central India, South India, West India)
- Japan (Japan East, Japan West)
- UK (UK South, UK West)
- US (East US, East US 2, West US, West US 2, West US 3, Central US, North Central US, South Central US, West Central US, East US 2 EUAP, Central US EUAP)

Review the latest cloud support information for Defender for Cloud plans and features in the [cloud support matrix](support-matrix-defender-for-cloud.md).

## API support

**Feature** | **Supported**
--- | ---
Availability | **Azure API Management:** This feature is available in the Premium, Standard, Basic, and Developer tiers of Azure API Management. Does not support APIs that are exposed using the API Management [self-hosted gateway](/azure/api-management/self-hosted-gateway-overview), or managed using API Management [workspaces](/azure/api-management/workspaces-overview). <br/><br/>**Azure App Services:** Supported Azure Function App hosting tiers include Premium, Elastic Premium, Dedicated (App Service), and App Service Environment (ASE). For Azure Logic Apps, supported tiers include Standard (Single-Tenant) and App Service Environment (ASE). Consumption tier Function Apps, Consumption tier Logic Apps, and Azure Arc-enabled Logic Apps are not supported.
API types | Support only for REST APIs.

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

## Investigate API security recommendations

API endpoints are continuously assessed for misconfigurations and vulnerabilities, including authentication flaws and inactive APIs. Security recommendations are generated with associated risk factors like external exposure and data sensitivity risks. The importance of the security recommendations is calculated based on these risk factors. Learn more about [risk-based security recommendations](security-recommendations.md#understanding-risk-prioritization).

To investigate your API security posture recommendations:

1. Navigate to the Defender for Cloud main menu and select **Recommendations**.
1. Use the **Group by Title** toggle to organize recommendations.
1. Apply filters to narrow down API-related recommendations. Filter by **Resource Type** (e.g., **API Management Operation** or **API Endpoint**), or filter by **Recommendation Name** to target specific API security issues.

To explore the full list of API-related recommendations, see the [APIs section](recommendations-reference-api.md) in the Defender for Cloud recommendation reference guide.

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
