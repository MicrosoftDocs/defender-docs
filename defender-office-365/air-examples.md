---
title: Automated investigation and response examples
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
ms.date: 01/10/2025
description: See examples for how to start automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2.
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

Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2 (included in Microsoft 365 licenses like E5 or as a standalone subscription) enables your SecOps team to operate more efficiently and effectively. AIR includes automated investigations to well-known threats, and provides recommended remediation actions. The SecOps team can review the evidence and approve or reject the recommended actions. For more information about AIR, see [Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2](air-about.md).

This article describes how AIR works through several examples:

- [Example: A user-reported phishing message launches an investigation playbook](#example-a-user-reported-phishing-message-launches-an-investigation-playbook)
- [Example: A security administrator triggers an investigation from Threat Explorer](#example-a-security-administrator-triggers-an-investigation-from-threat-explorer)
- [Example: A security operations team integrates AIR with their SIEM using the Office 365 Management Activity API](#example-a-security-operations-team-integrates-air-with-their-siem-using-the-office-365-management-activity-api)

## Example: A user-reported phishing message launches an investigation playbook

A user receives an email that looks like a phishing attempt. The user reports the message using the [Microsoft Report Message or Report Phishing add-ins](submissions-users-report-message-add-in-configure.md), which results in an alert that's triggered by the **Email reported by user as malware or phish** [alert policy](/purview/alert-policies#threat-management-alert-policies), which automatically launches the investigation playbook.

Various aspects of the reported email message are assessed. For example:

- The identified threat type
- Who sent the message
- Where the message was sent from (sending infrastructure)
- Whether other instances of the message were delivered or blocked
- The tenant landscape, including similar messages and their verdicts through email clustering
- Whether the message is associated with any known campaigns
- And more.

The playbook evaluates and automatically resolves submissions where no action is needed (which frequently happens on user reported messages). For the remaining submissions, a list of recommended actions to take on the original message and the associated _entities_ (for example, attached files, included URLs, and recipients) is provided:

- Identify similar email messages via email cluster searches.
- Determine whether any users clicked through any malicious links in suspicious email messages.
- Risks and threats are assigned. For more information, see [Details and results of an automated investigation](air-view-investigation-results.md).
- Remediation steps. For more information, see [Remediation actions in Microsoft Defender for Office 365](air-remediation-actions.md).

## Example: A security administrator triggers an investigation from Threat Explorer

You're in Explorer (Threat Explorer) at <https://security.microsoft.com/threatexplorerv3> in the **All email**, **Malware**, or **Phish** views. You're on the **Email** tab (view) of the details area below the chart. You select a message to investigate by using either of the following methods:

- Select one or more entries in the table by selecting the check box next to the first column. :::image type="icon" source="media/m365-cc-sc-take-actions-icon.png" border="false"::: **Take action** is available directly in the tab.

  :::image type="content" source="media/te-rtd-all-email-view-take-action.png" alt-text="Screenshot of the Email view (tab) of the details table with a message selected and Take action active." lightbox="media/te-rtd-all-email-view-take-action.png":::

- Click on the **Subject** value of an entry in the table. The details flyout that opens contains :::image type="icon" source="media/m365-cc-sc-take-actions-icon.png" border="false"::: **Take action** at the top of the flyout.

  :::image type="content" source="media/te-rtd-all-email-view-email-tab-details-area-subject-details-flyout-actions-only.png" alt-text="The actions available in the details tab after you select a Subject value in the Email tab of the details area in the All email view." lightbox="media/te-rtd-all-email-view-email-tab-details-area-subject-details-flyout-actions-only.png":::

After you select :::image type="icon" source="media/m365-cc-sc-take-actions-icon.png" border="false"::: **Take action**, select **Initiate automated investigation**. For more information, see [Email remediation](threat-explorer-threat-hunting.md#email-remediation).

Similar to playbooks triggered by an alert, automatic investigations that are triggered from Threat Explorer include:

- A root investigation.
- Steps to identify and correlate threats. For more information, see [Details and results of an automated investigation](air-view-investigation-results.md).
- Recommended actions to mitigate threats. For more information, see [Remediation actions in Microsoft Defender for Office 365](air-remediation-actions.md).

## Example: A security operations team integrates AIR with their SIEM using the Office 365 Management Activity API

AIR capabilities in Defender for Office 365 Plan 2 include [reports and details](air-view-investigation-results.md) that the SecOps team can use to monitor and address threats. But you can also integrate AIR capabilities with other solutions. For example:

- Security information and event management (SIEM) systems.
- Case management systems.
- Custom reporting solutions.

Use the [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference) for integration with these solutions.

For an example of a custom solution that integrates alerts from user-reported phishing messages that were already processed by AIR into a SIEM server and case management system, see [Tech Community blog: Improve the Effectiveness of your SOC with Microsoft Defender for Office 365 and the Office 365 Management API](https://techcommunity.microsoft.com/t5/microsoft-security-and/improve-the-effectiveness-of-your-soc-with-office-365-atp-and/ba-p/1525185).

The integrated solution greatly reduces the number of false positives, which allows the SecOps team to focus their time and effort on real threats.

## Next steps

- [Get started using AIR](air-about.md)
- [View pending or completed remediation actions](air-review-approve-pending-completed-actions.md)
