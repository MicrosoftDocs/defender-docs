---
title: Submissions, suppressions, and exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus
description: Learn about suppressing alerts, submitting files for analysis, and defining exclusions and indicators to reduce noise and risk for your organization.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.topic: how-to
author: denisebmsft
ms.author: deniseb
ms.custom: nextgen
ms.date: 09/19/2024
ms.reviewer: joshbregman
manager: deniseb
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Submissions, suppressions, and exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender Antivirus
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

**Platforms**

- Windows

> [!NOTE]
> As a Microsoft MVP, [Fabian Bader](https://cloudbrothers.info) contributed to and provided material feedback for this article.

[Microsoft Defender for Endpoint](microsoft-defender-endpoint.md) includes a wide range of capabilities to prevent, detect, investigate, and respond to advanced cyberthreats. These capabilities include [Next-generation protection](next-generation-protection.md) (which includes Microsoft Defender Antivirus). As with any endpoint protection or antivirus solution, sometimes files, folders, or processes that aren't actually a threat can be detected as malicious by Defender for Endpoint or Microsoft Defender Antivirus. These entities can be blocked or sent to quarantine, even though they're not really a threat. 

This article describes the most common scenarios where this behavior occurs and the capabilites available in Defender for Endpoint and Microsoft Defender Antivirus to safely prevent or address it without impacting your productivity. These actions include:

- [Submitting a file to Microsoft for analysis](#submitting-files-for-analysis)
- [Suppressing an alert](#suppressing-alerts)
- [Adding an exclusion or indicator](#using-exclusions-and-indicators)

> [!CAUTION]
> **Defining exclusions reduces the level of protection offered by Defender for Endpoint and Microsoft Defender Antivirus**. Use exclusions as a last resort, and make sure to define only the exclusions that are necessary. Make sure to review your exclusions periodically, and remove the ones you no longer need. See [Important points about exclusions](configure-exclusions-microsoft-defender-antivirus.md#important-points-about-exclusions) and [Common mistakes to avoid](common-exclusion-mistakes-microsoft-defender-antivirus.md).

## Submissions, suppressions, and exclusions

When you're dealing with false positives, or known entities that are generating alerts, you don't necessarily need to add an exclusion. Sometimes classifying and suppressing an alert is enough. We recommend submitting false positives (and false negatives) to Microsoft for analysis as well. The following table describes some scenarios and what steps to take with respect to file submissions, alert suppressions, and exclusions.

| Scenario | Steps to consider |
|:---|:----|
| [False positive](defender-endpoint-false-positives-negatives.md): An entity, such as a file or a process, was detected and identified as malicious, even though the entity isn't a threat. | 1. [Review and classify alerts](defender-endpoint-false-positives-negatives.md#part-1-review-and-classify-alerts) that were generated as a result of the detected entity. <br/>2. [Suppress an alert](defender-endpoint-false-positives-negatives.md#suppress-an-alert) for a known entity. <br/>3. [Review remediation actions](defender-endpoint-false-positives-negatives.md#part-2-review-remediation-actions) that were taken for the detected entity. <br/>4. [Submit the false positive to Microsoft](/defender-xdr/submission-guide) for analysis. <br/>5. [Define an exclusion](defender-endpoint-false-positives-negatives.md#part-3-review-or-define-exclusions) for the entity (only if necessary). |
| [Performance issues](troubleshoot-performance-issues.md) such as one of the following issues:<br/>- A system is having high CPU usage or other performance issues.<br/>- A system is having memory leak issues.<br/>- An app is slow to load on devices.<br/>- An app is slow to open a file on devices. | 1. [Collect diagnostic data](collect-diagnostic-data.md) for Microsoft Defender Antivirus.<br/>2. If you're using a non-Microsoft antivirus solution, [check with the vendor for any needed exclusions](troubleshoot-performance-issues.md#check-with-vendor-for-antivirus-exclusions).<br/>3. [Analyze the Microsoft Protection Log](troubleshoot-performance-issues.md#analyze-the-microsoft-protection-log) to see the estimated performance impact.<br/>4. [Define an exclusion for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md) (if necessary).<br/>5. [Create an indicator for Defender for Endpoint](manage-indicators.md) (only if necessary). |
| [Compatibility issues](microsoft-defender-antivirus-compatibility.md) with non-Microsoft antivirus products. <br/>Example: Defender for Endpoint relies on security intelligence updates for devices, whether they're running Microsoft Defender Antivirus or a non-Microsoft antivirus solution.  | 1. If you're using a non-Microsoft antivirus product as your primary antivirus/antimalware solution, [set Microsoft Defender Antivirus to passive mode](microsoft-defender-antivirus-compatibility.md#requirements-for-microsoft-defender-antivirus-to-run-in-passive-mode).<br/>2. If you're switching from a non-Microsoft antivirus/antimalware solution to Defender for Endpoint, see [Make the switch to Defender for Endpoint](switch-to-mde-overview.md). This guidance includes:<br/>- [Exclusions you might need to define for the non-Microsoft antivirus/antimalware solution](switch-to-mde-phase-2.md#step-3-add-microsoft-defender-for-endpoint-to-the-exclusion-list-for-your-existing-solution);<br/>- [Exclusions you might need to define for Microsoft Defender Antivirus](switch-to-mde-phase-2.md#step-4-add-your-existing-solution-to-the-exclusion-list-for-microsoft-defender-antivirus); and <br/>- [Troubleshooting information](switch-to-mde-troubleshooting.md) (just in case something goes wrong while migrating). |

> [!IMPORTANT]
> An "allow" indicator is the strongest type of exclusion you can define in Defender for Endpoint. Make sure to use indicators sparingly (only when necessary), and review all exclusions periodically.

## Submitting files for analysis

If you have a file that you think is wrongly detected as malware (a false positive), or a file that you suspect might be malware even though it wasn't detected (a false negative), you can submit the file to Microsoft for analysis. Your submission is scanned immediately, and will then be reviewed by Microsoft security analysts. You're able to check the status of your submission on the [submission history page](https://www.microsoft.com/wdsi/submissionhistory).

Submitting files for analysis helps reduce false positives and false negatives for all customers. To learn more, see the following articles:

- [Submit files for analysis](/microsoft-365/security/intelligence/submission-guide) (available to all customers)
- [Submit files using the new unified submissions portal in Defender for Endpoint](admin-submissions-mde.md) (available to customers who have Defender for Endpoint Plan 2 or Microsoft Defender XDR)

## Suppressing alerts

If you're getting alerts in the Microsoft Defender portal for tools or processes that you know aren't actually a threat, you can suppress those alerts. To suppress an alert, you create a suppression rule, and specify what actions to take for that on other, identical alerts. You can create suppression rules for a specific alert on a single device, or for all alerts that have the same title across your organization.

To learn more, see the following articles:

- [Suppress alerts](manage-alerts.md#suppress-alerts)
- [Introducing the new alert suppression experience](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/introducing-the-new-alert-suppression-experience/ba-p/3562719) (for Defender for Endpoint)

## Using exclusions and indicators

Sometimes, the term *exclusions* is used to refer to exceptions that apply across Defender for Endpoint and Microsoft Defender Antivirus. A more accurate way to describe these exceptions is as follows:

- [Indicators for Defender for Endpoint](manage-indicators.md); (which apply across Defender for Endpoint and Microsoft Defender Antivirus); and
- [Exclusions for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md).

For more information, see [Exclusions overview](navigate-defender-endpoint-antivirus-exclusions.md).

## See also

- [Important points about exclusions](configure-exclusions-microsoft-defender-antivirus.md#important-points-about-exclusions)
- [Common mistakes to avoid when defining exclusions](common-exclusion-mistakes-microsoft-defender-antivirus.md)
- [Blog post: The Hitchhiker's Guide to Microsoft Defender for Endpoint exclusions](https://cloudbrothers.info/en/guide-to-defender-exclusions/)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
