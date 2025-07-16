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

- Protect databases in the Defender for SQL Servers on Machines plan.
- Take advantage of the [free data ingestion](data-ingestion-benefit.md) benefit provided in Defender for Servers Plan 2.

## AMA in Defender for SQL Servers on Machines

Defender for SQL Server on Machine uses the AMA to collect machine information for posture assessment, in order to detect misconfigurations and proactively prevent attacks.

- The AMA replaces the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) that was previously used by the plan.
- The MMA is deprecated. If you're using the MMA, [follow the migration steps](defender-for-sql-autoprovisioning.md) to automatically provision the AMA for Defender for SQL Servers on Machines.

Autoprovisioning for the AMA is turned on by default when you enable the database plan. You can turn automatic provisioning off and on as needed.

The AMA is implemented as a virtual machine extension, but you can deploy it using other options. [Learn more](/azure/azure-monitor/vm/monitor-virtual-machine-agent) in Azure Monitor.

## Next steps

[Enable Defender for SQL Servers on Machines](defender-for-sql-usage.md)
