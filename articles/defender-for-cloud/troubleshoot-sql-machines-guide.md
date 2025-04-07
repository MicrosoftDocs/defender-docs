---
title: Troubleshoot Defender for SQL on Machines configuration
description: Troubleshoot configuration issues for SQL Servers on machines using the Azure Monitoring Agent (AMA) autoprovisioning process.
ms.date: 04/07/2025
ms.topic: how-to
ms.custom: references_regions
#customer intent: As a security professional, I want to ensure that my configuration of SQL servers on machines is correct and protects my resources.
---

# Troubleshoot Defender for SQL on machines configuration

Before starting the troubleshooting steps you must [enable Defender for SQL server on Machines](defender-for-sql-usage.md) at the [subscription](defender-for-sql-usage.md#enable-the-plan-on-an-azure-subscription) or [SQL resource level.](defender-for-sql-usage.md#enable-the-plan-at-the-sql-server-resource-level).

## Step 1: Required resources and enablement process

Defender for SQL server on machines automatically creates the following resources on your machines:

| Resource Type | Level Created |
|---------------|---------------|
| System Managed Identity (will be created only if a user-defined managed identity does not exist) | Virtual machine/Arc-enabled server hosting the SQL server instance |
| Defender for SQL extension | The extension is installed on each virtual machine/Arc-enabled server hosting the SQL server instance |

When you enable Defender for SQL Server on a subscription or specified SQL server, it performs the following actions to protect each SQL Server instance:
- Create a system-managed identity if there is no user-managed identity in the subscription.
- Install the Defender for SQL extension on the virtual machine/Arc-enabled server hosting the SQL server.
- Impersonate the Windows user running the SQL server service (default sysadmin role) to access the SQL server instance.

## Step 2: Ensure that you fulfilled the prerequisites

- **Subscription permissions**: To deploy the plan on a subscription including Azure Policy, you need **Subscription Owner** permissions.

- **SQL Server instance permissions**: SQL Server service accounts must be a member of the **sysadmin** fixed server role on each SQL Server instance, this is the default setting. Learn more about the [SQL Server service account requirement](/sql/sql-server/azure-arc/configure-least-privilege?view=sql-server-ver16). 

- **Supported Resources**: 
    - [SQL virtual machines](/azure/azure-sql/virtual-machines/windows/sql-server-on-azure-vm-iaas-what-is-overview?view=azuresql), and [Azure Arc SQL Server instances](/sql/sql-server/azure-arc/overview?view=sql-server-ver16) are supported.
    - On-premises machines must be [onboarded to Arc and registered as Azure Arc SQL Server instances](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

- **Communication**: Outbound HTTPS traffic on TCP port 443 using Transport Layer Security (TLS) should be allowed to `*.<region>.arcdataservices.com` URL. Learn more about [URL requirements](/azure/azure-arc/servers/network-requirements#urls?tabs=azure-cloud).
  
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

Follow the [verification process](verify-machine-protection.md) to identify protection misconfigurations on SQL server instances. 

The recommendation `The status of Microsoft SQL Servers on Machines should be protected` appears and can be used to verify the protection status of SQL servers. Any SQL server that is unprotected will be identified with an error message in the unhealthy section of the recommendation. 

Use the corresponding error message and recommended actions listed below to resolve the misconfiguration:

| Error message | Recommended action |
|--|--|
| **Missing identity** | Assign user-defined/system-defined managed identity to the virtual machine/Arc-enabled server hosting the SQL Server instance. No RBAC permissions are required. |
| **Defender for SQL extension does not exist** | Ensure that the Defender for SQL extension isn't blocked by [Azure deny policies](/azure/virtual-machines/extensions/extensions-rmpolicy-howto-ps): <br> - Publisher: Microsoft.Azure.AzureDefenderForSQL <br> - Type: AdvancedThreatProtection.Windows <br> Manually install the Defender for SQL extension on the virtual machine by hosting the SQL Server instance by using the below script. Please ensure it is version 2.X or above. |
| **Defender for SQL extension should be up-to-date** | Update the extension in the Extensions blade in the virtual machine/Arc-enabled server resource. |
| **Error during the installation of the Defender for SQL extension** | Check the Defender for SQL extension status in the portal for additional information to troubleshoot the issue. |
| **SQL Server instance is inactive** | Defender for SQL server on machines can only protect active SQL servers’ instances only. |
| **Lack of permissions** | Ensure that The SQL Server service account must be a member of the sysadmin fixed server role on each SQL Server instance (default setting). Learn more about [SQL Server service permissions](/sql/sql-server/azure-arc/configure-least-privilege?view=sql-server-ver16). |
| **Lack of communication** | Ensure outbound HTTPS traffic on TCP port 443 using Transport Layer Security (TLS) should is allowed from the virtual machine/Arc-enabled server to the `*.<region>.arcdataservices.com` URL. Learn more about [URL requirements](/azure/azure-arc/servers/network-requirements#urls?tabs=azure-cloud) |
| **SQL server restart is needed** | Please restart the SQL Server instance so that the Defender for SQL Server installation will take effect. |
| **Internal error** | Please contact support. |


## Step 4: Reverify Protection Status

After completing the remediation of all errors for each SQL Server instance, [reverify the protection status of each SQL Server instance](verify-machine-protection.md).
