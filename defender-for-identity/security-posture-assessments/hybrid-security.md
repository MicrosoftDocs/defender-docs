---
title: 'Hybrid security posture assessments'
description: View all hybrid security posture assessments for Microsoft Defender for Identity.
ms.service: microsoft-defender-for-identity
ms.topic: how-to
ms.date: 09/10/2025
ms.reviewer: LiorShapiraa
---

# Hybrid security posture assessments


This article lists all hybrid security posture assessments for Microsoft Defender for Identity.

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as __Completed__.

## Change password for Microsoft Entra seamless SSO account

**Description**


This report lists all Microsoft Entra seamless SSO computer accounts with password last set over 90 days ago.

**User impact**

Microsoft Entra seamless SSO automatically signs in users when they're using their corporate desktops that are connected to your corporate network. Seamless SSO provides your users with easy access to your cloud-based applications without using any other on-premises components. When setting up Microsoft Entra Seamless SSO, a computer account named AZUREADSSOACC is created in Active Directory. By default, the password for this Azure SSO computer account isn't automatically updated every 30 days. This password functions as a shared secret between AD and Microsoft Entra, enabling Microsoft Entra to decrypt Kerberos tickets used in the seamless SSO process between Active Directory and Microsoft Entra ID. If an attacker gains control of this account, they can generate service tickets for the AZUREADSSOACC account on behalf of any user and impersonate any user within the Microsoft Entra tenant that has been synchronized from


**Implementation**

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for __Change password for Microsoft Entra seamless SSO account.__

1. Review the list of exposed entities to discover which of your Microsoft Entra SSO computer accounts have a password more than 90 days old.

1. Take appropriate action on those accounts by following the steps described in [how to roll over the Microsoft Entra SSO account password](https://aka.ms/RollOverAzureadssoAccount) article. 

> [!NOTE]
> This security assessment is available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services and Sign on method as part of Microsoft Entra Connect configuration is set to single sign-on and the SSO computer account exists. Learn more about Microsoft Entra seamless sign-on [here](/entra/identity/hybrid/connect/how-to-connect-sso).


## Rotate password for Microsoft Entra Connect AD DS Connector account

**Description**

This report lists all MSOL accounts in your organization with password last set over 90 days ago.

**User impact**

Smart attackers are likely to target Microsoft Entra Connect in on-premises environments, and for good reason. The Microsoft Entra Connect server can be a prime target, especially based on the permissions assigned to the AD DS Connector account (created in on-premises AD with the MSOL_ prefix).

 It's important to change the password of MSOL accounts every 90 days to prevent attackers from allowing use of the high privileges that the connector account typically holds - replication permissions, reset password and so on.

**Implementation**

1. Review the recommended action at[ https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for **Rotate password for Microsoft Entra Connect AD DS Connector account.**

1. Review the list of exposed entities to discover which of your AD DS Connector accounts have a password more than 90 days old.

1. Take appropriate action on those accounts by following the steps on [how to change the AD DS Connector account password](https://aka.ms/MicrosoftEntraIdPasswordChangeSyncService).

> [!NOTE]
> This security assessment is only available if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services.


## Remove unnecessary replication permissions for Microsoft Entra Connect AD DS Connector account

**Description**

Smart attackers are likely to target Microsoft Entra Connect in on-premises environments, and for good reason. The Microsoft Entra Connect server can be a prime target, especially based on the permissions assigned to the AD DS Connector account (created in on-premises AD with the MSOL_ prefix). In the default 'express' installation of Microsoft Entra Connect, the connector service account is granted replication permissions, among others, to ensure proper synchronization. If Password Hash Sync isn’t configured, it’s important to remove unnecessary permissions to minimize the potential attack surface.

> [!NOTE]
> - This security assessment is available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services.
> 
> - If the Password Hash Sync (PHS) sign-on method is set up, AD DS Connector accounts with replication permissions won't be affected because those permissions are necessary.
> -  For environments with multiple Microsoft Entra Connect servers, it’s crucial to install sensors on each server to ensure Microsoft Defender for Identity can fully monitor your setup. If detected that your Microsoft Entra Connect configuration doesn't utilize Password Hash Sync, which means that replication permissions aren't necessary for the accounts in the Exposed Entities list. Ensure that each exposed MSOL account isn't required for Replication Permissions by any other applications.


**Implementation**

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Remove unnecessary replication permissions for __Microsoft Entra Connect AD DS Connector account.__

1. Review the list of exposed entities to discover which of your AD DS Connector accounts have unnecessary replication permissions.

1. Take appropriate action on those accounts and remove their 'Replication Directory Changes' and 'Replication Directory Changes All' permissions by unchecking the following permissions:  

:::image type="content" source="../media/remove-replication-permissions-microsoft-entra-connect/replicationconfiguration.png" alt-text="Screenshot that shows the list of permissions for Microsoft Entra Connect.":::


## Remove unsafe permissions on sensitive Microsoft Entra Connect accounts

**Description**


Microsoft Entra Connect accounts like AD DS Connector account (also known as MSOL_) and Microsoft Entra Seamless SSO computer account (AZUREADSSOACC) have powerful privileges, including replication and password reset rights. If these accounts are granted unsafe permissions, attackers could exploit them to gain unauthorized access, escalate privileges, or take control of hybrid identity infrastructure. This could lead to account takeovers, unauthorized directory modifications, and a broader compromise of both on-premises and cloud environments.


> [!NOTE]
> This security assessment will be available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services and Sign on method as part of Microsoft Entra Connect configuration is set to single sign-on and the SSO computer account exists. Learn more about Microsoft Entra seamless sign-on **[here](/entra/identity/hybrid/connect/how-to-connect-sso)**.


**Implementation**

1. Review the recommended action at[ https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Remove unsafe permissions on sensitive Microsoft Entra Connect accounts.

1. Review the list of exposed entities to identify accounts with unsafe permissions. For example:

    :::image type="content" source="../media/remove-unsafe-permissions-sensitive-entra-connect/screenshot-of-exposed-entities.png" alt-text="Screenshot of exposed entities.":::

1. If you select on "Click to expand" you can find more details about the granted permissions. For example:

    :::image type="content" source="../media/remove-unsafe-permissions-sensitive-entra-connect/screenshot-of-excessive-permissions.png" alt-text="Screenshot of excessive permissions" lightbox="../media/remove-unsafe-permissions-sensitive-entra-connect/screenshot-of-excessive-permissions.png":::

1. For each exposed account, remove problematic permissions that allow unprivileged accounts to takeover critical hybrid assets.


## Replace Enterprise or Domain Admin account for Microsoft Entra Connect AD DS Connector account

**Description**

Smart attackers often target Microsoft Entra Connect in on-premises environments due to the elevated privileges associated with its AD DS Connector account (typically created in Active Directory with the MSOL_ prefix). Using an **Enterprise Admin** or **Domain Admin** account for this purpose significantly increases the attack surface, as these accounts have broad control over the directory.

Starting with [Entra Connect build 1.4.###.#](/entra/identity/hybrid/connect/reference-connect-accounts-permissions), Enterprise Admin and Domain Admin accounts can no longer be used as the AD DS Connector account. This best practice prevents over-privileging the connector account, reducing the risk of domain-wide compromise if the account is targeted by attackers. Organizations must now create or assign a lower-privileged account specifically for directory synchronization, ensuring better adherence to the principle of least privilege and protecting critical admin accounts.

> [!NOTE]
> This security assessment will be available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services.

**Implementation**

1. Review the recommended action at[ https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Replace Enterprise or Domain Admin account for Microsoft Entra Connect AD DS Connector account.

1. Review the exposed accounts and their group memberships. The list contains members of Domain/Enterprise Admins through direct and recursive membership.

1. Perform one of the following actions:

   - Remove MSOL_ user account user from privileged groups, ensuring it retains the necessary permissions to function as the Microsoft Entra Connect Connector account.
   
   - Change the Microsoft Entra Connect AD DS Connector account (MSOL_) to a lower-privileged account. 


## Next steps

[Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
