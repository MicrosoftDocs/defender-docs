---
title: Collect diagnostic data of Microsoft Defender Antivirus
description: Use MpCmdRun to collect diagnostic log files to help troubleshoot Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen
ms.date: 03/20/2026
ms.reviewer: pahuijbr, yongrhee
ms.subservice: ngp
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-ngp
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals
---

# Collect Microsoft Defender Antivirus diagnostic data

This article describes how to collect diagnostic data to send to Microsoft support and engineering teams when they help troubleshoot issues with Microsoft Defender Antivirus.

> [!NOTE]
> As part of the investigation or response process, you can collect an investigation package from a device. Here's how: [Collect investigation package from devices](/windows/security/threat-protection/microsoft-defender-atp/respond-machine-alerts#collect-investigation-package-from-devices).
>
> For performance-specific issues related to Microsoft Defender Antivirus, see: [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).

<a name="redirect-diagnostic-data-to-a-unc-share"></a>

On at least two devices that are experiencing the same issue, use the following procedures to generate the diagnostic log files:

1. Open an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**). For example:
   1. Open the **Start** menu, and then type **cmd**.
   2. Right-click on the **Command Prompt** result, and then select **Run as administrator**.

1. In the elevated Command Prompt, do one of the following steps:

   - **Save the diagnostics log files on the local device**: Run the following commands:

     > [!TIP]
     > The first command changes the directory to the latest version of \<antimalware platform version\> in `%ProgramData%\Microsoft\Windows Defender\Platform\<antimalware platform version>`. If that path doesn't exist, it goes to `%ProgramFiles%\Microsoft Defender`.

     ```dos
     (set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

     MpCmdRun.exe -GetFiles
     ```

     By default, the diagnostic log files are generated, compressed, and saved to the file `C:\ProgramData\Microsoft\Windows Defender\Support\MpSupportFiles.cab` on the local device.

     The name of the .cab file is the same on every device.

   - **Copy the diagnostics log files to a central location**: To save the diagnostic log files from multiple devices in one place, use the following syntax:

     ```dos
     set "_done=" & (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) >nul 2>&1

     MpCmdRun.exe -GetFiles -SupportLogLocation <RootPath>
     ```

     The diagnostic log files are still generated, compressed, and saved to the file `C:\ProgramData\Microsoft\Windows Defender\Support\MpSupportFiles.cab` by default. But then the .cab file is **copied with a new name** into a subfolder of the location specified by the `<RootPath>` value (for example, `P:\Data` or `\\Server01\Data`). The filename and path of the resulting .cab file uses the following syntax: `<RootPath>\<MMDD>\MpSupport-<Hostname>-<HHMM>.cab`.

     - `<RootPath>` is the value you specified for `-SupportLogLocation`.
     - `<MMDD>` is the month and day when you ran the MpCmdRun command (for example, 0318 for March 18).
     - `<Hostname>` is the name of the device where you ran the MpCmdRun command (for example, LAPTOP01).
     - `<HHMM>` is the Universal Coordinated Time (UTC) when you ran the MpCmdRun command (for example 2221 for 22:21 UTC).

    > [!NOTE]
    > If you don't have write access to the location specified by the command, the diagnostic log files are still saved to the default location `C:\ProgramData\Microsoft\Windows Defender\Support\MpSupportFiles.cab` on the local device. But the step that copies and renames the .cab file to the `-SupportLogLocation` path fails.

     In this example, you ran the following commands on the device named LAPTOP01 on March 18 at 22:21 UTC:

     ```dos
     set "_done=" & (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) >nul 2>&1

     MpCmdRun.exe -GetFiles -SupportLogLocation "\\SERVER01\Data"
     ```

    The resulting .cab file is available at `\\SERVER01\Data\0318\MpSupport-LAPTOP01-2221.cab` and is guaranteed to be unique, even if you ran the MpCmdRun command on the same day on multiple devices.

1. After a few minutes, the diagnostic log files are generated, compressed, and saved. The resulting .cab file includes the following information:
   - Any trace files from Microsoft Antimalware Service.
   - The Windows Update history log.
   - All Microsoft Antimalware Service events from the System event log.
   - All relevant Microsoft Antimalware Service registry locations.
   - The log file of MpCmdRun.
   - The log file of the signature update helper tool.

   Copy the .cab files to a location that Microsoft support can access (for example, a password-protected OneDrive folder).

<a name="specify-location-where-diagnostic-data-is-created"></a>

## Use group policy to specify where diagnostic log files are copied

You can use group policy on the local device (registry-based settings) or in [the Central Store](/troubleshoot/windows-client/group-policy/create-and-manage-central-store#the-central-store) on a domain controller to specify where the diagnostic log files are copied after they're generated on the local device. Setting the location in group policy eliminates the need to use the `-SupportLogLocation` option in the MpCmdRun command as described in the previous section.

To set the _SupportLogLocation_ value in group policy, do the following steps:

1. Do one of the following steps:
   - **Group policy on the local device**: Open **Local Group Policy Editor**. For example:
     1. Open the **Start** menu, and then type **group policy**.
     2. Right-click on the **Edit group policy** result, and then select **Run as administrator**.
   - **Group policy for the domain**: On a domain-joined Group Policy management computer, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console).
     1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO that you want to edit.
     2. Right-click on the GPO, and then select **Edit**.

2. In the console tree, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.

   :::image type="content" source="media/GPO1-SupportLogLocationDefender.png" alt-text="Screenshot of Local Group Policy Editor with Microsoft Defender Antivirus selected in the console tree." lightbox="media/GPO1-SupportLogLocationDefender.png":::

3. In the details pane of **Microsoft Defender Antivirus**, open **Define the directory path to copy support log files** using any of the following methods:
   - Double-click on the setting.
   - Right-click on the setting, and then select **Edit**
   - Select the setting, and then select **Action** \> **Edit**.

4. In the **Define the directory path to copy support log files** window that opens, configure the following options:
   1. Select **Enabled**.
   2. **Options** section: In the **Define the directory path to copy support log files** box, enter a path value.

   :::image type="content" source="media/GPO3-SupportLogLocationGPPageEnabledExample.png" alt-text="Screenshot of Local Group Policy Editor with Enabled selected and a path value entered in the Options section." lightbox="media/GPO3-SupportLogLocationGPPageEnabledExample.png":::

   When you're finished in the **Define the directory path to copy support log files** window, select **OK**.

## See also

- [Troubleshoot Microsoft Defender Antivirus reporting](/intune/intune-service/protect/advanced-threat-protection-configure)
- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
