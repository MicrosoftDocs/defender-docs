---
title: Identity infrastructure
description: 'Learn about Microsoft Defender for Identity security posture assessments for identity infrastructure.'
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 09/10/2025
ms.reviewer: LiorShapiraa
---

# Identity infrastructure security assessments

Learn about Microsoft Defender for Identity security posture assessments for identity infrastructure.

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as __Completed__.

## Built-in Active Directory Guest account is enabled

**Description**

This recommendation indicates whether an AD Guest account is enabled in your environment.   
The goal is to **ensure** that the Guest account of the domain is **not enabled**. 


**User impact**

The on-premises Guest account is a built-in, non-nominative account that allows anonymous access to Active Directory. Enabling this account permits access to the domain without requiring a password, potentially posing a security threat.


**Implementation**

1. Review the list of exposed entities to discover if there's a Guest account, which is enabled.  

1. Take appropriate action on those accounts by **disabling** the account.  

   For example:  

   :::image type="content" source="../media/built-in-active-directory-guest-account-is-enabled/guest-account.png" alt-text="Screenshot that shows guest properties.":::  

   :::image type="content" source="../media/built-in-active-directory-guest-account-is-enabled/security-report.png" alt-text="Screenshot that shows the Built-in Active Directory account is enabled.":::  


## Change Domain Controller computer account old password

**Description**

This recommendation lists all domain controller’s computer accounts with password last set over 45 days ago.

A Domain Controller (DC) is a server in an Active Directory (AD) environment that manages user authentication and authorization, enforces security policies, and stores the AD database. It handles logins, verifies permissions, and ensures secure access to network resources. Multiple DCs provide redundancy for high availability.  
Domain Controllers with old passwords are at heightened risk of compromise and could be more easily taken over. Attackers can exploit outdated passwords, gaining prolonged access to critical resources and weakening network security. It could indicate a Domain controller that is no longer functioning in the domain.

**Implementation**

1. Verify Registry Values: 

   - HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\DisablePasswordChange is set to 0 or is nonexistent. 
      
   - HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\MaximumPasswordAge is set to 30. 
      
1. Reset Incorrect Values:   
     - Reset any incorrect values to their default settings.   
     - Check Group Policy Objects (GPOs) to ensure they don't override these settings. 
  
1. If these values are correct, check if the NETLOGON service is started with sc.exe query netlogon. 

1. Validate Password Synchronization by Running nltest /SC_VERIFY: (with DomainName being the domain NetBIOS name) can check the synchronization status and should display0 0x0 NERR_Success for both verifications.

> [!TIP]
> For more information about computer account’s password process check this blog post about [Machine accounts password process](https://techcommunity.microsoft.com/t5/ask-the-directory-services-team/machine-account-password-process/ba-p/396026). 


## Disable Print spooler service on domain controllers

**Description**

Print spooler is a software service that manages printing processes. The spooler accepts print jobs from computers and makes sure that printer resources are available. The spooler also schedules the order in which print jobs are sent to the print queue for printing. In the early days of personal computers, users had to wait until files printed before performing other actions. Thanks to modern print spoolers, printing now has minimal impact on overall user productivity.

While seemingly harmless, any authenticated user can remotely connect to a domain controller's print spooler service, and request an update on new print jobs. Also, users can tell the domain controller to send the notification to the system with [unconstrained delegation](/defender-for-identity/security-assessment-unconstrained-kerberos). These actions test the connection and expose the domain controller computer account credential (**Print spooler** is owned by SYSTEM).

Due to the possibility for exposure, domain controllers and Active Directory admin systems need to have the **Print spooler** service disabled. The recommended way to do this is using a Group Policy Object (GPO).

While this security assessment focuses on domain controllers, any server is potentially at risk to this type of attack.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your domain controllers has the **Print spooler** service enabled.

    :::image type="content" source="../media/cas-isp-print-spooler-2.png" alt-text="Screenshot that shows a list of exposed entitities that are running a print spooler service.":::


1. Take appropriate action on the at-risk domain controllers and actively remove the Print spooler service either manually, through GPO or other types of remote commands.

1. Due to the possibility for exposure, domain controllers and Active Directory admin systems need to have the **Print spooler** service disabled. Fix this specific issue by disabling the Print Spooler service on all servers that don't require it.


> [!NOTE]
>
> - Make sure to investigate your **Print spooler** settings, configurations, and dependencies before disabling this service and preventing active printing workflows.
> - The domain controller role [adds a thread to the spooler service](/windows-server/security/windows-services/security-guidelines-for-disabling-system-services-in-windows-server#print-spooler) that is responsible for performing print pruning – removing the stale print queue objects from the Active Directory. Therefore, the security recommendation to disable the **Print spooler** service is a trade-off between security and the ability to perform print pruning. To address the issue, you should consider periodically pruning stale print queue objects.

## Remove local admins on identity assets

**Description**


Accounts with indirect control over an identity system, such as AD FS, AD CS, Active Directory, and so on, have the rights to escalate their privileges within the environment, which can lead to obtaining Domain Admin access or equivalent. 

Every local admin on a Tier-0 system is an indirect Domain Admin from an attacker's point of view.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for **Remove local admins on identity assets**.

    For example:

    :::image type="content" source="../media/secure-score/local-admins.png" alt-text="Screenshot that shows the recommended action to remove local admins on identity assets.":::


1. Review this list of exposed entities to discover which of your accounts have local admin rights on your identity assets.

1. Take appropriate action on those entities by removing their privileged access rights.

1. To achieve a full score, you must remediate all exposed entities.

## Unmonitored domain controllers

**Description**

An essential part of the Microsoft Defender for Identity solution requires that its sensors are deployed on all organizational domain controllers, providing a comprehensive view for all user activities from every device.

For this reason, Defender for Identity continuously monitors your environment to identify domain controllers without an installed Defender for Identity sensor, and reports on these unmonitored servers to assist you in managing full coverage of your environment.

In order to operate at maximum efficiency, all domain controllers must be monitored with Defender for Identity sensors. Organizations that fail to remediate unmonitored domain controllers, reduce visibility into their environment and potentially expose their assets to malicious actors.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your domain controllers are unmonitored.

    :::image type="content" source="../media/cas-isp-unmonitored-domain-controller-1.png" alt-text="Screenshot that shows unmonitored domain controllers.":::

1. Take appropriate action on those domain controllers by [installing and configuring monitoring sensors](/defender-for-identity/sensor-settings#domain-controller-status).



## Unmonitored ADCS servers

**Description**

Unmonitored Active Directory Certificate Services (AD CS) servers pose a significant risk to your organization’s identity infrastructure. AD CS, the backbone of certificate issuance and trust, is a high-value target for attackers aiming to escalate privileges or forge credentials. Without proper monitoring, attackers can exploit these servers to issue unauthorized certificates, enabling stealthy lateral movement and persistent access. Deploy Microsoft Defender for Identity version 2.0 sensors on all AD CS servers to mitigate this risk. These sensors provide real-time visibility into suspicious activity, detect advanced threats, and generate actionable alerts based on security events and network behavior.

**Implementation**

> [!NOTE]
> This security assessment is only available if Microsoft Defender for Endpoint detects eligible ADCS servers in the environment. In some cases, servers running ADCS might not be identified with the required role and therefore will not appear in this assessment, even if they exist in the environment.

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your AD CS servers are unmonitored.

    :::image type="content" source="../media/unmonitored-adcs-servers/recommended-actions-unmonitored-active-directory-certificate-services-servers.png" alt-text="Screenshot that shows the recommended actions for an unmonitored AD CS server." lightbox="../media/unmonitored-adcs-servers/recommended-actions-unmonitored-active-directory-certificate-services-servers.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/defender-for-identity/deploy/active-directory-federation-services).


## Unmonitored ADFS servers

This article describes the Microsoft Defender for Identity's unmonitored Active Directory Federation Services (ADFS) servers security posture assessment report.

**Description**

Unmonitored Active Directory Federation Services (ADFS) servers are a significant security risk to organizations. ADFS controls access to both cloud and on-premises resources as the gateway for federated authentication and single sign-on. If attackers compromise an ADFS server, they can issue forged tokens and impersonate any user, including privileged accounts. Such attacks might bypass multi-factor authentication (MFA), conditional access, and other downstream security controls, making them particularly dangerous. Without proper monitoring, suspicious activity on ADFS servers might go undetected for extended periods. Deploying Microsoft Defender for Identity version 2.0 sensors on ADFS servers is essential. These sensors enable real-time detection of suspicious behavior and help prevent token forgery, abuse of trust relationships, and stealthy lateral movement within the environment.

**Implementation**

> [!NOTE]
> This security assessment is only available if Microsoft Defender for Endpoint detects eligible ADFS servers in the environment. In some cases, servers running ADFS might not be identified with the required role and therefore will not appear in this assessment, even if they exist in the environment.


1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your ADFS servers are unmonitored.

    :::image type="content" source="../media/unmonitored-adfs-server/recommended-actions-unmonitored-active-directory-federation-services-server.png" alt-text="Screenshot that shows recommended actions for an unmonitored ADFS server." lightbox="../media/unmonitored-adfs-server/recommended-actions-unmonitored-active-directory-federation-services-server.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/defender-for-identity/deploy/active-directory-federation-services).


## Unmonitored Microsoft Entra Connect servers


**Description**

Unmonitored Microsoft Entra Connect servers (formerly Azure AD Connect) pose a significant security risk in hybrid identity environments. These servers synchronize identities between on-premises Active Directory and Entra ID. They can introduce, modify, or remove accounts and attributes that directly affect cloud access.

If an attacker compromises a Microsoft Entra Connect server, they can inject shadow admins, manipulate group memberships, or sync malicious changes into the cloud without triggering traditional alerts.

These servers operate at the intersection of on-premises and cloud identity, making them a prime target for privilege escalation and stealthy persistence. Without monitoring, such attacks can go undetected. Deploying Microsoft Defender for Identity version 2.0 sensors on Microsoft Entra Connect servers is critical. These sensors help detect suspicious activity in real time, protect the integrity of your hybrid identity bridge, and prevent full-domain compromise from a single point of failure.

**Implementation**

> [!NOTE]
> This security assessment is only available if Microsoft Defender for Endpoint detects eligible Microsoft Entra Connect servers in the environment. In some cases, servers running Entra Connect might not be identified with the required role and therefore will not appear in this assessment, even if they exist in the environment.

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your Microsoft Entra Connect servers are unmonitored.

    :::image type="content" source="../media/unmonitored-entra-connect-servers/recommended-actions-unmonitored-entra-connect-server.png" alt-text="Screenshot that shows the recommended actions for an unmonitored Entra Connect server." lightbox="../media/unmonitored-entra-connect-servers/recommended-actions-unmonitored-entra-connect-server.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/defender-for-identity/deploy/active-directory-federation-services).


## Resolve unsecure domain configurations

**Description**

Microsoft Defender for Identity continuously monitors your environment to identify domains with configurations values that expose a security risk, and reports on these domains to assist you in protecting your environment.

Organizations that fail to secure their domain configurations leave the door unlocked for malicious actors.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. Domains configured with unsecure configurations are windows of opportunity for attackers and can expose risks.

For example, if LDAP signing isn't enforced, an attacker can compromise domain accounts. This is especially risky if the account has privileged access to other resources, as with the [KrbRelayUp attack](https://www.microsoft.com/security/blog/2022/05/25/detecting-and-preventing-privilege-escalation-attacks-leveraging-kerberos-relaying-krbrelayup/).

**Implementation**

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your domains have unsecure configurations.

    :::image type="content" source="../media/unsecure-domain-configurations.png" alt-text="Screenshot that shows a description of unsecure domain configurations and how they impact the user. ":::

1. Take appropriate action on these domains by modifying or removing the relevant configurations.

1. Use the remediation appropriate to the relevant configurations as described in the following table.

   | Recommended action | Remediation | Reason |
   | --- | --- | --- |
   |**Enforce LDAP Signing policy to "Require signing"** | We recommend you require domain controller level LDAP signing. To learn more about LDAP server signing, see [Domain controller LDAP server signing requirements](/windows/security/threat-protection/security-policy-settings/domain-controller-ldap-server-signing-requirements). | Unsigned network traffic is susceptible to man-in-the-middle attacks.
   | **Set ms-DS-MachineAccountQuota to "0"**             | Set the [MS-DS-Machine-Account-Quota](/windows/win32/adschema/a-ms-ds-machineaccountquota) attribute to "0". | Limiting the ability of non-privileged users to register devices in the domain. For more information about this particular property and how it affects device registration, see [Default limit to number of workstations a user can join to the domain](/troubleshoot/windows-server/identity/default-workstation-numbers-join-domain). |



## Next steps

[Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
