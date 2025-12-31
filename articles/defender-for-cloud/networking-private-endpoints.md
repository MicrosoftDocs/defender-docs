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

## Create a private endpoint (Azure portal)

> [!IMPORTANT]
> Microsoft Security Private Link currently supports the **containers** sub-resource, which is used by the Defender for Containers plan.

## Approve the private endpoint connection

When the private endpoint is created, a connection request is sent to the Security Private Link resource.

- If the requester is an **Owner**, the connection is approved automatically.
- Otherwise, an **Owner** must approve the request from **Private endpoint connections** in the Azure portal.

## Validate the private endpoint connection

### Verify DNS resolution

From a workload in the virtual network, run:

```bash
nslookup api.cloud.defender.microsoft.com


# [PowerShell](#tab/azure-powershell)

To create an Azure storage account with PowerShell, make sure you have installed the latest [Azure Az PowerShell module](https://www.powershellgallery.com/packages/Az). See [Install the Azure PowerShell module](/powershell/azure/install-azure-powershell).

# [Azure CLI](#tab/azure-cli)

You can sign in to Azure and run Azure CLI commands in one of two ways:

- You can run CLI commands from within the Azure portal, in Azure Cloud Shell.
- You can install the CLI and run CLI commands locally.

### Use Azure Cloud Shell

Azure Cloud Shell is a free Bash shell that you can run directly within the Azure portal. The Azure CLI is preinstalled and configured to use with your account. Select the **Cloud Shell** button on the menu in the upper-right section of the Azure portal:

[![Cloud Shell](./media/storage-quickstart-create-account/cloud-shell-menu.png)](https://portal.azure.com)

The button launches an interactive shell that you can use to run the steps outlined in this how-to article:

[![Screenshot showing the Cloud Shell window in the portal](./media/storage-quickstart-create-account/cloud-shell.png)](https://portal.azure.com)

### Install the Azure CLI locally

You can also install and use the Azure CLI locally. If you plan to use Azure CLI locally, make sure you have installed the latest version of the Azure CLI. See [Install the Azure CLI](/cli/azure/install-azure-cli).

# [Bicep](#tab/bicep)

None.

# [Template](#tab/template)

None.

# [Azure Developer CLI](#tab/azure-developer-cli)

[The Azure Developer CLI](/azure/developer/azure-developer-cli/overview) (`azd`) is an open-source, command-line tool that streamlines provisioning and deploying resources to Azure using a template system. `azd` is available for several development [environments](/azure/developer/azure-developer-cli/supported-languages-environments#supported-development-environments), including the following:

- Locally via CLI by [installing azd](/azure/developer/azure-developer-cli/overview).
- [GitHub Codespaces](https://github.com/features/codespaces) environments.
- The Azure portal using [Cloud Shell](/azure/cloud-shell/overview)
  > [!NOTE]
  > The `azd` template includes a `.devcontainer` that already has `azd` installed, therefore you can skip the installation step if you plan to use a `devcontainer` either locally or in an environment like Codespaces.

# [Terraform](#tab/terraform)

- You need an Azure account with an active subscription. You can [create an account for free](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- [Install and configure Terraform](/azure/developer/terraform/quickstart-configure)

---

Next, sign in to Azure.

# [Portal](#tab/azure-portal)

Sign in to the [Azure portal](https://portal.azure.com).

# [PowerShell](#tab/azure-powershell)

Sign in to your Azure subscription with the `Connect-AzAccount` command and follow the on-screen directions to authenticate.

```powershell
Connect-AzAccount
```

# [Azure CLI](#tab/azure-cli)

To launch Azure Cloud Shell, sign in to the [Azure portal](https://portal.azure.com).

To log into your local installation of the CLI, run the [az sign-in](/cli/azure/reference-index#az-login) command:

```azurecli-interactive
az login
```

# [Bicep](#tab/bicep)

N/A

# [Template](#tab/template)

N/A

# [Azure Developer CLI](#tab/azure-developer-cli)

If you plan to use `azd` via Cloud Shell:

- Sign-in to the [Azure portal](https://portal.azure.com)
- Launch Cloud Shell by clicking on the corresponding icon. `azd` is automatically available in Cloud Shell and will authenticate via the account you used to sign-in to the Azure portal.

To sign-in to a local installation of `azd` or Codespaces environment, run the [azd auth sign-in](/azure/developer/azure-developer-cli/reference#azd-auth-login) command:

```azurecli-interactive
    azd auth login
```

`azd` will launch a browser window that you can use to sign-in to Azure.

# [Terraform](#tab/terraform)

[Authenticate Terraform to Azure](/azure/developer/terraform/authenticate-to-azure)

---

## Steps to configure private endpoint with security private link

Follow these steps to create and configure a private endpoint for your Microsoft Security Private Link.


### Create private endpoint when creating Security private link instance

A Security private link is an Azure Resource Manager resource. Resource Manager is the deployment and management service for Azure. For more information, see [Azure Resource Manager overview](../../azure-resource-manager/management/overview.md).

Every Resource Manager resource, including an Security private lionk, must belong to an Azure resource group. A resource group is a logical container for grouping your Azure services. When you create a security private link, you have the option to either create a new resource group, or use an existing resource group. This how-to shows how to create a new resource group.

#### [Portal](#tab/azure-portal)

To create an Security private link with the Azure portal, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. From the left portal menu, select **Create a resource**. If the portal menu isn't visible, select the menu button to toggle it on.

1. Search for **Private link** and then select the **Security Private Link** offer and click **Create**.

1. In the **Basics** tab, provide the following information:

  | Setting | Value |
  |---|---|
  | **Project details** | |
  | Subscription | Select your subscription. |
  | Resource group | Enter the name of an existing group or create a new one. |
  | Resource group location | Enter the location of the resource group. |
  | **Instance details** | |
  | Name | Enter a unique name for the security private link. |

1. Select **Next: Networking**.

   > [!NOTE]
   > Microsoft Security Private Link currently supports the **containers** sub-resource, which is used by the Defender for Containers offerings.

1. In the **Networking** tab, click **Create a private endpoint** and provide the following information:

  | Setting | Value |
  |---|---|
  | Subscription | Select your subscription. |
  | Resource group | Enter the name of an existing group or create a new one. |
  | Location | Select the location for the private endpoint. |
  | Name | Enter a unique name for the private endpoint. |
  | Target sub-resource | Select **containers**. |
  | Configure virtual network | Select your virtual network. |
  | Subnet | Select your subnet |
  | Enable Private DNS Integration | Enable to create a new Private DNS Zone |

1. Select **Next: Tags** and optionally add tags.

1. Select **Review + create**.

1. After validation passes, select **Create**.

1. Wait for the deployment to complete.


#### [PowerShell](#tab/powershell)

IN PROGRESS

#### [Azure CLI](#tab/azure-cli)

IN PROGRESS

#### [Bicep](#tab/bicep)

https://learn.microsoft.com/en-us/azure/templates/microsoft.security/privatelinks?pivots=deployment-language-bicep

#### [Template](#tab/template)

https://learn.microsoft.com/en-us/azure/templates/microsoft.security/privatelinks?pivots=deployment-language-bicep


#### [Azure Developer CLI](#tab/azd)

#### [Terraform](#tab/terraform)

https://learn.microsoft.com/en-us/azure/templates/microsoft.security/privatelinks?pivots=deployment-language-bicep

---

### Create private endpoint for existing security private link instance


#### [Portal](#tab/azure-portal)

To create a private endpoint for existing Security private link instance with the Azure portal, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to the **Network foundation** > **Private Link** > **Private endpoints**.

1. Navigate to the **Network foundation**.

1. Select **Create**.

1. In the **Basics** tab, provide the following information:

  | Setting | Value |
  |---|---|
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
  |----|---|
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
   | Private DNS Zone | The field autopopulates with `privatelink.cloud.defender.microsoft.com` or the appropriate zone for your resource. |

1. Select **Next: Tags** and optionally add tags.

1. Select **Review + create**.

1. After validation passes, select **Create**.

1. Wait for the deployment to complete.

#### [Azure CLI](#tab/azure-cli)

The following examples use Azure CLI to create a private endpoint for Microsoft Security.

Set the following environment variables appropriate for your environment:

```azurecli
SUBSCRIPTION_ID=<your-subscription-id>
RESOURCE_GROUP=<resource-group-name>
LOCATION=<azure-region>
VNET_NAME=<virtual-network-name>
SUBNET_NAME=<subnet-name>
PRIVATE_ENDPOINT_NAME=<private-endpoint-name>
```

The FQDN should resolve to a private IP address under `privatelink.cloud.defender.microsoft.com`.

### Verify Defender connectivity

- **For AKS**: Confirm that the Defender for Containers add-on is running.
- **In the Azure portal**: Verify that workloads are reporting data in Microsoft Defender for Cloud.

## Related content

- Learn more about [Private endpoints with Microsoft Defender](concept-private-endpoints.md).

- For information about network security in Defender for Cloud, see [Planning network requirements for Microsoft Defender for Cloud](networking-requirements.md).

- To learn about other networking configurations, see [Configure network settings for Microsoft Defender for Cloud](networking-requirements.md).