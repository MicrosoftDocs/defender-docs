---
title: Update Defender for SQL Servers on machine's configuration
description: Learn how to update your Microsoft SQL Servers on machine's configuration on Azure VMs, on-premises, and in hybrid and multicloud environments with Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 04/07/2025
#customer intent: As a security administrator, I want to enable Defender for SQL servers on machines so that I can protect my SQL servers in various environments.
---

# Update Defender for SQL Servers on machine's configuration

> [!IMPORTANT]
> This page is applicable to existing customers that have enabled the plan on a subscription before April 21st, 2025.

Defender for Cloud's SQL Server on machine's plan includes agent architecture that simplifies the onboarding experience and improves overall SQL protection coverage. If you are an existing customer that has already enabled the Defender for SQL Servers on machine plan with SQL VMs and Azure Arc-enabled SQL servers, the change will occur automatically. 

For all other VMs, you must update your configuration manually in the Defender for Cloud portal.  

## Update the plan on a single subscription

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defender for Databases plan and select **Settings**.

1. A pop-up window appeara, select **Update**.

## Update the plan on multiple subscriptions

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. On the Overview page select **update the configuration in Defender for SQL server on machines plan for multiple subscriptions**.

1. Select all the relevant subscriptions.

1. Select **Update**.

## Next step

> [!div class="nextstepaction"]
> [Verify that all machines are protected](verify-machine-protection.md)
