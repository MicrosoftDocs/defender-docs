---
title: Troubleshoot outbound sending limits in Exchange Online
description: Learn about outbound sending limits in Exchange Online, how to monitor usage, request increases, and resolve blocked sending for users and organizations.
author: chrisda
ms.author: chrisda
ms.date: 05/21/2026
ms.topic: troubleshooting
ms.service: defender-office-365
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ai-usage: ai-assisted
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
#customer intent: As an admin whose users are blocked from sending email, I want to understand outbound sending limits, monitor usage, and resolve restrictions so I can restore normal email delivery.
---

# Troubleshoot outbound sending limits and blocked users in Exchange Online

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Exchange Online enforces outbound sending limits to protect the service from spam, bulk-mailing abuse, and compromised accounts. When a user or organization exceeds these limits, email sending is restricted.

Use the information here to understand what limits exist, how to monitor usage, and how to resolve blocked sending.

## Sending limits in Exchange Online

Exchange Online applies outbound sending limits to all cloud mailboxes. These limits operate at the user level and the organization level.

For the complete list of service limits, see [Exchange Online sending limits](/office365/servicedescriptions/exchange-online-service-description/exchange-online-limits#sending-limits-1).

### Per-user sending limits

The recipient rate limit and message rate limit are hard limits enforced at the service level and can't be increased.

|Limit|Value|Notes|
|---|---|---|
|**Recipient rate limit**|10,000 recipients per day|24-hour sliding window. The mailbox can't send until the number of recipients sent to in the past 24 hours drops below the limit.|
|**Message rate limit**|30 messages per minute|Excess submissions are throttled and carried over to following minutes.|
|**Recipient limit per message**|500 recipients (default)|Customizable between 1 to 1000 in the Exchange admin center (EAC) or PowerShell. For more information, see [Customizable recipient limits in Office 365](https://techcommunity.microsoft.com/t5/exchange-team-blog/customizable-recipient-limits-in-office-365/ba-p/1183228).|

> [!NOTE]
> For the recipient rate limit, distribution groups in the organization's address book count as **one recipient**. Distribution groups in a mailbox's Contacts folder are counted **individually** by member.

### Tenant External Recipient Rate Limit

The Tenant External Recipient Rate Limit (TERRL) is the maximum number of external recipients an organization can send to per day. TERRL scales automatically with the number of licenses in the organization. Trial organizations have a default limit of 5,000 external recipients per day.

> [!NOTE]
> TERRL counts distribution group members individually. For example, a message sent to a distribution group with 1,000 external recipients counts as 1,000 external recipients.

### Outbound spam policy limits

Admins can configure more limits in outbound spam policies. For instructions, see [Configure outbound spam policies](outbound-spam-policies-configure.md).

|Setting|Description|Valid range|
|---|---|---|
|**External message limit**|Maximum number of external recipients per hour|0–10,000 (0 = service default)|
|**Internal message limit**|Maximum number of internal recipients per hour|0–10,000 (0 = service default)|
|**Daily message limit**|Maximum total number of recipients per day|0–10,000 (0 = service default)|

## Monitor sending usage

Use the following tools to monitor outbound email activity and detect potential issues:

- **Message trace**: Track individual outbound messages and identify delivery failures. For more information, see [Message trace in the Microsoft Defender portal](message-trace-defender-portal.md).
- **Mail flow reports**: The following reports in the Exchange admin center help monitor outbound sending. On the **Mail flow** reports page in the Exchange admin center at <https://admin.exchange.microsoft.com/#/reports/mailflowreportsmain>, select the report to view. For a complete list of available reports, see [Mail flow reports](/exchange/monitoring/mail-flow-reports/mail-flow-reports).
  - **Tenant Outbound External Recipients** report: Shows TERRL usage for your organization.
  - [Mailboxes exceeding receiving limits report](/exchange/monitoring/mail-flow-reports/mailboxes-exceeding-receiving-limits-report): Identifies mailboxes receiving unusually high volumes.
- **Built-in alert policies**: The following [alert policies](/defender-xdr/alert-policies#threat-management-alert-policies) are enabled by default and send notifications to the **TenantAdmins** (Global Administrator) group. On the **Alert policy** page in the Microsoft Defender portal at <https://security.microsoft.com/alertpoliciesv2>, search for the policy to review or modify its settings:
  - [Email sending limit exceeded](/defender-xdr/alert-policies#threat-management-alert-policies): A user exceeds the outbound sending limits.
  - [Suspicious email sending patterns detected](/defender-xdr/alert-policies#threat-management-alert-policies): Unusual outbound email activity is detected from a user.
  - [User restricted from sending email](/defender-xdr/alert-policies#threat-management-alert-policies): A user is blocked from sending due to outbound spam.

> [!TIP]
> For programmatic monitoring, use [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) with the `Get-MailDetailTransportRuleReport` and `Get-MailTrafficSummaryReport` cmdlets.

## Best practices for bulk senders

Exchange Online isn't designed for bulk mailing scenarios. If you require sending volumes that exceed the limits described in this article, use a dedicated bulk email service provider. For detailed recommendations, see [Outbound spam protection](outbound-spam-protection-about.md#recommendations-for-customers-who-want-to-send-mass-mailings-through-microsoft-365).

### Alternatives for bulk email

If your organization needs to send bulk or marketing email, use a service designed for high-volume sending.

- **[Azure Communication Services Email](/azure/communication-services/concepts/email/email-overview)**: A Microsoft service purpose-built for high-volume email sending.
- **Non-Microsoft bulk email providers**: Purpose-built services for bulk sending.
- **On-premises email servers**: Maintain your own email infrastructure for mass mailings.

### Alternative sending methods for application mail

The following options are for application-generated or device-generated messages, not bulk marketing email. These methods are still subject to Exchange Online sending limits.

- **SMTP relay via Microsoft 365**: For application-generated messages that need to route through your organization. For more information, see [Set up a multifunction device or application to send email using Microsoft 365](/exchange/mail-flow-best-practices/how-to-set-up-a-multifunction-device-or-application-to-send-email-using-microsoft-365-or-office-365#smtp-relay-configure-a-connector-to-relay-email-from-your-device-or-application-through-microsoft-365-or-office-365).
- **Direct Send**: For devices/applications that send to your own organization only. For more information, see [Direct Send](/exchange/mail-flow-best-practices/how-to-set-up-a-multifunction-device-or-application-to-send-email-using-microsoft-365-or-office-365#direct-send-send-mail-directly-from-your-device-or-application-to-microsoft-365-or-office-365).

### If you must send bulk email through Microsoft 365

Follow these guidelines to reduce the risk of being blocked or routed to the [high-risk delivery pool](outbound-spam-high-risk-delivery-pool-about.md):

- **Configure email authentication**: Set up [SPF](email-authentication-spf-configure.md), [DKIM](email-authentication-dkim-configure.md), and [DMARC](email-authentication-dmarc-configure.md) for your sending domain.
- **Maintain list hygiene**: Remove invalid and bouncing email addresses. Honor unsubscribe requests immediately. Use confirmed opt-in (double opt-in) for new subscribers.
- **Follow content best practices**: Use a consistent and recognizable **From** address. Write clear, accurate **Subject** lines. Include a visible and functional **unsubscribe** link.
- **Manage sending rate**: Spread bulk sends over time rather than sending all at once. Monitor bounce rates and don't exceed 30 messages per minute per mailbox.
- **Protect domain reputation**: Use a custom subdomain for bulk email (for example, `m.contoso.com` for marketing). Use message trace to check whether your messages are being routed to the high-risk delivery pool.

## Resolve blocked sending

When a user exceeds outbound sending limits or is detected sending spam ("I'm blocked"), Exchange Online restricts the user from sending email. The user appears on the **Restricted entities** page in the Microsoft Defender portal at <https://security.microsoft.com/restrictedusers>.

A blocked user shows the following symptoms:

- The user receives a non-delivery report (also known as an NDR or bounce message) with error code [5.1.8](/Exchange/mail-flow-best-practices/non-delivery-reports-in-exchange-online/fix-error-code-5-1-8-in-exchange-online) when trying to send email.
- The user appears on the **Restricted entities** page.
- Admins receive the **"User restricted from sending email"** [alert notification](outbound-spam-restore-restricted-users.md#verify-the-alert-settings-for-restricted-users).

Before unblocking the user, determine why the restriction was applied:

- **Compromised account**: The account might be compromised and used to send spam. Check sign-in logs for suspicious activity, look for unknown inbox rules or forwarding rules, and review recent sent items.
- **Legitimate bulk send**: The user intentionally sent a large volume of email that exceeded limits. Consider the alternative sending methods described in [Best practices for bulk senders](#best-practices-for-bulk-senders).

For detailed steps to investigate, remediate compromised accounts, and remove users from the **Restricted entities** page, see [Remove blocked users from the Restricted entities page](outbound-spam-restore-restricted-users.md).

To prevent future blocks, take the following actions:

- [Configure outbound spam policies](outbound-spam-policies-configure.md) with appropriate per-hour and daily limits and notifications.
- Ensure **Email sending limit exceeded** [alert policies](alert-policies-defender-portal.md) are active.
- Inform users about sending limits and bulk email alternatives.
- [Enable MFA](/entra/identity/authentication/concept-mfa-howitworks) to protect accounts from compromise.
- Review [mail flow reports](/exchange/monitoring/mail-flow-reports/mail-flow-reports) and [message traces](message-trace-defender-portal.md) periodically.

## Related content

- [Outbound spam protection](outbound-spam-protection-about.md)
- [Configure outbound spam policies](outbound-spam-policies-configure.md)
- [Remove blocked users from the Restricted entities page](outbound-spam-restore-restricted-users.md)
- [High-risk delivery pool for outbound messages](outbound-spam-high-risk-delivery-pool-about.md)
- [Exchange Online limits](/office365/servicedescriptions/exchange-online-service-description/exchange-online-limits)
- [Troubleshoot email from external senders to Microsoft 365](external-senders-mail-flow-troubleshooting.md)
- [Anti-spam protection FAQ](anti-spam-protection-faq.md)
