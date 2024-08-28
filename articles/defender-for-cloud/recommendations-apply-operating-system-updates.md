---
title: Apply recommendations for system updates in Microsoft Defender for Cloud
description: Learn how to apply system update recommendations in Microsoft Defender for Cloud
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 06/27/2023
---

# Remediate system update recommendations 

Microsoft Defender for Cloud provides security recommendations to improve your organizational security posture and reduce risk. An important element in risk reduction is to harden machines across your business environment.

As part of the hardening strategy, Defender for Cloud assesses machines to check that the latest system updates are installed, and issues security recommendations if they're not.


> [!NOTE]
> - Information about missing machine updates is now gathered using [Azure Update Manager](/azure/update-manager/overview).
> - This method is currently in preview and is expected to be generally available (GA) around September 2024.
> - The older method, that used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) to gather data, will be supported until the end of November 2024.

## Prerequisites

- To verify system updates [machines must be supported](/azure/update-manager/support-matrix) by Azure Update Manager.
- On-premises machines must be [onboarded as Azure Arc-enabled VMs](quickstart-onboard-machines.md) to use Azure Update Manager.
- To view and explore system update recommendations, you need Read permission on the relevant Azure subscription.
- Multicloud (AWS/GCP machines) must be onboarded with Azure Arc when you connect [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md).
- If you're using Defender for Servers Plan 2, there's no additional cost for assessing, remediating, and patching system updates on supported Azure VMs and Azure Arc VMs.
- If Defender for Servers Plan 2 isn't enabled on your subscription or multicloud connector, assessments for Azure Arc-enabled machines VMs in the subscription are subject to [Azure Update Manager charges](https://azure.microsoft.com/pricing/details/azure-update-management-center/).




## Remediate system update findings

Remediate system update recommendations as follows. Be sure to remediate the recommendation that enables the [periodic assessment](/azure/update-manager/assessment-options#periodic-assessment) update setting on machines, so that Update Manager can fetch the latest updates to the machines, and you can view the latest machine compliance status.

1. In Defender for Cloud, open the **Recommendations** page.
1. Select the recommendation ``Machines should be configured to periodically check for missing system updates (powered by Azure Update Manager)``.

    - Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix, the [periodic assessment](/azure/update-manager/assessment-options#periodic-assessment) update setting is enabled on machines.
    - In the **Unhealthy resources** list, you can drill to see resource details

1. Select the recommendation ```System updates should be installed on your machines (powered by Azure Update Manager)```. 

1. Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix,  it guides you to a one-time installation of the missing updates.
1. In the **Unhealthy resources** list, you can drill to see resource details.

