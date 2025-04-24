---
title: Disable Defender for SQL Servers on Machines
description: Learn how to disable Defender for SQL Servers on Machines in Microsoft Defender for Cloud to manage your security posture effectively.
ms.topic: how-to
ms.date: 04/24/2025
author: Elazark
ms.author: elkrieger
#customer intent: As a security administrator, I want to disable Defender for SQL Servers on Machines in Defender for Cloud to manage my security posture effectively.
---

# Disable Defender for SQL Servers on Machines

This article describes how to disable Defender for SQL Servers on Machines in Microsoft Defender for Cloud. This feature allows you to manage your security posture effectively by disabling the Defender for SQL Servers on Machines plan on your virtual machines (VMs) and SQL servers.

The Defender for SQL Servers on Machines plan is one of the Defender for Databases plans in Microsoft Defender for Cloud. This plan protect SQL Server databases hosted on Azure VMs and Azure Arc-enabled VMs. By disabling

## Prerequisites

- You must have **Subscription Owner** permissions.

- You must have the Defender for SQL Servers on Machines plan enabled in your Defender for Cloud environment.

## Disable Defender for SQL Servers on Machines

Once you disable Defender for SQL Servers on Machines, the Defender for SQL Servers on Machines plan will no longer be applied to your virtual machines and SQL servers. This means that the security features and protections provided by this plan will be disabled.


1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. On the Defender plans page, locate the Databases plan and select **Select types**.

    :::image type="content" source="media/disable-sql-on-machines/select-types.png" alt-text="Screenshot that shows you where to select types on the Defender plans page." lightbox="media/disable-sql-on-machines/select-types.png":::

1. In the Resource types selection window, toggle the **SQL Servers on Machines** plan to **Off**.

    :::image type="content" source="media/disable-sql-on-machines/sql-servers-off.png" alt-text="Screenshot that shows where the Off button is located for SQL servers on machines." lightbox="media/disable-sql-on-machines/sql-servers-off.png":::

1. Select **Continue** > **Save**.

## Disable Defender for SQL Servers on Machines at the resource level

1. In the Azure portal, search for and select:
    - **Azure Arc** > **Data services** > **SQL Server instances**.
    <br> 
    or
    - **SQL virtual machines**.

1. Select the relevant SQL Server instance.

1. Locate the security menu and select **Extensions + applications**.

    :::image type="content" source="media/disable-sql-on-machines/extension-application.png" alt-text="Screenshot that shows where to locate Defender for Cloud under the security section." lightbox="media/disable-sql-on-machines/extension-application.png":::

1. Select the following extension(s):
    - **Defender for SQL (IaaS and Arc)**
        - Publisher: Microsoft.Azure.AzureDefenderForSQL
        - Type: AdvancedThreatProtection.Windows

1. Select **Uninstall**.

