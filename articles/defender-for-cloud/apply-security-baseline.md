---
title: Remediate guest configuration recommendations
description: Learn how to enable Azure Policy guest configuration in Microsoft Defender for Cloud to gain the benefits of comparing your OS with the guidance from Microsoft cloud security benchmark
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 09/01/2024
---

# Remediate guest configuration recommendations

> [!NOTE]
> As the Log Analytics agent (also known as MMA) is set to retire in [November 2024](https://azure.microsoft.com/updates/were-retiring-the-log-analytics-agent-in-azure-monitor-on-31-august-2024/), all Defender for Servers features that currently depend on it, including those described on this page, will be available through either [Microsoft Defender for Endpoint integration](integration-defender-for-endpoint.md) or [agentless scanning](concept-agentless-data-collection.md), before the retirement date. For more information about the roadmap for each of the features that are currently rely on Log Analytics Agent, see [this announcement](upcoming-changes.md#defender-for-cloud-plan-and-strategy-for-the-log-analytics-agent-deprecation).

Defender for Cloud evaluates baselines misconfiguration for virtual machines (VMs) connected to your subscription. The evaluation assesses your VMs against predefined security baselines, identifying any deviations or misconfigurations that could pose potential risks. By aligning your VMs with security best practices and organizational policies, you can maintain a robust and secure computing environment.

Machine information is collected through the [Azure Policy guest configuration](/azure/virtual-machines/extensions/guest-configuration) and the evaluation is based on Microsoft benchmarks that cover various compliance benchmarks and regulations. For example, CIS, STIG, and more. Azure Policy guest configuration enables the following policies on your subscription: 

- [Azure Policy guest configuration baseline for Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows)

- [Azure Policy guest configuration baseline for Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux)

> [!NOTE]
> If you remove these policies you won't be able to access the benefits of the Azure Policy guest configuration extension.

## Prerequisites

- [Enable Defender for Servers Plan 2 on your subscription](tutorial-enable-servers-plan.md).

- Review the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/) to learn about Defender Servers Plan 2 pricing information.

- Review the [support matrix for the Azure Policy guest configuration](/azure/governance/machine-configuration/overview).

- Install the Azure Policy guest configuration on your machines:

    - **Azure machines**: In the Defender for Cloud portal, on the recommendations page, search for and select [Guest Configuration extension should be installed on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/6c99f570-2ce7-46bc-8175-cde013df43bc), and [remediate the recommendation](implement-security-recommendations.md).

    - **Azure VMs only** You must Assign managed Identity in the Defender for Cloud portal. Navigate to the recommendations page. Search for and select [Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/69133b6b-695a-43eb-a763-221e19556755). Then [remediate the recommendation](implement-security-recommendations.md).
    
    - (Optional) **Azure VMs only**: Enable [Azure Policy guest configuration across your entire subscription](configure-servers-coverage.md#enable-azure-policy-guest-configuration).

    - Autoprovision the Azure Policy guest configuration extension on your Azure machines across your entire subscription:
        
        1. Sign in to the [Azure portal](https://portal.azure.com).
        
        1. Search for and select **Microsoft Defender for Cloud**.
        
        1. Navigate to **Environment settings** > **Your subscription** > **Settings & Monitoring**.
                       
            :::image type="content" source="media/configure-servers-coverage/setting-and-monitoring.png" alt-text="Screenshot that shows the location of the settings and monitoring button." lightbox="media/configure-servers-coverage/setting-and-monitoring.png":::
                    
        1. Toggle the Guest Configuration agent (preview) to **On**.
                       
            :::image type="content" source="media/configure-servers-coverage/toggle-guest.png" alt-text="Screenshot that shows the location of the toggle button to enable the Guest Configuration agent." lightbox="media/configure-servers-coverage/toggle-guest.png":::
                    
        1. Select **Continue**.

    - **GCP and AWS**: Azure Policy guest configuration is automatically installed when you [connect your GCP project](quickstart-onboard-gcp.md), or you [connect your AWS accounts](quickstart-onboard-aws.md) with Azure Arc autoprovisioning enabled, to Defender for Cloud.
    
    - **On-premises machines**: Azure Policy guest configuration is enabled by default when you [onboard on-premises machines as Azure Arc enabled machine or VMs](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm?branch=main).

## Review and remediate guest configuration recommendations

Once the Azure Policy guest configuration is onboarded to your subscription, Defender for Cloud starts evaluating your VMs against the security baselines. Based on your environments, if misconfigurations are found, the following recommendations might appear on your recommendations page:

- [Vulnerabilities in security configuration on your Windows machines should be remediated (powered by Guest Configuration)](recommendations-reference-compute.md)
- [Vulnerabilities in security configuration on your Linux machines should be remediated (powered by Guest Configuration)](recommendations-reference-compute.md)

**To review and remediate these**: 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Defender for Cloud** > Recommendations**.

1. Search for and select one of the recommendations.
    
1. Review the recommendation.
 
1. [Remediate the recommendation](implement-security-recommendations.md).

> [!NOTE]
> During the deprecation process of the Log Analytics agent, also known as the Microsoft Monitoring Agent (MMA), you may receive duplicate recommendations for the same machine. This is due to the fact that the MMA and the Azure Policy guest configuration are both evaluating the same machine. To avoid this, you can [disable the MMA on the machine](prepare-deprecation-log-analytics-mma-agent.md#duplicate-recommendations).

### Query recommendations with API

Defender for Cloud uses [Azure Resource Graph](/azure/governance/resource-graph/overview?branch=main) for API, and portal queries, to query recommendation information. You can utilize these resources to create your own queries to retrieve information.

You can learn how to [review recommendations in Azure Resource Graph](review-security-recommendations.md#review-recommendations-in-azure-resource-graph).

Here are two sample queries you can use:

- **Query all unhealthy rules for a specific resource**

    ```rest
    Securityresources 
    | where type == "microsoft.security/assessments/subassessments" 
    | extend assessmentKey=extract(@"(?i)providers/Microsoft.Security/assessments/([^/]*)", 1, id) 
    | where assessmentKey == '1f655fb7-63ca-4980-91a3-56dbc2b715c6' or assessmentKey ==  '8c3d9ad0-3639-4686-9cd2-2b2ab2609bda' 
    | parse-where id with machineId:string '/providers/Microsoft.Security/' * 
    | where machineId  == '{machineId}'
    ```

- **All Unhealthy Rules and the amount if Unhealthy machines for each**

    ```rest
    securityresources 
    | where type == "microsoft.security/assessments/subassessments" 
    | extend assessmentKey=extract(@"(?i)providers/Microsoft.Security/assessments/([^/]*)", 1, id) 
    | where assessmentKey == '1f655fb7-63ca-4980-91a3-56dbc2b715c6' or assessmentKey ==  '8c3d9ad0-3639-4686-9cd2-2b2ab2609bda' 
    | parse-where id with * '/subassessments/' subAssessmentId:string 
    | parse-where id with machineId:string '/providers/Microsoft.Security/' * 
    | extend status = tostring(properties.status.code) 
    | summarize count() by subAssessmentId, status
    ```

You can learn how to create more in depth queries by learning more about [Azure Resource Graph's query language](/azure/governance/resource-graph/concepts/query-language?branch=main).

> [!NOTE]
> During the deprecation process of the Log Analytics agent, also known as the Microsoft Monitoring Agent (MMA), you may receive duplicate recommendations for the same machine. This is due to the fact that the MMA and the Azure Policy guest configuration are both evaluating the same machine. To avoid this, you can [disable the MMA on the machine](prepare-deprecation-log-analytics-mma-agent.md#duplicate-recommendations).

## Next step

> [!div class="nextstepaction"]
> [Review Docker host hardening recommendations](harden-docker-hosts.md)
