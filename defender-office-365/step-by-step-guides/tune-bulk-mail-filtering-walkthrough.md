---
title: Assess and Tune your Filtering for Bulk Mail in Defender for Office 365
description: Tune bulk filtering settings within Exchange Online and Microsoft Defender for Office 365
ms.service: defender-office-365
author: MSFTBen
ms.author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 06/12/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Tune Bulk mail (grey mail) filtering in Defender for Office 365

This guide describes how to tune your bulk email filtering settings in Exchange Online or Microsoft Defender for Office 365. This process includes configuring the delivery location of detected bulk mail and, if necessary, optional transport rules you can use to achieve a more aggressive filtering stance should this suit your organization's needs.

## Prerequisites

Before you begin, make sure you have the following prerequisites:

- Exchange Online as a minimum. (Microsoft Defender for Office 365 offers extra functionality)
- Sufficient permissions. (Security Administrator)
- Basic understanding of checking message headers (for more information, see [View internet message headers in Outlook](https://support.microsoft.com/office/view-internet-message-headers-in-outlook-cd039382-dc6e-4264-ac74-c048563d212c))
- 30 minutes to complete the following steps

## Understanding the bulk (BCL) value

The Bulk Complaint Level (BCL) indicates how likely a message is to be bulk mail. Bulk mail is typically advertising emails or marketing messages. These emails can be more challenging to filter as some customers want these emails. Other customers consider these emails spam and don't want to receive them. We add a "BCL" value stamp on emails based on the number of complaints we get about that sender and allow you to select the threshold to accept so you can tune the number of bulk messages you receive.

## Check the BCL value of an email and the threshold in your policies

Use the following steps to find a message's BCL value and compare it with your current policy threshold:

1. Take the headers of a message you're concerned with and search for the **"X-Microsoft-Antispam:"** header, which contains a **BCL value**. Make a note of this number.
1. Repeat the header review for additional messages until you have an average BCL value. We'll use this value as the threshold. Any mail with a **BCL** value **above** this number will be impacted by the changes we make.
1. **Login** to the Microsoft Security portal at <https://security.microsoft.com>.
1. On the **left nav**, under **Email & collaboration**, select **Policies & rules**.
1. Select **Threat policies** and then **Anti-Spam**.
1. When the page loads, the next action you'll take depends on the type of policy you're using:
   - You can't edit the Standard and Strict preset security policies. The BCL threshold is 6 in standard, 5 in strict.
   - The default anti-spam policy and custom anti-spam policies use the BCL threshold 7 by default, but you can change it.
1. **Edit** (or create a custom anti-spam policy) to set the BCL threshold that meets your needs. For example, if most of the messages you collected (which were all unwanted) have a BCL value of 4 or higher, setting the BCL value to 4 in the policy would filter out these messages for your end users.
1. Within that policy, under the **"Edit actions"** section, select the **"bulk message action"** and select what to do when the threshold is exceeded. For example, you could select Quarantine if you would like to keep all bulk out of the mailbox or use the Junk email folder for a less aggressive stance.
1. If you receive complaints from users about too many bulk emails being blocked, you can adjust this threshold, or alternatively, submit the message to us, which will also add the sender to the Tenant Allow/Block List.

> [!TIP]
> For more details on allowing senders using the Tenant Allow/Block List, see [How to handle legitimate emails getting blocked from delivery using Microsoft Defender for Office 365](how-to-handle-false-positives-in-microsoft-defender-for-office-365.md).

## More aggressive strategies for managing bulk senders

In some cases, the sender of bulk mail doesn't generate enough complaints for its messages to be assigned a BCL value high enough to be caught by your tuned threshold value. If the sender's messages don't receive a high enough BCL value to be caught by your threshold, you can use transport rules to take a more aggressive approach; however, use caution, as false positives (unwanted blocking) will occur. Tune the rules with exceptions and management to stay relevant for your organization's mail patterns.

> [!TIP]
> To better protect certain groups of users, such as your c-suite and priority accounts, you can create a specialized policy specifically scoped to them and set a higher BCL threshold, alongside a separate transport rule (if applicable). These groups of users might be more vulnerable to unsolicited emails due to their email addresses being readily accessible in the public domain.

For detailed instructions on creating transport rules for bulk email, see [Use mail flow rules to filter bulk email in Exchange Online | Microsoft Learn](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-filter-bulk-mail).

<a name="for-customers-with-microsoft-defender-for-office-365"></a>
## Bulk mail filtering options in Microsoft Defender for Office 365

If you have Microsoft Defender for Office 365, you can use the following additional methods to inspect bulk mail values:

- Customers with Microsoft Defender for Office 365 Plan 1 or higher can use the [email entity page](https://techcommunity.microsoft.com/blog/microsoftdefenderforoffice365blog/introducing-the-email-entity-page-in-microsoft-defender-for-office-365/2275420) to discover the BCL value of messages instead of interrogating headers.

- Customers with Microsoft Defender for Office 365 Plan 2 can interrogate bulk values at scale using [advanced hunting queries to tune bulk email](../anti-spam-spam-vs-bulk-about.md#how-to-tune-bulk-email).

For step-by-step guidance on tuning bulk email at scale, see [How to tune bulk email](../anti-spam-spam-vs-bulk-about.md#how-to-tune-bulk-email).

<a name="more-information"></a>
## Related content

For more background on bulk email filtering concepts and best practices, see the following resources:

- [Microsoft Defender for Office 365 Blog - Email Protection Basics in Microsoft 365: Bulk Email](https://techcommunity.microsoft.com/blog/microsoftdefenderforoffice365blog/email-protection-basics-in-microsoft-365-bulk-email/3445337)
- [What's the difference between junk email and bulk email?](../anti-spam-spam-vs-bulk-about.md)
