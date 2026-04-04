---
title: Microsoft Defender for Endpoint attack surface reduction rules demonstrations
description: See how attack surface reduction rules block various known threat types.
search.appverid: met150
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.reviewer: yongrhee
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier2
- demo
ms.topic: how-to
ms.subservice: asr
ms.date: 04/03/2026
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
Add-MpPreference -AttackSurfaceReductionRules_Ids 01443614-cd74-433a-b99e-2ecdc07bfc25,33ddedf1-c6e0-47cb-833e-de6133960387,3b576869-a4ec-4529-8536-b80a7769e899,56a863a9-875e-4185-98a7-b882c64b5ce5,5beb7efe-fd9a-4556-801d-275e5ffc04cc,75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84,92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b,9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2,a8f5898e-1dc8-49a9-9878-85004b8a61e6,b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4,be9ba2d9-53ea-4cdc-84e5-9b1eeee46550,c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb,c1db55ab-c21a-4637-bb3f-a12568109d35,d1e49aac-8f56-4280-b9ba-993a6d77406c,d3e037e1-3eb8-44c8-a917-57927947596d,d4f940ab-401b-4efc-aadc-ad5f3c50688a,e6db77e5-3df2-4cf1-b95a-636979351e5b,26190899-1602-49e8-8b27-eb1d0a1ce869,7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c -AttackSurfaceReductionRules_Actions Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,Enabled,AuditMode,AuditMode
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
> Rule name links are links to available test files. Some test files contain multiple exploits that trigger multiple ASR rules.
>
> GUID value links are links to the rule details.

|GUID value|Rule name|
|---|---|
|[01443614-cd74-433a-b99e-2ecdc07bfc25](attack-surface-reduction-rules-reference.md#block-executable-files-from-running-unless-they-meet-a-prevalence-age-or-trusted-list-criterion)|Block executable files from running unless they meet a prevalence, age, or trusted list criterion|
|[26190899-1602-49e8-8b27-eb1d0a1ce869](attack-surface-reduction-rules-reference.md#block-office-communication-application-from-creating-child-processes)|Block Office communication application from creating child processes|
|[33ddedf1-c6e0-47cb-833e-de6133960387](attack-surface-reduction-rules-reference.md#block-rebooting-machine-in-safe-mode)|Block rebooting machine in Safe Mode|
|[3b576869-a4ec-4529-8536-b80a7769e899](attack-surface-reduction-rules-reference.md#block-office-applications-from-creating-executable-content)|[Block Office applications from creating executable content](https://demo.wd.microsoft.com/Content/TestFile_Block_Office_applications_from_creating_executable_content_3b576869-a4ec-4529-8536-b80a7769e899.docm)|
|[56a863a9-875e-4185-98a7-b882c64b5ce5](attack-surface-reduction-rules-reference.md#block-abuse-of-exploited-vulnerable-signed-drivers)|Block abuse of exploited vulnerable signed drivers (Device)|
|[5beb7efe-fd9a-4556-801d-275e5ffc04cc](attack-surface-reduction-rules-reference.md#block-execution-of-potentially-obfuscated-scripts)|Block execution of potentially obfuscated scripts|
|[75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84](attack-surface-reduction-rules-reference.md#block-office-applications-from-injecting-code-into-other-processes)|Block Office applications from injecting code into other processes|
|[7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c](attack-surface-reduction-rules-reference.md#block-adobe-reader-from-creating-child-processes)|Block Adobe Reader from creating child processes|
|[92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b](attack-surface-reduction-rules-reference.md#block-win32-api-calls-from-office-macros)|[Block Win32 API calls from Office macros](https://demo.wd.microsoft.com/Content/Block_Win32_imports_from_Macro_code_in_Office_92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b.docm)|
|[9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2](attack-surface-reduction-rules-reference.md#block-credential-stealing-from-the-windows-local-security-authority-subsystem)|Block credential stealing from the Windows local security authority subsystem|
|[a8f5898e-1dc8-49a9-9878-85004b8a61e6](attack-surface-reduction-rules-reference.md#block-webshell-creation-for-servers)|Block Webshell creation for Servers|
|[b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4](attack-surface-reduction-rules-reference.md#block-untrusted-and-unsigned-processes-that-run-from-usb)|[Block untrusted and unsigned processes that run from USB](https://demo.wd.microsoft.com/Content/UNSIGNED_ransomware_test_exe.exe)|
|[be9ba2d9-53ea-4cdc-84e5-9b1eeee46550](attack-surface-reduction-rules-reference.md#block-executable-content-from-email-client-and-webmail)|Block executable content from email client and webmail|
|[c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb](attack-surface-reduction-rules-reference.md#block-use-of-copied-or-impersonated-system-tools)|Block use of copied or impersonated system tools|
|[c1db55ab-c21a-4637-bb3f-a12568109d35](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware)|Use advanced protection against ransomware|
|[d1e49aac-8f56-4280-b9ba-993a6d77406c](attack-surface-reduction-rules-reference.md#block-process-creations-originating-from-psexec-and-wmi-commands)|[Block process creations originating from PSExec and WMI commands](https://demo.wd.microsoft.com/Content/TestFile_PsexecAndWMICreateProcess_d1e49aac-8f56-4280-b9ba-993a6d77406c.vbs)|
|[d3e037e1-3eb8-44c8-a917-57927947596d](attack-surface-reduction-rules-reference.md#block-javascript-or-vbscript-from-launching-downloaded-executable-content)|[Block JavaScript or VBScript from launching downloaded executable content](https://demo.wd.microsoft.com/Content/TestFile_Impede_JavaScript_and_VBScript_to_launch_executables_d3e037e1-3eb8-44c8-a917-57927947596d.js)|
|[d4f940ab-401b-4efc-aadc-ad5f3c50688a](attack-surface-reduction-rules-reference.md#block-all-office-applications-from-creating-child-processes)|[Block all Office applications from creating child processes](https://demo.wd.microsoft.com/Content/TestFile_OfficeChildProcess_d4f940ab-401b-4efc-aadc-ad5f3c50688a.docm)|
|[e6db77e5-3df2-4cf1-b95a-636979351e5b](attack-surface-reduction-rules-reference.md#block-persistence-through-wmi-event-subscription)|Block persistence through WMI event subscription|

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
   Add-MpPreference -AttackSurfaceReductionRules_Ids d4f940ab-401b-4efc-aadc-ad5f3c50688a -AttackSurfaceReductionRules_Actions Enabled
   ```

1. Download and open the test file/document for the rule you want to test. If prompted, enable editing and content. For example:

   [Block all Office applications from creating child processes](https://demo.wd.microsoft.com/Content/ransomware_testfile_doc.docm)

**Expected result**:

You should immediately see an "Action blocked" notification.

<a name="scenario-3-windows-10-version-1709-or-later-asr-rule-blocks-unsigned-usb-content-from-executing"></a>

### Scenario 3: ASR rule blocks untrusted files from running from USB drives

> [!TIP]
> This ASR rule is available in Windows 10 1709 (October 2017) or later.

1. Enable the **Block untrusted and unsigned processes that run from USB** ASR rule by running the following command in an elevated PowerShell window:

    ```powershell
    Add-MpPreference -AttackSurfaceReductionRules_Ids b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4 -AttackSurfaceReductionRules_Actions Enabled
    ```

1. Download the following file to a USB drive (directly or copy it to the USB drive after you download it elsewhere):

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
Add-MpPreference -AttackSurfaceReductionRules_Ids 01443614-cd74-433a-b99e-2ecdc07bfc25,33ddedf1-c6e0-47cb-833e-de6133960387,3b576869-a4ec-4529-8536-b80a7769e899,56a863a9-875e-4185-98a7-b882c64b5ce5,5beb7efe-fd9a-4556-801d-275e5ffc04cc,75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84,92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b,9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2,a8f5898e-1dc8-49a9-9878-85004b8a61e6,b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4,be9ba2d9-53ea-4cdc-84e5-9b1eeee46550,c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb,c1db55ab-c21a-4637-bb3f-a12568109d35,d1e49aac-8f56-4280-b9ba-993a6d77406c,d3e037e1-3eb8-44c8-a917-57927947596d,d4f940ab-401b-4efc-aadc-ad5f3c50688a,e6db77e5-3df2-4cf1-b95a-636979351e5b,26190899-1602-49e8-8b27-eb1d0a1ce869,7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c -AttackSurfaceReductionRules_Actions Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled,Disabled
```

Clean up **C:\Demo** encryption by running the [encrypt/decrypt file](https://demo.wd.microsoft.com/Content/ransomware_cleanup_encrypt_decrypt.exe).

## See also

[Attack surface reduction rules deployment guide](attack-surface-reduction-rules-deployment.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)
