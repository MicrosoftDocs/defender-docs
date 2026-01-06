---
title: Configure private endpoints with Microsoft Security Private Link
description: Configure private endpoints with Microsoft Security Private Link to securely connect your virtual network to Microsoft Defender for Cloud.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 01/05/2025
#customer intent: As a security administrator, I want to configure a private endpoint for Microsoft Defender for Cloud so that Defender traffic stays within my private network.

---

# Configure private endpoints with Microsoft Security Private Link (Preview)

Use a [private endpoint](/azure/private-link/private-endpoint-overview) with Microsoft Security Private Link to connect workloads in your private network to Microsoft Defender for Cloud over [Azure Private Link](/azure/private-link/private-link-overview).

> [!NOTE]
> Microsoft Security Private Link isn't supported in sovereign cloud regions, such as Azure Government and Azure operated by 21Vianet.

## Prerequisites

Before you begin, make sure that:

- Microsoft Defender for Cloud is enabled on your Azure subscription. If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- A [virtual network and subnet](/azure/virtual-network/quick-create-portal) where your workloads are deployed. This is where the private endpoint will be created.

- You reviewed the required [roles and permissions](concept-private-links.md#roles-and-permissions).

## Create a private endpoint using a Security Private Link resource (Azure portal)

A Security Private Link resource must belong to a resource group.

When you create a Security Private Link resource, you can create a private endpoint as part of the same workflow.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Select **Create a resource**.

1. Search for **Security Private Link**, then under **Security Private Link** select **Create**.

1. Select a subscription and an existing resource group, or create a new one.

1. If needed, update the resource group location.

1. Enter a name, then select **Next: Networking**.

    > [!NOTE]
    > Microsoft Security Private Link currently supports the **containers** sub-resource, which is used by the Defender for Containers plan.

1. Select **Create a private endpoint** and enter a name and a location.

      :::image type="content" source="media/configure-private-endpoints/create-private-endpoint-blade-networking-tab.png" alt-text="Screenshot of the Create Security Private Link wizard on the Networking tab, showing the Create a private endpoint pane with sub-resource and Private DNS integration." lightbox="media/configure-private-endpoints/create-private-endpoint-blade-networking-tab.png":::

1. Select **containers** as the target sub-resource.

1. Select the virtual network and subnet.

1. Enable **Private DNS integration** to create a private DNS zone automatically.

1. Select **Next: Tags** and add any required tags.

1. Select **Review + create**, then select **Create**.

1. Wait for the deployment to complete.

After deployment, verify that workloads continue to report data in Microsoft Defender for Cloud.

## Create a private endpoint for an existing Security Private Link resource (Azure portal)

If you already have a Security Private Link resource, you can create a private endpoint separately and connect it to that resource.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Network foundation** ▸ **Private Link** ▸ **Private endpoints**.

1. Select **Create**.

   :::image type="content" source="media/configure-private-endpoints/network-foundation-create-private-endpoint.png" alt-text="Screenshot of the Network foundation Private endpoints page, showing the Create button." lightbox="media/configure-private-endpoints/network-foundation-create-private-endpoint.png":::

1. Select a subscription and an existing resource group, or create a new one.

1. Enter a name and network interface name, and select a region.

1. Select **Next: Resource**.

    > [!NOTE]
    > Microsoft Security Private Link currently supports the **containers** sub-resource, which is used by the Defender for Containers plan.

1. Select **Connect to an Azure resource in my directory**.

1. Select a subscription and **Microsoft.Security/privateLinks** as the resource type.

1. Select the Security Private Link resource for Defender for Cloud.

1. Select **containers** as the target sub-resource, then select **Next: Virtual Network**.

1. Select the virtual network and the subnet.

1. Leave the private IP address allocation set to **Dynamic**, then select **Next: DNS**.

1. Enable **Integrate with private DNS zone** and verify that the private DNS zone is populated automatically.

1. Select **Next: Tags** and add any required tags.

1. Select **Review + create**, then select **Create**.

1. Wait for the deployment to complete.

After deployment, verify that workloads continue to report data in Microsoft Defender for Cloud.

## Approve the private endpoint connection

When the private endpoint is created, a connection request is sent to the Security Private Link resource.

- If the requester is an **Owner**, the connection is approved automatically.

- Otherwise, an **Owner** must approve the request from **Private endpoint connections** in the Azure portal.

## Validate the private endpoint connection

From a workload connected to the virtual network, run:

```bash
nslookup api.cloud.defender.microsoft.com
```

The FQDN should resolve to a private IP address under `privatelink.cloud.defender.microsoft.com`.

## Related content

- Learn more about [Private endpoints with Microsoft Defender](concept-private-links.md).