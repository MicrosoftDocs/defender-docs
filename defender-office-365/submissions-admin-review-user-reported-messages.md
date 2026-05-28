---
title: Admin review for user reported messages
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ms.custom:
description: Admins can learn how to review messages that were reported by users and give them feedback.
ms.service: defender-office-365
ms.date: 05/21/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Admin review for user reported messages

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In Microsoft 365 organizations with Exchange Online mailboxes and Microsoft Defender for Office 365, admins can send templated result messages back to users after they review the user reported messages. Admins can customize the notification message template that's used for the organization.

> [!TIP]
> In organizations with Defender for Office 365 Plan 2 and Security Copilot, the [Phishing Triage Agent](/defender-xdr/phishing-triage-agent) can autonomously triage and classify user-reported phishing emails, reducing manual review work for security teams.

The feature is designed to give feedback to users without changing the message verdicts in the system. To help Microsoft update and improve its filters, admins need to [submit user reported messages to Microsoft for analysis](submissions-admin.md#submit-user-reported-messages-to-microsoft-for-analysis) when the user reported settings are configured to send user reported messages to the reporting mailbox only. For more information, see [User reported settings](submissions-user-reported-messages-custom-mailbox.md).

Admins can mark messages and notify users of review results only if the user [reported the message as a false positive or a false negative](submissions-outlook-report-messages.md).

## What do you need to know before you begin?

- You open the Microsoft Defender portal at <https://security.microsoft.com>. To go directly to the **Submissions** page, use <https://security.microsoft.com/reportsubmission>. To go directly to the **User reported settings** page, use <https://security.microsoft.com/securitysettings/userSubmission>.

- If the [User reported settings](submissions-user-reported-messages-custom-mailbox.md) in the organization send user reported messages (email and [Microsoft Teams](submissions-teams.md)) to Microsoft (exclusively or in addition to the reporting mailbox), we do the same checks as when admins submit messages to Microsoft for analysis from the **Submissions** page:
  - **Email authentication check** (email messages only): Whether email authentication passed or failed when it was delivered.
  - **Policy hits**: Information about any policies or overrides that might have allowed or blocked the incoming email into the organization, thus overriding our filtering verdicts.
  - **Payload reputation/detonation**: Up-to-date examination of any URLs and attachments in the message.
  - **Grader analysis**: Review done by human graders to confirm whether or not messages are malicious.

  For more information, see [Learn more how submissions are processed behind-the-scenes to generate the result](https://techcommunity.microsoft.com/blog/microsoftdefenderforoffice365blog/how-your-submissions-to-defender-for-office-365-are-processed-behind-the-scenes/4231551).

  Unless you disagree with the original verdict, submitting a user reported message that was already sent to Microsoft isn't useful.

  If user reported messages are sent only to the reporting mailbox, admins should submit these messages to Microsoft.

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Authorization and settings/System settings/manage** or **Authorization and settings/System settings/Read-only**.
  - [Email & collaboration permissions in the Microsoft Defender portal](mdo-portal-permissions.md): Membership in the **Organization Management** or **Security Administrator** role groups.
  - [Exchange Online permissions](/exchange/permissions-exo/permissions-exo): Membership in the **Organization Management** role group.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>, **Security Administrator**, or **Global Reader** roles gives users the required permissions _and_ permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

- You need access to Exchange Online PowerShell. If your account doesn't have access to Exchange Online PowerShell, you get the following error: _Specify an email address in your domain_. For more information about enabling or disabling access to Exchange Online PowerShell, see [Enable or disable access to Exchange Online PowerShell](/powershell/exchange/disable-access-to-exchange-online-powershell).

## Notify users from within the portal

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the **Submissions** page at **Actions & Submissions** \> **Submissions**. Or, to go directly to the **Submissions** tab, use <https://security.microsoft.com/reportsubmission>.

2. On the **Submissions** page, select the **User reported** tab.

3. On the **User reported** tab, select the user reported message by using either of the following methods:

   - Select the message from the list by selecting the check box next to the first column, and then select :::image type="icon" source="media/m365-cc-scc-mark-and-notify-icon.png" border="false"::: **Mark as and notify**.
   - Select the message from the list by clicking anywhere in the row other than the check box. In the details flyout that opens, select :::image type="icon" source="media/m365-cc-scc-mark-and-notify-icon.png" border="false"::: **Mark as and notify** or :::image type="icon" source="media/m365-cc-sc-more-actions-icon.png" border="false"::: **More options** \> :::image type="icon" source="media/m365-cc-scc-mark-and-notify-icon.png" border="false"::: **Mark as and notify**.

4. In the **Mark as and notify** dropdown list, select one of the following values:

   - Available verdicts for email messages:
     - **No threats found**
     - **Phishing**
     - **Spam**

   - Available verdicts for Microsoft Teams messages:
     - **No threats found**
     - **Phishing**

The reported message is marked with the selected verdict, and an email message is automatically sent to notify the user who reported the message.

To customize the notification email, see the next section.

## Customize the messages used to notify users

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the **User reported** page at **Settings** \> **Email & collaboration** \> **User reported settings** tab. Or, to go directly to the **User reported settings** page, use <https://security.microsoft.com/securitysettings/userSubmission>.

2. On the **User reported settings** page, verify that **Monitor reported messages in Outlook** is selected in the **Outlook** section at the top of the page.

3. Find the **Email notifications** section and configure one or more of the following settings:

   - **Results email** section: Select **Customize results email**. In the **Customize admin review email notifications** flyout that opens, configure the following settings on the **Phishing**, **Junk** and **No threats found** tabs:
     - **Email body results text**: Enter the custom text to use. You can use different text for **Phishing**, **Junk** and **No threats found**.
     - **Email footer text**: Enter the custom message footer text to use. The same text is used for **Phishing**, **Junk** and **No threats found**.

     When you're finished in the **Customize admin review email notifications** flyout, select **Confirm** to return to the **User reported settings** page.

     :::image type="content" source="media/admin-review-customize-message.png" alt-text="The Customize confirmation message flyout." lightbox="media/admin-review-customize-message.png":::

   - **Customize sender and branding** section:
     - **Specify a Microsoft 365 mailbox to use ads the From address of email notifications**: Select this option and enter the sender's email address in the box that appears. If you don't select this option, the default sender is `submissions@messaging.microsoft.com`.
     - **Replace the Microsoft logo with my organization's logo across all reporting experiences**: Select this option to replace the default Microsoft logo that's used in notifications. Before you do this step, follow the instructions in [Customize the Microsoft 365 theme for your organization](/microsoft-365/admin/setup/customize-your-organization-theme) to upload your custom logo.

4. When you're finished on the **User reported settings** page, select **Save**.
