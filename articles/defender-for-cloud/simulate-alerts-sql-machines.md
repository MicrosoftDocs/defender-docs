---
title: Simulate alerts for SQL servers on machines
description: Learn how to simulate alerts for SQL servers on machines in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 12/16/2025
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
- The SQL VM or Arc-connected machines are successfully protected.
- Must have the following role and permission: 
    - Contributor permission and Resource Policy contributor to the resource `Microsoft.Compute/virtualMachines/write` and `Microsoft.Resources/deployments/*`.
- The SQL Server instance must be configured to allow SQL Authentication for simulation scenarios that require a username and password (some simulation types accept user credentials). 

    > [!NOTE]
    > Use an appropriate test SQL username and password rather than a production account.

## 

