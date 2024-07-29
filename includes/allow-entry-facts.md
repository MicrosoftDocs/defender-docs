---
title: Allow entry facts
description: Customers learn they can sign-up for a free trial of Defender for Office 365.
ms.reviewer: 
ms.date: 07/18/2024
manager: deniseb
ms.author: chrisda
author: chrisda
ms.service: microsoft-365-security
ms.subservice: mdo
search.appverid: met150
---

> [!TIP]
> Allow entries from submissions are added during mail flow based on the filters that determined the message was malicious. For example, if the sender email address and a URL in the message are determined to be malicious, an allow entry is created for the sender (email address or domain) and the URL.
>
> During mail flow or time of click, if messages containing the entities in the allow entries pass other checks in the filtering stack, the messages are delivered (all filters associated with the allowed entities are skipped). For example, if a message passes [email authentication checks](../defender-office-365/email-authentication-about.md), URL filtering, and file filtering, a message from an allowed sender email address is delivered if it's also from an allowed sender.
>
> By default, allow entries for [domains and email addresses](../defender-office-365/submissions-admin.md#report-good-email-to-microsoft), [files](../defender-office-365/submissions-admin.md#report-good-email-attachments-to-microsoft), and [URLs](../defender-office-365/submissions-admin.md#report-good-urls-to-microsoft) are kept for 45 days after the filtering system determines that the entity is clean, and then the allow entry is removed. Or you can set allow entries to expire up to 30 days after you create them. Allow entries for [spoofed senders](../defender-office-365/tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-spoofed-senders) never expire.