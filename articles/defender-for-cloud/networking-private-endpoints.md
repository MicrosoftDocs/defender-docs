---
title: Private endpoints with Microsoft Defender
description: Learn about using private endpoints with Microsoft Defender for Cloud to ensure secure and private connectivity in your virtual network.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 12/02/2025
---

# Configure private endpoints with Microsoft Security Private Link (Preview)

Use a [private endpoint](/azure/private-link/private-endpoint-overview) with Microsoft Security Private Link to allow workloads in your private network to access Microsoft Defender services over [Azure Private Link](/azure/private-link/private-link-overview).

> [!NOTE]
> Microsoft Security Private Link is not supported in sovereign cloud regions, such as Azure Government and Azure China (21Vianet).

## Prerequisites

Before you begin, make sure that:

- Microsoft Defender for Cloud is enabled on your Azure subscription.
- A virtual network and subnet are available for the private endpoint.
- You have reviewed the required [roles and permissions](concept-private-endpoints.md#roles-and-permissions).

## Create private endpoint (Azure portal)

> [!IMPORTANT]
> - Security Private Link supports communication from Defender agents, add-ons, and extensions to Defender backend services.
> - Ensure your Defender components are using the latest versions that support private endpoint connectivity.
> - If your workloads interact with other Azure services (such as Azure Storage for diagnostics), configure private endpoints for those services as well.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to the **Private Link Center**.

1. Select **Create private endpoint**.

   :::image type="content" source="media/networking-private-endpoints/private-link-center.png" alt-text="Screenshot of the Private Link Center with Create private endpoint highlighted.":::

1. In the **Basics** tab, provide the following information:

   | Setting | Value |
   |---------|-------|
   | **Project details** | |
   | Subscription | Select your subscription. |
   | Resource group | Enter the name of an existing group or create a new one. |
   | **Instance details** | |
   | Name | Enter a unique name for the private endpoint. |
   | Region | Select a region. |

1. Select **Next: Resource**.

   > [!NOTE]
   > Microsoft Security Private Link currently supports the **containers** sub-resource, which is used by the Defender for Containers plan.

1. In the **Resource** tab, enter or select the following information:

   | Setting | Value |
   |---------|-------|
   | Connection method | Select **Connect to an Azure resource in my directory**. |
   | Subscription | Select your subscription. |
   | Resource type | Select **Microsoft.Security/privateLinks**. |
   | Resource | Select the Security Private Link resource for Defender services. |
   | Target sub-resource | Select **containers**. |


1. Select **Next: Virtual Network**.

1. In the **Virtual Network** tab, enter or select the information:

   | Setting | Value |
   |---------|-------|
   | **Networking** | |
   | Virtual network | Select the virtual network for the private endpoint. |
   | Subnet | Select the subnet for the private endpoint. |
   | **Private IP configuration** | |
   | Allocate private IP address dynamically | Select this option to automatically assign an IP address. |
   | **Application security group** | |
   | Application security group | Optionally select an application security group. |

1. Select **Next: DNS**.

1. In the **DNS** tab, configure DNS settings:

   | Setting | Value |
   |---------|-------|
   | **Private DNS integration** | |
   | Integrate with private DNS zone | Select **Yes**. |
   | Private DNS Zone | The field autopopulates with `privatelink.azure.com` or the appropriate zone for your resource. |

1. Select **Next: Tags** and optionally add tags.

1. Select **Review + create**.

1. After validation passes, select **Create**.

1. Wait for the deployment to complete.

## Create private endpoint (Azure CLI)

The following examples use Azure CLI to create Security Private Link for Microsoft Defender.

Set the following environment variables appropriate for your environment:

```azurecli
SUBSCRIPTION_ID=<your-subscription-id>
RESOURCE_GROUP=<resource-group-name>
LOCATION=<azure-region>
VNET_NAME=<virtual-network-name>
SUBNET_NAME=<subnet-name>
PRIVATE_ENDPOINT_NAME=<private-endpoint-name>
```

### Disable network policies in subnet

[Disable network policies](../../private-link/disable-private-endpoint-network-policy.md) such as network security groups in the subnet for the private endpoint. Update your subnet configuration with [az network vnet subnet update](/cli/azure/network/vnet/subnet#az-network-vnet-subnet-update):

```azurecli
az network vnet subnet update \
  --name $SUBNET_NAME \
  --vnet-name $VNET_NAME \
  --resource-group $RESOURCE_GROUP \
  --disable-private-endpoint-network-policies true
```

### Configure the private DNS zone

Create a [private Azure DNS zone](../../dns/private-dns-privatednszone.md) for the private Microsoft Defender service endpoints.

```azurecli
az network private-dns zone create \
  --resource-group $RESOURCE_GROUP \
  --name "cloud.defender.microsoft.com"
```

### Create an association link

Run [az network private-dns link vnet create](/cli/azure/network/private-dns/link/vnet#az-network-private-dns-link-vnet-create) to associate your private zone with the virtual network.

```azurecli
az network private-dns link vnet create \
  --resource-group $RESOURCE_GROUP \
  --zone-name "cloud.defender.microsoft.com" \
  --name MyDNSLink \
  --virtual-network $VNET_NAME \
  --registration-enabled false
```

### Create a private endpoint

Create the Security Private Link endpoint for Microsoft Defender services using [az network private-endpoint create](/cli/azure/network/private-endpoint#az-network-private-endpoint-create).

The `group-id` parameter specifies the sub-resource you are connecting to, such as `containers` for Defender for Containers.

```azurecli
az network private-endpoint create \
  --name $PRIVATE_ENDPOINT_NAME \
  --resource-group $RESOURCE_GROUP \
  --vnet-name $VNET_NAME \
  --subnet $SUBNET_NAME \
  --private-connection-resource-id "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Security/privateLinks/<private-link-name>" \
  --group-id containers \
  --connection-name MyConnection \
  --location $LOCATION
```

### Get endpoint IP configuration

After creating the private endpoint, retrieve the private IP address configuration.

```azurecli
NETWORK_INTERFACE_ID=$(az network private-endpoint show \
  --name $PRIVATE_ENDPOINT_NAME \
  --resource-group $RESOURCE_GROUP \
  --query 'networkInterfaces[0].id' \
  --output tsv)
PRIVATE_IP=$(az network nic show \
  --ids $NETWORK_INTERFACE_ID \
  --query "ipConfigurations[0].privateIPAddress" \
  --output tsv)
echo "Private IP: $PRIVATE_IP"
```

### Create DNS records in the private zone

Create DNS records in the private zone for the endpoint.

```azurecli
az network private-dns record-set a create \
  --name api \
  --zone-name cloud.defender.microsoft.com \
  --resource-group $RESOURCE_GROUP
az network private-dns record-set a add-record \
  --record-set-name api \
  --zone-name cloud.defender.microsoft.com \
  --resource-group $RESOURCE_GROUP \
  --ipv4-address $PRIVATE_IP
```

### List private endpoint connections

After you create the private endpoint, it appears in the list of private endpoint connections.

To list the private endpoint connections:

```azurecli
az network private-endpoint-connection list \
  --resource-group $RESOURCE_GROUP \
  --name <resource-name> \
  --type Microsoft.Security/privateLinks
```

### Approve pending private endpoint connections

If a private endpoint connection is in a pending state, an owner of the Security Private Link resource must manually approve it before it can be used.

If you have sufficient permissions, approve a private endpoint connection:

```azurecli
az network private-endpoint-connection approve \
  --resource-group $RESOURCE_GROUP \
  --name <connection-name> \
  --resource-name <resource-name> \
  --type Microsoft.Security/privateLinks \
  --description "Approved by security team"
```

## (Optional) Disable public network access

To limit access to Microsoft Defender services to private endpoints only, disable public network access.

> [!IMPORTANT]
> Disabling public network access applies at the subscription level and affects all Defender services in the subscription.

### Disable public access - Azure portal

1. In the Azure portal, navigate to your subscription.

1. Under **Settings**, select **Defender for Cloud**.

1. Select **Settings**, then **Environment settings**.

1. Select your subscription.

1. Navigate to **Settings & monitoring**.

1. Under **Network**, select **Disabled** for public network access.

1. Select **Save**.

### Disable public access - Azure CLI

To disable public access using the Azure CLI, you need to configure network settings at the subscription level. This can be managed through Azure Policy or custom configurations based on your organizational requirements.

## Validate private endpoint connection

After setting up Security Private Link, validate that your workloads can communicate with Defender services through the private endpoints.

### Test in virtual network

From a workload (VM, AKS node, or container) within the virtual network, verify that Defender service endpoints resolve to private IP addresses:

```bash
nslookup api.cloud.defender.microsoft.com
```

The output should show that the Defender service FQDN resolves to the private IP address assigned to your private endpoint, not a public IP.

Example output:

```
Server:    168.63.129.16
Address:   168.63.129.16#53
Non-authoritative answer:
api.cloud.defender.microsoft.com    canonical name = api.privatelink.cloud.defender.microsoft.com.
Name:   api.privatelink.cloud.defender.microsoft.com
Address: 10.1.1.5
```

### Verify Defender connectivity

Verify that Defender agents and add-ons running on your workloads can successfully communicate with Defender services:

1. **For AKS clusters**: Check that the Defender for Containers add-on is successfully sending data:

   ```bash
   kubectl logs -n kube-system -l app=microsoft-defender
   ```

   Look for successful connection messages and absence of public endpoint connection attempts.

2. **For VMs**: Check that the Microsoft Defender for Endpoint agent is connected:

   ```bash
   # On Linux
   mdatp connectivity test

   # On Windows (PowerShell)
   Get-MpComputerStatus
   ```

3. **Verify in Azure portal**: Navigate to Microsoft Defender for Cloud and confirm that your workloads are reporting security data and recommendations.

## Related content

- Learn more about [Private endpoints with Microsoft Defender](concept-private-endpoints.md).
- For information about network security in Defender for Cloud, see [Planning network requirements for Microsoft Defender for Cloud](networking-requirements.md).
- To learn about other networking configurations, see [Configure network settings for Microsoft Defender for Cloud](networking-requirements.md).