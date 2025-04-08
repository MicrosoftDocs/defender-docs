---
title: Update Defender for SQL Servers on machine configuration
description: Learn how to update your Microsoft SQL Servers on machine configuration on Azure VMs, on-premises, and in hybrid and multicloud environments with Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 04/07/2025
#customer intent: As a security administrator, I want to enable Defender for SQL servers on machines so that I can protect my SQL servers in various environments.
---

# Update Defender for SQL Servers on machine's configuration

> [!IMPORTANT]
> This page applies to existing customers who enabled the plan on a subscription before April 21, 2025.

The SQL Server on machine plan in Defender for Cloud includes agent architecture that simplifies the onboarding experience and improves overall SQL protection coverage. If you already use the Defender for SQL Servers on machine plan for SQL VMs and Azure Arc-enabled SQL servers, the change happens automatically.

Update your configuration manually in the Defender for Cloud portal for all other VMs.

## Update the plan on a single subscription

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defender for Databases plan and select **Settings**.

1. Select **Update** in the pop-up window.

## Update the plan on multiple subscriptions

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. On the Overview page, select **update the configuration in Defender for SQL Server on machine plan for multiple subscriptions**.

1. Select all the relevant subscriptions.

1. Select **Update**.

## Next step

> [!div class="nextstepaction"]
> [Verify that all machines are protected](verify-machine-protection.md)
