---
title: Review Operating system misconfiguration recommendations in Microsoft Defender for Cloud
description: Learn how Microsoft Defender for Cloud uses the guest configuration to compare machine OS settings with baselines in Microsoft Cloud Security Benchmark.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 07/31/2023
---

# Review OS misconfiguration recommendations

To reduce a machine's attack surface and security risk, it's important to configure the operating system as securely as possible. The [Microsoft Cloud Security Benchmark (MCSB)](azure/security/benchmarks/azure/introduction) provides hardening baselines for [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](azure/governance/policy/samples/guest-configuration-baseline-linux) machines.

> [!NOTE]
> The Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) is set to retire. Defender for Servers dependency on the MMA agent will be phased out by November 2024. [Learn more](prepare-deprecation-log-analytics-mma-agent.md) about the roadmap for features that currently rely on this agent. 

Microsoft Defender for Cloud assesses machines against MCSB baselines. Defender for Cloud collects operating system information for assessment as follows:

- **Foundational CSPM**: The free foundational CSPM capabilities of Defender for Cloud collects operating system information from VMs using the MMA.
- **Defender for Servers**: Defender for Servers Plan 2 uses the [Azure Policy Guest Configuration Extension](/azure/virtual-machines/extensions/guest-configuration)
    - Using the Guest Configuration to collect machine information is currently in preview.
    - When this method becomes generally available, it will replace the existing generally available method that uses the MMA.


## Prerequisites

- Review supported Azure VMs and Azure Arc VMs running  [Windows](support-matrix-defender-for-servers.md#windows-machine-support.md) and [Linux](support-matrix-defender-for-servers.md#linux-machine-support).
- To use the Guest Configuration on VMs, machines must have:
    -  The Azure Machine Configuration extension installed.
    - A system-assigned managed identity assigned to the VM (used to read and write to the Guest Configuration service).
    - Be members of a workgroup.
- To install the Guest Configuration extension you need Write permission on the relevant machines.
- To view the recommendations and explore the OS baseline data, you need Read permission on the relevant Azure subscription.



## Assess machines against security baselines

Compare machines with [Windows](../governance/policy/samples/guest-configuration-baseline-windows.md) and [Linux](azure/governance/policy/samples/guest-configuration-baseline-linux) baselines in the MCSB compliance standard.


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
Learn more about the [Microsoft Cloud Security Benchmark](concept-regulatory-compliance.md) in Defender for Cloud.
