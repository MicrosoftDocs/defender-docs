---
title: Verify SQL machine protection
description: Verify that SQL VMs are protected with the Defender for SQL Servers on Machines plan as expected.
ms.author: dacurwin
author: dcurwin
ms.topic: how-to
ms.date: 02/18/2025
#customer intent: As a customer, I want to verify that my SQL VMs are protected with the Defender for SQL Servers on Machines plan as expected.
---

# Verify SQL machine protection

After enabling protection for SQL VMs with the Defender for SQL Servers on Machines plan, verify that your SQL servers are protected as expected.

## Verify protection on multiple Azure VMs

Run the [Get-SsqlVMProtectionStatusReport.ps1 PowerShell script](https://aka.ms/DfSQLprotectionverificationscale) to retrieve and report the protection status of SQL VMs protection for Defender for SQL Servers on Machines within a specified Azure subscription. This script is applicable for Azure VMs only and does the following:
- Queries registry settings from SQL VMs.
- Retrieves protection status from the machine registry.
- Converts the timestamp from .NET ticks to an ISO 8601 formatted date.
- Aggregates results for all SQL instances found on each VM.
- Exports the collected data to an Excel report, which includes:
    - SQL VM Name
    - SQL Instance Name
    - Protection Status
    - Last Update Time
    - SQL VM Resource ID

## Verify protection on multiple Azure Arc-enabled VMs

1. In the Azure portal, Search for and select **Azure Resource Graph**.

1. Copy and run the following query to identify Azure Arc-enabled VMs that aren't in a protected state.

    ```azurecli
    resources
    | where type == "microsoft.azurearcdata/sqlserverinstances"
    | extend SQLonArcProtection= tostring(properties.azureDefenderStatus)
    | extend ProtectionStatusLastUpdate = tostring(properties.azureDefenderStatusLastUpdated)
    | project name, SQLonArcProtection, ProtectionStatusLastUpdate, resourceGroup, location, type, tenantId, subscriptionId, properties
    | order by ['name'] asc
    ```

1. Review the results, specifically checking the **SQLonArcProtection** status. Any result that doesn't state `Protected` indicates that the SQL VM isn't protected.

    :::image type="content" source="media/verify-machines-protection/script-results.png" alt-text="Screenshot of the results screen once the script has been run." lightbox="media/verify-machines-protection/script-results.png":::

1. If the `ProtectionStatusLastUpdate` field doesn't show a date within the last month, the machine might not be protected. [Verify the protection of the single SQL server instance.](#verify-protection-on-a-single-sql-server-instance)

    :::image type="content" source="media/verify-machines-protection/status-update.png" alt-text="Screenshot that shows the last status update for the SQL instance." lightbox="media/verify-machines-protection/status-update.png":::

## Verify protection on a single SQL server instance

1. In the Azure portal, search for and select **SQL virtual machines**.

1. Locate and select a database on the machine.

1. Under the **Security** tab, select **Defender for Cloud**.

1. Check the **Protection status**. If the status is **Protected**, the deployment was successful.

    :::image type="content" source="media/defender-for-sql-usage/protection-status-protected.png" alt-text="Screenshot showing protection status as protected." lightbox="media/defender-for-sql-usage/protection-status-protected.png":::

## Troubleshoot unprotected machines

If databases aren't protected, follow the instructions in the [troubleshooting guide](troubleshoot-sql-machines-guide.md) to remediate.
