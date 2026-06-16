---
title: Troubleshoot Microsoft Defender Antivirus settings
description: Find out where settings for Microsoft Defender Antivirus are coming from.
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: troubleshooting-general
ms.date: 11/06/2025
ms.subservice: ngp
ms.localizationpriority: medium
ms.collection: # Useful for querying on a set of strategic or high-priority content.
ms.custom: partner-contribution
appliesto:
- Microsoft Defender for Business
  - Microsoft Defender for Individuals
  - Microsoft Defender Antivirus
---

# Troubleshoot Microsoft Defender Antivirus settings

Microsoft Defender Antivirus provides numerous ways to manage the product, which provides small and medium-sized businesses and enterprise organizations with flexibility by working with the management tools that they already have.

- Microsoft Defender for Endpoint security settings management
- Microsoft Intune (MDM)
- Microsoft Configuration Manager with Tenant Attaches
- Microsoft Configuration Manager co-management
- Microsoft Configuration Manager (standalone)
- Group Policy (GPO)
- PowerShell
- Windows Management Instrumentation (WMI)
- Registry

> [!TIP]
> For best results, use one method of managing Microsoft Defender Antivirus.

## Troubleshooting Microsoft Defender Antivirus settings

Suppose that migrating from a non-Microsoft antivirus product, and when you try enabling Microsoft Defender Antivirus, it won't start. Most likely, you're experiencing a policy conflict.

To remove policy conflicts, here's our current, recommended process:

1. Understand the order of precedence.
1. Determine where Microsoft Defender Antivirus settings are configured.
1. Identify policies and settings.
1. Work with your security team to remove or revise conflicting policies.

> [!TIP]
> In versions of the Microsoft Defender antimalware platform before 4.18.2108.4 (September 2021), the dword registry key `DisableAntispyware` with the value 1 at `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender` could also prevent Microsoft Defender Antivirus from starting.

## Step 1: Understand the order of precedence

> [!NOTE]
> Microsoft Defender for Endpoint attach configurations can be overridden by other configuration tools that write to the same registry location.
>
> Starting in February 2026, Microsoft Defender Antivirus on Windows is changing how antivirus settings (like exclusions) are stored when Microsoft Defender for Endpoint configuration management is enabled in an organization. Starting with the 4.18.25110.6 release, organizations using Microsoft Defender for Endpoint configuration management can no longer read exclusion values directly from the local device registry. Instead, setting configuration must be retrieved using supported Microsoft Defender PowerShell cmdlets. Organizations using Defender for Endpoint configuration management must use supported Defender PowerShell cmdlets (such as Get-MpPreference).

When policies and settings are configured in multiple tools, in general, here's the order of precedence:

1. Microsoft Defender for Endpoint security settings management
1. Group Policy (GPO)
1. Microsoft Configuration Manager co-management
1. Microsoft Configuration Manager (standalone)
1. Microsoft Intune (MDM)
1. Microsoft Configuration Manager with Tenant Attaches
1. PowerShell ([Set-MpPreference](/powershell/module/defender/set-mppreference)), [MpCmdRun command-line tool](command-line-arguments-microsoft-defender-antivirus.md), or [Windows Management Instrumentation](use-wmi-microsoft-defender-antivirus.md) (WMI).

> [!WARNING]
> [MDMWinsOverGP](/windows/client-management/mdm/policy-csp-controlpolicyconflict) is a Policy CSP setting that doesn't apply for all settings, such as [attack surface reduction (ASR) rules](attack-surface-reduction-rules-overview.md) in Windows 10.

## Step 2: Determine where Microsoft Defender Antivirus settings are configured

Find out whether Microsoft Defender Antivirus settings are coming through a policy, MDM, or a local setting. The following table describes policies, settings, and relevant tools.

|Policy or setting|Registry location|Tools|
|---|---|---|
|Policy|`HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender`|<ul><li>Microsoft Defender for Endpoint security settings management</li><li>Microsoft Configuration Manager co-management</li><li>Microsoft Configuration Manager</li><li>GPO</li></ul>|
|MDM|`HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager`|<ul><li>Microsoft Intune (MDM)</li><li>Microsoft Configuration Manager with Tenant Attaches</li></ul>|
|Local setting|`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender`|<ul><li>PowerShell (Set-MpPreference)</li><li>MpCmdRun command-line tool</li><li>Windows Management Instrumentation (WMI)</li></ul>|

## Step 3: Identify policies or settings

The following table describes how to identify policies and settings.

|Method used|What to check|
|---|---|
|Policy|<ul><li>**If you're using GPO**: Run the following command in an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**):  `GpResult.exe /h C:\temp\GpResult_output.html`.</li><li>If you're using Microsoft Configuration Manager co-management or Microsoft Configuration Manager (standalone), go to `C:\Windows\CCM\Logs`.</li></ul>|
|MDM|If you're using Intune, on your device, select **Start**, open Command Prompt as an administrator, and then run the command `mdmdiagnosticstool.exe -out "c:\temp\MDMDiagReport.zip"`. For more information, see [Collect MDM logs - Windows Client Management](/windows/client-management/mdm-collect-logs).|
|Local setting|Determine whether the policy or setting was deployed during the imaging (sysprep), via PowerShell (for example, Set-MpPreference), Windows Management Instrumentation (WMI), or through a direct modification to the registry.|

## Step 4: Remove or revise conflicting policies

Once you have identified the conflicting policy, work with your security administrators to change device targeting so that devices receive the correct Microsoft Defender Antivirus settings.
