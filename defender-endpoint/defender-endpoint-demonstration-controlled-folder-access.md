---
title: Microsoft Defender for Endpoint Controlled folder access (CFA) demonstrations
description: Demonstrates how Controlled Folder Access protects valuable data from malicious apps and threats, such as ransomware.
search.appverid: met150
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
- demo
ms.topic: article
ms.subservice: asr
ms.date: 10/11/2024
---

# Controlled folder access (CFA) demonstrations (block ransomware)

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

Controlled folder access helps you protect valuable data from malicious apps and threats, such as ransomware. Microsoft Defender Antivirus assesses all apps (any executable file, including .exe, .scr, .dll files and others) and then determines if the app is malicious or safe. If the app is determined to be malicious or suspicious, then the app can't make changes to any files in any protected folder.

## Scenario requirements and setup

- Windows 10 1709 build 16273
- Microsoft Defender Antivirus (active mode)

## PowerShell commands

```powershell
Set-MpPreference -EnableControlledFolderAccess (State)
```

```powershell
Set-MpPreference -ControlledFolderAccessProtectedFolders C:\demo\
```

## Rule states

|State | Mode| Numeric value |
|---|---|---|
| Disabled | Off | 0 |
| Enabled | Block mode | 1 |
| Audit | Audit mode | 2 |

## Verify configuration

```powershell
Get-MpPreference
```

## Test file

[CFA ransomware test file](https://demo.wd.microsoft.com/Content/ransomware_testfile_unsigned.exe)

## Scenarios

### Setup

Download and run this [setup script](https://demo.wd.microsoft.com/Content/CFA_SetupScript.zip). Before running the script, set execution policy to `Unrestricted` by using this PowerShell command: 

```powershell
Set-ExecutionPolicy Unrestricted
```

Or, you can perform these manual steps instead:

1. Create a folder under `c:` named `demo`, as in `c:\demo`.

2. Save this [clean file](https://demo.wd.microsoft.com/Content/testfile_safe.txt) into `c:\demo` (we need something to encrypt).

3. Run the PowerShell commands listed earlier in this article.

Next, check that status of the *Aggressive Ransomware Prevention* ASR rule and disable it for the duration of this test if it's enabled:


```powershell
$idx = $(Get-MpPreference).AttackSurfaceReductionRules_Ids.IndexOf("C1DB55AB-C21A-4637-BB3F-A12568109D35")
if ($idx -ge 0) {Write-Host "Rule Status: " $(Get-MpPreference).AttackSurfaceReductionRules_Actions[$idx]} else {Write-Host "Rule does not exist on this machine"}
```

If the rule exists and the status is `1 (Enabled)` or `6 (Warn)`, it must be disabled to run this test:

```powershell
Add-MpPreference -AttackSurfaceReductionRules_Ids C1DB55AB-C21A-4637-BB3F-A12568109D35 -AttackSurfaceReductionRules_Actions Disabled
```

### Scenario 1: CFA blocks ransomware test file

1. Turn on CFA using PowerShell command:

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess Enabled
   ```

2. Add the demo folder to protected folders list using PowerShell command:

   ```powershell
   Set-MpPreference -ControlledFolderAccessProtectedFolders C:\demo\
   ```

3. Download the ransomware [test file](https://demo.wd.microsoft.com/Content/ransomware_testfile_unsigned.exe).

4. Execute the ransomware test file. Note that it isn't ransomware; it simply tries to encrypt `c:\demo`.

#### Scenario 1 expected results

About five seconds after executing the ransomware test file, you should see a notification that CFA blocked the encryption attempt.

### Scenario 2: What would happen without CFA

1. Turn off CFA using this PowerShell command:

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess Disabled
   ```

2. Execute the ransomware [test file](https://demo.wd.microsoft.com/Content/ransomware_testfile_unsigned.exe).

#### Scenario 2 expected results

- The files in `c:\demo` are encrypted and you should get a warning message
- Execute the ransomware test file again to decrypt the files

## Clean-up

1. Download and run this [cleanup script](https://demo.wd.microsoft.com/Content/ASR_CFA_CleanupScript.zip). You can perform these manual steps instead:

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess Disabled
   ```

2. Clean up `c:\demo` encryption by using the [encrypt/decrypt file](https://demo.wd.microsoft.com/Content/ransomware_cleanup_encrypt_decrypt.exe)

3. If the *Aggressive Ransomware Prevention* ASR rule was enabled and you disabled it at the beginning of this test, enable it again:

   ```powershell
   Add-MpPreference -AttackSurfaceReductionRules_Ids C1DB55AB-C21A-4637-BB3F-A12568109D35 -AttackSurfaceReductionRules_Actions Enabled
   ```

## See also

[Controlled folder access](/windows/threat-protection/windows-defender-exploit-guard/controlled-folders-exploit-guard?ocid=wd-av-demo-cfa-bottom)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
