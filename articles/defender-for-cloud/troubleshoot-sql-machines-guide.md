---
title: Troubleshoot Defender for SQL on Machines configuration
description: Troubleshoot configuration issues for SQL Servers on machines using the Azure Monitoring Agent (AMA) autoprovisioning process.
ms.date: 04/22/2025
ms.topic: how-to
ms.custom: references_regions
#customer intent: As a security professional, I want to ensure that my configuration of SQL servers on machines is correct and protects my resources.
---

# Troubleshoot Defender for SQL on machines configuration

> [!IMPORTANT]
> This article applies to commercial clouds. If you're using Government clouds, see the [Troubleshoot Defender for SQL on machines configuration government](troubleshoot-sql-machines-guide-gov.md) article.

Before starting the troubleshooting steps, you must [enable Defender for SQL server on Machines](defender-for-sql-usage.md) at the [subscription](defender-for-sql-usage.md#enable-the-plan-on-an-azure-subscription) or [SQL resource level.](defender-for-sql-usage.md#enable-the-plan-at-the-sql-server-resource-level).

## Step 1: Required resources and enablement process

Defender for SQL Server on machines automatically creates the following resources on your machines:

| Resource Type | Level Created |
|---------------|---------------|
| System Managed Identity (created only if a user-defined managed identity doesn't exist) | Virtual machine/Arc-enabled server hosting the SQL server instance |
| Defender for SQL extension | The extension is installed on each virtual machine/Arc-enabled server hosting the SQL server instance |


When you enable Defender for SQL Server on a subscription or specified SQL Server, it performs the following actions to protect each SQL Server instance:
- Creates a system-managed identity if there's no user-managed identity in the subscription.
- Installs the Defender for SQL extension on the virtual machine/Arc-enabled server hosting the SQL Server.
- Impersonates the Windows user running the SQL Server service (default sysadmin role) to access the SQL Server instance.


## Step 2: Ensure that you fulfilled the prerequisites

- **Subscription permissions**: To deploy the plan on a subscription, including Azure Policy, you need **Subscription Owner** permissions.

- **SQL Server instance permissions**: SQL Server service accounts must have the **sysadmin** fixed server role on each SQL Server instance, which is the default setting. Learn more about the [SQL Server service account requirement](/sql/sql-server/azure-arc/configure-least-privilege?view=sql-server-ver16). 

- **Supported Resources**: 
    - [SQL virtual machines](/azure/azure-sql/virtual-machines/windows/sql-server-on-azure-vm-iaas-what-is-overview?view=azuresql), and [Azure Arc SQL Server instances](/sql/sql-server/azure-arc/overview?view=sql-server-ver16) are supported.
    - On-premises machines must be [onboarded to Arc and registered as Azure Arc SQL Server instances](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

**Communication**: Allow outbound HTTPS traffic over Transmission Control Protocol (TCP) port 443 using Transport Layer Security (TLS) to `*.<region>.arcdataservices.com` URL. Learn more about [URL requirements](/azure/azure-arc/servers/network-requirements#urls?tabs=azure-cloud).
  
- **Extensions**: Ensure these extensions aren't blocked in your environment. Learn more about [restricting extensions installation on Windows VMs](/azure/virtual-machines/extensions/extensions-rmpolicy-howto-ps).
    - **Defender for SQL (IaaS and Arc)**
        - Publisher: Microsoft.Azure.AzureDefenderForSQL
        - Type: AdvancedThreatProtection.Windows
    - **SQL IaaS Extension (IaaS)**
        - Publisher: Microsoft.SqlServer.Management
        - Type: SqlIaaSAgent
    - **SQL IaaS Extension (Arc)**
        - Publisher: Microsoft.AzureData
        - Type: WindowsAgent.SqlServer

- **Supported SQL Server versions** - SQL Server 2012 R2 (11.x) and later versions.

- **Supported operating systems**- SQL Server 2012 R2 and later versions.

## Step 3: Identify and resolve protection misconfigurations at the SQL Server instance Level

Follow the [verification process](verify-machine-protection.md) to identify protection misconfigurations on SQL Server instances.

The recommendation `The status of Microsoft SQL Servers on Machines should be protected` can be used to verify the protection status of SQL Servers, but the recommendation should be remediated at the resource level. Any SQL server that is unprotected is identified in the unhealthy resource section of the recommendation with a protection status listed and a reason.

The recommendation is only updated every 12 hours. To check the real-time status of your machine, you must [verify the protection status of each SQL server](verify-machine-protection.md#verify-protection-on-a-single-sql-server-vm) and perform any troubleshooting if necessary.

Use the corresponding unhealthy reason and recommended actions to resolve the misconfiguration:

| Unhealthy reason | Recommended action |
|--|--|
| **Missing identity** | Assign user-defined/system-defined managed identity to the virtual machine/Arc-enabled server hosting the SQL Server instance. No Role-based access control permissions are required. |
| **Defender for SQL extension does not exist** | Ensure that the Defender for SQL extension isn't blocked by  [Azure deny policies](/azure/virtual-machines/extensions/extensions-rmpolicy-howto-ps): <br> - Publisher: Microsoft.Azure.AzureDefenderForSQL <br> - Type: AdvancedThreatProtection.Windows <br> Manually install the Defender for SQL extension on the virtual machine by hosting the SQL Server instance by using the provided  script. Ensure you have version 2.X or above. <br><br> 1. Run this script `Set-AzVMExtension -Publisher 'Microsoft.Azure.AzureDefenderForSQL' -ExtensionType  'AdvancedThreatProtection.Windows' -ResourceGroupName 'resourceGroupeName' -VMName <Vm name> -Name 'Microsoft.Azure.AzureDefenderForSQL.AdvancedThreatProtection.Windows' -TypeHandlerVersion '2.0' -Location 'vmLocation' -EnableAutomaticUpgrade $true` <br> <br> 2. Run this script to set the context of the right subscription: `connect-AzAccount -Subscription SubscriptionId -UseDeviceAuthentication` |
| **Defender for SQL extension should be up-to-date** | Update the extension in the Extensions page in the virtual machine/Arc-enabled server resource. |
| **Error during the installation of the Defender for SQL extension** | Check the Defender for SQL extension status in the portal for additional information to troubleshoot the issue. |
| **SQL Server instance is inactive** | Defender for SQL server on machines can only protect active (running) SQL server instances. |
| **Lack of permissions** | Ensure that the SQL Server service account is a member of the sysadmin fixed server role on each SQL Server instance (default setting). Learn more about [SQL Server service permissions](/sql/sql-server/azure-arc/configure-least-privilege?view=sql-server-ver16). |
| **Lack of communication** | Ensure outbound HTTPS traffic on TCP port 443 using Transport Layer Security (TLS) is allowed from the virtual machine/Arc-enabled server to the `*.<region>.arcdataservices.com` URL. Learn more about [URL requirements](/azure/azure-arc/servers/network-requirements#urls?tabs=azure-cloud) |
| **SQL server restart is needed** | Restart the SQL Server instance so that the Defender for SQL Server installation takes effect. |
| **Internal error** | Please contact support. |

### Multiple SQL Server instances on the same virtual machine

If you have multiple SQL Server instances installed on the same virtual machine, the recommendation `The status of Microsoft SQL Servers on Machines should be protected` can't differentiate between instances. To correlate the error message with the corresponding SQL Server instance, check the error message under the Defender for SQL extension. The Defender for SQL extension can display the following reasons for each instance:

- Restart the SQL Server
- Check permissions
- Ensure the SQL Server instance is active

1. In the Azure portal, search for and select **SQL virtual machine**.

1. Select the relevant virtual machine.

1. Navigate to **Settings** > **Extensions + applications**.

    :::image type="content" source="media/troubleshoot-sql-machines-guide/extensions.png" alt-text="Screenshot that shows where to locate the Extensions and applications section." lightbox="media/troubleshoot-sql-machines-guide/extensions.png":::

1. Select the relevant extension to view its protection status.

    :::image type="content" source="media/troubleshoot-sql-machines-guide/extension-status.png" alt-text="Screenshot that shows the information screen for the selected extension." lightbox="media/troubleshoot-sql-machines-guide/extension-status.png":::

Based on the [unhealthy reason listed, take the appropriate action](#step-3-identify-and-resolve-protection-misconfigurations-at-the-sql-server-instance-level) to remediate the issue.

## Step 4: Reverify protection status

After completing the remediation of all errors for each SQL Server instance, [reverify the protection status of each SQL Server instance](verify-machine-protection.md).
