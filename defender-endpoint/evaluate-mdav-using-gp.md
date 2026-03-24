---
title: Evaluate Microsoft Defender Antivirus using Group Policy
description: Use this guide to evaluate and test the protection offered by Microsoft Defender Antivirus using Group Policy.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.custom: nextgen
ms.date: 10/20/2025
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

# Evaluate Microsoft Defender Antivirus using Group Policy

In current versions of Microsoft Windows and Windows Server, you can use next-generation protection features offered by Microsoft Defender Antivirus (MDAV) and Microsoft Defender Exploit Guard (Microsoft Defender EG).

This article explains how to enable and test the key protection features in Microsoft Defender AV and Microsoft Defender EG.

## Prerequisites

### Supported operating systems

- Windows 10 or later
- Windows Server 2016 or later

## Use Microsoft Defender Antivirus using Group Policy to enable the features

This section describes how to use a [Group Policy Central Store](/troubleshoot/windows-client/group-policy/create-and-manage-central-store) to configure Microsoft Defender Antivirus for evaluation.

1. Download the latest Administrative Template files from [Links to download the Administrative Templates files based on the operating system version](/troubleshoot/windows-client/group-policy/create-and-manage-central-store#links-to-download-the-administrative-templates-files-based-on-the-operating-system-version).

   > [!TIP]
   > Check the **System Requirements** section on the individual download pages:
   >
   > - Most downloads support Windows clients and Windows servers.
   > - Get the latest available and applicable download.

1. Do one of the following procedures to create a Central Store to host the latest .admx and .adml templates:
   - **Domains**:
     1. Create a new OU to block policy inheritance.
     1. Open the Group policy Management Console (gpmc.msc).
     1. Go to **Group Policy Objects** and create a new group policy.
     1. Right-click on the new group policy and then select **Edit**.
     1. Go to **Computer Configuration** \> **Policies** \> **Administrative Templates** \> **Windows Components** \> **Microsoft Defender Antivirus**.

   - **Workgroups**:
     1. Open the Group Policy Editor (gpedit.msc).
     1. Go to **Computer Configuration** > **Administrative Templates** > **Windows Components** > **Microsoft Defender Antivirus**.

For more information, see [Create and manage Central Store - Windows Client](/troubleshoot/windows-client/group-policy/create-and-manage-central-store#the-central-store).

## MDAV and Potentially Unwanted Applications (PUA)

**Root**:

|Description|Setting|
|---|---|
|Turn off Microsoft Defender Antivirus|Disabled|
|Configure detection for potentially unwanted applications|Enabled - Block|

## Real-time protection (always-on protection, real-time scanning)

**Real-time protection**:

|Description|Setting|
|---|---|
|Turn off real-time protection|Disabled|
|Configure monitoring for incoming and outgoing file and program activity|Enabled, bi-directional (full on-access)|
|Turn on Behavior Monitoring|Enabled|
|Monitor file and program activity on your computer|Enabled|

## Cloud protection features

Standard security intelligence updates can take hours to prepare and deliver; our cloud-delivered protection service can deliver this protection in seconds.

For more information, see [Use next-gen technologies in Microsoft Defender Antivirus through cloud-delivered protection](/windows/threat-protection/windows-defender-antivirus/utilize-microsoft-cloud-protection-windows-defender-antivirus).

**MAPS**:

|Description|Setting|
|---|---|
|Join Microsoft MAPS|Enabled, Advanced MAPS|
|Configure the 'Block at First Sight' feature|Enabled|
|Send file samples when further analysis is required|Enabled, Send all samples|

**MpEngine**:

|Description|Setting|
|---|---|
|Select cloud protection level|Enabled, High blocking level|
|Configure extended cloud check|Enabled, 50|

## Scans

|Description|Setting|
|---|---|
|Turn on Heuristics|Enabled|
|Turn on e-mail scanning|Enabled|
|Scan all downloaded files and attachments|Enabled|
|Turn on script scanning|Enabled|
|Scan archive files|Enabled|
|Scan packed executables|Enabled|
|Configure scanning of network files (Scan Network Files|Enabled|
|Scan removable drives|Enabled|
|Turn on reparse point scanning|Enabled|

## Security Intelligence updates

|Description|Setting|
|---|---|
|Specify the interval to check for security intelligence updates|Enabled, 4|
|Define the order of sources for downloading security intelligence updates|Enabled, under 'Define the order of sources for downloading security intelligence updates'<br><br>InternalDefinitionUpdateServer \|MicrosoftUpdateServer \|MMPC<br><br>**Note:** Where InternalDefinitionUpdateServer is WSUS with Microsoft Defender Antivirus updates allowed.<br><br>MicrosoftUpdateServer == Microsoft Update (formerly Windows Update).<br><br>MMPC == https://www.microsoft.com/en-us/wdsi/definitions|

## Disable local administrator AV settings

Disable local administrator AV settings such as exclusions, and enforce the policies from the Microsoft Defender for Endpoint Security Settings Management.

**Root:**

|Description|Setting|
|---|---|
|Configure local administrator merge behavior for lists|Disabled|
|Control whether or not exclusions are visible to local admins|Enabled|

## Threat Severity Default Action

**Threats**:

|Description|Setting|Alert level|Action|
|---|---|---|---|
|Specify threat alert levels at which default action shouldn't be taken when detected|Enabled|||
|||5 (Severe)|2 (Quarantine)|
|||4 (High)|2 (Quarantine)|
|||2 (Medium)|2 (Quarantine)|
|||1 (Low)|2 (Quarantine)|

**Quarantine**:

|Description|Setting|
|---|---|
|Configure removal of items from Quarantine folder|Enabled, 60|

**Client Interface**:

|Description|Setting|
|---|---|
|Enable headless UI mode|Disabled|

## Network Protection

**Microsoft Defender Exploit Guard\\Network Protection:**

|Description|Setting|
|---|---|
|Prevent users and apps from accessing dangerous websites|Enabled, Block|
|This settings controls whether Network Protection can be configured into block or audit mode on Windows Server|Enabled|

To enable Network Protection for Windows Servers, for now, please use PowerShell:

|OS|PowerShell command|
|---|---|
|Windows Server 2012 R2 and later|`Set-MpPreference -AllowNetworkProtectionOnWinServer $true`|
|Windows Server 2016 and Windows Server 2012 R2 [unified MDE client](update-agent-mma-windows.md#upgrade-to-the-new-unified-agent-for-defender-for-endpoint)|`Set-MpPreference -AllowNetworkProtectionOnWinServer $true -AllowNetworkProtectionDownLevel $ true`|

## Attack surface reduction rules

1. Go to **Computer Configuration** \> **Administrative Templates** \> **Windows Components** \> **Microsoft Defender Antivirus** \> **Microsoft Defender Exploit Guard** \> **Attack Surface Reduction**.

2. Select **Next**.

|Value name|ASR rule name|Value|
|---|---|---|
|01443614-cd74-433a-b99e-2ecdc07bfc25|[Block executable files from running unless they meet a prevalence, age, or trusted list criterion](attack-surface-reduction-rules-reference.md#block-executable-files-from-running-unless-they-meet-a-prevalence-age-or-trusted-list-criterion)|1 (Block)|
|26190899-1602-49e8-8b27-eb1d0a1ce869|[Block Office communication application from creating child processes](attack-surface-reduction-rules-reference.md#block-office-communication-application-from-creating-child-processes)|1 (Block)|
|33ddedf1-c6e0-47cb-833e-de6133960387|[Block rebooting machine in Safe Mode](attack-surface-reduction-rules-reference.md#block-rebooting-machine-in-safe-mode)|1 (Block)|
|3b576869-a4ec-4529-8536-b80a7769e899|[Block Office applications from creating executable content](attack-surface-reduction-rules-reference.md#block-office-applications-from-creating-executable-content)|1 (Block)|
|56a863a9-875e-4185-98a7-b882c64b5ce5|[Block abuse of exploited vulnerable signed drivers (Device)](attack-surface-reduction-rules-reference.md#block-abuse-of-exploited-vulnerable-signed-drivers-device)|1 (Block)|
|5beb7efe-fd9a-4556-801d-275e5ffc04cc|[Block execution of potentially obfuscated scripts](attack-surface-reduction-rules-reference.md#block-execution-of-potentially-obfuscated-scripts)|1 (Block)|
|75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84|[Block Office applications from injecting code into other processes](attack-surface-reduction-rules-reference.md#block-office-applications-from-injecting-code-into-other-processes)|1 (Block)|
|7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c|[Block Adobe Reader from creating child processes](attack-surface-reduction-rules-reference.md#block-adobe-reader-from-creating-child-processes)|1 (Block)|
|92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b|[Block Win32 API calls from Office macros](attack-surface-reduction-rules-reference.md#block-win32-api-calls-from-office-macros)|1 (Block)|
|9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2|[Block credential stealing from the Windows local security authority subsystem](attack-surface-reduction-rules-reference.md#block-credential-stealing-from-the-windows-local-security-authority-subsystem)|1 (Block)|
|a8f5898e-1dc8-49a9-9878-85004b8a61e6|[Block Webshell creation for Servers](attack-surface-reduction-rules-reference.md#block-webshell-creation-for-servers)|1 (Block)|
|b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4|[Block untrusted and unsigned processes that run from USB](attack-surface-reduction-rules-reference.md#block-untrusted-and-unsigned-processes-that-run-from-usb)|1 (Block)|
|be9ba2d9-53ea-4cdc-84e5-9b1eeee46550|[Block executable content from email client and webmail](attack-surface-reduction-rules-reference.md#block-executable-content-from-email-client-and-webmail)|1 (Block)|
|c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb|[Block use of copied or impersonated system tools](attack-surface-reduction-rules-reference.md#block-use-of-copied-or-impersonated-system-tools)|1 (Block)|
|c1db55ab-c21a-4637-bb3f-a12568109d35|[Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware)|1 (Block)|
|d1e49aac-8f56-4280-b9ba-993a6d77406c|[Block process creations originating from PSExec and WMI commands](attack-surface-reduction-rules-reference.md#block-process-creations-originating-from-psexec-and-wmi-commands)|1 (Block)<sup>\*</sup>|
|d3e037e1-3eb8-44c8-a917-57927947596d|[Block JavaScript or VBScript from launching downloaded executable content](attack-surface-reduction-rules-reference.md#block-process-creations-originating-from-psexec-and-wmi-commands)|1 (Block)|
|d4f940ab-401b-4efc-aadc-ad5f3c50688a|[Block all Office applications from creating child processes](attack-surface-reduction-rules-reference.md#block-all-office-applications-from-creating-child-processes)|1 (Block)|
|e6db77e5-3df2-4cf1-b95a-636979351e5b|[Block persistence through WMI event subscription](attack-surface-reduction-rules-reference.md#block-persistence-through-wmi-event-subscription)|1 (Block)|

<sup>\*</sup> If you use Microsoft Configuration Manager (formerly known as Microsoft Endpoint Configuration Manager and Microsoft System Center Configuration Manager) or other management tools that use WMI, use the value 2 (Audit). The Configuration Manager client relies heavily on WMI.

> [!TIP]
> Some rules might block behavior you find acceptable in your organization. In these cases, change the rule from 1 (Block) to 2 (Audit) to prevent unwanted blocks.

## Controlled Folder Access

Navigate to **Computer Configuration** > **Administrative Templates** > **Windows Components** > **Microsoft Defender Antivirus** > **Microsoft Defender Exploit Guard** > **Attack Surface Reduction**.

|Description|Setting|
|---|---|
|Configure Controlled Folder Access|Enabled, Block|

Assign the policies to the OU where the test machines are located.

#### Enable Tamper Protection

In the Microsoft Defender portal at [https://security.microsoft.com](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Advanced features** > **Tamper Protection** > **On**.

For more information, see [How do I configure or manage tamper protection?](prevent-changes-to-security-settings-with-tamper-protection.md).

#### Check the Cloud Protection network connectivity

It's important to check that the Cloud Protection network connectivity is working during your pen testing.

Run the following command in an elevated command prompt (a Command Prompt window you opened by selecting **Run as administrator**):

```dos
cd "C:\Program Files\Windows Defender"

MpCmdRun.exe -ValidateMapsConnection
```

For more information, see [Use the cmdline tool to validate cloud-delivered protection](configure-network-connections-microsoft-defender-antivirus.md).

## Check the Platform Update version

The latest 'Platform Update' version Production channel (GA) is available here:

[Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623+update)

To check which 'Platform Update' version is installed, use the following PowerShell command (Run as admin):

```powershell
Get-MpComputerStatus | Format-Table AMProductVersion
```

## Check the Security Intelligence Update version

The latest 'Security Intelligence Update' version is available here:

[Latest security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware - Microsoft Security Intelligence](https://www.microsoft.com//wdsi/defenderupdates)

To check which 'Security Intelligence Update' version is installed, use the following PowerShell command (Run as admin):

```PowerShell
Get-MpComputerStatus | Format-Table AntivirusSignatureVersion
```

## Check the Engine Update version

The latest scan 'engine update' version is available here:

[Latest security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware - Microsoft Security Intelligence](https://www.microsoft.com/wdsi/defenderupdates)

To check which 'Engine Update' version is installed, use the following PowerShell command(Run as admin):

```PowerShell
Get-MpComputerStatus | Format-Table AMEngineVersion
```

If you're finding that your settings aren't taking effect, you might have a conflict. To resolve conflicts, refer:
[Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md).

## For False Negatives (FNs) submissions

If you have any questions about a detection that Microsoft Defender AV makes, or you discover a missed detection, you can submit a file to us.

If you have Microsoft XDR, Microsoft Defender for Endpoint P2/P1, or Microsoft Defender for Business: refer [Submit files in Microsoft Defender for Endpoint](admin-submissions-mde.md).

If you have Microsoft Defender Antivirus, see [Submit files for analysis](/unified-secops/submission-guide).

Microsoft Defender AV indicates a detection through [standard Windows notifications](configure-notifications-microsoft-defender-antivirus.md). You can also [review detections in the Microsoft Defender AV app](review-scan-results-microsoft-defender-antivirus.md).

The Windows event log also records detection and engine events. See the [Microsoft Defender Antivirus events article for a list of event IDs](troubleshoot-microsoft-defender-antivirus.yml) and their corresponding actions.

If your settings aren't applied properly, find out if there are conflicting policies that are enabled in your environment. For more information, see [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md).

If you need to open a Microsoft support case: [Contact Microsoft Defender for Endpoint support](contact-support.md).
