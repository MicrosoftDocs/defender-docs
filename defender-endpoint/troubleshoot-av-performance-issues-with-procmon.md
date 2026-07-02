---
title: Troubleshoot Microsoft Defender Antivirus performance issues with Process Monitor
description: Troubleshoot Microsoft Defender Antivirus performance issues with Process Monitor
author: chrisda
ms.author: chrisda
ms.reviewer: yonghree
ms.service: defender-endpoint
ms.topic: troubleshooting-general
ms.date: 03/20/2025
ms.subservice: ngp
ms.localizationpriority: medium 
ms.collection: 
- m365-security
ms.custom:
- partner-contribution
ai-usage: human-only
---

# Troubleshoot Microsoft Defender Antivirus performance issues with Process Monitor

> [!TIP]
> First, review common reasons for performance issues, such as high CPU usage. See **[Troubleshoot performance issues related to Microsoft Defender Antivirus real-time protection (rtp) or scans (scheduled or on-demand](troubleshoot-performance-issues.md)**.
> Then, run the [Microsoft Defender Antivirus Performance Analyzer](tune-performance-defender-antivirus.md). This tool will help identify the cause of high CPU usage in Microsoft Defender Antivirus, whether it's the Antimalware Service Executable, the Microsoft Defender Antivirus service, or MsMpEng.exe.
> If the Microsoft Defender Antivirus Performance Analyzer doesn't identify the root cause of the high CPU utilization, proceed with running **[Processor Monitor](troubleshoot-av-performance-issues-with-procmon.md)**.
> The final tool in your toolkit to run is [Windows Performance Recorder UI (WPRUI) or Windows Performance Recorded (WPR command-line)](troubleshoot-av-performance-issues-with-wprui.md).

## Capture process logs using Process Monitor

Process Monitor (ProcMon) is an advanced monitoring tool that provides real-time data on processes. It can be used to capture performance issues, such as high CPU usage, and to monitor application compatibility scenarios as they occur.

You can capture a Process Monitor (ProcMon) trace by using the MDE Client Analyzer or by using a manual process.

### Using the MDE Client Analyzer

1. Download the [MDE Client Analyzer](overview-client-analyzer.md).

1. Run the MDE Client Analyzer using [Live Response or locally](run-analyzer-windows.md).

   > [!TIP]
   > Before starting the trace, please make sure that the issue is reproducible. Additionally, close any applications that do not contribute to the reproduction of the issue.

1. Run the MDE Client Analyzer with the `-c` and `-v` switches:

   ```powershell
   C:\Work\tools\MDEClientAnalyzer\MDEClientAnalyzer.cmd -c -v
   ```

### Manual process

1. Download [Process Monitor v4.01](/sysinternals/downloads/procmon) to a folder like `C:\temp`.

1. To remove the file's mark of the web:

   1. Right-click **ProcessMonitor.zip** and select **Properties**.
      
   1. Under the *General* tab, look for *Security*.
      
   1. Check the box beside **Unblock**.
      
   1. Select **Apply**.
   
   ![Screenshot that shows how to remove the "Mark Of The Web" from the ProcessMonitor.zip file.](media/troubleshoot-av-performance-issues-with-procmon/processmonitor-motw.jpg)
   
1. Unzip the file in `C:\temp` so that the folder path is `C:\temp\ProcessMonitor`.

1. Copy **Procmon.exe** to the Windows client or Windows server you're troubleshooting.

   > [!TIP]
   > Before running ProcMon, make sure all other applications not related to the high CPU usage issue are closed. Taking this step helps to minimize the number of processes to check.
   
1. You can launch ProcMon in two ways: using Procmon.exe or command line.

   - To use [Procmon.exe](/sysinternals/downloads/procmon), download it, and open it as an administrator.

      1. If this is your first time using ProcMon, click **Agree** to accept the Process Monitor License Agreement.

         ![Screenshot that shows the Process Monitor License Agreement.](media/troubleshoot-av-performance-issues-with-procmon/process-monitor-license-agreement1.jpg)

      1. Since logging starts automatically, stop the capture by selecting the **Capture** button or pressing **Ctrl+E**.

         ![Screenshot that shows the button to stop the ProcMon capture.](media/troubleshoot-av-performance-issues-with-procmon/capture-button-(stop).jpg)

      1. To confirm the capture has stopped, look for a pause icon on the **Capture** button, then delete the logged entries by selecting the **Clear** button or pressing **Ctrl+X**.

         ![Screenshot that shows the button to start the ProcMon capture.](media/troubleshoot-av-performance-issues-with-procmon/capture-button-(start).jpg)

         ![Screenshot that shows the button to clear the ProcMon entries.](media/troubleshoot-av-performance-issues-with-procmon/clear-button1.jpg)
      
   - To use command line, open Command Prompt as an administrator. Then, run the following command:

      ![Screenshot that shows an elevated command prompt window to run Procmon.exe.](media/troubleshoot-av-performance-issues-with-procmon/admin-cmd.jpg)
      
   > [!TIP]
   > Make the ProcMon window as small as possible when capturing data so you can easily start and stop the trace![Screenshot showing the desktop with Procmon minimized.](media/troubleshoot-av-performance-issues-with-procmon/desktop-with-procmon-minimized.jpg)
   
1. Set filters by selecting the **Filter** icon. Standard filters are set by default. You can also filter the results after the capture is complete. If you applied any filters, click **Apply** and then **OK**.

   ![Screenshot that shows how to open the Filter window.](media/troubleshoot-av-performance-issues-with-procmon/filter-button.jpg)

   ![Screenshot that shows the Filter window.](media/troubleshoot-av-performance-issues-with-procmon/process-monitor-filter.jpg)
   
1. To start the capture, select the **Capture** button again.

1. Reproduce the problem.

   > [!TIP]
   > Wait for the problem to be reproduced, then note the timestamp when the trace begins.
   
1. After capturing two to four minutes of process activity during high CPU usage, stop the capture by clicking the **Capture** button.

1. To save the capture with a unique name in the `.pml` format, go to **File** then click **Save...**. Ensure you select the radio buttons **All events** and **Native Process Monitor Format (PML)**.

      ![Screenshot showing the save settings page.](media/troubleshoot-av-performance-issues-with-procmon/save-to-file.jpg)
   
1. For better tracking, change the default path from `C:\temp\ProcessMonitor\LogFile.PML` to `C:\temp\ProcessMonitor\%ComputerName%_LogFile_MMDDYEAR_Repro_of_issue.PML` where:

   - `%ComputerName%` is the device name
   - `MMDDYEAR` is the month, day, and year
   - `Repro_of_issue` is the name of the issue you're trying to reproduce

   > [!TIP]
   > If you have a working system, you might want to get a sample log to compare.

1. Zip the `.pml` file and submit it to Microsoft Support.
