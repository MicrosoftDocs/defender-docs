---
title: Schedule antivirus scans using Microsoft Intune
description: Configure scheduled Microsoft Defender Antivirus scans with Microsoft Intune, including daily and weekly scan settings and deployment guidance for managed Windows devices.
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: how-to
ms.custom: nextgen, msecd-doc-authoring-1016
ms.collection: 
- m365-security
- tier2
- mde-ngp
ms.date: 07/02/2026
ms.subservice: ngp
ms.localizationpriority: medium
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus
ai-usage: ai-assisted
---

# Schedule antivirus scans using Microsoft Intune

You can use Microsoft Intune to schedule Microsoft Defender Antivirus scans on managed Windows devices. This article shows you how to create a scan policy, set up daily and weekly quick scans, and change settings like CPU throttling and catchup scans. These steps are for IT admins who use Intune to keep scan coverage consistent across their devices. To learn more about scan types, see [About scheduled quick or full Microsoft Defender Antivirus scans](schedule-antivirus-scans.md).

## Prerequisites

Before you configure scheduled antivirus scans in Intune, make sure your devices meet the following requirements.

### Supported operating systems

Scheduled antivirus scans through Intune are supported on the following operating systems:

- Windows
- Windows Server

## Configure antivirus scans using Intune

To configure antivirus scans by using Intune, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus
- **Basics**: Enter a name and description for the policy.
- **Configuration settings**: Expand each group of settings, and configure the settings you want to manage with this policy. For more information about these settings, see [Policy CSP - Defender](/windows/client-management/mdm/policy-csp-defender).
- **Scope tags**: If your organization is using [scope tags](/intune/intune-service/fundamentals/scope-tags), select the tags you want to use.
- **Assignments**: Select the users or groups to receive this policy. For more information, see [Assign policies in Microsoft Intune](/intune/intune-service/configuration/device-profile-assign).

For more information about Intune antivirus endpoint security policies, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy).

## Use Intune for scheduling daily quick scans

Use the following setting to schedule a daily quick scan in Intune:

| Description|Setting|
| -------- | -------- |
|Schedule Quick Scan Time|720|

> [!NOTE]
> In the daily quick scan example, a quick scan runs on the Windows clients at 12:00 PM (720). The scan is scheduled at lunch time because many devices are turned off after hours (for example, laptops).

## Use Intune for scheduling Weekly Scan (Quick or Full)

The following example settings schedule a weekly quick or full scan in Intune:

|  Description|Setting|
| -------- | -------- |
|Scan Parameter |Quick scan (Default) |
|Schedule Scan Day|Windows Clients: Wednesday<br>|
|Schedule Scan Time|Windows Clients: 1020 <br>|

> [!NOTE]
> In this example, a quick scan runs for Windows clients on Wednesdays at 5:00 PM. (1020).

> [!TIP]
> Our recommendation for scheduled scans is to configure quick scan together with always-on real-time protection and [cloud protection](cloud-protection-microsoft-defender-antivirus.md), as this combination provides strong coverage against malware that starts with the system and kernel-level malware. Quick scan with always-on real-time protection and cloud protection is the default configuration. In general, there's no need to schedule a full scan, and most users never need to manually run full scans (see [Comparing quick scan, full scan, and custom scan](schedule-antivirus-scans.md)).

<a name="general-settings-for-scheduled-scan-to-consider"></a>
## Configure general settings for scheduled scans

Review the following general scheduled-scan settings when configuring your policy:

|Description| Setting|
| -------- | -------- |
|Check For Signatures Before Running Scan |Disabled (Default)|
|Randomize Schedule Task Times|Not configured|
|Scheduler Randomization Time|Scheduled tasks aren't randomized|
|Avg CPU Load Factor|Not Configured (Default, 50)|
|Enable Low CPU Priority|Disabled (Default)|
|Disable Catchup Full Scan|Enabled (Default)|
|Disable Catchup Quick Scan|Disabled (Default)|

> [!NOTE]
> When you schedule scans for times when endpoints aren't in use, scans don't honor the CPU throttling configuration and takes full advantage of the resources available to complete the scan as fast as possible.

<a name="see-also"></a>
## See also

- [Troubleshoot Microsoft Defender Antivirus scan issues](troubleshoot-mdav-scan-issues.md)

- [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md)

- [Troubleshoot performance issues related to real-time protection](troubleshoot-performance-issues.md)

- [Run the client analyzer on Windows](run-analyzer-windows.md)

- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)

- [Microsoft Defender Antivirus full scan considerations and best practices](mdav-scan-best-practices.md)

