---
title: Simulate alerts for SQL servers on machines
description: Learn how to simulate alerts for SQL servers on machines in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 12/24/2025
#customer intent: As a security administrator, I want to simulate alerts for SQL servers on machines to test my security monitoring setup.
---

# Simulate alerts for SQL servers on machines

Microsoft Defender for Cloud provides a SQL simulated alerts feature that helps you validate your security monitoring setup without creating actual security risks. You can generate representative SQL Server security alerts to test your detection, response, and automation workflows.

The simulation feature uses the Defender for SQL "simulate" helper to inject telemetry-like records on target machines (Azure Virtual Machine (VMs) or Arc-connected machines) through a Custom Script Extension named `Sql-SimulateAlert`. The simulated alerts include full runtime context such as host, SQL instance, database, and process information, allowing you to validate your end-to-end security response flows. This process is safe and non-intrusive, ensuring your resources remain secure.

You can simulate the following security scenarios:

- Brute force login
- Suspicious application login
- SQL injection
- Principal anomaly
- Shell anomalies

The simulation runs locally on the machine through the Custom Script Extension without executing external malicious payloads. All generated alerts contain complete machine and resource identifiers, SQL instance names, database information, process details, and telemetry data required by playbooks and security automation workflows.

## Prerequisites

- [Enable SQL Servers on Machines plan for Defender for Databases](defender-for-sql-usage.md).
- [Verify that the target machine is successfully protected](verify-machine-protection.md).
- The SQL VM or Arc-connected machines are successfully protected.
- Must have the following role and permission: 
    - **Create an ARM deployment and to write VM extensions**: Security Admin or Contributor in the target subscription.
    - Contributor permission and Resource Policy contributor to the resource `Microsoft.Compute/virtualMachines/write` and `Microsoft.Resources/deployments/*`.
- The SQL Server instance must be configured to allow SQL Authentication for simulation scenarios that require a username and password (some simulation types accept user credentials). 

    > [!NOTE]
    > Use an appropriate test SQL username and password rather than a production account.

## Simulate alerts

The SqlAlertSimulationClient extracts template parameters from the target resource, including subscription, resource group, machine name, location, and the presence of the Defender extension. 

SqlAlertSimulationClient builds an Azure Resource Manager (ARM) template that deploys or re-uses a custom script extension on the machine, which runs a PowerShell command that invokes the Defender for SQL simulate helper with the requested attack parameters. The helper generates alert telemetry that flows into Defender for Cloud, triggering alerts that downstream automation and mobilization connectors can consume.

1. Sign in the [Azure portal](https://portal.azure.com/).

1. Search for and select **Azure SQL**.

1. Select the relevant database.

1. Select **Security** > **Microsoft Defender for Cloud**.  

1. Select **Simulate alert**.
1. Select **attack type**.
1. Enter a username, password....
1. Select **Submit**.
1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

