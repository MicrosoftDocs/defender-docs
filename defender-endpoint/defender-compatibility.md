---
title: Antivirus solution compatibility with Defender for Endpoint
description: Learn about how Windows Defender works with Microsoft Defender for Endpoint. Also learn how Defender for Endpoint works when a third-party anti-malware client is used.
search.appverid: met150
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.reviewer: yongrhee
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
- mde-ngp
ms.topic: conceptual
ms.date: 02/18/2024
ms.subservice: ngp
---

# Antivirus solution compatibility with Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

The Microsoft Defender for Endpoint agent depends on Microsoft Defender Antivirus for some capabilities such as file scanning.

> [!IMPORTANT]
> Endpoint detection and response (EDR) in Defender for Endpoint does not adhere to the Microsoft Defender Antivirus Exclusions settings.

For optimal protection, configure the following settings for devices that are onboarded to Defender for Endpoint, whether Microsoft Defender Antivirus is the active antimalware solution or not:

- [Security intelligence updates](microsoft-defender-antivirus-updates.md#security-intelligence-updates) (which also updates the scan engine)
- [Platform updates](microsoft-defender-antivirus-updates.md#platform-and-engine-releases)

For more information, see [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md).

If an onboarded device is protected by a non-Microsoft anti-malware client, Microsoft Defender Antivirus goes into [passive mode](microsoft-defender-antivirus-compatibility.md). In this scenario, Microsoft Defender Antivirus continues to receive updates, and the `msmpeng.exe` process is listed as a running a service. But, it doesn't perform real-time protection scans, scheduled scans, or on-demand scans, and doesn't replace the running non-Microsoft antimalware client. The Microsoft Defender Antivirus user interface is disabled. Device users can't use Microsoft Defender Antivirus to perform on-demand scans or configure most options such as Attack Surface Reduction (ASR) rules, Network Protection, Indicators - File/IP address/URL/Certificates allow/block, Web Content Filtering, Controlled Folder Access, and so forth. 

For more information, see the [Microsoft Defender Antivirus and Defender for Endpoint compatibility topic](microsoft-defender-antivirus-compatibility.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
