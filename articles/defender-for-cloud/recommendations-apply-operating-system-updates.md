---
title: Apply MCBS recommendations for system updates in Microsoft Defender for Cloud
description: Learn how to apply system update recommendations from MCSB in Microsoft Defender for Cloud
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 06/27/2023
---

# Review OS system update recommendations

To reduce a machine's attack surface and security risk, it's important to configure the operating system as securely as possible. The [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) provides hardening baselines for [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) machines.


To reduce a machine's attack surface it's important to configure the operating system (OS) as securely as possible, including installing the latest system updates to reduce security risk. The [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) provides hardening baselines for machines, including baselines for system updates.

> [!NOTE]
> The Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) is set to retire. Defender for Servers dependency on the MMA agent will be phased out by November 2024. [Learn more](prepare-deprecation-log-analytics-mma-agent.md) about the roadmap for features that currently rely on this agent.

Microsoft Defender for Cloud assesses machines against MCSB baselines. Defender for Cloud collects operating system information for assessment as follows:

- **In foundational CSPM**: The free foundational CSPM capabilities of Defender for Cloud collects operating system information from VMs using the MMA.
- **Defender for Servers**: Defender for Servers Plan 2 uses [Azure Update Manager](/azure/update-manager/overview) to assess and remediate system updates VMs. This method replaces older method that uses the MMA.

> [!NOTE]
> If you're using Defender for Servers Plan 2, there's no additional cost for assessing, remediating, and patching system updates on supported Azure VMs and Azure Arc VMs.
> If you're using foundational CSPM, or Defender for Servers Plan 1, there's a [charge for Azure Arc VMs](https://azure.microsoft.com/pricing/details/azure-update-management-center/). Patch orchestration isn't available.


## Prerequisites

- Check [machines supported](/azure/update-manager/support-matrix) by Azure Update Manager.
- On-premises and multicloud machines must be onboarded as Azure Arc to use Azure Update Manager.
- To view and explore system update recommendations, you need Read permission on the relevant Azure subscription.

> [!IMPORTANT]
> - One of the system update recommendations enables the [periodic assessment](/azure/update-manager/assessment-options#periodic-assessment) update setting on machines, so that Update Manager can fetch the latest updates to the machines, and you can view the latest machine compliance status.
> - If you enable periodic assessment on Azure Arc machines that don't have Defender for Servers Plan 2 enabled on the Azure subscription, or multicloud connector, there's an [Azure Update Manager charge](https://azure.microsoft.com/pricing/details/azure-update-management-center/).
> - If Azure Arc machines have Defender for Server Plan 2 enabled for the Azure subscription, multicloud connector, or the machine, there's no additional charge.
> 

## Assess machines for system updates

1. In Defender for Cloud, open the **Recommendations** page.
1. Select the recommendation ```Machines should be configured to periodically check for missing system updates (powered by Azure Update Manager)```.

    - Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix, the [periodic assessment](/azure/update-manager/assessment-options.mdassessment-options#periodic-assessment) update setting is enabled on machines.
    - In the **Unhealthy resources** list, you can drill to see resource details

1. Select the recommendation ```System updates should be installed on your machines (powered by Azure Update Manager)```. 

1. Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix,  it guides you to a one-time installation of the missing updates.
1. In the **Unhealthy resources** list, you can drill to see resource details.

## Next steps
Learn more about the [Microsoft Cloud Security Benchmark](concept-regulatory-compliance.md) in Defender for Cloud.
