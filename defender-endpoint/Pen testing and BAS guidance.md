---
title: Guidance for pen testing and breach-and-attack-simulation (BAS) scenarios with Microsoft Defender for Endpoint 
description: This article provides guidance for conducting penetration testing and breach-and-attack simulation (BAS) scenarios using Microsoft Defender for Endpoint and Microsoft Defender Antivirus. 
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: conceptual
author: emmwalshh
ms.author: ewalsh
ms.reviewer: yongrhee
manager: deniseb
ms.custom: nextgen
ms.date: 02/19/2025
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Guidance for pen testing and breach-and-attack-simulation (BAS) scenarios with Microsoft Defender for Endpoint

During trials of Microsoft Defender for Endpoint and/or Microsoft Defender Antivirus where your pen testing and/or using breach and attack simulation (BAS) tools. This document goes over some common articles that arise.

## Common challenges during pen testing

Not testing the capability (optimal configuration) of Microsoft Defender for Endpoint/Microsoft Defender Antivirus and instead testing the current configuration of the environment.

If you're downloading multiple payloads and notice that Microsoft Defender Antivirus doesn't remediate some of the payloads. Keep in mind that it might not be a true positive (TP) and the non-Microsoft vendor might be having a false positive (FP). Please review "How to submit False Negatives (FNs) for investigation" section below.

Pen testers might be apprehensive about enabling MDAV's Cloud Protection, since if it doesn't find metadata, the next step it takes is Cloud Protection detonation. Please review the [hybrid detection and protection](/defender-endpoint/adv-tech-of-mdav) for details of MDAV and Cloud Protection.

## Common misconfigurations of MDAV during pen testing

It's common for pen testers to disable features of Microsoft Defender Antivirus while executing their attack. Ensure that the following options are confirmed.

- Ensure that [Tamper Protection](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection) is enabled in block mode.
- Ensure that Microsoft Defender Antivirus is running as the primary antivirus, and not in [passive mode.](/defender-endpoint/microsoft-defender-antivirus-compatibility)
  - Note: If you have a non-Microsoft antivirus installed, for testing, please uninstall it completely.
- Ensure that [Platform update, engine update, and/or Security intelligence update](/defender-endpoint/microsoft-defender-antivirus-updates) are up to date.
- Ensure that Real-time protection is enabled.
- Ensure that [Behavior monitoring](/defender-endpoint/behavior-monitor) is enabled.
- Adding AV exclusions to where the payload is, after the payload is copied.
  - Tip: Once you have done copying the payload to the device, you should remove the AV exclusion, for MDAV to be able to block.
- Ensure that AV exclusions to BAS tools such as AttackIQ, Cymulate, SafeBreach, and others aren't done.
- Ensure that [cloud-delivered protection](/defender-endpoint/enable-cloud-protection-microsoft-defender-antivirus) is enabled.
- Ensure that cloud protection [sample submission](/defender-endpoint/specify-cloud-protection-level-microsoft-defender-antivirus) is enabled.
- Ensure that [cloud protection network connection](/defender-endpoint/configure-network-connections-microsoft-defender-antivirus) is working.
- Ensure that [potentially unwanted apps (PUA)](/defender-endpoint/detect-block-potentially-unwanted-apps-microsoft-defender-antivirus) is enabled.
- Ensure that [Attack Surface Reduction Rules (ASR rules](/defender-endpoint/overview-attack-surface-reduction)) are set to block mode.
- Ensure that [Network Protection](/defender-endpoint/enable-network-protection) is set to block mode
- Ensure that [Controlled Folder Access](/defender-endpoint/enable-controlled-folders) (CFA) is set to block mode

It's important to get the settings correct. To resolve, depending on the management tool that you're using to manage Microsoft Defender Antivirus, please review:

### Windows

#### (Preferred) Evaluate Microsoft Defender Antivirus using Microsoft Defender Endpoint Security Settings Management (Endpoint security policies)

[https://learn.microsoft.com/defender-endpoint/evaluate-mda-using-mde-security-settings-management](/defender-endpoint/evaluate-mda-using-mde-security-settings-management) 

Or

#### (Alternative 1) Evaluate Microsoft Defender Antivirus using Group Policy

[https://learn.microsoft.com/defender-endpoint/evaluate-mdav-using-gp](/defender-endpoint/evaluate-mdav-using-gp) 

Or

#### (Alternative 2) Evaluate Microsoft Defender Antivirus using PowerShell

[https://learn.microsoft.com/defender-endpoint/microsoft-defender-antivirus-using-powershell](/defender-endpoint/microsoft-defender-antivirus-using-powershell)

### macOS

#### Intune

[Set preferences for Microsoft Defender for Endpoint on Mac](/defender-endpoint/mac-preferences)

#### JamF

[Set preferences for Microsoft Defender for Endpoint on Mac](/defender-endpoint/mac-preferences)

### Linux

[Set preferences for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-preferences)

## How to submit possible False Negatives (FNs) for investigation

##  Step 1) Gather the Microsoft Defender for Endpoint diagnostic logs

### MDE Client Analyzer log

#### Windows

You can collect using [Live Response](/defender-endpoint/run-analyzer-windows) or [locally](/defender-endpoint/run-analyzer-windows).

#### macOS

You can collect [locally](/defender-endpoint/run-analyzer-macos).

#### Linux

You can collect using [Live Response](/defender-endpoint/run-analyzer-linux) or [locally](/defender-endpoint/run-analyzer-linux).

Or

### Microsoft Defender Antivirus diagnostic data (MpSupport.cab)

#### Windows

Start, CMD (Run as admin)

[MpCmdRun.exe -getfiles](/defender-endpoint/collect-diagnostic-data) 

TIP: This can be done via "[Collect Investigation Package](/defender-endpoint/respond-machine-alerts)" from Microsoft XDR portal (security.microsoft.com)

#### macOS

In macOS running Microsoft Defender for Endpoint to collect diagnostic data

Terminal (shell session)

Mdatp log level set--level debug

Sudo mdatp diagnostic create

[Resources for Microsoft Defender for Endpoint on Mac](/defender-endpoint/mac-resources)

#### Linux

In Linux running Microsoft Defender for Endpoint to collect diagnostic data

Terminal (shell session)

Mdatp log level set--level debug

Sudo mdatp diagnostic create

[Microsoft Defender for Endpoint on Linux resources](/defender-endpoint/linux-resources)

## Step 2) Have the following information handy

- Microsoft Defender OrgID 
  - In the Microsoft XDR portal (security.microsoft.com), go to "Settings" > "Microsoft Defender XDR" > "Account" > "Org ID"  
- Device ID
  - In the Microsoft XDR portal (security.microsoft.com), available in the device page
- binary names
- Start and end of when testing was done in HH:MM:SS UTC. 
- It would be highly beneficial if you could provide the steps to reproduce the issue, along with a sample of the payload.

## Step 3) It's crucial that customers report to Microsoft as soon as possible. The advanced hunting telemetry data wraps around and overwrites itself after 30 days.

## Step 4) Submit the data from steps 1-3 to Microsoft Defender Security Intelligence <br>(MDSI, https://www.microsoft.com/en-us/wdsi, [https://](https://aka.ms/mdsi))aka.ms/wdsi)

**MSDI Portal *** 

The MDSI Portal is a service provided by Microsoft Security Intelligence. It allows users to submit files for malware analysis. Microsoft security researchers analyze these files to determine if they're threats, unwanted applications, or normal files. The portal is used to report detection concerns to Microsoft Defender Research, submit files for analysis, and track the results of submissions

\*Note: The name changed from Windows Defender Security Intelligence (WSDI) to Microsoft Defender Security Intelligence (MSDI) since we now support macOS, Linux, and Android. The Url changes haven't been addressed yet.

**Submit malware files to Microsoft**

Organizations that have a Microsoft Defender XDR subscription, or Microsoft Defender XDR for Endpoint Plan 2 can submit files using the **Submissions** page in the Microsoft Defender portal. For more information, see [Use admin submission for submitting files in Microsoft Defender for Endpoint](/defender-endpoint/admin-submissions-mde).

Or, you can go to the Microsoft Defender Security Intelligence page at <https://aka.ms/mdsi> to submit the file. To receive analysis updates, sign in or enter a valid email address. We recommend using your Microsoft work or school account.

After you've uploaded the file or files, note the **Submission ID** that's created for your sample submission (for example, 7c6c214b-17d4-4703-860b-7f1e9da03f7f).

After we receive the sample, we'll investigate. If we determine that the sample file is malicious, we take corrective action to prevent the malware from going undetected.

Or [Contact Microsoft Defender for Endpoint support ](/defender-endpoint/contact-support)

Keywords: How to properly test Defender? How to properly test windows Defender antivirus? How to properly test microsoft Defender antivirus? How to properly test mdav antivirus? Purple-team, Red-team
