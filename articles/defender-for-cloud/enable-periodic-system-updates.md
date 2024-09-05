---
title: Remediate system updates and patches recommendations
description: Learn how to enable system updates on your servers to keep them secure and healthy by following the steps provided in this guide to ensure optimal security.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 09/03/2024
#customer intent: As a <role>, I want to learn how to enable system updates on my servers so that I can keep them secure and healthy.
---

# Remediate system updates and patches recommendations

System updates and patches are crucial for keeping the security and health of your servers. Updates often contain security patches for vulnerabilities that, if left unfixed, are exploitable by attackers.

Microsoft Defender for Cloud provides security recommendations to improve your organizational security posture and reduce risk. An important element in risk reduction is to harden machines across your business environment.

As part of the hardening strategy, Defender for Cloud assesses machines to check that the latest system updates are installed, and issues security recommendations if they're not.

> [!NOTE]
> - Azure Update Manager is used to collect information about missing machine updates.
> - The Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) method to gather data, has been [deprecated in August 2024](prepare-deprecation-log-analytics-mma-agent.md).

## Prerequisites

- You must [enable Defender for Servers Plan 2](tutorial-enable-servers-plan.md#enable-the-defender-for-servers-plan) on your subscription.

- On-premises machines must be [connected to Azure Arc](quickstart-onboard-machines.md).

- Multicloud machines must be onboarded with Azure Arc when you connect [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md).

- If you're using Defender for Servers Plan 2, there's no extra cost for assessing, remediating, and patching system updates on supported Azure VMs and Azure Arc VMs.

- If Defender for Servers Plan 2 isn't enabled on your subscription or multicloud connector, assessments for Azure Arc-enabled machines VMs in the subscription are subject to [Azure Update Manager charges](https://azure.microsoft.com/pricing/details/azure-update-management-center/).

## Locate and remediate the recommendations

Defender for Cloud automatically assesses the security of your machines and provides recommendations to ensure the latest security and critical OS updates are installed on your machines. If your machines aren't up to date, Defender for Cloud generates the following recommendations to ensure the latest security and critical OS updates are installed on your machines:

- [Machines should be configured to periodically check for missing system updates](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/2Fbd876905-5b84-4f73-ab2d-2e7a7c4568d9)
- [System updates should be installed on your machines (powered by Azure Update Manager)](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/e1145ab1-eb4f-43d8-911b-36ddf771d13f)

These recommendations rely on [Azure Update Manager, which uses a VM extension](/azure/update-manager/workflow-update-manager?tabs=azure-vms%2Cupdate-win).

### Enable periodic assessment on your machines

Be sure to remediate the recommendation that enables the [periodic assessment](/azure/update-manager/assessment-options#periodic-assessment) update setting on machines, so that Update Manager can fetch the latest updates to the machines, and you can view the latest machine compliance status.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Select the recommendation ``Machines should be configured to periodically check for missing system updates (powered by Azure Update Manager)``.

    - Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix, the [periodic assessment](/azure/update-manager/assessment-options#periodic-assessment) update setting is enabled on machines.
    - In the **Unhealthy resources** list, you can drill to see resource details

1. Select the recommendation ```System updates should be installed on your machines (powered by Azure Update Manager)```. 

1. Under **Remediation steps**, review quick fix and manual fix details. If you follow the quick fix,  it guides you to a one-time installation of the missing updates.

1. In the **Unhealthy resources** list, you can drill to see resource details.

Periodic assessment can also be [enabled at scale with Azure Policy](/azure/update-manager/periodic-assessment-at-scale?branch=main).

### Remediate system updates findings

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Select the `System updates should be installed on your machines (powered by Azure Update Manager)` recommendation.

1. [Review the recommendation](review-security-recommendations.md).

1. Select the [Fix option](implement-security-recommendations.md#use-the-fix-option) to perform a one-time installation of any missing updates through the Update Manager portal.

    :::image type="content" source="media/enable-periodic-system-updates/fix-updates.png" alt-text="Screenshot that shows where the fix button is located." lightbox="media/enable-periodic-system-updates/fix-updates.png":::

By protecting your machines with the latest security updates, you can reduce the risk of security breaches and ensure your machines are protected against the latest threats.

## Remediate the recommendations at scale

You also have the ability to remediate system updates and patches recommendations on multiple machines at scale.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select one of the above recommendations.

1. [Review the recommendation](review-security-recommendations.md).

1. Select **view recommendation for all resources**.

    :::image type="content" source="media/enable-periodic-system-updates/view-recommendations.png" alt-text="Screenshot that shows where the view recommendation for all resources button is located." lightbox="media/enable-periodic-system-updates/view-recommendations.png":::

1. Select all relevant machines.

1. Select **Fix**.

## Next step

> [!div class="nextstepaction"]
> [Common questions about Defender for Servers](faq-defender-for-servers.yml)
