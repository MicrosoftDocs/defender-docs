---
title: Overview of the Defender for SQL on Machines plan in Microsoft Defender for Cloud
description: Learn about the Defender for SQL Servers on Machines plan in Microsoft Defender for Cloud
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 07/15/2025
---

# Overview - Defender for SQL Servers on Machines

The Defender for SQL on Machines plan in Microsoft Defender for Cloud protects your IaaS SQL Servers hosted on VMs in Azure, multiclouds, and on-premises machines.

-To use the plan, on-premises SQL servers must be onboarded to Defender for Cloud as Azure Arc VMs. Learn more about [SQL Server enabled by Azure Arc](/sql/sql-server/azure-arc/overview) and [SQL Server on Virtual Machines](https://azure.microsoft.com/services/virtual-machines/sql-server/).

- For multicloud SQL Server machines, [AWS accounts](quickstart-onboard-aws.md) and [GCP projects](quickstart-onboard-gcp.md) must be connected to Defender for cloud.

Defender for SQL Servers on Machines identifies and mitigates potential database vulnerabilities, and detects anomalous activities that could indicate threats to your databases.

- **Vulnerability assessment**: Defender for Cloud uses vulnerability assessment to discover, track, and assist you in the remediation of potential database vulnerabilities. Assessment scans provide an overview of your SQL machines' security state and provide details of any security findings.
- **Threat protection**: Defender for Cloud populates with alerts when it detects suspicious database activities, potentially harmful attempts to access or exploit SQL machines, SQL injection attacks, anomalous database access, and query patterns. [Review SQL alerts](alerts-sql-database-and-azure-synapse-analytics.md).

## Next steps

[Enable Defender for SQL Servers on Machines](defender-for-sql-usage.md)
