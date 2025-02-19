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
ms.date: 02/04/2025
---

# Supported Microsoft Defender for Endpoint capabilities by platform

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1 and Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Learn how to [Onboard devices and configure Microsoft Defender for Endpoint capabilities](onboard-configure.md).

The following table gives information about the supported Microsoft Defender for Endpoint capabilities by platform.

|Operating System|Windows 10 & 11|Windows Server |macOS|Linux|
|---|:---:|:---:|:---:|:---:|
|**Prevention**|||||
|[Attack Surface Reduction](attack-surface-reduction.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|![No](media/svg/check-no.svg)|
|[Device Control](device-control-overview.md)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|
|[Firewall](host-firewall-reporting.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|![No](media/svg/check-no.svg)|
|[Network Protection](network-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)<br/>(preview)|
|[Next-generation protection](next-generation-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Tamper Protection](prevent-changes-to-security-settings-with-tamper-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|
|[Web Protection](web-protection-overview.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <br/>(preview)|
|**Detection**|||||
|[Advanced Hunting](/defender-xdr/advanced-hunting-overview)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Custom file indicators](indicator-file.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Custom network indicators](indicator-ip-domain.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <br/>(preview)|
|[EDR Block](edr-in-block-mode.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![No](media/svg/check-no.svg)|![No](media/svg/check-no.svg)|
|[Passive Mode](microsoft-defender-antivirus-compatibility.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|Sense detection sensor|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Endpoint & network device discovery](device-discovery.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <br/>(See note below) |![No](media/svg/check-no.svg)|![No](media/svg/check-no.svg)|
|[Vulnerability management](/defender-vulnerability-management/defender-vulnerability-management)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <br/>(preview)|
|**Response**     |         |         |         ||
|[Automated Investigation & Response (AIR)](automated-investigations.md)        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)  |  ![No](media/svg/check-no.svg)       |  ![No](media/svg/check-no.svg)        |
|[Device response capabilities: collect investigation package ](respond-machine-alerts.md)        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)   |  ![Yes.](media/svg/check-yes.svg) <br/>(preview)  |  ![Yes.](media/svg/check-yes.svg) <br/>(preview) |
|[Device response capabilities: run antivirus scan](respond-machine-alerts.md)        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)   |  ![Yes.](media/svg/check-yes.svg)        |  ![Yes.](media/svg/check-yes.svg)         |
|[Device isolation](respond-machine-alerts.md)        | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)   |  ![Yes.](media/svg/check-yes.svg)       |  ![Yes.](media/svg/check-yes.svg)    |
|File response capabilities: collect file, deep analysis, block file, stop, and quarantine processes  | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg)   |  ![Yes.](media/svg/check-yes.svg) <br/>(preview) |  ![Yes.](media/svg/check-yes.svg) <br/>(preview) |
|[Live Response](live-response.md)       | ![Yes.](media/svg/check-yes.svg)        | ![Yes.](media/svg/check-yes.svg) |  ![Yes.](media/svg/check-yes.svg)       |  ![Yes.](media/svg/check-yes.svg)      |

> [!NOTE]
> - Support for Windows Server 2025 is rolling out beginning in February 2025 and over the next several weeks.
> - For Windows Server 2012 R2 and Windows Server 2016, use the modern, unified solution. See [Onboard Windows Servers to the Defender for Endpoint service](configure-server-endpoints.md).
> - On Linux Server, network protection, web protection, and custom network indicators are currently in preview.
> - On Linux Server and Mac, [Device response capabilities: collect investigation package ](respond-machine-alerts.md) is currently in preview. You can also use [Live Response](live-response.md).
> - On Linux Server and Mac, [File response capabilities: collect file, deep analysis, block file, stop, and quarantine processes](respond-file-alerts.md) are currently in preview. You can also use [Live Response](live-response.md).
> - Endpoint & network device discovery is supported on Windows Server 2019 or later, and on Windows 10 and Windows 11.
> - Microsoft Defender Vulnerability Management is not supported on Rocky and Alma currently.
> - For Windows 7, Windows 8.1, and Windows Server 2008 R2, use System Center Endpoint Protection (SCEP) for the EDR sensor and antivirus protection.

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
