---
title: Overview of the Defender for SQL on Machines plan in Microsoft Defender for Cloud
description: Learn about the Defender for SQL Server on Machines plan in Microsoft Defender for Cloud
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 02/28/2024
---

# Overview - Defender for SQL Server on Machines


The Defender for SQL on Machines plan in Microsoft Defender for Cloud protects your IaaS SQL Servers hosted on VMs in Azure, muticloud, and on-premises machines. 

- Learn about [SQL Server on Virtual Machines](https://azure.microsoft.com/services/virtual-machines/sql-server/).
- To use the plan, on-premises SQL servers must be onboarded to Defender for Cloud as Azure Arc VMs. Learn more about [SQL Server enabled by Azure Arc](/sql/sql-server/azure-arc/overview).
- For multicloud SQL Server machines,  [AWS accounts](quickstart-onboard-aws.md) and [GCP projects](quickstart-onboard-gcp.md) must be connected to Defender for cloud.

Defender for SQL Server on Machines identifies and mitigates potential database vulnerabilities, and detects anomalous activities that could indicate threats to your databases.

- **Vulnerability assessment**: Defender for Cloud uses vulnerability assessment to discover, track, and assist you in the remediation of potential database vulnerabilities. Assessment scans provide an overview of your SQL machines' security state and provide details of any security findings.
- **Threat protection**: Defender for Cloud populates with alerts when it detects suspicious database activities, potentially harmful attempts to access or exploit SQL machines, SQL injection attacks, anomalous database access, and query patterns. [Review SQL alerts](alerts-sql-database-and-azure-synapse-analytics.md).


## Azure Monitoring Agent

The Defender for SQL Server on Machines plan in Microsoft Defender for Cloud uses the Azure Monitoring Agent (AMA) to prevent attacks and detect misconfigurations.


> [!NOTE]
> The Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) is set to retire.
> Use of the MMA for the Defender for SQL Server on Machines plan will be phased out by August 2024.
> AMA replaces MMA for the Defender for SQL Server on Machines plan. 

## Autoprovisioning of AMA for SQL

A SQL Server-targeted AMA autoprovisioning processes is enabled by default when you enable the Defender for SQL Server on Machines plan.

- You can turn autoprovisioning on and off as needed.
- You can also deploy the agent yourself by using a number of methods. Learn about [deployment options](../azure-monitor/vm/monitor-virtual-machine-agent.md#agent-deployment-options).)


## Migrating to the AMA

If you're still using MMA for the Defender for SQL Server on Machines plan, [follow the migration steps](defender-for-sql-autoprovisioning.md) to deploy AMA autoprovisioning.

You can run both the Log Analytics and Azure Monitor Agents on the same machine, but you should be aware of these considerations:

- Certain recommendations or alerts are reported by both agents and will appear twice in Defender for Cloud.
- Each machine is billed once in Defender for Cloud, but make sure you track billing of other services connected to the Log Analytics and Azure Monitor, such as the Log Analytics workspace data ingestion.
- Both agents have performance impact on the machine.

### Customizing the Log Analytics workspace

The AMA requires Log Analytics workspace solutions. These solutions are automatically installed when you autoprovision the Azure Monitor Agent with the default workspace.

When you install the AMA with autoprovisioning, you can define the destination workspace of the installed extensions.

By default, the destination is the “default workspace” that Defender for Cloud creates for each region in the subscription: `defaultWorkspace-<subscriptionId>-<regionShortName>`. Defender for Cloud automatically configures the data collection rules, workspace solution, and other extensions for that workspace.

If you configure a custom Log Analytics workspace:

- Defender for Cloud only configures the data collection rules and other extensions for the custom workspace. You have to configure the workspace solution on the custom workspace.
- Machines with the MMA that reports to a Log Analytics workspace with the security solution are billed even when the Defender for Servers plan isn't enabled. Machines with the AMA are billed only when the plan is enabled on the subscription. 


## Next steps

[Enable Defender for SQL Server on Machines](defender-for-sql-usage.md)

