---
title: Enable system updates and patches
description: Learn how to enable system updates on your Azure Arc-enabled machines and Azure VMs to keep them secure and healthy.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 09/03/2024
#customer-intent: As a Defender for Servers user, I want to enable system updates on my Azure Arc-enabled machines and Azure VMs to keep them secure and healthy.
---

# Enable system updates and patches

System updates and patches are crucial for keeping the security and health of your Azure Arc-enabled machines and Azure VMs. Updates often contain security patches for vulnerabilities that, if left unfixed, are exploitable by attackers. 

## Prerequisites

- You must [enable Defender for Servers Plan 2](tutorial-enable-servers-plan.md#enable-the-defender-for-servers-plan) on your subscription.

- On-premises machines must be [connected to Azure Arc](quickstart-onboard-machines.md).

- Azure Arc enabled machines must be connected to a subscription, or connector that has Defender for Servers Plan 2 enabled. If you enable periodic system updates on a machine that isn't connected to a subscription, or to a connector with Defender for Servers Plan 2 enabled, the machine is subject to [Azure Update Manager pricing](https://azure.microsoft.com/pricing/details/azure-update-management-center/).

- [Enable periodic assessment](/azure/update-manager/assessment-options).

## Enable system updates and patches on machines

Defender for Cloud automatically assesses the security of your machines and provides recommendations to ensure the latest security and critical OS updates are installed on your machines. If your machines aren't up to date, Defender for Cloud generates the following recommendations to ensure the latest security and critical OS updates are installed on your machines:

- [System updates should be installed on your machines (powered by Azure Update Manager)](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/e1145ab1-eb4f-43d8-911b-36ddf771d13f)
- [Machines should be configured to periodically check for missing system updates](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/2Fbd876905-5b84-4f73-ab2d-2e7a7c4568d9)

These recommendations rely on a native agent embedded in every Azure Virtual Machine (VM) and Azure Arc machines instead of an installed agent.

**To system updates and patches on your machines**:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select one of the above recommendations.

1. [Review the recommendation](review-security-recommendations.md).

1. Select the [Fix option](implement-security-recommendations.md#use-the-fix-option) to perform a one-time installation of any missing updates through the Update Manager portal.

By protecting your machines with the latest security updates, you can reduce the risk of security breaches and ensure your machines are protected against the latest threats.

## Next step

> [!div class="nextstepaction"]
> [Common questions about Defender for Servers](faq-defender-for-servers.yml)
