---
title: Implement attack surface reduction rules
description: Provides guidance to implement your attack surface reduction rules deployment.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: limwainstein
ms.author: lwainstein
ms.reviewer: sugamar
ms.custom: asr
ms.topic: how-to
ms.collection:
 - m365-security
 - m365solution-asr-rules
 - highpri
 - tier1
 - mde-asr
ms.date: 03/17/2026
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Implement attack surface reduction rules

When you're implementing attack surface reduction rules, move the first test ring into an enabled, functional state.

> :::image type="content" source="media/asr-rules-implementation-steps.png" alt-text="The procedure to implement attack surface reduction rules" lightbox="media/asr-rules-implementation-steps.png":::

## Step 1: Transition attack surface reduction rules from Audit to Block

1. After you determine all required exclusions for rules in **Audit** mode, start setting some rules to **Block** mode. Start with the rule with the fewest triggered events. For instructions, see [Enable attack surface reduction rules](attack-surface-reduction-rules-enable.md).

1. Review the [reporting page in the Microsoft Defender portal](threat-protection-reports.md). Also review feedback from your champions.

1. Refine exclusions or create new exclusions as necessary.

> [!TIP]
> Rule exclusions are better than turning off rules or switching them back to **Audit** mode.
>
> Take advantage of the **Warn** mode in available rules to limit disruptions. **Warn** mode enables you to capture triggered events and view potential disruptions without actually blocking user access (they can click through the warning notification). For more information, see [ASR rule modes](attack-surface-reduction-rules-reference.md#asr-rule-modes).

## Step 2: Expand deployment to ring n + 1

When you're confident you correctly configured attack surface reduction rules for ring 1, you can widen the scope of your deployment to the next ring (ring n + 1).

In the following deployment process, steps 1 – 3 are essentially the same for each subsequent ring:

1. Test rules in **Audit** mode.

1. Review attack surface reduction-triggered audit events in the Microsoft Defender portal.

1. Create exclusions.

1. Review, and then refine, add, or remove exclusions as necessary.

1. Set rules to **Block** mode.

1. Review the reporting page in the Microsoft Defender portal.

1. Create exclusions.

1. Disable problematic rules or switch them back to **Audit** mode.

## Customize attack surface reduction rules

As you continue to expand your attack surface reduction rules deployment, you might find it necessary or beneficial to customize the attack surface reduction rules that are enabled.

### Exclude files and folders

> [!WARNING]
> Excluding or unblocking files or folders could potentially allow unsafe files to run and infect your devices. Excluding files or folders can severely reduce the protection provided by attack surface reduction rules. Files that would be blocked by a rule are allowed to run, and there's no report or event recorded.

You can choose to exclude files and folders from being evaluated by attack surface reduction rules. Excluded files aren't blocked from running, even if an attack surface reduction rule detects malicious behavior in the files or folders.

For example, consider the [Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware) ASR rule. This rule errs on the side of caution by triggering on files that don't yet have a positive reputation. The rule doesn't trigger only on files with a bad reputation.

The ransomware rule is designed to help enterprise customers reduce risks of ransomware attacks while ensuring business continuity. By default, the ransomware rule errors on the side of caution and protect against files that haven't yet attained sufficient reputation and trust. To re-emphasize, the ransomware rule only triggers on files that haven't gained enough positive reputation and prevalence, based on usage metrics of millions of our customers. Usually, the blocks are self resolved, because each file's "reputation and trust" values are incrementally upgraded as nonproblematic usage increases.





An exclusion can apply to all rules that allow exclusions or apply to specific rules using [per-rule exclusions](attack-surface-reduction-rules-deployment-test.md#configure-attack-surface-reduction-per-rule-exclusions). You can specify an individual file, folder path, or the fully qualified domain name for a resource.

An exclusion is applied only when the excluded application or service starts. For example, if you add an exclusion for an update service that is already running, the update service continues to trigger events until the service is stopped and restarted.

Attack surface reduction supports environment variables and wildcards. For information about using wildcards, see [use wildcards in the file name and folder path or extension exclusion lists](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists).
If you're encountering problems with rules detecting files that you believe shouldn't be detected, [use audit mode to test the rule](attack-surface-reduction-rules-deployment-test.md).

See the [attack surface reduction rules reference](attack-surface-reduction-rules-reference.md) article for details on each rule.

##### Use Group Policy to exclude files and folders

1. On your Group Policy management computer, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console). Right-click the Group Policy Object you want to configure and select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** and select **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Microsoft Defender Exploit Guard** \> **Attack surface reduction**.

1. Double-click the **Exclude files and paths from Attack surface reduction Rules** setting and set the option to **Enabled**. Select **Show** and enter each file or folder in the **Value name** column. Enter **0** in the **Value** column for each item.

> [!WARNING]
> Don't use quotes as they aren't supported for either the **Value name** column or the **Value** column.

##### Use PowerShell to exclude files and folders

Run the following command in an elevated PowerShell prompt (a PowerShell window you opened by selecting **Run as administrator**):

```powershell
Add-MpPreference -AttackSurfaceReductionOnlyExclusions "Value1","Value2",..."ValueN"
```

A value can be a folder path or a fully qualified resource name. For example:

- "C:\Windows"
- "C:\Windows\App.exe"

> [!TIP]
> To see the current list of exclusions, use the **Get-MpPreference** cmdlet: `(Get-MpPreference).AttackSurfaceReductionOnlyExclusions`.
>
> To remove exclusions without affecting other existing values, use the **Remove-MpPreference** cmdlet: `Remove-MpPreference -AttackSurfaceReductionOnlyExclusions "Value1","Value2",..."ValueN"`.
>
> To replace all existing exclusions with the values you specify, use the **Set-MpPreference** cmdlet: `Set-MpPreference -AttackSurfaceReductionOnlyExclusions "Value1","Value2",..."ValueN"`.

##### Use MDM CSPs to exclude files and folders

Use the [./Vendor/MSFT/Policy/Config/Defender/AttackSurfaceReductionOnlyExclusions](/windows/client-management/mdm/policy-csp-defender#defender-attacksurfacereductiononlyexclusions) configuration service provider (CSP) to add exclusions.

##### Customize the notification

You can customize the notification for when a rule is triggered and blocks an app or file. See the [Windows Security](/windows/security/threat-protection/windows-defender-security-center/windows-defender-security-center#customize-notifications-from-the-windows-defender-security-center) article.

## More articles in this deployment collection

[Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md)

[Plan attack surface reduction rules deployment](attack-surface-reduction-rules-deployment-plan.md)

[Test attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)

[Operationalize attack surface reduction rules](attack-surface-reduction-rules-deployment-operationalize.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)

## See also

- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
