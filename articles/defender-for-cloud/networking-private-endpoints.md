---
title: Configure private endpoints with Microsoft Security Private Link
description: Configure private endpoints with Microsoft Security Private Link to securely connect your virtual network to Microsoft Defender services.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 12/02/2025
#customer intent: As a security administrator, I want to configure a private endpoint for Microsoft Defender so that Defender traffic stays within my private network.

---

# Configure private endpoints with Microsoft Security Private Link (Preview)

Use a [private endpoint](/azure/private-link/private-endpoint-overview) with Microsoft Security Private Link to allow workloads in your private network to access Microsoft Defender services over [Azure Private Link](/azure/private-link/private-link-overview).

> [!NOTE]
> Microsoft Security Private Link is not supported in sovereign cloud regions, such as Azure Government and Azure China (21Vianet).

## Prerequisites

Before you begin, make sure that:

- Microsoft Defender for Cloud is enabled on your Azure subscription. If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- A [virtual network and subnet](../../virtual-network/quick-create-portal.md) where your workloads are deployed. This is where the private endpoint will be created.

- You have reviewed the required [roles and permissions](concept-private-endpoints.md#roles-and-permissions).

## Create a private endpoint using a Security Private Link resource (Azure portal)

A Security Private Link resource must belong to a resource group.

When you create a Security Private Link resource, you can create a private endpoint as part of the same workflow.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Select **Create a resource**.

1. Search for **Security Private Link**, then select **Security Private Link** and select **Create**.

1. On the **Basics** tab:

    - Select a subscription.

    - Choose an existing resource group or create a new one.

    - Enter a name for the Security Private Link resource.

1. Select **Next: Networking**.

    > [!NOTE]
    > Microsoft Security Private Link currently supports the **containers** sub-resource, which is used by the Defender for Containers plan.

1. On the **Networking** tab:

    - Select **Create a private endpoint**.

    - Enter a name and location for the private endpoint.

    - Select **containers** as the target sub-resource.

    - Select the virtual network and subnet.

    - Enable **Private DNS integration** to create a private DNS zone automatically.

1. Select **Next: Tags** and add any required tags.

1. Select **Review + create**, then select **Create**.

1. Wait for the deployment to complete.


## Create a private endpoint for an existing Security Private Link resource (Azure portal)

If you already have a Security Private Link resource, you can create a private endpoint separately and connect it to that resource.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Network foundation** ▸ **Private Link** ▸ **Private endpoints**.

1. Select **Create**.

1. On the **Basics** tab:

    - Select a subscription.

    - Choose an existing resource group or create a new one.

    - Enter a name and region for the private endpoint.

1. Select **Next: Resource**.

    > [!NOTE]
    > Microsoft Security Private Link currently supports the **containers** sub-resource, which is used by the Defender for Containers plan.

1. On the **Resource** tab:

    - Select **Connect to an Azure resource in my directory**.

    - Choose **Microsoft.Security/privateLinks** as the resource type.

    - Select the Security Private Link resource for Defender services.

    - Select **containers** as the target sub-resource.

1. Select **Next: Virtual Network**.

    - Select the virtual network.

    - Select the subnet.

    - Leave the private IP address allocation set to **Dynamic**.

1. Select **Next: DNS**.

    - Enable **Private DNS integration**.

    - Verify that the private DNS zone is populated automatically.

1. Select **Next: Tags** and add any required tags.

1. Select **Review + create**, then select **Create**.

1. Wait for the deployment to complete.


## Approve the private endpoint connection

When the private endpoint is created, a connection request is sent to the Security Private Link resource.

- If the requester is an **Owner**, the connection is approved automatically.
- Otherwise, an **Owner** must approve the request from **Private endpoint connections** in the Azure portal.

## Validate the private endpoint connection

### Verify DNS resolution

From a workload in the virtual network, run:

```bash
nslookup api.cloud.defender.microsoft.com
```

The FQDN should resolve to a private IP address under `privatelink.cloud.defender.microsoft.com`.

### Verify Defender connectivity

- **For AKS**: Confirm that the Defender for Containers add-on is running.
- **In the Azure portal**: Verify that workloads are reporting data in Microsoft Defender for Cloud.

## Related content

- Learn more about [Private endpoints with Microsoft Defender](concept-private-endpoints.md).

- For information about network security in Defender for Cloud, see [Planning network requirements for Microsoft Defender for Cloud](networking-requirements.md).

- To learn about other networking configurations, see [Configure network settings for Microsoft Defender for Cloud](networking-requirements.md).