---
title: Evaluate Microsoft Defender Antivirus using PowerShell
description: Businesses of all sizes can use this guide to evaluate and test the protection offered by Microsoft Defender Antivirus in Windows using PowerShell.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.custom: nextgen
ms.date: 04/11/2025
ms.reviewer: yongrhee
ms.subservice: ngp
ms.collection:
- m365-security
- tier2
- mde-ngp
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
---

# Evaluate Microsoft Defender Antivirus using PowerShell

In Windows 10 or later and Windows Server 2016 or later, you can use the next-generation protection features in Microsoft Defender Antivirus with exploit protection.

This article explains how to enable and test the key protection features in Microsoft Defender Antivirus with exploit protection.

We recommend you use our [evaluation PowerShell script](https://aka.ms/wdeppscript) to configure these features, but you can individually enable each feature as described in this article.

For more information about our endpoint protection products and services, see the following resources:

- [Next-generation protection overview](next-generation-protection.md)
- [Microsoft Defender Antivirus in Windows](microsoft-defender-antivirus-windows.md)
- [Microsoft Defender Antivirus on Windows Server](microsoft-defender-antivirus-on-windows-server.md)
- [Protect devices from exploits](exploit-protection.md)

If you have any questions about a detection by Microsoft Defender Antivirus, or you discover a missed detection, you can submit the file to us. For more information, see [Submit files for analysis](/unified-secops/submission-guide).

## Use PowerShell to enable the features

This guide provides the [Microsoft Defender Antivirus cmdlets](/powershell/module/defender/) that configure the features you should use to evaluate our protection.

Use these cmdlets in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**).

Before you make changes, you should view and record the current status of all settings by using one or both of the following methods:

- Use the [Get-MpPreference](/powershell/module/defender/get-mppreference) cmdlet.
- Install the [DefenderEval](https://www.powershellgallery.com/packages/DefenderEval/) module from the PowerShell Gallery, and then use the  **Get-DefenderEvaluationReport** cmdlet.

Microsoft Defender Antivirus uses [standard Windows notifications](configure-notifications-microsoft-defender-antivirus.md) for detections. You can also [review detections in the Microsoft Defender Antivirus app](review-scan-results-microsoft-defender-antivirus.md).

The Windows Event Log also records detection and engine events. For more information, see [Review event logs and error codes to troubleshoot issues with Microsoft Defender Antivirus](troubleshoot-microsoft-defender-antivirus.yml).

## Cloud protection features

Standard definition updates can take hours to prepare and deliver. Our cloud-delivered protection service can deliver this protection in seconds. For more information, see [Cloud protection and Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md).

- **Enable the Microsoft Defender Cloud for near-instant protection and increased protection**:

  ```powershell
  Set-MpPreference -MAPSReporting Advanced
  ```

- **Automatically submit samples to increase group protection**:

  ```powershell
  Set-MpPreference -SubmitSamplesConsent Always
  ```

- **Always use the cloud to block new malware within seconds**:

  ```powershell
  Set-MpPreference -DisableBlockAtFirstSeen 0
  ```

- **Scan all downloaded files and attachments**:

  ```powershell
  Set-MpPreference -DisableIOAVProtection 0
  ```

- **Set the cloud block level to High**:

  ```powershell
  Set-MpPreference -CloudBlockLevel High
  ```

- **Set the cloud block time-out to 1 minute**:

  ```powershell
  Set-MpPreference -CloudExtendedTimeout 50
  ```

## Always-on protection (real-time scanning)

Microsoft Defender Antivirus scans files as Windows sees them, and monitors running processes for malicious behavior (known or suspected). If the antivirus engine discovers malicious activity, the engine immediately blocks the process or file from running. For more information on these options, see [Configure behavioral, heuristic, and real-time protection](configure-protection-features-microsoft-defender-antivirus.md).

- **Constantly monitor files and processes for known malware activity**:

  ```powershell
  Set-MpPreference -DisableRealtimeMonitoring 0
  ```

- **Constantly monitor for known malware behavior in running programs, even in files that aren't considered to be a threat:

  ```powershell
  Set-MpPreference -DisableBehaviorMonitoring 0
  ```

- **Scan scripts as soon as they're seen or run**:

  ```powershell
  Set-MpPreference -DisableScriptScanning 0
  ```

- **Scan removable drives as soon as they're inserted or mounted**:

  ```powershell
  Set-MpPreference -DisableRemovableDriveScanning 0
  ```

## Potentially unwanted application protection

[Potentially unwanted applications](detect-block-potentially-unwanted-apps-microsoft-defender-antivirus.md) are files and apps that aren't traditionally classified as malicious. These types of apps include:

- Non-Microsoft installers.
- Apps that do ad injection.
- Some types of browser toolbars.

**Prevent grayware, adware, and other potentially unwanted apps from installing**:

```powershell
Set-MpPreference -PUAProtection Enabled
```

## Email and archive scanning

You can set Microsoft Defender Antivirus to automatically scan certain types of email files and archive files (such as .zip files) when Windows see them. For more information, see [Managed email scans in Microsoft Defender](configure-advanced-scan-types-microsoft-defender-antivirus.md).

**Scan email files and archives**:

```powershell
Set-MpPreference -DisableArchiveScanning 0 -DisableEmailScanning 0
```

## Manage product and protection updates

Typically, you get Microsoft Defender Antivirus updates from Windows update once per day. You can increase the update frequency by setting the following options and [ensuring Microsoft Configuration Manager, Group Policy, or Microsoft Intune manages your updates](deploy-manage-report-microsoft-defender-antivirus.md).

- **Update signatures every day (default)**:

  ```powershell
  Set-MpPreference -SignatureUpdateInterval
  ```

- **Update signatures before running a scheduled scan**:

  ```powershell
  Set-MpPreference -CheckForSignaturesBeforeRunningScan 1
  ```

<a name="advanced-threat-and-exploit-mitigation-and-prevention-controlled-folder-access"></a>

## Advanced threat mitigation and prevention

Exploit protection provides features that help protect devices from known malicious behaviors and attacks on vulnerable technologies.

- **Prevent malicious and suspicious apps (such as ransomware) from making changes to protected folders with [controlled folders](controlled-folders.md)**:

  ```powershell
  Set-MpPreference -EnableControlledFolderAccess Enabled
  ```

- **Block connections to known bad IP addresses and other network connections with [Network protection](network-protection.md)**:

  ```powershell
  Set-MpPreference -EnableNetworkProtection Enabled
  ```

- **Apply a standard set of mitigations with [Exploit protection](exploit-protection.md)**:

  ```powershell
  Invoke-WebRequest https://demo.wd.microsoft.com/Content/ProcessMitigation.xml -OutFile ProcessMitigation.xml

  Set-ProcessMitigation -PolicyFilePath ProcessMitigation.xml
  ```

- **Block known malicious attack vectors with [attack surface reduction rules](attack-surface-reduction-rules-overview.md)**:

   > [!IMPORTANT]
   > Typically, you can enable standard protection ASR rules in **Block** or **Warn** mode without testing, but you should test other ASR rules in **Audit** before you enabled them. For more information, see [Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md).

  ```powershell
  Add-MpPreference -AttackSurfaceReductionRules_Ids 56a863a9-875e-4185-98a7-b882c64b5ce5,9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2,e6db77e5-3df2-4cf1-b95a-636979351e5b -AttackSurfaceReductionRules_Actions Enabled,Enabled,Enabled

  Add-MpPreference -AttackSurfaceReductionRules_Ids 01443614-cd74-433a-b99e-2ecdc07bfc25,26190899-1602-49e8-8b27-eb1d0a1ce869 ,33ddedf1-c6e0-47cb-833e-de6133960387,3b576869-a4ec-4529-8536-b80a7769e899,5beb7efe-fd9a-4556-801d-275e5ffc04cc,75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84,7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c,92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b,b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4,be9ba2d9-53ea-4cdc-84e5-9b1eeee46550,c1db55ab-c21a-4637-bb3f-a12568109d35,d1e49aac-8f56-4280-b9ba-993a6d77406c,d3e037e1-3eb8-44c8-a917-57927947596d,d4f940ab-401b-4efc-aadc-ad5f3c50688a,a8f5898e-1dc8-49a9-9878-85004b8a61e6,c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb -AttackSurfaceReductionRules_Actions AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode,AuditMode
  ```

### Enable tamper protection

For more information, see [How do I configure or manage tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md).

#### Check the Cloud Protection network connectivity

It's important to verify that Cloud Protection network connectivity is working during your penetration testing by doing the following steps:

In an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**), run the following commands:

> [!TIP]
> The first command changes the directory to the latest version of \<antimalware platform version\> in `%ProgramData%\Microsoft\Windows Defender\Platform\<antimalware platform version>`. If that path doesn't exist, it goes to `%ProgramFiles%\Windows Defender`.

```dos
(set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

MpCmdRun.exe -ValidateMapsConnection
```

For more information, see [Configure and manage Microsoft Defender Antivirus with the MpCmdRun command-line tool](command-line-arguments-microsoft-defender-antivirus.md).

## One-select Microsoft Defender Offline Scan

Microsoft Defender Offline Scan is a specialized tool that allows you to boot a machine into a dedicated environment outside of the normal operating system. It's especially useful for potent malware, such as rootkits.

For more information, see [Microsoft Defender Offline](microsoft-defender-offline.md).

**Ensure notifications allow you to boot the device into a specialized malware removal environment**:

```powershell
Set-MpPreference -UILockdown 0
```

## See also

- [Microsoft Defender for Endpoint](microsoft-defender-endpoint.md)
- [Cloud protection and Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus security intelligence and product updates](microsoft-defender-antivirus-updates.md)
