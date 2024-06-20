---
title: Overview for how to troubleshoot performance issues for Microsoft Defender for Endpoint on macOS
description: Troubleshoot performance issues overview for Microsoft Defender for Endpoint on macOS.
author: YongRhee-MSFT 
ms.author: yongrhee 
ms.service: defender-endpoint
ms.topic: overview
ms.localizationpriority: medium
ms.date: 05/29/2024
ms.subservice: macos
manager: deniseb
ms.custom: partner-contribution
---

# Overview for how to troubleshoot performance issues for Microsoft Defender for Endpoint on macOS

**Applies to:**

- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)

This article provides general guidelines to identify performance issues related to Microsoft Defender for Endpoint on macOS. See [Troubleshoot performance issues for Microsoft Defender for Endpoint on macOS](mac-support-perf.md) for more specific guidance. 

Depending on the applications that you're running and your device characteristics, you might experience suboptimal performance when running Microsoft Defender for Endpoint on macOS. In particular, applications or system processes that access many resources over a short timespan can lead to performance issues in Microsoft Defender for Endpoint on macOS.

> [!TIP]
> As a general best practice, it is recommended to [update the Microsoft Defender for Endpoint agent to latest available version](/defender-endpoint/mac-whatsnew) and confirming that the issue still persists before investigating further.

> [!CAUTION]
> Running other third-party endpoint protection products alongside Microsoft Defender for Endpoint on MacOS is likely to lead to performance problems and unpredictable side effects. If non-Microsoft endpoint protection is an absolute requirement in your environment, you can configure Microsoft Defender Antivirus to run in **[Passive mode](mac-preferences.md)**. After you configure Passive mode, you can use Defender for Endpoint on Mac EDR functionality.

> [!WARNING]
> Before starting, make sure that other security products are not currently running on the device. Multiple security products might conflict and impact system performance.

> [!TIP]
> If you're running other third-party security products, make sure that the Microsoft Defender for Endpoint on macOS processes and paths are excluded from that 3rd party security product and that security product is excluded from Microsoft Defender for Endpoint on macOS.  And vice-versa.
When troubleshooting performance issues for Microsoft Defender for Endpoint on macOS, you should review the **Activity Monitor** or run **top** to see which of the three (3) processes is leading the high cpu utilization

|Daemon name|Component|Troubleshooting guide|
| -------- | -------- |-------- |
|wdavdaemon| Core (privileged)|Open a [Microsoft support case](contact-support.md).|
|wdavdaemon_unprivileged| Antimalware (AV, EPP)|Review [Troubleshoot performance issues for Microsoft Defender for Endpoint on macOS](mac-support-perf.md).|
|wdavdaemon_enterprise| Endpoint Detection and Response (EDR)|Open a [Microsoft support case](contact-support.md).|

Additionally, gather [Defender for Endpoint Client Analyzer](run-analyzer-macos-linux.md) files while the issue occurs. This will be used by the support team to investigate the issue. 

