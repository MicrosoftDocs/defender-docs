---
title: Preset security policies
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.localizationpriority: medium
ms.assetid:
ms.collection:
  - m365-security
  - tier1
ms.custom:
description: Admins can learn how to apply Standard and Strict policy settings across the default email protections for cloud mailboxes and Microsoft Defender for Office 365
ms.service: defender-office-365
search.appverid: met150
ms.date: 07/07/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Preset security policies in cloud organizations

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

_Preset security policies_ allow you to apply many email protection features to users based on our recommended settings. Unlike custom threat policies that are infinitely configurable, virtually all of the settings in preset security policies aren't configurable, and are based on our observations in the datacenters. The threat policy settings in preset security policies provide a balance between keeping harmful content away from users while avoiding unnecessary disruptions.

Depending on your organization, preset security policies provide many of the protection features that are available in the [default email protections for cloud mailboxes](eop-about.md) and [Microsoft Defender for Office 365](mdo-about.md).

The following preset security policies are available:

- **Standard** preset security policy.
- **Strict** preset security policy.
- **Built-in protection** preset security policy. Gives basic Safe Attachments and Safe Links protection in Defender for Office 365 to all users who:
  - Aren't excluded from Built-in protection.
  - Aren't included in the **Standard** or **Strict** preset security policies.
  - Aren't included in custom Safe Attachments or Safe Links policies.

For details about these preset security policies, see the [Appendix](#appendix) section at the end of this article.

The rest of this article how to configure preset security policies.

## What do you need to know before you begin?

- You open the Microsoft Defender portal at <https://security.microsoft.com>. To go directly to the **Preset security policies** page, use <https://security.microsoft.com/presetSecurityPolicies>.

- To connect to Exchange Online PowerShell, see [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell).

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Authorization and settings/Security settings/Core Security settings (manage)** or **Authorization and settings/Security settings/Core Security settings (read)**.
  - [Exchange Online permissions](/exchange/permissions-exo/permissions-exo):
    - _Configure preset security policies_: Membership in the **Organization Management** or **Security Administrator** role groups.
    - _Read-only access to preset security policies_: Membership in the **Global Reader** role group.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>, **Security Administrator**, or **Global Reader** roles gives users the required permissions _and_ permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft recommends that you use roles with the fewest permissions. Using lower permissioned accounts helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

## Use the Microsoft Defender portal to assign Standard and Strict preset security policies to users

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Email & Collaboration** \> **Policies & Rules** \> **Threat policies** \> **Preset Security Policies** in the **Templated policies** section. Or, to go directly to the **Preset security policies** page, use <https://security.microsoft.com/presetSecurityPolicies>.

2. During your first visit to the **Preset security policies** page, it's likely that **Standard protection** and **Strict protection** are turned off :::image type="icon" source="media/scc-toggle-off.png" border="false":::.

   Slide the toggle of the one you want to configure to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Manage protection settings** to start the configuration wizard.

3. On the **Apply Exchange Online Protection** page, identify the internal recipients who receive the [default email protections for cloud mailboxes](#policies-in-preset-security-policies) (recipient conditions):

   - **All recipients**

   - **Specific recipients**: Configure one of the following recipient conditions that appear:
     - **Users**: The specified mailboxes, mail users, or mail contacts.
     - **Groups**:
       - Members of the specified distribution groups or mail-enabled security groups (dynamic distribution groups aren't supported).
       - The specified Microsoft 365 Groups.
     - **Domains**: All recipients in the organization with a primary email address in the specified [accepted domain](/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains).

     > [!TIP]
     > Subdomains are automatically included unless you specifically exclude them. For example, a policy that includes contoso.com also includes marketing.contoso.com unless you exclude marketing.contoso.com.

   Click in the appropriate box, start typing a value, and select the value that you want from the results. Repeat this process as many times as necessary. To remove an existing value, select :::image type="icon" source="media/m365-cc-sc-remove-selection-icon.png" border="false"::: next to the value.

   For users or groups, you can use most identifiers (name, display name, alias, email address, account name, etc.), but the corresponding display name is shown in the results. For users or groups, enter an asterisk (\*) by itself to see all available values.

   You can use a condition only once, but the condition can contain multiple values:

   - Multiple **values** of the **same condition** use OR logic (for example, _\<recipient1\>_ or _\<recipient2\>_). If the recipient matches **any** of the specified values, the policy is applied to them.
   - Different **types of conditions** use AND logic. The recipient must match **all** of the specified conditions for the policy to apply to them. For example, you configure a condition with the following values:
     - Users: `romain@contoso.com`
     - Groups: Executives

     The policy is applied to `romain@contoso.com` _only_ if he's also a member of the Executives group. Otherwise, the policy isn't applied to him.

   - **None**

   - **Exclude these recipients**: If you selected **All recipients** or **Specific recipients**, select this option to configure recipient exceptions.

     You can use an exception only once, but the exception can contain multiple values:

     - Multiple **values** of the **same exception** use OR logic (for example, _\<recipient1\>_ or _\<recipient2\>_). If the recipient matches **any** of the specified values, the policy isn't applied to them.
     - Different **types of exceptions** use OR logic (for example, _\<recipient1\>_ or _\<member of group1\>_ or _\<member of domain1\>_). If the recipient matches **any** of the specified exception values, the policy isn't applied to them.

   When you're finished on the **Apply Exchange Online Protection** page, select **Next**.

   > [!NOTE]
   > In organizations without Defender for Office 365, selecting **Next** takes you to the **Review** page (Step 9).

4. On the **Apply Defender for Office 365 protection** page, identify the internal recipients who receive (recipient conditions) or don't receive (recipient exceptions) the [Defender for Office 365 protections](#policies-in-preset-security-policies).

   The settings and behavior are exactly like the **Apply Exchange Online Protection** page in the previous step.

   You can also select **Previously selected recipients** to use the same recipients you selected on the previous page.

   When you're finished on the **Apply Defender for Office 365 protection** page, select **Next**.

   > [!TIP]
   > If not all users in your organization have Defender for Office 365 licenses, you can use the following methods to apply Defender for Office 365 protections to eligible users only:
   >
   > - Use **Specified recipients** to identify the users or groups who **are eligible** for Defender for Office 365 protections.
   > - Use **Exclude these recipients** \> **Specified recipients** to identify the users or groups who **aren't eligible** for Defender for Office 365 protections.

5. On the **Impersonation protection** page, select **Next**.

6. On the **Add email addresses to flag when impersonated by attackers** page, add the internal senders and external senders who are protected by [user impersonation protection](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365).

   > [!NOTE]
   > All recipients automatically receive impersonation protection from [mailbox intelligence](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365) in preset security policies.
   >
   > You can specify a maximum of 350 users for user impersonation protection in the Standard or Strict preset security policy.
   >
   > User impersonation protection doesn't work if the sender and recipient previously communicated via email. If the sender and recipient never communicated via email, the message can be identified as an impersonation attempt.

   Each entry consists of a display name and an email address:

   - **Internal users**: Click in the **Add a valid email** box or start typing the user's email address. Select the email address in the **Suggested contacts** dropdown list that appears. The user's display name is added to the **Add a name** box (which you can change). When you're finished selecting the user, select **Add**.

   - **External users**: Type the full email address in the **Add a valid email** box, and then select the email address in the **Suggested contacts** dropdown list that appears. The email address is also added in the **Add a name** box (which you can change to a display name).

   Repeat these steps as many times as necessary.

   The users you added are listed on the page by **Display name** and **Sender email address**. To remove a user, select :::image type="icon" source="media/m365-cc-sc-close-icon.png" border="false"::: next to the entry.

   Use the :::image type="icon" source="media/m365-cc-sc-create-icon.png" border="false"::: **Search** box to find entries on the page.

   When you're finished on the **Apply Defender for Office 365 protection** page, select **Next**.

7. On the **Add domains to flag when impersonated by attackers** page, add internal and external domains that are protected by [domain impersonation protection](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365).

   > [!NOTE]
   > All domains that you own ([accepted domains](/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains)) automatically receive domain impersonation protection in preset security policies.
   >
   > You can specify a maximum of 50 custom domains for domain impersonation protection in the Standard or Strict preset security policy.

   Click in the **Add domains** box, enter a domain value, and then press the ENTER key or select the value displayed below the box. To remove a domain from the box and start over, select :::image type="icon" source="media/m365-cc-sc-remove-selection-icon.png" border="false"::: next to the domain. When you're ready to add the domain, select **Add**. Repeat this step as many times as necessary.

   The domains you added are listed on the page. To remove the domain, select :::image type="icon" source="media/m365-cc-sc-remove-selection-icon.png" border="false"::: next to the value.

   The domains you added are listed on the page. To remove a domain, select :::image type="icon" source="media/m365-cc-sc-close-icon.png" border="false"::: next to the entry.

   To remove an existing entry from the list, select :::image type="icon" source="media/m365-cc-sc-remove-icon.png" border="false"::: next to the entry.

   When you're finished on the **Add domains to flag when impersonated by attackers**, select **Next**.

8. On the **Add trusted email addresses and domains to not flag as impersonation** page, enter the sender email addresses and domains that you to exclude from impersonation protection. Messages from these senders are never flagged as an impersonation attack, but the senders are still subject to scanning by other filters in Microsoft 365 and Defender for Office 365.

   > [!NOTE]
   > Trusted domain entries don't include subdomains of the specified domain. You need to add an entry for each subdomain.

   Enter the email address or domain in the box, and then press the ENTER key or select the value displayed below the box. To remove a value from the box and start over, select :::image type="icon" source="media/m365-cc-sc-remove-selection-icon.png" border="false"::: next to the value. When you're ready to add the user or domain, select **Add**. Repeat this step as many times as necessary.

   The users and domains you added are listed on the page by **Name** and **Type**. To remove an entry, select :::image type="icon" source="media/m365-cc-sc-close-icon.png" border="false"::: next to the entry.

   When you're finished on the **Add trusted email addresses and domains to not flag as impersonation** page, select **Next**.

9. On the **Review and confirm your changes** page, review your settings. You can select **Back** or the specific page in the wizard to modify the settings.

   When you're finished on the **Review and confirm your changes** page, select **Confirm**.

10. On the **Standard protection updated** or **Strict protection updated** page, select **Done**.

## Use the Microsoft Defender portal to modify the assignments of Standard and Strict preset security policies

The steps to modify the assignment of the **Standard protection** or **Strict protection** preset security policy are the same as when you initially [assigned the preset security policies to users](#use-the-microsoft-defender-portal-to-assign-standard-and-strict-preset-security-policies-to-users).

To disable the **Standard protection** or **Strict protection** preset security policies while still preserving the existing conditions and exceptions, slide the toggle to :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**. To enable the policies, slide the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

## Use the Microsoft Defender portal to add exclusions to the Built-in protection preset security policy

> [!TIP]
> The **Built-in protection** preset security policy is applied to all users in organizations with any number of licenses for Defender for Office 365. Application of this protection is in the spirit of securing the broadest set of users until admins specifically configure Defender for Office 365 protections. Because **Built-in protection** is enabled by default, customers don't need to worry about violating product licensing terms. However, we recommend purchasing enough Defender for Office 365 licenses to ensure **Built-in protection** continues for all users.
>
> <u>The **Built-in protection** preset security policy doesn't affect recipients who are defined in the **Standard** or **Strict** preset security policies, or in custom Safe Links or Safe Attachments policies</u>. Therefore, we typically don't recommend exceptions to the **Built-in protection** preset security policy, unless you want to exclude users who aren't eligible for Safe Links and Safe Attachments protections (users who lack Defender for Office 365 licenses).

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Email & Collaboration** \> **Policies & Rules** \> **Threat policies** \> **Preset Security Policies** in the **Templated policies** section. Or, to go directly to the **Preset security policies** page, use <https://security.microsoft.com/presetSecurityPolicies>.

2. On the **Preset security policies** page, select **Add exclusions (not recommended)** in the **Built-in protection** section.

3. In the **Exclude from Built-in protection** flyout that opens, identify the internal recipients that are excluded from the built-in Safe Links and Safe Attachments protection:
   - **Users**
   - **Groups**:
       - Members of the specified distribution groups or mail-enabled security groups (dynamic distribution groups aren't supported).
       - The specified Microsoft 365 Groups.
   - **Domains**

   Click in the appropriate box, start typing a value, and then select the value displayed below the box. Repeat this process as many times as necessary. To remove an existing value, select :::image type="icon" source="media/m365-cc-sc-remove-selection-icon.png" border="false"::: next to the value.

   For users or groups, you can use most identifiers (name, display name, alias, email address, account name, etc.), but the corresponding display name is shown in the results. For users, enter an asterisk (\*) by itself to see all available values.

   You can use an exception only once, but the exception can contain multiple values:

   - Multiple **values** of the **same exception** use OR logic (for example, _\<recipient1\>_ or _\<recipient2\>_). If the recipient matches **any** of the specified values, the policy isn't applied to them.
   - Different **types of exceptions** use OR logic (for example, _\<recipient1\>_ or _\<member of group1\>_ or _\<member of domain1\>_). If the recipient matches **any** of the specified exception values, the policy isn't applied to them.

4. When you're finished in the **Exclude from Built-in protection** flyout, select **Save**.

## How do you know these procedures worked?

To verify you successfully assigned the **Standard protection** or **Strict protection** security policy to a user, use a protection setting where the default value is different than the **Standard protection** setting, which is different that the **Strict protection** setting.

For example, for email identified as spam (not high confidence spam) verify that the message is delivered to the Junk Email folder for **Standard protection** users, and quarantined for **Strict protection** users.

Or, for [bulk mail](anti-spam-bulk-complaint-level-bcl-about.md), verify that the BCL value 6 or higher delivers the message to the Junk Email folder for **Standard protection** users, and the BCL value 5 or higher quarantines the message for **Strict protection** users.

## Preset security policies in Exchange Online PowerShell

In PowerShell, preset security policies consist of the following elements:

- **Individual threat policies**: For example, anti-malware policies, anti-spam policies, anti-phishing policies, Safe Links policies, and Safe Attachments policies. These policies are visible using the standard policy management cmdlets in [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell):
  - <u>Default email protections for cloud mailboxes</u>:
    - **[Get-AntiPhishPolicy](/powershell/module/exchange/get-antiphishpolicy)**
    - **[Get-HostedContentFilterPolicy](/powershell/module/exchange/get-hostedcontentfilterpolicy)** (anti-spam policies)
    - **[Get-MalwareFilterPolicy](/powershell/module/exchange/get-malwarefilterpolicy)**
  - <u>Defender for Office 365 protection</u>:
    - **[Get-SafeAttachmentPolicy](/powershell/module/exchange/get-safeattachmentpolicy)**
    - **[Get-SafeLinksPolicy](/powershell/module/exchange/get-safelinkspolicy)**

  > [!WARNING]
  > Don't attempt to create, modify, or remove the individual threat policies associated with preset security policies. The only supported method for creating the individual threat policies for Standard or Strict preset security policies is to turn on the preset security policy in the Microsoft Defender portal for the first time.

- **Rules**: Separate rules are used for the Standard preset security policy, the Strict preset security policy, and the Built-in protection preset security policy. The rules define the recipient conditions and exceptions for the policies (who the policies apply to). You manage these rules using the following cmdlets in [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell):
  - <u>Rules for default email protections for cloud mailboxes</u>:
    - **[Disable-EOPProtectionPolicyRule](/powershell/module/exchange/disable-eopprotectionpolicyrule)**
    - **[Enable-EOPProtectionPolicyRule](/powershell/module/exchange/enable-eopprotectionpolicyrule)**
    - **[Get-EOPProtectionPolicyRule](/powershell/module/exchange/get-eopprotectionpolicyrule)**
    - **[New-EOPProtectionPolicyRule](/powershell/module/exchange/new-eopprotectionpolicyrule)**
    - **[Set-EOPProtectionPolicyRule](/powershell/module/exchange/set-eopprotectionpolicyrule)**
  - <u>Rules for Defender for Office 365 protections</u>:
    - **[Disable-ATPProtectionPolicyRule](/powershell/module/exchange/disable-atpprotectionpolicyrule)**
    - **[Enable-ATPProtectionPolicyRule](/powershell/module/exchange/enable-atpprotectionpolicyrule)**
    - **[Get-ATPProtectionPolicyRule](/powershell/module/exchange/get-atpprotectionpolicyrule)**
    - **[New-ATPProtectionPolicyRule](/powershell/module/exchange/new-atpprotectionpolicyrule)**
    - **[Set-ATPProtectionPolicyRule](/powershell/module/exchange/set-atpprotectionpolicyrule)**
  - <u>The rule for the Build-in protection preset security policy</u>:
    - **[Get-ATPBuiltInProtectionRule](/powershell/module/exchange/get-atpbuiltinprotectionrule)**
    - **[New-ATPBuiltInProtectionRule](/powershell/module/exchange/new-atpbuiltinprotectionrule)**
    - **[Set-ATPBuiltInProtectionRule](/powershell/module/exchange/set-atpbuiltinprotectionrule)**

  For the Standard and Strict preset security policies, these rules are created the first time you turn on the preset security policy in the Microsoft Defender portal. If you never turned on the preset security policy, the associated rules don't exist. Turning off the preset security policy doesn't delete the associated rules.

The following sections describe how to use these cmdlets in **supported scenarios**.

To connect to Exchange Online PowerShell, see [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell).

<a name='use-powershell-to-view-individual-security-policies-for-preset-security-policies'></a>

### Use PowerShell to view individual threat policies in preset security policies

Remember, if you never turned on the Standard preset security policy or the Strict preset security policy in the Microsoft Defender portal, the associated threat policies for the preset security policy don't exist.

- **Built-in protection preset security policy**: The associated policies are named Built-In Protection Policy. The IsBuiltInProtection property value is True for these policies.

  To view the individual threat policies for the Built-in protection preset security policy, run the following command:

  ```powershell
  Write-Output -InputObject ("`r`n"*3),"Built-in protection Safe Attachments policy",("-"*79);Get-SafeAttachmentPolicy -Identity "Built-In Protection Policy" | Format-List; Write-Output -InputObject ("`r`n"*3),"Built-in protection Safe Links policy",("-"*79);Get-SafeLinksPolicy -Identity "Built-In Protection Policy" | Format-List
  ```

- **Standard preset security policy**: The associated threat policies are named `Standard Preset Security Policy<13-digit number>`. For example, `Standard Preset Security Policy1622650008019`. The RecommendPolicyType property value for the policies is Standard.

  - To view the individual threat policies for the Standard preset security policy in organizations with **the default email protections for cloud mailboxes only**, run the following command:

    ```powershell
    Write-Output -InputObject ("`r`n"*3),"Standard anti-malware policy",("-"*79);Get-MalwareFilterPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Standard"; Write-Output -InputObject ("`r`n"*3),"Standard anti-spam policy",("-"*79);Get-HostedContentFilterPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Standard"; Write-Output -InputObject ("`r`n"*3),"Standard anti-phishing policy",("-"*79);Get-AntiPhishPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Standard"
    ```

  - To view the individual threat policies for the Standard preset security policy in organizations with **Defender for Office 365**, run the following command:

    ```powershell
    Write-Output -InputObject ("`r`n"*3),"Standard anti-malware policy",("-"*79);Get-MalwareFilterPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Standard"; Write-Output -InputObject ("`r`n"*3),"Standard anti-spam policy",("-"*79);Get-HostedContentFilterPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Standard"; Write-Output -InputObject ("`r`n"*3),"Standard anti-phishing policy",("-"*79);Get-AntiPhishPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Standard"; Write-Output -InputObject ("`r`n"*3),"Standard Safe Attachments policy",("-"*79);Get-SafeAttachmentPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Standard"; Write-Output -InputObject ("`r`n"*3),"Standard Safe Links policy",("-"*79);Get-SafeLinksPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Standard"
    ```

- **Strict preset security policy**: The associated threat policies are named `Strict Preset Security Policy<13-digit number>`. For example, `Strict Preset Security Policy1642034872546`. The RecommendPolicyType property value for the policies is Strict.

  - To view the individual threat policies for the Strict preset security policy in organizations with **the default email protections for cloud mailboxes only**, run the following command:

    ```powershell
    Write-Output -InputObject ("`r`n"*3),"Strict anti-malware policy",("-"*79);Get-MalwareFilterPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Strict"; Write-Output -InputObject ("`r`n"*3),"Strict anti-spam policy",("-"*79);Get-HostedContentFilterPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Strict"; Write-Output -InputObject ("`r`n"*3),"Strict anti-phishing policy",("-"*79);Get-AntiPhishPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Strict"
    ```

  - To view the individual threat policies for the Strict preset security policy in organizations with **Defender for Office 365**, run the following command:

    ```powershell
    Write-Output -InputObject ("`r`n"*3),"Strict anti-malware policy",("-"*79);Get-MalwareFilterPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Strict"; Write-Output -InputObject ("`r`n"*3),"Strict anti-spam policy",("-"*79);Get-HostedContentFilterPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Strict"; Write-Output -InputObject ("`r`n"*3),"Strict anti-phishing policy",("-"*79);Get-AntiPhishPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Strict"; Write-Output -InputObject ("`r`n"*3),"Strict Safe Attachments policy",("-"*79);Get-SafeAttachmentPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Strict"; Write-Output -InputObject ("`r`n"*3),"Strict Safe Links policy",("-"*79);Get-SafeLinksPolicy | Where-Object -Property RecommendedPolicyType -eq -Value "Strict"
    ```

### Use PowerShell to view rules for preset security policies

Remember, if you never turned on the Standard preset security policy or the Strict preset security policy in the Microsoft Defender portal, the associated rules for those policies don't exist.

- **Built-in protection preset security policy**: There's only one rule named ATP Built-In Protection Rule.

  To view the rule associated with the Built-in protection preset security policy, run the following command:

  ```powershell
  Get-ATPBuiltInProtectionRule
  ```

- **Standard preset security policy**: The associated rules are named Standard Preset Security Policy.

  Use the following commands to view the rules that are associated with the Standard preset security policy:

  - To view the rule associated with **the default email protections for cloud mailboxes** in the Standard preset security policy, run the following command:

    ```powershell
    Get-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy"
    ```

  - To view the rule associated with **Defender for Office 365 protections** in the Standard preset security policy, run the following command:

    ```powershell
    Get-ATPProtectionPolicyRule -Identity "Standard Preset Security Policy"
    ```

  - To view **both rules** at the same time, run the following command:

    ```powershell
    Write-Output -InputObject ("`r`n"*3),"EOP rule - Standard preset security policy",("-"*79);Get-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy"; Write-Output -InputObject ("`r`n"*3),"Defender for Office 365 rule - Standard preset security policy",("-"*79);Get-ATPProtectionPolicyRule -Identity "Standard Preset Security Policy"
    ```

- **Strict preset security policy**: The associated rules are named Strict Preset Security Policy.

  Use the following commands to view the rules that are associated with the Strict preset security policy:

  - To view the rule associated with **the default email protections for cloud mailboxes** in the Strict preset security policy, run the following command:

    ```powershell
    Get-EOPProtectionPolicyRule -Identity "Strict Preset Security Policy"
    ```

  - To view the rule associated with **Defender for Office 365 protections** in the Strict preset security policy, run the following command:

    ```powershell
    Get-ATPProtectionPolicyRule -Identity "Strict Preset Security Policy"
    ```

  - To view **both rules** at the same time, run the following command:

    ```powershell
    Write-Output -InputObject ("`r`n"*3),"EOP rule - Strict preset security policy",("-"*79);Get-EOPProtectionPolicyRule -Identity "Strict Preset Security Policy"; Write-Output -InputObject ("`r`n"*3),"Defender for Office 365 rule - Strict preset security policy",("-"*79);Get-ATPProtectionPolicyRule -Identity "Strict Preset Security Policy"
    ```

### Use PowerShell to turn on or turn off preset security policies

To turn on or turn off the Standard or Strict preset security policies in PowerShell, enable or disable the rules that are associated with policy. The State property value of the rule shows whether the rule is Enabled or Disabled.

If your organization has the default email protections for cloud mailboxes only, you disable or enable the rule for the default email protections.

If your organization has Defender for Office 365, you enable or disable the rule for the default email protections for cloud mailboxes **and** the rule for Defender for Office 365 protections (enable or disable both rules).

- **Organizations with the default email protections for cloud mailboxes only**:

  - Run the following command to determine whether the rules for the Standard and Strict preset security policies are currently enabled or disabled:

    ```powershell
    Write-Output -InputObject ("`r`n"*3),"EOP protection rule",("-"*50); Get-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy" | Format-Table Name,State; Write-Output -InputObject ("`r`n"*3),"EOP protection rule",("-"*50); Get-EOPProtectionPolicyRule -Identity "Strict Preset Security Policy" | Format-Table Name,State
    ```

  - Run the following command to turn off the Standard preset security policy:

    ```powershell
    Disable-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy"
    ```

  - Run the following command to turn off the Strict preset security policy:

    ```powershell
    Disable-EOPProtectionPolicyRule -Identity "Strict Preset Security Policy"
    ```

  - Run the following command to turn on the Standard preset security policy:

    ```powershell
    Enable-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy"
    ```

  - Run the following command to turn on the Strict preset security policy:

    ```powershell
    Enable-EOPProtectionPolicyRule -Identity "Strict Preset Security Policy"
    ```

- **Organizations with Defender for Office 365**:

  - Run the following command to determine whether the rules for the Standard and Strict preset security policies are currently enabled or disabled:

    ```powershell
    Write-Output -InputObject ("`r`n"*3),"EOP protection rule",("-"*50);Get-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy" | Format-Table Name,State; Write-Output -InputObject `r`n,"Defender for Office 365 protection rule",("-"*50);Get-ATPProtectionPolicyRule -Identity "Standard Preset Security Policy" | Format-Table Name,State; Write-Output -InputObject ("`r`n"*3),"EOP protection rule",("-"*50);Get-EOPProtectionPolicyRule -Identity "Strict Preset Security Policy" | Format-Table Name,State; Write-Output -InputObject `r`n,"Defender for Office 365 protection rule",("-"*50);Get-ATPProtectionPolicyRule -Identity "Strict Preset Security Policy" | Format-Table Name,State
    ```

  - Run the following command to turn off the Standard preset security policy:

    ```powershell
    Disable-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy"; Disable-ATPProtectionPolicyRule -Identity "Standard Preset Security Policy"
    ```

  - Run the following command to turn off the Strict preset security policy:

    ```powershell
    Disable-EOPProtectionPolicyRule -Identity "Strict Preset Security Policy"; Disable-ATPProtectionPolicyRule -Identity "Strict Preset Security Policy"
    ```

  - Run the following command to turn on the Standard preset security policy:

    ```powershell
    Enable-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy"; Enable-ATPProtectionPolicyRule -Identity "Standard Preset Security Policy"
    ```

  - Run the following command to turn on the Strict preset security policy:

    ```powershell
    Enable-EOPProtectionPolicyRule -Identity "Strict Preset Security Policy"; Enable-ATPProtectionPolicyRule -Identity "Strict Preset Security Policy"
    ```

### Use PowerShell to specify recipient conditions and exceptions for preset security policies

You can use a recipient condition or exception only once, but the condition or exception can contain multiple values:

- Multiple **values** of the **same condition or exception** use OR logic (for example, _\<recipient1\>_ or _\<recipient2\>_):
  - **Conditions**: If the recipient matches **any** of the specified values, the policy is applied to them.
  - **Exceptions**: If the recipient matches **any** of the specified values, the policy isn't applied to them.

- Different **types of exceptions** use OR logic (for example, _\<recipient1\>_ or _\<member of group1\>_ or _\<member of domain1\>_). If the recipient matches **any** of the specified exception values, the policy isn't applied to them.

- Different **types of conditions** use AND logic. The recipient must match **all** of the specified conditions for the policy to apply to them. For example, you configure a condition with the following values:
  - Users: `romain@contoso.com`
  - Groups: Executives

  The policy is applied to `romain@contoso.com` _only_ if he's also a member of the Executives group. Otherwise, the policy isn't applied to him.

For the Built-in protection preset security policy, you can specify only recipient exceptions. If all exception parameter values are empty (`$null`), there are no exceptions to the policy.

For the Standard and Strict preset security policies, you can specify recipient conditions and exceptions for the default email protections for cloud mailboxes and Defender for Office 365 protections. If all of conditions and exception parameter values are empty (`$null`), there are no recipient conditions or exceptions to the Standard or Strict preset security policies.

- **Built-in protection preset security policy**:

  Use the following syntax:

  ```powershell
  Set-ATPBuiltInProtectionRule -Identity "ATP Built-In Protection Rule" -ExceptIfRecipientDomainIs <"domain1","domain2",... | $null> -ExceptIfSentTo <"user1","user2",... | $null> -ExceptIfSentToMemberOf <"group1","group2",... | $null>
  ```

  This example removes all recipient exceptions from the Built-in protection preset security policy.

  ```powershell
  Set-ATPBuiltInProtectionRule -Identity "ATP Built-In Protection Rule" -ExceptIfRecipientDomainIs $null -ExceptIfSentTo $null -ExceptIfSentToMemberOf $null
  ```

  For detailed syntax and parameter information, see [Set-ATPBuiltInProtectionRule](/powershell/module/exchange/set-atpbuiltinprotectionrule).

- **Standard or Strict preset security policies**

  Use the following syntax:

  ```powershell
  <Set-EOPProtectionPolicyRule | SetAtpProtectionPolicyRule> -Identity "<Standard Preset Security Policy | Strict Preset Security Policy>" -SentTo <"user1","user2",... | $null> -ExceptIfSentTo <"user1","user2",... | $null> -SentToMemberOf <"group1","group2",... | $null> -ExceptIfSentToMemberOf <"group1","group2",... | $null> -RecipientDomainIs <"domain1","domain2",... | $null> -ExceptIfRecipientDomainIs <"domain1","domain2",... | $null>
  ```

  This example configures members of the Executives distribution group as exceptions from the default email protections for cloud mailboxes in the Standard preset security policy.

  ```powershell
  Set-EOPProtectionPolicyRule -Identity "Standard Preset Security Policy" -ExceptIfSentToMemberOf Executives
  ```

  This example configures the specified security operations (SecOps) mailboxes as exceptions from the Defender for Office 365 protections in the Standard preset security policy.

  ```powershell
  Set-ATPProtectionPolicyRule -Identity "Strict Preset Security Policy" -ExceptIfSentTo "SecOps1","SecOps2"
  ```

  For detailed syntax and parameter information, see [Set-EOPProtectionPolicyRule](/powershell/module/exchange/set-eopprotectionpolicyrule) and [Set-ATPProtectionPolicyRule](/powershell/module/exchange/Set-atpprotectionpolicyrule).

## Appendix

Preset security policies consist of the following elements:

- [Profiles](#profiles-in-preset-security-policies)
- [Policies](#policies-in-preset-security-policies)
- [Policy settings](#policy-settings-in-preset-security-policies)

These elements are described in the following sections.

In addition, it's important to understand how preset security policies fit in the [order of precedence](#order-of-precedence-for-preset-security-policies-and-other-threat-policies) with other policies.

### Profiles in preset security policies

A profile determines the level of protection. The following profiles are available for preset security policies:

- **Standard protection**: A baseline profile that's suitable for most users.
- **Strict protection**: A more aggressive profile for selected users (high value targets or priority users).
- **Built-in protection** (Microsoft Defender for Office 365 only): Effectively provides default threat policies for Safe Links and Safe Attachments only.

In general, the **Strict protection** profile tends to quarantine less harmful email (for example, bulk and spam) than the **Standard protection** profile, but many of the settings in both profiles are the same (in particular, for unquestionably harmful email like malware or phishing). For a comparison of the setting differences, see the tables in the next section.

Until you turn on the profiles and assign users to them, the Standard and Strict preset security policies are assigned to no one. In contrast, the Built-in protection preset security policy is assigned to all recipients by default, but you can configure exceptions.

> [!IMPORTANT]
> Unless you configure exceptions to the Built-in protection preset security policy, all recipients in the organization receive Safe Links and Safe Attachments protection.

### Policies in preset security policies

Preset security policies use special versions of the individual threat policies for default email protections for cloud mailboxes and for Microsoft Defender for Office 365. These policies are created _after_ you assign the **Standard protection** or **Strict protection** preset security policies to users.

- **Threat policies in the default email protections for cloud mailboxes**: These policies are in all organizations with cloud mailboxes:

  - [Anti-spam policies](anti-spam-policies-configure.md) named **Standard Preset Security Policy** and **Strict Preset Security Policy**.
  - [Anti-malware policies](anti-malware-policies-configure.md) named **Standard Preset Security Policy** and **Strict Preset Security Policy**.
  - [Anti-phishing policies for all cloud mailboxes (spoofing)](anti-phishing-policies-about.md#spoof-settings) named **Standard Preset Security Policy** and **Strict Preset Security Policy** (spoof settings).

  > [!NOTE]
  > Outbound spam policies aren't part of preset security policies. The default outbound spam policy automatically protects members of preset security policies. Or, you can create custom outbound spam policies to customize the protection for members of preset security policies. For more information, see [Configure outbound spam filtering](outbound-spam-policies-configure.md).

- **Threat policies in Microsoft Defender for Office 365**: These policies are in organizations with Microsoft 365 E5 or Defender for Office 365 add-on subscriptions:
  - Anti-phishing policies in Defender for Office 365 named **Standard Preset Security Policy** and **Strict Preset Security Policy**, which include:
    - The same [spoof settings](anti-phishing-policies-about.md#spoof-settings) that are available in the anti-phishing policies for all cloud mailboxes.
    - [Impersonation settings](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365)
    - [Phishing email thresholds](anti-phishing-policies-about.md#phishing-email-thresholds-in-anti-phishing-policies-in-microsoft-defender-for-office-365)
  - [Safe Links policies](safe-links-policies-configure.md) named **Standard Preset Security Policy**, **Strict Preset Security Policy**, and **Built-in Protection Policy**.
  - [Safe Attachments policies](safe-attachments-policies-configure.md) named **Standard Preset Security Policy**, **Strict Preset Security Policy**, and **Built-in Protection Policy**.

As previously described, you can apply default email protections to different users than Defender for Office 365 protections, or you can all protections to the same recipients.

### Policy settings in preset security policies

You can't modify the individual threat policies in the preset security protection profiles. Threat policies associated with the Standard or Strict preset security policies are _always_ applied before default or custom threat policies, and Strict policies are _always_ applied before Standard policies as described in the [Order of precedence](#order-of-precedence-for-preset-security-policies-and-other-threat-policies) section in this article

- The Standard, Strict, and Built-in protection threat policy settings, including the associated [quarantine policies](quarantine-policies.md#anatomy-of-a-quarantine-policy), are listed in the feature tables in [Recommended email and collaboration threat policy settings for cloud organizations](recommended-settings-for-eop-and-office365.md).
- You can also use Exchange Online PowerShell to quickly see all of the policy setting values as explained [earlier in this article](#use-powershell-to-view-individual-threat-policies-in-preset-security-policies).

But, you need to configure the individual users (senders) and domains to receive [impersonation protection](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365) in Defender for Office 365. Otherwise, preset security policies automatically configure the following types of impersonation protection:

- Domain impersonation protection for all domains that you own ([accepted domains](/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains)).
- [Mailbox intelligence protection (contact graph)](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365).

The differences in meaningful policy settings in the Standard preset security policy and the Strict preset security policy are summarized in the following table:

|&nbsp;|Standard|Strict|
|---|:---:|:---:|
|**Anti-malware policy**|No difference|No difference|
|**Anti-spam policy**|||
|&nbsp;&nbsp;**Bulk compliant level (BCL) met or exceeded** detection action (_BulkSpamAction_)|**Move message to Junk Email folder** (`MoveToJmf`)|**Quarantine message** (`Quarantine`)|
|&nbsp;&nbsp;**Bulk email threshold** (_BulkThreshold_)|6|5|
|&nbsp;&nbsp;**Spam** detection action (_SpamAction_)|**Move message to Junk Email folder** (`MoveToJmf`)|**Quarantine message** (`Quarantine`)|
|**Anti-phishing policy**|||
|&nbsp;&nbsp;**If the message is detected as spoof by spoof intelligence** (_AuthenticationFailAction_)|**Move message to Junk Email folder** (`MoveToJmf`)|**Quarantine message** (`Quarantine`)|
|**Show first contact safety tip** (_EnableFirstContactSafetyTips_)|Selected (`$true`)|Selected (`$true`)|
|&nbsp;&nbsp;**If mailbox intelligence detects an impersonated user** (_MailboxIntelligenceProtectionAction_)|**Move message to Junk Email folder** (`MoveToJmf`)|**Quarantine message** (`Quarantine`)|
|&nbsp;&nbsp;**Phishing email threshold** (_PhishThresholdLevel_)|**3 - More aggressive** (`3`)|**4 - Most aggressive** (`4`)|
|**Safe Attachments policy**|No difference|No difference|
|**Safe Links policy**|No difference|No difference|

The differences in Safe Attachments and Safe Links settings in the Built-in protection, Standard, and Strict preset security policies are summarized in the following table:

|&nbsp;|Built-in protection|Standard and Strict|
|---|:---:|:---:|
|**Safe Attachments policy**|No difference|No difference|
|**Safe Links policy**|||
|&nbsp;&nbsp;**Let users click through to the original URL** (_AllowClickThrough_)|Selected (`$true`)|Not selected (`$false`)|
|&nbsp;&nbsp;**Do not rewrite URLs, do checks via Safe Links API only** (_DisableURLRewrite_)|Selected (`$true`)|Not selected (`$false`)|
|&nbsp;&nbsp;**Apply Safe Links to email messages sent within the organization** (_EnableForInternalSenders_)|Not selected (`$false`)|Selected (`$true`)|

For details about these settings, see the feature tables in [Recommended email and collaboration threat policy settings for cloud organizations](recommended-settings-for-eop-and-office365.md).

<a name='order-of-precedence-for-preset-security-policies-and-other-policies'></a>

### Order of precedence for preset security policies and other threat policies

When a recipient is defined in multiple policies, the policies are applied in the following order:

1. The Strict preset security policy.
2. The Standard preset security policy.
3. [Defender for Office 365 evaluation policies](try-microsoft-defender-for-office-365.md#audit-mode-vs-blocking-mode-for-defender-for-office-365)
4. Custom threat policies based on the priority of the policy (a lower number indicates a higher priority).
5. The Built-in protection preset security policy for Safe Links and Safe Attachments; the default threat policies for anti-malware, anti-spam, and anti-phishing.

This order is shown on the pages of the individual threat policies in the Defender portal (policies are applied in the order shown on the page).

For example, an admin configures the Standard preset security policy and a custom anti-spam policy with the same recipients. The anti-spam policy settings from the Standard preset security policy are applied to the users instead of the settings in the custom anti-spam policy or the default anti-spam policy.

Consider applying the Standard or Strict preset security policies to a subset of users, and apply custom threat policies to other users in your organization. To meet this requirement, consider the following methods:

- Use unambiguous groups or lists of recipients in the Standard preset security policy, the Strict preset security, and in custom threat policies so exceptions aren't required. Using this method, you don't need to account for multiple policies applying to the same users and the effects of the order of precedence.
- If you can't avoid multiple policies applying to the same users, use the following strategies:
  - Configure recipients who should get the settings of the **Standard** preset security policy and custom threat policies as exceptions in the **Strict** preset security policy.
  - Configure recipients who should get the settings of custom threat policies as exceptions in the **Standard** preset security policy.
  - Configure recipients who should get the settings of the Built-in protection preset security policy or default threat policies as exceptions to custom threat policies.

The **Built-in protection** preset security policy doesn't affect recipients in existing Safe Links or Safe Attachments policies. If you already configured **Standard protection**, **Strict protection**, custom Safe Links policies, or custom Safe Attachments policies, those policies are _always_ applied _before_ **Built-in protection**.

For more information, see [Order and precedence of email protection](how-policies-and-protections-are-combined.md).
