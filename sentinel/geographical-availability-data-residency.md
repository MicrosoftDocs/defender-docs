---
title: Geographical availability and data residency in Microsoft Sentinel
description: Learn about privacy, data residency, and geographical availability in Microsoft Sentinel.
ms.author: guywild
author: guywi-ms
ms.reviewer: noak
ms.topic: concept-article
ms.date: 05/28/2026
ms.custom: references_regions


#Customer intent: As a compliance officer or a security operator setting up Microsoft Sentinel, I want to understand the geographical availability and data residency of Microsoft Sentinel so that I can ensure our data meets regional compliance requirements.

---

# Geographical availability and data residency in Microsoft Sentinel

After your data is collected, stored, and processed, compliance can become an important design requirement, with a significant impact on your Microsoft Sentinel architecture. Having the ability to validate and prove who has access to what data under all conditions is a critical data sovereignty requirement in many countries and regions, and assessing risks and getting insights in Microsoft Sentinel workflows is a priority for many customers.

This article can help you meet compliance requirements by describing where Microsoft Sentinel data is stored.

[!INCLUDE [azure-21vianet-retirement](includes/azure-21vianet-retirement.md)]

## Collected data

Microsoft Sentinel collects the following types of data:

- **Raw data**, such as event data collected from connected Microsoft services and partner systems. Data from multiple clouds and sources are streamed to the customer’s Azure Log Analytics workspace associated with Microsoft Sentinel, under the customer’s tenant’s subscription. This approach gives the customer the ability to choose region and retention and deletion policies.
- **Processed data**, such as incidents, alerts, behaviors, and so on.
- **Configuration data**, such as connector settings, rules, and so on.

## Data storage location

Microsoft Sentinel stores data used by the service, including customer data, in the same region as the associated Azure Log Analytics workspace. For more information, see [Supported regions](#supported-regions).

Microsoft Sentinel processes data in one of the following locations:

- For Log Analytics workspaces located in Europe, Microsoft Sentinel processes customer data in Europe.
- For Log Analytics workspaces located in Israel, Microsoft Sentinel processes customer data in Israel.
- For Log Analytics workspaces located in any of the China 21Vianet regions, Microsoft Sentinel processes customer data in China 21Vianet.
- For workspaces located in any other location, Microsoft Sentinel processes customer data in a US region.

When you onboard Microsoft Sentinel from the Defender portal, the service might process data in the destination regions specified during onboarding, or in the existing Microsoft Defender XDR regions if applicable. The raw data storage location, however, remains unchanged. For more information, see [Data security and retention in Microsoft Defender XDR](/defender-xdr/data-privacy).
 
### Supported regions

The following table shows the supported regions supporting Microsoft Sentinel SIEM and data lake.

| Continent | Country/Region | SIEM supported region | Data lake supported region |
|---------|---------|---------|---------|
| **North America**| **Canada** | • Canada Central<br>• Canada East | • Canada Central |
| |   **United States** | • Central US<br>• East US<br>• East US 2<br>• East US 2 EUAP<br>• North Central US<br>• South Central US<br>• West US<br>• West US 2<br>• West US 3<br>• West Central US<br><br>**Azure government** <br>• USGov Arizona<br>• USGov Virginia<br>• USNat East<br>• USNat West<br>• USSec East<br>• USSec West| • Central US<br>• East US<br>• East US 2<br>• South Central US<br>• West US 2 |
|**South America** | **Brazil** | • Brazil South<br>• Brazil Southeast |
|**Asia and Middle East** | |• East Asia<br>• Southeast Asia | • Southeast Asia |
| | **China 21Vianet**| • China East 2<br>• China North 3|
| | **India**| • Central India<br>• Jio India West<br>• Jio India Central| • Central India |
| | **Israel** | • Israel Central | • Israel Central |
| | **Japan** | • Japan East<br>• Japan West| • Japan East |
| | **Korea**| • Korea Central<br>• Korea South| 
| | **Qatar** | • Qatar Central|
| | **UAE**| • UAE Central<br>• UAE North        |
|**Europe**| | • North Europe<br>• West Europe| • North Europe<br>• West Europe |
| |**France**| • France Central<br>• France South| • France Central |
| |**Germany**| • Germany West Central|
| | **Italy** |• Italy North|• Italy North|
| | **Norway**|• Norway East<br>• Norway West|
| |**Sweden**| • Sweden Central | 
| | **Switzerland**| • Switzerland North<br>• Switzerland West| • Switzerland North |
| | **UK**| • UK South<br>• UK West | • UK South |
|**Australia** | **Australia**| • Australia Central<br>Australia Central 2<br>• Australia East<br>• Australia Southeast	|  • Australia East |
|**Africa** | **South Africa**| • South Africa North |


> [!IMPORTANT]
> Microsoft Sentinel data lake must be deployed in the same Azure region as the associated primary Sentinel workspace.

## Data retention

Data from Microsoft Sentinel is retained until the earliest of the following dates:

- The customer [removes Microsoft Sentinel from their workspace](offboard.md)
- As per a retention policy set by the customer

Until that time, customers can always delete their data.

Customer data is kept and is available while the license is under a grace period or in suspended mode. At the end of this period, and no later than 90 days from contract termination or expiration, the data is erased from Microsoft's systems to make it unrecoverable.

## Data sharing for Microsoft Sentinel

Microsoft Sentinel may share data, including customer data, among the following Microsoft products:

- Microsoft Defender XDR
- Azure Log Analytics
- Security Copilot

## Related content

For more information, see:

- Details about [Azure regions](/azure/azure-monitor/logs/workspace-design#azure-regions?toc=/azure/sentinel/TOC.json&bc=/azure/sentinel/breadcrumb/toc.json), useful when designing your workspace architecture.
- [Business continuity and disaster recovery for Microsoft Sentinel](business-continuity-disaster-recovery.md)
