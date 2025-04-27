---
title: Update Defender for SQL servers on Machines plan configuration
description: Learn how to update your SQL Servers on machine configuration across Azure VMs, on-premises, and hybrid environments with Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 04/27/2025
#customer intent: As a security administrator, I want to update the Defender for SQL servers on Machines plan so that I can ensure my SQL servers in various environments have the latest configuration.
---

# Update Defender for SQL Servers on Machines plan configuration

> [!IMPORTANT]
> This page applies to existing customers who enabled the plan on a subscription before April 21, 2025.

Defender for SQL Servers on Machines plan's includes an updated agent architecture that simplifies onboarding and improves SQL protection. To gain visibility and provide protection, the plan requires each SQL server instance to be registered within Azure. 

Registration occurs automatically with the SQL Server IaaS Agent extension which [automates registration for Azure VMs](/azure/azure-sql/virtual-machines/windows/sql-server-iaas-agent-extension-automate-management?view=azuresql&WT.mc_id=Portal-Microsoft_Azure_Security&tabs=azure-portal). Arc-enabled SQL Server instances are [automatically connected by the Azure extension for SQL Servers](/sql/sql-server/azure-arc/manage-autodeploy?view=sql-server-ver16&WT.mc_id=Portal-Microsoft_Azure_Security).

If automatic registration is disabled, you must manually register each SQL server instance to protect it with Defender for SQL Server on Machines plan.

Existing customers must follow the instructions on this page to update the configuration to enable Auto registration through the SQL extension.

> [!IMPORTANT]
> The Defender for SQL servers on Machines plan is undergoing a transition to the new agent architecture. for more information, see [Defender for SQL servers on Machines plan transition](release-notes.md#update-to-defender-for-sql-servers-on-machines-plan).

## Update the plan on multiple subscriptions

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. On the Overview page, select **[Update the configuration in Defender for SQL Servers on Machines plan for multiple subscriptions](https://ms.portal.azure.com/#view/Microsoft_Azure_Security_AzureDefenderForData/vNextUpgradeContextBlade)**.

1. Select all the relevant subscriptions.

1. Select **Update**.

## Update the plan on a single subscription

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defender for Databases plan and select **Settings**.

1. Select **Update** in the pop-up window.

    :::image type="content" source="media/update-sql-machine-configuration/update-notification.png" alt-text="Screenshot that shows where to locate the update button." lightbox="media/update-sql-machine-configuration/update-notification.png":::

## Next step

> [!div class="nextstepaction"]
> [Verify that all machines are protected](verify-machine-protection.md)
