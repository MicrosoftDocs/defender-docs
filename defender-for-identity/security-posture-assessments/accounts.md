---
title: 'Accounts security posture assessment'
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 11/11/2025
ms.reviewer: LiorShapiraa
description: Lists all Microsoft Defender for Identity security posture assessments for Active Directory accounts, with detailed impacts and remediation steps to help improve your Secure Score.
---

# Accounts security posture assessments 


> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status might still take time until it's marked as **Completed**.


## Remove stale Active Directory accounts (Preview)

**Description**

This recommendation lists any user accounts in Active Directory that are stale, meaning they haven't logged in at all during the past 90 days.

Excluded accounts:

- Service accounts
- Disabled or deleted accounts.

**User impact**

Stale accounts pose a security risk because they provide potential targets for attackers without being actively monitored. Compromised stale accounts can be used to gain unauthorized access, move laterally in the environment, or escalate privileges. Removing or disabling them reduces unnecessary exposure and strengthens overall security posture.

**Implementation**


1. Review the exposed entities to identify which stale user accounts haven't logged in for the past 90 days.

1. Disable the account if it's confirmed to be unused or remove it entirely according to your retention policy.

1. Disable and delete user accounts with no logons for 90 days after a monitoring period.

1. Remove accounts for former employees to prevent unauthorized access.


##  Microsoft Entra ID privileged user accounts that are also privileged in Active Directory (Preview)


**Description**

This recommendation lists any user accounts that have privileged roles in Microsoft Entra ID (such as Global Administrator) and are also members of highly privileged Active Directory groups (for example, Domain Admins, Enterprise Admins). These dual-privileged accounts significantly increase the organization’s attack surface.
 
> [!NOTE]
> Guests, external identities, and accounts not synchronized to Microsoft Entra ID are excluded from this report. Only accounts that are enabled and hold privileges in both Entra ID and Active Directory are included.


**User impact**

Accounts with privileges in both Microsoft Entra ID and Active Directory can be leveraged by attackers to gain full control over both cloud and on-premises environments. Compromise of a single account might allow lateral movement, privilege escalation, and access to sensitive resources across hybrid environments. Dual-privileged accounts are high-value targets and can accelerate attacks if not properly managed.

**Implementation**

1. Review the list of exposed entities to identify which accounts have privileged access in both Microsoft Entra ID and Active Directory.

1. Remediate the account by reducing privileges in one or both environments to enforce least privilege. Only retain dual privileges if necessary, and document justification.

1. Consider separating cloud and on-premises roles across different accounts or implementing just-in-time access to reduce standing exposure.

1. Use Microsoft Entra Privileged Identity Management (PIM) to enforce approval workflows and limit standing access for accounts that must retain elevated privileges.

For example:

- A user who is a Global Administrator in Microsoft Entra ID and a Domain Admin in Active Directory should have one of the roles reduced or replaced with delegated administrative access.

- If dual privileges are required for critical operations, enable MFA, monitor logins closely, and review memberships regularly.


## Identify service accounts in privileged groups


**Description**

Lists Active Directory service accounts within your environment that are members of privileged groups, including direct and nested membership.


**User impact**

Service accounts often have long-lived credentials and are used by applications, scripts, or automated tasks. When these accounts are members of highly privileged groups (for example, Domain Admins or Enterprise Admins), they increase the organization’s attack surface. Compromise of one of these accounts can grant an attacker broad administrative access to critical systems and data. Additionally, because service accounts aren't tied to a specific user and often lack interactive monitoring, malicious activity performed under these accounts might go unnoticed, delaying detection and response.

**Implementation**

1. Review the exposed entities to identify Active Directory service accounts that are members of privileged groups, such as Domain Admins, Enterprise Admins, or Administrators.

1. Remove the account from the privileged group if elevated access isn't required, or disable the account if it's unused.

For example:

- **Unused or decommissioned service account:** 
    - Disable the account in Active Directory after confirming no recent logons or dependencies. 

    - Monitor for a short period (7–14 days). If inactive, delete it according to your policy.

- **Active service account without need for admin rights:** 
    - Remove it from the privileged group as exposed on the report. 

    - Grant only the minimal required access through delegated permissions or scoped security groups. 

- **Replace legacy accounts:**

    - Migrate service accounts to Group Managed Service Accounts (gMSA) for automatic password rotation and reduced credential exposure. 

- **Accounts that must stay privileged**

    - Restrict where they can log on using the **Log on to** property.

    - Limit interactive logons via Group Policy and enable focused auditing for their activity.

    - Require ownership, documentation, and periodic review of the privileged membership.



## Locate accounts in built-in Operator Groups

**Description**

Lists Active Directory accounts (users, service accounts, and groups) that are members of built-in operator groups such as Server Operators, Backup Operators, Print Operators or Account Operators, including direct and indirect membership. These groups grant elevated privileges that can be used to compromise domain controllers or sensitive servers.


**User impact**

Operator groups provide broad control over servers, files, and system operations. Members of these groups can perform administrative actions such as stopping critical services, modifying files, or restoring data, which can be exploited to escalate privileges or gain persistence. Because these groups are rarely needed in modern environments, leaving accounts in them unnecessarily increases the risk of privilege abuse or lateral movement.


**Implementation**


1. Review the list of exposed entities to identify which of your AD accounts are members of one of the built-in operator groups (for example, Server Operators, Backup Operators, Print Operators, and Account Operators). 

1. Remove the account from the operator group if elevated access isn't required, or disable the account if it's unused.
 
For example: 

- Remove the membership or disable service or admin account that were added to Backup Operators for a legacy backup process that no longer runs. 

- If an account still performs operational tasks but doesn't require broad operator rights, delegate only the specific permissions it needs (for example, file restore or print management on a single server). 

- If operator group membership is essential for a specific administrative function, monitor the account, restrict it to required hosts, and review it regularly  periodically to confirm ongoing necessity.


## Accounts with non-default Primary Group ID

**Description**

This recommendation lists all computers and users accounts whose primaryGroupId (PGID) attribute isn't the default for domain users and computers in Active Directory.

**User impact**

The primaryGroupId attribute of a user or computer account grants implicit membership to a group. Membership through this attribute doesn't appear in the list of group members in some interfaces. This attribute might be used as an attempt to hide group membership. It might be a stealthy way for an attacker to escalate privileges without triggering normal auditing for group membership changes. 

**Implementation**


1. Review the list of exposed entities to discover which of your accounts have a suspicious primaryGroupId.  

1. Take appropriate action on those accounts by resetting their attribute to their default values or adding the member to the relevant group:  

  - User accounts: 513 (Domain Users) or 514 (Domain Guests);  
    
  - Computer accounts: 515 (Domain Computers);  
  
  - Domain controller accounts: 516 (Domain Controllers);  
  
  - Read-only domain controller (RODC) accounts: 521 (Read-only Domain Controllers).



##  Remove access rights on suspicious accounts with the Admin SDHolder permission

**Description**

Having non-sensitive accounts with **Admin SDHolder** (security descriptor holder) permissions can have significant security implications, including:

- Leading to unauthorized privilege escalation, where attackers can exploit these accounts to gain administrative access and compromise sensitive systems or data
- Increasing the attack surface, making it harder to track and mitigate security incidents, potentially exposing the organization to greater risks.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for **Remove access rights on suspicious accounts with the Admin SDHolder permission**.

    For example:

    :::image type="content" source="../media/secure-score/remove-suspicious-access-rights.png" alt-text="Screenshot of the Admin SDHolder security assessment." lightbox="../media/secure-score/remove-suspicious-access-rights.png":::


1. Review the list of exposed entities to discover which of your nonsensitive accounts have the **Admin SDHolder** permission.

1. Take appropriate action on those entities by removing their privileged access rights. For example:

    1. Use the **ADSI Edit** tool to connect to your domain controller.
    1. Browse to the **CN=System**> **CN=AdminSDHolder** container and open the **CN=AdminSDHolder** container properties.
    1. Select the **Security** tab > **Advanced**, and remove any nonsensitive entities. These are the entities marked as exposed in the security assessment.

    For more information, see [Active Directory Service Interfaces](/windows/win32/adsi/active-directory-service-interfaces-adsi) and [ADSI Edit](/previous-versions/windows/it-pro/windows-server-2003/cc773354(v=ws.10)) documentation

To achieve the full score, remediate all exposed entities.


## Change password for krbtgt account

**Description**

This recommendation lists any krbtgt account within your environment with password last set over 180 days ago.

**User impact**

The krbtgt account in Active Directory is a built-in account used by the Kerberos authentication service. It encrypts and signs all Kerberos tickets, enabling secure authentication within the domain. The account can't be deleted, and securing it's crucial, as compromise could allow attackers to forge authentication tickets.  
If the KRBTGT account's password is compromised, an attacker can use its hash to generate valid Kerberos authentication tickets, allowing them to perform Golden Ticket attacks and gain access to any resource in the AD domain. Since Kerberos relies on the KRBTGT password to sign all tickets, closely monitoring and regularly changing this password is essential to mitigating the risk of such attacks.

**Implementation**

1. Review the list of exposed entities to discover which of your krbtgt accounts have an old password.

1. Take appropriate action on those accounts by resetting their password **twice** to invalidate the Golden Ticket attack. 

> [!NOTE]
> The **krbtgt** Kerberos account in all Active Directory domains supports key storage in all Kerberos Key Distribution Centers (KDCs). To renew the Kerberos keys for TGT encryption, periodically change the **krbtgt** account password.  
>  
> We recommend resetting the password twice, waiting at least 10 hours between resets. This process invalidates  existing Kerberos tickets to help prevent Golden Ticket attacks.  
>  
> For the official and supported procedure, see [Reset the krbtgt password](/windows-server/identity/ad-ds/manage/forest-recovery-guide/ad-forest-recovery-reset-the-krbtgt-password).


## Change password for on-premises account with potentially leaked credentials (Preview)

**Description**

This report lists users whose valid credentials have been leaked. When cybercriminals compromise valid passwords of legitimate users, the criminals often share those credentials. This is done by posting them publicly on the dark web or paste sites or by trading or selling the credentials on the black market. The Microsoft leaked credentials service acquires username/password pairs by monitoring public and dark web sites and by working with  Researchers Law enforcement Security teams at Microsoft Other trusted sources.

**User impact**

When the service acquires user credentials from the dark web, paste sites or the above sources an account with compromised credentials can be exploited by malicious actors to gain unauthorized access.

**Implementation**

1.	Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for **Change password for accounts with potentially leaked credentials**. 
1.	Review the list of exposed entities to discover which of your account passwords were leaked.
1.	Take appropriate actions on those entities by removing the service account:
    1. Open the Active Directory Users and Computers (ADUC) console and sign in with an administrator account.
    2. Navigate to the organizational unit (OU) where the user account is located.
    3. Find and select the user account that needs a password change.
    4. Right-click on the user account, select **Reset Password**, enter the new password, and confirm it.


## Change password of built-in domain Administrator account

**Description**

This recommendation lists any built-in domain Administrator accounts within your environment with password last set over 180 days ago. 

**User impact**

The built-in domain Administrator account is a default, highly privileged AD account with full control over the domain. It can't be deleted, has unrestricted access, and is critical for managing the domain's resources.

Regularly updating the built-in Administrator account's password is essential due to its high privileges, which make it a prime target for attackers. If compromised, it can grant unauthorized control over the domain. Since this account is often unused and its password might not be updated frequently, regular changes reduce exposure and enhance security. 

**Implementation**

1. Review the list of exposed entities to discover which of your built-in domain Administrator accounts have an old password.  

1. Take appropriate action on those accounts by resetting their password.  

   For example:

:::image type="content" source="../media/change-password-domain-administrator-account/screenshot-of-report.png" alt-text="Screenshot that shows the security posture assessment for Change password for built-in domain Administrator accounts." lightbox="../media/change-password-domain-administrator-account/screenshot-of-report.png":::


## Dormant entities in sensitive groups

**Description**

Microsoft Defender for Identity discovers if particular users are **sensitive** along with providing attributes that surface if they're inactive, disabled, or expired.

However, **Sensitive** accounts can also become *dormant* if they aren't used for a period of 180 days. Dormant sensitive entities are targets of opportunity for malicious actors to gain sensitive access to your organization. 

For more information, see [Defender for Identity entity tags in Microsoft Defender XDR](../entity-tags.md#default-sensitive-entities).

**User impact**

Organizations that fail to secure their dormant user accounts leave the door unlocked to their sensitive data safe.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. An easy and quiet path deep into your organization is through **sensitive** user and service accounts that are no longer in use.

It doesn't matter if the cause is employee turnover or resource mismanagement -skipping this step leaves your organization's most sensitive entities vulnerable and exposed.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your sensitive accounts are dormant.

    :::image type="content" source="../media/cas-isp-dormant-entities-sensitive-groups-1.png" alt-text="Screenshot that shows improvement actions for Remove dormant accounts from sensitive groups." lightbox="../media/cas-isp-dormant-entities-sensitive-groups-1.png":::


1. Take appropriate action on those user accounts by removing their privileged access rights or by deleting the account.


## Remove non-admin accounts with DCSync permissions

**Description**

Accounts with the DCSync permission can initiate domain replication. Attackers can potentially exploit domain replication to gain unauthorized access, manipulate domain data, or compromise the integrity and availability of your Active Directory environment.

It's crucial to carefully manage and restrict the membership of this group to ensure the security and integrity of your domain replication process.

**Implementation**

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for **Remove non-admin accounts with DCSync permissions**.

    :::image type="content" source="../media/secure-score/dcsync-permissions.png" alt-text="Screenshot that shows the recommended action to remove non-admin accounts with DCsync permissions." lightbox="../media/secure-score/dcsync-permissions.png":::


1. Review this list of exposed entities to discover which of your accounts have DCSync permissions and are also nondomain admins.
1. Take appropriate action on those entities by removing their privileged access rights.
To achieve the maximum score, remediate all exposed entities.

You can access Active Directory Users and Computers by signing in to your domain controller.
To remove DCSync permissions from a non-admin account:

1. Open Active Directory Users and Computers.
1. Turn on Advanced Features.
This is required to display the Security tab on domain objects.

1. Open Domain properties, select your domain name (for example, contoso.local), and then select Properties.
1. Select the Security tab.
1. Select the target user or group and then select the non-admin user or service account that shouldn't have these permissions.
1. Uncheck replication permissions. Scroll through the "Permissions for [User]" list uncheck the following permissions if they're selected:

    - Replicating Directory Changes
    - Replicating Directory Changes All

1. Select Apply, and then select OK.


## Ensure privileged accounts are not delegated

**Description**

This recommendation lists all privileged accounts that don't have the "not delegated" setting enabled, highlighting those potentially exposed to delegation-related risks. Privileged accounts are accounts that are being members of a privileged group such as Domain admins, Schema admins, and so on. 

- Domain Admins
- Enterprise Admins
- Service accounts with elevated privileges

**User impact**

If the sensitive flag is disabled, attackers could exploit Kerberos delegation to misuse privileged account credentials, leading to unauthorized access, lateral movement, and potential network-wide security breaches. 

Enabling the setting **This account is sensitive and can't be delegated** doesn't affect the account’s ability to log in or its assigned permissions. The restriction applies only to delegation scenarios, such as constrained or unconstrained Kerberos delegation. 
Privileged accounts such as Domain Admins or Enterprise Admins shouldn't be delegated, as this poses a significant security risk. Enabling this setting helps prevent Kerberos delegation attacks by ensuring these accounts can't be impersonated.

**Security recommendation**

We recommend that you enable this setting for:

Domain Admins
Enterprise Admins
Service accounts with elevated privileges

Avoid applying this setting to accounts that require delegation for legitimate business purposes unless the delegation model is redesigned.

**Implementation**

1. Review the list of exposed entities to discover which of your privileged accounts don’t have the configuration flag "this account is sensitive and can't be delegated."
1. Take appropriate action on those accounts:

- User accounts: 
    - Go to the **Accounts** tab >**Account options**.
    - Select **Account is sensitive and cannot be delegated.** This prevents users from gaining access to the account and manipulating system settings.

    :::image type="content" source="../media/ensure-privileged-accounts-with-sensitive-flag/administrator-properties.png" alt-text="Screenshot of the user profile.":::

- Device accounts:  
The safest approach is to use a PowerShell script to configure the device to prevent it from being used in any delegation scenario, ensuring that credentials on this machine can't be forwarded to access other services.

  ```powershell
  $name = "ComputerA" 
  Get-ADComputer -Identity $name |
  Set-ADAccountControl -AccountNotDelegated:$true
  ```
  Another option is to set the `UserAccountControl` attribute to `NOT_DELEGATED = 0x100000` under the Attribute Editor tab for the exposed device.   
  
  For example:  

    :::image type="content" source="../media/ensure-privileged-accounts-with-sensitive-flag/device-profile.png" alt-text="Screenshot of the device profile.":::


## Entities exposing credentials in clear text

**Description**

This security assessment monitors your traffic for any entities exposing credentials in clear text and alerts you to the current exposure risks (most impacted entities) in your organization with suggested remediation.

**User impact**

Entities exposing credentials in clear text are risky not only for the exposed entity in question, but for your entire organization.

The increased risk is because unsecure traffic such as LDAP simple-bind is highly susceptible to interception by attacker-in-the-middle attacks. These types of attacks result in malicious activities including credential exposure, in which an attacker can leverage credentials for malicious purposes.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions>.

    :::image type="content" source="../media/cas-isp-clear-text-1.png" alt-text="Prevent clear text credentials exposure." lightbox="../media/cas-isp-clear-text-1.png":::

    :::image type="content" source="../media/cas-isp-clear-text-2.png" alt-text="Review top impacted entities and create an action plan." lightbox="../media/cas-isp-clear-text-2.png":::

1. Research why those entities are using LDAP in clear text.
1. Remediate the issues and stop the exposure.
1. After confirming remediation, we recommend you require domain controller level LDAP signing. To learn more about LDAP server signing, see [Domain controller LDAP server signing requirements](/windows/security/threat-protection/security-policy-settings/domain-controller-ldap-server-signing-requirements).

> [!NOTE]
> This assessment is updated in near real time.
> The reports show the affected entities from the last 30 days. After that time, entities no longer affected will be removed from the exposed entities list.


## Microsoft LAPS usage

**Description**

Microsoft's "Local Administrator Password Solution" (LAPS) provides management of local administrator account passwords for domain-joined computers. Passwords are randomized and stored in Active Directory (AD), protected by ACLs, so only eligible users can read it or request its reset.

This security assessment supports [legacy Microsoft LAPS](https://www.microsoft.com/en-us/download/details.aspx?id=46899) and [Windows LAPS](/windows-server/identity/laps/laps-overview).

**User impact**

LAPS provides a solution to the issue of using a common local account with an identical password on every computer in a domain. LAPS resolves this issue by setting a different, rotated random password for the common local administrator account on every computer in the domain.

LAPS simplifies password management while helping customers implement more recommended defenses against cyberattacks. In particular, the solution mitigates the risk of lateral escalation that results when customers use the same administrative local account and password combination on their computers. LAPS stores the password for each computer's local administrator account in AD, secured in a confidential attribute in the computer's corresponding AD object. The computer can update its own password data in AD, and domain administrators can grant read access to authorized users or groups, such as workstation helpdesk administrators.

> [!NOTE]
> In some cases, [Microsoft Entra hybrid joined](/azure/active-directory/devices/concept-hybrid-join) machines might still appear in the security posture assessment even if LAPS is configured in Microsoft Entra ID. This can be due to how the policy is applied or how the device reports its state.
> If this occurs, we suggest reviewing the LAPS configuration in Microsoft Entra ID to confirm everything is set up as expected. You can find more details [here](https://techcommunity.microsoft.com/blog/microsoft-entra-blog/windows-local-administrator-password-solution-with-microsoft-entra-id-now-genera/3911999).

**Implementation**

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your domains have some (or all) compatible Windows devices that aren't protected by LAPS, or that haven't had their LAPS managed password changed in the last 60 days.

    :::image type="content" source="../media/cas-isp-laps-1.png" alt-text="Screenshot that shows which domains have devices unprotected by LAPS." lightbox="../media/cas-isp-laps-1.png":::

   
1. For domains that are partially protected, select the relevant row to view the list of devices not protected by LAPS in that domain.

   :::image type="content" source="../media/cas-isp-laps-2.png" alt-text="Screenshot that shows the list of devices not protected by LAPS in a selected domain." lightbox="../media/cas-isp-laps-2.png":::

1. Take appropriate action on those devices by downloading, installing, and configuring or troubleshooting [Microsoft LAPS](https://go.microsoft.com/fwlink/?linkid=2104282) or [Windows LAPS](/windows-server/identity/laps/laps-overview).

   :::image type="content" source="../media/laps-unprotected-devices.png" alt-text="Screenshot that shows the remediation steps for devices unprotected by LAPS." lightbox="../media/laps-unprotected-devices.png":::


## Remove discoverable passwords in Active Directory account attributes (Preview)

**Description**

Certain free-text attributes are often overlooked during hardening but are readable by any authenticated user in the domain. When credentials or clues are mistakenly stored in these attributes, attackers can abuse them to move laterally across the environment or escalate privileges.

Attackers seek low-friction paths to expand access. Exposed passwords in these attributes represent an easy win because:

- The attributes aren't access-restricted.

- They aren't monitored by default.

- They provide context attackers can exploit for lateral movement and privilege escalation.

Removing exposed credentials from these attributes reduces the risk of identity compromise and strengthens your organization’s security posture.


> [!NOTE]
> Findings can include false positives. Always validate the results before taking action.

Microsoft Defender for Identity detects potential credential exposure in Active Directory by analyzing commonly used free-text attributes. This includes looking for common password formats, hints,  `'description'`, `'info'`, and `'adminComment'` fields, and other contextual clues that might suggest the presence of credential misuse. 
This recommendation uses GenAI-powered analysis of Active directory attributes to detect:

- Plaintext passwords or variations. For example, '`Password=Summer2025!'`

- Credential patterns, reset hints, or sensitive account information. 

- Other indicators suggesting operational misuse of directory fields. 

Detected matches are surfaced in **Secure Score** and the **Security Assessment report** for review and remediation.


**Implementation**


To address this security assessment, follow these steps:

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Remove discoverable passwords in Active Directory account attributes.
1. Review the exposed entries in the security report. Identify any field content that includes:

    - Cleartext passwords

    - Reset instructions or credential clues

    - Sensitive business or system information

1. Remove sensitive information from the listed attribute fields using standard directory management tools (for example, PowerShell or ADSI Edit).
1. Fully remove the sensitive information. Don’t just mask the value. Partial obfuscation (for example, P@ssw***) can still offer useful clues to attackers.

## Remove Stale Service Accounts (Preview)

**Description**

This recommendation lists Active Directory service accounts detected as stale within the past 90 days. 

**User impact**

Unused service accounts create significant security risks, as some of them can carry elevated privileges. If attackers gain access, the result can be substantial damage. Stale service accounts might retain high or legacy permissions. When compromised, they provide attackers with discreet entry points into critical systems, granting far more access than a standard user account.

This exposure creates several risks:

- Unauthorized access to sensitive applications and data.

- Lateral movement across the network without detection.

**Implementation**


To use this security assessment effectively, follow these steps:

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions ](https://security.microsoft.com/securescore?viewid=actions) for Remove stale service account.

1. Review the list of exposed entities to discover which of your service accounts are stale and haven't performed any login activity in the last 90 days.

1. Take appropriate actions on those entities by removing the service account. For example:

    - **Disable the account:** Prevent any usage by disabling the account identified as exposed.

    - **Monitor for impact:** Wait several weeks and monitor for operational issues, such as service disruptions or errors.

    - **Delete the account:** If no issues are observed, delete the account and fully remove its access.


## Unsecure Kerberos delegation

**Description**

Kerberos delegation is a delegation setting that allows applications to request end-user access credentials to access resources on behalf of the originating user.

**User impact**

Unsecure Kerberos delegation gives an entity the ability to impersonate you to any other chosen service. For example, imagine you have an IIS website, and the application pool account is configured with unconstrained delegation. The IIS website site also has Windows Authentication enabled, allowing native Kerberos authentication, and the site uses a back-end SQL Server for business data. With your Domain Admin account, you browse to the IIS website and authenticate to it. The website, using unconstrained delegation can get a service ticket from a domain controller to the SQL service, and do so in your name.

The main issue with Kerberos delegation is that you need to trust the application to always do the right thing. Malicious actors can instead force the application to do the wrong thing. If you're logged on as **domain admin**, the site can create a ticket to whatever other services it wishes, acting as you, the **domain admin**. For example, the site could choose a domain controller, and make changes to the **enterprise admin** group. Similarly, the site could acquire the hash of the KRBTGT account, or download an interesting file from your Human Resources department. The risk is clear and the possibilities with unsecure delegation are nearly endless.

The following is a description of the risk posed by different delegation types:

- **Unconstrained delegation**: Any service can be abused if one of their delegation entries is sensitive.
- **Constrained delegation**: Constrained entities can be abused if one of their delegation entries is sensitive.
- **Resource-based constrained delegation (RBCD)**: Resource-based constrained entities can be abused if the entity itself is sensitive.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your non-domain controller entities are configured for **unsecure Kerberos delegation**.

    :::image type="content" source="../media/cas-isp-kerberos-delegation-2.png" alt-text="Screenshot that shows the Unsecure Kerberos delegation security assessment." lightbox="../media/cas-isp-kerberos-delegation-2.png":::

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

    :::image type="content" source="../media/cas-isp-unconstrained-kerberos-2.png" alt-text="Screenshot that shows a list of exposed entities with the recommendation to modify unsecure kerberos delegation to prevent impersonation. " lightbox="../media/cas-isp-unconstrained-kerberos-2.png":::

**Resource-based constrained delegation (RBCD)**

Resource-based constrained delegation restricts which entities can impersonate this account. Resource-based KCD is configured using PowerShell. 

1. You can use the [Set-ADComputer](/powershell/module/activedirectory/set-adcomputer) or [Set-ADUser](/powershell/module/activedirectory/set-aduser) cmdlets, depending on whether the impersonating account is a computer account or a user account / service account.

1. Review the sensitive users listed in the recommendations and remove them from the resource. For more information about configuring RBCD, see [Configure Kerberos constrained delegation (KCD) in Microsoft Entra Domain Services](/azure/active-directory-domain-services/deploy-kcd).



## Unsecure SID History attributes

**Description**

SID History is an attribute that supports [migration scenarios](/previous-versions/windows/it-pro/windows-server-2003/cc779590(v=ws.10)). Every user account has an associated [Security Identifier (SID)](/windows/win32/secauthz/security-identifiers) which is used to track the security principal and the access the account has when connecting to resources. SID History enables access for another account to effectively be cloned to another and is useful to ensure users retain access when moved (migrated) from one domain to another.

The assessment checks for accounts with SID History attributes which Microsoft Defender for Identity profiles to be risky.

**User impact**

Organizations that fail to secure their account attributes leave the door unlocked for malicious actors.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. Accounts configured with an unsecure SID History attribute are windows of opportunities for attackers and can expose risks.

For example, a nonsensitive account in a domain can contain the Enterprise Admin SID in its SID History from another domain in the Active Directory forest, thus "elevating" access for the user account to an effective Domain Admin in all domains in the forest. If you have a forest trust without SID Filtering enabled (also called Quarantine), it's possible to inject a SID from another forest and it will be added to the user token when authenticated and used for access evaluations.

**Implementation**

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your accounts have an unsecure SID History attribute.

    :::image type="content" source="../media/cas-isp-unsecure-sid-history-attribute-1.png" alt-text="Screenshot that shows improvement actions for Remove unsecure SID History attributes." lightbox="../media/cas-isp-unsecure-sid-history-attribute-1.png":::

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

**Description**

Microsoft Defender for Identity continuously monitors your environment to identify accounts with attribute values that expose a security risk, and reports on these accounts to assist you in protecting your environment.

**User impact**

Organizations that fail to secure their account attributes leave the door unlocked for malicious actors.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. Accounts configured with unsecure attributes are windows of opportunity for attackers and can expose risks.

For example, if the **PasswordNotRequired** attribute is enabled, an attacker can easily access the account. This is especially risky if the account has privileged access to other resources.

**Implementation**

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your accounts have unsecure attributes.

    :::image type="content" source="../media/cas-isp-unsecure-account-attributes-1.png" alt-text="Screenshot that shows a list of unsecure account attributes that need to be resolved." lightbox="../media/cas-isp-unsecure-account-attributes-1.png":::

1. Take appropriate action on those user accounts by modifying or removing the relevant attributes.

1. Use the remediation appropriate to the relevant attribute as described in the following table: 

| Recommended action | Remediation | Reason |
| --- | --- | --- |
| Remove Don't require Kerberos preauthentication| Remove this setting from account properties in Active Directory (AD) | Removing this setting requires a Kerberos pre-authentication for the account resulting in improved security. |
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
- [Check out the Defender for Identity forum!](https://aka.ms/MDIcommunity)
