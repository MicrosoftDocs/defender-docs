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

When Defender for Cloud is enabled, by default its foundational cloud security posture management (CSPM) capabilities assesses machine settings against the [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction). The benchmark Covers Azure, AWS, and GCP (in preview) environments, and provides hardening baselines for [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems.

> [!NOTE]
> - Machine information is now gathered with a new method using the Guest Configuration on the machine. This capability is currently in preview and is expected to release to general availability (GA) around September 2024.
> - The older method, that used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) to gather data, will be supported until the end of November 2024.


## Prerequisites

- Review supported Azure VMs and Azure Arc VMs running  [Windows](support-matrix-defender-for-servers.md#windows-machine-support) and [Linux](support-matrix-defender-for-servers.md#linux-machine-support).
- To use the Guest Configuration on VMs, machines must have:
    -  The Azure Machine Configuration extension installed.
    - A system-assigned managed identity assigned to the VM (used to read and write to the Guest Configuration service).
    - Be members of a workgroup.
- To install the Guest Configuration extension you need Write permission on the relevant machines.
- To view the recommendations and explore the OS baseline data, you need Read permission on the relevant Azure subscription.



## Assess machines against the MCSB

Compare machines with [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) baselines in the MCSB compliance standard.


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
