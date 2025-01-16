---
title: Troubleshoot performance issues
description: Troubleshoot high CPU usage related to the real-time protection service in Microsoft Defender for Endpoint.
search.appverid: met150
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: deniseb
ms.date: 01/13/2025
audience: ITPro
ms.topic: troubleshooting
ms.subservice: ngp
ms.collection: 
- m365-security
- tier3
- mde-ngp
---

# Troubleshoot performance issues related to real-time protection

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1 and 2](microsoft-defender-endpoint.md)
- Microsoft Defender Antivirus

**Platforms**
- Windows
- Windows Server

If your system is having high CPU usage or performance issues related to the Microsoft Defender Antivirus (Antimalware Service Executable, MsMpEng.exe, Microsoft Defender Antivirus).

As an admin, you can also troubleshoot these issues on your own.

First, you might want to check if other software is causing the issue. Read [Check with the vendor for known issues with antivirus exclusions](#check-with-the-vendor-for-known-issues-with-antivirus-products).

## Common reasons for higher CPU utilization by Microsoft Defender Antivirus

| Reason | Solution |
| -------- | -------- |
|1: **Binaries not signed** (`.exe`, `.dll`, `.ps1`, and so on) <br/>Anytime that a binary (such as `.exe`, `.dll`, `.ps1`, and so on) is launched/started, if it's not digitally signed, Microsoft Defender Antivirus starts a real-time protection scan, scheduled scan, and/or on-demand scan. | You all should consider signing (Extended code validation (EV) code signing or using internal PKI) the binaries. And/or reaching out to the vendor so they could sign the binary (EV code signing). <br/><br/>We recommend that software vendors follow the various guidelines in [Partnering with the industry to minimize false positives](https://www.microsoft.com/en-us/security/blog/2018/08/16/partnering-with-the-industry-to-minimize-false-positives/). The vendor or software developer can submit the application, service, or script in the [Microsoft Security Intelligence portal](https://www.microsoft.com/wdsi/filesubmission?persona=SoftwareDeveloper). <br/><br/>As a work-around, you can follow these steps: <br/>1. (Preferred) For .exe's and dll's use [Indicators – File hash - allow](/defender-endpoint/indicator-file) or [Indicators – Certificate - allow](/defender-endpoint/indicator-certificates) <br/>2. (Alternative) Add [Antivirus exclusions (process+path)](/defender-endpoint/configure-exclusions-microsoft-defender-antivirus). |
|2. **Using HTA's, CHM's and different files as databases**. <br/>Anytime that Microsoft Defender Antivirus must extract and/or scan complex file formats, higher CPU utilization can occur. | Consider switching to using actual databases if you need to save info and query it. <br/><br/>As a workaround, add [Antivirus exclusions (process+path)](/defender-endpoint/configure-exclusions-microsoft-defender-antivirus). |
|3. **Using obfuscations on scripts**. <br/>If you obfuscate scripts, Microsoft Defender Antivirus in order to check if the script contains malicious payloads, it can use more CPU utilization while scanning. | Use script obfuscation only when necessary.<br/><br/>As a workaround, add [Antivirus exclusions (process+path)](/defender-endpoint/configure-exclusions-microsoft-defender-antivirus). |
|4. **Not letting the Microsoft Defender Antivirus cache finish before sealing the image**.| If you're creating a VDI image such as for a non-persistent image, make sure that cache maintenance completes before the image is sealed. <br/> For more information, see [Configure Microsoft Defender Antivirus on a remote desktop or virtual desktop infrastructure environment](/defender-endpoint/deployment-vdi-microsoft-defender-antivirus). |
|5. **Having the wrong path exclusion(s) due to misspelling**. <br/>If you add misspelled exclusion paths, it can lead to performance issues.| Use `MpCmdRun.exe -CheckExclusion -Path` to validate path-based exclusions. |
|6. **When a path exclusion is added, it works for scanning flows**. <br/>Behavior Monitoring (BM) and Network Real-time Inspection (NRI) can still cause performance issues. |As a workaround, take these steps: <br/>1. (Preferred) For .exe's and dll's use [Indicators – File hash - allow](/defender-endpoint/indicator-file) or [Indicators – Certificate - allow](/defender-endpoint/indicator-certificates) <br/>2. (Alternative) [Add Antivirus exclusions (process+path)](/defender-endpoint/configure-exclusions-microsoft-defender-antivirus). |
|7. **File hash computation**. <br/>If you enable file hash computation, which is used for [file indicators](indicator-file.md), there's more performance overhead. For example, copying large files from a network share onto your local device, especially over a VPN connection, might have an effect on device performance. | This is where you, and your leadership team will have to make a decision, of having more security or less CPU utilization. <br/><br/>One possible solution is to disable the File hash computation feature. Go to **Computer Configuration** > **Administrative Templates** > **Windows Components** > **Microsoft Defender Antivirus** > **MpEngine**, and then enable file hash computation features.|

### To help determine which component might be contributing to higher CPU utilization

|Component| Solution|
| -------- | -------- |
| Real-time protection (RTP) scanning | You can use [Troubleshooting mode](/defender-endpoint/enable-troubleshooting-mode) to turn off [Tamper Protection](/defender-endpoint/troubleshoot-problems-with-tamper-protection). Once Tamper Protection is turned off, you could turn off the "Real-time protection" temporarily, in order to rule it out.<br/><br/>See the previous section, [Common reasons for higher CPU utilization by Microsoft Defender Antivirus](#common-reasons-for-higher-cpu-utilization-by-microsoft-defender-antivirus). |
| Scheduled scanning |Check your default scheduled scan settings<br/><br/>**General scheduled scan settings**.<br/><br/>- Configure low CPU priority for scheduled scans (Use low CPU priority for scheduled scans). <br/>The thread priority in Windows for normal scans has two values: `8` (lower) and `9` (higher). By setting this to `enabled`, you're lowering the scheduled scan thread priority from `9` to `8`, which enables other application threads to run with a higher priority, thus getting more CPU time than Microsoft Defender Antivirus. <br/><br/>- Specify the maximum percentage of CPU utilization during a scan (CPU usage limit per scan). `50` is the default setting; you can lower it to `20` or `30`. <br/>If you have a change control window, by modifying the amount of CPU that can be used, causes the scan to take longer. <br/><br/>- Start the scheduled scan only when computer is on but not in use by setting `ScanOnlyIfIdle` to `Not configured` (it's enabled by default). <br/>It requires the machine to be idle, meaning the CPU usage overall of the device has to be lower than 80%. <br/><br/>**Daily quick scan settings**<br/><br/>- Set `Specify the interval to run quick scans per day` to `Not configured` (How many hours have elapsed, before the next quick scan runs - 0 to 24 hours)<br/><br/>- Set `Specify the time for a daily quick scan (Run daily quick scan at)` to `12 PM`. <br/><br/>**Run a weekly scheduled scan (quick or full) settings** <br/><br/>- Specify the scan type to use for a scheduled scan (Set `Scan type` to `Not configured`). <br/><br/>- Specify the time of day to run a scheduled scan (Set `Day of week to run scheduled scan` to `Not configured`). <br/><br/>- Specify the day of the week to run a scheduled scan (Set `Time of day to run a scheduled scan` to `Not configured`). |
| Scan after a security intelligence update.|By default, Microsoft Defender Antivirus scans after a security intelligence update for optimal protection purposes. If scheduled scans are enabled, you might think that there are scans that are run outside of the schedule. This is where you, and your leadership team will have to make a decision, of having more security or less CPU utilization. <br/><br/>As a workaround, in Group Policy (or another management tool, such as MDM), go to **Computer Configuration** > **Administrative Templates** > **Microsoft Defender Antivirus** > **Security Intelligence Updates**, and set **Turn on scan after security intelligence update** to `Disabled`. |
| Conflicts with other security software | If you have non-Microsoft security software, such as antivirus, EDR, DLP, endpoint privilege management, VPN, and so on, add the that software to the Microsoft Defender Antivirus exclusions (path + processes), and vice-versa.<br/><br/> To get the list of the Microsoft Defender Antivirus binaries, see [Configure your network environment to ensure connectivity with Defender for Endpoint service](/defender-endpoint/configure-environment). |
| Scanning a large number of files or folders | If you have a large file such as an .iso, .vhdx, and so on, sitting in your user profile (desktop, downloads, documents, and so on) and that profile is being redirected to network shares, such as Offline Files (CSC) or OneDrive (or similar products), scans can take longer to run. This is because you're scanning a network, where there's more latency compared to files stored locally on a device.<br/><br/>If you don't need the .iso/.vhd/.vhdx, etc… sitting on your profile, move it to a different folder where it's not sitting on a network share (mapped drive, unc share, smb share). |

## What's triggering and causing higher CPU utilization in Microsoft Defender Antivirus

After the proa\ctive steps are complete, you can identify what is triggering and causing the higher CPU utilization:


| #|Tools to help narrow down what's triggering the high CPU utilization|Comments|
| -------- | -------- | -------- |
|1  |[Collect Microsoft Defender Antivirus diagnostic data](/defender-endpoint/collect-diagnostic-data)|Microsoft Defender Antivirus diagnostic data that you want to include whenever troubleshooting an issue with Microsoft Defender Antivirus.|
|2|[Performance analyzer for Microsoft Defender Antivirus](/defender-endpoint/tune-performance-defender-antivirus)|For performance-specific issues related to Microsoft Defender Antivirus, see Performance analyzer for Microsoft Defender Antivirus. This allows you to run the data collection and parse the data, where it's easy to understand. Note: Make sure that the issue is reproducing when you collect this data.|
|3|[Troubleshoot Microsoft Defender Antivirus performance issues with Process Monitor](/defender-endpoint/troubleshoot-av-performance-issues-with-procmon)|If for some reason that the Microsoft Defender Antivirus performance analyzer doesn't provide with the details that you need to narrow down on what's triggering the high CPU utilization, you can use Process Monitor (ProcMon). Tip: You can collect for 5-10 minutes. Note: Make sure that the issue is reproducing when you collect this data.|
|4|[Troubleshoot Microsoft Defender Antivirus performance issues with WPRUI](/defender-endpoint/troubleshoot-av-performance-issues-with-wprui)|For more advanced troubleshooting, you can utilize the Windows Performance Recorder UI (WPRUI) or Windows Performance Recorder (WPR). Keep in mind that due to the verbosity of this trace, it should be limited to a maximum of 3 to 5 minutes. Ensure that the issue is actively occurring when you collect this data.

## Check with the vendor for known issues with antivirus products

If you can readily identify the software affecting system performance, go to the software vendor's knowledge base or support center. Check to see if there are any known issues with antivirus products. If necessary, you can open a support ticket with them and ask them to publish one.

We recommend that software vendors follow the various guidelines in [Partnering with the industry to minimize false positives](https://www.microsoft.com/security/blog/2018/08/16/partnering-with-the-industry-to-minimize-false-positives/). The vendor can submit their software through the [Microsoft Security Intelligence portal](https://www.microsoft.com/wdsi/filesubmission?persona=SoftwareDeveloper).

## What if I still have an issue?

You can submit a ticket to [Microsoft support](/defender-endpoint/contact-support).

Follow the steps in [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md).

## See also

- [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md)
- [Configure and validate exclusions for Microsoft Defender Antivirus scans](configure-exclusions-microsoft-defender-antivirus.md)
- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
