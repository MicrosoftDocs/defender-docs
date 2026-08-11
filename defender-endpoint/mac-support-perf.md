---
title: Troubleshoot performance issues for Microsoft Defender for Endpoint on macOS
description: Troubleshoot performance issues in Microsoft Defender for Endpoint on macOS.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-macos
ms.topic: troubleshooting-general
ms.subservice: macos
ms.date: 08/11/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Individuals

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
---
# Troubleshoot performance issues for Microsoft Defender for Endpoint on macOS



This article provides some general steps that can be used to narrow down performance issues related to Defender for Endpoint on macOS.

Depending on the applications that you're running and your device characteristics, you might experience suboptimal performance when running Microsoft Defender for Endpoint on macOS. In particular, applications or system processes that access many resources over a short timespan can lead to performance issues in Defender for Endpoint on macOS.

> [!WARNING]
> Before you perform the procedures described in this article, identify which security product provides active antivirus protection and confirm the intended Defender enforcement mode. Avoid running overlapping active protection capabilities because they can conflict and affect performance. For more information, see [Microsoft Defender for Endpoint alongside other security solutions](mde-side-by-side.md).

## Troubleshoot performance issues using real-time protection statistics

**Applies to:**

- Only performance issues related to Microsoft Defender Antivirus (`wdavdaemon_unprivileged`).

Real-time protection (RTP) is a feature of Defender for Endpoint on macOS that continuously monitors and protects your device against threats. It consists of file and process monitoring and other heuristics.

Prerequisites:

- Microsoft Defender for Endpoint version (Platform Update) 100.90.70 or newer
- If you have [Tamper protection](tamperprotection-macos.md) turned on in block mode, use [Troubleshooting mode](mac-troubleshoot-mode.md) to capture real-time-protection-statistics. Otherwise, you get null results. 

> [!TIP]
> As a general best practice, it's recommended to update the [Microsoft Defender for Endpoint agent to latest available version](microsoft-defender-endpoint-releases.md#linux-releases) and confirming that the issue still persists before investigating further.

To troubleshoot and mitigate performance issues, follow these steps:

1. Temporarily disable real-time protection by using one of the methods in the following table, and then observe whether performance improves. This approach helps narrow down whether Microsoft Defender Antivirus on macOS is contributing to the performance issues. Record the original setting and restore it immediately after the test.

   | Device management | Method |
   |---|--|
   | Device isn't managed by organization | **User interface**: Open Microsoft Defender for Endpoint on macOS and navigate to **Manage settings**. |
   | Device isn't managed by organization | **Terminal**: In Terminal, run the following command: `mdatp config real-time-protection --value disabled` |
   | Device is managed by organization | See [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md). |
   
   If the performance problem persists while real-time protection is off, the issue isn't limited to antivirus scanning. Continue with [Troubleshoot core or endpoint detection and response performance issues](#troubleshoot-core-or-endpoint-detection-and-response-performance-issues).
   
1. Open Finder and navigate to **Applications** > **Utilities**. Open **Activity Monitor** and analyze which applications are using the resources on your system. Typical examples include software updaters and compilers.

1. This feature requires real-time protection to be enabled. To check the status of real-time protection, run the following command:

   ```bash
   mdatp health --field real_time_protection_enabled
   ```
   
   Verify that the **real_time_protection_enabled** entry is *true*. Otherwise, run the following command to enable it:
   
   ```bash
   mdatp config real-time-protection --value enabled
   ```
   
   ```output
   Configuration property updated
   ```
   
1. To find the applications that are triggering the most scans, you can use real-time statistics gathered by Defender for Endpoint on macOS. Run the following command to enable it:

   ```bash
   mdatp config real-time-protection-statistics --value enabled
   ```
   
   > [!TIP]
   > Before proceeding to capture the data, make sure that the high cpu utilization is occurring in the wdavdaemon_unprivileged by either running top or opening `activity monitor`.

1. To output to a json file, run the following command: 

   ```bash
   mdatp diagnostic real-time-protection-statistics --output json > real_time_protection.json
   ```
   
   > [!NOTE]
   > Using `--output json` (note the double dash) ensures that the output format is ready for parsing. The output of this command shows all processes and their associated scan activity. 
1. On your macOS system, download the sample Python parser `high_cpu_parser.py` using the command:

      ```bash
   curl -O https://raw.githubusercontent.com/microsoft/mdatp-xplat/master/linux/diagnostic/high_cpu_parser.py
   ```

      The output of this command should be similar to the following:

      ```Output
   --2020-11-14 11:27:27-- https://raw.githubusercontent.com/microsoft.
   mdatp-xplat/master/linus/diagnostic/high_cpu_parser.py
   Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.xxx.xxx
   Connecting to raw.githubusercontent.com (raw.githubusercontent.com)| 151.101.xxx.xxx| :443... connected.
   HTTP request sent, awaiting response... 200 OK
   Length: 1020 [text/plain]
   Saving to: 'high_cpu_parser.py'
   100%[===========================================>] 1,020    --.-K/s   in
   0s
   ```

1. Type the following commands:

   ```bash
   chmod +x high_cpu_parser.py
   ```

   ```bash
   cat real_time_protection.json | python high_cpu_parser.py  > real_time_protection.log
   ```

   The output should be a list of the top contributors to performance issues. The first column is the process identifier (PID), the second column is the process name, and the last column is the number of scanned files, sorted by impact. Here's an example:

   ```output
   ... > python ~/repo/mdatp-xplat/linux/diagnostic/high_cpu_parser.py <~Downloads/output.json | head -n 10
   27432 None 76703
   73467 actool     1249
   73914 xcodebuild 1081
   73873 bash 1050
   27475 None 836
   1    launchd    407
   73468 ibtool     344
   549  telemetryd_v1   325
   4764 None 228
   125  CrashPlanService 164
   ```

1. To improve the performance of Defender for Endpoint on macOS, locate the one with the highest number under the **Total files scanned** row, and then add an exclusion for it. For more information, see [Configure and validate exclusions for Defender for Endpoint on macOS](mac-exclusions.md).

   > [!NOTE]
   > The application stores statistics in memory and only keeps track of file activity since it was started and real-time protection was enabled. Processes that were launched before or during periods when real time protection was off aren't counted. Additionally, only events which triggered scans are counted.

1. Configure Microsoft Defender for Endpoint on macOS with exclusions for the processes or disk locations that contribute to the performance issues and re-enable real-time protection. 

   See [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md).

## Troubleshoot performance issues from Behavior Monitoring

See the guide on our support page for [Behavior Monitoring](behavior-monitor-macos.md).

## Troubleshoot core or endpoint detection and response performance issues

Use this workflow when `wdavdaemon` or `wdavdaemon_enterprise` has high resource use, or when the issue continues while real-time protection is disabled.

1. Reproduce the issue and confirm the affected Defender process in **Activity Monitor** or by running `top`.
1. Record the following information:

   - Workload.
   - Start and end times.
   - CPU and memory use.
   - Device model and processor.
   - macOS and Defender versions.
   - Enforcement mode.
   - Other security or monitoring products.

1. Collect hot event sources during the affected period:

   ```bash
   sudo mdatp diagnostic hot-event-sources --time=360
   ```

   The command creates a report that identifies applications and processes producing the most Endpoint Security events. Run the collection only while the issue is occurring.
1. Collect performance data by following the instructions in [Run the client analyzer on macOS and Linux](overview-client-analyzer.md).
1. If another endpoint security product is installed, confirm that the products are configured for the intended coexistence mode. See [Microsoft Defender for Endpoint and other security solutions](mde-side-by-side.md).
1. Contact Microsoft Support and provide the process measurements, hot event source report, Client Analyzer output, and exact time window when you reproduced the issue.

> [!IMPORTANT]
> File, folder, and file extension exclusions don't suppress EDR or other Endpoint Security events. Process exclusions also prevent Network Protection from inspecting traffic or enforcing rules for the excluded process. Don't add broad antivirus exclusions to address `wdavdaemon` or `wdavdaemon_enterprise` resource use unless antivirus scanning is also identified as a contributor.

## Troubleshoot performance issues using Microsoft Defender for Endpoint Client Analyzer

The Microsoft Defender for Endpoint Client Analyzer (MDECA) can collect traces, logs, and diagnostic information in order to troubleshoot performance issues on [onboarded devices](onboard-configure.md) on macOS.

To run the client analyzer for troubleshooting performance issues, see [Run the client analyzer on macOS and Linux](overview-client-analyzer.md).

> [!NOTE]
> The Microsoft Defender for Endpoint Client Analyzer tool is regularly used by Microsoft Customer Support Services (CSS) to collect information such as (but not limited    to) IP addresses, PC names that help troubleshoot issues you might be experiencing with Microsoft Defender for Endpoint. For more information about our privacy statement, see [Microsoft Privacy Statement](https://privacy.microsoft.com/privacystatement).
