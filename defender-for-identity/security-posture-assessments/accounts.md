---
title: 'Accounts security posture assessment'
description: This article lists all security assessments for accounts. 
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 09/15/2025
ms.reviewer: LiorShapiraa
---

# Accounts security posture assessments 

This article lists all security assessments for accounts.

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours.  While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.
>


## Accounts with non-default Primary Group ID

This recommendation lists all computers and users accounts whose primaryGroupId (PGID) attribute is not the default for domain users and computers in Active Directory.

### Why are accounts with non-default primary group ID a risk?

The primaryGroupId attribute of a user or computer account grants implicit membership to a group. Membership through this attribute does not appear in the list of group members in some interfaces. This attribute may be used as an attempt to hide group membership. It might be a stealthy way for an attacker to escalate privileges without triggering normal auditing for group membership changes. 

### Remediation steps 

1. Review the list of exposed entities to discover which of your accounts have a suspicious primaryGroupId.  

1. Take appropriate action on those accounts by resetting their attribute to their default values or adding the member to the relevant group:  

  - User accounts: 513 (Domain Users) or 514 (Domain Guests);  
    
  - Computer accounts: 515 (Domain Computers);  
  
  - Domain controller accounts: 516 (Domain Controllers);  
  
  - Read-only domain controller (RODC) accounts: 521 (Read-only Domain Controllers).


###  Remove access rights on suspicious accounts with the Admin SDHolder permission

This article describes the **Remove access rights on suspicious accounts with the Admin SDHolder permission** security assessment, which highlights risky access rights on suspicious accounts.

## Why might the Admin SDHolder permission be risky?

Having non-sensitive accounts with **Admin SDHolder** (security descriptor holder) permissions can have significant security implications, including:

- Leading to unauthorized privilege escalation, where attackers can exploit these accounts to gain administrative access and compromise sensitive systems or data
- Increasing the attack surface, making it harder to track and mitigate security incidents, potentially exposing the organization to greater risks.

### Remediation steps

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for **Remove access rights on suspicious accounts with the Admin SDHolder permission**.

    For example:

    :::image type="content" source="../media/secure-score/remove-suspicious-access-rights.png" alt-text="Screenshot of the Admin SDHolder security assessment.":::


1. Review the list of exposed entities to discover which of your non-sensitive accounts have the **Admin SDHolder** permission.

1. Take appropriate action on those entities by removing their privileged access rights. For example:

    1. Use the **ADSI Edit** tool to connect to your domain controller.
    1. Browse to the **CN=System**> **CN=AdminSDHolder** container and open the **CN=AdminSDHolder** container properties.
    1. Select the **Security** tab > **Advanced**, and remove any non-sensitive entities. These are the entities marked as exposed in the security assessment.

    For more information, see [Active Directory Service Interfaces](/windows/win32/adsi/active-directory-service-interfaces-adsi) and [ADSI Edit](/previous-versions/windows/it-pro/windows-server-2003/cc773354(v=ws.10)) documentation

To achieve the full score, remediate all exposed entities.


## Change password for krbtgt account

This recommendation lists any krbtgt account within your environment with password last set over 180 days ago.

### Why is the krbtgt account a risk?

The krbtgt account in Active Directory is a built-in account used by the Kerberos authentication service. It encrypts and signs all Kerberos tickets, enabling secure authentication within the domain. The account cannot be deleted, and securing it is crucial, as compromise could allow attackers to forge authentication tickets.  
If the KRBTGT account's password is compromised, an attacker can use its hash to generate valid Kerberos authentication tickets, allowing them to perform Golden Ticket attacks and gain access to any resource in the AD domain. Since Kerberos relies on the KRBTGT password to sign all tickets, closely monitoring and regularly changing this password is essential to mitigating the risk of such attacks.

### Remediation steps

1. Review the list of exposed entities to discover which of your krbtgt accounts have an old password. 

1. Take appropriate action on those accounts by resetting their password **twice** to invalidate the Golden Ticket attack. 

> [!NOTE]
> The krbtgt Kerberos account in all Active Directory domains supports key storage in all Kerberos Key Distribution Centers (KDC). To renew the Kerberos keys for TGT encryption, periodically change the krbtgt account password. It is recommended to use the [Microsoft-provided script.](https://github.com/microsoft/New-KrbtgtKeys.ps1)  
> When resetting the password twice, wait at least 10 hours between resets to avoid Kerberos authentication issues. This wait time is enforced by the script and aligns with best practices.

## Change password of built-in domain Administrator account

This recommendation lists any built-in domain Administrator accounts within your environment with password last set over 180 days ago. 

### Organization risk

The built-in domain Administrator account is a default, highly privileged AD account with full control over the domain. It cannot be deleted, has unrestricted access, and is critical for managing the domain's resources.

Regularly updating the built-in Administrator account's password is essential due to its high privileges, which make it a prime target for attackers. If compromised, it can grant unauthorized control over the domain. Since this account is often unused and its password may not be updated frequently, regular changes reduce exposure and enhance security. 

### Remediation steps 

1. Review the list of exposed entities to discover which of your built-in domain Administrator accounts have an old password.  

1. Take appropriate action on those accounts by resetting their password.  

   For example:

:::image type="content" source="../media/change-password-domain-administrator-account/screenshot-of-report.png" alt-text="Screenshot that shows the security posture assessment for Change password for built-in domain Administrator accounts.":::


## Dormant entities in sensitive groups

### What are sensitive dormant entities?

Microsoft Defender for Identity discovers if particular users are **sensitive** along with providing attributes that surface if they are inactive, disabled, or expired.

However, **Sensitive** accounts can also become *dormant* if they are not used for a period of 180 days. Dormant sensitive entities are targets of opportunity for malicious actors to gain sensitive access to your organization. 

For more information, see [Defender for Identity entity tags in Microsoft Defender XDR](../entity-tags.md#default-sensitive-entities).

### What risk do dormant entities create in sensitive groups?

Organizations that fail to secure their dormant user accounts leave the door unlocked to their sensitive data safe.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. An easy and quiet path deep into your organization is through **sensitive** user and service accounts that are no longer in use.

It doesn't matter if the cause is employee turnover or resource mismanagement -skipping this step leaves your organization's most sensitive entities vulnerable and exposed.

### Remediation steps

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your sensitive accounts are dormant.

    :::image type="content" source="../media/cas-isp-dormant-entities-sensitive-groups-1.png" alt-text="Screenshot that shows improvement actions for Remove dormant accounts from sensitive groups.":::


1. Take appropriate action on those user accounts by removing their privileged access rights or by deleting the account.

## Remove non-admin accounts with DCSync permissions

This article describes the **Remove non-admin accounts with DCSync permissions** security assessment, which identifies risky DCSync permission settings.

### Why might the DCSync permission be a risk?

Accounts with the DCSync permission can initiate domain replication. Attackers can potentially exploit domain replication to gain unauthorized access, manipulate domain data, or compromise the integrity and availability of your Active Directory environment.

It's crucial to carefully manage and restrict the membership of this group to ensure the security and integrity of your domain replication process.

### Remediation steps

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for **Remove non-admin accounts with DCSync permissions**.

    For example:

    :::image type="content" source="../media/secure-score/dcsync-permissions.png" alt-text="Screenshot of the Remove non-admin accounts with DCSync permissions security assessment." lightbox="media/secure-score/dcsync-permissions.png":::


1. Review this list of exposed entities to discover which of your accounts have DCSync permissions and are also nondomain admins.

1. Take appropriate action on those entities by removing their privileged access rights.

To achieve the maximum score, remediate all exposed entities.


## Security Assessment: Ensure privileged accounts are not delegated

This recommendation lists all privileged accounts that don't have the "not delegated" setting enabled, highlighting those potentially exposed to delegation-related risks. Privileged accounts are accounts that are being members of a privileged group such as Domain admins, Schema admins, and so on. 

### Organization risk

If the sensitive flag is disabled, attackers could exploit Kerberos delegation to misuse privileged account credentials, leading to unauthorized access, lateral movement, and potential network-wide security breaches. Setting the sensitive flag on privileged user accounts prevent users from gaining access to the account and manipulating system settings.   
For device accounts, setting them to "not delegated" is important to prevent it from being used in any delegation scenario, ensuring that credentials on this machine can't be forwarded to access other services.

### Remediation steps

1. Review the list of exposed entities to discover which of your privileged accounts don’t have the configuration flag "this account is sensitive and cannot be delegated."

1. Take appropriate action on those accounts:

- For user accounts: by setting the account's control flags to "this account is sensitive and cannot be delegated." Under the Account tab, select the check box to this flag in the Account Options section. This prevents users from gaining access to the account and manipulating system settings.    

    :::image type="content" source="../media/ensure-privileged-accounts-with-sensitive-flag/administrator-properties.png" alt-text="Screenshot of the user profile.":::

- For device accounts:  
The safest approach is to use a PowerShell script to configure the device to prevent it from being used in any delegation scenario, ensuring that credentials on this machine can't be forwarded to access other services.

  ```
  $name = "ComputerA" 
  Get-ADComputer -Identity $name |
  Set-ADAccountControl -AccountNotDelegated:$true
  ```
  Another option is to set the `UserAccountControl` attribute to `NOT_DELEGATED = 0x100000` under the Attribute Editor tab for the exposed device.   
  
  For example:  

    :::image type="content" source="../media/ensure-privileged-accounts-with-sensitive-flag/device-profile.png" alt-text="Screenshot of the device profile.":::

## Security assessment: Entities exposing credentials in clear text

### What information does the prevent clear text security assessment provide?

This security assessment monitors your traffic for any entities exposing credentials in clear text and alerts you to the current exposure risks (most impacted entities) in your organization with suggested remediation.

### Why is clear text credential exposure risky?

Entities exposing credentials in clear text are risky not only for the exposed entity in question, but for your entire organization.

The increased risk is because unsecure traffic such as LDAP simple-bind is highly susceptible to interception by attacker-in-the-middle attacks. These types of attacks result in malicious activities including credential exposure, in which an attacker can leverage credentials for malicious purposes.

### Remediation steps

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions>.

    :::image type="content" source="../media/cas-isp-clear-text-1.png" alt-text="Prevent clear text credentials exposure.":::

    :::image type="content" source="../media/cas-isp-clear-text-2.png" alt-text="Review top impacted entities and create an action plan.":::

1. Research why those entities are using LDAP in clear text.
1. Remediate the issues and stop the exposure.
1. After confirming remediation, we recommend you require domain controller level LDAP signing. To learn more about LDAP server signing, see [Domain controller LDAP server signing requirements](/windows/security/threat-protection/security-policy-settings/domain-controller-ldap-server-signing-requirements).

> [!NOTE]
> This assessment is updated in near real time.
> The reports show the affected entities from the last 30 days. After that time, entities no longer affected will be removed from the exposed entities list.

## Security assessment: Microsoft LAPS usage

### What is Microsoft LAPS?

Microsoft's "Local Administrator Password Solution" (LAPS) provides management of local administrator account passwords for domain-joined computers. Passwords are randomized and stored in Active Directory (AD), protected by ACLs, so only eligible users can read it or request its reset.

This security assessment supports [legacy Microsoft LAPS](https://www.microsoft.com/en-us/download/details.aspx?id=46899) and [Windows LAPS](/windows-server/identity/laps/laps-overview).

### What risk does not implement LAPS pose to an organization?

LAPS provides a solution to the issue of using a common local account with an identical password on every computer in a domain. LAPS resolves this issue by setting a different, rotated random password for the common local administrator account on every computer in the domain.

LAPS simplifies password management while helping customers implement more recommended defenses against cyberattacks. In particular, the solution mitigates the risk of lateral escalation that results when customers use the same administrative local account and password combination on their computers. LAPS stores the password for each computer's local administrator account in AD, secured in a confidential attribute in the computer's corresponding AD object. The computer can update its own password data in AD, and domain administrators can grant read access to authorized users or groups, such as workstation helpdesk administrators.

> [!NOTE]
> In some cases, [Microsoft Entra hybrid joined](/azure/active-directory/devices/concept-hybrid-join) machines may still appear in the security posture assessment even if LAPS is configured in Microsoft Entra ID. This can be due to how the policy is applied or how the device reports its state.
> If this occurs, we suggest reviewing the LAPS configuration in Microsoft Entra ID to confirm everything is set up as expected. You can find more details [here](https://techcommunity.microsoft.com/blog/microsoft-entra-blog/windows-local-administrator-password-solution-with-microsoft-entra-id-now-genera/3911999).

### How do I use this security assessment?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your domains have some (or all) compatible Windows devices that aren't protected by LAPS, or that haven't had their LAPS managed password changed in the last 60 days.

    :::image type="content" source="../media/cas-isp-laps-1.png" alt-text="Screenshot that shows which domains have devices unprotected by LAPS.":::

   
1. For domains that are partially protected, select the relevant row to view the list of devices not protected by LAPS in that domain.

   :::image type="content" source="../media/cas-isp-laps-2.png" alt-text="Screenshot that shows the list of devices not protected by LAPS in a selected domain.":::

1. Take appropriate action on those devices by downloading, installing, and configuring or troubleshooting [Microsoft LAPS](https://go.microsoft.com/fwlink/?linkid=2104282) or [Windows LAPS](/windows-server/identity/laps/laps-overview).

   :::image type="content" source="../media/laps-unprotected-devices.png" alt-text="Screenshot that shows the remediation steps for devices unprotected by LAPS.":::

## Security Assessment: Remove discoverable passwords in Active Directory account attributes (Preview)


### Why do discoverable passwords in Active Directory account attributes pose a risk?

Certain free-text attributes are often overlooked during hardening but are readable by any authenticated user in the domain. When credentials or clues are mistakenly stored in these attributes, attackers can abuse them to move laterally across the environment or escalate privileges.

Attackers seek low-friction paths to expand access. Exposed passwords in these attributes represent an easy win because:

- The attributes aren't access-restricted.

- They aren't monitored by default.

- They provide context attackers can exploit for lateral movement and privilege escalation.

Removing exposed credentials from these attributes reduces the risk of identity compromise and strengthens your organization’s security posture.


### How does Microsoft Defender for Identity detect discoverable passwords?

> [!NOTE] 
> Findings can include false positives. Always validate the results before taking action.

Microsoft Defender for Identity detects potential credential exposure in Active Directory by analyzing commonly used free-text attributes. This includes looking for common password formats, hints,  `'description'`, `'info'`, and `'adminComment'` fields, and other contextual clues that might suggest the presence of credential misuse. 
This recommendation uses GenAI-powered analysis of Active directory attributes to detect:

- Plaintext passwords or variations. For example, '`Password=Summer2025!'`

- Credential patterns, reset hints, or sensitive account information. 

- Other indicators suggesting operational misuse of directory fields. 

Detected matches are surfaced in **Secure Score** and the **Security Assessment report** for review and remediation.


### Remediation steps 

To address this security assessment, follow these steps:

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Remove discoverable passwords in Active Directory account attributes.
1. Review the exposed entries in the security report. Identify any field content that includes:

    - Cleartext passwords

    - Reset instructions or credential clues

    - Sensitive business or system information

1. Remove sensitive information from the listed attribute fields using standard directory management tools (for example, PowerShell or ADSI Edit).
1. Fully remove the sensitive information. Don’t just mask the value. Partial obfuscation (for example, P@ssw***) can still offer useful clues to attackers.

## Security Assessment: Remove Stale Service Accounts (Preview)

This recommendation lists Active Directory service accounts detected as stale within the past 90 days. 

### Why do stale service accounts pose a risk?

Unused service accounts create significant security risks, as some of them can carry elevated privileges. If attackers gain access, the result can be substantial damage. Stale service accounts might retain high or legacy permissions. When compromised, they provide attackers with discreet entry points into critical systems, granting far more access than a standard user account.

This exposure creates several risks:

- Unauthorized access to sensitive applications and data.

- Lateral movement across the network without detection.


### How do I use this security assessment to improve my organizational security posture? 

To use this security assessment effectively, follow these steps:

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions ](https://security.microsoft.com/securescore?viewid=actions) for Remove stale service account.

1. Review the list of exposed entities to discover which of your service accounts are stale and have not performed any login activity in the last 90 days.

1. Take appropriate actions on those entities by removing the service account. For example:

    - **Disable the account:** Prevent any usage by disabling the account identified as exposed.

    - **Monitor for impact:** Wait several weeks and monitor for operational issues, such as service disruptions or errors.

    - **Delete the account:** If no issues are observed, delete the account and fully remove its access.

## Security assessment: Riskiest lateral movement paths (LMP)

### What are Risky lateral movement paths?

Microsoft Defender for Identity continuously monitors your environment to identify **sensitive** accounts with the riskiest lateral movement paths that expose a security risk, and reports on these accounts to assist you in managing your environment. Paths are considered risky if they have three or more non-sensitive accounts that can expose the **sensitive** account to credential theft by malicious actors.

For more information about lateral movement paths, see:

- [Understand and investigate Lateral Movement Paths (LMPs) with Microsoft Defender for Identity](../understand-lateral-movement-paths.md)
- [MITRE ATT&CK Lateral Movement](https://attack.mitre.org/tactics/TA0008/)

### What risk do risky lateral movement paths pose?

Organizations that fail to secure their **sensitive** accounts leave the door unlocked for malicious actors.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. Sensitive accounts with risky lateral movement paths are windows of opportunities for attackers and can expose risks.

For example, the riskiest paths are more readily visible to attackers and, if compromised, can give an attacker access to your organization's most sensitive entities.

### Remediation steps

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your **sensitive** accounts have risky LMPs.

    :::image type="content" source="../media/cas-isp-riskiest-lmp-1.png" alt-text="Screenshot that shows the impacted entities and the actions to take to reduce lateral movement path risk to sensitive entities. ":::

1. Take appropriate action:
    - Remove the entity from the group as specified in the recommendation.
    - Remove the local administrator permissions for the entity from the device specified in the recommendation.

## Security assessment: Unsecure Kerberos delegation

### What is Kerberos delegation?

Kerberos delegation is a delegation setting that allows applications to request end-user access credentials to access resources on behalf of the originating user.

### What risk does unsecure Kerberos delegation pose to an organization?

Unsecure Kerberos delegation gives an entity the ability to impersonate you to any other chosen service. For example, imagine you have an IIS website, and the application pool account is configured with unconstrained delegation. The IIS website site also has Windows Authentication enabled, allowing native Kerberos authentication, and the site uses a back-end SQL Server for business data. With your Domain Admin account, you browse to the IIS website and authenticate to it. The website, using unconstrained delegation can get a service ticket from a domain controller to the SQL service, and do so in your name.

The main issue with Kerberos delegation is that you need to trust the application to always do the right thing. Malicious actors can instead force the application to do the wrong thing. If you are logged on as **domain admin**, the site can create a ticket to whatever other services it wishes, acting as you, the **domain admin**. For example, the site could choose a domain controller, and make changes to the **enterprise admin** group. Similarly, the site could acquire the hash of the KRBTGT account, or download an interesting file from your Human Resources department. The risk is clear and the possibilities with unsecure delegation are nearly endless.

The following is a description of the risk posed by different delegation types:

- **Unconstrained delegation**: Any service can be abused if one of their delegation entries is sensitive.
- **Constrained delegation**: Constrained entities can be abused if one of their delegation entries is sensitive.
- **Resource-based constrained delegation (RBCD)**: Resource-based constrained entities can be abused if the entity itself is sensitive.

### Remediation steps

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your non-domain controller entities are configured for **unsecure Kerberos delegation**.

    :::image type="content" source="../media/cas-isp-kerberos-delegation-2.png" alt-text="Screenshot that shows the Unsecure Kerberos delegation security assessment.":::

1. Take appropriate action on those at-risk users, such as removing their unconstrained attribute or changing it to a more secure constrained delegation.

1. Use the remediation appropriate to your delegation type. 
1. Disable delegation or use one of the following Kerberos constrained delegation (KCD) types:

**Unconstrained delegation**

  1. Select **Trust this computer for delegation to specified services only**.
      :::image type="content" source="../media/cas-isp-unconstrained-kerberos-1.png" alt-text="Screenshot that shows the option to trust this computer for delegation to specified services only.":::

1. Specify the **Services to which this account can present delegated credentials**.

**Constrained delegation**

Restricts which services this account can impersonate.

1. Review the sensitive users listed in the recommendations and remove them from the services to which the affected account can present delegated credentials.

    :::image type="content" source="../media/cas-isp-unconstrained-kerberos-2.png" alt-text="Screenshot that shows a list of exposed entities with the recommendation to modify unsecure kerberos delegation to prevent impersonation. ":::

**Resource-based constrained delegation (RBCD)**

Resource-based constrained delegation restricts which entities can impersonate this account.  Resource-based KCD is configured using PowerShell. 

1. You can use the [Set-ADComputer](/powershell/module/activedirectory/set-adcomputer) or [Set-ADUser](/powershell/module/activedirectory/set-aduser) cmdlets, depending on whether the impersonating account is a computer account or a user account / service account.

1. Review the sensitive users listed in the recommendations and remove them from the resource. For more information about configuring RBCD, see [Configure Kerberos constrained delegation (KCD) in Microsoft Entra Domain Services](/azure/active-directory-domain-services/deploy-kcd).


## Security assessment: Unsecure SID History attributes

### What is an unsecure SID History attribute?

SID History is an attribute that supports [migration scenarios](/previous-versions/windows/it-pro/windows-server-2003/cc779590(v=ws.10)). Every user account has an associated [Security IDentifier (SID)](/windows/win32/secauthz/security-identifiers) which is used to track the security principal and the access the account has when connecting to resources. SID History enables access for another account to effectively be cloned to another and is extremely useful to ensure users retain access when moved (migrated) from one domain to another.

The assessment checks for accounts with SID History attributes which Microsoft Defender for Identity profiles to be risky.

### What risk does unsecure SID History attribute pose?

Organizations that fail to secure their account attributes leave the door unlocked for malicious actors.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. Accounts configured with an unsecure SID History attribute are windows of opportunities for attackers and can expose risks.

For example, a non-sensitive account in a domain can contain the Enterprise Admin SID in its SID History from another domain in the Active Directory forest, thus "elevating" access for the user account to an effective Domain Admin in all domains in the forest. Also, if you have a forest trust without SID Filtering enabled (also called Quarantine), it's possible to inject a SID from another forest and it will be added to the user token when authenticated and used for access evaluations.

### Remediation steps

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your accounts have an unsecure SID History attribute.

    :::image type="content" source="../media/cas-isp-unsecure-sid-history-attribute-1.png" alt-text="Screenshot that shows improvement actions for Remove unsecure SID History attributes.":::

1. Take appropriate action to remove SID History attribute from the accounts using PowerShell using the following steps:

    1. Identify the SID in the SIDHistory attribute on the account.

        ```powershell
        Get-ADUser -Identity <account> -Properties SidHistory | Select-Object -ExpandProperty SIDHistory
        ```

    2. Remove the SIDHistory attribute using the SID identified earlier.

        ```powershell
        Set-ADUser -Identity <account> -Remove @{SIDHistory='S-1-5-21-...'}
        ```

## Unsecure account attributes

### What are unsecure account attributes?

Microsoft Defender for Identity continuously monitors your environment to identify accounts with attribute values that expose a security risk, and reports on these accounts to assist you in protecting your environment.

### What risk do unsecure account attributes pose?

Organizations that fail to secure their account attributes leave the door unlocked for malicious actors.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. Accounts configured with unsecure attributes are windows of opportunity for attackers and can expose risks.

For example, if the **PasswordNotRequired** attribute is enabled, an attacker can easily access the account. This is especially risky if the account has privileged access to other resources.

### Remediation steps

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your accounts have unsecure attributes.

    :::image type="content" source="../media/cas-isp-unsecure-account-attributes-1.png" alt-text="Screenshot that shows a list of unsecure account attributes that need to be resolved.":::

1. Take appropriate action on those user accounts by modifying or removing the relevant attributes.

1. Use the remediation appropriate to the relevant attribute as described in the following table: 

| Recommended action | Remediation | Reason |
| --- | --- | --- |
| Remove Do not require Kerberos preauthentication| Remove this setting from account properties in Active Directory (AD) | Removing this setting requires a Kerberos pre-authentication for the account resulting in improved security. |
| Remove Store password using reversible encryption | Remove this setting from account properties in AD | Removing this setting prevents easy decryption of the account's password. |
| Remove Password not required | Remove this setting from account properties in AD | Removing this setting requires a password to be used with the account and helps prevent unauthorized access to resources. |
| Remove Password stored with weak encryption | Reset the account password | Changing the account's password enables stronger encryption algorithms to be used for its protection. |
| Enable Kerberos AES encryption support | Enable AES features on the account properties in AD | Enabling AES128_CTS_HMAC_SHA1_96 or AES256_CTS_HMAC_SHA1_96 on the account helps prevent the use of weaker encryption ciphers for Kerberos authentication. |
| Remove Use Kerberos DES encryption types for this account | Remove this setting from account properties in AD | Removing this setting enables the use of stronger encryption algorithms for the account's password. |
| Remove a Service Principal Name (SPN) | Remove this setting from account properties in AD | When a user account is configured with an SPN set, it means that the account has been associated with one or more SPNs. This typically occurs when a service is installed or registered to run under a specific user account, and the SPN is created to uniquely identify the service workspace for Kerberos authentication. This recommendation only showed for sensitive accounts. |
|Reset password as SmartcardRequired setting was removed|Reset the account password|Changing the account's password after the SmartcardRequired UAC flag was removed ensures it was set under current security policies. This helps prevent potential exposure from passwords created when smartcard enforcement was still active.|

4. Use the **UserAccountControl** (UAC) flag to manipulate user account profiles. For more information, see:

    - [Windows Server troubleshooting](/troubleshoot/windows-server/identity/useraccountcontrol-manipulate-account-properties) documentation.
    - [User Properties - Account Section](/previous-versions/windows/it-pro/windows-server-2008-r2-and-2008/dd861342(v=ws.11))
    - [Introduction to Active Directory Administrative Center Enhancements (Level 100)](/windows-server/identity/ad-ds/get-started/adac/introduction-to-active-directory-administrative-center-enhancements--level-100-)
    - [Active Directory Administration Center](/previous-versions/windows/it-pro/windows-server-2008-r2-and-2008/dd871105(v=ws.11))

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
