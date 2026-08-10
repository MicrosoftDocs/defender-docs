---
title: Manage multiple tenants in Microsoft Sentinel as a Managed Security Service Provider
description: How to onboard and manage multiple tenants in Microsoft Sentinel as a Managed Security Service Provider (MSSP) using Azure Lighthouse.
ms.author: guywild
author: guywi-ms
ms.reviewer: yobasha
ms.topic: how-to
ms.date: 07/02/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016

#Customer intent: As an MSSP, I want to manage multiple Microsoft Sentinel tenants from my own Azure tenant so that I can efficiently provide SOC services to my customers.

---

# Manage multiple tenants in Microsoft Sentinel as an MSSP

If you're a managed security service provider (MSSP) and you're using [Azure Lighthouse](/azure/lighthouse/overview) to offer security operations center (SOC) services to your customers, you can manage your customers' Microsoft Sentinel resources directly from your own Azure tenant, without having to connect to the customer's tenant. 

> [!IMPORTANT]
> After **March 31, 2027**, Microsoft Sentinel will no longer be supported in the Azure portal and will be available only in the Microsoft Defender portal. All customers using Microsoft Sentinel in the Azure portal will be [redirected to the Defender portal](overview.md#microsoft-sentinel-in-the-azure-portal-retirement-timeline).
>
> If you're still using Microsoft Sentinel in the Azure portal, we recommend that you start planning your move to the Defender portal to ensure a smooth experience and to take full advantage of unified security operations and multitenant management capabilities offered by the Defender portal. For guidance and best practices, see the [Microsoft Defender portal implementation guide for MSSPs](/unified-secops/playbook-managed-security). 

## Prerequisites

Before you manage multiple tenants in Microsoft Sentinel, complete the following prerequisite:

- [Onboard Azure Lighthouse](/azure/lighthouse/how-to/onboard-customer)

## Verify registration of Microsoft Sentinel resource providers

Your MSSP tenant must have the Microsoft Sentinel resource providers registered on at least one subscription. Each of your customers' tenants must also have those resource providers registered.

If you already registered Microsoft Sentinel in your tenant, and your customers did the same in theirs, you can skip ahead to [Access Microsoft Sentinel in managed tenants](#access-microsoft-sentinel-in-managed-tenants).

**To verify registration**:

1. Select **Subscriptions** from the Azure portal, and then select a relevant subscription from the menu.

1. From the navigation menu on the subscription screen, under **Settings**, select **Resource providers**.

1. From the ***subscription name* | Resource providers** screen, search for *Microsoft.OperationalInsights* and *Microsoft.SecurityInsights*. Select each one and check the **Status** column. If the status is *NotRegistered*, select **Register**.

    :::image type="content" source="media/multiple-tenants-service-providers/check-resource-provider.png" alt-text="Screenshot of checking resource providers.":::

## Access Microsoft Sentinel in managed tenants

To access your customers' Microsoft Sentinel workspaces from your own tenant, perform the following steps:

1. Under **Directory + subscription**, select the delegated directories (each directory maps to a tenant). Also select the subscriptions that contain your customer's Microsoft Sentinel workspaces.

    :::image type="content" source="media/multiple-tenants-service-providers/directory-subscription.png" alt-text="Choose tenants and subscriptions":::

1. Open Microsoft Sentinel, where you'll see all the workspaces in the selected subscriptions and can work with them seamlessly, just like any workspace in your own tenant.

> [!NOTE]
> You can't deploy connectors in Microsoft Sentinel from a managed workspace that uses only Azure Lighthouse. You must also configure GDAP. For more details, see [Microsoft Defender portal implementation guide for MSSPs](/unified-secops/playbook-managed-security).

## Related content

For more information about Microsoft Sentinel, see the following articles:

- Learn how to [get visibility into your data, and potential threats](get-visibility.md).
- Get started [detecting threats with Microsoft Sentinel](detect-threats-built-in.md).
