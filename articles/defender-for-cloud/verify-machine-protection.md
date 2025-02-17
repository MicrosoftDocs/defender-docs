---
title: Verify SQL machine protection
description: 
ms.author: dacurwin
author: dcurwin
ms.date: 02/17/2025
#customer intent: 
---

## Verify SQL machine protection

After you enable protection for SQL VMs with the Defender for SQL Servers on Machines plan, you should verify that your SQL servers are protected as expected.



## Verify protection on multiple machines

Copy and run this script to verify protection on multiple machines:


## Verify protection on a single machine

1. In the Azure portal search for and select **SQL databases**.
1. Locate and select the a database on the machine.
1. Under the **Security** tab, select **Defender for Cloud**.
1. Check the **Protection status**. If the status is **Protected**, the deployment was successful.

:::image type="content" source="media/defender-for-sql-usage/protection-status-protected.png" alt-text="Screenshot showing protection status as protected." lightbox="media/defender-for-sql-usage/protection-status-protected.png":::

## Troubleshoot unprotected machines

[Troubleshooting guide](troubleshoot-sql-machines-guide.md)