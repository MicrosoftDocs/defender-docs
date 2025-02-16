---
title: Microsoft Defender for Endpoint data storage and privacy
description: Learn about how Microsoft Defender for Endpoint handles privacy and data that it collects.
keywords: Microsoft Defender for Endpoint, data storage and privacy, storage, privacy, licensing, geolocation, data retention, data
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
- essentials-privacy
- essentials-security
- essentials-compliance
ms.topic: conceptual
search.appverid: met150
ms.date: 08/20/2024
---

# Microsoft Defender for Endpoint data storage and privacy

[!INCLUDE [Microsoft 365 Defender rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Business](/defender-business/mdb-overview)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

This section covers some of the most frequently asked questions regarding privacy and data handling for Defender for Endpoint.

> [!NOTE]
> This article explains the data storage and privacy details related to Defender for Endpoint and Defender for Business. For more information related to Defender for Endpoint and other products and services like Microsoft Defender Antivirus and Windows, see [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?linkid=827576), and also [Windows privacy FAQ](https://go.microsoft.com/fwlink/?linkid=827577).

## What are we collecting?

Microsoft Defender for Endpoint collects information from your configured devices and stores it in a customer-dedicated and segregated tenant specific to the service for administration, tracking, and reporting purposes.

Information collected includes file data (file names, sizes, and hashes), process data (running processes, hashes), registry data, network connection data (host IPs and ports), and device details (device identifiers, names, and the operating system version).

Microsoft stores this data securely in Microsoft Azure and maintains it in accordance with Microsoft privacy practices and  [Microsoft Trust Center policies](https://go.microsoft.com/fwlink/?linkid=827578).

This data enables Defender for Endpoint to:

- Proactively identify indicators of attack (IOAs) in your organization
- Generate alerts if a possible attack was detected
- Provide your security operations with a view into devices, files, and URLs related to threat signals from your network, enabling you to investigate and explore the presence of security threats on the network.

Microsoft doesn't use your data for advertising.

## Data location

Defender for Endpoint operates in the Microsoft Azure data centers in the European Union, the United Kingdom, the United States, Australia, Switzerland, or India. Customer data collected by the service might be stored in: (a) the geo-location of the tenant as identified during provisioning or, (b) the geo-location as defined by the data storage rules of an online service if this online service is used by Defender for Endpoint to process such data. For more information, see [Where your Microsoft 365 customer data is stored](/microsoft-365/enterprise/o365-data-locations).

(a) the geo-location of the tenant as identified during provisioning; or

(b) the geo-location as defined by the data storage rules of an online service if this online service is used by Defender for Endpoint to process such data.

## Data Retention

Data from Microsoft Defender for Endpoint is retained for 180 days, visible across the portal. 

Your data is kept and is available to you while the license is under grace period or suspended mode. At the end of this period, that data will be erased from Microsoft's systems to make it unrecoverable, no later than 180 days from contract termination or expiration.

In the advanced hunting investigation experience, it's accessible via a query for 30 days.

## Data sharing for Microsoft Defender for Endpoint

Microsoft Defender for Endpoint shares data, including customer data, among the following Microsoft products, also licensed by the customer.

- Microsoft Defender XDR
- Microsoft Defender for Cloud Apps
- Microsoft Sentinel
- Microsoft Tunnel for Mobile Application Management - Android
- Microsoft Defender for Cloud
- Microsoft Defender for Identity
- Microsoft Security Exposure Management (public preview)

