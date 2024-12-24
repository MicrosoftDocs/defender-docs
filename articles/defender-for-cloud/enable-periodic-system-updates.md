---
title: Remediate system updates and patches recommendations
description: Learn how to enable system updates on your servers to keep them secure and healthy by following the steps provided in this guide to ensure optimal security.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 09/08/2024
#customer intent: As a <role>, I want to learn how to enable system updates on my servers so that I can keep them secure and healthy.
---

# Remediate system update and patch recommendations 

Microsoft Defender for Cloud provides security recommendations to improve your organizational security posture and reduce risk. An important element in risk reduction is to harden machines across your business environment. 

As part of the hardening strategy, Defender for Cloud assesses machines to check that the latest system updates and patches are installed, and issues security recommendations if they're not. System updates and patches are crucial for keeping machines secure and healthy. Updates often contain security patches for vulnerabilities that, if left unfixed, are exploitable by attackers.

Defender for Servers Plan 2 automatically assesses updates and patches on machines and generates the following recommendations as needed:

- [Machines should be configured to periodically check for missing system updates](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/2Fbd876905-5b84-4f73-ab2d-2e7a7c4568d9)
- [System updates should be installed on your machines (powered by Azure Update Manager)](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/e1145ab1-eb4f-43d8-911b-36ddf771d13f)

These recommendations rely on [Azure Update Manager](/azure/update-manager/overview), which uses a [VM extension](/azure/update-manager/workflow-update-manager?tabs=azure-vms%2Cupdate-win).

! [!NOTE] The older method for update assessment used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) to gather data. Use of the MMA is now deprecated.

## Prerequisites

- [Defender for Servers Plan 2](defender-for-servers-overview.md) must be enabled.
- To verify system updates [machines must be supported](/azure/update-manager/support-matrix) by Azure Update Manager.
- On-premises machines must be [connected as Azure Arc-enabled VMs](quickstart-onboard-machines.md).
- Multicloud (AWS/GCP machines) must be onboarded with Azure Arc when you connect [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md).
- If you're using Defender for Servers Plan 2, there's no additional cost for assessing, remediating, and patching system updates on supported Azure VMs and Azure Arc VMs.
- If Defender for Servers Plan 2 isn't enabled on your subscription or multicloud connector, assessments for Azure Arc-enabled machines VMs in the subscription are subject to [Azure Update Manager charges](https://azure.microsoft.com/pricing/details/azure-update-management-center/).




## Enable periodic assessment on machines

Defender for Cloud issues a recommendation that machines should be assessed periodically for system updates.

1. In Defender for Cloud, open the **Recommendations** page.
1. Select the recommendation ``Machines should be configured to periodically check for missing system updates (powered by Azure Update Manager)``.

    - Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix, the [periodic assessment](/azure/update-manager/assessment-options#periodic-assessment) update setting is enabled on machines.
    - In the **Unhealthy resources** list, drill down to see resource details.

1. Select the [Fix option](implement-security-recommendations.md#use-the-fix-option).
1. Select the relevant machine, and then select **Fix 1 resource**.

Periodic assessment can also be [enabled at scale with Azure Policy](/azure/update-manager/periodic-assessment-at-scale?branch=main).

## Remediate update recommendations

1. In Defender for Cloud, open the **Recommendations** page.
1. Select the recommendation ``System updates should be installed on your machines (powered by Azure Update Manager)``.
1. Review the recommendation.
1. Select the **Fix option** to do a one-time installation of missing updates through the Update Manager portal.

    :::image type="content" source="media/enable-periodic-system-updates/fix-updates.png" alt-text="Screenshot that shows where the fix button is located." lightbox="media/enable-periodic-system-updates/fix-updates.png":::


## Remediate recommendations at scale

You can remediate recommendations on multiple machines.


1. In Defender for Cloud, open the **Recommendations** page.
1. Select the recommendation ``System updates should be installed on your machines (powered by Azure Update Manager)``.
1. Locate the relevant system update recommendation.
1. Review the recommendation.
1. In the recommendation details page, select **View recommendation for all resources**.

    :::image type="content" source="media/enable-periodic-system-updates/view-recommendations.png" alt-text="Screenshot that shows where the view recommendation for all resources button is located." lightbox="media/enable-periodic-system-updates/view-recommendations.png":::

1. Select all machines you want to fix.

1. Select **Fix**.


