---
title: Supported Microsoft Defender for Endpoint capabilities by platform
description: Get to know the Microsoft Defender for Endpoint capabilities supported for Windows 10 devices, servers, and non-Windows devices.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: pahuijbr
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
ms.topic: article
ms.subservice: onboard
ms.date: 11/17/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Supported Microsoft Defender for Endpoint capabilities by platform

Learn how to [Onboard devices and configure Microsoft Defender for Endpoint capabilities](onboard-configure.md).

## Supported capabilities by platform

The following table gives information about the supported Microsoft Defender for Endpoint capabilities by platform.

|Operating System|Windows 10 & 11|Windows Server|macOS|Linux|
|---|:---:|:---:|:---:|:---:|
|**Prevention**|||||
|[Attack Surface Reduction](attack-surface-reduction.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|||
|[Device Control](device-control-overview.md)|![Yes.](media/svg/check-yes.svg)||![Yes.](media/svg/check-yes.svg)||
|[Firewall](host-firewall-reporting.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|||
|[Network Protection](network-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)<br/>(preview)|
|[Next-generation protection](next-generation-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Tamper Protection](prevent-changes-to-security-settings-with-tamper-protection.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)||
|[Web Protection](web-protection-overview.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <br/>(preview)|
|**Detection**|||||
|[Advanced Hunting](/defender-xdr/advanced-hunting-overview)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Custom file indicators](indicator-file.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Custom network indicators](indicator-ip-domain.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <br/>(preview)|
|[EDR Block](edr-in-block-mode.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|||
|[Passive Mode](microsoft-defender-antivirus-compatibility.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|Sense detection sensor|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Endpoint & network device discovery](device-discovery.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <br/> (See note below)|||
|[Vulnerability management](/defender-vulnerability-management/defender-vulnerability-management)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg) <br/>|
|**Response**|||||
|[Automated Investigation & Response (AIR)](automated-investigations.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|||
|[Device response capabilities: collect investigation package ](respond-machine-alerts.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Device response capabilities: run antivirus scan](respond-machine-alerts.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[Device isolation](respond-machine-alerts.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[File response capabilities: collect file, deep analysis](respond-file-alerts.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|
|[File response capabilities: block file, stop, and quarantine processes](respond-file-alerts.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|||
|[Live Response](live-response.md)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|![Yes.](media/svg/check-yes.svg)|

> [!NOTE]
>
> - For Windows Server 2012 R2 and Windows Server 2016, use the modern, unified solution. See [Onboard Windows Servers to the Defender for Endpoint service](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).
> - On Linux Server, network protection, web protection, and custom network indicators are currently in preview.
> - On Linux, network protection, web protection, and custom network indicators are currently in preview.
> - Endpoint & network device discovery is supported on Windows Server 2019 or later, and on Windows 10 and Windows 11.
> - For Windows 7, Windows 8.1, and Windows Server 2008 R2, use [MMA](onboard-downlevel.md#install-and-configure-microsoft-monitoring-agent-mma) for the EDR sensor and [System Center Endpoint Protection](onboard-downlevel.md#configure-and-update-system-center-endpoint-protection-clients) (SCEP) for antivirus protection.
> - For Windows 7 SP1 and Windows Server 2008 R2 SP1, you can also use [Microsoft Defender endpoint security solution (preview)](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security) supplied by the [Defender deployment tool (preview)](./defender-deployment-tool-windows.md).
