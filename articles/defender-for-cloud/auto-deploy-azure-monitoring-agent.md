---
title: Azure Monitor Agent (AMA) in Microsoft Defender for Cloud
description: Learn about using the Azure Monitor Agent in Microsoft Defender for Cloud
ms.topic: how-to
ms.date: 05/27/2026
ms.custom: template-how-to
#customer intent: As a user, I want to understand how Microsoft Defender for Cloud uses Azure Monitor Agent for SQL Servers on Machines so I can configure it correctly.
---

# Azure Monitor Agent (AMA) in Microsoft Defender for Cloud

Microsoft Defender for Cloud uses the Azure Monitor Agent (AMA) to:

- Protect databases in the Defender for SQL Servers on Machines plan.
- Take advantage of the [free data ingestion](data-ingestion-benefit.md) benefit provided in Defender for Servers Plan 2.

## AMA in Defender for SQL Servers on Machines

Defender for SQL Servers on Machines uses the AMA to collect machine information for posture assessment. This data helps detect misconfigurations and prevent attacks.

- The AMA replaces the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) that the plan previously used.
- The MMA is deprecated. If you're using MMA, migrate to AMA by using the [auto-provisioning instructions for Defender for SQL Servers on Machines](defender-for-sql-autoprovisioning.md).

> [!IMPORTANT]
> The AMA configuration for SQL Servers on Machines applies only to government clouds.

Autoprovisioning for the AMA is turned on by default when you enable the database plan. You can turn automatic provisioning off and on as needed.

The AMA is implemented as a virtual machine extension, but you can deploy it in other ways. For deployment options, see [Monitor virtual machines with Azure Monitor agent](/azure/azure-monitor/vm/monitor-virtual-machine-agent).

## Next step

> [!div class="nextstepaction"]
> [Enable Defender for SQL Servers on Machines](defender-for-sql-usage.md)

