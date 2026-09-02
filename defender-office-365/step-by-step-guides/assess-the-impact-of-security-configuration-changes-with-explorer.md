---
title: Assess the impact of security configuration changes with Explorer
description: Examples and walk-through of using Explorer to determine the impact of a security control (configuration) change in Microsoft Defender for Office 365.
ms.service: defender-office-365
author: MSFTBen
ms.author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 07/02/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Assess the impact of security configuration changes with Explorer

Before you make changes to your security configuration, such as policies or transport rules, it's important to understand the impact of security-configuration changes so that you can plan and ensure *minimal* disruption to your organization.

This step-by-step guide takes you through assessing the impact of changing a phish action or removing a sender override, and exporting the impacted emails for assessment.

<a name="what-you-need"></a>
## Prerequisites

Before you begin, make sure you meet the following requirements:

- Microsoft Defender for Office 365 Plan 2 (included as part of E5).
- Sufficient permissions (Security reader minimum required to assess via Threat Explorer).
- 5-10 minutes to perform the following procedures.

## Assess changing normal confidence phish delivery location to quarantine (from the Junk email folder)

Explorer (Threat Explorer) is the message investigation view in the Microsoft Defender portal that lets you filter and analyze affected email. Use it to assess the impact of changing normal confidence phish delivery to quarantine:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) and navigate to Explorer (underneath *Email & Collaboration* on the left nav) <https://security.microsoft.com/threatexplorer>.
1. Select **Phish** from the top tab selection (*All email* is the default view).
1. Press the **filter** button (defaulted to *Sender*) and select **Phish confidence level**.
1. Select the **Phish confidence level** of **Normal**.
1. Add an additional **filter** of **Original delivery location** set as **Junk folder**.
1. Press **Refresh**. Explorer is now filtered to show all the mail that is detected as *normal confidence phish* and gets delivered to the Junk folder due to your organization's anti-spam policy settings.
1. If you wish to pivot the data displayed in the chart, you can do by using the **data slicer** (defaulted to *Delivery action*) in the chart controls, selecting useful data such as **Sender IP**, or **Sender domain** to spot trends and top affected senders.
1. Below the chart section, where the affected emails are displayed, select **Export email list**, which will generate a CSV for offline analysis. **The exported CSV lists the emails that would be quarantined if the phish action were changed to Quarantine (recommended change for both standard and strict presets)**.

<a name="assess-removing-a-sender--domain-override-removal"></a>
## Assess the impact of removing a sender or domain override

Use the following steps to assess the impact of removing a sender or domain override:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) and navigate to **Explorer** (underneath Email & Collaboration on the left nav) <https://security.microsoft.com/threatexplorer>.
1. Select **All email** if not already selected.
1. Press the **filter** button (defaulted to *Sender*) and add either a sender or sender domain filter, then add the entry where you wish to assess the impact of removal.
1. Expand the date range to the maximum & press **Refresh** You should now see mail listed if the sender / sending domain is still active in messaging your organization. If *not* you may need to tweak the filter, or alternatively you no longer receive mail from that domain / sender and can remove the entry safely.
1. If mail is listed, the sender or domain entry is still active. Pivot the data in the chart using the data slicer (defaulted to *Delivery action*) to **Detection technology**.
1. The chart should refresh, and if it now displays no data, an empty chart means no threats were detected in the previously shown mail, which indicates an override isn't needed, as there's no detection to override.
1. If there's data displayed when the data is sliced by **Detection technology**, removing the selected sender or domain override *would* affect that sender or domain because the protection stack is taking action.
1. You should investigate the mail further to assess if it's truly malicious and the entry can be removed, or if it's a *false positive* and should be remediated so it's no longer incorrectly detected as a threat (authentication is the biggest cause of false positives).

### Further reading

Consider using secure presets [Ensuring you always have the optimal security controls with preset security policies](ensuring-you-always-have-the-optimal-security-controls-with-preset-security-policies.md).

You can also manage email authentication issues with spoof intelligence [Spoof intelligence insight](../anti-spoofing-spoof-intelligence.md).

For more information, see [Email authentication](../email-authentication-about.md).
