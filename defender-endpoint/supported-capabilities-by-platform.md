---
title: Supported Microsoft Defender for Endpoint capabilities by platform
description: Get to know the Microsoft Defender for Endpoint capabilities supported for Windows 10 devices, servers, and non-Windows devices.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 12/02/2024
---

# Supported Microsoft Defender for Endpoint capabilities by platform

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-onboardconfigure-abovefoldlink)

Learn how to [Onboard devices and configure Microsoft Defender for Endpoint capabilities](onboard-configure.md).

The following table gives information about the supported Microsoft Defender for Endpoint capabilities by platform.

|Operating System|Windows 10 & 11|Windows Server 2012 R2 <sup>[1]</sup>, <br> 2016 <sup>[1]</sup>, <br> 2019 & 2022, <br> 1803+|macOS|Linux|
|---|:---:|:---:|:---:|:---:|
|**Prevention**|||||
|[Attack Surface Reduction](attack-surface-reduction.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|![No](media/svg/check-no.svg)|
|[Device Control](device-control-overview.md)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|
|[Firewall](host-firewall-reporting.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|![No](media/svg/check-no.svg)|
|[Network Protection](network-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <sup>[2]</sup>|
|[Next-generation protection](next-generation-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Tamper Protection](prevent-changes-to-security-settings-with-tamper-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|
|[Web Protection](web-protection-overview.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <sup>[2]</sup>|
||||||
|**Detection**|||||
|[Advanced Hunting](/defender-xdr/advanced-hunting-overview)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Custom file indicators](indicator-file.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Custom network indicators](indicator-ip-domain.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <sup>[2]</sup>|
|[EDR Block](edr-in-block-mode.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|![No](media/svg/check-no.svg)|
|[Passive Mode](microsoft-defender-antivirus-compatibility.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|Sense detection sensor|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Endpoint & network device discovery](device-discovery.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <sup>[5]</sup>|![No](media/svg/check-no.svg)|![No](media/svg/check-no.svg)|
|[Vulnerability management](/defender-vulnerability-management/defender-vulnerability-management)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <sup>[6]</sup>|
||||||
|**Response**     |         |         |         ||
|[Automated Investigation & Response (AIR)](automated-investigations.md)        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)  |  ![No](media/svg/check-no.svg)       |  ![No](media/svg/check-no.svg)        |
|[Device response capabilities: collect investigation package ](respond-machine-alerts.md)        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)   |  ![Yes.](media/svg/check-yes.svg) <sup>[3]</sup>       |  ![Yes.](media/svg/check-yes.svg) <sup>[3]</sup>        |
|[Device response capabilities: run antivirus scan](respond-machine-alerts.md)        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)   |  ![Yes.](media/svg/check-yes.svg)        |  ![Yes.](media/svg/check-yes.svg)         |
|[Device isolation](respond-machine-alerts.md)        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)   |  ![Yes.](media/svg/check-yes.svg)       |  ![Yes.](media/svg/check-yes.svg)    |
|File response capabilities: collect file, deep analysis, block file, stop, and quarantine processes        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)   |  ![Yes.](media/svg/check-yes.svg) <sup>[4]</sup> |  ![Yes.](media/svg/check-yes.svg) <sup>[4]</sup> |
|[Live Response](live-response.md)       | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg) |  ![Yes.](media/svg/check-yes.svg)       |  ![Yes.](media/svg/check-yes.svg)      |

<sup>[1]</sup> Refers to the modern, unified solution for Windows Server 2012 R2 and Windows Server 2016. For more information, see [Onboard Windows Servers to the Defender for Endpoint service](configure-server-endpoints.md).

<sup>[2]</sup> Feature is currently in preview ([Microsoft Defender for Endpoint preview features](/defender-xdr/preview)).

<sup>[3]</sup> Feature is currently in preview ([Microsoft Defender for Endpoint preview features](/defender-xdr/preview)). Or you can also use Live Response [2].

<sup>[4]</sup> Collect file only. Or, you can use Live Response [2].

<sup>[5]</sup> Endpoint & network device discovery is supported on Windows Server 2019 or later, Windows 10, and Windows 11.

<sup>[6]</sup>  Microsoft Defender Vulnerability Management is not supported on Rocky and Alma currently.
> [!NOTE]
> Windows 7, 8.1, Windows Server 2008 R2 include support for the EDR sensor, and antivirus using System Center Endpoint Protection (SCEP).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
