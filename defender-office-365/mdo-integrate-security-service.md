---
title: Integrate non-Microsoft security services with Microsoft 365
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: conceptual
ms.localizationpriority: medium
search.appverid: 
  - MET150
  - MOE150
ms.collection: 
  - tier1
ms.custom:
description: Learn about the considerations for integrating non-Microsoft security services with Exchange Online Protection and Microsoft Defender for Office 365.
ms.service: defender-office-365
ms.date: 11/06/2024
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Considerations for integrating non-Microsoft security services with Microsoft 365

While Microsoft provides a comprehensive platform for email security, we understand some customers adopt a [defense-in-depth strategy for email security](step-by-step-guides/defense-in-depth-guide.md) by adding a third-party (non-Microsoft) security service. There are two considerations for incorporating non-Microsoft security services with Microsoft 365:

- Whether the non-Microsoft service increases your organization's security posture, and the trade-offs for doing so. For example:
  - More cost.
  - More complexity.
  - The rate of false positives (good items marked as bad) increase as more products are added.
  - How the non-Microsoft security service integrates end-to-end. For example:
    - The non-Microsoft service should provide a user experience that doesn't require users to think about which quarantine to use.
    - The non-Microsoft service should integrate with existing Security Operations (SecOps) processes and tools. For example, security information and event management (SIEM), security orchestration, automation, and response (SOAR), etc.

  > [!NOTE]
  > Email security is an adversarial space. With the rise of commodity phishing and attack kits, attacks evolve and morph rapidly. That's why Microsoft Defender for Office 365 is part of Microsoft Defender XDR, our multi-layered, pre-breach and post-breach approach to enterprise cyber security.
  >
  > No matter how many layers of email protection exist, total protection never reaches 100 percent.

- How the non-Microsoft service scans and acts on email messages. Typically, non-Microsoft security services suggest the following three integration options, and not all of these options are equally supportable by Microsoft at this time.

## Integration via DNS mail routing (MX record points to the non-Microsoft-service)

This configuration is covered in detail in [Enhanced Filtering for Connectors in Exchange Online](/Exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors) and is fully supported by Microsoft. Email security vendors that support [Authenticated Received Chain (ARC)](email-authentication-arc-configure.md) work best, but there are limitations. For example, avoid using [Safe Links](safe-links-about.md) to check and wrap links with a non-Microsoft service that also rewrites links. Double link wrapping can prevent Safe Links from validating link status, detonating links for threats, and potentially triggering one-time use links. We recommend disabling the link wrapping feature in the non-Microsoft service.

## Integration via the Microsoft Graph API

Some non-Microsoft services authenticate and use the Microsoft Graph API to scan messages after they're delivered to user mailboxes. This configuration also allows the non-Microsoft service to remove messages that they believe to be malicious or unwanted. Typically, this configuration requires full access to mailboxes by the non-Microsoft service. Be sure to understand the security and support practices of the non-Microsoft service before granting this permission.

## Integration via in-and-out mail routing

This configuration allows the MX record to point to Microsoft 365. However, the non-Microsoft service operates *after* Microsoft 365 email protection and processing as shown in the following diagram:

:::image type="content" source="media/mdo-mail-flow-with-additional-security-service.png" alt-text=" diagram showing mail flow with a non-Microsoft security service being used after mail delivery to Microsoft 365." lightbox="media/mdo-mail-flow-with-additional-security-service.png":::

> [!TIP]
> [Enhanced Filtering for Connectors](/Exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors) doesn't work with this configuration. Enhanced Filtering for Connectors is designed for scenarios where the non-Microsoft service is **before** Microsoft 365 as previously explained in the [Integration via DNS mail routing](#integration-via-dns-mail-routing-mx-record-points-to-the-non-microsoft-service) section. The non-Microsoft service before Microsoft 365 allows the full email protection stack to operate, while intelligently preventing spoofing false positives related to the non-Microsoft service's sending infrastructure. You can't use Enhanced Filtering for Connectors to inherently trust all messages from Microsoft 365 IP addresses.

This configuration requires the message to leave the Microsoft 365 service boundary. When the message returns from the non-Microsoft service, it's treated as an entirely new message by Microsoft 365. This behavior results in the following problems and complexities:

- Messages are counted twice in most reporting tools, including Explorer (Threat Explorer), Advanced Hunting, and automated investigation and response (AIR). This behavior makes it difficult to properly correlate the message verdict and actions.

- Because messages coming back to Microsoft 365 are likely to fail email authentication checks, the messages might be identified as spoofing (false positives). Some non-Microsoft services recommend using mail flow rules (transport rules) or IP connection filtering to overcome this issue, but it can lead to false negatives being delivered.

- Perhaps most importantly, machine learning in Defender for Office 365 doesn't operate as effectively as it can. Machine learning algorithms rely on accurate data to make decisions on content. Inconsistent or altered data can negatively affect the learning process, which leads to a decrease in the overall effectiveness of Defender for Office 365. Examples include:
  - **Reputation**: Over time, the machine learning models discover the elements that are associated with good and bad content (IP addresses, sending domains, URLs, etc.). When messages return from the non-Microsoft service, the initial sending IP addresses aren't preserved, and can reduce the effectiveness of IP addresses in rendering a correct verdict. This behavior can also affect submissions, which are discussed in point 3 later.
  - **Message content modifications**: Many email security services add message headers, add disclaimers, modify message body content, and/or rewrite URLs in messages. While this behavior isn't usually an issue, delivered messages containing these modifications that are later determined to be malicious and removed via [zero-hour auto purge (ZAP)](zero-hour-auto-purge.md) can teach machine learning that these modifications indicate a bad message.

For these reasons, we strongly recommend avoiding this configuration, and working with the non-Microsoft service vendor to use the other integration options described in this article. However, if you must adopt this configuration, we strongly recommend the following settings and operations to maximize your protection posture:

1. Configure Defender for Office 365 policy actions to quarantine all negative verdicts. While this configuration can be less user friendly than using the Junk Email folder, the junk action happens only upon final delivery to the mailbox. An email that would have been delivered to the Junk Email folder is sent to the non-Microsoft service instead. If/when this message comes back to Microsoft, there's no guarantee that the original verdict (for example, spam) is preserved. This behavior leads to lower overall effectiveness.

   > [!TIP]
   > Mail flow rules (transport rules) that look at original verdicts aren't ideal, because they can introduce other issues and lead to effectiveness challenges.

2. Minimize false positives by overriding spoof for email arriving from the non-Microsoft service. For example, if the non-Microsoft service has an IP address of 172.17.17.35, create two [allowed spoofed sender entries in the Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-spoofed-senders): one External and one Internal as shown in the following screenshot:

   :::image type="content" source="media/mdo-allow-entries-additional-security-service.png" alt-text="A screenshot of the allowed spoofed sender entries in the Tenant Allow/Block List." lightbox="media/mdo-allow-entries-additional-security-service.png":::

   Be sure to remove these override entries if you ever leave the non-Microsoft protection service or change how it functions.

3. False negative (bad mail allowed) and false positive email submissions to Microsoft should come from the initial version of the message, not the one that returns from the non-Microsoft service. False positives attributed to the non-Microsoft service should be sent to the non-Microsoft service. This requirement can be complex to manage:
   - **Microsoft false negative (missed at initial reception)**: You need a copy of the message before to delivery to the mailbox. Submit the copy in quarantine from the non-Microsoft service, if it's available.
   - **Microsoft + non-Microsoft service false negative**: If both services miss it, we recommend reporting the original item to Microsoft and reporting the item in the recipient's mailbox to the non-Microsoft service. The item returned to Microsoft 365 from the non-Microsoft service includes details from the non-Microsoft service (for example, the non-Microsoft service's sending IP addresses, custom headers, etc.) which can lead to decreased machine learning effectiveness.
   - **Microsoft false positive**: If the message was initially caught by Microsoft before evaluation by the non-Microsoft service, submitting this copy from quarantine is effective.
   - **Non-Microsoft service false positive**: If the non-Microsoft service caught the message, you need to submit the message to them, because Microsoft can't correct the issue.

## Integrating non-Microsoft message reporting tools

Defender for Office 365 has [user reported settings](submissions-user-reported-messages-custom-mailbox.md) that work with the built-in **Report** button in [supported versions of Outlook](submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook), or the [Microsoft Report Message or Report Phishing add-ins](submissions-users-report-message-add-in-configure.md).

Knowing that non-Microsoft security services might include their own tools and processes for reporting false positives and false negatives (including user education/awareness efforts), Defender for Office 365 supports submissions from [third-party reporting tools](submissions-user-reported-messages-custom-mailbox.md#options-for-third-party-reporting-tools). This support helps streamline reporting [false positives and false negatives to Microsoft](submissions-admin.md), and empowers your SecOps team to take advantage of Microsoft Defender XDR [incident management](/defender-xdr/incidents-overview) and [automated investigations and response (AIR)](air-about.md).

For more information, see [Options for third-party reporting tools](submissions-user-reported-messages-custom-mailbox.md#options-for-third-party-reporting-tools).
