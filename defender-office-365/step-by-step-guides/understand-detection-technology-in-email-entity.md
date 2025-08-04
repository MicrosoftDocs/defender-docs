---
title:       Understanding detection technology within the email entity page in Microsoft Defender for Office 365
description: Guide to understanding the detection technology shown on the Email entity page in Microsoft Defender for Office 365. What the detection technologies mean, how they're triggered, and how to resolve false positives (see the admin submission video).
author: chrisda
ms.author: chrisda
manager: deniseb
ms.service: microsoft-365-security
ms.topic: how-to
ms.date: 06/19/2025
audience: ITPro
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
---

# Understanding detection technology in the email entity page of Microsoft Defender for Office 365

If a threat is detected on the Microsoft Defender for Office 365 [*email entity page*](../mdo-email-entity-page.md), threat information displays on the left-hand flyout. This panel also shows you the **detection technology** that led to that verdict.

This article is all about helping you **understand the different detection technologies**, how they work, and how to avoid any false alarms. Stay tuned for the Admin Submissions video at the end.

## Detection technology details table

To resolve false positives like the ones listed in the following table, you should always start with an **admin submission**, which also prompts you to add an entry into the Tenant Allow/Block List. This entry adds a temporary override signal to the filters that determined the message was *malicious*, while filters are updated (if that's appropriate). See the following articles for more information on admin submissions and the Tenant Allow/Block List.

- [Submissions: Report good email to Microsoft](../submissions-admin.md)
- [Tenant Allow/Block List](../tenant-allow-block-list-about.md)

|The Detection technology|How it reaches a verdict|Notes|
|---|---|---|
|Advanced filter|Machine learning models to detect phishing and spam.||
|Antimalware protection|Detection from signature based anti-malware.||
|Bulk|Detection for advertising/marketing and similar message types with their relative bulk complaint levels (BCL).|[Step-by-Step guide on how to tune bulk thresholds](tune-bulk-mail-filtering-walkthrough.md)|
|Campaign|Messages identified and grouped as part of a malware or phishing campaign.|[Learn more about campaigns](track-and-respond-to-emerging-threats-with-campaigns.md)|
|Domain reputation|The message was sent from a domain that was identified as spam or phishing domain, based on internal or external signals.||
|File detonation|Safe Attachments detected a malicious attachment during detonation within a sandbox.||
|File detonation reputation|File attachments previously detected by Safe Attachments during detonation.||
|File reputation|The message contains a file that was previously identified as malicious by other sources.||
|Fingerprint matching|The message resembles a previously detected malicious or spam message.||
|General filter|Phishing or spam signals based on analyst heuristics.||
|Impersonation brand|Sender impersonation of well-known brands.||
|Impersonation domain|Impersonation of sender domains that you own or specified for protection in anti-phishing policies.|[Impersonation insight overview](../anti-phishing-mdo-impersonation-insight.md)|
|Impersonation user|Impersonation of protected senders that you specified in anti-phishing policies.|[Impersonation insight overview](../anti-phishing-mdo-impersonation-insight.md)|
|IP reputation|The message was sent from an IP that was identified as potentially malicious.||
|LLM content analysis|Analysis by Microsoft's purpose-built large language models to detect harmful email.||
|Mail bombing|A distributed denial of service (DDoS) attack that typically subscribes recipients to a large number of legitimate newsletters and services. The resulting volume of incoming email within minutes intends to overwhelm the recipient's mailbox and email security systems, and acts as a precursor to malware, ransomware, or data exfiltration.||
|Mailbox intelligence impersonation|Sender detected as impersonating an address in the user's personal sender map.|[Mailbox intelligence impersonation protection](../anti-phishing-policies-about.md)|
|Mixed analysis detection|Multiple filters contributed to the verdict for this message.||
|Spoof DMARC|The message failed DMARC authentication.|[Set up DMARC to validate the From address domain for cloud senders](../email-authentication-dmarc-configure.md)|
|Spoof external domain|Spoof intelligence detected email spoofing of a domain that is external to your organization.||
|Spoof intra-org|Spoof intelligence detected email spoofing of a user or domain that is internal to your organization.||
|URL detonation|Safe Links detected a malicious URL in the message during detonation within a sandbox.||
|URL detonation reputation|URLs previously detected by Safe Links during detonation.||
|URL malicious reputation|The message contains a URL that was previously identified as malicious or spam by other sources.||

## Watch a video on submitting messages to Microsoft to learn more

> [!VIDEO https://www.youtube.com/embed/ta5S09Yz6Ks]
