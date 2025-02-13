---
title: Troubleshoot guide - SQL Server deployment on machines
description: Troubleshoot deployment issues for SQL Servers on machines via the Azure Monitoring Agent (AMA)-based autoprovisioning process.
ms.date: 02/13/2025
ms.topic: how-to
#customer intent: As a security professional, I want to ensure that my deployment of SQL servers on machines is correct and protects my resources.
---

# Troubleshoot guide - SQL Server deployment on machines

This guide provides troubleshooting steps for SQL Server deployment on machines via the Azure Monitoring Agent (AMA)-based autoprovisioning process.

Defender for SQL Servers on machines leverages Azure Policy in its autoprovisioning process to create resources, configure, and install the extensions during the enablement process. The successful creation of all resources, configuration, and extension installation is required to protect each SQL Server instance by Defender for Cloud.

## Prerequisites

- [Enable Defender for SQL using the AMA-based autoprovisioning process](defender-for-sql-usage.md).

- Ensure you have [followed all of the prerequisites steps](defender-for-sql-usage.md#prerequisites-for-enabling-defender-for-sql-on-non-azure-machines).

## Resource creation level

Defender for SQL servers on machines automatically create resources through the autoprovisioning process. Resources are created at the subscription level, and some are configured or installed at the SQL Virtual Machine (VM) or Arc-enabled SQL server level.

:::image type="content" source="media/troubleshoot-sql-machines-guide/resource-level.png" alt-text="Conceptual image that shows resources and the levels that they are created on." lightbox="media/troubleshoot-sql-machines-guide/resource-level.png":::

| Resource type | Level created |
|--|--|
| **Resource group** - created in East US Azure region, contains a user-assigned managed identity is created in each Azure region | Subscription level |
| **Log analytics workspace** | **Default workspaces** - Subscription level <br> <br> **Custom Workspace** - Subscription level  |
| **Data Collection Rule (DCR)** - created for each workspace | Subscription level |
| **Data Collection Rule Association (DCRA)** - defined for each SQL Server instance | SQL Server instance level |
| **Azure Monitoring Agent (AMA)** - the extension is installed for each SQL Server instance | SQL Server instance level |
| **Defender for SQL extension** - the extension is installed for each SQL Server instance | SQL Server instance level |

## Identify deployment misconfigurations

Defender for Cloud provides a workbook that allows you to locate which resources are misconfigured. The workbook lists which subscriptions, that have Defender for SQL on server machines enabled, have misconfigurations.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Open the [SQL Servers on Machines AMA Helper workbook](https://ms.portal.azure.com/#view/AppInsightsExtension/UsageNotebookBlade/ComponentId/Azure%20Security%20Center/ConfigurationId/community-Workbooks%2FAzure%20Security%20Center%2FSQL%20Servers%20on%20Machines%20AMA%20Helper/WorkbookTemplateName/SQL%20Servers%20on%20Machines%20AMA%20Helper).

    :::image type="content" source="media/troubleshoot-sql-machines-guide/ama-helper-workbook.png" alt-text="Screenshot of the SQL Servers on Machines AMA Helper workbook main page." lightbox="media/troubleshoot-sql-machines-guide/ama-helper-workbook.png":::

1. Select **subscription overview** > **SQL Servers on Azure Virtual Machines**.

    :::image type="content" source="media/troubleshoot-sql-machines-guide/navigate-sections.png" alt-text="Screenshot that shows where to navigate to on the SQL Servers on Azure Virtual Machines workbook page." lightbox="media/troubleshoot-sql-machines-guide/navigate-sections.png":::
    
    > [!NOTE]
    > Depending on your deployment and environment, you may not have SQL Servers on Azure Virtual Machines available, if that is the case, select **Arc-Enabled SQL Servers** instead.

1. Locate subscriptions with misconfigurations based on the workbook results.

    :::image type="content" source="media/troubleshoot-sql-machines-guide/ama-helper-workbook-results.png" alt-text="Screenshot of the SQL Servers on Machines AMA Helper workbook results." lightbox="media/troubleshoot-sql-machines-guide/ama-helper-workbook-results.png":::

To determine which subscriptions have misconfigurations, look to see which section of the screen does not match the expected configuration, such as, 0/1, 10/15, or No.

Once you have located a subscription with misconfigurations, you should resolve the misconfigurations first on the subscription level and then on the resource level and extension installation level.

## Related content