---
title: Demonstrate how controlled folder access (CFA) blocks ransomware
description: Use a ransomware test file to see how controlled folder access (CFA) in Microsoft Defender Antivirus protects your files from ransomware.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
- demo
ms.topic: how-to
ms.custom: msecd-doc-authoring-1015
ms.subservice: asr
ms.date: 08/12/2026
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to use a ransomware test file to confirm that controlled folder access blocks ransomware from encrypting files in a protected folder so that I can verify CFA before I deploy it in my environment.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Demonstrate how controlled folder access (CFA) blocks ransomware

Use a ransomware test file to see how controlled folder access (CFA) protects important folders from an untrusted process that tries to encrypt them.

[Controlled folder access](controlled-folder-access-overview.md) (CFA) helps protect valuable data from malicious apps and threats, such as ransomware, by allowing only trusted apps to change files in protected folders. Microsoft Defender Antivirus assesses all apps (any executable file, including .exe, .scr, and .dll files) and blocks the ones it determines to be malicious or suspicious from changing files in protected folders.

> [!IMPORTANT]
> The ransomware test file and scripts in this demonstration are unsigned and intentionally behave like malicious software, so Microsoft Defender SmartScreen, your browser, or Microsoft Defender Antivirus might warn you or block the download. Use these files only on a test device. When you download the setup or cleanup scripts or the ransomware test file, you might need to choose **Keep** (or the equivalent allow option) to complete the download.

## Prerequisites

- Windows 10, version 1709 (October 2017) or later.
- Microsoft Defender Antivirus enabled and in active mode.

For the full list of requirements, supported operating systems, and protection modes, see [Controlled folder access (CFA) overview](controlled-folder-access-overview.md). For the methods you can use to turn on CFA and add protected folders, see [Configure controlled folder access (CFA)](controlled-folder-access-configure.md).

## Set up the demonstration

> [!NOTE]
> The setup script enables CFA in block mode. To see the current [CFA mode](controlled-folder-access-overview.md#modes-for-cfa), run the following command in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**):
>
> ```powershell
> Get-MpPreference | Format-List EnableControlledFolderAccess
> ```
>
> Note the mode value so that you can [set CFA back to it](#clean-up-the-demonstration) when you're finished with the demonstration.

1. Download and extract the setup script `WindowsDefender_CFA_SetupScript.ps1` from this ZIP file: <https://demo.wd.microsoft.com/Content/CFA_SetupScript.zip>. The setup script automates the following steps:

   - Resets any existing demonstration configuration by turning off CFA and removing `c:\demo` from the protected folders list (without affecting your other protected folders).
   - Creates the `c:\demo` folder and adds it to the Microsoft Defender Antivirus exclusion list (without affecting your other exclusions).
   - Downloads a ransomware test file (`ransomware_testfile_unsigned.exe`) to `c:\demo\CFATestFiles`, and a clean test file (`testfile_safe.txt`) to `c:\demo`.
   - Turns on CFA in **Enabled** (block) mode and adds `c:\demo` to the protected folders list (without affecting your other protected folders).

   > [!IMPORTANT]
   > The setup script adds `c:\demo` to the Microsoft Defender Antivirus exclusion list. Don't run `ransomware_testfile_unsigned.exe` from `c:\demo` or one of its subfolders when you're testing for a CFA block or detection. Processes that run from an antivirus-excluded path might be treated as trusted and might not generate the expected CFA block or detection. Before you run the demonstration, copy `ransomware_testfile_unsigned.exe` to a folder that isn't excluded from Microsoft Defender Antivirus.
   >
   > Because `WindowsDefender_CFA_SetupScript.ps1` is shared with the [block an untrusted app demonstration](defender-endpoint-demonstration-controlled-folder-access-block-app.md), it also downloads the CFA test tool (`CFAtool.exe`). That tool isn't used in this ransomware scenario.

1. Before you run the script, allow it to run by setting the execution policy to `RemoteSigned` for the current session. Run the following command in an elevated PowerShell session:

   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
   ```

   `RemoteSigned` is safer than `Unrestricted` because it still blocks unsigned scripts that are downloaded from the internet, and the `Process` scope reverts the change when you close the session.

   > [!TIP]
   > Because the setup script is unsigned, `RemoteSigned` blocks it if the script still carries the "downloaded from the internet" mark (the mark-of-the-web). If that happens, confirm that the script is from a trusted source, and then unblock it before you run it:
   >
   > ```powershell
   > Unblock-File -Path "<path>\WindowsDefender_CFA_SetupScript.ps1"
   > ```

Or, if you prefer not to run the script, do the following minimal steps instead:

1. Create a folder named `demo` under `c:`, as in `c:\demo`.

1. Download the clean test file (`testfile_safe.txt`) from <https://demo.wd.microsoft.com/Content/testfile_safe.txt> and save it to `c:\demo`. The test needs a file to attempt to encrypt.

Whichever method you use, the setup script doesn't change attack surface reduction (ASR) rules, so check the [Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware) ASR rule and disable it for the duration of this test if it's enabled. Otherwise, it might block the ransomware test file before CFA does. To check the rule status, run the following command in an elevated PowerShell session:

```powershell
$idx = $(Get-MpPreference).AttackSurfaceReductionRules_Ids.IndexOf("C1DB55AB-C21A-4637-BB3F-A12568109D35")
if ($idx -ge 0) {Write-Host "Rule Status: " $(Get-MpPreference).AttackSurfaceReductionRules_Actions[$idx]} else {Write-Host "Rule does not exist on this machine"}
```

If the rule exists and the status is `1 (Enabled)` or `6 (Warn)`, note the current value so that you can [restore it during cleanup](#clean-up-the-demonstration), and then disable it (`0`) to run this test:

```powershell
Add-MpPreference -AttackSurfaceReductionRules_Ids C1DB55AB-C21A-4637-BB3F-A12568109D35 -AttackSurfaceReductionRules_Actions Disabled
```

Any other status, such as `2 (Audit)`, only logs activity and doesn't block, so the rule doesn't interfere with this test. Leave it unchanged.

## Run the demonstration

### Scenario 1: CFA blocks the ransomware test file

If you ran the setup script, the ransomware test file is already downloaded to `c:\demo\CFATestFiles`, and CFA already protects `c:\demo`:

1. In File Explorer, go to `c:\demo\CFATestFiles`, and copy `ransomware_testfile_unsigned.exe` to a folder that isn't excluded from Microsoft Defender Antivirus. Don't run the test file from `c:\demo` or one of its subfolders.
1. Run `ransomware_testfile_unsigned.exe` from the folder that isn't excluded from Microsoft Defender Antivirus. It isn't actual ransomware; it only tries to encrypt the files in `c:\demo`.

If you didn't run the setup script, the following manual steps are required:

1. Turn on CFA in **Enabled** (block) mode by running the following command in an elevated PowerShell session:

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess Enabled
   ```

1. Add the `c:\demo` folder to the protected folders list by running the following command in an elevated PowerShell session:

   ```powershell
   Add-MpPreference -ControlledFolderAccessProtectedFolders C:\demo\
   ```

1. Add `c:\demo` to the Microsoft Defender Antivirus exclusion list so that real-time protection doesn't quarantine the ransomware test file before you can run it. Run the following command in an elevated PowerShell session:

   ```powershell
   Add-MpPreference -ExclusionPath C:\demo
   ```

1. Download the ransomware test file (`ransomware_testfile_unsigned.exe`) from <https://demo.wd.microsoft.com/Content/ransomware_testfile_unsigned.exe> and save it to `c:\demo`.

1. Copy `ransomware_testfile_unsigned.exe` to a folder that isn't excluded from Microsoft Defender Antivirus. Don't run the test file from `c:\demo` or one of its subfolders.

1. Run `ransomware_testfile_unsigned.exe` from the folder that isn't excluded from Microsoft Defender Antivirus. It isn't actual ransomware; it only tries to encrypt the files in `c:\demo`.

In either case, about five seconds after you run the ransomware test file, a notification appears that CFA blocked the encryption attempt. To view the resulting block and audit events, see [Monitor controlled folder access (CFA) activity](controlled-folder-access-monitor.md).

### Scenario 2: Without CFA, the ransomware test file encrypts files

1. Turn off CFA by running the following command in an elevated PowerShell session:

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess Disabled
   ```

1. Run the original ransomware test file from the antivirus-excluded folder:
   - If you ran the setup script, run `c:\demo\CFATestFiles\ransomware_testfile_unsigned.exe`.
   - If you used the manual steps, run `c:\demo\ransomware_testfile_unsigned.exe`.

With CFA turned off, the test file encrypts the files in `c:\demo` and you get a warning message. Run the test file once more to decrypt the files.

## Clean up the demonstration

If you ran the setup script, undo the demonstration by running the cleanup script:

> [!IMPORTANT]
> The cleanup script turns off CFA and disables the ASR rules listed in the script, even if you turned on CFA or those rules for other reasons. Before you run the script, check your current ASR rule states so that you can re-enable any rules you want to keep:
>
> ```powershell
> $p = Get-MpPreference;0..([math]::Min($p.AttackSurfaceReductionRules_Ids.Count,$p.AttackSurfaceReductionRules_Actions.Count)-1) | % {[pscustomobject]@{Id=$p.AttackSurfaceReductionRules_Ids[$_];Action=$p.AttackSurfaceReductionRules_Actions[$_]}} | Format-Table -AutoSize
> ```
>
> The script sets CFA to **Disabled**. To set CFA to a mode other than **Disabled**, use the manual steps later in this section.

1. Download and extract the cleanup script `WindowsDefender_ASR_CFA_CleanupScript.ps1` from this ZIP file: <https://demo.wd.microsoft.com/Content/ASR_CFA_CleanupScript.zip>. The cleanup script does the following:

   - Turns off CFA and removes `c:\demo` from the protected folders list (without affecting your other protected folders).
   - Although this CFA demonstration doesn't enable any ASR rules, the script is shared with the ASR rules demonstration, so the script disables the following ASR rules:
     - [ASR rules used by the ASR rules demonstration](defender-endpoint-demonstration-attack-surface-reduction-rules.md#asr-rules-in-this-demonstration), including [Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware)
     - [Block Adobe Reader from creating child processes](attack-surface-reduction-rules-reference.md#block-adobe-reader-from-creating-child-processes) (`7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c`)
     - [Block Office communication application from creating child processes](attack-surface-reduction-rules-reference.md#block-office-communication-application-from-creating-child-processes) (`26190899-1602-49e8-8b27-eb1d0a1ce869`)
   - Downloads a decryption tool (`ransomware_cleanup_encrypt_decrypt.exe`) to `c:\demo\CleanupTools`, and uses it to decrypt `testfile_safe.txt` if Scenario 2 encrypted it.

1. The cleanup script is unsigned, so set the execution policy and unblock the script as described in [Set up the demonstration](#set-up-the-demonstration). Then run the cleanup script in an elevated PowerShell session.

Or, if you used the minimal manual steps, do the following:

1. Set CFA back to the original mode that you noted in [Set up the demonstration](#set-up-the-demonstration) by running the following command in an elevated PowerShell session, where `<Mode>` is one of the available [CFA modes](controlled-folder-access-overview.md#modes-for-cfa):

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess <Mode>
   ```

   For example, to turn CFA off again (the default state), run the following command:

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess Disabled
   ```

1. If Scenario 2 encrypted the files in `c:\demo`, decrypt them by using the [decryption tool](https://demo.wd.microsoft.com/Content/ransomware_cleanup_encrypt_decrypt.exe) (`ransomware_cleanup_encrypt_decrypt.exe`).

1. If you disabled the [Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware) ASR rule at the start of the test, set it back to the value you noted by running the following command in an elevated PowerShell session, where `<Mode>` is the [mode value](attack-surface-reduction-rules-overview.md#modes-for-asr-rules) `Enabled` or `Warn`:

   ```powershell
   Add-MpPreference -AttackSurfaceReductionRules_Ids C1DB55AB-C21A-4637-BB3F-A12568109D35 -AttackSurfaceReductionRules_Actions <Mode>
   ```

Whichever method you used, the cleanup script doesn't remove the `c:\demo` Microsoft Defender Antivirus exclusion that the setup script (or the manual steps) added. To fully revert the changes, do the following steps:

1. Delete any copies of `ransomware_testfile_unsigned.exe` that you made outside `c:\demo`.

1. Delete the `c:\demo` folder and the test files it contains. Do this step _before_ you remove the exclusion in the next step. Otherwise, when real-time protection resumes for the folder, Microsoft Defender Antivirus detects the leftover test files (such as the ransomware test file and the decryption tool) and quarantines them. Run the following command in an elevated PowerShell session:

   ```powershell
   Remove-Item -Path C:\demo -Recurse -Force
   ```

1. Remove the `c:\demo` Microsoft Defender Antivirus exclusion by running the following command in an elevated PowerShell session:

   ```powershell
   Remove-MpPreference -ExclusionPath C:\demo
   ```

## Related content

- [Controlled folder access (CFA) overview](controlled-folder-access-overview.md)
- [Configure controlled folder access (CFA)](controlled-folder-access-configure.md)
- [Monitor controlled folder access (CFA) activity](controlled-folder-access-monitor.md)
- [Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)
