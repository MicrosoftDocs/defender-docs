---
title: Microsoft Defender for Endpoint attack surface reduction rules demonstrations
description: See how attack surface reduction rules block various known threat types.
search.appverid: met150
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.reviewer: yongrhee
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier2
- demo
ms.topic: how-to
ms.subservice: asr
ms.date: 03/09/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus
  - Microsoft 365 Apps
---

# Attack surface reduction rules demonstrations

This article provides test files, scripts, and procedures to demonstrate Attack surface reduction (ASR) rules in Microsoft Defender for Endpoint.

_Attack surfaces_ are the places where your organization is vulnerable to threats and attacks. ASR rules can help reduce the attack surface in your organization by disabling risky software behavior. For more information about ASR rules, see zzz.

## Prerequisites

- Windows 10 version 1709 (October 2017) or later.
- Windows Server 2012 R2 or later.
  - Windows Server 2012 R2 and Windows Server 2016 require the [Functionality in the modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).
- Azure Local (formerly known as Azure Stack hyper-converged infrastructure (HCI)) OS version 23H2 or later.
- [Download and extract the attack surface reduction PowerShell scripts](https://demo.wd.microsoft.com/Content/WindowsDefender_ASR_scripts.zip)

## PowerShell commands

To enable all available ASR rules, run the following command in an elevated PowerShell window (a PowerShell window you opened after selecting **Run as administrator**):

```powershell
Add-MpPreference -AttackSurfaceReductionRules_Ids 01443614-CD74-433A-B99E-2ECDC07BFC25,33DDEDF1-C6E0-47CB-833E-DE6133960387,3B576869-A4EC-4529-8536-B80A7769E899,56A863A9-875E-4185-98A7-B882C64B5CE5,5BEB7EFE-FD9A-4556-801D-275E5FFC04CC,75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84,92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B,9E6C4E1F-7D60-472F-BA1A-A39EF669E4B2,A8F5898E-1DC8-49A9-9878-85004B8A61E6,B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4,BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550,C0033C00-D16D-4114-A5A0-DC9B3A7D2CEB,C1DB55AB-C21A-4637-BB3F-A12568109D35,D1E49AAC-8F56-4280-B9BA-993A6D77406C,D3E037E1-3EB8-44C8-A917-57927947596D,D4F940AB-401B-4EFC-AADC-AD5F3C50688A,E6DB77E5-3DF2-4CF1-B95A-636979351E5B,26190899-1602-49E8-8B27-EB1D0A1CE869,7674BA52-37EB-4A4F-A9A1-F0F9A1619A2CC -AttackSurfaceReductionRules_Actions Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,AuditMode,AuditMode
```

The ASR rule names and associated GUID values are listed in the [Test files](#test-files) section.

### Verify configuration

To verify the state of ASR rules, run the following command in an elevated PowerShell window:

```powershell
$p = Get-MpPreference

$ids     = @($p.AttackSurfaceReductionRules_Ids)
$actions = @($p.AttackSurfaceReductionRules_Actions)

for ($i = 0; $i -lt [Math]::Min($ids.Count, $actions.Count); $i++) {
    [pscustomobject]@{
        RuleId = $ids[$i]
        Action = $actions[$i]
    }
}
```

The available rule states are described in the following table:

|Mode|Text<br/>value|Numeric<br/>value|
|---|---|:---:|
|Off|Disabled|0|
|Enabled in Block mode|Enabled|1|
|Enabled in Audit mode|AuditMode|2|
|Not configured|NotConfigured|5|
|Enabled in Warn mode|Warn|6|

## Test files

The following table associates the ASR rule names with the corresponding GUID values.

> [!TIP]
> ASR rule names with links are linked to test files.
>
> Some test files contain multiple exploits that trigger multiple ASR rules.

|GUID value|Rule name|
|---|---|
|01443614-CD74-433A-B99E-2ECDC07BFC25|Block executable files from running unless they meet a prevalence, age, or trusted list criterion|
|26190899-1602-49E8-8B27-EB1D0A1CE869|Block Office communication application from creating child processes|
|33DDEDF1-C6E0-47CB-833E-DE6133960387|Block rebooting machine in Safe Mode|
|3B576869-A4EC-4529-8536-B80A7769E899|[Block Office applications from creating executable content](https://demo.wd.microsoft.com/Content/TestFile_Block_Office_applications_from_creating_executable_content_3B576869-A4EC-4529-8536-B80A7769E899.docm)|
|56A863A9-875E-4185-98A7-B882C64B5CE5|Block abuse of exploited vulnerable signed drivers (Device)|
|5BEB7EFE-FD9A-4556-801D-275E5FFC04CC|Block execution of potentially obfuscated scripts|
|75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84|Block Office applications from injecting code into other processes|
|7674BA52-37EB-4A4F-A9A1-F0F9A1619A2C|Block Adobe Reader from creating child processes|
|92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B|[Block Win32 API calls from Office macros](https://demo.wd.microsoft.com/Content/Block_Win32_imports_from_Macro_code_in_Office_92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B.docm)|
|9E6C4E1F-7D60-472F-BA1A-A39EF669E4B2|Block credential stealing from the Windows local security authority subsystem|
|A8F5898E-1DC8-49A9-9878-85004B8A61E6|Block Webshell creation for Servers|
|B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4|[Block untrusted and unsigned processes that run from USB](https://demo.wd.microsoft.com/Content/UNSIGNED_ransomware_test_exe.exe)|
|BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550|Block executable content from email client and webmail|
|C0033C00-D16D-4114-A5A0-DC9B3A7D2CEB|Block use of copied or impersonated system tools|
|C1DB55AB-C21A-4637-BB3F-A12568109D35|Use advanced protection against ransomware|
|D1E49AAC-8F56-4280-B9BA-993A6D77406C|[Block process creations originating from PSExec and WMI commands](https://demo.wd.microsoft.com/Content/TestFile_PsexecAndWMICreateProcess_D1E49AAC-8F56-4280-B9BA-993A6D77406C.vbs)|
|D3E037E1-3EB8-44C8-A917-57927947596D|[Block JavaScript or VBScript from launching downloaded executable content](https://demo.wd.microsoft.com/Content/TestFile_Impede_JavaScript_and_VBScript_to_launch_executables_D3E037E1-3EB8-44C8-A917-57927947596D.js)|
|D4F940AB-401B-4EFC-AADC-AD5F3C50688A|[Block all Office applications from creating child processes](https://demo.wd.microsoft.com/Content/TestFile_OfficeChildProcess_D4F940AB-401B-4EFC-AADC-AD5F3C50688A.docm)|
|E6DB77E5-3DF2-4CF1-B95A-636979351E5B|Block persistence through WMI event subscription|

## Scenarios

### Setup

1. Run the following command in an elevated PowerShell window to set the execution policy to Unrestricted:

   ```powershell
   Set-ExecutionPolicy Unrestricted
   ```

2. Download, extract, and run this [setup script](https://demo.wd.microsoft.com/Content/ASR_SetupScript.zip).

   Or, you can do the following manual steps instead:

   1. Create the folder C:\Demo.
   1. Save this [clean file](https://demo.wd.microsoft.com/Content/testfile_safe.txt) in C:\Demo.
   1. Enable all rules using the [PowerShell command](#powershell-commands).

### Scenario 1: Attack surface reduction blocks a test file with multiple vulnerabilities

1. Enable all rules in **Block** mode using the [PowerShell command](#powershell-commands).
1. Download and open the test files/documents. If prompted, enable editing and content.

**Expected result**:

You should immediately see an "Action blocked" notification.

### Scenario 2: ASR rule blocks the test file with the corresponding vulnerability

1. Configure the individual rule you want to test. For example, to enable the **Block all Office applications from creating child processes** rule, run the following command in an elevated PowerShell window:

   ```powershell
   Add-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EfC-AADC-AD5F3C50688A -AttackSurfaceReductionRules_Actions Enabled
   ```

1. Download and open the test file/document for the rule you want to test. If prompted, enable editing and content. For example:

   [Block all Office applications from creating child processes](https://demo.wd.microsoft.com/Content/ransomware_testfile_doc.docm)

**Expected result**:

You should immediately see an "Action blocked" notification.

### Scenario 3 (Windows 10 version 1709 or later): ASR rule blocks unsigned USB content from executing

1. Enable the rule named **Block untrusted and unsigned processes that run from USB** by running the following command in an elevated PowerShell window:

    ```powershell
    Add-MpPreference -AttackSurfaceReductionRules_Ids B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4 -AttackSurfaceReductionRules_Actions Enabled
    ```

1. Download the file to a USB drive (directly or copy it to the USB drive after you download it to the hard drive):

   [Block Execution of untrusted or unsigned executables inside removable USB media](https://demo.wd.microsoft.com/Content/UNSIGNED_ransomware_test_exe.exe)

1. Run the file from the USB drive.

**Expected result**:

You should immediately see an "Action blocked" notification.

### Scenario 4: What would happen without attack surface reduction

1. Turn off all attack surface reduction rules using PowerShell command in the [Clean-up](#clean-up) section.

1. Download any test file/document. If prompted, enable editing and content.

**Expected result**:

- The files in C:\Demo are encrypted and you should get a warning message.
- Run the test file again to decrypt the files.

## Clean-up

Download, extract, and run this [clean-up script](https://demo.wd.microsoft.com/Content/ASR_CFA_CleanupScript.zip).

Or, you run the following command in an elevated PowerShell window to disable all ASR rules:

```powershell
Add-MpPreference -AttackSurfaceReductionRules_Ids 01443614-CD74-433A-B99E-2ECDC07BFC25,33DDEDF1-C6E0-47CB-833E-DE6133960387,3B576869-A4EC-4529-8536-B80A7769E899,56A863A9-875E-4185-98A7-B882C64B5CE5,5BEB7EFE-FD9A-4556-801D-275E5FFC04CC,75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84,92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B,9E6C4E1F-7D60-472F-BA1A-A39EF669E4B2,A8F5898E-1DC8-49A9-9878-85004B8A61E6,B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4,BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550,C0033C00-D16D-4114-A5A0-DC9B3A7D2CEB,C1DB55AB-C21A-4637-BB3F-A12568109D35,D1E49AAC-8F56-4280-B9BA-993A6D77406C,D3E037E1-3EB8-44C8-A917-57927947596D,D4F940AB-401B-4EFC-AADC-AD5F3C50688A,E6DB77E5-3DF2-4CF1-B95A-636979351E5B,26190899-1602-49E8-8B27-EB1D0A1CE869,7674BA52-37EB-4A4F-A9A1-F0F9A1619A2CC -AttackSurfaceReductionRules_Actions Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled
```

Clean up **C:\Demo** encryption by running the [encrypt/decrypt file](https://demo.wd.microsoft.com/Content/ransomware_cleanup_encrypt_decrypt.exe).

## See also

[Attack surface reduction rules deployment guide](attack-surface-reduction-rules-deployment.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)
