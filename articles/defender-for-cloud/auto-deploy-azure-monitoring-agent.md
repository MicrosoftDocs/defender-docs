---
title: Azure Monitor Agent (AMA) in Microsoft Defender for Cloud
description: Learn about using the Azure Monitor Agent in Microsoft Defender for Cloud
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 02/19/2025
ms.custom: template-how-to
---

# Azure Monitor Agent (AMA) in Defender for Cloud

Microsoft Defender for Cloud uses the Azure Monitor Agent (AMA) to:

- Protect databases in the Defender for SQL Server on Machines plan.
- Take advantage of the [free data ingestion](data-ingestion-benefit.md) benefit provided in Defender for Servers Plan 2.

## AMA in Defender for SQL Server on Machines

Defender for SQL Server on Machine uses the AMA to collect machine information for posture assessment, in order to detect misconfigurations and proactively prevent attacks.

- The AMA replaces the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) that was previously used by the plan.
- The MMA is deprecated. If you're using the MMA, [follow the migration steps](defender-for-sql-autoprovisioning.md) to automatically provision the AMA for Defender for SQL Server on Machines.

Autoprovisioning for the AMA is turned on by default when you enable the database plan. You can turn automatic provisioning off and on as needed.

The AMA is implemented as a virtual machine extension, but you can deploy it using other options. [Learn more](/azure/azure-monitor/vm/monitor-virtual-machine-agent) in Azure Monitor.

## Log Analytics workspace

The AMA requires a Log Analytics workspace solution. These solutions are automatically installed when you turn on the Defender for SQL Server on Machines plan with automatic AMA provisioning.  [Learn more](defender-for-sql-usage.md)

The [Log Analytics workspace solutions](/previous-versions/azure/azure-monitor/insights/solutions) for the data that you're collecting are:

- Cloud security posture management (CSPM) – **SecurityCenterFree solution**
- Defender for Servers Plan 2 – **Security solution**

### Customizing the workspace

When you install the AMA with autoprovisioning, you can define the destination workspace of the installed extensions.

By default, the destination is the “default workspace” that Defender for Cloud creates for each region in the subscription: `defaultWorkspace-<subscriptionId>-<regionShortName>`. Defender for Cloud automatically configures the data collection rules, workspace solution, and other extensions for that workspace.

If you configure a custom Log Analytics workspace:

- Defender for Cloud only configures the data collection rules and other extensions for the custom workspace. You have to configure the workspace solution on the custom workspace.
- Machines with the MMA that reports to a Log Analytics workspace with the security solution are billed even when the Defender for Servers plan isn't enabled. Machines with the AMA are billed only when the plan is enabled on the subscription.

## Next steps

[Enable Defender for SQL Servers on Machines](defender-for-sql-usage.md)
