---
title: Azure Monitor Agent (AMA) in Microsoft Defender for Cloud
description: Learn about using the Azure Monitor Agent in Microsoft Defender for Cloud
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 02/28/2024
ms.custom: template-how-to
---

# Azure Monitor Agent (AMA) in Defender for Cloud


Microsoft Defender for Cloud uses the Azure Monitor Agent (AMA) in a couple of scenarios:

- **Defender for SQL Server on Machines**: The AMA is used by the Defender for SQL Server on Machines plan to protect your IaaS SQL Servers hosted on VMs in Azure, muticloud, and on-premises machines.


## AMA in Defender for SQL on Machines

The Defender for SQL Server on Machines plan in Microsoft Defender for Cloud uses the Azure Monitoring Agent (AMA) to prevent attacks and detect misconfigurations.

The AMA replaces the Microsoft Monitoring Agent (MMA) that was previously used by the plan. The MMA is set to retire.

- If you're still using MMA for the Defender for SQL Server on Machines plan, [follow the migration steps](defender-for-sql-autoprovisioning.md) to deploy AMA autoprovisioning.
- Autoprovisioning for the MMA is turned on by default when you enable the plan. [Learn more](defender-for-sql-on-machines-overview.md) about the AMA in Defender for SQL Server on Machines. - Autoprovisioning can be turned on and off. Alternatively the agent can be deployed with other [deployment options](/azure/azure-monitor/vm/monitor-virtual-machine-agent).


## AMA in Defender for Servers

To support some features, Defender for Servers previously used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) in general availability, and the AMA in preview.

- The MMA is set to retire.  Defender for Servers dependency on the MMA agent will be phased out by November 2024.
- Use of the AMA won't be released in general availability (GA) for Defender for Servers features. Features using the AMA will deprecated or supported with other methods. 
Learn more about [agent retirement in Defender for Servers](prepare-deprecation-log-analytics-mma-agent.md


## Running MMA and AMA on the same machine

You can run both the Log Analytics and Azure Monitor Agents on the same machine, but until agent deprecation is complete, you should be aware of these considerations:

- Certain recommendations or alerts are reported by both agents and will appear twice in Defender for Cloud.
- Each machine is billed once in Defender for Cloud, but make sure you track billing of other services connected to the Log Analytics and Azure Monitor, such as the Log Analytics workspace data ingestion.
- Both agents have performance impact on the machine.

## Log Analytics workspace

The AMA requires Log Analytics workspace solutions. These solutions are automatically installed when you autoprovision the Azure Monitor Agent with the default workspace.

The [Log Analytics workspace solutions](/previous-versions/azure/azure-monitor/insights/solutions) for the data that you're collecting are:

- Cloud security posture management (CSPM) – **SecurityCenterFree solution**
- Defender for Servers Plan 2 – **Security solution**


## 500 MB data ingestion benefit

he security solution is still required on the workspace to work with the plans features and to be eligible for the 500-MB benefit.

### Customizing the workspace

When you install the AMA with autoprovisioning, you can define the destination workspace of the installed extensions.

By default, the destination is the “default workspace” that Defender for Cloud creates for each region in the subscription: `defaultWorkspace-<subscriptionId>-<regionShortName>`. Defender for Cloud automatically configures the data collection rules, workspace solution, and other extensions for that workspace.

If you configure a custom Log Analytics workspace:

- Defender for Cloud only configures the data collection rules and other extensions for the custom workspace. You have to configure the workspace solution on the custom workspace.
- Machines with the MMA that reports to a Log Analytics workspace with the security solution are billed even when the Defender for Servers plan isn't enabled. Machines with the AMA are billed only when the plan is enabled on the subscription. 






### Other security events collection

When you autoprovision the Log Analytics agent in Defender for Cloud, you can choose to collect other security events to the workspace.

As in Log Analytics workspaces, Defender for Servers Plan 2 users are eligible for [500 MB of free data](faq-defender-for-servers.yml) daily on defined data types that include security events.

## Next steps

Now that you enabled the Log Analytics agent, check out the features that are supported by the agent:

- [Endpoint protection assessment](endpoint-protection-recommendations-technical.md)
- [Fileless attack detection](defender-for-servers-introduction.md#plan-features)
- [File integrity monitoring](file-integrity-monitoring-enable-ama.md)
