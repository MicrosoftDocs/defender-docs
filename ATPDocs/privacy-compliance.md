---
title: Microsoft Defender for Identity – privacy
description: Learn how Microsoft Defender for Identity collects data in a manner that protects personal privacy.
ms.date: 06/06/2024
ms.topic: conceptual
#customerIntent: To learn how Microsoft Defender for Identity collects data in a manner that protects personal privacy.
---

# Privacy with Microsoft Defender for Identity

This article describes how Microsoft Defender for Identity collects data in a manner that protects personal privacy.

[!INCLUDE [gdpr-hybrid-note](../includes/gdpr-hybrid-note.md)]

## What data is collected?

Microsoft Defender for Identity monitors information generated from your organization's Active Directory, network activities, and event activities to detect suspicious activity. The monitored activity information enables Defender for Identity to help you determine the validity of each potential threat and correctly triage and respond.

For more information see: [Microsoft Defender for Identity monitored activities](monitored-activities.md).

## Data location

Defender for Identity operates in the Microsoft Azure data centers in the following locations:

- European Union
- United Kingdom
- United States
- Australia
- Switzerland
- Singapore

- India

Customer data collected by the service might be stored as follows:

- Your workspace is automatically created in data center that's geographically closest to your Microsoft Entra ID. Once created, Defender for Identity workspaces can't be moved to another data center. Your workspace's data center is listed in the Microsoft Defender portal, under **Settings** > **Identity** > **About** > **Geolocation**.

- A geographic location as defined by the data storage rules of an online service, if the online service is used by Defender for Identity to process such data.

## Data retention

Data from Microsoft Defender for Identity is retained for 180 days, visible across the portal.  

Your data is kept and is available to you while the license is under grace period or suspended mode. At the end of this period, that data will be erased from Microsoft's systems to make it unrecoverable, no later than 180 days from contract termination or expiration. 

## Data sharing

Defender for Identity shares data, including customer data, among any of the following Microsoft products that are also licensed by the customer:

- Microsoft Defender XDR
- Microsoft Defender for Cloud Apps
- Microsoft Defender for Endpoint
- Microsoft Defender for Cloud
- Microsoft Sentinel
- Microsoft Security Exposure Management (public preview)

## Related content

For more information, see:

- The [Microsoft Service Trust portal](https://www.microsoft.com/en-us/trust-center/product-overview)
- [Licensing and privacy FAQ](technical-faq.yml#licensing-and-privacy)
