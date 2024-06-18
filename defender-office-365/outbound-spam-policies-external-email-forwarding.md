---
title: Configuring and controlling external email forwarding in Microsoft 365
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
ms.date: 06/10/2024
audience: ITPro
ms.topic: overview
ms.collection: 
- m365-security
- tier2
ms.localizationpriority: medium
ms.assetid:
ms.custom:
- seo-marvel-apr2020
- adminvideo
description: This article covers external email forwarding, Automatic forwarding, 5.7.520 Access Denied messages, disabling external forwarding, 'Your administrator has disabled external forwarding' messages, and outbound anti-spam policy.
ms.service: defender-office-365
search.appverid: met150
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Control automatic external email forwarding in Microsoft 365

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

As an admin in Microsoft 365, you might have company requirements to restrict or control automatically forwarded messages to external recipients (recipients outside of your organization). Email forwarding can be useful, but can also pose a security risk due to the potential disclosure of information. Attackers might use this information to attack your organization or partners.

The following types of automatic forwarding are available in Microsoft 365:

- Users can configure [Inbox rules](https://support.microsoft.com/office/c24f5dea-9465-4df4-ad17-a50704d66c59) to automatically forward messages to external senders (deliberately or as a result of a compromised account).
- Admins can configure [mailbox forwarding](/exchange/recipients-in-exchange-online/manage-user-mailboxes/configure-email-forwarding) (also known as _SMTP forwarding_) to automatically forward messages to external recipients. The admin can choose whether to forward messages, or keep copies of forwarded messages in the mailbox.

> [!TIP]
> Users with automatic forwarding from on-premises email systems through Microsoft 365 are subject to the same policy controls as cloud mailboxes.

You can use outbound spam filter policies to control automatic forwarding to external recipients. Three settings are available:

- **Automatic - System-controlled**: This is the default setting. This setting is now the same as **Off**. When this setting was originally introduced, it was equivalent to **On**. Over time, thanks to the principles of [secure by default](secure-by-default.md), this setting was gradually changed to **Off** for all customers. For more information, see [this blog post](https://techcommunity.microsoft.com/t5/exchange-team-blog/all-you-need-to-know-about-automatic-email-forwarding-in/ba-p/2074888).
- **On**: Automatic external forwarding is allowed and not restricted.
- **Off**: Automatic external forwarding is disabled and results in a non-delivery report (also known as an NDR or bounce message) to the sender.

For instructions on how to configure these settings, see [Configure outbound spam filtering in EOP](outbound-spam-policies-configure.md).

> [!NOTE]
>
> - Disabling automatic forwarding disables any Inbox rules (users) or mailbox forwarding (admins) that redirect messages to external addresses.
> - Automatic forwarding of messages between internal users isn't affected by the settings in outbound spam filter policies.

## How the outbound spam filter policy settings work with other automatic email forwarding controls

As an admin, you might use other controls to allow or block automatic email forwarding. For example:

- [Remote domains](/exchange/mail-flow-best-practices/remote-domains/remote-domains) to allow or block automatic email forwarding to some or all external domains.
- Conditions and actions in Exchange [mail flow rules](/exchange/security-and-compliance/mail-flow-rules/mail-flow-rules) (also known as transport rules) to detect and block automatically forwarded messages to external recipients.

When one setting allows external forwarding, but another setting blocks external forwarding, the block typically wins. Examples are described in the following table:

|Scenario|Result|
|---|---|
|<ul><li>You configure remote domain settings to allow automatic forwarding.</li><li>Automatic forwarding in the outbound spam filter policy is set to **Off**.</li></ul>|Automatically forwarded messages to recipients in the affected domains are blocked.|
|<ul><li>You configure remote domain settings to allow automatic forwarding.</li><li>Automatic forwarding in the outbound spam filter policy is set to **Automatic - System-controlled**.</li></ul>|Automatically forwarded messages to recipients in the affected domains are blocked. <br/><br/> As described earlier, **Automatic - System-controlled** used to mean **On**, but the setting changed over time to mean **Off** in all organizations. <br/><br/> For absolute clarity, you can configure your outbound spam filter policy to **On** or **Off**.|
|<ul><li>Automatic forwarding in the outbound spam filter policy is set to **On**</li><li>You use mail flow rules or remote domains to block automatically forwarded email.</li></ul>|Automatically forwarded messages to affected recipients are blocked by mail flow rules or remote domains.|

You can use this behavior (for example) to allow automatic forwarding in outbound spam filter policies, but use remote domains to control the external domains that users can forward messages to.

## How to find users that are automatically forwarding

You can see information about users that are automatically forwarding messages to external recipients in the [Auto forwarded messages report](/exchange/monitoring/mail-flow-reports/mfr-auto-forwarded-messages-report) for cloud-based accounts.

For on-premises users that automatically forward from their on-premises email system through Microsoft 365, you need to create a mail flow rule to track these users. For general instructions on how to create a mail flow rule, see [Use the EAC to create a mail flow rule](/exchange/security-and-compliance/mail-flow-rules/manage-mail-flow-rules#use-the-eac-to-create-a-mail-flow-rule).

Use the following information to create the mail flow rule in the Exchange admin center (EAC):

- **Set rule conditions** page:
  - **Apply this rule if** (condition): **The message headers** \> **matches these text patterns**.
    - Select **Enter text** to specify the following header: `X-MS-Exchange-Inbox-Rules-Loop`
    - Select **Enter words** to specify the following header value: `.` (match any value for the header)

    The condition looks like this: **'X-MS-Exchange-Inbox-Rules-Loop'** message header matches **'.'**

  - **Do the following** (action): Configure an appropriate action. For example, you can use the action **Modify the message properties** \> **set a message header**, with the header name **X-Forwarded** and the value **True**.

  :::image type="content" source="media/mail-flow-rule-for-forwarded-messages-conditions.png" alt-text="The rule conditions and action in the EAC for a mail flow rule to identify forwarded messages." lightbox="media/mail-flow-rule-for-forwarded-messages-conditions.png":::

- **Set rule settings** page:
  - Set the **Severity** value to **Low**, **Medium**, or **High**. This setting allows you to use the [Exchange transport rule report](reports-email-security.md#exchange-transport-rule-report) to get details of users that are forwarding.

  :::image type="content" source="media/mail-flow-rule-for-forwarded-messages-settings.png" alt-text="Setting the mail flow rule severity to Medium in the EAC for the mail flow rule to identify forwarded messages." lightbox="media/mail-flow-rule-for-forwarded-messages-settings.png":::

## Blocked email forwarding messages

When a message is detected as automatically forwarded, and the [outbound spam filter](outbound-spam-policies-configure.md) policy _blocks_ that activity, the message is returned to the sender in an NDR that contains the following information:

`5.7.520 Access denied, Your organization does not allow external forwarding. Please contact your administrator for further assistance. AS(7555)`
