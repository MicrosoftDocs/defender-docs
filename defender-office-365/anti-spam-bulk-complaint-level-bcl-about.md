---
title: Bulk complaint level values
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: concept-article
ms.localizationpriority: medium
search.appverid: 
  - MET150
ms.assetid: a5b03b3c-37dd-429e-8e9b-2c1b25031794
ms.collection: 
  - m365-security
  - tier2
description: Admins can learn about bulk complaint level (BCL) values that are used in Microsoft 365.
ms.service: defender-office-365
ms.date: 07/02/2023
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Bulk complaint level (BCL) in cloud organizations

All organizations with cloud mailboxes assign a bulk complaint level (BCL) value to inbound messages from bulk senders. The BCL value is added to the message in an X-header and is similar to the [spam confidence level (SCL)](anti-spam-spam-confidence-level-scl-about.md) that identifies messages as spam. A higher BCL value indicates a bulk message is more likely to exhibit undesirable spam-like behavior. Microsoft uses both internal and non-Microsoft sources to identify bulk mail and determine the appropriate BCL value.

Bulk senders vary in their sending patterns, content creation, and recipient acquisition practices. Good bulk senders send desired messages with relevant content to their subscribers. These messages generate few complaints from recipients. Other bulk senders send unsolicited messages that closely resemble spam and generate many complaints from recipients. Messages from a bulk sender are known as bulk mail or gray mail.

Spam filtering marks messages as **Bulk email** based on the BCL threshold in anti-spam policies and takes the specified action on the message. For more information, see [Configure anti-spam policies](anti-spam-policies-configure.md) and [What's the difference between junk email and bulk email?](anti-spam-spam-vs-bulk-about.md)

The BCL thresholds are described in the following table:

|BCL|Description|
|:---:|---|
|0|The message isn't from a bulk sender.|
|1, 2, 3|The message is from a bulk sender that generates few complaints.|
|4, 5, 6, 7|The message is from a bulk sender that generates a mixed number of complaints.|
|8, 9|The message is from a bulk sender that generates a high number of complaints.|

The default BCL threshold that's used in anti-spam policies is described in the following list:

- **Default anti-spam policy and new anti-spam policies**: 7.
- **[Standard preset security policy](preset-security-policies.md)**: 6.
- **Strict preset security policy**: 5.

Messages that meet or exceed the configured BCL threshold have the following default actions taken on them:

- **Default anti-spam policy, new anti-spam policies, and Standard preset security policy**: Deliver the message to recipient Junk Email folders.
- **Strict preset security policy**: [Quarantine the message](quarantine-end-user.md).

## BCL threshold in the Threat protection status report

The filters in the [View data by Email \> Spam and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--spam-and-chart-breakdown-by-detection-technology) view of the **Threat protection status report** in the Microsoft Defender portal at <https://security.microsoft.com/reports/TPSEmailSpamReportATP> contain the **Bulk complaint level** slider.

Select :::image type="icon" source="media/m365-cc-sc-filter-icon.png" border="false"::: **Filter**. In the **Filters** flyout that opens,  select only the **Detection** value **Bulk** in the **Filters** flyout that opens. Use the **Bulk complaint level** slider to increase or decrease the BCL threshold.

After you apply the filters and return to the main report page, you see that hanging the BCL threshold changes the data in the report:

- Increasing the BCL threshold identifies fewer messages as bulk.
- Decreasing the BCL threshold value identifies more messages as bulk.
- Set a minimum and maximum BCL threshold to see the effect on bulk detections.

:::image type="content" source="media/threat-protection-status-report-malware-detection-tech-view-bcl-slider.png" alt-text="Screenshot showing the Bulk complaint level slider in the filters of View data by Email \> Spam and Chart breakdown by Detection Technology in the Threat protection status report in the Microsoft Defender portal." lightbox="media/threat-protection-status-report-malware-detection-tech-view-bcl-slider.png":::

## Bulk senders insight

The bulk senders insight in the Defender portal allows you to see how much mail was identified as bulk at the current BCL threshold in anti-spam policies, and to simulate identified vs. allowed bulk email based on changes in the BCL threshold.

The bulk senders insight is available in the following locations in the Defender portal:

- In the properties of the default anti-spam policy or custom anti-spam policies.
- On the **Email & collaboration reports and insights** page at <https://security.microsoft.com/emailandcollabreport>.

For more information, see [Bulk senders insight](anti-spam-bulk-senders-insight.md).
