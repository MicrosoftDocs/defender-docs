---
title: Disable Defender for SQL Servers on Machines
description: Disable the Defender for SQL Servers on Machines plan to stop SQL alerts and recommendations for selected scopes in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 05/28/2026
author: ElazarK
ms.author: elkrieger
#customer intent: As a security administrator, I want to disable Defender for SQL Servers on Machines in Defender for Cloud to manage my security posture effectively.
---

# Disable Defender for SQL Servers on Machines

Use this article to disable Defender for SQL Servers on Machines in Microsoft Defender for Cloud.

The Defender for SQL Servers on Machines plan is part of Defender for Databases. It protects SQL Server databases hosted on Azure virtual machines (VMs) and Azure Arc-enabled VMs.

## What happens when you disable this plan

Disabling the plan means Defender for Cloud no longer provides SQL alerts and recommendations for the selected machines.

## Prerequisites

- You must have **Subscription Owner** permissions.

- You must have the Defender for SQL Servers on Machines plan enabled in your Defender for Cloud environment.

## Disable Defender for SQL Servers on Machines

To disable Defender for SQL Servers on Machines, follow these steps:


1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. On the Defender plans page, locate the Databases plan and select **Select types**.

    :::image type="content" source="media/disable-sql-on-machines/select-types.png" alt-text="Screenshot that shows you where to select types on the Defender plans page." lightbox="media/disable-sql-on-machines/select-types.png":::

1. In the Resource types selection window, toggle the **SQL Servers on Machines** plan to **Off**.

    :::image type="content" source="media/disable-sql-on-machines/sql-servers-off.png" alt-text="Screenshot that shows where the Off button is located for SQL servers on machines." lightbox="media/disable-sql-on-machines/sql-servers-off.png":::

1. Select **Continue** > **Save**.

## Disable Defender for SQL Servers on Machines at the resource level

To disable this plan at the resource level for an individual SQL Server instance or SQL virtual machine, follow these steps:

1. In the Azure portal, choose one of the following options:
    - **Azure Arc** > **Data services** > **SQL Server instances**
    - **SQL virtual machines**

1. Select the relevant SQL Server instance.

1. Locate the security menu and select **Extensions + applications**.

    :::image type="content" source="media/disable-sql-on-machines/extension-application.png" alt-text="Screenshot that shows where to locate Defender for Cloud under the security section." lightbox="media/disable-sql-on-machines/extension-application.png":::

1. Select the **Defender for SQL (IaaS and Arc)** extension.

    Confirm that the extension details match the following values:

    - Extension: Defender for SQL (IaaS and Arc)
    - Publisher: Microsoft.Azure.AzureDefenderForSQL
    - Type: AdvancedThreatProtection.Windows

1. Select **Uninstall**.

