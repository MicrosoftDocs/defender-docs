---
title: Stream Microsoft Defender XDR events to your Storage account
description: Learn how to configure Microsoft Defender XDR to stream Advanced Hunting events to your Storage account.
search.appverid: met150
ms.service: defender-xdr
ms.author: macapara
author: mjcaparas
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
ms.date: 06/21/2024
---

# Stream Microsoft Defender XDR events to your storage account

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender XDR](microsoft-365-defender.md)

> [!NOTE]
> **Try our new APIs using MS Graph security API**. Find out more at: [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview).

[!include[Prerelease information](../includes/prerelease.md)]

## Before you begin

- Create a [Storage account](/azure/storage/common/storage-account-overview) in your tenant.
- Sign in to your [Azure tenant](https://ms.portal.azure.com/), and go to **Subscriptions** > **Your subscription** > **Resource Providers** > **Register to Microsoft.Insights**.

### Add contributor permissions

Once the storage account is created, you need to define the user who is signing in as a contributor.

1. Go to **Storage Account** > **Access control (IAM)**, and then select **Add**.

2. Verify the user is listed under **Role assignments**.

## Enable raw data streaming

> [!NOTE]
> When using the Streaming API to an Azure Storage account, ensure the option `Allow trusted Microsoft services to access this storage account` is enabled in the storage account settings to allow for data to be streamed from Microsoft Defender for Endpoint.

1. Go to the [Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2077139) and sign in using an account with at least Security Administrator permissions.

   > [!IMPORTANT]
   > Microsoft recommends that you use roles with the fewest permissions. Using lower permissioned accounts helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

2. Go to **Settings** > **Microsoft Defender XDR** > **Streaming API**. To go directly to the **Streaming API** page, use [https://security.microsoft.com/settings/mtp_settings/raw_data_export](https://security.microsoft.com/settings/mtp_settings/raw_data_export).

3. Select **Add**.

4. In the **Add new Streaming API settings** flyout that appears, configure the following settings:

   - **Name**: Choose a name for your new settings.
   - Select **Forward events to Azure Storage**.

5. To display the Azure Resource Manager resource ID for a storage account in the Azure portal, follow these steps:

   1. Navigate to your storage account in the [Azure portal](https://portal.azure.com).

   2. In the **Overview** page, in the **Essentials** section, select the **JSON View** link.

   3. The resource ID for the storage account is displayed at the top of the page. Copy the text under **Storage Account Resource ID**.

   4. In the **Add new Streaming API settings** flyout, choose the **Event types** that you want to stream.

   5. When you're finished, select **Submit**.

## The schema of the events in the Storage account

- A blob container is created for each event type:

  :::image type="content" source="/defender-endpoint/media/storage-account-event-schema.png" alt-text="Example of a blob container" lightbox="/defender-endpoint/media/storage-account-event-schema.png":::

- The schema of each row in a blob is the following JSON:

   ```JSON
   {
          "time": "<The time Microsoft Defender XDR received the event>"
          "tenantId": "<Your tenant ID>"
          "category": "<The Advanced Hunting table name with 'AdvancedHunting-' prefix>"
          "properties": { <Microsoft Defender XDR Advanced Hunting event as Json> }
   }
   ```

- Each blob contains multiple rows.

- Each row contains the event name, the time Defender for Endpoint received the event, the tenant it belongs (you'll only get events from your tenant), and the event in JSON format in a property called "properties".

- For more information about the schema of Microsoft Defender XDR events, see [Advanced Hunting overview](advanced-hunting-overview.md).

## Data types mapping

To get the data types for events properties, follow these steps:

1. Go to the [Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2077139) and sign in.

2. Go to **Hunting** \> **Advanced hunting**. To go directly to the **Advanced hunting** page, use [https://security.microsoft.com/advanced-hunting](https://security.microsoft.com/advanced-hunting).

2. On the **Query** tab, run the following query to get the data types mapping for each event:

   ```text
   {EventType}
   | getschema
   | project ColumnName, ColumnType
   ```

   Here's an example for Device Info event:

   :::image type="content" source="/defender-endpoint/media/machine-info-datatype-example.png" alt-text="An example device info query" lightbox="/defender-endpoint/media/machine-info-datatype-example.png":::

## Monitoring created resources

You can monitor the resources created by the streaming API using **Azure Monitor**. For more information, see [Monitor destinations - Azure Monitor](/azure/azure-monitor/logs/logs-data-export?tabs=portal#monitor-destinations).

## Related articles

- [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview)
- [Overview of Advanced Hunting](advanced-hunting-overview.md)
- [Microsoft Defender XDR Streaming API](streaming-api.md)
- [Stream Microsoft Defender XDR events to your Azure storage account](streaming-api-storage.md)
- [Azure Storage Account documentation](/azure/storage/common/storage-account-overview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
