---
title: Evaluate Microsoft Defender Antivirus using PowerShell.
description: Businesses of all sizes can use this guide to evaluate and test the protection offered by Microsoft Defender Antivirus in Windows using PowerShell.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 04/11/2025
ms.reviewer: yongrhee
manager: deniseb
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Evaluate Microsoft Defender Antivirus using PowerShell

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender Antivirus
- [Microsoft Defender for Endpoint Plan 1 and Plan 2](microsoft-defender-endpoint.md)

In Windows 10 (or newer) and Windows Server 2016 (or newer), you can use next-generation protection features offered by Microsoft Defender Antivirus with exploit protection.

This article explains how to enable and test the key protection features in Microsoft Defender Antivirus with exploit protection, and provides you with guidance and links to more information.

We recommend you use our [evaluation PowerShell script](https://aka.ms/wdeppscript) to configure these features, but you can individually enable each feature with the cmdlets described in the rest of this document.

For more information about our endpoint protection products and services, see the following resources:

- [Next-generation protection overview](next-generation-protection.md)
- [Microsoft Defender Antivirus in Windows](microsoft-defender-antivirus-windows.md)
- [Microsoft Defender Antivirus on Windows Server](microsoft-defender-antivirus-on-windows-server.md)
- [Protect devices from exploits](exploit-protection.md)

This article describes configuration options in Windows 10 or newer and Windows Server 2016 or newer. If you have any questions about a detection that Microsoft Defender Antivirus makes, or you discover a missed detection, you can submit a file to us at [our sample submission help site.](https://www.microsoft.com/security/portal/mmpc/help/submission-help.aspx)

## Use PowerShell to enable the features

This guide provides the [Microsoft Defender Antivirus cmdlets](/powershell/module/defender/?view=windowsserver2022-ps&preserve-view=true) that configure the features you should use to evaluate our protection.

To use these cmdlets, open PowerShell as an administrator, run a command, and then press **Enter**.

You can check the status of all settings before you begin, or during your evaluation, by using the [Get-MpPreference PowerShell cmdlet](/powershell/module/defender/get-mppreference), or by installing the [DefenderEval](https://www.powershellgallery.com/packages/DefenderEval/) module from the PowerShell Gallery and then using the `Get-DefenderEvaluationReport` command.

Microsoft Defender Antivirus indicates a detection through [standard Windows notifications](configure-notifications-microsoft-defender-antivirus.md). You can also [review detections in the Microsoft Defender Antivirus app](review-scan-results-microsoft-defender-antivirus.md).

The Windows event log also records detection and engine events. [See the Microsoft Defender Antivirus events article for a list of event IDs](troubleshoot-microsoft-defender-antivirus.yml) and their corresponding actions.

## Cloud protection features

Standard definition updates can take hours to prepare and deliver; our cloud-delivered protection service can deliver this protection in seconds.

For more information, see [Cloud protection and Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md).

| Description | PowerShell Command |
|---|---|
|Enable the Microsoft Defender Cloud for near-instant protection and increased protection|`Set-MpPreference -MAPSReporting Advanced`|
|Automatically submit samples to increase group protection|`Set-MpPreference -SubmitSamplesConsent Always`|
|Always Use the cloud to block new malware within seconds|`Set-MpPreference -DisableBlockAtFirstSeen 0`|
|Scan all downloaded files and attachments|`Set-MpPreference -DisableIOAVProtection 0`|
|Set cloud block level to High|`Set-MpPreference -CloudBlockLevel High`|
|High Set cloud block time-out to 1 minute|`Set-MpPreference -CloudExtendedTimeout 50`|

## Always-on protection (real-time scanning)

Microsoft Defender Antivirus scans files as soon as they're seen by Windows, monitors any running processes for known or suspected malicious behaviors. If the antivirus engine discovers malicious modification, immediately blocks the process or file from running.

For more information on these options, see [Configure behavioral, heuristic, and real-time protection](configure-protection-features-microsoft-defender-antivirus.md).

| Description | PowerShell Command |
|---|---|
|Constantly monitor files and processes for known malware modifications | `Set-MpPreference -DisableRealtimeMonitoring 0` |
|Constantly monitor for known malware behaviors, even in files that aren't considered to be a threat, and running programs | `Set-MpPreference -DisableBehaviorMonitoring 0` |
|Scan scripts as soon as they're seen or run | `Set-MpPreference -DisableScriptScanning 0` |
|Scan removable drives as soon as they're inserted or mounted | `Set-MpPreference -DisableRemovableDriveScanning 0` |

## Potentially Unwanted Application protection

[Potentially unwanted applications](detect-block-potentially-unwanted-apps-microsoft-defender-antivirus.md) are files and apps that aren't traditionally classified as malicious. Such applications include non-Microsoft installers for common software, ad-injection, and certain types of toolbars in your browser.

| Description | PowerShell Command |
|---|---|
|Prevent grayware, adware, and other potentially unwanted apps from installing|`Set-MpPreference -PUAProtection Enabled`|

## Email and archive scanning

You can set Microsoft Defender Antivirus to automatically scan certain types of email files and archive files (such as .zip files) when they're seen by Windows. For more information, see [Managed email scans in Microsoft Defender](configure-advanced-scan-types-microsoft-defender-antivirus.md).


| Description | PowerShell Command |
|---|---|
|Scan email files and archives|`Set-MpPreference -DisableArchiveScanning 0` </br> `Set-MpPreference -DisableEmailScanning 0`|

## Manage product and protection updates

Typically, you receive Microsoft Defender Antivirus updates from Windows update once per day. However, you can increase the frequency of those updates by setting the following options, and [ensuring that your updates are managed either in System Center Configuration Manager, with Group Policy, or in Intune](deploy-manage-report-microsoft-defender-antivirus.md).

| Description | PowerShell Command |
|---|---|
|Update signatures every day|`Set-MpPreference -SignatureUpdateInterval`|
|Check to update signatures before running a scheduled scan|`Set-MpPreference -CheckForSignaturesBeforeRunningScan 1`|

## Advanced threat and exploit mitigation and prevention Controlled folder access

Exploit protection provides features that help protect devices from known malicious behaviors and attacks on vulnerable technologies.

| Description | PowerShell Command |
|---|---|
|Prevent malicious and suspicious apps (such as ransomware) from making changes to protected folders with Controlled folder access|`Set-MpPreference -EnableControlledFolderAccess Enabled`|
|Block connections to known bad IP addresses and other network connections with [Network protection](network-protection.md)|`Set-MpPreference -EnableNetworkProtection Enabled`|
|Apply a standard set of mitigations with [Exploit protection](exploit-protection.md)|`Invoke-WebRequest`<br/><br/>`https://demo.wd.microsoft.com/Content/ProcessMitigation.xml -OutFile ProcessMitigation.xml`<br/><br/>`Set-ProcessMitigation -PolicyFilePath ProcessMitigation.xml`|
|Block known malicious attack vectors with [Attack surface reduction](attack-surface-reduction.md)|`Add-MpPreference -AttackSurfaceReductionRules\_Ids 56a863a9-875e-4185-98a7-b882c64b5ce5 -AttackSurfaceReductionRules\_Actions Enabled` <br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids D4F940AB-401B-4EfC-AADCAD5F3C50688A -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2 -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids BE9BA2D9-53EA-4CDC-84E5- 9B1EEEE46550 -AttackSurfaceReductionRules\_Actions Enabled` <br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 01443614-CD74-433A-B99E2ECDC07BFC25 -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 5BEB7EFE-FD9A-4556801D275E5FFC04CC -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids D3E037E1-3EB8-44C8-A917- 57927947596D -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 3B576869-A4EC-4529-8536- B80A7769E899 -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 75668C1F-73B5-4CF0-BB93- 3ECF5CB7CC84 -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 26190899-1602-49e8-8b27-eb1d0a1ce869 -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids e6db77e5-3df2-4cf1-b95a-636979351e5b -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids D1E49AAC-8F56-4280-B9BA993A6D77406C -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 33ddedf1-c6e0-47cb-833e-de6133960387 -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids B2B3F03D-6A65-4F7B-A9C7- 1C7EF74A9BA4 -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids a8f5898e-1dc8-49a9-9878-85004b8a61e6 -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids 92E97FA1-2EDF-4476-BDD6- 9DD0B4DDDC7B -AttackSurfaceReductionRules\_Actions Enabled`<br/><br/>`Add-MpPreference -AttackSurfaceReductionRules\_Ids C1DB55AB-C21A-4637-BB3FA12568109D35 -AttackSurfaceReductionRules\_Actions Enabled`|

Some rules might block behavior you find acceptable in your organization. In these cases, change the rule from `Enabled` to `Audit` to prevent unwanted blocks.

#### Enable Tamper Protection

In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Advanced features** > **Tamper Protection** > **On**.

For more information, see [How do I configure or manage tamper protection](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection). 

#### Check the Cloud Protection network connectivity

It's important to check that the Cloud Protection network connectivity is working during your pen testing. Using Command Prompt as an administrator, run the following command:

```
cd "C:\Program Files\Windows Defender"
MpCmdRun.exe -ValidateMapsConnection
```

For more information, see [Use the cmdline tool to validate cloud-delivered protection](/defender-endpoint/configure-network-connections-microsoft-defender-antivirus).

## One-select Microsoft Defender Offline Scan

Microsoft Defender Offline Scan is a specialized tool that comes with Windows 10 or newer, and allows you to boot a machine into a dedicated environment outside of the normal operating system. It's especially useful for potent malware, such as rootkits.

For more information, see [Microsoft Defender Offline](microsoft-defender-offline.md).

| Description | PowerShell Command |
|---|---|
|Ensure notifications allow you to boot the device into a specialized malware removal environment|`Set-MpPreference -UILockdown 0`|

## See also

- [Microsoft Defender for Endpoint](microsoft-defender-endpoint.md)
- [Cloud protection and Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus security intelligence and product updates](microsoft-defender-antivirus-updates.md)
