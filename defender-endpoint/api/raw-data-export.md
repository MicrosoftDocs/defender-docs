---
title: Stream Microsoft Defender for Endpoint event
description: Learn how to configure Microsoft Defender for Endpoint to stream Advanced Hunting events to Event Hubs or Azure storage account
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
ms.date: 12/18/2020
---

# Raw Data Streaming API

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Business](/microsoft-365/security/defender-business)


> [!TIP]
> For the full data streaming experience available, see [Stream Microsoft Defender XDR events](/defender-xdr/streaming-api).
> If you're using Microsoft Defender for Business, see [Use the streaming API with Microsoft Defender for Business](/defender-business/mdb-streaming-api).

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

## Stream Advanced Hunting events to Event Hubs and/or Azure storage account

Microsoft Defender for Endpoint supports streaming events available through [Advanced Hunting](/defender-xdr/advanced-hunting-overview) to an [Event Hubs](/azure/event-hubs/) and/or [Azure storage account](/azure/storage/common/storage-account-overview).

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=56edfb3f-b612-4e4c-acb9-4bbd141bd535]

## In this section

Topic|Description
:---|:---
[Stream Microsoft Defender for Endpoint events to Azure Event Hubs](raw-data-export-event-hub.md)|Learn about enabling the streaming API in your tenant and configure Defender for Endpoint to stream [Advanced Hunting](/defender-xdr/advanced-hunting-overview) to Event Hubs.
[Stream Defender for Endpoint events to your Azure storage account](raw-data-export-storage.md)|Learn about enabling the streaming API in your tenant and configure Defender for Endpoint to stream [Advanced Hunting](/defender-xdr/advanced-hunting-overview) to your Azure storage account.

## Related topics

- [Stream Microsoft Defender XDR events | Microsoft Learn](/defender-xdr/streaming-api)

- [Overview of Advanced Hunting](/defender-xdr/advanced-hunting-overview)
- [Azure Event Hubs documentation](/azure/event-hubs/)
- [Azure Storage Account documentation](/azure/storage/common/storage-account-overview)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
