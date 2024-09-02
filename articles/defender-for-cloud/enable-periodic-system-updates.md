---
title: Enable period system updates
description: Learn how to use actual traffic patterns to harden your network security groups (NSG) rules and further improve your security posture.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 09/02/2024
---

# Enable period system updates

System updates are crucial for keeping the security and health of your Azure Arc-enabled machines and Azure VMs. Updates often contain security patches for vulnerabilities that, if left unfixed, are exploitable by attackers. 

## Prerequisites

- You must [enable Defender for Servers Plan 2](tutorial-enable-servers-plan.md#enable-the-defender-for-servers-plan) on your subscription.

- On-premises machines must be [connected to Azure Arc](quickstart-onboard-machines.md).

- Azure Arc enabled machines must be connected to a subscription, or connector that has Defender for Servers Plan 2 enabled. If you enable periodic assessments on a machine that isn't connected to a subscription or connector with Defender for Servers Plan 2 Enabled, it will be subject to [Azure Update Manager pricing](https://azure.microsoft.com/pricing/details/azure-update-management-center/).

## Enable system updates on machines

Defender for Cloud automatically assess the security of your machines and provides recommendations to ensure the latest security and critical OS updates are installed on your machines. If your machines are not up to date, Defender for Cloud generates the following recommendations to ensure the latest security and critical OS updates are installed on your machines:

- System updates should be installed on your machines (powered by Azure Update Manager)
- Machines should be configured to periodically check for missing system updates

These recommendations rely on a native agent embedded in every Azure VM and Azure Arc machines instead of an installed agent.

**To enable periodic system updates on your machines**:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select one of the above recommendations.

1. [Review the recommendation](implement-security-recommendations.md#review-the-recommendation).

1. Select the [Fix option](implement-security-recommendations.md#use-the-fix-option) to perform a one-time installation of any missing updates through the Update Manager portal.

By protecting your machines with the latest security updates, you can reduce the risk of security breaches and ensure your machines are protected against the latest threats.

## Next step

> [!div class="nextstepaction"]
> [Common questions about Defender for Servers](faq-defender-for-servers.yml)
