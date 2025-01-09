---
title: Troubleshoot Microsoft Defender Antivirus performance issues with WPRUI
description: Troubleshoot Microsoft Defender Antivirus performance issues with WPRUI
author: emmwalshh
ms.author: ewalsh
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: troubleshooting-general
ms.date: 01/08/2025
ms.subservice: ngp
manager: deniseb
ms.localizationpriority: medium 
f1.keywords: NOCSH 
audience: ITPro
ai-usage: human-only
ms.collection: 
- m365-security
ms.custom:
- partner-contribution
---

# Troubleshoot Microsoft Defender Antivirus performance issues with WPRUI

## Capture performance logs using Windows Performance Recorder

Windows Performance Recorder (WPR) is a powerful recording tool that creates Event Tracing for Windows recordings and allows you to include additional information in your submission to Microsoft support.

WPR is part of the Windows Assessment and Deployment Kit (Windows ADK) and can be downloaded from [Download and install the Windows ADK](/windows-hardware/get-started/adk-install). You can also download it as part of the Windows 10 Software Development Kit at [Windows 10 SDK](https://developer.microsoft.com/windows/downloads/windows-10-sdk/).

Alternatively, follow the steps in [Capture performance logs using the WPR UI](/editor/MicrosoftDocs/defender-docs-pr/defender-endpoint%2Ftroubleshoot-performance-issues.md/main/ae28f1cf-14bc-fb9c-5f0c-873a683e907c/?branch=main&branchFallbackFrom=main%2C), or use the command-line tool *wpr.exe* [Capture performance logs using the WPR CLI](/editor/MicrosoftDocs/defender-docs-pr/defender-endpoint%2Ftroubleshoot-performance-issues.md/main/ae28f1cf-14bc-fb9c-5f0c-873a683e907c/?branch=main&branchFallbackFrom=main%2C). Both are available in Windows 8 and later versions.

### Capture performance logs using the WPR UI

> [!TIP]
> If multiple devices are experiencing this issue, try using the one with the most RAM.

1. Download and install WPR.

1. Under *Windows Kits*, right-click **Windows Performance Recorder**.

   ![Screenshot showing the Start menu](media/wpr-01.png)

1. Select **More**. Select **Run as administrator**.

1. Right-click **Yes** when the User Account Control dialog box appears.

   ![Screenshot showing the UAC page.](media/wpt-yes.png)

1. Next, download the [Microsoft Defender for Endpoint analysis](https://github.com/YongRhee-MDE/Scripts/blob/master/MDAV.wprp) profile and save as `MDAV.wprp` to a folder such as `C:\temp`.

1. In the WPR dialog box, select **More options**.

   ![Screenshot showing the page where you can select more options](media/wpr-03.png)

1. Select **Add Profiles...** and browse to the path of the `MDAV.wprp` file.

1. A new profile named Microsoft Defender for Endpoint analysis should appear under Custom measurements.

   ![Screenshot showing the in-file.](media/wpr-infile.png)

   > [!WARNING]
   > If your Windows Server has 64 GB of RAM or more, use the custom measurement `Microsoft Defender for Endpoint analysis for large servers` instead of `Microsoft Defender for Endpoint analysis`. Otherwise, your system consumes a high amount of non-paged pool memory or buffers, leading to system instability. Explore **Resource Analysis** to choose profiles to add.
   > This custom profile provides the necessary context for in-depth performance analysis.

1. To use the custom measurement Microsoft Defender for Endpoint verbose analysis profile in the WPR UI:

   1. Ensure no profiles are selected under the *First-level triage*, *Resource Analysis* and *Scenario Analysis* groups.

   2. Select **Custom measurements**.

   3. Select **Microsoft Defender for Endpoint analysis**.

   4. Select **Verbose** under *Detail* level.

   5. Select **File** or **Memory** under Logging mode.

   > [!IMPORTANT]
   > Select **File** to use the file logging mode if you can directly reproduce the performance issue. Most issues fall under this category. However, if you cannot directly reproduce the issue, select Memory to use the memory logging mode. This prevents the trace log from inflating excessively due to long run times.

1. Now you're ready to collect data. Close all unnecessary applications. Click **Hide options** to keep the space occupied by the WPR window small.

   ![Screenshot showing the Hide options.](media/wpr-08.png)

1. Select **Start**.

   ![Screenshot showing the Record system information page.](media/wpr-09.png)

1. Reproduce the issue.

   > [!TIP]
   > Limit the data collection to a maximum of five minutes. Ideally, aim for two to three minutes, as a significant amount of data is being collected.

1. Select **Save**.

   ![Screenshot showing the Save option.](media/wpr-10.png)

1. Fill in **Type in a detailed description of the problem:** with information about the problem and how you reproduced the issue.

   ![Screenshot showing the pane in which you fill.](media/wpr-12.png)

1. Select **File Name:** to determine where your trace file is saved. By default, it's saved to `%user%\Documents\WPR Files\`.

   1. Select **Save**.

   ![Screenshot showing the WPR gathering general trace.](media/wpr-13.png)

1. After the trace has been merged and saved, right-click **Open folder**.

   ![Screenshot that displays the notification that WPR trace has been saved.](media/wpr-14.png)

   Include both the file and the folder in your submission to Microsoft Support.

   ![Screenshot showing the details of the file and the folder.](media/wpr-15.png)

### Capture performance logs using the WPR CLI

To collect a WPR trace using the command-line tool wpr.exe:

1. Download **[Microsoft Defender for Endpoint analysis](https://github.com/YongRhee-MDE/Scripts/blob/master/MDAV.wprp)** performance trace profile as `MDAV.wprp` in a local directory such as `C:\traces`.

1. Right-click the **Start Menu** icon and select **Windows PowerShell (Admin)** or **Command Prompt (Admin)** to open an Admin command prompt window.

1. Select **Yes** in the User Account Control dialog box.

1. At the **Command Prompt (Admin)**, run the following command to start a Microsoft Defender for Endpoint performance trace:

   ```console
   
   wpr.exe -start C:\traces\MDAV.wprp!WD.Verbose -filemode
  
   ```

   > [!WARNING]
   > If your Windows Server has 64 GB of RAM or more, use profiles `WDForLargeServers.Light` and `WDForLargeServers.Verbose` instead of profiles `WD.Light` and `WD.Verbose`, respectively. Otherwise, your system consumes a high amount of non-paged pool memory or buffers, leading to system instability.

1. Reproduce the issue.

   > [!TIP]
   > Limit the data collection to a maximum of five minutes. Ideally, aim for two to three minutes, as a significant amount of data is being collected.

1. At the **Command Prompt (Admin)**, run the following command to start a Microsoft Defender for Endpoint performance trace:

   ```console
   wpr.exe -stop merged.etl "Timestamp when the issue was reproduced, in HH:MM:SS format" "Description of the issue" "Any error that popped up"
   ```

1. Wait until the trace is merged.

1. Include both the file and the folder in your submission to Microsoft Support.

## See also

- [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md)
- [Configure and validate exclusions for Microsoft Defender Antivirus scans](configure-exclusions-microsoft-defender-antivirus.md)
- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
