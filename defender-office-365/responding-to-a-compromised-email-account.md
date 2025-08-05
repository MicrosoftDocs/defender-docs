---
title: Responding to a Compromised Email Account
f1.keywords:
  - NOCSH
  - Hijacked account
  - Hacked account
  - Compromised account
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.collection:
  - o365_security_incident_response
  - m365-security
  - m365solution-smb
  - highpri
  - tier1
ms.custom:
  - TopSMBIssues
  - seo-marvel-apr2020
ms.localizationpriority: high
search.appverid:
  - MET150
description: Learn how to recognize and respond to a compromised email account using tools available in Microsoft 365.
ms.service: defender-office-365
ms.date: 03/31/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Respond to a compromised cloud email account

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

User credentials control access to Microsoft Entra ID accounts, which are central to compromise investigations. Once an attacker gains access to the account, they can access the associated Microsoft 365 mailbox, SharePoint folders, or files in the user's OneDrive. Remediation and investigation of a compromised user focuses on the affected account and the services associated with the account.

Attackers often use a compromised user's mailbox to send to recipients inside and outside of the organization. Business Email Compromise (BEC) is a prolific type of attack and is addressed in this article.

This article addresses the symptoms of account compromise (specifically, the mailbox) and how to regain control of the compromised account.

> [!IMPORTANT]
> The following button lets you test and identify suspicious account activity. Use this test with the guidance in this article to gain insight into potentially compromised accounts and determine the necessary remediation actions.
>
<div class="nextstepaction">
<p><a href="https://aka.ms/diagca" data-linktype="external">Run Tests: Compromised Accounts</a></p>
</div>

## Common symptoms of a compromised Microsoft 365 email account

One or more of the following activities might indicate an account associated with a Microsoft 365 mailbox is compromised:

- The mailbox is blocked from sending email.
- Suspicious activity. For example, missing or deleted email.
- Suspicious [Inbox rules](https://support.microsoft.com/office/c24f5dea-9465-4df4-ad17-a50704d66c59). For example:
  - Rules that automatically forward email to unknown addresses.
  - Rules that move messages to the **Notes**, **Junk Email**, or **RSS Subscriptions** folders.
- The **Sent Items** or **Deleted Items** folders contain suspicious messages. For example, "I'm stuck in London, send money."
- Changes to the user's contact in the Global Address List (GAL). For example, name, telephone number, or postal code.
- Frequent password changes or unexplained account lockouts.
- Recently added [external email forwarding](outbound-spam-policies-external-email-forwarding.md).
- Suspicious email message signatures. For example, a fake banking signature or a prescription drug signature.

If the mailbox exhibits any of these symptoms, use the steps in the next section to regain control of the account.

## Secure and Restore Email Function to a Compromised Microsoft 365 Mail Enabled Account

After the attacker gains access to an account, you need to block access to the account as soon as possible.

The following steps address known methods that might allow the attacker to maintain persistence and regain control of the account later. Be sure to address each step.

### Step 1: Disable the affected user account

- Disabling the compromised account is preferred and highly recommended until you complete the investigation.

  1. If necessary, install the Microsoft Graph PowerShell module in PowerShell by running the following command:

     ```powershell
     Install-Module -Name Microsoft.Graph -Scope CurrentUser
     ```

  2. Connect to Microsoft Graph by running the following command:

     ```powershell
     Connect-MgGraph -Scopes "User.ReadWrite.All"
     ```

  3. To store the details of the user account in the variable named `$user`, replace \<UPN\> with the user's account name (user principal name or UPN), and then run the following command:

     ```powershell
     $user = Get-MgUser -Search UserPrincipalName:'<UPN>' -ConsistencyLevel Eventual
     ```

     For example:

     ```powershell
     $user = Get-MgUser -Search UserPrincipalName:'jason@contoso.onmicrosoft.com' -ConsistencyLevel Eventual
     ```

  4. Run the following command to disable the user account:

     ```powershell
     Update-MgUser -UserId $user.Id -AccountEnabled $false
     ```

  For detailed syntax and parameter information, see [Update-MgUser](/powershell/module/microsoft.graph.users/update-mguser)

- If you can't disable the account, the next best step is to reset the password. For instructions, see [Reset passwords in Microsoft 365 for business](/microsoft-365/admin/add-users/reset-passwords).
  - Be sure to use a strong password: upper and lowercase letters, at least one number, and at least one special character.
  - **Don't send the new password to the user through email, because the attacker could have access to the mailbox at this point**.
  - Use a unique password the attacker can't guess. Even if the password history requirement allows it, don't reuse any of the last five passwords.
  - If the account is synced from Active Directory, reset the password in Active Directory and reset it twice to mitigate the risk of [pass-the-hash](https://en.wikipedia.org/wiki/Pass_the_hash) attacks. For instructions, see [Set-ADAccountPassword](/powershell/module/activedirectory/set-adaccountpassword).
  - If the user's identity is federated with Microsoft 365, you must change the account password in the on-premises environment and then notify the administrator of the compromise.
  - Be sure to update app passwords. App passwords aren't automatically revoked when you reset the password. The user should delete existing app passwords and create new ones. For more information, see [Manage app passwords for two-step verification](https://support.microsoft.com/account-billing/d6dc8c6d-4bf7-4851-ad95-6d07799387e9).

- We highly recommend enabling and enforcing multifactor authentication (MFA) for the account. MFA effectively safeguards against account compromise and is essential for accounts with admin privileges.

  For more information, see the following articles:

  - [Set up multifactor authentication](/microsoft-365/admin/security-and-compliance/set-up-multi-factor-authentication)
  - [Require phishing-resistant MFA for admins](/entra/identity/conditional-access/policy-admin-phish-resistant-mfa)

### Step 2: Revoke User Access

This step immediately invalidates any active access using the stolen credentials, and prevents the attacker from accessing more sensitive data or doing unauthorized actions on the compromised account.

1. Run the following command in an elevated PowerShell window (a PowerShell window you open by selecting **Run as administrator**):

   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```

2. If necessary, run the following commands to install the required modules for Microsoft Graph PowerShell:

   ```powershell
   Install-Module Microsoft.Graph.Authentication

   Install-Module Microsoft.Graph.Users.Actions
   ```

3. Connect to Microsoft Graph by running the following command:

   ```powershell
   Connect-MgGraph -Scopes User.RevokeSessions.All
   ```

4. Replace \<UPN\> with the user's account (user principal name or UPN), and then run the following command:

   ```powershell
   Revoke-MgUserSignInSession -UserId <UPN>
   ```

   For example:

   ```powershell
   Revoke-MgUserSignInSession -UserId jason@contoso.onmicrosoft.com
   ```

For more information, see [Revoke user access in an emergency in Microsoft Entra ID](/entra/identity/users/users-revoke-access).

### Step 3: Review the MFA registered devices for the affected user

Identify and remove any suspicious devices added by an attacker. Also, ensure any unrecognized MFA methods are removed to secure the user's account.

For instructions, see [MFA methods removed](/entra/identity/authentication/howto-mfa-userdevicesettings#manage-user-authentication-options)

### Step 4: Review the list of applications with user consent

Remove and revoke any applications that shouldn't be allowed.

For instructions, see [Application review](/entra/identity/enterprise-apps/manage-application-permissions?pivots=portal#review-and-revoke-permissions).

### Step 5: Review the administrative roles assigned to the user

Remove any roles that shouldn't be allowed.

For more information, see the following articles:

- [List Azure role assignments using the Azure portal](/azure/role-based-access-control/role-assignments-list-portal)
- [List Microsoft Entra role assignments](/entra/identity/role-based-access-control/view-assignments?tabs=admin-center#list-role-assignments-for-a-user)
- [Permissions in the Microsoft Purview portal](/purview/purview-compliance-portal-permissions)
- [Microsoft Defender for Office 365 permissions in the Microsoft Defender portal](/defender-office-365/mdo-portal-permissions)

### Step 6: Review mail forwarders

Remove any suspicious mailbox forwarding that the attacker added.

1. [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell).

2. To see if mailbox forwarding (also known as *SMTP forwarding*) is configured on the mailbox, replace \<Identity\> with the name, email address, or account name of the mailbox, and then run the following command:

   ```powershell
   Get-Mailbox -Identity \<Identity\> | Format-List Forwarding*Address,DeliverTo*
   ```

   For example:

   ```powershell
   Get-Mailbox -Identity jason@contoso.com | Format-List Forwarding*Address,DeliverTo*
   ```

   Observe the values of the following properties:

   - *ForwardingAddress*: A nonblank value means email is being forwarded to the specified internal recipient.
   - *ForwardingSmtpAddress*: A nonblank value means email is being forwarded to the specified external recipient. If both *ForwardingAddress* and *ForwardingSmtpAddress* are configured, email is forwarded only to the *ForwardingAddress* internal recipient.
   - *DeliverToMailboxAndForward*: Controls how messages are delivered and forwarded to recipients specified by *ForwardingAddress* or *ForwardingSmtpAddress*:
     - True: Messages are delivered to this mailbox and forwarded to the specified recipient.
     - False: Messages are forwarded to the specified recipient. Messages aren't delivered to this mailbox.

3. To see if any Inbox rules are forwarding email from the mailbox, replace \<Identity\> with the name, email address, or account name of the mailbox, and then run the following command:

   ```powershell
   Get-InboxRule -Mailbox <Identity> -IncludeHidden | Format-List Name,Enabled,RedirectTo,Forward*,Identity
   ```

   For example:

   ```powershell
   Get-InboxRule -Mailbox jason@contoso.com -IncludeHidden | Format-List Name,Enabled,RedirectTo,Forward*,Identity
   ```

   Observe the values of the following properties:

   - *Enabled*: Whether the rule is enabled (True) or disabled (False).
   - *RedirectTo*: A nonblank value means email is being redirected to the specified recipients. Messages aren't delivered to this mailbox.
   - *ForwardTo*: A nonblank value means email is being forwarded to the specified recipients.
   - *ForwardAsAttachmentTo*: A nonblank value means email is being forwarded to the specified recipients as an email attachment.
   - *Identity*: The globally unique value of the rule. To see complete details of the rule, replace \<Identity\> with the Identity value, and then run the following command:

     ```powershell
     Get-InboxRule -Identity "<Identity>" -IncludeHidden | Format-List
     ```

     For example:

     ```powershell
     Get-InboxRule -Identity "jason\10210541742734704641" -IncludeHidden | Format-List
     ```

For more information, see [Control automatic external email forwarding](/defender-office-365/outbound-spam-policies-external-email-forwarding).

## Perform an Investigation

When a user reports unusual symptoms, it's crucial to conduct a thorough investigation. The Microsoft Entra admin center and the Microsoft Defender portal provide several tools to help examining suspicious activity on user accounts. Be sure to review the audit logs from the onset of the suspicious activity until you complete the remediation steps.

- **Microsoft Entra sign-in logs and other risk reports in the Microsoft Entra admin center**: Examine the values in these columns:
  - IP address
  - Sign-in locations
  - Sign-in times
  - Sign-in success or failure

  For more information, see the following articles:

  - [What are Microsoft Entra audit logs?](/entra/identity/monitoring-health/concept-audit-logs)
  - [What are Microsoft Entra sign-in logs?](/entra/identity/monitoring-health/concept-sign-ins)

- **Azure audit logs**: For more information, see [Azure security logging and auditing](/azure/security/fundamentals/log-audit).

- **Audit logs in the Defender portal**: Filter the logs for activity using a date range that starts immediately before the suspicious activity occurred. Don't filter specific activities during the initial search.

  For more information, see [Search the audit log](audit-log-search-defender-portal.md).

By analyzing the provided logs, you can pinpoint the specific time frame that requires further attention. Once identified, review the messages sent by the user during this period for more insight.

- **Message Trace in the Defender portal**: Verify the contents of the **Sent items** folder of the account in Outlook or Outlook on the web.

  For more information, see [Message trace in the Microsoft Defender portal](message-trace-defender-portal.md).

## After the investigation is complete

1. If you disabled the account during the investigation, reset the password and then enable the account as described [earlier in this article](#step-1-disable-the-affected-user-account)

2. If the account was used to send spam or a high volume of email, it's likely that the mailbox is blocked from sending mail. Remove the user from the Restricted entities page as described in [Remove blocked users from the Restricted entities page](outbound-spam-restore-restricted-users.md).

## More resources

[Detect and Remediate Outlook Rules and Custom Forms Injections Attacks](detect-and-remediate-outlook-rules-forms-attack.md)

[Detect and Remediate Illicit Consent Grants](detect-and-remediate-illicit-consent-grants.md)

[Report spam, nonspam, phishing, suspicious email, and files to Microsoft](submissions-report-messages-files-to-microsoft.md)
