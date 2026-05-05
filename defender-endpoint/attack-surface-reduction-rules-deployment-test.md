---
title: Test your ASR rules deployment
description: Learn how to test attack surface reduction (ASR) rules in Audit mode, review triggered events, and configure exclusions before enabling rules in Block mode.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom: asr, msecd-doc-authoring-1012
ms.topic: how-to
ms.collection:
 - m365-security
 - m365solution-asr-rules
 - highpri
 - tier1
 - mde-asr
ms.date: 05/04/2026
ai-usage: ai-assisted
#customer intent: As an IT admin, I want to test ASR rules in Audit mode so that I can identify false positives and configure exclusions before enabling rules in Block mode.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Test your attack surface reduction (ASR) rules deployment

This article is part of the [Attack surface reduction rules deployment guide](attack-surface-reduction-rules-deployment.md).

Testing attack surface reduction (ASR) rules is a critical step in your deployment. You need to determine if any ASR rules will block your line-of-business apps. By starting with a small, controlled group, you can limit potential work disruptions as you expand the deployment across your organization.

> [!NOTE]
> Before you begin the testing phase of your ASR rules deployment, disable any related ASR rules that are currently enabled in **Block** or **Warn** mode (if applicable). For information about using the report to find enabled ASR rules, see [Attack surface reduction rules reports](attack-surface-reduction-rules-report.md).

As illustrated in the following diagram, begin your ASR rules deployment with ring 1.

> :::image type="content" source="media/asr-rules-testing-steps.png" alt-text="Diagram of the ASR rules testing steps: audit rules, review data, and configure exclusions." lightbox="media/asr-rules-testing-steps.png":::

## Assess and evaluate rules before deployment

In Defender for Endpoint Plan 2, [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) surfaces ASR rule–related security recommendations that can provide high-level impact indicators (for example, whether audit activity has been observed across devices).

In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Exposure management** \> **Recommendations** (or directly to the **Security recommendations** page at <https://security.microsoft.com/exposure-recommendations>). On the **Security recommendations** page, select an ASR rule to open the details flyout, and then select the **Devices** tab. The **User impact** value shows the percentage of devices that can accept a new policy enabling the rule in block mode without adversely affecting productivity.

:::image type="content" source="media/asrrecommendation.png" alt-text="Screenshot of the Devices tab of an ASR rule security recommendation showing user impact." lightbox="media/asrrecommendation.png":::

> [!NOTE]
> To accurately assess the potential effect of an ASR rule before enabling it in **Block** or **Warn** mode, you must review **Audit** mode telemetry and detailed reporting, such as the [Attack surface reduction rule report](attack-surface-reduction-rules-report.md) or [Advanced hunting data](attack-surface-reduction-rules-monitor.md#asr-rule-events-in-advanced-hunting).

## Step 1: Test all ASR rules in Audit mode

Typically, enable all ASR rules in **Audit** mode at the same time so you can determine which rules are triggered by everyday business activities. Start with your ASR rule champions or devices in ring 1.

ASR rules in **Audit** mode don't affect users. But the rules generate logged events that you can evaluate.

If your organization has Microsoft Intune (included in subscriptions like Microsoft 365 E5 or available as an add-on), use the **Attack surface reduction** endpoint security policy in Intune to configure and distribute ASR rules in **Audit** mode. For instructions, see [Configure ASR rules and exclusions in Intune using endpoint security policies](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies).

If you don't have Intune, other ASR rule deployment methods are available:

- [Microsoft Configuration Manager](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-global-asr-rule-exclusions-in-microsoft-configuration-manager)
- [Any MDM solution using the Policy CSP](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-any-mdm-solution-using-the-policy-csp)
- [Group Policy](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-group-policy)
- [PowerShell](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-powershell)

> [!TIP]
> The deployment method you use for ASR rules doesn't affect reporting data, as long as the devices are enrolled in Defender for Endpoint.

<a name='step-2-understand-the-asr-rules-reporting-page-in-the-microsoft-365-defender-portal'></a>

<a name='use-windows-event-viewer-review-as-an-alternative-to-the-attack-surface-reduction-rules-reporting-page-in-the-microsoft-365-defender-portal'></a>

## Step 2: Review ASR rule data and assess impact

After ASR rules are deployed in **Audit** mode, review the triggered events to assess their effects and identify potential exclusions using some or all of the following methods:

In Defender for Endpoint Plan 2 or Microsoft Defender for Business, use the **Attack surface reduction rules report** in the Microsoft Defender portal. For complete information, see [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md).

In Defender for Endpoint Plan 2, use Advanced hunting to find ASR rule events. For more information, see [ASR rule events in Advanced Hunting](attack-surface-reduction-rules-monitor.md#asr-rule-events-in-advanced-hunting).

In Defender for Endpoint Plan 2 or Defender for Business, use the Defender for Endpoint device timeline. For more information, see [Microsoft Defender for Endpoint device timeline](investigate-machines.md#investigate-device-timeline).

Otherwise, ASR rule events are available only in Windows Event Viewer on the local device. But you can use [Windows Event Forwarding](/windows/security/operating-system-security/device-management/use-windows-event-forwarding-to-assist-in-intrusion-detection) to centralize the ASR rule data collection.

Specifically, look for **Event ID 1122** in the **Applications and Services Logs** \> **Microsoft** \> **Windows** \> **Windows Defender** \> **Operational** log (events for rules in **Audit** mode). For a complete list of ASR rule event IDs and detailed steps, see [View attack surface reduction events in Windows Event Viewer](attack-surface-reduction-windows-events.md#browse-attack-surface-reduction-events-in-windows-event-viewer).

<a name='add-exclusions'></a>

## Step 3: Configure ASR rule exclusions

After you review ASR rule data from **Audit** mode, you might find that some ASR rules block legitimate business apps or activity (known as _false positives_). You can add exclusions to prevent ASR rules from evaluating the affected files or folders.

For an overview of supported exclusion types for ASR rules, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

If you used an **Attack surface reduction** endpoint security policy in Microsoft Intune to deploy the ASR rules, use the same policy to configure ASR rule exclusions. For instructions, see [Configure ASR rules and exclusions in Intune using endpoint security policies](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies).

If you used a different method to deploy the ASR rules, use the same method to configure ASR rule exclusions:

- [Microsoft Configuration Manager](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-global-asr-rule-exclusions-in-microsoft-configuration-manager)
- [Group Policy](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-group-policy)
- [Any MDM solution using the Policy CSP](attack-surface-reduction-rules-configure.md#configure-global-asr-rule-exclusions-in-any-mdm-solution-using-the-policy-csp)
- [PowerShell](attack-surface-reduction-rules-configure.md#configure-global-asr-rule-exclusions-in-powershell)

> [!TIP]
> Rule exclusions are better than turning off rules or switching them back to **Audit** mode. Take advantage of **Warn** mode in available rules to limit disruptions without disabling the rule entirely. For more information, see [Modes for ASR rules](attack-surface-reduction-rules-overview.md#modes-for-asr-rules).

## Related content

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Plan your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Enable attack surface reduction (ASR) rules](attack-surface-reduction-rules-deployment-implement.md)
- [Manage and monitor your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-operationalize.md)
- [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md)
- [Troubleshoot attack surface reduction rules](troubleshoot-asr.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
