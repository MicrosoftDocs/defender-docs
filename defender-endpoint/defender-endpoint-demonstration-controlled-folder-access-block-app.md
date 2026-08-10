---
title: Test controlled folder access with an untrusted app
description: Use the controlled folder access (CFA) test tool to see how Microsoft Defender Antivirus blocks an untrusted app from writing to a protected folder.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.reviewer: yongrhee
ms.collection:
- m365-security
- tier2
- demo
ms.topic: how-to
ms.custom: msecd-doc-authoring-1015
ms.subservice: asr
ms.date: 08/03/2026
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to use the CFA test tool to confirm that controlled folder access blocks an untrusted app from writing to a protected folder so that I can verify CFA before I deploy it in my environment.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Demonstrate how controlled folder access (CFA) blocks an untrusted app from writing to a protected folder

Use the controlled folder access (CFA) test tool to see how Microsoft Defender Antivirus evaluates and blocks an untrusted app that tries to write a file to a protected folder.

CFA helps protect valuable data from malicious apps and threats, such as ransomware, by allowing only trusted apps to modify or delete files in protected folders. For more information, see [Controlled folder access overview](controlled-folder-access-overview.md).

> [!IMPORTANT]
> The CFA test tool, test files, and scripts in this demonstration are unsigned, so Microsoft Defender SmartScreen, your browser, or Microsoft Defender Antivirus might warn you or block the download. Use these files only on a test device. When you download the test tool, scripts, or test files, you might need to choose **Keep** (or the equivalent allow option) to complete the download.

## Prerequisites

- Windows 10, version 1709 (October 2017) or later.
- Microsoft Defender Antivirus enabled and in active mode.

For the full list of requirements, supported operating systems, and protection modes, see [Controlled folder access (CFA) overview](controlled-folder-access-overview.md).

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
   - Downloads the CFA test tool (<https://demo.wd.microsoft.com/Content/CFAtool.exe>) to `c:\demo\CFATestFiles`.
   - Turns on CFA in **Enabled** (block) mode and adds `c:\demo` to the protected folders list (without affecting your other protected folders).

   > [!IMPORTANT]
   > The setup script adds `c:\demo` to the Microsoft Defender Antivirus exclusion list. Don't run `CFAtool.exe` from `c:\demo` or one of its subfolders. Processes that run from an antivirus-excluded path might be treated as trusted and might not generate the expected CFA block or detection. Before you run the demonstration, copy `CFAtool.exe` to a folder that isn't excluded from Microsoft Defender Antivirus.
   >
   > Because `WindowsDefender_CFA_SetupScript.ps1` is shared with the [ransomware demonstration](defender-endpoint-demonstration-controlled-folder-access-ransomware.md), it also downloads a ransomware test file (`ransomware_testfile_unsigned.exe`) and a clean test file (`testfile_safe.txt`). These files aren't used in this CFA demonstration.

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

Or, if you prefer not to run the script, do the following minimal steps instead. You don't need the `c:\demo` folder that the script creates, because the CFA test tool can target any protected folder, including default protected folders such as your Documents folder.

1. Turn on CFA in **Enabled** (block) mode by running the following command in an elevated PowerShell session:

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess Enabled
   ```

   For other ways to turn on CFA and for the available modes, see [Configure controlled folder access (CFA)](controlled-folder-access-configure.md).

1. Download the CFA test tool from <https://demo.wd.microsoft.com/Content/CFAtool.exe>.

## Run the demonstration

If you ran the setup script, use the test tool that the script downloaded:

1. In File Explorer, go to `c:\demo\CFATestFiles`, and copy `CFAtool.exe` to a folder that isn't excluded from Microsoft Defender Antivirus. Don't run the tool from `c:\demo` or one of its subfolders.
1. Run `CFAtool.exe` from the folder that isn't excluded from Microsoft Defender Antivirus.
1. In the CFA test tool, configure the following settings:
   - **File name**: By default, `TestFile.txt` is selected, but you can change the filename and type.
   - **Save file to**: Select **Custom path** and then enter `c:\demo` (which the setup script added to the protected folders list).
   - **Reload**: Leave this option selected.

   When you're ready, select **Create file**.

Or, if you used the minimal manual steps, run the test tool against any protected folder:

1. Run the CFA test tool (`CFAtool.exe`) that you downloaded.
1. In the CFA test tool, configure the following settings:
   - **File name**: By default, `TestFile.txt` is selected, but you can change the filename and type.
   - **Save file to**: Select [any folder that's protected by CFA](controlled-folder-access-overview.md#default-folders-protected-by-cfa). For example:
     - **Documents**
     - **Pictures**
     - **Music**
     - **Videos**

   When you're ready, select **Create file**.

In both cases, CFA blocks the test tool from writing to the protected folder, and a notification appears. To view the resulting block and audit events, see [Monitor controlled folder access (CFA) activity](controlled-folder-access-monitor.md).

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

1. Download and extract the cleanup script `WindowsDefender_ASR_CFA_CleanupScript.ps1` from this ZIP file: <https://demo.wd.microsoft.com/Content/ASR_CFA_CleanupScript.zip>. The cleanup script does the following tasks:

   - Turns off CFA and removes `c:\demo` from the protected folders list (without affecting your other protected folders).
   - Although this CFA demonstration doesn't use attack surface reduction (ASR) rules, the script is shared with the ASR rules demonstration, so the script disables the following ASR rules:
     - [ASR rules used by the ASR rules demonstration](defender-endpoint-demonstration-attack-surface-reduction-rules.md#asr-rules-in-this-demonstration)
     - [Block Adobe Reader from creating child processes](attack-surface-reduction-rules-reference.md#block-adobe-reader-from-creating-child-processes) (`7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c`)
     - [Block Office communication application from creating child processes](attack-surface-reduction-rules-reference.md#block-office-communication-application-from-creating-child-processes) (`26190899-1602-49e8-8b27-eb1d0a1ce869`)
   - Downloads a decryption tool (`ransomware_cleanup_encrypt_decrypt.exe`) to `c:\demo\CleanupTools`. This tool is used by the [ransomware demonstration](defender-endpoint-demonstration-controlled-folder-access-ransomware.md), not by this test tool scenario.

1. The cleanup script is unsigned, so set the execution policy and unblock the script as described in [Set up the demonstration](#set-up-the-demonstration). Then run the cleanup script in an elevated PowerShell session.

Or, if you used the minimal manual steps, set CFA back to the original mode that you noted in [Set up the demonstration](#set-up-the-demonstration) by running the following command in an elevated PowerShell session, where `<Mode>` is one of the available [CFA modes](controlled-folder-access-overview.md#modes-for-cfa):

```powershell
Set-MpPreference -EnableControlledFolderAccess <Mode>
```

For example, to turn CFA off again (the default state), run the following command:

```powershell
Set-MpPreference -EnableControlledFolderAccess Disabled
```

If you ran the setup script, it created a `c:\demo` folder with test files and added a `c:\demo` Microsoft Defender Antivirus exclusion, neither of which the cleanup script removes. To fully revert the changes:

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
