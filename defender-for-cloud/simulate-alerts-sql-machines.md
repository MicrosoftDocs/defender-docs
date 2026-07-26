---
title: Simulate alerts for SQL servers on machines
description: Learn how to simulate alerts for SQL servers on machines in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 02/09/2026
#customer intent: As a security administrator, I want to simulate alerts for SQL servers on machines to test my security monitoring setup.
ai-usage: ai-assisted
---

# Simulate alerts for SQL servers on machines

Microsoft Defender for Cloud provides a SQL alert simulation feature that helps organizations and security teams validate deployments and test detection, response, and automation workflows without creating actual security risks.

The simulation injects telemetry records on target machines (Azure Virtual Machines (VMs) or Arc-connected machines) through a custom script extension named `Sql-SimulateAlert`. The simulated alerts include full runtime context such as host, SQL instance, database, and process information, so you can validate your end-to-end security response flows. This process is safe and non-intrusive, ensuring your resources remain secure.

You can simulate the following security scenarios:

- Brute force authentication
- Authentication from suspicious application
- SQL injection
- Principal anomaly
- Shell external source anomaly
- Shell obfuscation
 
The simulation runs locally on the machine through the Custom Script Extension without executing external malicious payloads. All generated alerts contain complete machine and resource identifiers, SQL instance names, database information, process details, and telemetry data required by playbooks and security automation workflows.

## Prerequisites

- [Enable SQL Servers on Machines plan for Defender for Databases](defender-for-sql-usage.md).
- [Ensure that the target machine, whether a SQL VM or Arc‑connected machine, is successfully protected](verify-machine-protection.md).
- Must have the following role and permission: 
    - **Create an ARM deployment and write VM extensions**: Security Admin or Contributor in the target subscription.
    - Contributor permission and Resource Policy contributor to the resource `Microsoft.Compute/virtualMachines/write` and `Microsoft.Resources/deployments/*`.
- The SQL Server instance must be configured to allow SQL Authentication for simulation scenarios that require a username and password (some simulation types accept user credentials). 

    > [!NOTE]
    > Use an appropriate test SQL username and password rather than a production account.

## Simulate alerts

The `SqlAlertSimulationClient` extracts template parameters from the target resource, including subscription, resource group, machine name, location, and the presence of the Defender extension. 

`SqlAlertSimulationClient` builds an Azure Resource Manager (ARM) template that deploys or re-uses a custom script extension on the machine. The extension runs a PowerShell command that invokes the Defender for SQL simulate helper with the requested attack parameters. The helper generates alert telemetry that flows into Defender for Cloud, triggering alerts that downstream automation and mobilization connectors can consume.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Azure SQL**.

1. Select **SQL Server on Azure VMS** or **SQL Server instances (Azure Arc)**.

    :::image type="content" source="media/simulate-alerts-sql-machines/select-sql-database.png" alt-text="Screenshot that shows how to navigate to your SQL virtual machine." lightbox="media/simulate-alerts-sql-machines/select-sql-database.png":::

1. Select the relevant database.

1. Select **Security** > **Microsoft Defender for Cloud**.  

1. Select the **Security Alerts** tab, and then select **Simulate Alerts**.

    :::image type="content" source="media/simulate-alerts-sql-machines/simulate-sql-alert.png" alt-text="Screenshot of the Microsoft Defender for SQL page with the Security Alerts tab and Simulate Alerts button highlighted." lightbox="media/simulate-alerts-sql-machines/simulate-sql-alert.png":::

1. Select an alert type.

    :::image type="content" source="media/simulate-alerts-sql-machines/select-alert-type.png" alt-text="Screenshot that shows the different types of alerts that can be selected." lightbox="media/simulate-alerts-sql-machines/select-alert-type.png":::

1. Enter the required information for the selected alert type. For example, username and password for authentication attacks.

1. Select **Simulate Alerts**.

The alert appears after a few minutes and you can use it to validate your security monitoring setup.

## Verify that the alert is generated

After you simulate an alert, verify that the alert is generated.

1. In the Azure portal, search for and select **Azure SQL**.

1. Select **SQL Server on Azure VMS** or **SQL Server instances (Azure Arc)**.

1. Select the relevant database.

1. Select **Security** > **Microsoft Defender for Cloud**.

1. Select the **Security Alerts** tab.

1. Select **Check for alerts on this resource in Microsoft Defender for Cloud**.

    :::image type="content" source="media/simulate-alerts-sql-machines/check-resource-alerts-in-defender-for-cloud.png" alt-text="Screenshot of the Microsoft Defender for SQL page with the Security Alerts tab and the link to check the resource's alerts in Defender for Cloud highlighted." lightbox="media/simulate-alerts-sql-machines/check-resource-alerts-in-defender-for-cloud.png":::
   
Verify that the simulated alert appears in the list of alerts for the resource and [manage and respond to the security alert](manage-respond-alerts.md).

## Next step

> [!div class="nextstepaction"]
> [Manage and respond to security alerts](manage-respond-alerts.md)
