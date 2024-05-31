---
title: How automated investigation and response works in Microsoft Defender for Office 365
f1.keywords:
- NOCSH
author: chrisda
ms.author: chrisda
manager: deniseb
audience: ITPro
ms.topic: conceptual
ms.localizationpriority: medium
search.appverid:
- MET150
- MOE150
ms.collection:
- m365-security
- tier2
ms.date: 06/09/2023
description: See how automated investigation and response (AIR) works in Microsoft Defender for Office 365 Plan 2.
ms.custom:
- air
- seo-marvel-mar2020
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Automated investigation and response (AIR) examples in Microsoft Defender for Office 365 Plan 2

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

It's up to your security operations (SecOps) team to investigate security alerts and take steps to protect your organization. SecOps teams can often feel overwhelmed by the volume of alerts that require review. Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2 can help. For more information about AIR, see [Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2](air-about.md).

AIR enables your SecOps team to operate more efficiently and effectively. AIR includes automated investigations to well-known threats, and provides recommended remediation actions. The SecOps team can review the evidence and approve or reject the recommended actions.

This article describes how AIR works through several examples:

- [Example 1: A user-reported phishing message launches an investigation playbook](#example-a-user-reported-phishing-message-launches-an-investigation-playbook)
- [Example 2: A security administrator triggers an investigation from Threat Explorer](#example-a-security-administrator-triggers-an-investigation-from-threat-explorer)
- [Example 3: A security operations team integrates AIR with their SIEM using the Office 365 Management Activity API](#example-a-security-operations-team-integrates-air-with-their-siem-using-the-office-365-management-activity-api)

## Example: A user-reported phishing message launches an investigation playbook

A user receives an email that looks like a phishing attempt. The user reports the message using the [Microsoft Report Message or Report Phishing add-ins](submissions-users-report-message-add-in-configure.md), which results in the following actions:

- Depending on the [user reported settings](submissions-user-reported-messages-custom-mailbox.md), the message is sent to Microsoft for analysis.
- The submission is added to the **User reported** tab of the **Submissions** page in the Microsoft Defender portal at <https://security.microsoft.com/reportsubmission?viewid=user>.
- An alert is triggered by the **Email reported by user as malware or phish** [alert policy](/purview/alert-policies#threat-management-alert-policies), which automatically launches the investigation playbook.

During the root investigation phase, various aspects of the reported email message are assessed. For example:

- A determination of the threat type.
- Who sent the message.
- Where the message was sent from (sending infrastructure).
- Whether other instances of the message were delivered or blocked.
- An assessment from our analysts.
- Whether the message is associated with any known campaigns.
- And more.

After the root investigation is complete, the playbook provides a list of recommended actions to take on the original message and the associated _entities_ (for example, attached files, included URLs, and recipients).

Next, several threat investigation and hunting steps are done:

- Identify similar email messages via email cluster searches.
- Share the signal with other platforms (for example, [Microsoft Defender for Endpoint](/windows/security/threat-protection/microsoft-defender-atp/microsoft-defender-advanced-threat-protection)).
- Determine whether any users have clicked through any malicious links in suspicious email messages.
- Determine whether similar messages were reported by other users in [Exchange Online Protection](eop-about.md) (EOP) and [Microsoft Defender for Office 365](mdo-about.md).
- Determine whether a user has been compromised. This check leverages signals across Office 365, [Microsoft Defender for Cloud Apps](/cloud-app-security), and [Microsoft Entra ID](/azure/active-directory), correlating any related user activity anomalies.

During the hunting phase, risks and threats are assigned to various hunting steps. For more information, see [Details and results of an automated investigation](air-view-investigation-results.md).

Remediation is the final phase of the playbook. During this phase, remediation steps are taken, based on the investigation and hunting phases. For more information, see [Remediation actions in Microsoft Defender for Office 365](air-remediation-actions.md).

## Example: A security administrator triggers an investigation from Threat Explorer

In addition to automated investigations that are triggered by an alert, your organization's security operations team can trigger an automated investigation from a view in [Threat Explorer](threat-explorer-real-time-detections-about.md). This investigation also creates an alert, so Microsoft Defender XDR incidents and external SIEM tools can see that this investigation was triggered.

For example, suppose that you are using the **Malware** view in Explorer. Using the tabs below the chart, you select the **Email** tab. If you select one or more items in the list, the **+ Actions** button activates.

:::image type="content" source="media/Explorer-Malware-Email-ActionsInvestigate.png" alt-text="The Explorer with selected messages" lightbox="media/Explorer-Malware-Email-ActionsInvestigate.png":::

Using the **Actions** menu, you can select **Trigger investigation**.

:::image type="content" source="media/explorer-malwareview-selectedemails-actions.jpg" alt-text="The Actions menu for selected messages" lightbox="media/explorer-malwareview-selectedemails-actions.jpg":::

Similar to playbooks triggered by an alert, automatic investigations that are triggered from a view in Explorer include a root investigation, steps to identify and correlate threats, and recommended actions to mitigate those threats.

## Example: A security operations team integrates AIR with their SIEM using the Office 365 Management Activity API

AIR capabilities in Microsoft Defender for Office 365 include [reports & details](air-view-investigation-results.md) that security operations teams can use to monitor and address threats. But you can also integrate AIR capabilities with other solutions. Examples include a security information and event management (SIEM) system, a case management system, or a custom reporting solution. These kinds of integrations can be done by using the [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference).

For example, recently, an organization set up a way for their security operations team to view user-reported phish alerts that were already processed by AIR. Their solution integrates relevant alerts with the organization's SIEM server and their case-management system. The solution greatly reduces the number of false positives so that their security operations team can focus their time and effort on real threats. To learn more about this custom solution, see [Tech Community blog: Improve the Effectiveness of your SOC with Microsoft Defender for Office 365 and the O365 Management API](https://techcommunity.microsoft.com/t5/microsoft-security-and/improve-the-effectiveness-of-your-soc-with-office-365-atp-and/ba-p/1525185).

## Next steps

- [Get started using AIR](air-about.md)
- [View pending or completed remediation actions](air-review-approve-pending-completed-actions.md)
