---
title: Guidance for pen testing and breach-and-attack-simulation (BAS) scenarios with Microsoft Defender for Endpoint 
description: This article provides guidance for conducting penetration testing and breach-and-attack simulation (BAS) scenarios using Microsoft Defender for Endpoint and Microsoft Defender Antivirus. 
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
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

# Guidance for penetration testing and breach-and-attack-simulation scenarios with Microsoft Defender for Endpoint

This article describes common challenges and potential misconfigurations that might arise during penetration testing (pen testing) or using breach and attack simulation (BAS) tools. This article also describes how to submit potential false negatives for investigation.

## Common challenges during pen testing

- Testing the current configuration of the environment, which might not be the optimal configuration for Microsoft Defender for Endpoint or Microsoft Defender Antivirus.

- Concerns about enabling [cloud protection](cloud-protection-microsoft-defender-antivirus.md), as it might proceed to cloud protection detonation if it doesn't find metadata. For more information about Microsoft Defender Antivirus and cloud protection, see [hybrid detection and protection](/defender-endpoint/adv-tech-of-mdav).

> [!NOTE]
> If you're downloading multiple payloads and notice that Microsoft Defender Antivirus doesn't remediate some of the payloads, keep in mind that what's occurring might not be a true positive, and a non-Microsoft vendor might be showing a false positive. See [How to submit possible false negatives for investigation](#how-to-submit-possible-false-negatives-for-investigation) (in this article).

## Common misconfigurations of Microsoft Defender Antivirus during pen testing

It's common for penetration testers to disable features of Microsoft Defender Antivirus while executing their attack. Before doing so, confirm that the following settings are configured:

- [Tamper protection](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection) is enabled in block mode.

- Microsoft Defender Antivirus is running as the primary antivirus, and not in [passive mode](/defender-endpoint/microsoft-defender-antivirus-compatibility). If you're using non-Microsoft antivirus, we recommend uninstalling it during pen testing.

- [Platform update, engine update, and/or Security intelligence updates](/defender-endpoint/microsoft-defender-antivirus-updates) are up to date.

- [Real-time protection](configure-protection-features-microsoft-defender-antivirus.md) is enabled.

- [Behavior monitoring](/defender-endpoint/behavior-monitor) is enabled.

- Adding [antivirus exclusions](configure-exclusions-microsoft-defender-antivirus.md) to where the payload is, after the payload is copied. After you copy the payload to the device, remove the antivirus exclusion so that Microsoft Defender Antivirus can block detections during pen testing.

- Make sure that you don't have antivirus exclusions for your BAS tools, such as AttackIQ, Cymulate, SafeBreach, and others.

- [Cloud-delivered protection](/defender-endpoint/enable-cloud-protection-microsoft-defender-antivirus) is enabled.

- [Cloud protection sample submission](/defender-endpoint/specify-cloud-protection-level-microsoft-defender-antivirus) is enabled.

- [Cloud protection network connection](/defender-endpoint/configure-network-connections-microsoft-defender-antivirus) is working.

- [Protection from potentially unwanted apps](/defender-endpoint/detect-block-potentially-unwanted-apps-microsoft-defender-antivirus) (PUA) is enabled.

- [Attack surface reduction rules](/defender-endpoint/overview-attack-surface-reduction)  (ASR rules) are set to block mode.

- [Network Protection](/defender-endpoint/enable-network-protection) is set to block mode.

- [Controlled Folder Access](/defender-endpoint/enable-controlled-folders) (CFA) is set to block mode.

It's important to get the settings correct. To resolve misconfiguration issues, use the following articles:

| OS | Management tool | Article |
|--|--|--|
| Windows | Microsoft Defender for Endpoint security settings management <br/>(*Recommended*) | [Evaluate Microsoft Defender Antivirus using Microsoft Defender Endpoint Security Settings Management (Endpoint security policies)](evaluate-mda-using-mde-security-settings-management.md) |
| Windows | Group Policy | [Evaluate Microsoft Defender Antivirus using Group Policy](evaluate-mdav-using-gp.md)  |
| Windows | PowerShell | [Evaluate Microsoft Defender Antivirus using PowerShell](microsoft-defender-antivirus-using-powershell.md) |
| Mac |Microsoft Defender for Endpoint security settings management or Intune or Jamf or another tool| [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md) |
| Linux |Microsoft Defender for Endpoint security settings management or another tool.| [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md) |

## How to submit possible false negatives for investigation

### Step 1: Gather the Microsoft Defender for Endpoint diagnostic logs

#### Use the MDE Client Analyzer log

| Operating system | What to do |
|--|--|
| Windows | You can collect diagnostics logs by using [Live Response](/defender-endpoint/run-analyzer-windows) or [locally](/defender-endpoint/run-analyzer-windows). |
| Mac | You can collect [locally](/defender-endpoint/run-analyzer-macos). |
| Linux | You can collect using [Live Response](/defender-endpoint/run-analyzer-linux) or [locally](/defender-endpoint/run-analyzer-linux). |

#### Microsoft Defender Antivirus diagnostic data (MpSupport.cab)

| Operating system | What to do |
|--|--|
| Windows |1. On the device, open Command Prompt as an administrator. <br/>2. Run the following command: [MpCmdRun.exe -getfiles](/defender-endpoint/collect-diagnostic-data). <br/><br/>You can also [collect the investigation package](/defender-endpoint/respond-machine-alerts#collect-investigation-package-from-devices) in the Microsoft Defender portal. |
| Mac |1. On the device, open Terminal (shell session). <br/>2. Run the following command: `mdatp log level set--level debug`. <br/>3. Run the following command: `sudo mdatp diagnostic create`. <br/><br/>For more information, see [Resources for Microsoft Defender for Endpoint on Mac](/defender-endpoint/mac-resources). |
| Linux |1. On the device, open Terminal (shell session). <br/>2. Run the following command: `mdatp log level set--level debug`. <br/>`sudo mdatp diagnostic create`. <br/><br/>For more information, see [Microsoft Defender for Endpoint on Linux resources](/defender-endpoint/linux-resources). |

### Step 2: Gather information

Ensure you have the following information ready

- **Microsoft Defender OrgID**. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Microsoft Defender XDR** > **Account** > **Org ID**.

- **Device ID**. In the [Microsoft Defender portal](https://security.microsoft.com), open the device page.

- Binary names.

- Start and end of when testing was done in `HH:MM:SS UTC` format.

- It would be highly beneficial if you could provide the steps to reproduce the issue, along with a sample of the payload.

### Step 3: Submit data to Microsoft as soon as possible

It's crucial to report to Microsoft as soon as possible. The advanced hunting telemetry data wraps around and overwrites itself after 30 days. You can use either the Microsoft Defender Security Intelligence (MDSI) portal or the Microsoft Defender portal to submit your files.

| Portal | Description |
|--|--|
| MDSI portal | The MDSI portal is a service provided by Microsoft Defender Security Intelligence. It allows users to submit files for malware analysis. Microsoft Defender security researchers analyze these files to determine if they're threats, unwanted applications, or normal files. The portal is used to report detection concerns to Microsoft Defender Research, submit files for analysis, and track the results of submissions.<br/><br/>|
| Microsoft Defender portal | If you have a subscription to Microsoft Defender XDR, or your subscription includes Defender for Endpoint Plan 2, you can use the **Submissions** page in the Microsoft Defender portal. |

1. Submit the data you gathered during steps 1-2 by using either the MDSI portal or the Microsoft Defender portal.

   - **MDSI portal**: Go to the [MDSI portal](https://www.microsoft.com/en-us/wdsi), and then select **Submit files**. Follow the guidance on the page.
   - **The Microsoft Defender portal**: See [Use admin submission for submitting files in Microsoft Defender for Endpoint](/defender-endpoint/admin-submissions-mde).

2. After you upload the files, note the `Submission ID` for your sample submission (for example, `7c6c214b-17d4-4703-860b-7f1e9da03f7f`).

3. Wait for an update. After Microsoft receives the sample, the file is investigated, and a determination is made. If Microsoft determines that the sample file is malicious, we take corrective action to prevent the malware from going undetected.

   If you have questions, [contact support](/defender-endpoint/contact-support).
