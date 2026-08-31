---
title: Schedule antivirus scans using Microsoft Intune
description: Configure scheduled Microsoft Defender Antivirus scans in Intune, including daily and weekly schedules, CPU usage, and catch-up scans for Windows devices.
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: how-to
ms.custom: nextgen, msecd-doc-authoring-1015
ms.collection:
- m365-security
- tier2
- mde-ngp
ms.date: 08/21/2026
ms.subservice: ngp
ms.localizationpriority: medium
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to schedule Microsoft Defender Antivirus scans in Intune so that managed Windows devices receive consistent scan coverage.
---

# Schedule antivirus scans using Microsoft Intune

Security administrators can use Microsoft Intune to schedule Microsoft Defender Antivirus scans on managed Windows devices. This article explains how to create an antivirus policy, schedule daily and weekly scans, and configure CPU usage and catch-up scan settings. For guidance on choosing a scan type, see [About scheduled quick or full Microsoft Defender Antivirus scans](schedule-antivirus-scans.md).

## Prerequisites

Before you configure scheduled antivirus scans in Intune, verify that your devices use a supported operating system.

### Supported operating systems

Intune supports scheduled antivirus scans on the following operating systems:

- Windows
- Windows Server

## Configure antivirus scans using Intune

Create an antivirus policy by following <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). Use the following settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus
- **Basics**: Enter a name and description for the policy.
- **Configuration settings**: Expand each group of settings, and configure the settings you want to manage with this policy. For more information about these settings, see [Configure Microsoft Defender Antivirus using Microsoft Intune](use-intune-config-manager-microsoft-defender-antivirus.md).
- **Scope tags**: If your organization uses [scope tags](/intune/intune-service/fundamentals/scope-tags), select the tags you want to use.
- **Assignments**: Select the users or groups to receive this policy. For more information, see [Assign policies in Microsoft Intune](/intune/intune-service/configuration/device-profile-assign).

For more information, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy).

<a name="use-intune-for-scheduling-daily-quick-scans"></a>

## Schedule daily quick scans using Intune

Use the following Intune setting to schedule a daily quick scan on Windows devices:

- **Setting**: **Schedule Quick Scan Time**
- **Values**:
  - :::image type="icon" source="media/toggle-off.png" border="false"::: **Not Configured**
  - :::image type="icon" source="media/toggle-on.png" border="false"::: **Configured**
    - Enter a time of day from **0** (12:00 AM) through **1380** (11:00 PM). The default value is **120** (2:00 AM).

For example, a value of **720** schedules the daily quick scan for 12:00 PM.

<a name="use-intune-for-scheduling-weekly-scan-quick-or-full"></a>

## Schedule weekly quick or full scans using Intune

Use the following Intune settings to schedule a weekly quick or full scan on Windows devices:

- **Setting**: **Scan parameter**
- **Values**:
  - **Not configured**
  - **Quick scan (Default)**
  - **Full scan**

- **Setting**: **Schedule Scan Day**
- **Values**:
  - **Not configured**
  - **Every day (Default)**
  - **Sunday** to **Saturday**
  - **No scheduled scan**

- **Setting**: **Schedule Scan Time**
- **Values**:
  - :::image type="icon" source="media/toggle-off.png" border="false"::: **Not Configured**
  - :::image type="icon" source="media/toggle-on.png" border="false"::: **Configured**
    - Enter a time of day from **0** (12:00 AM) through **1380** (11:00 PM). The default value is **120** (2:00 AM).

The following example schedules a quick scan on Windows devices every Wednesday at 5:00 PM (**1020**):

|Setting|Value|
|---|---|
|Scan parameter|Quick scan (Default)|
|Schedule Scan Day|Wednesday|
|Schedule Scan Time|:::image type="icon" source="media/toggle-on.png" border="false"::: **Configured**<br>**1020**|

> [!TIP]
> Microsoft recommends using quick scans with always-on real-time protection and [cloud protection](cloud-protection-microsoft-defender-antivirus.md). This combination provides strong coverage against malware that starts with the system and kernel-level malware. Quick scans with always-on real-time protection and cloud protection are the default configuration.
>
> In general, you don't need to schedule a full scan, and most users never need to run full scans manually. For more information, see [Comparing quick scan, full scan, and custom scan](schedule-antivirus-scans.md).

<a name="general-settings-for-scheduled-scan-to-consider"></a>
## Configure general settings for scheduled scans

Review the following general scheduled-scan settings when you configure the policy:

- **Setting**: **Check For Signatures Before Running Scan**
- **Values**:
  - **Not configured**
  - **Disabled (Default)**
  - **Enabled** (recommended)

- **Setting**: **Randomize Schedule Task Times**
- **Values**:
  - **Not configured**
  - **Widen or narrow the randomization period for scheduled scans (Default)** (use **Scheduler Randomization Time** to set the randomization window)
  - **Scheduled tasks will not be randomized** (recommended)

- **Setting**: **Scheduler Randomization Time**
- **Values**:
  - :::image type="icon" source="media/toggle-off.png" border="false"::: **Not Configured** (recommended)
  - :::image type="icon" source="media/toggle-on.png" border="false"::: **Configured**
    - Enter a value between **1** and **23** hours. The default value is **4** hours.

- **Setting**: **Avg CPU Load Factor**
- **Values**:
  - :::image type="icon" source="media/toggle-off.png" border="false"::: **Not Configured** (recommended)
  - :::image type="icon" source="media/toggle-on.png" border="false"::: **Configured**
    - Enter a percentage from **0** to **100**. The default value is **50**.

- **Setting**: **Enable Low CPU Priority**
- **Values**:
  - **Not configured**
  - **Disabled (Default)** (recommended)
  - **Enabled**

- **Setting**: **Disable Catchup Full Scan**
- **Values**:
  - **Not configured**
  - **Disabled** (enables catch-up full scans)
  - **Enabled (Default)** (disables catch-up full scans and matches the Microsoft Defender Antivirus client default)

- **Setting**: **Disable Catchup Quick Scan**
- **Values**:
  - **Not configured**
  - **Disabled** (enables catch-up quick scans)
  - **Enabled (Default)** (disables catch-up quick scans and matches the Microsoft Defender Antivirus client default)

## Related content

- [Troubleshoot Microsoft Defender Antivirus scan issues](troubleshoot-mdav-scan-issues.md)
- [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md)
- [Troubleshoot performance issues related to real-time protection](troubleshoot-performance-issues.md)
- [Run the client analyzer on Windows](run-analyzer-windows.md)
- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
- [Microsoft Defender Antivirus full scan considerations and best practices](mdav-scan-best-practices.md)
