---
title: Protect your databases with Defender for Databases
description: Learn how to enable the Databases plan on your Azure subscription for Microsoft Defender for Cloud to enhance your database security.
ms.topic: how-to
ms.date: 02/17/2025
#customer intent: As a database administrator, I want to enable Defender for Databases so that I can enhance the security of my databases.
---

# Protect your databases with Defender for Databases

Defender for Databases in Microsoft Defender for Cloud helps you protect your entire database estate. It provides attack detection and threat response for the most popular database types in Azure. Defender for Cloud protects database engines and data types based on their attack surface and security risks.

Database protection includes:

- [Microsoft Defender for Azure SQL databases](defender-for-sql-introduction.md)
- [Microsoft Defender for SQL servers on machines](defender-for-sql-usage.md) (You can also [enable on a Log Analytics workspace](enable-plan-workspace.md))
- [Microsoft Defender for open-source relational databases](defender-for-databases-introduction.md)
- [Microsoft Defender for Azure Cosmos DB](concept-defender-for-cosmos.md)

These four database protection plans are priced separately. Find more info about Defender for Cloud's pricing on [the pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- Connect your [non-Azure machines](quickstart-onboard-machines.md), [Amazon Web Service (AWS) account](quickstart-onboard-aws.md), or [Google Cloud Platform (GCP) projects](quickstart-onboard-gcp.md).

## Enable the Databases plan

Enabling database protection activates all four Defender plans and protects all supported databases on your subscription.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant Azure subscription, AWS account, or GCP project.

1. On the Defender plans page, switch the Databases plan to **On**.

    :::image type="content" source="media/tutorial-enabledatabases-plan/enable-databases.png" alt-text="Screenshot that shows you where to select, to enable the databases plan." lightbox="media/tutorial-enabledatabases-plan/enable-databases.png":::

## Enable and modify specific database plans

Enabling database protection activates the following four Defender plans:

- Defender for Azure SQL databases
- Defender for SQL server on machines (You can also [enable on a Log Analytics workspace](enable-plan-workspace.md))
- Defender for open-source relational databases
- Defender for Azure Cosmos DB

These plans protect all supported databases in your subscription. 

To enable and modify each plan individually, see:

- [Enable Defender for Azure SQL Databases](enable-sql-database-plan.md)
- [Enable Defender for SQL Server on Machines](defender-for-sql-usage.md)
- [Enable Defender for open-source relational databases on Azure](enable-defender-for-databases-azure.md)
- [Enable Defender for Azure Cosmos DB](defender-for-databases-enable-cosmos-protections.md)

## Related content

- [Overview of Microsoft Defender for Azure SQL](defender-for-sql-introduction.md)
- [Microsoft Defender for SQL servers on machines](defender-for-sql-usage.md)
- [Overview of Microsoft Defender for open-source relational databases](defender-for-databases-introduction.md)
- [Overview of Microsoft Defender for Azure Cosmos DB](concept-defender-for-cosmos.md)
