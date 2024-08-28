---
title: Review Operating system misconfiguration recommendations in Microsoft Defender for Cloud
description: Learn how Microsoft Defender for Cloud uses the guest configuration to compare machine OS settings with baselines in Microsoft Cloud Security Benchmark.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 07/31/2023
---

# Review OS misconfigurations (MCSB) 

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
        - For Azure VMs you can [autoprovision the Azure Policy guest configuration agent](#autoprovision-the-guest-configuration-agent), available in preview.
    - **AWS/GCP**: The guest configuration is installed by default when you select Arc provisioning in the [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md) connector.
    - **On-premises machines**: The guest configuration is enabled by default when you [onboard on-premises VMs as Azure Arc-enabled VMs](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

With the guest configuration extension enabled on machine, the machine can then be assessed against [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems baselines.

### Autoprovision the guest configuration agent on Azure VMs

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

    :::image type="content" source="media/apply-security-baseline/recommendation-details-page-vulnerabilities-windows.png" alt-text="Recommendation details page for the Windows recommendation about vulnerabilities in the baseline configuration of Windows machines." lightbox="media/apply-security-baseline/recommendation-details-page-vulnerabilities-windows.png":::

1. Select a finding to drill down.

    :::image type="content" source="media/apply-security-baseline/finding-details.png" alt-text="Learning more about a specific finding from the guest configuration comparison of an OS configuration with the defined security baseline." lightbox="media/apply-security-baseline/finding-details.png":::

1. Open **Affected resources** to see affected machines.
1. To drill down to findings for a single machine, select it on the **Unhealthy resources** tab. A page will open listing only the findings for that machine.

## Next steps

When you turn on a paid plan in Defender for Cloud, you can enable other compliance standards, in addition to the default MCSB. Learn more about [available compliance standards](concept-regulatory-compliance-standards.md) in Defender for Cloud.
