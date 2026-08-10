---
title: Stream Microsoft Defender XDR events to Azure Event Hubs
description: Configure Microsoft Defender XDR to stream events to Azure Event Hubs for downstream processing and integration.
ms.service: defender-xdr
ms.author: edbaynash
author: EdB-MSFT
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom: admindeeplinkDEFENDER, msecd-doc-authoring-1016
ms.topic: how-to
ms.date: 07/02/2026
ai-usage: ai-assisted
---

# Configure Microsoft Defender XDR to stream Advanced Hunting events to your Azure event hub

Learn how to configure Microsoft Defender XDR to stream Advanced Hunting events to Azure Event Hubs for downstream processing, integration, and long-term storage.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article explains how to configure the Microsoft Defender XDR streaming API to forward Advanced Hunting events to Azure Event Hubs for downstream processing, integration, and long-term storage. Security administrators can use this guide to set up streaming, understand the event schema, and estimate the required Event Hub capacity. Before you begin, review the prerequisites to ensure your Event Hubs environment and permissions are in place.

**Applies to:**
- [Microsoft Defender XDR](microsoft-365-defender.md)

> [!NOTE]
> **Try our new APIs using MS Graph security API**. Find out more at: [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview).

[!include[Prerelease information](../includes/prerelease.md)]

## Prerequisites

Before you configure Microsoft Defender to stream data to Event Hubs, ensure the following prerequisites are fulfilled:

1. Create an Event Hubs (for information, see [Set up Event Hubs](configure-event-hub.md#set-up-event-hubs)).

1. Creating an Event Hubs Namespace (for information, see [Set up Event Hubs namespace](configure-event-hub.md#set-up-event-hubs-namespace)).

1. Add permissions to the entity who has the privileges of a **Contributor** so that this entity can export data to the Event Hubs. For more information on adding permissions, see [Add permissions](configure-event-hub.md#add-permissions)

> [!NOTE]
> The Streaming API can be integrated either via Event Hubs or Azure Storage Account.

## Enable raw data streaming

To enable raw data streaming to your Azure event hub, complete the following steps in the Microsoft Defender portal:

1. Sign in <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a> as a ***Security Administrator*** or higher.

1. Go to the [Streaming API settings page](https://sip.security.microsoft.com/settings/mtp_settings/raw_data_export).

1. Select **Add**.

1. Choose a name for your new settings.

1. Choose **Forward events to Azure Event Hub**.

1. You can select if you want to export the event data to a single Event Hub, or to export each event table to a different Event Hubs in your Event Hubs namespace.

1. To export the event data to a single Event Hub, enter your **event hub name** and your **event hub Namespace resource ID**.

   To get your **event hub Namespace resource ID**, go to your Azure Event Hubs namespace page on the [Azure portal](https://ms.portal.azure.com/) > **Properties** tab > copy the text under **Resource ID**:

   :::image type="content" source="media/streaming-api-event-hub/event-hub-resource-id.png" alt-text="An Event Hub resource ID" lightbox="media/streaming-api-event-hub/event-hub-resource-id.png":::

1. Go to the [Supported Microsoft Defender XDR event types in event streaming API](supported-event-types.md) to review the support status of event types in the Microsoft 365 Streaming API.

1. Choose the events you want to stream and select **Save**.

<a name="the-schema-of-the-events-in-azure-event-hub"></a>
## Event schema in Azure Event Hub

The following JSON sample shows the structure of an event payload delivered to Azure Event Hubs by the streaming API:

```JSON
{
   "records": [
               {
                  "time": "<The time Microsoft Defender XDR received the event>"
                  "tenantId": "<The Id of the tenant that the event belongs to>"
                  "category": "<The Advanced Hunting table name with 'AdvancedHunting-' prefix>"
                  "properties": { <Microsoft Defender XDR Advanced Hunting event as Json> }
               }
               ...
            ]
}
```

- Each Event Hubs message in Azure Event Hubs contains list of records.

- Each record contains the event name, the time Microsoft Defender received the event, the tenant it belongs (you only get events from your tenant), and the event in JSON format in a property called "**properties**".

- For more information about the schema of Microsoft Defender events, see [Advanced Hunting overview](advanced-hunting-overview.md).

- In Advanced Hunting, the **DeviceInfo** table has a column named **MachineGroup** which contains the group of the device. Here, every event is decorated with this column as well.

<a name="data-types-mapping"></a>
## Data type mappings

To get the data types for event properties:

1. Sign in <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender XDR</a> and go to [Advanced Hunting page](https://security.microsoft.com/hunting-package).

2. Replace `{EventType}` with your event table name and run the following query to retrieve the column names and data types for that event:

   ```kusto
   {EventType}
   | getschema
   | project ColumnName, ColumnType
   ```

- Here's an example for Device Info event:

  :::image type="content" source="/defender-endpoint/media/machine-info-datatype-example.png" alt-text="An example query for device info" lightbox="/defender-endpoint/media/machine-info-datatype-example.png":::

## Estimating initial Event Hub capacity
The following advanced hunting query can help provide a rough estimate of data volume throughput and initial event hub capacity based on events/sec and estimated MB/sec. We recommend running the query during regular business hours so as to capture 'real' throughput.

Use this query to estimate table volume over the past seven days. The output shows the average events per second and estimated MB/sec for each table, which you can use to determine the required event hub throughput units.

```kusto
let bytes_ = 1000;
union withsource=MDTables MyDefenderTable // TODO: Insert desired tables one by one separated by a comma (for example: DeviceEvents, DeviceInfo) or with a wildcard (Device*)
| where Timestamp > startofday(ago(7d))
| summarize count() by bin(Timestamp, 1m), MDTables
| extend EPS = count_ /60 
| summarize avg(EPS), estimatedMBPerSec = avg(EPS) * bytes_ / (1024*1024) by MDTables, bin(Timestamp, 3h)
| summarize avg_EPS=max(avg_EPS), estimatedMBPerSec = max(estimatedMBPerSec) by MDTables
| sort by toint(estimatedMBPerSec) desc
| project MDTables, avg_EPS, estimatedMBPerSec
```

To check the different Event Hub limits, review [Azure Event Hubs quota and limits](/azure/event-hubs/event-hubs-quotas).

## Monitoring created resources

You can monitor the resources created by the streaming API using **Azure Monitor**. 
To learn how to export log data for analyzing streaming API resources, see [Log Analytics workspace data export in Azure Monitor](/azure/azure-monitor/logs/logs-data-export). 

## Related articles

- [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview)

- [Overview of Advanced Hunting](advanced-hunting-overview.md)
- [Microsoft Defender XDR streaming API](streaming-api.md)
- [Supported Microsoft Defender event types in event streaming API](supported-event-types.md)
- [Stream Microsoft Defender XDR events to your Azure storage account](streaming-api-storage.md)
- [Azure Event Hubs documentation](/azure/event-hubs/)
- [Troubleshoot connectivity issues - Azure Event Hubs](/azure/event-hubs/troubleshooting-guide)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
