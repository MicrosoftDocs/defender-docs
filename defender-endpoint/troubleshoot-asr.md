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

When you use [attack surface reduction rules](attack-surface-reduction-rules-overview.md), you might run into issues. For example:

- A rule blocks a file or process, or does some other action that it shouldn't (false positive).
- A rule doesn't work as described, or doesn't block a file or process that it should (false negative).

Use the following steps to troubleshooting these problems:

1. [Confirm prerequisites](#confirm-prerequisites).
1. [Use audit mode to test the rule](#use-audit-mode-to-test-the-rule).
1. [Add exclusions for the specified rule](#add-exclusions-for-a-false-positive) (for false positives).
1. [Collect and submit support logs](#collect-microsoft-defender-anti-malware-protection-diagnostic-data-for-file-submissions).

## Confirm prerequisites

Attack surface reduction rules are active and working on devices that meet the following conditions:

- Windows 10 Enterprise or later.
- Microsoft Defender Antivirus is the only active antivirus protection app. Microsoft Defender Antivirus disables itself [if any other antivirus app is installed on the device](/windows/security/threat-protection/microsoft-defender-antivirus/microsoft-defender-antivirus-compatibility).
- [Real-time protection](/windows/security/threat-protection/microsoft-defender-antivirus/configure-real-time-protection-microsoft-defender-antivirus) is enabled.
- Attack surface reduction rules on the device are in one of the following modes:
  - **Block** mode.
  - **Warn** mode.
  - Not configured or disabled.

If these prerequisites are met, proceed to the next step to test the rule in audit mode.

<a name="best-practices-when-setting-up-attack-surface-reduction-rules-using-group-policy"></a>

## Verify rule ID values in group policy

If you used group policy to configure attack surface reduction rules, verify there are no extra characters like quotation marks or spaces in the identifying GUID value.

For more information about configuring attack surface reduction rules in group policy, see [Enable attack surface reduction rules with group policy](enable-attack-surface-reduction.md#group-policy).

<a name="querying-which-rules-are-active"></a>

### Verify active rules and actions on the device

Run the following command in PowerShell to see the state of all configured attack surface reduction rules on a device:

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

In this example, [the displayed rules](attack-surface-reduction-rules-reference.md#asr-rule-to-guid-matrix) are active in [different modes](attack-surface-reduction-rules-reference.md#asr-rule-modes) (2 = **Audit** mode, 1 = **Block** mode).

<a name="use-audit-mode-to-test-the-rule"></a>

## Test problem rules in Audit mode

 **Audit mode** doesn't block files or processes identified by the attack surface reduction rule, but logs the detection. Follow these instructions from [Use the demo tool to see how attack surface reduction rules work](attack-surface-reduction-rules-deployment-test.md) to test the specific rule you're having problems with:

1. Enable **Audit** mode for the rule. Use group policy to set the rule mode to 2 as described in [Enable attack surface reduction rules](enable-attack-surface-reduction.md).

1. Do the action that causes the issue. For example, open the file or run the process that isn't blocked but should be blocked (false negative).

1. [Review the attack surface reduction rule event logs](attack-surface-reduction-rules-overview.md) to see if the file or process would have been blocked if the rule was in **Block** mode.

If a rule isn't blocking a file or process that you expect it to block, verify the rule isn't in **Audit** mode. The rule might be in **Audit** mode in the following scenarios:

- You were testing another feature.
- The rule was set to **Audit** mode by an automated PowerShell script.
- You forgot to disable the rule or enable it in **Block** mode after the test was completed.

If you did the tests in this section and the rule still isn't working as expected, proceed to one of the following sections in this article:

- **False positive** (good files blocked): [Add exclusions for a false positive](#add-exclusions-for-a-false-positive).
- **False negative** (bad files allowed): [Collect diagnostic data](#collect-diagnostic-data) and report the issue to Microsoft.

<a name="querying-blocking-and-auditing-events"></a>

### View block and audit events in Windows Event Viewer

You can view attack surface reduction rule events in the **Windows Defender** area of Windows Event Viewer.

1. Open **Event Viewer**. For example:
   1. Open the **Start** menu, and then type **event**.
   1. Select the **Event Viewer** result.

1. In **Event viewer** console tree, go to **Applications and Services Logs** \> **Microsoft** \> **Windows** \> **Windows Defender** \> **Operational**.

1. In the details pane of **Operational**, you can filter the entries for attack surface reduction rule events using the following **Event ID** values**:
   - **Block events**: 1121, 1126, 1131, 1133
   - **Audit events**: 1122, 1125, 1132, 1134
   - **User override events in Warn mode**: 1129
   - **Attack surface reduction configuration changes**: 5007

:::image type="content" source="media/eventviewerscrnew.png" alt-text="Screenshot of the Event Viewer page." lightbox="media/eventviewerscrnew.png":::

## Add exclusions for a false positive

If the attack surface reduction rule is blocking something that it shouldn't block, you can add exclusions to safelist the excluded files or folders.

To add an exclusion, see [Customize attack surface reduction](attack-surface-reduction-rules-deployment-implement.md#customize-attack-surface-reduction-rules).

## Report a false positive or false negative

Use the [Microsoft Security Intelligence web-based submission form](https://www.microsoft.com/wdsi/support/report-exploit-guard) to report a false negative or false positive for network protection. With a Windows E5 subscription, you can also [provide a link to any associated alert](alerts-queue.md).

<a name="collect-microsoft-defender-anti-malware-protection-diagnostic-data-for-file-submissions"></a>

## Collect diagnostic data

When you report a problem involving attack surface reduction rules, you need to collect and submit diagnostic data for Microsoft support and engineering teams to help troubleshoot issues.

<a name="using-the-mde-client-analyzer"></a>

### Collect diagnostic data with the MDE Client Analyzer

1. Download the [MDE Client Analyzer](overview-client-analyzer.md).

1. Close any apps that aren't essential to reproducing the issue, and then run the MDE Client Analyzer [locally or using Live Response](run-analyzer-windows.md).

   > [!TIP]
   > Ensure that log collection takes place during the reproduction attempt.

1. Run the MDE Client Analyzer with the `-v` switch:

   ```dos
   C:\Work\tools\MDEClientAnalyzer\MDEClientAnalyzer.cmd -v
   ```

<a name="manual-process"></a>

### Collect diagnostic data with MpCmdRun

To use `MpCmdRun.exe -GetFiles` to manually generate the diagnostic log files to `C:\ProgramData\Microsoft\Windows Defender\Support\MpSupportFiles.cab`, see the instructions at [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md).

In the `MpSupportFiles.cab` file, the following files are most relevant:

- `MPOperationalEvents.txt`: Contains same level of information found in Event Viewer for the Windows Defender Operational log.
- `MPRegistry.txt`: Analyze all the current Windows Defender configurations from when you generated the .cab file.
- `MPLog.txt`: Verbose information about all the actions and operations of Windows Defender.

## Related articles

- [Attack surface reduction rules](attack-surface-reduction-rules-overview.md)
- [Enable attack surface reduction rules](attack-surface-reduction-rules-enable.md)
- [Evaluate attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)
