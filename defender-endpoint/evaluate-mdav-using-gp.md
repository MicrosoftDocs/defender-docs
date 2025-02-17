---
title: Evaluate Microsoft Defender Antivirus using Group Policy
description: Use this guide to evaluate and test the protection offered by Microsoft Defender Antivirus using Group Policy.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: conceptual
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 02/12/2025
ms.reviewer: yongrhee
manager: deniseb
ms.subservice: ngp
ms.collection:
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Evaluate Microsoft Defender Antivirus using Group Policy

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender Antivirus
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

**Platforms**:

- Windows

In Windows 10 or newer and Windows Server 2016 or newer, you can use next-generation protection features offered by Microsoft Defender Antivirus (MDAV) and Microsoft Defender Exploit Guard (Microsoft Defender EG).

This article explains how to enable and test the key protection features in Microsoft Defender AV and Microsoft Defender EG and provides you with guidance and links to more information.

This article describes configuration options in Windows 10 or newer and Windows Server 2016 or newer.

## Use Microsoft Defender Antivirus using Group Policy to enable the features

This guide provides the Microsoft Defender Antivirus Group Policy that configures the features you should use to evaluate our protection.

1. Grab the latest 'Windows Group Policy Administrative Templates.'

   For more information, see [Create and manage Central Store - Windows Client](/troubleshoot/windows-client/group-policy/create-and-manage-central-store#links-to-download-the-administrative-templates-files-based-on-the-operating-system-version).

   > [!TIP]
   > 1. The Windows one works with the Windows Servers.
   > 1. Even if you're running a Windows 10 or Windows Server 2016, get the latest administrative templates for Windows 11 or newer.

2. Create a 'Central Store' to host the latest .admx and .adml templates.

   For more information, see [Create and manage Central Store - Windows Client](/troubleshoot/windows-client/group-policy/create-and-manage-central-store#the-central-store).

   If joined to a domain:

   1. Create a new OU block policy inheritance.

   2. Open Group policy Management Console (GPMC.msc).

   3. Go to **Group Policy Objects** and create a new Group Policy.

   4. Right-click the new policy created and select **Edit**.

   5. Navigate to **Computer Configuration** > **Policies** > **Administrative Templates** > **Windows Components** > **Microsoft Defender Antivirus**.

   or

   If joined to a workgroup

   6. Open Group Policy Editor MMC (GPEdit.msc).

   7. Navigate to **Computer Configuration** > **Administrative Templates** > **Windows Components** > **Microsoft Defender Antivirus**.

## MDAV and Potentially Unwanted Applications (PUA)

**Root:**

| Description | Setting |
| --- | --- |
| Turn off Microsoft Defender Antivirus | Disabled |
| Configure detection for potentially unwanted applications | Enabled - Block |

## Real-time protection (always-on protection, real-time scanning)

\\**Real-time protection:**

| Description | Setting |
| --- | --- |
| Turn off real-time protection | Disabled |
| Configure monitoring for incoming and outgoing file and program activity | Enabled, bi-directional (full on-access) |
| Turn on Behavior Monitoring | Enabled |
| Monitor file and program activity on your computer | Enabled |

## Cloud protection features

Standard security intelligence updates can take hours to prepare and deliver; our cloud-delivered protection service can deliver this protection in seconds.

For more information, see [Use next-gen technologies in Microsoft Defender Antivirus through cloud-delivered protection](/windows/threat-protection/windows-defender-antivirus/utilize-microsoft-cloud-protection-windows-defender-antivirus).

\\**MAPS:**

| Description | Setting |
| --- | --- |
| Join Microsoft MAPS | Enabled, Advanced MAPS |
| Configure the 'Block at First Sight' feature | Enabled |
| Send file samples when further analysis is required | Enabled, Send all samples |

\\**MpEngine:**

| Description | Setting |
| --- | --- |
| Select cloud protection level | Enabled, High blocking level |
| Configure extended cloud check | Enabled, 50 |

## Scans

| Description | Setting |
| --- | --- |
| Turn on Heuristics | Enabled |
| Turn on e-mail scanning | Enabled |
| Scan all downloaded files and attachments | Enabled |
| Turn on script scanning | Enabled |
| Scan archive files | Enabled |
| Scan packed executables | Enabled |
| Configure scanning of network files (Scan Network Files) | Enabled |
| Scan removable drives | Enabled |
| Turn on reparse point scanning | Enabled |

## Security Intelligence updates

| Description | Setting |
| --- | --- |
| Specify the interval to check for security intelligence updates | Enabled, 4 |
| Define the order of sources for downloading security intelligence updates | Enabled, under 'Define the order of sources for downloading security intelligence updates'<br><br>InternalDefinitionUpdateServer \| MicrosoftUpdateServer \| MMPC<br><br>**Note:** Where InternalDefinitionUpdateServer is WSUS with Microsoft Defender Antivirus updates allowed.<br><br>MicrosoftUpdateServer == Microsoft Update (formerly Windows Update).<br><br>MMPC == https://www.microsoft.com/en-us/wdsi/definitions |

## Disable local administrator AV settings

Disable local administrator AV settings such as exclusions, and enforce the policies from the Microsoft Defender for Endpoint Security Settings Management.

**Root:**

| Description | Setting |
| --- | --- |
| Configure local administrator merge behavior for lists | Disabled |
| Control whether or not exclusions are visible to local admins | Enabled |

## Threat Severity Default Action

\\**Threats**

| Description | Setting | Alert level    | Action    |
| --- | --- | --- | --- |
| Specify threat alert levels at which default action shouldn't be taken when detected | Enabled |     |     |
|     |     | 5 (Severe) | 2 (Quarantine) |
|     |     | 4 (High) | 2 (Quarantine) |
|     |     | 2 (Medium) | 2 (Quarantine) |
|     |     | 1 (Low) | 2 (Quarantine) |

\\**Quarantine**

| Description | Setting |
| --- | --- |
| Configure removal of items from Quarantine folder | Enabled, 60 |

\\**Client Interface**

| Description | Setting |
| --- | --- |
| Enable headless UI mode | Disabled |

## Network Protection

\\**Microsoft Defender Exploit Guard\\Network Protection:**

| Description | Setting |
| --- | --- |
| Prevent users and apps from accessing dangerous websites | Enabled, Block |
| This settings controls whether Network Protection can be configured into block or audit mode on Windows Server | Enabled |

To enable Network Protection for Windows Servers, for now, please use PowerShell:

| OS | PowerShell cmdlet |
| --- | --- |
| Windows Server 2012 R2Windows Server 2022 and later	| set-MpPreference -AllowNetworkProtectionOnWinServer $true |
| Windows Server 2016 and Windows Server 2012 R2 [unified MDE client](/defender-endpoint/update-agent-mma-windows#upgrade-to-the-new-unified-agent-for-defender-for-endpoint) | set-MpPreference -AllowNetworkProtectionOnWinServer $true and set-MpPreference -AllowNetworkProtectionDownLevel $ true

## Attack Surface Reduction Rules

1. Navigate to **Computer Configuration** > **Administrative Templates** > **Windows Components** > **Microsoft Defender Antivirus** > **Microsoft Defender Exploit Guard** > **Attack Surface Reduction**.

2. Select **Next**.

| Description | Setting |
| --- | --- |
| be9ba2d9-53ea-4cdc-84e5-9b1eeee46550<br><br>**Note:** (Block executable content from email client and webmail) | 1 (Block) |
| 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c<br><br>**Note:** (Block Adobe Reader from creating child processes) | 1 (Block) |
| 5beb7efe-fd9a-4556-801d-275e5ffc04cc<br><br>**Note:** (Block execution of potentially obfuscated scripts) | 1 (Block) |
| 56a863a9-875e-4185-98a7-b882c64b5ce5<br><br>**Note:** (Block abuse of exploited vulnerable signed drivers) | 1 (Block) |
| 92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b<br><br>**Note:** (Block Win32 API calls from Office macros) | 1 (Block) |
| 01443614-cd74-433a-b99e-2ecdc07bfc25<br><br>**Note:** (Block executable files from running unless they meet a prevalence, age, or trusted list criterion) | 1 (Block) |
| 26190899-1602-49e8-8b27-eb1d0a1ce869<br><br>**Note:** (Block Office communication application from creating child processes) | 1 (Block) |
| d4f940ab-401b-4efc-aadc-ad5f3c50688a<br><br>**Note:** (Block all Office applications from creating child processes) | 1 (Block) |
| c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb<br><br>**Note:** ([PREVIEW] Block use of copied or impersonated system tools) | 1 (Block) |
| d3e037e1-3eb8-44c8-a917-57927947596d<br><br>**Note:** (Block JavaScript or VBScript from launching downloaded executable content) | 1 (Block) |
| 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2<br><br>**Note:** (Block credential stealing from the Windows local security authority subsystem) | 1 (Block) |
| a8f5898e-1dc8-49a9-9878-85004b8a61e6<br><br>**Note:** (Block Web shell creation for Servers) | 1 (Block) |
| 3b576869-a4ec-4529-8536-b80a7769e899<br><br>**Note:** (Block Office applications from creating executable content) | 1 (Block) |
| b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4<br><br>**Note:** (Block untrusted and unsigned processes that run from USB) | 1 (Block) |
| 75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84<br><br>**Note:** (Block Office applications from injecting code into other processes) | 1 (Block) |
| e6db77e5-3df2-4cf1-b95a-636979351e5b<br><br>**Note:** (Block persistence through WMI event subscription) | 1 (Block) |
| c1db55ab-c21a-4637-bb3f-a12568109d35<br><br>**Note:** (Use advanced protection against ransomware) | 1 (Block) |
| d1e49aac-8f56-4280-b9ba-993a6d77406c<br><br>**Note:** (Block process creations originating from PSExec and WMI commands) | 1 (Block)<br><br>**Note:** If you have Configuration Manager (formerly SCCM), or other management tools that use WMI, you might need to set this to 2 ('audit') instead of 1('block'). |
| 33ddedf1-c6e0-47cb-833e-de6133960387<br><br>**Note:** ([PREVIEW] Block rebooting machine in Safe Mode) | 1 (Block) |

> [!TIP]
> Some rules might block behavior you find acceptable in your organization. In these cases, change the rule from 'Enabled' to 'Audit' to prevent unwanted blocks.

## Controlled Folder Access

Navigate to **Computer Configuration** > **Administrative Templates** > **Windows Components** > **Microsoft Defender Antivirus** > **Microsoft Defender Exploit Guard** > **Attack Surface Reduction**.

| Description | Setting |
| --- | --- |
| Configure Controlled Folder Access | Enabled, Block |

Assign the policies to the OU where the test machines are located.

#### Enable Tamper Protection

In the Microsoft XDR portal (security.microsoft.com), go to **Settings** > **Endpoints** > **Advanced features** > **Tamper Protection** > **On**.

For more information, see [How do I configure or manage tamper protection?](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection).

#### Check the Cloud Protection network connectivity

It's important to check that the Cloud Protection network connectivity is working during your pen testing.

CMD (Run as admin)


```
cd "C:\Program Files\Windows Defender"
MpCmdRun.exe -ValidateMapsConnection
```

For more information, see [Use the cmdline tool to validate cloud-delivered protection](/defender-endpoint/configure-network-connections-microsoft-defender-antivirus).

## Check the Platform Update version

The latest 'Platform Update' version Production channel (GA) is available here:

[Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623+update)

To check which 'Platform Update' version is installed, use the following PowerShell command (Run as admin):

```powershell
get-mpComputerStatus | ft AMProductVersion
```

## Check the Security Intelligence Update version

The latest 'Security Intelligence Update' version is available here:

[Latest security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware - Microsoft Security Intelligence](https://www.microsoft.com/en-us/wdsi/defenderupdates)

To check which 'Security Intelligence Update' version is installed, use the following PowerShell command (Run as admin):

```PowerShell
get-mpComputerStatus | ft AntivirusSignatureVersion
```

## Check the Engine Update version

The latest scan 'engine update' version is available here:

[Latest security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware - Microsoft Security Intelligence](https://www.microsoft.com/en-us/wdsi/defenderupdates)

To check which 'Engine Update' version is installed, use the following PowerShell command(Run as admin):

```PowerShell
get-mpComputerStatus | ft AMEngineVersion
```

If you're finding that your settings aren't taking effect, you might have a conflict. To resolve conflicts, refer:
[Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md).

## For False Negatives (FNs) submissions

If you have any questions about a detection that Microsoft Defender AV makes, or you discover a missed detection, you can submit a file to us.

If you have Microsoft XDR, Microsoft Defender for Endpoint P2/P1, or Microsoft Defender for Business: refer [Submit files in Microsoft Defender for Endpoint](admin-submissions-mde.md).

If you have Microsoft Defender Antivirus, refer:
https://www.microsoft.com/security/portal/mmpc/help/submission-help.aspx

Microsoft Defender AV indicates a detection through [standard Windows notifications](configure-notifications-microsoft-defender-antivirus.md). You can also [review detections in the Microsoft Defender AV app](review-scan-results-microsoft-defender-antivirus.md).

The Windows event log also records detection and engine events. See the [Microsoft Defender Antivirus events article for a list of event IDs](troubleshoot-microsoft-defender-antivirus.yml) and their corresponding actions.

If your settings aren't applied properly, find out if there are conflicting policies that are enabled in your environment. For more information, see [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md).

If you need to open a Microsoft support case:
[Contact Microsoft Defender for Endpoint support](contact-support.md).
