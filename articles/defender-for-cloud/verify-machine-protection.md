---
title: Verify SQL machine protection
description: Verify that SQL VMs are protected with the Defender for SQL Servers on Machines plan as expected. Ensure that all security measures are properly implemented.
ms.author: elkrieger
author: Elazark
ms.topic: how-to
ms.date: 04/08/2025
#customer intent: As a customer, I want to verify that my SQL VMs are protected with the Defender for SQL Servers on Machines plan as expected.
---

# Verify SQL machine protection

After enabling protection for SQL Servers installed on Virtual Machines (VM), on-premises machines, and multicloud resources with the Defender for SQL Servers on Machines plan, verify that your SQL servers are protected as expected.

## Verify protection on an entire Azure subscription

Defender for Cloud presents [The status of Microsoft SQL Servers on Machines should be protected]() recommendation. This recommendation allows you to review the protection status of Defender for SQL Servers on Machines. The recommendation covers all SQL VMs and Azure Arc SQL Server instances within a specified Azure subscription.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select [The status of Microsoft SQL Servers on Machines should be protected]().

1. Select **View recommendation for all resources**.

    :::image type="content" source="media/verify-machines-protection/view-recommendation.png" alt-text="Screenshot that shows were to locate the View recommendation for all resources button is located. " lightbox="media/verify-machines-protection/view-recommendation.png":::

1. Review the healthy and unhealthy resources.

If databases aren't protected, follow the instructions in the [troubleshooting guide](troubleshoot-sql-machines-guide.md) to remediate.

## Verify protection on a single SQL server VM

You can also verify the protection status of a single SQL server VM or Azure Arc SQL Server instance.

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Depending on the resources in your environment, search for and select either:
    - **SQL virtual machines**
    <br> 
    or
    - **SQL Server - Azure Arc**.

1. Locate and select the relevant resource.

1. Under the **Security** tab, select **Defender for Cloud**.

1. Check the **Protection status**. If the status is **Protected**, the deployment was successful.

    :::image type="content" source="media/verify-machines-protection/protection-status-protected.png" alt-text="Screenshot showing protection status as protected." lightbox="media/verify-machines-protection/protection-status-protected.png":::

If databases aren't protected, follow the instructions in the [troubleshooting guide](troubleshoot-sql-machines-guide.md) to remediate.

## Next step

> [!div class="nextstepaction"]
>- [Troubleshoot SQL machines protection](troubleshoot-sql-machines-guide.md)
