---
title: Step-by-step threat protection stack in Microsoft Defender for Office 365
author: chrisda
ms.author: chrisda
ms.date: 07/07/2025
ms.reviewer: gigarrub
ms.topic: conceptual
ms.localizationpriority: medium
description: Learn how incoming messages pass through the four-phase threat filtering stack in Microsoft Defender for Office 365, from edge protection to post-delivery protection.
ms.service: defender-office-365
ms.collection:
- m365-security
- tier2
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Step-by-step threat protection in Microsoft Defender for Office 365

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

This article describes the protection stack (also known as the _filtering stack_) in Microsoft Defender for Office 365. The stack has four phases. Typically, incoming mail passes through all four phases before delivery, but the actual path depends on your organization's Defender for Office 365 configuration.

> [!TIP]
> Stay tuned to the end of this article for a unified graphic of all four phases of Defender for Office 365 protection.

## Phase 1: Edge Protection

Unfortunately, Edge blocks are now relatively simple for attackers to overcome. Although less traffic is blocked here than in years past, Edge protection remains an important part of the stack.

Edge blocks are designed to be automatic. For false positives (good mail marked as bad), senders are notified with information to address their issues. Connectors from trusted partners with limited reputation can ensure deliverability, or temporary overrides can be put in place when onboarding new endpoints.

:::image type="content" source="media/mdo-filtering-stack/mdo-filter-stack-phase1.PNG" alt-text="The Phase-1 filtering in Defender for Office 365" lightbox="media/mdo-filtering-stack/mdo-filter-stack-phase1.PNG":::

1. **Network throttling** protects Microsoft 365 infrastructure and customers from denial-of-service (DoS) attacks by limiting the number of messages that a specific set of infrastructure can submit.

2. **IP reputation and throttling** blocks messages from known-bad connecting IP addresses. If a specific IP sends many messages in a short period of time, the IP is throttled.

3. **Domain reputation** blocks messages from known-bad domains.

4. **Directory-based edge filtering** blocks attempts to harvest an organization's directory information through SMTP.

5. **Backscatter detection** prevents an organization from being attacked through invalid non-delivery reports (NDRs).

6. **Enhanced Filtering for Connectors** (also known as _skip listing_) preserves authentication information when mail passes through a service or device before delivery to Microsoft 365. This capability improves filtering stack accuracy, including heuristic clustering, anti-spoofing, and anti-phishing machine learning models, even in complex or hybrid routing scenarios.

## Phase 2: Sender Intelligence

Features in sender intelligence are critical for catching spam, bulk, impersonation, and unauthorized spoof messages, and also factor into phishing detection. Most of these features are individually configurable.

:::image type="content" source="media/mdo-filtering-stack/mdo-filter-stack-phase2.PNG" alt-text="Phase 2 of filtering in Defender for Office 365 is Sender intelligence" lightbox="media/mdo-filtering-stack/mdo-filter-stack-phase2.PNG":::

1. **Account compromise detection** raises alerts when an account has anomalous behavior consistent with compromise. In some cases, the user account is blocked from sending email until the issue is resolved by the organization's security operations team.

2. **Email authentication** involves both customer-configured methods and methods set up in the cloud to ensure that senders are authorized, authentic mailers. These methods resist spoofing.
    - **SPF** can reject mail based on DNS TXT records that list IP addresses and servers allowed to send mail on behalf of the organization.
    - **DKIM** provides an encrypted signature that authenticates the sender.
    - **DMARC** lets admins mark SPF and DKIM as required for their domain and enforces alignment between the results of these two technologies.
    - **ARC** builds on DMARC to work with forwarding in mailing lists while recording an authentication chain.

3. **Spoof intelligence** filters senders who are allowed to "spoof" (send mail on behalf of another account or forward for a mailing list) from malicious senders who imitate organizational or known external domains. It separates legitimate "on behalf of" mail from senders who spoof to deliver spam and phishing messages.

    **Intra-org spoof intelligence** detects and blocks spoof attempts from domains within the organization.

4. **Cross-domain spoof intelligence** detects and blocks spoof attempts from domains outside of the organization.

5. **Bulk filtering** lets admins configure a bulk complaint level (BCL) threshold that indicates whether the message was sent from a bulk sender. Admins can use the BCL threshold in anti-spam policies to decide what level of bulk mail to treat as spam.

6. **Mailbox intelligence** learns from standard user email behaviors. It uses a user's communication graph to detect when a sender only appears to be someone the user usually communicates with, but is actually malicious. This method detects impersonation.

7. **Mailbox intelligence impersonation** enables or disables enhanced impersonation results based on each user's individual sender map. When enabled, this feature helps identify impersonation.

8. **User impersonation** allows an admin to create a list of high-value targets that are likely to be impersonated. If a message arrives where the sender only appears to have the same name and address as the protected high-value account, the message is marked or tagged (for example, *trαcye@contoso.com* for *tracye@contoso.com*).

9. **Domain impersonation** detects domains that are similar to the recipient's domain and that attempt to look like an internal domain. For example, this impersonation *tracye@liwαre.com* for *tracye@litware.com*.

## Phase 3: Content Filtering

In this phase, the filtering stack handles the specific contents of the message, including its hyperlinks and attachments.

:::image type="content" source="media/mdo-filtering-stack/mdo-filter-stack-phase3.PNG" alt-text="The Phase-3 filtering in MDO is Content Filtering" lightbox="media/mdo-filtering-stack/mdo-filter-stack-phase3.PNG":::

1. **Transport rules** (also known as mail flow rules) allow an admin to take a wide range of actions when an equally wide range of conditions are met for a message. All messages that flow through your organization are evaluated against the enabled mail flow rules.

2. **Microsoft Defender Antivirus** is used to detect all known malware in attachments.

3. The anti-virus engine uses true type matching to detect the file type, regardless of the filename extension (for example, `exe` files renamed to `txt` are detected as `exe` files). This capability allows **type blocking** (also known as the common attachment filter) to correctly block file types specified by admins. For the list of supported file types, see [True type matching in the common attachments filter](anti-malware-protection-about.md#true-type-matching-in-the-common-attachments-filter).

4. When Microsoft Defender for Office 365 detects a malicious attachment, the file's hash and a hash of its active content are identified. **Attachment reputation blocking** blocks that file in Microsoft 365 and on endpoints through Microsoft Defender Antivirus cloud calls.

5. **Heuristic clustering** can determine that a file is suspicious based on delivery heuristics. When a suspicious attachment is found, the entire campaign pauses, and the file is sandboxed. If the file is found to be malicious, the entire campaign is blocked.

6. **Machine learning models** act on the header, body content, and URLs of a message to detect phishing attempts.

7. Microsoft uses a determination of reputation from URL sandboxing and URL reputation from non-Microsoft feeds in **URL reputation blocking**, to block any message with a known malicious URL.

8. **Content heuristics** can detect suspicious messages based on structure and word frequency within the body of the message, using machine learning models.

9. **Safe Attachments** sandboxes attachments for Defender for Office 365 customers, using dynamic analysis to detect never-before-seen threats.

10. **Linked content detonation** treats every URL linking to a file in an email as an attachment, asynchronously sandboxing the file at the time of delivery.

11. **URL Detonation** happens when upstream anti-phishing technology finds a message or URL to be suspicious. URL detonation sandboxes the URLs in the message at the time of delivery.

## Phase 4: Post-Delivery Protection

The last stage takes place after mail or file delivery, acting on mail in various mailboxes and on files and links that appear in clients like Microsoft Teams.

:::image type="content" source="media/mdo-filtering-stack/mdo-filter-stack-phase4.PNG" alt-text="The Phase-4 filtering in Defender for Office 365 is Post-delivery protection" lightbox="media/mdo-filtering-stack/mdo-filter-stack-phase4.PNG":::

1. **Safe Links** is Defender for Office 365's time-of-click protection. URLs in messages are checked against the latest reputation when a user clicks on them before the user is redirected to the target site. The URL is asynchronously sandboxed to update its reputation.

2. **Zero-hour auto purge (ZAP) for phishing** retroactively detects and neutralizes malicious phishing messages that have already been delivered to Exchange Online mailboxes.

3. **ZAP for malware** retroactively detects and neutralizes malicious malware messages that have already been delivered to Exchange Online mailboxes.

4. **ZAP for spam** retroactively detects and neutralizes spam messages that have already been delivered to Exchange Online mailboxes.

5. **Campaign Views** let admins see the big picture of an attack faster and more completely than any team could without automation. Microsoft uses the vast amounts of anti-phishing, anti-spam, and anti-malware data in the service to identify campaigns, and then allows admins to investigate them from start to end, including targets, impacts, and flows. This information is also available in a downloadable campaign write-up.

6. **The built-in Report button** in [supported versions of Outlook](submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook) enables people to easily report false positives (good email mistakenly marked as bad) or false negatives (bad email marked as good) to Microsoft for further analysis.

7. **Safe Links for Office clients** offers the same Safe Links time-of-click protection, natively, inside supported Office apps like Word, PowerPoint, and Excel.

8. **Protection for OneDrive, SharePoint, and Teams** offers the same Safe Attachments protection against malicious files, natively, in OneDrive, SharePoint, and Microsoft Teams.

9. When a URL that points to a file is selected post delivery, **linked content detonation** displays a warning page until the sandboxing of the file is complete, and the URL is found to be safe.

## The filtering stack diagram

The final diagram (as with all parts of the diagram) _is subject to change as the product grows and develops_. Bookmark this page and use the **feedback** option at the bottom of the page if you need to ask about updates. The following diagram shows the stack with all phases in order:

:::image type="content" source="media/mdo-filtering-stack/mdo-filter-stack-phase5.PNG" alt-text="All the phases of filtering in Defender for Office 365 in order, from 1 to 4" lightbox="media/mdo-filtering-stack/mdo-filter-stack-phase5.PNG":::

*Special thanks from MSFTTracyP and the docs writing team to Giulian Garruba for this content*.
