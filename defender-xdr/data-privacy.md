---
title: Data retention and data security in Microsoft Defender XDR
description: Describes data retention, security, and privacy of the service.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: macapara
author: diannegali
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier2
- essentials-security
- essentials-privacy
- essentials-compliance
ms.topic: conceptual
search.appverid: 
  - MOE150
  - MET150
ms.date: 08/19/2024
appliesto: 
- Microsoft Defender XDR 
---

# Data security and retention in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Defender XDR operates in Microsoft Azure data centers in the European Union, the United Kingdom, the United States, Australia, and Switzerland. Customer data collected by the service is stored at rest in (a) the geo-location of the tenant as identified during provisioning or, (b) the geo-location as defined by the data storage rules of an online service if this online service is used by Microsoft Defender XDR to process such data.

Customer data in pseudonymized form might also be stored in central storage and processing systems in the United States.

The table below shows the general information on the data retention of specific service sources in Defender XDR:

|Product|Default data retention period|More information|
|:---|:---|:---|
|Microsoft Defender for Endpoint|180 days|[Defender for Endpoint data storage and privacy](/defender-endpoint/data-storage-privacy)|
|Microsoft Defender for Office 365|Varies according to feature and license|[Defender for Office 365 data retention information](/defender-office-365/mdo-data-retention)|
|Microsoft Defender for Identity|180 days|[Defender for Identity data storage and privacy](/defender-for-identity/privacy-compliance)|
|Microsoft Defender for Cloud Apps|180 days|[Defender for Cloud Apps data storage and privacy](/defender-cloud-apps/cas-compliance-trust)|
|Microsoft Entra|Varies according to feature and license|[Microsoft Entra data storage and privacy](/entra/identity/monitoring-health/reference-reports-data-retention)|
|Microsoft Sentinel|90 days for Basic logs, varies depending on pricing|[Microsoft Sentinel pricing](https://azure.microsoft.com/pricing/details/microsoft-sentinel/)|

> [!NOTE]
> [Advanced hunting](advanced-hunting-overview.md) lets you query up to 30 days of raw data.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
