---
title: Enable Microsoft Defender for SQL servers on machines
description: Learn how to protect your Microsoft SQL servers on Azure VMs, on-premises, and in hybrid and multicloud environments with Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 02/13/2025
#customer intent: As a security administrator, I want to enable Microsoft Defender for SQL servers on machines so that I can protect my SQL servers in various environments.
---

# Enable Microsoft Defender for SQL servers on machines

Defender for SQL servers on machines protects SQL servers hosted on Azure Virtual Machines, on-premises environments, and Azure Arc-enabled SQL servers. Defender for SQL servers on machines provides a unified security management experience for SQL servers.

## Prerequisites

Before deploying AMA with Defender for Cloud, ensure you have the following prerequisites:

- Ensure your multicloud and on-premises machines have Azure Arc installed. 
  - AWS and GCP machines
    - [Onboard your AWS connector](quickstart-onboard-aws.md) and automatically provision Azure Arc.
    - [Onboard your GCP connector](quickstart-onboard-gcp.md) and automatically provision Azure Arc.
  - On-premises machines
    - [Install Azure Arc](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).
- Make sure the Defender plans that you want the Azure Monitor Agent to support are enabled:
  - [Enable Defender for SQL servers on machines](defender-for-sql-usage.md)  
  - [Enable Defender plans on the subscriptions for your AWS VMs](quickstart-onboard-aws.md)
  - [Enable Defender plans on the subscriptions for your GCP VMs](quickstart-onboard-gcp.md)

- For multicloud SQL servers:

  - [Connect your AWS accounts to Microsoft Defender for Cloud](quickstart-onboard-aws.md)

  - [Connect your GCP project to Microsoft Defender for Cloud](quickstart-onboard-gcp.md)

    > [!NOTE]
    > You must enable database protection for your multicloud SQL servers through the [AWS connector](quickstart-onboard-aws.md#connect-your-aws-account), or the [GCP connector](quickstart-onboard-gcp.md#configure-the-defender-for-databases-plan).

## Enable Defender for SQL on non-Azure machines using the AMA agent

### Prerequisites for enabling Defender for SQL on non-Azure machines

- An active Azure subscription.
- **Subscription owner** permissions on the subscription in which you wish to assign the policy.

- SQL Server on machines prerequisites:
  - **Permissions**: the Windows user operating the SQL server must have the **Sysadmin** role on the database.
  - **Extensions**: The following extensions should be added to the allowlist:
    - Defender for SQL (IaaS and Arc):
      - Publisher: Microsoft.Azure.AzureDefenderForSQL
      - Type: AdvancedThreatProtection.Windows
    - SQL IaaS Extension (IaaS):
      - Publisher: Microsoft.SqlServer.Management
      - Type: SqlIaaSAgent
    - SQL IaaS Extension (Arc):
      - Publisher: Microsoft.AzureData
      - Type: WindowsAgent.SqlServer
    - AMA extension (IaaS and Arc):
      - Publisher: Microsoft.Azure.Monitor
      - Type: AzureMonitorWindowsAgent

### Naming conventions in the "Deny policy" allowlist

- Defender for SQL uses the following naming convention when creating our resources:

  - Data Collection Rule: `MicrosoftDefenderForSQL--dcr`
  - DCRA: `/Microsoft.Insights/MicrosoftDefenderForSQL-RulesAssociation`
  - Resource group: `DefaultResourceGroup-`
  - Log analytics workspace: `D4SQL--`

- Defender for SQL uses *MicrosoftDefenderForSQL* as a *createdBy* database tag.

### Steps to enable Defender for SQL on non-Azure machines

1. Connect SQL server to Azure Arc. For more information on the supported operating systems, connectivity configuration, and required permissions, see the following documentation:

    - [Plan and deploy Azure Arc-enabled servers](/azure/azure-arc/servers/plan-at-scale-deployment)
    - [Connected Machine agent prerequisites](/azure/azure-arc/servers/prerequisites)
    - [Connected Machine agent network requirements](/azure/azure-arc/servers/network-requirements)
    - [Roles specific to SQL Server enabled by Azure Arc](/sql/relational-databases/security/authentication-access/server-level-roles#roles-specific-to-sql-server-enabled-by-azure-arc)

1. Once Azure Arc is installed, the Azure extension for SQL Server is installed automatically on the database server. For more information, see [Manage automatic connection for SQL Server enabled by Azure Arc](/sql/sql-server/azure-arc/manage-autodeploy).

### Enable Defender for SQL

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. On the Defender plans page, locate the Databases plan and select **Select types**.

    :::image type="content" source="media/tutorial-enabledatabases-plan/select-types.png" alt-text="Screenshot that shows you where to select, select types on the Defender plans page." lightbox="media/tutorial-enabledatabases-plan/select-types.png":::

1. In the Resource types selection window, toggle the **SQL servers on machines** plan to **On**.

1. Select **Continue**.

1. Select **Save**.

1. Once enabled, use one of the following policy initiatives:
   - Configure SQL VMs and Arc-enabled SQL servers to install Microsoft Defender for SQL and AMA with a Log Analytics Workspace for a default Log Analytics Workspace. This creates resource groups with data collection rules and a default Log Analytics Workspace. For more information about the Log Analytics Workspace, see [Log Analytics workspace overview](/azure/azure-monitor/logs/log-analytics-workspace-overview).

    :::image type="content" source="media/defender-for-sql-usage/default-log-analytics-workspace.png" alt-text="Screenshot of how to configure default log analytics workspace." lightbox="media/defender-for-sql-usage/default-log-analytics-workspace.png":::

   - Configure SQL VMs and Arc-enabled SQL servers to install Microsoft Defender for SQL and AMA with a user-defined Log Analytics Workspace. This creates a resource group with data collection rules and a custom Log Analytics Workspace in the predefined region. During this process, install the Azure Monitoring Agent. For more information about the options to install the AMA agent, see [Azure Monitor Agent prerequisites](/azure/azure-monitor/agents/azure-monitor-agent-manage#prerequisites).

    :::image type="content" source="media/defender-for-sql-usage/user-defined-log-analytics-workspace.png" alt-text="Screenshot of how to configure user-defined log analytics workspace." lightbox="media/defender-for-sql-usage/user-defined-log-analytics-workspace.png":::

1. To complete the installation process, restart the SQL server (instance) for versions 2017 and older.

## Enable Defender for SQL on Azure virtual machines using the AMA agent

### Prerequisites for enabling Defender for SQL on Azure virtual machines

- An active Azure subscription.
- **Subscription owner** permissions on the subscription in which you wish to assign the policy.
- SQL Server on machines prerequisites:
  - **Permissions**: the Windows user operating the SQL server must have the **Sysadmin** role on the database.
  - **Extensions**: The following extensions should be added to the allowlist:
    - Defender for SQL (IaaS and Arc):
      - Publisher: Microsoft.Azure.AzureDefenderForSQL
      - Type: AdvancedThreatProtection.Windows
    - SQL IaaS Extension (IaaS):
      - Publisher: Microsoft.SqlServer.Management
      - Type: SqlIaaSAgent
    - SQL IaaS Extension (Arc):
      - Publisher: Microsoft.AzureData
      - Type: WindowsAgent.SqlServer
    - AMA extension (IaaS and Arc):
      - Publisher: Microsoft.Azure.Monitor
      - Type: AzureMonitorWindowsAgent
- Since we're creating a resource group in *East US*, as part of the autoprovisioning enablement process, this region needs to be allowed or Defender for SQL can't complete the installation process successfully.

### Steps to enable Defender for SQL on Azure virtual machines

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. On the Defender plans page, locate the Databases plan and select **Select types**.

    :::image type="content" source="media/tutorial-enabledatabases-plan/select-types.png" alt-text="Screenshot that shows you where to select types on the Defender plans page." lightbox="media/tutorial-enabledatabases-plan/select-types.png":::

1. In the Resource types selection window, toggle the **SQL servers on machines** plan to **On**.

1. Select **Continue**.

1. Select **Save**.

1. Once enabled, use one of the following policy initiatives:
   - Configure SQL VMs and Arc-enabled SQL servers to install Microsoft Defender for SQL and AMA with a Log Analytics Workspace for a default Log Analytics Workspace. This creates a resource group in East US and a managed identity. For more information about the use of the managed identity, see [Resource Manager template samples for agents in Azure Monitor](/azure/azure-monitor/agents/resource-manager-agent). It also creates a resource group that includes Data Collection Rules and a default Log Analytics Workspace. All resources are consolidated under this single resource group. The Data Collection Rule and Log Analytics Workspace are created to align with the region of the virtual machine (VM).

    :::image type="content" source="media/defender-for-sql-usage/default-log-analytics-workspace.png" alt-text="Screenshot of how to configure default log analytics workspace." lightbox="media/defender-for-sql-usage/default-log-analytics-workspace.png":::

   - Configure SQL VMs and Arc-enabled SQL servers to install Microsoft Defender for SQL and AMA with a user-defined Log Analytics Workspace. This creates a resource group in East US and a managed identity. For more information about the use of the managed identity, see [Resource Manager template samples for agents in Azure Monitor](/azure/azure-monitor/agents/resource-manager-agent). It also creates a resource group with DCR and a custom Log Analytics Workspace in the predefined region.

    :::image type="content" source="media/defender-for-sql-usage/user-defined-log-analytics-workspace.png" alt-text="Screenshot of how to configure user-defined log analytics workspace." lightbox="media/defender-for-sql-usage/user-defined-log-analytics-workspace.png":::

1. To complete the installation process, restart the SQL server (instance) for versions 2017 and older.

If you run into any configuration issues while enabling Defender for SQL on machines, check out the [troubleshooting guide](troubleshoot-sql-machines-guide.md).

## Related content

For related information, see these resources:

- [How Microsoft Defender for Azure SQL can protect SQL servers anywhere](https://www.youtube.com/watch?v=V7RdB6RSVpc).
- [Security alerts for SQL Database and Azure Synapse Analytics](alerts-sql-database-and-azure-synapse-analytics.md)
- Check out [common questions](faq-defender-for-databases.yml) about Defender for Databases.
- [Troubleshoot guide - SQL Server deployment on machines](troubleshoot-sql-machines-guide.md)
