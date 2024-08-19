---
title: Apply recommendations for system updates in Microsoft Defender for Cloud
description: Learn how to apply system update recommendations in Microsoft Defender for Cloud
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 06/27/2023
---

# Review OS system update issues 

Microsoft Defender for Cloud provides security recommendations to improve your organizational security posture and reduce risk. An important element in risk reduction is to harden machines across your business environment, including installing the latest system updates.


When Defender for Cloud is enabled, by default its foundational cloud security posture management (CSPM) capabilities assesses machine settings against the [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction). The benchmark covers Azure, AWS, and GCP (in preview) environments, and provides hardening baselines for [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems, including recommendations for system updates.


> [!NOTE]
> - Information about missing machine updates is now gathered using [Azure Update Manager](/azure/update-manager/overview). This method is currently in preview and is expected to be generally available (GA) around September 2024.
> - The older method, that used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) to gather data, will be supported until the end of November 2024.

## Prerequisites

- Check [machines supported](/azure/update-manager/support-matrix) by Azure Update Manager.
- On-premises and multicloud machines must be onboarded as Azure Arc to use Azure Update Manager.
- To view and explore system update recommendations, you need Read permission on the relevant Azure subscription.
- > If you're using Defender for Servers Plan 2, there's no additional cost for assessing, remediating, and patching system updates on supported Azure VMs and Azure Arc VMs.
> If Defender for Servers Plan 2 isn't enabled on your subscription or multicloud connector, assessments for Azure Arc-enabled machines VMs in the subscription are subject to [Azure Update Manager charges](https://azure.microsoft.com/pricing/details/azure-update-management-center/).




## Assess machines for system updates

Assess machines for system update issues.

> [!IMPORTANT]
> - One of the system update recommendations enables the [periodic assessment](/azure/update-manager/assessment-options#periodic-assessment) update setting on machines, so that Update Manager can fetch the latest updates to the machines, and you can view the latest machine compliance status.



1. In Defender for Cloud, open the **Recommendations** page.
1. Select the recommendation ``Machines should be configured to periodically check for missing system updates (powered by Azure Update Manager)``.

    - Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix, the [periodic assessment](/azure/update-manager/assessment-options#periodic-assessment) update setting is enabled on machines.
    - In the **Unhealthy resources** list, you can drill to see resource details

1. Select the recommendation ```System updates should be installed on your machines (powered by Azure Update Manager)```. 

1. Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix,  it guides you to a one-time installation of the missing updates.
1. In the **Unhealthy resources** list, you can drill to see resource details.

## Next steps
Learn more about the [Microsoft Cloud Security Benchmark](concept-regulatory-compliance.md) in Defender for Cloud.
