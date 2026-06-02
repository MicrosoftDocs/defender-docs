---
title: Enable Defender for open-source relational databases on Azure
description: Detect anomalous activity and unusual attempts to access or exploit Azure Database for PostgreSQL and MySQL with Microsoft Defender for open-source relational databases.
ms.date: 06/02/2026
ms.topic: how-to
ms.author: elkrieger
author: ElazarK
#customer intent: As a reader, I want to learn how to configure Microsoft Defender for open-source relational databases to enhance the security of my Azure databases.
---

# Enable Defender for open-source relational databases on Azure

Use Microsoft Defender for open-source relational databases to detect anomalous activity on Azure Database for PostgreSQL and Azure Database for MySQL. This article explains the prerequisites and the steps to enable the plan in Azure.

Microsoft Defender for Cloud detects anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases for the following services:

- [Azure Database for PostgreSQL](/azure/postgresql/)
- [Azure Database for MySQL](/azure/mysql/)

To get alerts from this Microsoft Defender plan, enable Defender for open-source relational databases in Azure by following these steps.

Learn more about this Microsoft Defender plan in [Overview of Microsoft Defender for open-source relational databases](defender-for-databases-introduction.md).

## Prerequisites

Before you enable Defender for open-source relational databases, make sure you meet the following requirements:

- You need a Microsoft Azure subscription. If you don't have one, sign up for a [free Azure subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- You must enable Microsoft Defender for Cloud on your Azure subscription. For instructions, see [Enable Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription).

- (Optional) Connect your non-Azure machines. For steps, see [Onboard non-Azure machines](quickstart-onboard-machines.md).

## Enable Defender for open-source relational databases on your Azure subscription

To enable Defender for open-source relational databases on your Azure subscription:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Azure Database for MySQL servers** or **Azure Database for PostgreSQL servers**.

1. Select the relevant database server.

1. Expand the **Security** menu.
 
1. Select **Microsoft Defender for Cloud**.

1. If Defender for open-source relational databases isn't enabled, select **Enable Microsoft Defender for [Database type]** (for example, "Microsoft Defender for MySQL").

    :::image type="content" source="media/defender-for-databases-usage/enable-defender-for-mysql.png" alt-text="Screenshot of the Azure Database for MySQL server page with the Enable Microsoft Defender for MySQL button highlighted." lightbox="media/defender-for-databases-usage/enable-defender-for-mysql.png":::

    > [!TIP]
    > This page in the portal is the same for PostgreSQL and MySQL.

1. Select **Save**.

## Related content

- [Optional configurations after in-place migration from Azure Database for MySQL Single Server to Flexible Server](/azure/mysql/migrate/whats-happening-to-mysql-single-server#configure-microsoft-defender-for-cloud-properties-in-flexible-server).

## Next step

> [!div class="nextstepaction"]
> [Respond to Defender OSS alerts](defender-for-databases-usage.md)

