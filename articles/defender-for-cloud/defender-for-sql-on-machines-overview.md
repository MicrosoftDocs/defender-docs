---
title: Microsoft Defender for SQL Servers on Machines overview
description: Protect infrastructure as a service (IaaS) SQL servers across Azure, multicloud, and on-premises environments with vulnerability assessment and threat protection.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 05/25/2026
---

# Microsoft Defender for SQL Servers on Machines overview

## Microsoft Defender for SQL Servers on Machines plan

The Defender for SQL on Machines plan in Microsoft Defender for Cloud protects your infrastructure as a service (IaaS) SQL Servers hosted on virtual machines (VMs) in Azure, multicloud, and on-premises environments.

- To use the plan, onboard on-premises SQL servers to Defender for Cloud as Azure Arc VMs. Learn more about [SQL Server enabled by Azure Arc](/sql/sql-server/azure-arc/overview) and [SQL Server on Virtual Machines](https://azure.microsoft.com/services/virtual-machines/sql-server/).

- For multicloud SQL Server machines, connect Defender for Cloud by using the [AWS onboarding quickstart](quickstart-onboard-aws.md) and [GCP onboarding quickstart](quickstart-onboard-gcp.md).

Defender for SQL Servers on Machines identifies and mitigates potential database vulnerabilities, and detects anomalous activities that could indicate threats to your databases.

- **Vulnerability assessment**: Defender for Cloud uses vulnerability assessment to discover, track, and assist you in the remediation of potential database vulnerabilities. Assessment scans provide an overview of your SQL machines' security state and provide details of any security findings.
- **Threat protection**: Defender for Cloud populates with alerts when it detects suspicious database activities, potentially harmful attempts to access or exploit SQL machines, SQL injection attacks, anomalous database access, and query patterns. [Review SQL alerts](alerts-sql-database-and-azure-synapse-analytics.md).

## Next steps

[Enable Defender for SQL Servers on Machines](defender-for-sql-usage.md)

