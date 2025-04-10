---
title: Update Defender for SQL servers on Machines configuration
description: Learn how to update your SQL Servers on machine configuration across Azure VMs, on-premises, and hybrid environments with Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 04/21/2025
#customer intent: As a security administrator, I want to update the Defender for SQL servers on Machines plan so that I can ensure my SQL servers in various environments have the latest configuration.
---

# Update Defender for SQL Servers on Machines configuration

> [!IMPORTANT]
> This page applies to existing customers who enabled the plan on a subscription before April 21, 2025.

The Defender SQL Servers on Machines plan in Defender for Cloud includes agent architecture that simplifies the onboarding experience and improves overall SQL protection coverage. If you already use the Defender for SQL Servers on machine plan for SQL VMs and Azure Arc-enabled SQL servers, the change happens automatically.

However, if you have existing VMs and servers that do not have auto-registration enabled, you will need to apply the update as described on this page, in order to receive all the benefits of the Defender for SQL Servers on Machines plan.

> [!IMPORTANT]
> The Defender for SQL servers on Machines plan is undergoing a transition to the new agent architecture. for more information, see [Defender for SQL servers on Machines plan transition](release-notes.md#update-to-defender-for-sql-servers-on-machines-plan).

## Update the plan on a single subscription

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defender for Databases plan and select **Settings**.

1. Select **Update** in the pop-up window.

## Update the plan on multiple subscriptions

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. On the Overview page, select **[Update the configuration in Defender for SQL Servers on Machines plan for multiple subscriptions](https://ms.portal.azure.com/#view/Microsoft_Azure_Security_AzureDefenderForData/vNextUpgradeContextBlade)**.

1. Select all the relevant subscriptions.

1. Select **Update**.

## Next step

> [!div class="nextstepaction"]
> [Verify that all machines are protected](verify-machine-protection.md)
