---
title: Benefits and Features of Defender for Azure SQL Databases
description: Learn how Microsoft Defender for Azure SQL databases helps you discover, track, and mitigate vulnerabilities, and alerts you to potential threats.
ms.date: 03/12/2024
ms.topic: overview
ms.custom: references_regions
ms.author: dacurwin
author: dcurwin
#customer intent: As a database administrator, I want to understand the benefits and features of Microsoft Defender for Azure SQL databases so that I can protect my databases effectively.
---

# Overview of Microsoft Defender for Azure SQL databases

In Microsoft Defender for Cloud, the *Defender for Azure SQL databases* plan within Defender for Databases helps you discover and mitigate potential [database vulnerabilities](sql-azure-vulnerability-assessment-overview.md). It alerts you to anomalous activities that might indicate a threat to your databases.

When you enable Defender for Azure SQL databases, all supported resources within the subscription are protected. Future resources that you create on the same subscription will also be protected. For information about billing, see the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

Defender for Azure SQL databases helps protect read/write replicas of:

- Azure SQL [single databases](/azure/azure-sql/database/single-database-overview) and [elastic pools](/azure/azure-sql/database/elastic-pool-overview).
- [Azure SQL managed instances](/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview).
- [Azure Synapse Analytics (formerly Azure SQL Data Warehouse) dedicated SQL pools](/azure/synapse-analytics/sql-data-warehouse/sql-data-warehouse-overview-what-is).

Defender for Azure SQL databases helps protect the following SQL Server products:

- SQL Server version 2012, 2014, 2016, 2017, 2019, and 2022
- [SQL Server on Azure Virtual Machines](/azure/azure-sql/virtual-machines/windows/sql-server-on-azure-vm-iaas-what-is-overview)
- [SQL Server enabled by Azure Arc](/sql/sql-server/azure-arc/overview)

## Benefits

### Vulnerability assessment

Defender for Azure SQL databases discovers, tracks, and helps you fix potential database vulnerabilities. These vulnerability assessment scans provide an overview of your SQL machines' security state and details of any security findings, including anomalous activities that could indicate threats to your databases. [Learn more about the vulnerability assessment](./sql-azure-vulnerability-assessment-overview.md).

### Threat protection

Defender for Azure SQL databases uses [Advanced Threat Protection](/azure/azure-sql/database/threat-detection-overview) to continuously monitor your SQL servers for threats like:

- **Potential SQL injection attacks**: For example, vulnerabilities detected when applications generate a faulty SQL statement in the database.
- **Anomalous database access and query patterns**: For example, an abnormally high number of failed sign-in attempts with different credentials (a brute force attack).
- **Suspicious database activity**: For example, a legitimate user accessing a SQL server from a breached computer that communicated with a crypto-mining command and control (C&C) server.

Defender for Azure SQL databases provides action-oriented security alerts in Defender for Databases. These alerts include details of the suspicious activity, guidance on how to mitigate the threats, and options for continuing your investigations by using Microsoft Sentinel. [Learn more about the security alerts for SQL servers](alerts-sql-database-and-azure-synapse-analytics.md).

## Related content

- [Protect your databases with Defender for Databases](quickstart-enable-database-protections.md)
- [How Defender for SQL can protect SQL servers anywhere](https://www.youtube.com/watch?v=V7RdB6RSVpc) (video)
- [Configure email notifications for alerts and attack paths](configure-email-notifications.md)
