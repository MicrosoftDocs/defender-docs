---
title: Microsoft Defender for Office 365 for US Government customers
author: chrisda
ms.author: chrisda
manager: bagol
audience: Admin
ms.topic: overview
ms.localizationpriority: high
search.appverid: 
  - MET150
  - MOE150
ms.assetid:
ms.collection: 
  - m365-security
  - tier1
  - highpri
  - essentials-overview
ms.custom:
description: Learn about the Microsoft Defender for Office 365 for US Government
ms.service: defender-office-365
adobe-target: true
ms.date: 10/13/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Microsoft Defender for Office 365 for US government customers

Microsoft Defender for Office 365 for US Government customers, built in the Azure US Government environment, uses the same underlying technologies as Defender for Microsoft 365 in Azure Commercial.

This offering is available to Microsoft GCC, Microsoft 365 GCC High, and Microsoft 365 DoD customers and is based on the same prevention, detection, investigation, and remediation as the commercial version. However, there are some differences in the availability of capabilities for this offering.

> [!NOTE]
> If you're a GCC customer using Defender for Endpoint in Commercial, see the [Defender for Endpoint documentation](/defender-endpoint/).

## Licensing requirements

Defender for Office 365 for US Government customers requires one of the following Microsoft volume licensing offers:

|GCC|GCC High|DoD|
|-----------------------------------------|-----------------------------------------|-----------------------------------------|
|Microsoft 365 GCC G5|Microsoft 365 E5 for GCC High|Microsoft 365 G5 for DOD|
|Microsoft 365 G5 Security GCC|Microsoft 365 G5 Security for GCC High|Microsoft 365 G5 Security for DOD|
|Standalone Defender for Identity licenses|Standalone Defender for Identity licenses|Standalone Defender for Identity licenses|

## URLs

To access Microsoft Defender for Identity for US Government offerings, use the appropriate addresses in this table:

|US Government offering|Microsoft Defender portal|Sensor (agent) endpoint|
|------------------------|-------------------------------|---------------------------------------------------|
|DoD|`security.microsoft.us`|`<your-workspace-name>sensorapi.atp.azure.us`|
|GCC-H|`security.microsoft.us`|`<your-workspace-name>sensorapi.atp.azure.us`|
|GCC|`security.microsoft.com`|`<your-workspace-name>sensorapi.gcc.atp.azure.com`|

You can also use the IP address ranges in our Azure service tag (**AzureAdvancedThreatProtection**) to enable access to Defender for Identity. For more information about service tags, see [Virtual network service tags](/azure/virtual-network/service-tags-overview) or download [the Azure IP Ranges and Service Tags – US Government Cloud file](https://www.microsoft.com/download/details.aspx?id=57063).