---
title: Set up federated data connectors in Microsoft Sentinel data lake
titleSuffix: Microsoft Security
description: Learn how to configure federated data connectors for Azure Databricks, ADLS Gen 2, and Microsoft Fabric in Microsoft Sentinel data lake.
author: edbaynash
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.topic: how-to
ms.date: 03/05/2026
ms.author: edbaynash
ms.collection: ms-security

#Customer intent: As a security administrator, I want to set up federated data connectors so that I can query external data sources from the Microsoft Sentinel data lake.
---

# Set up federated data connectors in Microsoft Sentinel data lake

This article explains how to configure federated data connectors to enable querying of external data sources from the Microsoft Sentinel data lake. You can federate with Azure Databricks, Azure Data Lake Storage (ADLS) Gen 2, and Microsoft Fabric.

## Prerequisites

Before setting up data federation, ensure you meet the following requirements:

- **Sentinel data lake onboarding**: Your Microsoft Sentinel workspace must be onboarded to the Sentinel data lake.
- **Public accessibility**: Azure Data Lake Storage Gen2 and Azure Databricks sources must be publicly accessible. Private endpoints for these sources aren't supported currently. 
- **Service principal**: A service principal with access to the external data source. For more information on creating service principals. For more information, see [Microsoft Entra ID app registrations](/entra/identity-platform/quickstart-register-app).
- **Azure Key Vault**:An Azure Key Vault configured with the Service principal client secret.  The Microsoft sentinel application identity needs permissions assigned to the key vault. For more information on configuring Azure Key vaults, see [Azure Key Vaults](s/azure/key-vault/general/basic-concepts).
- **Microsoft Sentinel permissions**: **Data (manage)** permissions on System tables to configure a data federation connector. For more information, see [Microsoft Sentinel permissions](https://learn.microsoft.com/en-us/azure/sentinel/permissions).
- **Source data access**: Access to the external data source you want to federate.
- The external data source must be publicly accessible (private endpoints aren't supported)


## Create a service principal for Azure Key Vault access

For Azure Databricks and ADLS Gen 2 federation, you need a service principal to securely access credentials stored in Azure Key Vault.

1. **Create a Microsoft Entra ID application registration**:
   1. In the Azure portal, navigate to **Microsoft Entra ID** > **App registrations**.
   1. Select **New registration**.
   1. Enter a name for the application.
   1. Leave the redirect URI empty (not required for this scenario).
   1. Select **Register**.

1. **Create a client secret**:
   1. In your app registration, go to **Certificates & secrets**.
   1. Select **New client secret**.
   1. Enter a description and select an expiration period.
   1. Select **Add**.
   1. Copy and save the client secret value immediately. You can't retrieve this value after you leave the page.

1. **Note the application details**:
   - Application (client) ID
   - Object ID
   - Directory (tenant) ID

For more information on creating service principals, see [Microsoft Entra ID app registrations](/entra/identity-platform/quickstart-register-app).


## Create an Azure Key Vault and store credentials

1. **Create an Azure Key Vault**:
   1. In the Azure portal, create a new Azure Key Vault.
   1. Use the **Azure role-based access control (recommended)** permission model.
   1. Note the Key Vault URI after creation.

1. **Configure Key Vault access**:
   1. Assign the **Key Vault Secrets Officer** role to your service principal on the Key Vault's **Access Control (IAM)** page.
   1. Assign the **Key Vault Secrets User** role to the Microsoft Sentinel platform's managed identity. The system managed identity prefixed with `msg-resource`.


1. **Store the client secret in Key Vault**:
   1. In your Key Vault, go to **Secrets** > **Generate/Import**.
   1. Create a new secret containing the service principal's client secret.
   1. Note the secret name.

:::image type="content" source="./media/data-federation-setup/key-vault-permissions.png" lightbox="./media/data-federation-setup/key-vault-permissions.png" alt-text="Screenshot showing the Key Vault secret details.":::

## Federated data connectors

Federated connectors are managed on the Data connectors page in Microsoft Sentinel on the Defender portal.

1. Navigate to **Microsoft Sentinel** > **Configuration** > **Data connectors**.
1. Under **Data federation**, select **Catalog** to view the available federated connectors.

:::image type="content" source="./media/data-federation-setup/federation-catalog.png" alt-text="Screenshot showing the data federation catalog with available connectors." lightbox="./media/data-federation-setup/federation-catalog.png":::

The catalog page displays:
- Available federation connector types
- Number of configured instances for each connector
- Publisher and support information

Select **My connectors page** to view all configured connector instances.

:::image type="content" source="./media/data-federation-setup/my-connectors.png" alt-text="Screenshot showing the My connectors page with configured federation instances." lightbox="./media/data-federation-setup/my-connectors.png":::

## Create a connector instance

# [Azure Data Lake Storage Gen 2](#tab/adls)

### Prepare your ADLS Gen 2 storage account

Before creating the connector, prepare your storage account:

1. If you're creating a new storage account, ensure the **Hierarchical namespaces** setting is enabled.
1. Assign the **Storage Blob Data Reader** role to the service principal you created earlier.
1. Take note of the ADLS Gen 2 storage account endpoint URL.

> [!NOTE]
> The files in your ADLS Gen 2 storage account must be in delta parquet format to be read from the Sentinel data lake.

### Create the ADLS Gen 2 connector instance

1. On the **Data federation** > **Catalog** page, select **Azure Data Lake Storage**.
1. Select **Connect a connector**.

1. Configure the following name and connection details:

   | Field | Description |
   |-------|-------------|
   | **Instance name** | A friendly name for this connector instance |
   | **Application (client) ID** | GUID of the service principal with Key Vault access |
   | **Azure Key Vault URI** | URI of the Key Vault containing the authentication secret |
   | **Secret name** | Name of the secret in Key Vault containing the service principal client secret |
   | **Azure Data Lake Storage URL** | URL of the ADLS Gen 2 endpoint (must be publicly accessible) |


1. Select **Next** to continue.

   :::image type="content" source="./media/data-federation-setup/adls-connection-details.png" alt-text="Screenshot of the ADLS Gen 2 connection details form." lightbox="./media/data-federation-setup/adls-connection-details.png":::


1. Select the tables you want to federate from your ADLS Gen 2 storage account.

1. Browse the available tables in your ADLS Gen 2 storage.
1. Select at least one table to federate.
1. Select **Next** to continue.

   :::image type="content" source="./media/data-federation-setup/adls-select-tables.png" alt-text="Screenshot showing table selection for ADLS Gen 2 federation." lightbox="./media/data-federation-setup/adls-select-tables.png":::


1. Once you have selected the tables, review the configuration settings.
1. Select **Connect** to create the connector instance.
1. If you need to make changes, select **Back** to return to previous steps.

   :::image type="content" source="./media/data-federation-setup/adls-review.png" alt-text="Screenshot of the ADLS Gen 2 configuration review page." lightbox="./media/data-federation-setup/adls-review.png":::

Select **Connect**, to complete the setup for the ADLS Gen 2 connector instance.

# [Azure Databricks](#tab/databricks)

### Prepare Azure Databricks

Before creating the connector, configure access in your Databricks environment:

1. In Azure Databricks, navigate to **Settings** > **Identity and Access**
1. In your metastore, set **External data access** to **Enabled**.
1.	In the catalog that you are federating with, select **Permissions** and then select **Grant**.
1. Search for the service principal you created earlier.
1. Grant the service principal the **Data Reader** role.
1. Assign the target catalog the **External Use Schema** permission.
1.	In the top right, select your account and select **Settings**.
1. Under **Identity and access**, select the **Manage** button next to **Service principals**.
1. Select **existing principal** from the box.
1. Select the service principal you created earlier and select **Add**.
1. Go back to your catalog, and select the **Settings** gearwheel.
1. On the **Credentials** page, grant permissions for your service principal for **CREATE CONNECTION** and **READ FILES**.



### Create the Azure Databricks connector instance

1. On the **Data federation** > **Catalog** page, select the **Azure Databricks** row.
1. In the side panel, select **Connect a connector**.

1. Enter the following details:

    | Field | Description |
    |-------|-------------|
    | **Instance name** | A friendly name for this connector instance |
    | **Principal ID** | GUID of the service principal with Key Vault access |
    | **Azure Key Vault URI** | URI of the Key Vault containing the authentication secret |
    | **Secret name** | Name of the secret in Key Vault containing the Databricks connection information |
    | **Databricks URL** | URL of the Azure Databricks instance (must be publicly accessible) |
    | **Catalog name** | Name of the catalog in Azure Databricks to federate |
    | **Schema name** | Name of the schema in Azure Databricks to federate |

    :::image type="content" source="./media/data-federation-setup/databricks-connection-details.png" alt-text="Screenshot of the Azure Databricks connection details form." lightbox="./media/data-federation-setup/databricks-connection-details.png":::

1. Select **Next**.

1. Select the tables you want to federate from your Azure Databricks instance.

1. Select **Next** to continue.

    :::image type="content" source="./media/data-federation-setup/databricks-select-tables.png" alt-text="Screenshot showing table selection for Azure Databricks federation." lightbox="./media/data-federation-setup/databricks-select-tables.png":::

1. Review the configuration settings.
1. Select **Connect** to create the connector instance.
1. If you need to make changes, select **Back** to return to previous steps.

:::image type="content" source="./media/data-federation-setup/databricks-review.png" alt-text="Screenshot of the Azure Databricks configuration review page." lightbox="./media/data-federation-setup/databricks-review.png":::

After selecting **Connect**, the wizard closes and the instance count for Databricks increases.

# [Microsoft Fabric](#tab/fabric)

### Create the Microsoft Fabric connector instance

Microsoft Fabric federation has simplified requirements compared to other sources.

1. On the **Data federation** > **Catalog** page, select the **Microsoft Fabric** row.
1. In the side panel, select **Connect a connector**.

1. Enter the following information:

    | Field | Description |
    |-------|-------------|
    | **Instance name** | A friendly name for this connector instance |
    | **Fabric workspace ID** | ID of the Fabric workspace to federate |
    | **Lakehouse table ID** | ID of the Fabric Lakehouse table to federate |

1. Select **Next**.

    :::image type="content" source="./media/data-federation-setup/fabric-connection-details.png" alt-text="Screenshot of the Microsoft Fabric connection details form." lightbox="./media/data-federation-setup/fabric-connection-details.png":::

1. Select the tables you want to federate.
1. Select **Next**.


1. Review the federation target configuration.

1. Select **Connect** to create the connection instance.

---

## Verify your connector instance

After creating a connector instance:

1. Navigate to **Data federation** > **My connectors page**.
1. Locate your new connector instance in the list.
1. Select the instance row to open the details flyout.

:::image type="content" source="./media/data-federation-setup/connector-instance-details.png" alt-text="Screenshot showing connector instance details in the flyout panel." lightbox="./media/data-federation-setup/connector-instance-details.png":::

The flyout displays:
- Connection status
- Configured tables
- Connection properties

## Manage connector instances

To modify or delete a connector instance:

1. Navigate to **Data federation** > **My connectors page**.
1. Select the connector instance you want to manage.
1. In the flyout panel, use the available options to:
   - Edit connection settings
   - Add or remove federated tables
   - Delete the connector instance

## Troubleshooting

### Connection fails

- Verify the service principal has the correct permissions on Azure Key Vault.
- Ensure the Key Vault secret contains the correct client secret.
- Confirm the external data source is publicly accessible.
- Check that the service principal has appropriate permissions on the target data source.

### Tables don't appear

- Verify the service principal has read access to the target tables.
- For Databricks, ensure the catalog has the External Use Schema permission.
- For ADLS Gen 2, confirm the Storage Blob Data Reader role is assigned.

### Query performance issues

- Consider the size of data being queried from external sources.
- Optimize queries to filter data early.
- Check network connectivity between Sentinel and the external source.

## Next steps

- [Data federation overview](data-federation-overview.md)
- [Use federated data sources in Microsoft Sentinel](data-federation-use.md)
- [Query federated tables with KQL](kql-jobs-summary-rules-search-jobs.md)
