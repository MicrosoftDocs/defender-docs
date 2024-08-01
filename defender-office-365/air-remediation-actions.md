---
title: Remediation actions from AIR
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
description: "Learn about calculated and recommended remediation actions in automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2."
ms.date: 07/10/2024
ms.custom: 
- air
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Remediation actions from AIR in Microsoft Defender for Office 365 Plan 2

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

[Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2](air-about.md) often results in remediation actions that require [approval](air-review-approve-pending-completed-actions.md) from you security operations (SecOps) team.

In some cases, AIR doesn't result in specific remediation actions. To further investigate and take appropriate actions, use the guidance in the following table.

|Category|Threat/risk|Remediation actions|
|:---|:---|:---|
|Email|Malware|Soft delete email/cluster. <br/><br/> If more than a handful of related messages contain malware, the entire cluster is considered to be malicious.|
|Email|A malicious URL was detected by [Safe Links](safe-links-about.md).|Soft delete email/cluster. <br/><br/> Block URL at time-of-click. <br/><br/> The message that contains a malicious URL is considered to be malicious.|
|Email|Phishing|Soft delete email/cluster. <br/><br/> If more than a handful of related messages contain phishing attempts, the entire cluster is considered to be a phishing attempt.|
|Email|Phishing email delivered and then [removed by zero-hour auto purge (ZAP)](zero-hour-auto-purge.md).)|Soft delete email/cluster. <br/><br/> To see if ZAP removed a message, see [How to see if ZAP moved your message](zero-hour-auto-purge.md#how-to-see-if-zap-moved-your-message).|
|Email|[User reported phishing email](submissions-submit-files-to-microsoft.md)|[Automated investigation triggered by the user's report](air-examples.md#example-a-user-reported-phishing-message-launches-an-investigation-playbook)|
|Email|Volume anomaly (recent email quantities exceed the previous 7-10 days for matching criteria).|No specific pending actions from AIR. <br/><br/> A volume anomaly isn't a clear threat. Although a high volume of email can indicate potential issues, confirmation is required in terms of either malicious verdicts or a manual review of email messages/clusters. For more information, see [Find suspicious email that was delivered](threat-explorer-investigate-delivered-malicious-email.md#find-suspicious-email-that-was-delivered).|
|Email|No threats found (the system found no threats based on files, URLs, or analysis of email cluster verdicts).|No specific pending actions from AIR. <br/><br/> Threats found and [removed by ZAP](zero-hour-auto-purge.md) after a completed investigation aren't reflected in an investigation's numerical results, but such threats are viewable in [Threat Explorer](threat-explorer-real-time-detections-about.md).|
|User|A user clicked a malicious URL (a user visited a page that was later found to be malicious, or bypassed a [Safe Links warning page](safe-links-about.md#warning-pages-from-safe-links) to get to a malicious page.)|No specific pending actions from AIR. <br/><br/> Block URL at time-of-click. <br/><br/> Use Threat Explorer to [view data about URLs and click verdicts](threat-explorer-real-time-detections-about.md#click-verdict-pivot-for-the-url-clicks-view-for-the-details-area-of-the-all-email-view-in-threat-explorer). <br/><br/> If your organization is using [Microsoft Defender for Endpoint](/windows/security/threat-protection/), consider [investigating the user](/defender-endpoint/investigate-user) to determine if their account is compromised.|
|User|User sending malware/phishing messages|No specific pending actions from AIR. <br/><br/> The user might be reporting malware/phishing messages, or someone could be [spoofing the user](anti-phishing-protection-spoofing-about.md) as part of an attack. Use [Threat Explorer](threat-explorer-real-time-detections-about.md) to view and handle email containing [malware](threat-explorer-real-time-detections-about.md#malware-view-in-threat-explorer-and-real-time-detections) or [phishing](threat-explorer-real-time-detections-about.md#phish-view-in-threat-explorer-and-real-time-detections).|
|User|Automatic external email forwarding ([SMTP forwarding](/exchange/recipients-in-exchange-online/manage-user-mailboxes/configure-email-forwarding), Inbox rules, or Exchange mail flow rules (also known as transport rules) could be used for data exfiltration).|Remove the forwarding rule or configuration. <br/><br/> Use the [Autoforwarded messages report](/exchange/monitoring/mail-flow-reports/mfr-auto-forwarded-messages-report) to view specific details about forwarded email.|
|User|Email delegation (an account has delegations set up).|Remove delegations. <br/><br/> If your organization is using [Defender for Endpoint](/windows/security/threat-protection/), consider [investigating the user](/defender-endpoint/investigate-user) with the delegation permission.|
|User|Data exfiltration (a user violated email or file-sharing [DLP policies](/purview/dlp-learn-about-dlp)).|AIR doesn't result in a specific pending action. <br/><br/> [Get started with Activity Explorer](/purview/data-classification-activity-explorer#get-started-with-activity-explorer).|
|User|Anomalous email sending (a user recently sent more email than during the previous 7-10 days.)|No specific pending actions from AIR. <br/><br/> Sending a large volume of email isn't necessarily malicious (for example, the user might have sent email to a large group of recipients for an event). To investigate, use the [New users forwarding email insight](/exchange/monitoring/mail-flow-insights/mfi-new-users-forwarding-email-insight) and [Outbound message report](/exchange/monitoring/mail-flow-reports/mfr-inbound-messages-and-outbound-messages-reports) in the Exchange admin center (EAC).|

## Next steps

- [View details and results of an automated investigation in Microsoft Defender for Office 365](air-view-investigation-results.md)
- [View pending or completed remediation actions following an automated investigation in Microsoft Defender for Office 365](air-review-approve-pending-completed-actions.md)

## Related articles

- [Learn about automated investigation in Microsoft Defender for Endpoint](/windows/security/threat-protection/microsoft-defender-atp/automated-investigations)
- [Learn about capabilities in Microsoft Defender XDR](/defender-xdr/microsoft-365-defender)
