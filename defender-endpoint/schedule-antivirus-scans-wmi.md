---
title: Schedule antivirus scans using Windows Management Instrumentation
description: Schedule antivirus scans using WMI
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1014
ms.date: 06/16/2026
ms.reviewer: pauhijbr, ksarens, yongrhee
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier3
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
---
# Schedule antivirus scans using Windows Management Instrumentation (WMI)


This article describes how to configure scheduled Microsoft Defender Antivirus scans using Windows Management Instrumentation (WMI). WMI is useful for administrators who manage scan schedules programmatically or in environments where Group Policy isn't available. You'll learn how to set scan timing, configure idle-only scans, schedule remediation, and define daily quick scan times. To learn more about scheduling scans and about scan types, see [Configure scheduled quick or full Microsoft Defender Antivirus scans](schedule-antivirus-scans.md).

## Prerequisites

### Supported operating systems

WMI-based scan scheduling is supported on the following operating systems:

- Windows
- Windows Server

## Use Windows Management Instrumentation (WMI) to schedule scans

Use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class for the following properties:

The following WMI properties control scan scheduling and behavior in the Defender configuration class:

```WMI
ScanParameters
ScanScheduleDay
ScanScheduleTime
RandomizeScheduleTaskTimes
```

For more information and allowed parameters, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal)

## WMI for scheduling scans when an endpoint isn't in use

Use the [Set method of the MSFT_MpPreference class](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) for the following properties:

The following WMI property controls whether scans run only when the device is idle:

```WMI
ScanOnlyIfIdleEnabled
```

For more information about APIs and allowed parameters, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

> [!NOTE]
> When you schedule scans for times when endpoints aren't in use, scans don't honor the CPU throttling configuration and will take full advantage of the resources available to complete the scan as fast as possible.


## WMI for scheduling scans to complete remediation

Use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class for the following properties:

The following WMI properties define the remediation schedule day and time:

```WMI
RemediationScheduleDay
RemediationScheduleTime
```

For more information and allowed parameters, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

## WMI for scheduling daily scans

Use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class for the following properties:

Use this WMI property to specify the scheduled daily quick scan time:

```WMI
ScanScheduleQuickScanTime
```

For more information and allowed parameters, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)


