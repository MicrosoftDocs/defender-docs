---
title: Default email protections for cloud mailboxes
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
ms.date: 07/21/2025
audience: ITPro
ms.topic: overview
ms.collection: 
  - m365-security
  - tier2
ms.localizationpriority: medium
ms.assetid: 1270a65f-ddc3-4430-b500-4d3a481efb1e
ms.custom: 
  - seo-marvel-apr2020
description: Learn how the default email protections for cloud mailboxes can help protect your on-premises email organization in standalone and hybrid environments.
ms.service: defender-office-365
search.appverid: met150
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Default email protections for cloud mailboxes

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

The default email protections in Microsoft 365 protect your organization from spam, malware, phishing and other email threats. These protections are included in all organizations with cloud mailboxes.

These protections are on by default via the default threat policies for:

- [Anti-malware protection](anti-malware-protection-about.md)
- [Anti-spam protection](anti-spam-protection-about.md)
- [Anti-phishing (spoofing) protection](anti-phishing-protection-about.md#anti-phishing-protection-for-all-cloud-mailboxes)

The default threat policies for these features apply to all recipients. You can't turn them off, but you can override them by turning on and configuring [preset security policies](preset-security-policies.md) or creating custom threat policies.

You can customize the security settings in the default threat policies, create custom threat policies, or better yet, turn on and add all recipients to the Standard and/or Strict preset security policies. For complete information, see [Configure threat policies](mdo-deployment-guide.md#step-2-configure-threat-policies).

The rest of this article explains how the default email protections for cloud mailboxes work and the features they contain.

> [!TIP]
> The default email protections for cloud mailboxes are also available as a separate subscription to protect on-premises email environments (not just Microsoft Exchange). For more information, see [Exchange Online Protection for on-premises organizations](/exchange/standalone-eop/standalone-eop).

## How the default email protections for cloud mailboxes work

The following diagram shows how the default email protections for cloud mailboxes work.

:::image type="content" source="media/tp_emailprocessingineopt3.png" alt-text="A diagram of email from the internet or Customer feedback entering Microsoft 365 and passing through the default email protections for cloud mailboxes." lightbox="media/tp_emailprocessingineopt3.png":::

1. Incoming messages in Microsoft 365 initially pass through connection filtering, which checks the sender's reputation. Most spam is rejected at this point. For more information, see [Configure connection filtering](connection-filter-policies-configure.md).

2. If malware is found in the message or a message attachment, the message is delivered to quarantine. By default, only admins can view and interact with malware quarantined messages. But, admins can create and use [quarantine policies](quarantine-policies.md#anatomy-of-a-quarantine-policy) to specify what users are allowed to do to quarantined messages. To learn more about malware protection, see [Anti-malware protection](anti-malware-protection-about.md).

3. Policy filtering evaluates the message against any [Exchange mail flow rules (also known as transport rules)](/exchange/security-and-compliance/mail-flow-rules/mail-flow-rules) configured to act on messages. For example, a rule can notify a manager about messages from a specific sender.

   In on-premises organizations with Exchange Enterprise CAL with Services licenses, [data loss prevention (DLP)](/exchange/security-and-compliance/data-loss-prevention/data-loss-prevention) checks also happen at this point.

4. The message passes through content filtering, which includes anti-spam and anti-phishing filtering:
   - Anti-spam policies identify messages as bulk, spam, high confidence spam, phishing, or high confidence phishing.

     High confidence phishing messages are always delivered to quarantine. By default, only admins can view and interact with high confidence phishing messages.

   - Anti-phishing policies identify messages as spoofing.

   You can configure the action to take on the message based on the filtering verdict (for example, quarantine or move to the Junk Email folder), and what users can do to the quarantined messages using [quarantine policies](quarantine-policies.md#anatomy-of-a-quarantine-policy). For more information, see [Configure anti-spam policies](anti-spam-policies-configure.md) and [Configure anti-phishing policies for all cloud mailboxes](anti-phishing-policies-eop-configure.md).

A message that successfully passes all of these protection layers is delivered to the recipients.

For more information, see [Order and precedence of email protection](how-policies-and-protections-are-combined.md).

### Microsoft 365 datacenters

Microsoft 365 runs on a worldwide network of datacenters that are designed to provide the best availability. For example, if a datacenter becomes unavailable, email messages are automatically routed to another datacenter without any interruption in service. Servers in each datacenter accept messages on your behalf, providing a layer of separation between the servers that host your organization and the internet. Through this highly available network, Microsoft can ensure that email reaches your organization in a timely manner.

Microsoft load balances between datacenters _withing the same region only_. If you're provisioned in one region, all of your messages are processed using the mail routing for that region.

### Microsoft 365 communications

The following communication channels are available for issues and new features in Microsoft 365:

- When a Service Level Event affects you, a communication alert (typically accompanied by a bell icon) will appear in the Microsoft 365 admin center at <https://admin.microsoft.com>. We recommend that you read and act on any items as appropriate.
- The Microsoft 365 Message center at <https://admin.microsoft.com/Adminportal/Home?#/MessageCenter> also contains information about new and updated features. For more information, see [Track new and changed features in the Microsoft 365 Message center](/microsoft-365/admin/manage/message-center).
- The [Microsoft 365 roadmap](https://www.microsoft.com/microsoft-365/roadmap?filters=&searchterms=exchange%2Conline%2Cprotection) is a good resource for finding out information about upcoming new features.
- We also post blog articles about new features to the [Microsoft 365 Blogs](https://www.microsoft.com/microsoft-365/blog/) website.

### Features in the default email protections for cloud mailboxes

This section provides a high-level overview of the main features that are available in the default email protections for cloud mailboxes.

For information about requirements, important limits, and feature availability across all subscription plans, see the [Exchange Online Protection service description](/office365/servicedescriptions/exchange-online-protection-service-description/exchange-online-protection-service-description).

> [!TIP]
>
> - Microsoft 365 uses several URL blocklists that help detect known malicious links within messages.
> - Microsoft 365 uses a vast list of domains that are known to send spam.
> - Microsoft 365 inspects the active payload in the message body and all message attachments for malware.

|Feature|Comments|
|---|---|
|**Protection**||
|Preset security policies|[Preset security policies](preset-security-policies.md) <br/><br/> [Configuration analyzer](configuration-analyzer-for-security-policies.md)|
|Anti-malware|[Anti-malware protection](anti-malware-protection-about.md) <br/><br/> [Frequently asked questions: Anti-malware protection](anti-malware-protection-faq.yml) <br/><br/> [Configure anti-malware policies](anti-malware-policies-configure.md)|
|Inbound anti-spam|[Anti-spam protection](anti-spam-protection-about.md) <br/><br/> [Frequently asked questions: Anti-spam protection](anti-spam-protection-faq.yml) <br/><br/> [Configure anti-spam policies](anti-spam-policies-configure.md)|
|Outbound anti-spam|[Outbound spam protection](outbound-spam-protection-about.md) <br/><br/> [Configure outbound spam filtering](outbound-spam-policies-configure.md) <br/><br/> [Control automatic external email forwarding](outbound-spam-policies-external-email-forwarding.md)|
|Connection filtering|[Configure connection filtering](connection-filter-policies-configure.md)|
|Anti-phishing|[Anti-phishing policies](anti-phishing-policies-about.md) <br/><br/> [Configure anti-phishing policies for all cloud mailboxes](anti-phishing-policies-eop-configure.md)|
|Anti-spoofing protection|[Spoof intelligence insight](anti-spoofing-spoof-intelligence.md) <br/><br/> [Manage the Tenant Allow/Block List](tenant-allow-block-list-about.md)|
|Zero-hour auto purge (ZAP) for delivered malware, spam, and phishing messages|[ZAP in Exchange Online](zero-hour-auto-purge.md)|
|Tenant Allow/Block List|[Manage the Tenant Allow/Block List](tenant-allow-block-list-about.md)|
|Blocklists for message senders|[Create sender blocklists](create-block-sender-lists-in-office-365.md)|
|Allowlists for message senders|[Create sender allowlists](create-safe-sender-lists-in-office-365.md)|
|Directory Based Edge Blocking (DBEB)|[Use Directory Based Edge Blocking to reject messages sent to invalid recipients](/exchange/mail-flow-best-practices/use-directory-based-edge-blocking)|
|**Quarantine and submissions**||
|Admin submission|[Use Admin submission to submit suspected spam, phish, URLs, and files to Microsoft](submissions-admin.md)|
|User reported message settings|[User reported settings](submissions-user-reported-messages-custom-mailbox.md)|
|Quarantine - admins|[Manage quarantined messages and files as an admin](quarantine-admin-manage-messages-files.md) <br/><br/> [Frequently asked questions: Quarantined messages](quarantine-faq.yml) <br/><br/> [Report messages and files to Microsoft](submissions-report-messages-files-to-microsoft.md) <br/><br/> [Anti-spam message headers](message-headers-eop-mdo.md) <br/><br/> You can analyze the message headers of quarantined messages using the [Message Header Analyzer at](https://mha.azurewebsites.net/).|
|Quarantine - end-users|[Find and release quarantined messages as a user](quarantine-end-user.md) <br/><br/> [Use quarantine notifications to release and report quarantined messages](quarantine-quarantine-notifications.md) <br/><br/> [Quarantine policies](quarantine-policies.md)|
|**Mail flow**||
|Mail flow rules|[Mail flow rules (transport rules) in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/mail-flow-rules) <br/><br/> [Mail flow rule conditions and exceptions (predicates) in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/conditions-and-exceptions) <br/><br/> [Mail flow rule actions in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/mail-flow-rule-actions) <br/><br/> [Manage mail flow rules in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/manage-mail-flow-rules) <br/><br/> [Mail flow rule procedures in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/mail-flow-rule-procedures)|
|Accepted domains|[Manage accepted domains in Exchange Online](/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains)|
|Connectors|[Configure mail flow using connectors in Exchange Online](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/use-connectors-to-configure-mail-flow)|
|Enhanced Filtering for Connectors|[Enhanced filtering for connectors in Exchange Online](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors)|
|**Monitoring**||
|Message trace|[Message trace](message-trace-defender-portal.md) <br/><br/> [Message trace in the Exchange admin center](/exchange/monitoring/trace-an-email-message/message-trace-modern-eac)|
|Email & collaboration reports|[View email security reports](reports-email-security.md)|
|Mail flow reports|[Mail flow reports in the Exchange admin center](/exchange/monitoring/mail-flow-reports/mail-flow-reports)|
|Mail flow insights|[Mail flow insights in the Exchange admin center](/exchange/monitoring/mail-flow-insights/mail-flow-insights)|
|Auditing reports|[Auditing reports in the Exchange admin center](/exchange/security-and-compliance/exchange-auditing-reports/exchange-auditing-reports)|
|**Service Level Agreements (SLAs) and support**||
|Spam effectiveness SLA|\> 99%|
|False positive ratio SLA|\< 1:250,000|
|Virus detection and blocking SLA|100% of known viruses|
|Monthly uptime SLA|99.999%|
|Phone and web technical support 24 hours a day, seven days a week|[Get support for Microsoft 365 for business](/microsoft-365/admin/get-help-support).|
|**Other features**||
|A geo-redundant global network of servers|Microsoft 365 runs on a worldwide network of datacenters that are designed to help provide the best availability. For more information, see the [Microsoft 365 datacenters](#microsoft-365-datacenters) section earlier in this article.|
|Message queuing when the on-premises server can't accept mail|Messages in deferral remain in our queues for one day. Message retry attempts are based on the error we get back from the recipient's mail system. On average, messages are retried every 5 minutes. For more information, see the [Mail flow delivery FAQ](mail-flow-about.md#mail-flow-delivery-faq).|
|Office 365 Message Encryption available as an add-on|For more information, see [Encryption in Office 365](/purview/encryption).|
