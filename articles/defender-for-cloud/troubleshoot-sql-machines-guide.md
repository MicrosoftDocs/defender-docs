---
title: Troubleshoot guide - SQL Server deployment on machines
description: Troubleshoot deployment issues for SQL Servers on machines via the Azure Monitoring Agent (AMA)-based autoprovisioning process.
ms.date: 02/13/2025
ms.topic: how-to
#customer intent: As a security professional, I want to ensure that my deployment of SQL servers on machines is correct and protects my resources.
---

# Troubleshoot guide - SQL Server deployment on machines

This guide provides troubleshooting steps for SQL Server deployment on machines using the Azure Monitoring Agent (AMA) autoprovisioning process.

Defender for SQL Servers on machines uses Azure Policy in its autoprovisioning process to create resources, configure, and install extensions during the enablement process. To protect each SQL Server instance with Defender for Cloud, you must successfully create all resources, configurations, and installing extensions.

## Prerequisites

- [Enable Defender for SQL using the AMA-based autoprovisioning process](defender-for-sql-usage.md).

- Ensure you have [followed all prerequisite steps](defender-for-sql-usage.md#prerequisites-for-enabling-defender-for-sql-on-non-azure-machines).

## Resource creation level

Defender for SQL servers on machines automatically creates resources through the autoprovisioning process. Resources are created at the subscription level, and some are configured or installed at the SQL Virtual Machine (VM) or Arc-enabled SQL server level.

:::image type="content" source="media/troubleshoot-sql-machines-guide/resource-level.png" alt-text="Conceptual image that shows resources and the levels that they're created on." lightbox="media/troubleshoot-sql-machines-guide/resource-level.png":::

| Resource type | Level created |
|--|--|
| **Resource group** - created in East US Azure region, contains a user-assigned managed identity is created in each Azure region | Subscription level |
| **Log analytics workspace** | **Default workspaces** - Subscription level <br> <br> **Custom Workspace** - Subscription level  |
| **Data Collection Rule (DCR)** - created for each workspace | Subscription level |
| **Data Collection Rule Association (DCRA)** - defined for each SQL Server instance | SQL Server instance level |
| **Azure Monitoring Agent (AMA)** - the extension is installed for each SQL Server instance | SQL Server instance level |
| **Defender for SQL extension** - the extension is installed for each SQL Server instance | SQL Server instance level |

## Identify deployment misconfigurations

Defender for Cloud provides a workbook that allows you to locate which resources are misconfigured. The workbook lists which subscriptions have Defender for SQL on server machines enabled with misconfigurations.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Open the [SQL Servers on Machines AMA Helper workbook](https://ms.portal.azure.com/#view/AppInsightsExtension/UsageNotebookBlade/ComponentId/Azure%20Security%20Center/ConfigurationId/community-Workbooks%2FAzure%20Security%20Center%2FSQL%20Servers%20on%20Machines%20AMA%20Helper/WorkbookTemplateName/SQL%20Servers%20on%20Machines%20AMA%20Helper).

    :::image type="content" source="media/troubleshoot-sql-machines-guide/ama-helper-workbook.png" alt-text="Screenshot of the SQL Servers on Machines AMA Helper workbook main page." lightbox="media/troubleshoot-sql-machines-guide/ama-helper-workbook.png":::

1. Select **subscription overview** > **SQL Servers on Azure Virtual Machines**.

    :::image type="content" source="media/troubleshoot-sql-machines-guide/navigate-sections.png" alt-text="Screenshot that shows where to navigate to on the SQL Servers on Azure Virtual Machines workbook page." lightbox="media/troubleshoot-sql-machines-guide/navigate-sections.png":::
    
    > [!NOTE]
    > Depending on your deployment and environment, you might not have SQL Servers on Azure Virtual Machines available. If that is the case, select **Arc-Enabled SQL Servers** instead.

1. Locate subscriptions with misconfigurations based on the workbook results.

    :::image type="content" source="media/troubleshoot-sql-machines-guide/ama-helper-workbook-results.png" alt-text="Screenshot of the SQL Servers on Machines AMA Helper workbook results." lightbox="media/troubleshoot-sql-machines-guide/ama-helper-workbook-results.png":::

To determine which subscriptions have misconfigurations, check which section of the screen doesn't match the expected configuration, such as 0/1, 10/15, or No.

Once you locate a subscription with misconfigurations, you should resolve the misconfigurations first on the subscription level and then on the resource level and extension installation level.

## Resolve misconfigurations at the subscription level

If you haven't enabled the AMA-based autoprovisioning process, you must enable [Enable Defender for SQL using the AMA-based autoprovisioning process](defender-for-sql-usage.md#enable-defender-for-sql-on-non-azure-machines-using-the-ama-agent) before attempting this section of the guide.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to [Azure policy compliance](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyMenuBlade/~/Compliance).

1. Search for **Defender for SQL on SQL VMs and Arc-enabled SQL Servers**.

1. Select **Scope**.
    
    :::image type="content" source="media/troubleshoot-sql-machines-guide/scope.png" alt-text="Screenshot that shows where to select scope on the policy and compliance page." lightbox="media/troubleshoot-sql-machines-guide/scope.png":::

1. In the dropdown, select the subscription with misconfigurations.

1. Select **Select**.

1. Select **Defender for SQL on SQL VMs and Arc-enabled SQL Servers**.

    :::image type="content" source="media/troubleshoot-sql-machines-guide/select-misconfiguration.png" alt-text="Screenshot that shows where the misconfiguration is found on the page." lightbox="media/troubleshoot-sql-machines-guide/select-misconfiguration.png":::

1. Select the noncompliant policy name.

    > [!WARNING]
    > For each noncompliant issue, they must be resolved in a specific order, **Identity** > **Workspace** > **DCR**. DCR resolution is reliant on Workspace resolution, and workspace resolution is reliant on Identity resolution. If you try to resolve these misconfigurations out of order, the misconfigurations won't be resolved.

    - **Identity** - `Create and assign a built-in user-assigned managed identity`.
    - **Workspace** - `Configure the Microsoft Defender for SQL Log Analytics workspace`.
    - **DCR** - `Configure the Microsoft Defender for SQL Log Analytics workspace` or `Configure Arc-enabled SQL Servers to automatically install Microsoft Defender for SQL and DCR with a Log Analytics workspace`.

1. For each policy that is noncompliant, review the compliance reason and select **Create remediation task** to resolve it.
    
    :::image type="content" source="media/troubleshoot-sql-machines-guide/remediation-task.png" alt-text="Screenshot that shows where to create a remediation task on the page." lightbox="media/troubleshoot-sql-machines-guide/remediation-task.png":::

1. Fill in the relevant information.

1. Select Remediate.

1. Repeat these steps for each noncompliant policy and subscription.

1. Repeat these steps but in step 3 search for **Defender for SQL on SQL VMs and Arc-enabled SQL Servers-custom** for custom workspace.

Depending on your environment, Deny policies might be in place that prevent the creation of resources. If you encounter this issue, you can [manually create and configure the plan at scale with PowerShell](enable-defender-sql-at-scale.md).

## Resolve misconfigurations at the resource level

You should only resolve misconfigurations at the resource level once you have resolved your misconfiguration issues at the subscription level. These steps troubleshoot issues for each misconfigured DCRA configuration and incomplete AMA or Defender for SQL extensions.

### AMA and Defender for SQL extension misconfigurations

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to [Azure policy compliance](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyMenuBlade/~/Compliance).

1. Search for **Defender for SQL on SQL VMs and Arc-enabled SQL Servers initiative**.

1. Select **Scope**.

1. In the dropdown, select the subscription with misconfigurations.

1. Select **Select**.

1. Select **Defender for SQL on SQL VMs and Arc-enabled SQL Servers initiative**.

1. Select the noncompliant policy name.

    - **Defender for SQL extension policy name** - `Create and assign a built-in user-assigned managed identity`. 
    - **AMA extension policy name**: - `Configure SQL Virtual Machines to automatically install Azure Monitor Agent` or `Configure Arc-enabled SQL Servers to automatically install Azure Monitor Agent`.

1. For each policy that is noncompliant, review the compliance reason and select **Create remediation task** to resolve it.

### DCRA misconfigurations

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **[Data collection rules](https://ms.portal.azure.com/#browse/microsoft.insights%2Fdatacollectionrules)**.

1. Select **Subscription equals**.

    :::image type="content" source="media/troubleshoot-sql-machines-guide/subscription-equals.png" alt-text="Screenshot that shows where to select subscription equals." lightbox="media/troubleshoot-sql-machines-guide/subscription-equals.png":::

1. Enter the relevant subscription.

1. Select **Apply**.

1. 

## Related content