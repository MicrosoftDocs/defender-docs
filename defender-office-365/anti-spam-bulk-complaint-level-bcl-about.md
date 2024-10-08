---
title: Bulk complaint level values
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: conceptual
ms.localizationpriority: medium
search.appverid: 
  - MET150
ms.assetid: a5b03b3c-37dd-429e-8e9b-2c1b25031794
ms.collection: 
  - m365-security
  - tier2
description: Admins can learn about bulk complaint level (BCL) values that are used in Exchange Online Protection (EOP).
ms.service: defender-office-365
ms.date: 10/17/2023
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Bulk complaint level (BCL) in EOP

In Microsoft 365 organizations with mailboxes in Exchange Online or standalone Exchange Online Protection (EOP) organizations without Exchange Online mailboxes, EOP assigns a bulk complaint level (BCL) value to inbound messages from bulk senders. The BCL value is added to the message in an X-header and is similar to the [spam confidence level (SCL)](anti-spam-spam-confidence-level-scl-about.md) that's used to identify messages as spam. A higher BCL value indicates a bulk message is more likely to exhibit undesirable spam-like behavior. Microsoft uses both internal and third party sources to identify bulk mail and determine the appropriate BCL value.

Bulk senders vary in their sending patterns, content creation, and recipient acquisition practices. Good bulk senders send desired messages with relevant content to their subscribers. These messages generate few complaints from recipients. Other bulk senders send unsolicited messages that closely resemble spam and generate many complaints from recipients. Messages from a bulk sender are known as bulk mail or gray mail.

Spam filtering marks messages as **Bulk email** based on the BCL threshold (the default value or a value you specify) and takes the specified action on the message. For more information, see [Configure anti-spam policies](anti-spam-policies-configure.md) and [What's the difference between junk email and bulk email?](anti-spam-spam-vs-bulk-about.md)

The BCL thresholds are described in the following table.

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

The [View data by Email \> Spam and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--spam-and-chart-breakdown-by-detection-technology) view in the Threat protection status report has a **Bulk complaint level** slider. This slider is available in :::image type="icon" source="media/m365-cc-sc-filter-icon.png" border="false"::: **Filter** when you also select the **Detection** value **Bulk**. Using this slider shows you the results of increasing or decreasing the BCL value in the report.


If you select **Edit spam threshold and properties** at the bottom of the **Bulk email threshold & spam properties** section in the details flyout of the default anti-spam policy or a custom anti-spam policy that you select from the **Anti-spam policies** page at <https://security.microsoft.com/antispam>, the **Bulk email threshold** section contains the bulk senders insight: information about the number of messages that were detected as bulk at all BCL levels by all anti-spam policies over the last 60 days.

- By default, the bulk senders insight shows the number of messages that were delivered and identified as bulk at the current BCL threshold of the anti-spam policy.

  :::image type="content" source="media/anti-spam-policy-bulk-senders-insight-bcl-default.png" alt-text="The bulk senders insight in the Bulk email threshold section of an anti-spam policy showing the messages identified as bulk at the current BCL level." lightbox="media/anti-spam-policy-bulk-senders-insight-bcl-default.png":::

- If you decrease the bulk email threshold value, the bulk senders insight changes to show how many fewer messages would be delivered and how many more messages would be identified as bulk. The insight also shows how many bulk message identifications are likely to be false positives (good email identified as bad).

  :::image type="content" source="media/anti-spam-policy-bulk-senders-insight-bcl-lower.png" alt-text="The bulk senders insight in the Bulk email threshold section of an anti-spam policy showing the messages identified as bulk after you decrease the current BCL level." lightbox="media/anti-spam-policy-bulk-senders-insight-bcl-lower.png":::

- If you increase the bulk email threshold value, the bulk senders insight changes to show how many more messages would be delivered and how many fewer messages would be identified as bulk. The insight also shows how many bulk message identifications are likely to be false negatives (bad email delivered).

  :::image type="content" source="media/anti-spam-policy-bulk-senders-insight-bcl-higher.png" alt-text="The bulk senders insight in the Bulk email threshold section of an anti-spam policy showing the messages identified as bulk after you increase the current BCL level." lightbox="media/anti-spam-policy-bulk-senders-insight-bcl-higher.png":::

Selecting **View bulk senders insight** takes you to the main **Bulk sender insights** page. For more information, see [Bulk senders insight in Exchange Online Protection](anti-spam-bulk-senders-insight.md).
