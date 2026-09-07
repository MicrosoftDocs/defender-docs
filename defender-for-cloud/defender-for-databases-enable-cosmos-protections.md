---
title: Enable Microsoft Defender for Azure Cosmos DB
description: Learn how to enable enhanced security features in Microsoft Defender for Azure Cosmos DB.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to enable Microsoft Defender for Azure Cosmos DB so that I can protect Azure Cosmos DB accounts and validate alert behavior.
ai-usage: ai-assisted
---

# Enable Microsoft Defender for Azure Cosmos DB

Microsoft Defender for Azure Cosmos DB protection is available at both the [subscription level](#enable-database-protection-at-the-subscription-level) and the resource level.

You can enable Microsoft Defender for Cloud on your subscription to protect all database types, including Microsoft Defender for Azure Cosmos DB. Enabling protection at the subscription level is the recommended approach.

You can also enable Microsoft Defender for Azure Cosmos DB at the [resource level](#enable-microsoft-defender-for-azure-cosmos-db-at-the-resource-level) to protect a specific Azure Cosmos DB account.

## Prerequisites

Before you begin, make sure you have the following prerequisite:

- An Azure account. If you don't already have one, [create a free Azure account](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

## Enable database protection at the subscription level

Enable Microsoft Defender for Cloud at the subscription level to protect all database types in your subscription (recommended).

You can enable Microsoft Defender for Cloud protection on your subscription to protect database types such as Azure Cosmos DB, Azure SQL Database, Azure SQL servers on machines, and open-source relational databases.

You can also select specific resource types to protect when you configure your plan.

When you turn on enhanced security features for your subscription, Defender for Azure Cosmos DB is enabled for all your Azure Cosmos DB accounts.  

**To enable database protection at the subscription level**:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. Locate Databases and toggle the switch to **On**.

    :::image type="content" source="media/quickstart-enable-defender-for-cosmos/protection-type.png" alt-text="Screenshot showing the available protections you can enable." lightbox="media/quickstart-enable-defender-for-cosmos/protection-type-expanded.png":::

1. Select **Save**.

**To select specific resource types to protect when you configure your plan**:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. Locate Databases and toggle the switch to **On**.

1. Select **Select types**

    :::image type="content" source="media/quickstart-enable-defender-for-cosmos/select-type.png" alt-text="Screenshot showing where the option to select the type is located.":::

1. Toggle the desired resource type switches to **On**.

    :::image type="content" source="media/quickstart-enable-defender-for-cosmos/resource-type.png" alt-text="Screenshot showing the available resources you can enable.":::

1. Select **Confirm**.

## Enable Microsoft Defender for Azure Cosmos DB at the resource level

You can enable Defender for Azure Cosmos DB on a specific account by using the Azure portal, PowerShell, Azure CLI, an ARM template, or Azure Policy.

**To enable Microsoft Defender for Cloud for a specific Azure Cosmos DB account**:

Use one of the following methods: Azure portal, PowerShell, ARM template, Azure CLI, or Azure Policy.

### [Azure portal](#tab/azure-portal)

To enable Defender for Azure Cosmos DB from the Azure portal, perform the following steps:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **your Azure Cosmos DB account** > **Settings**.

1. Select **Microsoft Defender for Cloud**.

1. Select **Enable Microsoft Defender for Azure Cosmos DB**.

    :::image type="content" source="media/quickstart-enable-defender-for-cosmos/enable-storage.png" alt-text="Screenshot of the option to enable Microsoft Defender for Azure Cosmos DB on your specified Azure Cosmos DB account." lightbox="media/quickstart-enable-defender-for-cosmos/enable-storage.png":::

### [PowerShell](#tab/azure-powershell)

To enable Defender for Azure Cosmos DB by using PowerShell, run the following steps:

1. Install the [Az.Security](https://www.powershellgallery.com/packages/Az.Security/1.1.1) module.

1. Call the [Enable-AzSecurityAdvancedThreatProtection](/powershell/module/az.security/enable-azsecurityadvancedthreatprotection) command.

    ```powershell
    Enable-AzSecurityAdvancedThreatProtection -ResourceId "/subscriptions/<Your subscription ID>/resourceGroups/myResourceGroup/providers/Microsoft.DocumentDb/databaseAccounts/myCosmosDBAccount/" 
    ```

1. Verify the setting for your account by calling the [Get-AzSecurityAdvancedThreatProtection](/powershell/module/az.security/get-azsecurityadvancedthreatprotection) command.

    ```powershell
    Get-AzSecurityAdvancedThreatProtection -ResourceId "/subscriptions/<Your subscription ID>/resourceGroups/myResourceGroup/providers/Microsoft.DocumentDb/databaseAccounts/myCosmosDBAccount/" 
    ```

### [ARM template](#tab/arm-template)

Use an Azure Resource Manager template to deploy an Azure Cosmos DB account with Microsoft Defender for Azure Cosmos DB enabled. For deployment details and a sample ARM template, see [Create an Azure Cosmos DB account with Microsoft Defender for Azure Cosmos DB enabled](https://github.com/azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.documentdb/microsoft-defender-cosmosdb-create-account).

### [Azure CLI](#tab/azure-cli)

To enable Microsoft Defender for Azure Cosmos DB on a single account via Azure CLI, call the [az security atp cosmosdb update](/cli/azure/security/atp/cosmosdb) command. Remember to replace values in angle brackets with your own values:

```azurecli
az security atp cosmosdb update \
    --resource-group <resource-group> \
    --cosmosdb-account <cosmosdb-account> \
    --is-enabled true
```

To verify that Defender for Azure Cosmos DB is enabled on your account, call the [az security atp cosmosdb show](/cli/azure/security/atp/cosmosdb) command. This command displays the current protection state so you can confirm the feature is active. Remember to replace values in angle brackets with your own values:

```azurecli
az security atp cosmosdb show \
    --resource-group <resource-group> \
    --cosmosdb-account <cosmosdb-account>
```

### [Azure Policy](#tab/azure-policy)

Use Azure Policy to enable Microsoft Defender for Cloud across Azure Cosmos DB accounts under a specific subscription or resource group.

1. Launch the Azure Policy > Definitions page.
1. Search for the **Configure Microsoft Defender for Azure Cosmos DB to be enabled** policy, then select the policy to view the policy definition page.

    :::image type="content" source="media/defender-for-databases-enable-cosmos-protections/select-policy.png" alt-text="Screenshot of selecting the policy.":::

1. Select the **Assign button** for the built-in policy.

    :::image type="content" source="media/defender-for-databases-enable-cosmos-protections/select-assign-button.png" alt-text="Screenshot of selecting the assign button.":::

1. Specify an Azure subscription.

    :::image type="content" source="media/defender-for-databases-enable-cosmos-protections/choose-subscription.png" alt-text="Screenshot of choosing Azure subscription.":::

1. Select **Review + create** to review the policy assignment and complete it.

---

## Simulate security alerts from Microsoft Defender for Azure Cosmos DB

For a full list, see [supported alerts](alerts-azure-cosmos-db.md) in the Defender for Cloud alert reference.

You can use sample alerts to check alert quality and behavior.

Sample alerts also help you test alert settings, such as SIEM links, workflow automation, and email notifications.

Create sample alerts to verify that your alerting, automation, and notification pipelines work as expected.

**To create sample alerts from Microsoft Defender for Azure Cosmos DB**:

1. Sign in to the  [Azure portal](https://portal.azure.com/) as a Subscription Contributor user.

1. Navigate to the security alerts page.

1. Select **Sample alerts**.

1. Select the subscription.

1. Select the relevant Microsoft Defender for Cloud plan(s).

1. Select **Create sample alerts**.

    :::image type="content" source="media/quickstart-enable-defender-for-cosmos/sample-alerts.png" alt-text="Screenshot showing the order needed to create an alert.":::

After a few minutes, alerts appear on the security alerts page.

Alerts also appear in other configured destinations, such as connected SIEM systems and email notifications.

## Next steps

You learned how to enable Defender for Azure Cosmos DB and simulate security alerts.

> [!div class="nextstepaction"]
> [Automate responses to Microsoft Defender for Cloud triggers](workflow-automations.md).

