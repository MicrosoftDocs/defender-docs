---
title: Troubleshoot problems with attack surface reduction rules
description: Resources and sample code to troubleshoot issues with attack surface reduction rules in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.localizationpriority: medium
audience: ITPro
author: chrisda
ms.author: chrisda
ms.date: 04/01/2026
ms.reviewer:
ms.custom: asr
ms.subservice: asr
ms.topic: how-to
ms.collection:
- m365-security
- tier3
- mde-asr
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Troubleshoot attack surface reduction rules

Even after you carefully [plan](attack-surface-reduction-rules-deployment-plan.md), [test](attack-surface-reduction-rules-deployment-test.md) and [implement](attack-surface-reduction-rules-deployment-implement.md) attack surface reduction (ASR) rules on Windows devices in your organization, you still might run into issues. For example:

- An ASR rule blocks a file or process, or does some other action that it shouldn't (false positive).
- An ASR rule doesn't work as described, or doesn't block a file or process that it should (false negative).

This article describes the steps you can take yourself to troubleshoot the issues, including collecting data to open a support case with Microsoft if you are unable to fix the problem yourself.

## Confirm ASR rule prerequisites

For ASR rule requirements, see [Requirements for ASR rules](attack-surface-reduction-rules-overview.md#requirements-for-asr-rules).

<a name="best-practices-when-setting-up-attack-surface-reduction-rules-using-group-policy"></a>

<a name="querying-which-rules-are-active"></a>

## Verify the active ASR rules and actions on devices

Run the following command in PowerShell on the device to see the state of all configured ASR rules:

```powershell
$p = Get-MpPreference;0..([math]::Min($p.AttackSurfaceReductionRules_Ids.Count,$p.AttackSurfaceReductionRules_Actions.Count)-1) | % {[pscustomobject]@{Id=$p.AttackSurfaceReductionRules_Ids[$_];Action=$p.AttackSurfaceReductionRules_Actions[$_]}} | Format-Table -AutoSize
```

Example output from this command might look like this:

```powershell
Id                                   Action
--                                   ------
01443614-cd74-433a-b99e-2ecdc07bfc25      2
26190899-1602-49e8-8b27-eb1d0a1ce869      1
3b576869-a4ec-4529-8536-b80a7769e899      1
5beb7efe-fd9a-4556-801d-275e5ffc04cc      1
75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84      1
7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c      1
92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b      1
9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2      2
b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4      1
be9ba2d9-53ea-4cdc-84e5-9b1eeee46550      1
c1db55ab-c21a-4637-bb3f-a12568109d35      2
d1e49aac-8f56-4280-b9ba-993a6d77406c      1
d3e037e1-3eb8-44c8-a917-57927947596d      2
d4f940ab-401b-4efc-aadc-ad5f3c50688a      2
e6db77e5-3df2-4cf1-b95a-636979351e5b      1
```

In this example, the [ASR rules](attack-surface-reduction-rules-overview.md#asr-rules) are active in [different modes](attack-surface-reduction-rules-overview.md#modes-for-asr-rules) on the device (2 = **Audit** mode, 1 = **Block** mode).

> [!NOTE]
> If you used [Group Policy to configure ASR rules](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-group-policy), verify there are no extra characters like quotation marks or spaces in the ASR rule GUID value.

<a name="use-audit-mode-to-test-the-rule"></a>

<a name="querying-blocking-and-auditing-events"></a>

## Switch misbehaving ASR rules to Block mode for testing

ASR rules in **Audit mode** don't block files or processes, but the actions that the rule would have taken in **Block** or **Warn** mode are recorded.

Whatever method you used to distribute ASR rules to devices, use that same method to set the problematic rules to **Audit** mode. For instructions, see [Configure attack surface reduction rules](attack-surface-reduction-rules-configure.md).

> [!TIP]
> If the ASR rule was already in **Audit** mode, that explains why it wasn't blocking the files or processes you expected it to block (false negative). ASR rules can accidentally get into **Audit** mode in the following scenarios:
>
> - You were testing another feature and forgot to set the ASR rule back into **Block** or **Warn** mode.
> - An automated PowerShell script changed the rule mode.

After you configure the rule in **Audit** mde, do the following steps:

1. Do the action on the device that causes the issue. For example, open the file or run the process that isn't blocked but should be blocked (false negative).
2. [Review the ASR rule activity](attack-surface-reduction-rules-monitor.md).

   Specifically, filter **Event ID** values in Windows Event viewer by the following values in the **Applications and Services Logs** \> **Microsoft** \> **Windows** \> **Windows Defender** \> **Operational**  log:

   - **Block events**: 1121
   - **Audit events**: 1122
   - **User override events in Warn mode**: 1129
   - **Configuration changes**: 5007

   For detailed information, see [View attack surface reduction events in Windows Event Viewer](attack-surface-reduction-windows-events.md#browse-attack-surface-reduction-events-in-windows-event-viewer).

   :::image type="content" source="media/eventviewerscrnew.png" alt-text="Screenshot of the Event Viewer page." lightbox="media/eventviewerscrnew.png":::

## Steps to take if the ASR rule still doesn't work as expected

If the ASR rule still isn't working as expected, do one of the following steps:

- For false positives, and the file or path as an exclusion to the ASR rule. For more information, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).
- Use the [Microsoft Security Intelligence web-based submission form](https://www.microsoft.com/wdsi/support/report-exploit-guard) to report a false negative or false positive for network protection. With a Windows E5 subscription, you can also [provide a link to any associated alert](alerts-queue.md).
- When you report a problem involving ASR rules to Microsoft, you need to collect and submit diagnostic data to help troubleshoot issue the issue as described in the next section.

<a name="collect-microsoft-defender-anti-malware-protection-diagnostic-data-for-file-submissions"></a>

## Collect diagnostic data for for Microsoft support

<a name="using-the-mde-client-analyzer"></a>

### Collect diagnostic data with the MDE Client Analyzer

1. Download the [MDE Client Analyzer](overview-client-analyzer.md).

1. Close any apps on the device that aren't essential to reproducing the issue.

1. Run the MDE Client Analyzer with the `-v` switch [locally or using Live Response](run-analyzer-windows.md):

   ```dos
   C:\Work\tools\MDEClientAnalyzer\MDEClientAnalyzer.cmd -v
   ```

   > [!TIP]
   > Ensure that log collection takes place during the reproduction attempt.

<a name="manual-process"></a>

### Collect diagnostic data with MpCmdRun

To use `MpCmdRun.exe -GetFiles` to manually generate the diagnostic log files to `C:\ProgramData\Microsoft\Windows Defender\Support\MpSupportFiles.cab`, see the instructions at [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md).

In the `MpSupportFiles.cab` file, the following files are most relevant:

- `MPOperationalEvents.txt`: Contains same level of information found in Event Viewer for the Windows Defender Operational log.
- `MPRegistry.txt`: Analyze all the current Windows Defender configurations from when you generated the .cab file.
- `MPLog.txt`: Verbose information about all the actions and operations of Windows Defender.

## Related articles

- [Attack surface reduction rules](attack-surface-reduction-rules-overview.md)
- [Configure attack surface reduction (ASR) rules and exceptions](attack-surface-reduction-rules-configure.md)
- [Evaluate attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)
