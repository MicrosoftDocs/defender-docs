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
ms.date: 11/03/2024
appliesto: 
- Microsoft Defender XDR 
---

# Data security and retention in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Defender XDR integrates with several different Microsoft security services, which collect data using various technologies. Integrated services allow Microsoft Defender XDR to access their data for the purpose of identifying cross-product correlations.

## Collected data

Customer data collected from integrated services includes *processed data*, such as incidents and alerts, and *configuration data*, such as connector settings, rules and so on.

## Data storage location

Microsoft Defender XDR operations in Microsoft Azure data centers in the following geographical regions:

- **European Union**: North Europe and West Europe
- **United Kingdom**: UK South and UK West
- **United States**: East US 2 and Central US
- **Australia**: Australia East and Australia Southeast
- **Switzerland**: Switzerland North and Switzerland West
- **India**: Central India and South India

Once created, the Microsoft Defender XDR tenant isn't movable to a different region. Your geographical region is shown in the Microsoft Defender portal, under **Settings > Microsoft Defender XDR > Account**.

Customer data stored by integrated services might also be stored in the following locations:

- The original location for the relevant service.
- A region defined by data storage rules of an integrated service, if Microsoft Defender XDR shares data with that service.

## Data retention

Microsoft Defender XDR data is retained for 180 days, and is visible across the Microsoft Defender portal during that time, except for in **Advanced hunting** queries. 

In the Microsoft Defender portal's **Advanced hunting** page, data is accessible via queries for only 30 days, unless it's streamed through [Microsoft's unified security operations platform with Microsoft Sentinel](/azure/sentinel/microsoft-365-defender-sentinel-integration?toc=%2Fdefender-xdr%2Ftoc.json&bc=%2Fdefender-xdr%2Fbreadcrumb%2Ftoc.json&tabs=defender-portal), where retention periods may be longer.

Data continues to be retained and visible, even when a license is under a grace period or in suspended mode. At the end of any grace period or suspension, and no later than 180 days from a contract termination or expiration, data is deleted from Microsoft's systems and is unrecoverable.

Most Defender services also have a default data retention period of 180 days. More information on data retention period per product is found in [relevant service docs](#related-content).

## Data sharing

Microsoft Defender XDR shares data among the following Microsoft products, also licensed by the customer:

- Microsoft Defender for Cloud
- Microsoft Defender for Identity
- Microsoft Defender for Endpoint
- Microsoft Defender for Cloud Apps
- Microsoft Defender for Office 365
- Microsoft Defender for IoT
- Microsoft Sentinel
- Microsoft Intune
- Microsoft Purview
- Microsoft Entra
- Microsoft Defender Vulnerability Management
- Microsoft Copilot for Security

## Related content

For more information, see:

- [Defender for Endpoint data storage and privacy](/defender-endpoint/data-storage-privacy)
- [Defender for Office 365 data retention information](/defender-office-365/mdo-data-retention)
- [Defender for Identity data storage and privacy](/defender-for-identity/privacy-compliance)
- [Defender for Cloud Apps data storage and privacy](/defender-cloud-apps/cas-compliance-trust)
- [Microsoft Entra data storage and privacy](/entra/identity/monitoring-health/reference-reports-data-retention)
- [Microsoft Sentinel pricing](https://azure.microsoft.com/pricing/details/microsoft-sentinel/)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
