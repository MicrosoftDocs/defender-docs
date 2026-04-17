---
title: Troubleshoot Microsoft Defender Antivirus service startup problems
description: Learn how to troubleshoot Microsoft Defender Antivirus service startup problems.
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: troubleshooting-general
ms.date: 01/08/2026
ms.subservice: ngp
ms.localizationpriority: medium
ms.collection: # Useful for querying on a set of strategic or high-priority content.
ms.custom: partner-contribution
appliesto:
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals
  - Microsoft Defender Antivirus
---

# Troubleshoot Microsoft Defender Antivirus service startup problems

In the following screenshot, **Virus & threat protection** displays a red cross, where it says **Threat service has stopped. Restart it now**.

:::image type="content" source="media/virus-threat-protection.jpg" alt-text="Screenshot of virus and threat protection notification.":::

Within **Security Providers**, you can see the following result.

**Microsoft Defender Antivirus is turned off**.

:::image type="content" source="media/security-providers.png" alt-text="Screenshot of security providers.":::  

The following screenshot displays the message: **Threat service has stopped. Restart it now.**

:::image type="content" source="media/virus-threat-protection-2.png" alt-text="Screenshot of threat service has stopped.":::  

The following screenshot displays the message: **Unexpected error. Sorry, we ran into a problem. Please try again.**

Select **Close**.

:::image type="content" source="media/unexpected-error.png" alt-text="Screenshot of unexpected error." lightbox="media/unexpected-error.png":::  

## Events

The *Windows Defender – Operational* event log might display the following events:

### Event 5007

The configuration of Microsoft Defender Antivirus changed. If you expected this event, review the settings, as it might be the result of malware.

|Old value|New value|
|---|---|
|`HKLM\SOFTWARE\Microsoft\Windows Defender\Diagnostics\RolledbackPlatformHealthData = <OVERALL>:<BAD>, <AGE>:<36>, <DIRTY_SHUTDOWNS>:<22>`|`Default\Diagnostics\RolledbackPlatformHealthData = 0`|
|`Default\ServiceStartStates = 0x0`|`HKLM\SOFTWARE\Microsoft\Windows Defender\ServiceStartStates = 0x1`|
|`HKLM\SOFTWARE\Microsoft\Windows Defender\ServiceStartStates = 0x1`|`Default\ServiceStartStates = 0x0`|
|`Default\ProductAppDataPath = C:\ProgramData\Microsoft\Windows Defender`|`HKLM\SOFTWARE\Microsoft\Windows Defender\ProductAppDataPath = C:\ProgramData\Microsft\Windows Defender`|
|`Default\IsServiceRunning = 0x0`|`HKLM\SOFTWARE\Microsoft\Windows Defender\IsServiceRunning = 0x1`|
|`Default\ProductAppDataPath = C:\ProgramData\Microsoft\Windows Defender`|`HKLM\SOFTWARE\Microsoft\Windows Defender\ProductAppDataPath = C:\ProgramData\Microsoft\Windows Defender`|
|`Default\IsServiceRunning = 0x0`|`HKLM\SOFTWARE\Microsoft\Windows Defender\IsServiceRunning = 0x1`|

### Event 5001

Microsoft Defender Antivirus Real-time Protection scanning for malware and other potentially unwanted software  was disabled.

## Resolution

To resolve the issue, do the following steps:

1. Check the services and filter drivers for Microsoft Defender Antivirus.

   Run the following command in an elevated PowerShell window (a PowerShell window you opened by selecting **Run as administrator**):

   ```powershell
   Get-Service WinDefend, WdBoot, WdFilter, WdNisSvc, WdNisDrv, SecurityHealthService, wscsvc | Format-Table -Auto DisplayName, Name, StartType, Status
   ```

   |Display Name|Name|StartType|Status|Comments|
   |---|---|---|---|---|
   |Windows Security Service|SecurityHealthService|Manual|Running||
   |Microsoft Defender Antivirus Boot Driver|WdBoot|Boot|Stopped|It's normal to be stopped after boot.|
   |Microsoft Defender Antivirus Mini-Filter Driver|WdFilter|Boot|Running|If stopped, check steps 3, 6, 7.|
   |Microsoft Defender Antivirus Network Inspection System Driver|WdNisDrv|Manual|Running|If stopped, check steps 3, 6, 7.|
   |Microsoft Defender Antivirus Network Inspection Service|WdNisSvc|Manual|Running|If stopped, check steps 3, 6, 7.|
   |Microsoft Defender Antivirus Service|WinDefend|Automatic|Running|If stopped, check steps 3, 6, 7.|
   |wscsvc|Security Center|Automatic|Running||

2. Download and run the [Microsoft Safety Scanner](safety-scanner-download.md) to rule out any malware.

3. If you're using Microsoft Defender Antivirus as your primary antivirus, make sure to uninstall non-Microsoft antivirus software.

4. Remove the **Security Intelligence** and **engine**:
   1. Open an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**). For example:
      1. Open the **Start** menu, and then type **cmd**.
      2. Right-click on the **Command Prompt** result, and then select **Run as administrator**.

   1. In the elevated Command Prompt, run the following commands.

      > [!TIP]
      > The first command changes the directory to the latest version of \<antimalware platform version\> in `%ProgramData%\Microsoft\Windows Defender\Platform\<antimalware platform version>`. If that path doesn't exist, it goes to `%ProgramFiles%\Microsoft Defender`.

      ```dos
      (set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

      MpCmdRun.exe -RemoveDefinitions -All
      ```

   For more information, see [Manage the sources for Microsoft Defender Antivirus protection updates](manage-protection-updates-microsoft-defender-antivirus.md).

5. Backup Microsoft Defender Antivirus policies.
   1. Open an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**). For example:
      1. Open the **Start** menu, and then type **powershell**.
      2. Right-click on the **PowerShell 7 (x64)** or **Windows PowerShell** result, and then select **Run as administrator**.

   1. In the elevated PowerShell session, run the following command:

    ```powershell
    New-Item -Path "C:\DefenderTemp" -ItemType Directory; Invoke-Command {reg export 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender' C:\DefenderTemp\_DefenderAVBackup.reg}
    ```

6. "Reset" Microsoft Defender Antivirus. Microsoft Defender Antivirus is built into Windows 10 and Windows 11, so you can't remove it.

   Run the following commands in an elevated Windows Command Prompt:

   - **Windows 10 or later**:

     1. &nbsp;

        ```dos
        DISM /Online /Cleanup-Image /RestoreHealth
        ```

        or

        ```dos
         DISM /Online /Cleanup-Image /RestoreHealth /Source:<SourcePath> /LimitAccess
        ```

     2. &nbsp;

        ```dos
        sfc /scannow
        ```

7. Delete any policies that are set for Microsoft Defender Antivirus.

    Run the following command in an elevated PowerShell session:

    ```powershell
    Remove-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Force
    ```

    For more information, see: [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md).

8. Update Security Intelligence.

   Run the following commands in an elevated Command Prompt:

   ```dos
   (set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

   MpCmdRun.exe -SignatureUpdate -MMPC
   ```

9. Verify **Tamper Protection** is enabled.

    :::image type="content" source="media/tamper-protection.png" alt-text="Screenshot of Tamper Protection is enabled.":::

10. Run **Microsoft Update**.
