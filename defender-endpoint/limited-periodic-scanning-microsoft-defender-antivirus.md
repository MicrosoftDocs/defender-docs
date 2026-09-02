---
title: Enable the limited periodic Microsoft Defender Antivirus scanning feature
description: Enable limited periodic scanning on Windows 10 or Windows 11 so Microsoft Defender Antivirus can check for threats alongside another installed antivirus product. Includes important limitations for enterprise use.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1016
ms.date: 07/02/2026
ms.reviewer: yongrhee
ms.subservice: ngp
ms.collection: 
- m365-security
- tier3
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
  - Microsoft Defender for Individual

ai-usage: ai-assisted
---
# Use limited periodic scanning in Microsoft Defender Antivirus

## Overview

> [!NOTE]  
> **Microsoft does not support this feature in enterprise settings.** This feature uses only a small part of Microsoft Defender Antivirus to find threats. It can't detect most malware or unwanted software. You can't manage this feature or control it through policies. Reporting is also limited. Microsoft recommends that enterprises pick one antivirus product and use it alone. 

Limited periodic scanning is a threat detection mode that works when another antivirus product is installed on a Windows 10 or Windows 11 device. You can turn it on only in certain cases. This article covers the prerequisites and steps to enable limited periodic scanning on your device. For more information, see [Microsoft Defender Antivirus compatibility](microsoft-defender-antivirus-compatibility.md).

## Prerequisites

Before you enable limited periodic scanning, make sure your device meets the following requirements.

### Supported operating systems

Limited periodic scanning is supported on the following operating systems:

- Windows

## How to enable limited periodic scanning

By default, Microsoft Defender Antivirus turns on when no other antivirus product is installed on a Windows 10 or Windows 11 device. It also turns on if the other product is out-of-date, expired, or not working. When Microsoft Defender Antivirus is on, you can configure it as usual on that device:

:::image type="content" source="media/vtp-wdav.png" alt-text="The Windows Security app showing Microsoft Defender Antivirus options, including scan options, settings, and update options" lightbox="media/vtp-wdav.png":::

If another antivirus product is installed and working, Microsoft Defender Antivirus turns itself off. The Windows Security app then shows the status of the other antivirus product in the **Virus & threat protection** section. It also provides a link to that product's settings.

Below the non-Microsoft antivirus product name, select **Microsoft Defender Antivirus options**. Turn on the toggle to enable limited periodic scanning. When you slide the switch to **On**, the standard Microsoft Defender Antivirus options appear below the other product. The limited periodic scanning option is at the bottom of the page.

## Related articles

For more information about configuring and using Microsoft Defender Antivirus, see the following articles:

- [Configure behavioral, heuristic, and real-time protection](configure-protection-features-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)


