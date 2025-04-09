---
title: Stream Microsoft Defender for Endpoint events to your Storage account
description: Learn how to configure Microsoft Defender for Endpoint to stream Advanced Hunting events to your Storage account.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 06/28/2024
---

# Configure Microsoft Defender for Endpoint to stream Advanced Hunting events to your Storage account

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint](../microsoft-defender-endpoint.md)

> [!NOTE]
> For the full data streaming experience available, please visit [Stream Microsoft Defender XDR events | Microsoft Learn](/defender-xdr/streaming-api).

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

## Before you begin

1. Create a [Storage account](/azure/storage/common/storage-account-overview) in your tenant.

2. Sign in to your [Azure tenant](https://ms.portal.azure.com/), go to **Subscriptions** > **Your subscription** > **Resource Providers** > **Register to Microsoft.insights**.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

## Enable raw data streaming

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

2. Go to [Data export settings page](https://security.microsoft.com/settings/mtp_settings/raw_data_export) in Microsoft Defender XDR.

3. Select on **Add data export settings**.

4. Choose a name for your new settings.

5. Choose **Forward events to Azure Storage**.

6. Type your **Storage Account Resource ID**. In order to get your **Storage Account Resource ID**, go to your Storage account page on [Azure portal](https://ms.portal.azure.com/) \> properties tab \> copy the text under **Storage account resource ID**:

   :::image type="content" source="../media/storage-account-resource-id.png" alt-text="The Event Hubs with resource ID1" lightbox="../media/storage-account-resource-id.png":::

7. Choose the events you want to stream and select **Save**.

## The schema of the events in the Storage account

- A blob container is created for each event type:

  :::image type="content" source="../media/storage-account-event-schema.png" alt-text="The Event Hubs with resource ID2" lightbox="../media/storage-account-event-schema.png":::

- The schema of each row in a blob is the following JSON:

  ```json
  {
    "time": "<The time WDATP received the event>"
    "tenantId": "<Your tenant ID>"
    "category": "<The Advanced Hunting table name with 'AdvancedHunting-' prefix>"
    "properties": { <WDATP Advanced Hunting event as Json> }
  }
  ```

- Each blob contains multiple rows.

- Each row contains the event name, the time Defender for Endpoint received the event, the tenant it belongs (you get events only from your tenant), and the event in JSON format in a property called `properties`.

- For more information about the schema of Microsoft Defender for Endpoint events, see [Advanced Hunting overview](/defender-xdr/advanced-hunting-overview).

- In Advanced Hunting, the **DeviceInfo** table has a column named **MachineGroup** which contains the group of the device. Here, every event is decorated with this column as well. For more information, see [Device Groups](../machine-groups.md).
    > [!NOTE]
    > Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.  

## Data types mapping

In order to get the data types for our events properties, take the following steps:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) and go to [Advanced Hunting page](https://security.microsoft.com/hunting-package).

2. Run the following query to get the data types mapping for each event:

   ```kusto
   {EventType}
   | getschema
   | project ColumnName, ColumnType
   ```

   Here's an example for Device Info event:

      :::image type="content" source="../media/data-types-mapping-query.png" alt-text="The Event Hubs with resource ID3" lightbox="../media/data-types-mapping-query.png":::

## Related articles

- [Stream Microsoft Defender XDR events | Microsoft Learn](/defender-xdr/streaming-api)
- [Overview of Advanced Hunting](/defender-xdr/advanced-hunting-overview)
- [Microsoft Defender for Endpoint Streaming API](raw-data-export.md)
- [Stream Microsoft Defender for Endpoint events to your Azure storage account](raw-data-export-storage.md)
- [Azure Storage Account documentation](/azure/storage/common/storage-account-overview)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
