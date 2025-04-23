---
title: Verify SQL machine protection government
description: Verify that SQL VMs are protected with the Defender for SQL Servers on Machines plan as expected, ensuring that all security measures are properly implemented.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 04/23/2025
#customer intent: As a customer, I want to verify that my SQL VMs are protected with the Defender for SQL Servers on Machines plan as expected.
---

# Verify SQL machine protection government

> [!IMPORTANT]
> This article applies to government clouds. If you are using commercial clouds, see the [Verify SQL machine protection](verify-machine-protection.md) article.

After enabling protection for SQL VMs with the Defender for SQL Servers on Machines plan, verify that your SQL servers are protected as expected.

## Verify protection on multiple Azure VMs

Retrieve and review the Defender for SQL Servers on Machines protection status report for all SQL VMs within a specified Azure subscription by running the [Get-SqlVMProtectionStatusReport.ps1 PowerShell script](https://aka.ms/DfSQLprotectionverificationscale). The script applies to Azure VMs only.

## Verify protection on multiple Azure Arc-enabled VMs

1. In the Azure portal, Search for and select **Azure Resource Graph**.

1. Copy and run the following query to identify Azure Arc-enabled VMs that aren't in a protected state.

    ```kusto   
    resources
    | where type == "microsoft.azurearcdata/sqlserverinstances"
    | extend SQLonArcProtection= tostring(properties.azureDefenderStatus)
    | extend ProtectionStatusLastUpdate = tostring(properties.azureDefenderStatusLastUpdated)
    | project name, SQLonArcProtection, ProtectionStatusLastUpdate, resourceGroup, location, type, tenantId, subscriptionId, properties
    | order by ['name'] asc
    ```

1. Review the results, specifically checking the **SQLonArcProtection** status. Any result that doesn't state `Protected` indicates that the SQL Server VM, or Azure Arc-enabled SQL Server isn't protected.

    :::image type="content" source="media/verify-machines-protection-gov/script-results.png" alt-text="Screenshot of the results screen once the script runs." lightbox="media/verify-machines-protection-gov/script-results.png":::

1. If the `ProtectionStatusLastUpdate` field doesn't show a date within the last day, the machine might not be protected. [Verify the protection of the single SQL server VM](#verify-protection-on-a-single-sql-server-vm).

    :::image type="content" source="media/verify-machines-protection/status-update.png" alt-text="Screenshot that shows the last status update for the SQL instance." lightbox="media/verify-machines-protection/status-update.png":::

The script can return the following possible protection statuses:
- **Protected**: Defender for SQL actively protects the instance. Ensure the information isn't outdated by checking the  Last Update field.
- **Not Protected**: Defender for SQL encountered issues while protecting the instance. This status indicates that some intervention is required to enable successful protection.
- **Inactive**: Defender for SQL runs on the machine, but the SQL instance is either paused or stopped.
- **Empty** or **Unknown**: The protection status couldn't be retrieved or doesn't exist on the machine. In this case, assume that the instance isn't protected by Defender for SQL.

## Verify protection on a single SQL server VM

1. Depending on the resources in your environment, search for and select **SQL virtual machines** or **SQL Server - Azure Arc** in the Azure portal.

1. Locate and select the relevant resource.

1. Under the **Security** tab, select **Defender for Cloud**.

1. Check the **Protection status**. If the status is **Protected**, the deployment was successful.

    :::image type="content" source="media/defender-for-sql-usage-gov/protection-status-protected.png" alt-text="Screenshot showing protection status as protected." lightbox="media/defender-for-sql-usage-gov/protection-status-protected.png":::

## Troubleshoot unprotected machines

If databases aren't protected, follow the instructions in the [troubleshooting guide](troubleshoot-sql-machines-guide-gov.md) to remediate the issues.
