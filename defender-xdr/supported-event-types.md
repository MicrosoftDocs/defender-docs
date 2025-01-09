---
title: Microsoft Defender XDR streaming event types supported in Event Streaming API
description: Learn which streaming event types (tables) are supported by the streaming API
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
ms.topic: conceptual
ms.date: 09/09/2021
---

# Supported Microsoft Defender XDR streaming event types in event streaming API

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender XDR](microsoft-365-defender.md)

> [!NOTE]
> **Try our new APIs using MS Graph security API**. Find out more at: [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview).

[!include[Prerelease information](../includes/prerelease.md)]


The Event Streaming API is constantly being expanded to support more event types. Learn which hunting tables are generally available, currently in public preview, or not yet supported. 


## Hunting tables support status in Event Streaming API

The following table includes that status of support for tables in the streaming API, and is not inclusive of all AH schema. For a full list of the API see, [Learn the schema tables](advanced-hunting-schema-tables.md#learn-the-schema-tables).


> [!NOTE]
> Streaming data is only available for columns or fields that are in general availability in Microsoft Defender XDR. 

| Table name | Status<br>(Commercial) | GCC | GCC High | DoD |
|----|----|----|----|----|
| **[AlertEvidence](advanced-hunting-alertevidence-table.md)** | GA | GA | GA | GA |
| **[AlertInfo](advanced-hunting-alertinfo-table.md)** | GA | GA | GA | GA |
| **[BehaviorEntities](advanced-hunting-behaviorentities-table.md)**|Not available |Not available |Not available  |Not available  |
| **[BehaviorInfo](advanced-hunting-behaviorinfo-table.md)**|Not available |Not available |Not available  |Not available |
| **[CloudAppEvents](advanced-hunting-cloudappevents-table.md)**|GA |GA |GA |GA |
| **[DeviceEvents](advanced-hunting-deviceevents-table.md)** |GA | GA | GA | GA |
| **[DeviceFileCertificateInfo](advanced-hunting-DeviceFileCertificateInfo-table.md)** |GA | GA | GA | GA |
| **[DeviceFileEvents](advanced-hunting-devicefileevents-table.md)** | GA | GA | GA | GA |
| **[DeviceImageLoadEvents](advanced-hunting-deviceimageloadevents-table.md)** | GA | GA | GA | GA |
| **[DeviceInfo](advanced-hunting-deviceinfo-table.md)** | GA | GA | GA | GA |
| **[DeviceLogonEvents](advanced-hunting-devicelogonevents-table.md)** | GA | GA | GA | GA |
| **[DeviceNetworkEvents](advanced-hunting-devicenetworkevents-table.md)** |GA | GA | GA | GA |
| **[DeviceNetworkInfo](advanced-hunting-devicenetworkinfo-table.md)** | GA | GA | GA | GA |
| **[DeviceProcessEvents](advanced-hunting-deviceprocessevents-table.md)** | GA | GA | GA | GA |
| **[DeviceRegistryEvents](advanced-hunting-deviceregistryevents-table.md)** | GA | GA | GA | GA |
| **[EmailAttachmentInfo](advanced-hunting-emailattachmentinfo-table.md)** | GA |GA |GA |GA |
| **[EmailEvents](advanced-hunting-emailevents-table.md)** | GA |GA |GA |GA |
| **[EmailPostDeliveryEvents](advanced-hunting-emailpostdeliveryevents-table.md)** | GA |GA |GA |GA |
| **[EmailUrlInfo](advanced-hunting-emailurlinfo-table.md)** | GA |GA |GA |GA |
| **[IdentityLogonEvents](advanced-hunting-identitylogonevents-table.md)**|GA |GA |GA |GA |
| **[IdentityQueryEvents](advanced-hunting-identityqueryevents-table.md)**|GA |GA |GA |GA |
| **[IdentityDirectoryEvents](advanced-hunting-identitydirectoryevents-table.md)**|GA |GA |GA |GA |
| **[UrlClickEvents](advanced-hunting-urlclickevents-table.md)**|GA |GA |GA| GA  |

## Related topics

[Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
