---
title: Schedule antivirus scans using Microsoft Intune
description: Schedule antivirus scans using Intune
author: emmwalshh
ms.author: ewalsh
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: how-to
ms.custom: nextgen
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
ms.date: 04/30/2025
ms.subservice: ngp
ms.localizationpriority: medium
---

# Schedule antivirus scans using Microsoft Intune

**Applies to:**

- [Microsoft Defender XDR](/defender-xdr)

- [Microsoft Defender for Endpoint Plan 1 and Plan 2](microsoft-defender-endpoint.md)

- Microsoft Defender for Business
- Microsoft Defender Antivirus

**Platforms**

- Windows
- Windows Server

This article describes how to configure scheduled scans using Microsoft Intune. To learn more about scheduling scans and about scan types, see [Configure scheduled quick or full Microsoft Defender Antivirus scans](schedule-antivirus-scans.md). 

## Configure antivirus scans using Intune

1. In the [Intune admin center](https://intune.microsoft.com/), go to **Endpoint security** > **Antivirus** > **Create Policy**. For **Platform**, select **Windows**, and for **Profile**, select **Microsoft Defender Antivirus**. Then select **Create**.

2. On the **Basics** page, specify a name and description for the policy, and then choose **Next**.

3. On the **Configuration settings** page, expand each group of settings, and configure the settings you want to manage with this policy. For more information about these settings, see [Policy CSP - Defender](/windows/client-management/mdm/policy-csp-defender).

   When you're done configuring settings, select **Next**.

4. On the **Scope tags** page, you can either use the default setting, or search for scope tags to assign to the policy. For more information, see [Use role-based access control (RBAC) and scope tags for distributed IT](/intune/intune-service/fundamentals/scope-tags). 

   When you're done specifying scope tags, select **Next**.

5. On the **Assignments** page, select the users or groups to receive this policy. For more information, see [Assign policies in Microsoft Intune](/intune/intune-service/configuration/device-profile-assign). 

   When you're done Then select **Next**.

6. On the **Review + create**, review your settings. When you select **Save**, your changes are saved, and the policy is created and applied. 

For more information: [Antivirus policy for endpoint security in Intune ](/intune/intune-service/protect/endpoint-security-antivirus-policy)

## Use Intune for scheduling daily quick scans

| Description|Setting|
| -------- | -------- |
|Schedule Quick Scan Time|720|

> [!NOTE]
> In this example, a quick scan runs daily on the Windows clients at 12:00 PM. (720). In this example, we use lunch time, since many devices nowadays are turned off after-hours (e.g laptops).

## Use Intune for scheduling Weekly Scan (Quick or Full)

|  Description|Setting|
| -------- | -------- |
|Scan Parameter |Quick scan (Default) |
|Schedule Scan Day|Windows Clients: Wednesday<br>|
|Schedule Scan Time|Windows Clients: 1020 <br>|

> [!NOTE]
> In this example, a quick scan runs for Windows clients on Wednesdays at 5:00 PM. (1020).

> [!TIP]
> Our recommendation for scheduled scans is to configure quick scan together with always-on real-time protection and [cloud protection](/defender-endpoint/cloud-protection-microsoft-defender-antivirus), as this combination provides strong coverage against malware that starts with the system and kernel-level malware. This configuration is the default configuration. In general, there's no need to schedule a full scan, and most users never need to manually run full scans (see [Comparing quick scan, full scan, and custom scan](/defender-endpoint/schedule-antivirus-scans)).

## General settings for Scheduled scan to consider:

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

### See also

- [Troubleshoot Microsoft Defender Antivirus scan issues](/defender-endpoint/troubleshoot-mdav-scan-issues)

- [Troubleshoot Microsoft Defender Antivirus settings](/defender-endpoint/troubleshoot-settings)

- [Troubleshoot performance issues related to real-time protection](/defender-endpoint/troubleshoot-performance-issues)

- [Run the client analyzer on Windows](/defender-endpoint/run-analyzer-windows)

- [Performance analyzer for Microsoft Defender Antivirus](/defender-endpoint/tune-performance-defender-antivirus)

- [Microsoft Defender Antivirus full scan considerations and best practices](/defender-endpoint/mdav-scan-best-practices)

