---
title: Review Operating system misconfiguration recommendations in Microsoft Defender for Cloud
description: Learn how Microsoft Defender for Cloud uses the guest configuration to compare machine OS settings with baselines in Microsoft Cloud Security Benchmark.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 07/31/2023
---

# Review OS misconfigurations (Cloud Security Baseline)

Microsoft Defender for Cloud provides security recommendations to improve your organizational security posture and reduce risk. An important element in risk reduction is to harden machines across your business environment.

When you enable Defender for Cloud on a subscription, free foundational cloud security posture management (CSPM) capabilities assesses the configuration of protected resources against the [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction).

The MCSB covers Azure, AWS, and GCP (in preview) environments, and includes compute security baselines that assess compliance for [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems.

> [!NOTE]
> Machine information is gathered using the Azure Policy guest configuration of the machine. This feature is currently in preview and is expected to release to general availability (GA) around September 2024.
> - The guest configuration will replace the older method of data collection that used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)).
> - Use of the MMA will be supported until November 2024.
> - With the GA of the guest configuration method, OS recommendations based on compute security baselines in the MCSB will no longer be included in Defender for Cloud foundational CSPM. These recommendations will be available when Defender for Servers Plan 2 is enabled. 
> - Recommendations provided by the MCSB that aren't part of Windows and Linux compute security baselines continue to be part of free foundational CSPM.


## Prerequisites

- Review supported Azure VMs and Azure Arc VMs running  [Windows](support-matrix-defender-for-servers.md#windows-machine-support) and [Linux](support-matrix-defender-for-servers.md#linux-machine-support).
- To use the Guest Configuration on VMs, machines must have:
    -  The Azure Machine Configuration extension installed.
    - A system-assigned managed identity assigned to the VM (used to read and write to the Guest Configuration service).
    - Be members of a workgroup.
- To install the Guest Configuration extension you need Write permission on the relevant machines.
- To view the recommendations and explore the OS baseline data, you need Read permission on the relevant Azure subscription.
- These Azure policies are enabled with the guest configuration. Make sure you don't remove them or you won't be able to leverage the guest configuration.
    - "Windows machines should meet requirements of the Azure compute security baseline" 
    - "Linux machines should meet requirements for the Azure compute security baseline"


## Install the guest configuration extension

With Defender for Servers Plan 2 enabled, you can install the guest configuration extension on machines using a Defender for Cloud recommendation.

1. Enable that machines [meet support requirements](/azure/governance/machine-configuration/overview) for the extension.
2. Install the extension.

    - **Azure machines**: Install by remediating the recommendation [Guest Configuration extension should be installed on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/6c99f570-2ce7-46bc-8175-cde013df43bc). 
    - **Azure VMs only**:
        - Managed identity must be assigned to the machine. To do this, remediate the recommendation [Virtual machines Guest Configuration extension should be deployed with system-assigned managed identity](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/69133b6b-695a-43eb-a763-221e19556755)
        - For Azure VMs you can [autoprovision the Azure Policy guest configuration agent](#autoprovision-the-guest-configuration-extension-on-azure-vms), available in preview.
    - **AWS/GCP**: The guest configuration is installed by default when you select Arc provisioning in the [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md) connector.
    - **On-premises machines**: The guest configuration is enabled by default when you [onboard on-premises VMs as Azure Arc-enabled VMs](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

With the guest configuration extension enabled on machine, the machine can then be assessed against [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems baselines.

### Autoprovision the guest configuration extension on Azure VMs

For Azure VMs, you can autoprovisiong installation of guest configuration extension on Azure VMs. This feature is available in preview.

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Navigate to **Environment settings** > **Your subscription** > **Settings & Monitoring**.
1. Under **Settings**, select **Guest Configuration**.

    :::image type="content" source="media/prepare-deprecation-log-analytics-mma-agent/setting-and-monitoring.png" alt-text="Screenshot that shows the location of the settings and monitoring button." lightbox="media/prepare-deprecation-log-analytics-mma-agent/setting-and-monitoring.png":::

1. Toggle the Guest Configuration agent (preview) to **On**.

    :::image type="content" source="media/prepare-deprecation-log-analytics-mma-agent/toggle-guest.png" alt-text="Screenshot that shows the location of the toggle button to enable the Guest Configuration agent." lightbox="media/prepare-deprecation-log-analytics-mma-agent/toggle-guest.png":::

1. Select **Continue**.

## Review OS baseline recommendations

1. In Defender for Cloud, open the **Recommendations** page.
1. Select the relevant recommendation.
    - For **Windows** machines, [Vulnerabilities in security configuration on your Windows machines should be remediated (powered by Guest Configuration)](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/8c3d9ad0-3639-4686-9cd2-2b2ab2609bda).
    - For **Linux** machines, [Vulnerabilities in security configuration on your Linux machines should be remediated (powered by Guest Configuration)](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/1f655fb7-63ca-4980-91a3-56dbc2b715c6)  
    
        :::image type="content" source="media/apply-security-baseline/recommendations-baseline.png" alt-text="The two recommendations for comparing the OS configuration of machines with the relevant Azure security baseline." lightbox="media/apply-security-baseline/recommendations-baseline.png":::

1. On the recommendation details page you can see the affected resources, and specific security checks that failed.
title: Remediate guest configuration recommendations
description: Learn how to enable Azure Policy guest configuration in Microsoft Defender for Cloud and ensure a secure computing environment.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 09/01/2024
#customer intent: As a security administrator, I want to enable Azure Policy guest configuration in Microsoft Defender for Cloud so that I can compare my OS with the guidance from Microsoft cloud security benchmark and ensure a secure computing environment.
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

> [!IMPORTANT]
> Be aware that additional features provided by Azure Policy guest configuration that exist outside of the Defender for Cloud portal aren't included with Defender for Cloud, and are subject to Azure Policy guest configurations pricing policies. For example [remediation](/azure/governance/machine-configuration/concepts/remediation-options) and [custom policies](/azure/governance/machine-configuration/how-to/create-policy-definition). For more information, see the [Azure Policy guest configuration pricing page](https://azure.microsoft.com/pricing/details/azure-policy/?msockid=06fc23a2aac2601229353214abbf61f1).

- Review the [support matrix for the Azure Policy guest configuration](/azure/governance/machine-configuration/overview).

- Install the Azure Policy guest configuration on your machines:

    - **Azure machines**: In the Defender for Cloud portal, on the recommendations page, search for and select [Guest Configuration extension should be installed on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/6c99f570-2ce7-46bc-8175-cde013df43bc), and [remediate the recommendation](implement-security-recommendations.md).

    - **Azure VMs only** You must Assign managed Identity in the Defender for Cloud portal. Navigate to the recommendations page. Search for and select [Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/69133b6b-695a-43eb-a763-221e19556755). Then [remediate the recommendation](implement-security-recommendations.md).
    
    - (Optional) **Azure VMs only**: Enable [Azure Policy guest configuration across your entire subscription](configure-servers-coverage.md#enable-azure-policy-guest-configuration).

    - Enable Azure Policy guest configuration extension on your Azure machines across your entire subscription:
        
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

<<<<<<< HEAD
1. Select a finding to drill down.
=======
Once the Azure Policy guest configuration is onboarded to your subscription, Defender for Cloud starts evaluating your VMs against the security baselines. Based on your environments, if misconfigurations are found, the following recommendations might appear on your recommendations page:
>>>>>>> 532a6886f558a815cc5ca3ef8478bd861ec09fc8

- [Vulnerabilities in security configuration on your Windows machines should be remediated (powered by Guest Configuration)](recommendations-reference-compute.md)
- [Vulnerabilities in security configuration on your Linux machines should be remediated (powered by Guest Configuration)](recommendations-reference-compute.md)

1. Open **Affected resources** to see affected machines.
1. To drill down to findings for a single machine, select it on the **Unhealthy resources** tab. A page will open listing only the findings for that machine.
**To review and remediate these**: 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Defender for Cloud** > Recommendations**.

When you turn on a paid plan in Defender for Cloud, you can enable other compliance standards, in addition to the default MCSB. Learn more about [available compliance standards](concept-regulatory-compliance-standards.md) in Defender for Cloud.
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
