---
title: Set up Azure Policy guest configuration on machines protected by Microsoft Defender for Cloud
description: Learn how to install the guest configuration on machines protected by Microsoft Defender for Cloud to assess OS misconfigurations. 
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 07/31/2023
---

# Set up Azure Policy machine configuration

Microsoft Defender for Cloud provides security recommendations to improve your organizational security posture and reduce risk. An important element in risk reduction is to harden machines across your business environment.

- When you enable Defender for Cloud on a subscription, free foundational cloud security posture management (CSPM) capabilities assesses the configuration of protected resources against the [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction).
- The MCSB covers Azure, AWS, and GCP (in preview) environments. As part of the MCSB, compute security baselines assess compliance for [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems.


Machine information is gathered using the Azure Policy machine configuration (formerly known as the guest configuration) of the machine. This article describes how to set up the guest configuration on Azure machines.

- For AWS/GCP machines, the machine configuration is installed by default when you select Arc provisioning in the [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md) connector.
- For on-premises machines, the machine configuration is enabled by default when you [onboard on-premises VMs as Azure Arc-enabled VMs](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).


> [!NOTE]
> - Collection with the machine configuration replaces the older method of data collection that used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)). Use of the MMA will be supported until November 2024.
> - When using the machine configuration to collect data, Defender for Servers Plan 2 must be enabled in order to receive OS recommendations based on compute security baselines in the MCSB. Recommendations provided by the MCSB that aren't part of Windows and Linux compute security baselines are part of free foundational CSPM.
> - Additional features provided by Azure Policy machine configuration outside of Defender for Cloud aren't included, and are subject to Azure Policy machine configuration pricing. For example [remediation](/azure/governance/machine-configuration/concepts/remediation-options) and [custom policies](/azure/governance/machine-configuration/how-to/create-policy-definition). [Review details](https://azure.microsoft.com/pricing/details/azure-policy/?msockid=06fc23a2aac2601229353214abbf61f1) on the Azure Policy machine configuration pricing page.



## Prerequisites

- [Enable Defender for Servers Plan 2](plan-defender-for-servers-select-plan.md).
- Review supported Azure VMs and Azure Arc VMs running  [Windows](support-matrix-defender-for-servers.md#windows-machine-support) and [Linux](support-matrix-defender-for-servers.md#linux-machine-support).
- Review [deployment requirements](zure/governance/machine-configuration/overview#enable-machine-configuration) for Azure VMs.
- To view the recommendations and explore the OS baseline data, you need Read permission on the relevant Azure subscription.
- These Azure policies are enabled with the guest configuration. Make sure you don't remove them or you won't be able to leverage the guest configuration.
    - "Windows machines should meet requirements of the Azure compute security baseline" 
    - "Linux machines should meet requirements for the Azure compute security baseline"


## Install on an Azure machines

With Defender for Servers Plan 2 enabled, you can install the machine configuration extension on machines using a Defender for Cloud recommendation.

1. Search for the appropriate recommendations.

    - **Azure machines**: Search for the recommendation [Guest Configuration extension should be installed on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/6c99f570-2ce7-46bc-8175-cde013df43bc).
    - **Azure VMs**: On Azure VMs only, you must assign a managed identity to the machine. To do this, search for the recommendation [virtual machines Guest Configuration extension should be deployed with system-assigned managed identity](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/69133b6b-695a-43eb-a763-221e19556755)
1. Remediate the recommendations as needed.

### Autoprovision the guest configuration extension

For Azure VMs, you can autoprovision installation of guest configuration extension on Azure VMs across the entire subscription.

1. In Defender for Cloud, open **Environment settings** > **Your subscription** > **Settings & Monitoring**.
1. Under **Settings**, select **Guest Configuration**.

    :::image type="content" source="media/prepare-deprecation-log-analytics-mma-agent/setting-and-monitoring.png" alt-text="Screenshot that shows the location of the settings and monitoring button." lightbox="media/prepare-deprecation-log-analytics-mma-agent/setting-and-monitoring.png":::

1. Toggle the Guest Configuration agent (preview) to **On**.

    :::image type="content" source="media/prepare-deprecation-log-analytics-mma-agent/toggle-guest.png" alt-text="Screenshot that shows the location of the toggle button to enable the Guest Configuration agent." lightbox="media/prepare-deprecation-log-analytics-mma-agent/toggle-guest.png":::

1. Select **Continue**.


With the guest configuration extension enabled on machine, the machine can then be assessed against [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems baselines.




## Next step

[Review](apply-security-baseline.md) OS misconfiguration recommendations

