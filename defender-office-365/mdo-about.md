---
title: Why do I need Microsoft Defender for Office 365?
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: overview
ms.localizationpriority: high
search.appverid: 
  - MET150
  - MOE150
ms.assetid: e100fe7c-f2a1-4b7d-9e08-622330b83653
ms.collection: 
  - m365-security
  - tier1
  - highpri
  - essentials-overview
ms.custom:
  - seo-marvel-apr2020
  - intro-overview
  - curated-apr-2023
description: Is Microsoft Defender for Office 365 worth it? Let's find out.
ms.service: defender-office-365
adobe-target: true
ms.date: 07/09/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Microsoft Defender for Office 365 overview

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Although all organizations with cloud mailboxes include default email protections, Microsoft Defender for Office 365 is the primary email and collaboration security solution for Microsoft 365.

This article explains the _protection ladder_ for email and collaboration. The ladder starts with the default email protections for cloud mailboxes, and continues to Defender for Office 365 Plan 1 and Defender for Office 365 Plan 2.

[!INCLUDE [MDO Setup guide](../includes/mdo-setup-guide.md)]

This article is intended for Security Operations (SecOps) personnel, Microsoft 365 admins, or decisions makers who want to learn more about Defender for Office 365.

> [!TIP]
> If you're using **Outlook.com**, **Microsoft 365 Family**, or **Microsoft 365 Personal**, and need information about _Safelinks_ or _advanced attachment scanning_, see [Advanced Outlook.com security for Microsoft 365 subscribers](https://support.microsoft.com/office/882d2243-eab9-4545-a58a-b36fee4a46e2).
>
> If you're new to your Microsoft 365 subscription and would like to know your licenses before you begin, go the **Your products** page in the Microsoft 365 admin center at <https://admin.microsoft.com/Adminportal/Home#/subscriptions>.

The protection ladder in Defender for Office 365 contains the following elements:

1. **Default email protections for cloud mailboxes**: Included in all Microsoft 365 subscriptions with cloud mailboxes.
2. **Defender for Office 365 365 Plan 1**: Included in some Microsoft 365 subscriptions that cater to small to medium-sized businesses (for example, Microsoft 365 Business Premium).
3. **Defender for Office 365 365 Plan 2**: Included in some Microsoft 365 subscriptions that cater to enterprise organizations (for example, Microsoft 365 E5, Microsoft 365 A5, and Microsoft 365 GCC G5).

Defender for Office 365 is also available as an add-on subscription to many Microsoft 365 subscriptions with cloud mailboxes.

Defender for Office 365 Plan 1 contains a subset of the features that are available in Plan 2. Defender for Office 365 Plan 2 contains many features that aren't available in Plan 1.

> [!TIP]
> For information about subscriptions that contain Defender for Office 365, see the [Microsoft 365 business plan comparison](https://aka.ms/M365BusinessPlans) and the [Microsoft 365 Enterprise plan comparison](https://aka.ms/M365EnterprisePlans).
>
> Use the following exhaustive reference to determine if Defender for Office 365 Plan 1 or Plan 2 licenses are included in a Microsoft 365 subscription: [Product names and service plan identifiers for licensing](/entra/identity/users/licensing-service-plan-reference).
>
> Use the following interactive guide to see how Defender for Office 365 is able to protect your organization: [Safeguard your organization with Microsoft Defender for Office 365](https://aka.ms/MSDO-IG).
>
> Use [this page](https://www.microsoft.com/security/business/siem-and-xdr/microsoft-defender-office-365#pmg-allup-content) to compare plans and purchase Defender for Office 365.

The following descriptions summarize the protection ladder in Defender for Office 365:

- **Default email protections for cloud mailboxes** prevent broad, volume-based, known email attacks.
- **Defender for Office 365 Plan 1** protects email and collaboration features from zero-day malware, phishing, and business email compromise (BEC).
- **Defender for Office 365 Plan 2** adds phishing simulations, post-breach investigation, hunting, and response, and automation.

However, you can also think about the _architecture_ of protection in Defender for Office 365 as _cumulative layers of security_, where each layer has a different _security emphasis_. This architecture is shown in the following diagram:

:::image type="content" source="media/eop-mdop1-mdop2-comparison.png" alt-text="Diagram about protections in Defender for Office 365 and their relationships to one another with service emphasis, including a note for email authentication." lightbox="media/eop-mdop1-mdop2-comparison.png":::

All levels of the protection ladder are capable of protecting, detecting, investigating, and responding to threats. But as you move up the protection ladder, the _available features_ and _automation_ increase.

Whether you're using the onmicrosoft.com domain only or custom domains for email in Microsoft 365, it's important to configure email authentication for your used and unused domains. SPF, DKIM, and DMARC records in DNS allow Microsoft 365 to more accurately protect against spoofing attacks. For more information, see [Email authentication](email-authentication-about.md).

## The Defender for Office 365 security ladder

It can be difficult to identity the advantages of Defender for Office 365. The following subsections describe the capabilities of each product using the following security emphases:

- Preventing and detecting threats.
- Investigating threats.
- Responding to threats.

### Default email protection capabilities

The default email protection capabilities included in all organizations with cloud mailboxes are summarized in the following table:

|Prevent/Detect|Investigate|Respond|
|---|---|---|
|<ul><li>[Anti-malware protection](anti-malware-protection-about.md)<sup>\*</sup></li><li>[Anti-spam protection](anti-spam-protection-about.md)<sup>\*</sup>, including [bulk email protection](anti-spam-spam-vs-bulk-about.md)</li><li>[Anti-phishing (spoofing) protection](anti-phishing-protection-spoofing-about.md)<sup>\*</sup>, including the [Spoof intelligence insight](anti-spoofing-spoof-intelligence.md)</li><li>[Outbound spam protection](outbound-spam-protection-about.md)</li><li>[Connection filtering](connection-filter-policies-configure.md)</li><li>[Quarantine](quarantine-about.md) and [quarantine policies](quarantine-policies.md)</li><li>False positives and false negative reporting by [admin submissions to Microsoft](submissions-admin.md) and [user reported messages](submissions-user-reported-messages-custom-mailbox.md)</li><li>[Allow and block entries in the Tenant Allow/Block List](tenant-allow-block-list-about.md) for: <ul><li>Domains and email addresses</li><li>Spoof</li><li>URLs</li><li>Files</li></ul></li></ul>|<ul><li>[Audit log search](audit-log-search-defender-portal.md)</li><li>[Message Trace](message-trace-defender-portal.md)</li><li>[Email security reports](reports-email-security.md)</li></ul>|<ul><li>[Zero-hour auto purge (ZAP) for email](zero-hour-auto-purge.md#zero-hour-auto-purge-zap-for-email-messages)</li><li>Refine and test entries in the [Tenant Allow/Block List](tenant-allow-block-list-about.md)</li></ul>|

<sup>\*</sup> The associated features are available in default threat policies, custom threat policies, and [the Standard and Strict preset security policies](preset-security-policies.md). For help with deciding which method to use, see [Determine your threat policy strategy](mdo-deployment-guide.md#determine-your-protection-policy-strategy).

For more information, see [Default email protections for cloud mailboxes](eop-about.md).

### Defender for Office 365 Plan 1 capabilities

Defender for Office 365 Plan 1 adds more _prevention_ and _detection_ capabilities.

The extra features you get in **Defender for Office 365 Plan 1** on top of the default email protections for cloud mailboxes are described in the following table:

|Prevent/Detect|Investigate|Respond|
|---|---|---|
|<ul><li>The following [additional features in anti-phishing policies](anti-phishing-protection-about.md#additional-anti-phishing-protection-in-microsoft-defender-for-office-365), including the [impersonation insight](anti-phishing-mdo-impersonation-insight.md): <ul><li>User and domain impersonation protection</li><li>Mailbox intelligence impersonation protection (contact graph)</li><li>[Phishing email thresholds](anti-phishing-policies-about.md#phishing-email-thresholds-in-anti-phishing-policies-in-microsoft-defender-for-office-365)</li></ul></li><li>[Safe Attachments in email](safe-attachments-about.md)</li><li>[Safe Attachments for files in SharePoint, OneDrive, and Microsoft Teams](safe-attachments-for-spo-odfb-teams-about.md)</li><li>[Safe Links in email, Office clients, and Teams](safe-links-about.md)</li><li>Email & collaboration alerts at <https://security.microsoft.com/viewalertsv2><li>SIEM integration API for **alerts**</li></ul>|<ul><li>[Real-time detections](threat-explorer-real-time-detections-about.md)<sup>\*</sup></li><li>[User tags, including Priority account](user-tags-about.md)</li><li>[The Email entity page](mdo-email-entity-page.md)</li><li>SIEM integration API for **detections**</li><li>[URL trace](/defender-endpoint/investigate-domain)</li><li>[Defender for Office 365 reports](reports-defender-for-office-365.md)</li></ul>|<ul><li>Same</li></ul>|

<sup>\*</sup> The presence of **Email & collaboration** \> **Real-time detections** in the Microsoft Defender portal is a quick way to differentiate between Defender for Office 365 Plan 1 and Plan 2.

:::image type="content" source="media/te-rtd-select-real-time-detections.png" alt-text="Screenshot of the Real-time detections selection in the Email & collaboration section in the Microsoft Defender portal." lightbox="media/te-rtd-select-real-time-detections.png":::

### Defender for Office 365 Plan 2 capabilities

Defender for Office 365 Plan 2 expands on the _investigation_ and _response_ capabilities of Plan 1 with the addition of _automation_.

The extra features that you get in **Defender for Office 365 Plan 2** on top of Defender for Office 365 Plan 1 are described in the following table:

|Prevent/Detect|Investigate|Respond|
|---|---|---|
|<ul><li>[Attack simulation training](attack-simulation-training-get-started.md)</li><li>[Priority account protection](priority-accounts-turn-on-priority-account-protection.md)</li></ul>|<ul><li>[Threat Explorer (Explorer)](threat-explorer-real-time-detections-about.md) instead of Real-time detections.<sup>\*</sup></li><li>[Threat Trackers](threat-trackers.md)</li><li>[Campaigns](campaigns.md)</li></ul>|<ul><li>[Automated Investigation and Response (AIR)](air-about.md): <ul><li>AIR from Threat Explorer</li><li>AIR for compromised users</li></ul></li><li>SIEM Integration API for **Automated Investigations**</li></ul>|

<sup>\*</sup> The presence of **Email & collaboration** \> **Explorer** in the Microsoft Defender portal is a quick way to differentiate between Defender for Office 365 Plan 2 and Plan 1.

:::image type="content" source="media/te-rtd-select-threat-explorer.png" alt-text="Screenshot of the Explorer selection in the Email & collaboration section in the Microsoft Defender portal." lightbox="media/te-rtd-select-threat-explorer.png":::

## Defender for Office 365 Plan 1 vs. Plan 2 cheat sheet

This quick-reference section summarizes the different capabilities between Defender for Office 365 Plan 1 and Plan 2 that aren't included in the default email protections for cloud mailboxes.

|Defender for Office 365 Plan 1|Defender for Office 365 Plan 2|
|---|---|
|Prevent and detect capabilities: <ul><li>[Anti-phishing policies with impersonation protection and phishing email thresholds](anti-phishing-policies-about.md#exclusive-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365)</li><li>[Safe Attachments](safe-attachments-about.md), including [Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](safe-attachments-for-spo-odfb-teams-about.md)</li><li>[Safe Links](safe-links-about.md)</li><li>[Priority account protection](priority-accounts-turn-on-priority-account-protection.md)</li></ul> <br/> Investigate and respond capabilities: <ul><li>[Real-time detections](threat-explorer-real-time-detections-about.md)</li><li>[User tags, including Priority account](user-tags-about.md)</li><li>[The Email entity page](mdo-email-entity-page.md)</li></ul>|Everything in Defender for Office 365 Plan 1 <br/><br/> --- plus --- <br/><br/> Prevent and detect capabilities: <ul><li>[Attack simulation training](attack-simulation-training-simulations.md)</li></ul> <br/> Investigate and respond capabilities: <ul><li>[Threat Explorer (Explorer)](threat-explorer-real-time-detections-about.md)</li><li>[Threat Trackers](threat-trackers.md)</li><li>[AIR](air-about.md)</li><li>[Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](/defender-xdr/advanced-hunting-overview)</li><li>[Investigate incidents in Microsoft Defender XDR](/defender-xdr/investigate-incidents)</li><li>[Investigate alerts in Microsoft Defender XDR](/defender-xdr/investigate-alerts)</li></ul>|

- For more information, see [Feature availability across Defender for Office 365 plans](/office365/servicedescriptions/office-365-advanced-threat-protection-service-description#feature-availability).
- [Safe Documents](safe-documents-in-e5-plus-security-about.md) is available to users with the Microsoft 365 A5 or Microsoft 365 E5 Security licenses (not included in Defender for Office 365 plans).
- If your current subscription doesn't include Defender for Office 365 Plan 2, you can [try Defender for Office 365](try-microsoft-defender-for-office-365.md) free for 90 days. Or, [contact sales to start a trial](https://info.microsoft.com/ww-landing-M365SMB-web-contact.html).
- Defender for Office 365 Plan 2 organizations have access to **Microsoft Defender Extended detection and response (XDR) integration** to efficiently detect, review, and respond to incidents and alerts.

## Where to go next

[Get started with Microsoft Defender for Office 365](mdo-deployment-guide.md)

[Microsoft Defender for Office 365 Security Operations Guide](mdo-sec-ops-guide.md)

[Migrate from a non-Microsoft protection service or device to Microsoft Defender for Office 365](migrate-to-defender-for-office-365.md)

[What's new in Microsoft Defender for Office 365](defender-for-office-365-whats-new.md)

The [Microsoft 365 Roadmap](https://www.microsoft.com/microsoft-365/roadmap?filters=Microsoft%20Defender%20for%20Office%20365) describes new features that are being added to Defender for Office 365.
