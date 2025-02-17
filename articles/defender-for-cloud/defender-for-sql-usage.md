---
title: Enable Microsoft Defender for SQL servers on machines
description: Learn how to protect your Microsoft SQL servers on Azure VMs, on-premises, and in hybrid and multicloud environments with Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 02/13/2025
#customer intent: As a security administrator, I want to enable  Defender for SQL servers on machines so that I can protect my SQL servers in various environments.
---

# Enable Defender for SQL Servers on Machines

The Defender for SQL Servers on Machines plan is one of the Defender for Databases plans in Microsoft Defender for Cloud. Use the Defender for SQL servers on Machines to protect SQL Server databases hosted on Azure VMs and Azure Arc-enabled VMs.

## Prerequisites

| Requirement | Details |
|-------------|---------|
| **Permissions** | To deploy the plan on a subscription including Azure Policy, you need **Subscription owner** permissions. <br> <br> The Windows user on the SQL VM, must have the **Sysadmin** role on the database. |
| **Multicloud machines** | Multicloud machines (AWS and GCP) must be onboarded as Azure Arc-enabled VMs. Multicloud machines can be automatically onboarded as Azure Arc machines when they are onboarded with the connector. <br> [Onboard your AWS connector](quickstart-onboard-aws.md) and automatically provision Azure Arc. <br> [Onboard your GCP connector](quickstart-onboard-gcp.md) and automatically provision Azure Arc. |
| **On-premises machines** | On-premises machines must be onboarded as Azure Arc-enabled VMs. [Onboard on-premises machines and install Azure Arc](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm). |
| **Azure Arc** | Review Azure Arc deployment requirements <br> - [Plan and deploy Azure Arc-enabled servers](/azure/azure-arc/servers/plan-at-scale-deployment) <br> - [Connected Machine agent prerequisites](/azure/azure-arc/servers/prerequisites) <br> - [Connected Machine agent network requirements](/azure/azure-arc/servers/network-requirements) <br> - [Roles specific to SQL Server enabled by Azure Arc](/sql/relational-databases/security/authentication-access/server-level-roles#roles-specific-to-sql-server-enabled-by-azure-arc) |
| **Extensions**|  The following extensions must be allowed in your environment.| 
| Defender for SQL (IaaS and Arc)| - Publisher: Microsoft.Azure.AzureDefenderForSQL<br>  - Type: AdvancedThreatProtection.Windows |
| SQL IaaS Extension (IaaS)| - Publisher: Microsoft.SqlServer.Management<br>  - Type: SqlIaaSAgent |
| SQL IaaS Extension (Arc)| - Publisher: Microsoft.AzureData<br>  - Type: WindowsAgent.SqlServer|
| AMA extension (IaaS and Arc) | - Publisher: Microsoft.Azure.Monitor<br>  - Type: AzureMonitorWindowsAgent |
| **Region requirement** | When you enable the plan a resource group is created in the East US. This region must be allowed in your environment. |
| **Resource naming conventions** | Defender for SQL uses the following naming convention when creating our resources: <br> - Data Collection Rule: `MicrosoftDefenderForSQL--dcr` <br> - DCRA: `/Microsoft.Insights/MicrosoftDefenderForSQL-RulesAssociation` <br> - Resource group: `DefaultResourceGroup-` <br> - Log analytics workspace: `D4SQL--` <br> - Defender for SQL uses *MicrosoftDefenderForSQL* as a *createdBy* database tag. <br><br> This naming convention must be allowed. |

## Enable the plan on Azure VMs

1. In the Azure portal, search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. On the Defender plans page, locate the Databases plan and select **Select types**.

    :::image type="content" source="media/tutorial-enabledatabases-plan/select-types.png" alt-text="Screenshot that shows you where to select types on the Defender plans page." lightbox="media/tutorial-enabledatabases-plan/select-types.png":::

1. In the Resource types selection window, toggle the **SQL servers on machines** plan to **On**.

1. Select **Continue** > **Save**.

### Select a workspace

Select a Log Analytics workspace to work with the Defender for SQL on Machines plan.

1. In the Azure portal search for and select **Policy** > **Authoring** > **Definitions**.

1. If you want to use the default workspace search for `Configure SQL VMs and Arc-enabled SQL servers to install Microsoft Defender for SQL and AMA with a Log Analytics Workspace`. This creates a resource group in East US and a managed identity. It also creates a resource group that includes data collection rules and a default Log Analytics Workspace. The data collection rule and Log Analytics workspace are created to align with the region of the VM. All resources are consolidated under this single resource group.

    :::image type="content" source="media/defender-for-sql-usage/default-log-analytics-workspace.png" alt-text="Screenshot of how to configure default log analytics workspace." lightbox="media/defender-for-sql-usage/default-log-analytics-workspace.png":::

1. If you want to use a custom workspace, search for `Configure SQL VMs and Arc-enabled SQL servers to install Microsoft Defender for SQL and AMA with a user-defined Log Analytics Workspace`. This creates a resource group in East US and a managed identity. It also creates a resource group with data collection rules and a custom Log Analytics workspace in the predefined region.

    :::image type="content" source="media/defender-for-sql-usage/user-defined-log-analytics-workspace.png" alt-text="Screenshot of how to configure user-defined log analytics workspace." lightbox="media/defender-for-sql-usage/user-defined-log-analytics-workspace.png":::

1. To complete the installation process, restart the SQL server (instance) for versions 2017 and older.

## Enable the plan on Azure Arc-enabled VMs

1. In the Azure portals, search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. On the Defender plans page, locate the Databases plan and select **Select types**.

    :::image type="content" source="media/tutorial-enabledatabases-plan/select-types.png" alt-text="Screenshot that shows you where to select, select types on the Defender plans page." lightbox="media/tutorial-enabledatabases-plan/select-types.png":::

1. In the Resource types selection window, toggle the **SQL servers on machines** plan to **On**.

1. Select **Continue**.

1. Select **Save**.

### Select a workspace

Select a Log Analytics workspace to work with the Defender for SQL on Machines plan.

1. In the Azure portal search for and select **Policy** > **Authoring** > **Definitions**.

1. If you want to use the default workspace search for `Configure SQL VMs and Arc-enabled SQL servers to install Microsoft Defender for SQL and AMA with a Log Analytics Workspace`. This creates a resource group in East US and a managed identity. It also creates a resource group that includes data collection rules and a default Log Analytics Workspace. The data collection rule and Log Analytics workspace are created to align with the region of the VM. All resources are consolidated under this single resource group.

    :::image type="content" source="media/defender-for-sql-usage/default-log-analytics-workspace.png" alt-text="Screenshot of how to configure default log analytics workspace." lightbox="media/defender-for-sql-usage/default-log-analytics-workspace.png":::

1. If you want to use a custom workspace, search for `Configure SQL VMs and Arc-enabled SQL servers to install Microsoft Defender for SQL and AMA with a user-defined Log Analytics Workspace`. This creates a resource group in East US and a managed identity. It also creates a resource group with data collection rules and a custom Log Analytics workspace in the predefined region.

    :::image type="content" source="media/defender-for-sql-usage/user-defined-log-analytics-workspace.png" alt-text="Screenshot of how to configure user-defined log analytics workspace." lightbox="media/defender-for-sql-usage/user-defined-log-analytics-workspace.png":::

1. To complete the installation process, restart the SQL server (instance) for versions 2017 and older.

## Verify that your machines are protected

As the last step in enabling the Defender for SQL Servers Machines plan, you should [verify that all machines are protected](verify-machine-protection.md).
