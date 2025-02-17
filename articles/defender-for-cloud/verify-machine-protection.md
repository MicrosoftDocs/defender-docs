---
title: Verify SQL machine protection
description: Verify that SQL VMs are protected with the Defender for SQL Servers on Machines plan as expected.
ms.author: dacurwin
author: dcurwin
ms.topic: how-to
ms.date: 02/17/2025
#customer intent: As a customer, I want to verify that my SQL VMs are protected with the Defender for SQL Servers on Machines plan as expected.
---

# Verify SQL machine protection

After enabling protection for SQL VMs with the Defender for SQL Servers on Machines plan, verify that your SQL servers are protected as expected.

## Verify protection on multiple machines

Copy and run this script to verify protection on multiple machines:

## Verify protection on a single SQL server instance

1. In the Azure portal search for and select **SQL databases**.

1. Locate and select a database on the machine.

1. Under the **Security** tab, select **Defender for Cloud**.

1. Check the **Protection status**. If the status is **Protected**, the deployment was successful.

    :::image type="content" source="media/defender-for-sql-usage/protection-status-protected.png" alt-text="Screenshot showing protection status as protected." lightbox="media/defender-for-sql-usage/protection-status-protected.png":::

## Troubleshoot unprotected machines

If databases are not protected, follow the instructions in the [troubleshooting guide](troubleshoot-sql-machines-guide.md) to remediate.
