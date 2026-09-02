---
title: Review the results of Microsoft Defender Antivirus scans
description: Review Microsoft Defender Antivirus scan results and detected threats using the Microsoft Defender portal, Intune, Configuration Manager, PowerShell, WMI, or the Windows Security app.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.custom: nextgen, msecd-doc-authoring-1016
ms.date: 07/02/2026
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
---

# Review Microsoft Defender Antivirus scan results

After a Microsoft Defender Antivirus scan completes, whether it's an [on-demand scan](run-scan-microsoft-defender-antivirus.md) or [scheduled antivirus scan](schedule-antivirus-scans.md), the results are recorded and you can view the results. This article explains how to review scan results, including detected threats and their details, using the Microsoft Defender portal, Microsoft Intune, Configuration Manager, PowerShell, or Windows Management Instrumentation (WMI).

## Prerequisites

### Supported operating systems

The following operating systems are supported:

- Windows

## Use Microsoft Defender to review scan results

To view the scan results using the Defender portal, follow these steps.

1. Sign in to [Microsoft Defender portal](https://security.microsoft.com)

1. Go to **Incidents & alerts** \> **Alerts**.

   You can view the scanned results under **Alerts**.

## Use Microsoft Intune to review scan results

To view the scan results using Microsoft Intune admin center, see <a href="/intune/device-management/reports/overview#antivirus-agent-status-report-organizational" target="_blank">Antivirus agent status report</a> (opens in a new tab in the Intune documentation).

## Use Configuration Manager to review scan results

To view scan results in Configuration Manager, see [How to monitor Endpoint Protection status](/intune/configmgr/protect/deploy-use/monitor-endpoint-protection).

## Use PowerShell cmdlets to review scan results

To review recent threat detections recorded by Microsoft Defender Antivirus, run the following cmdlet. It returns each detection on the endpoint. If there are multiple detections of the same threat, each detection is listed separately, based on the time of each detection:

```PowerShell
Get-MpThreatDetection
```

:::image type="content" source="/defender/media/wdav-get-mpthreatdetection.png" alt-text="The PowerShell cmdlets and outputs" lightbox="/defender/media/wdav-get-mpthreatdetection.png":::

You can specify `-ThreatID` to limit the output to only show the detections for a specific threat.

To list threats currently known to Microsoft Defender Antivirus on the device, with multiple detections of the same threat combined into a single item, use the following cmdlet:

```PowerShell
Get-MpThreat
```

:::image type="content" source="/defender/media/wdav-get-mpthreat.png" alt-text="The PowerShell code" lightbox="/defender/media/wdav-get-mpthreat.png":::

See [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/) for more information on how to use PowerShell with Microsoft Defender Antivirus.

## Use Windows Management Instrumentation (WMI) to review scan results

Use the [**Get** method of the **MSFT_MpThreat** and **MSFT_MpThreatDetection**](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal) classes.

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)

## Related articles

- [Customize, initiate, and review the results of Microsoft Defender Antivirus scans and remediation](customize-run-review-remediate-scans-microsoft-defender-antivirus.md)
- [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)


