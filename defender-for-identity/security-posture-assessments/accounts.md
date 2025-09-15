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


|Recommended action  |Description  |
|---------|---------|
|[Remediation for Accounts with non-default Primary Group ID](#remediation-for-accounts-with-non-default-primary-group-id)    | This recommendation lists all computers and users accounts whose primaryGroupId (PGID) attribute is not the default for domain users and computers in Active Directory. The primaryGroupId attribute of a user or computer account grants implicit membership to a group. Membership through this attribute does not appear in the list of group members in some interfaces. This attribute may be used as an attempt to hide group membership. It might be a stealthy way for an attacker to escalate privileges without triggering normal auditing for group membership changes.         |
|[Remediation for Remove access rights on suspicious accounts with the Admin SDHolder permission](#remediation-for-remove-access-rights-on-suspicious-accounts-with-the-admin-sdholder-permission)    |  This recommendation describes the **Remove access rights on suspicious accounts with the Admin SDHolder permission** security assessment, which highlights risky access rights on suspicious accounts. Having non-sensitive accounts with **Admin SDHolder** (security descriptor holder) permissions can have significant security implications, including: <br> - Leading to unauthorized privilege escalation, where attackers can exploit these accounts to gain administrative access and compromise sensitive systems or data <br> - Increasing the attack surface, making it harder to track and mitigate security incidents, potentially exposing the organization to greater risks.       |
|[Remediation for Change password for krbtgt account](#remediation-for-change-password-for-krbtgt-account)    | This recommendation lists any krbtgt account within your environment with password last set over 180 days ago. The krbtgt account in Active Directory is a built-in account used by the Kerberos authentication service. It encrypts and signs all Kerberos tickets, enabling secure authentication within the domain. The account cannot be deleted, and securing it is crucial, as compromise could allow attackers to forge authentication tickets.  If the KRBTGT account's password is compromised, an attacker can use its hash to generate valid Kerberos authentication tickets, allowing them to perform Golden Ticket attacks and gain access to any resource in the AD domain. Since Kerberos relies on the KRBTGT password to sign all tickets, closely monitoring and regularly changing this password is essential to mitigating the risk of such attacks.        |
|[Remediation for Change password of built-in domain Administrator account](#remediation-for-change-password-of-built-in-domain-administrator-account)    |   This recommendation lists any built-in domain Administrator accounts within your environment with password last set over 180 days ago. The built-in domain Administrator account is a default, highly privileged AD account with full control over the domain. It cannot be deleted, has unrestricted access, and is critical for managing the domain's resources. Regularly updating the built-in Administrator account's password is essential due to its high privileges, which make it a prime target for attackers. If compromised, it can grant unauthorized control over the domain. Since this account is often unused and its password may not be updated frequently, regular changes reduce exposure and enhance security.       |
|[Remediation for Dormant entities in sensitive groups](#remediation-for-dormant-entities-in-sensitive-groups)    | Microsoft Defender for Identity discovers if particular users are **sensitive** along with providing attributes that surface if they are inactive, disabled, or expired. **Sensitive** accounts can also become *dormant* if they are not used for a period of 180 days. Dormant sensitive entities are targets of opportunity for malicious actors to gain sensitive access to your organization.  For more information, see [Default sensitive entities](entity-tags.md#default-sensitive-entities). <br> Organizations that fail to secure their dormant user accounts leave the door unlocked to their sensitive data safe. Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. An easy and quiet path deep into your organization is through **sensitive** user and service accounts that are no longer in use. It doesn't matter if the cause is employee turnover or resource mismanagement -skipping this step leaves your organization's most sensitive entities vulnerable and exposed.        |
|[Remediation for Remove non-admin accounts with DCSync permissions](#remediation-for-remove-non-admin-accounts-with-dcsync-permissions)    |         |
|[Remediation for Entities exposing credentials in clear text](#remediation-for-entities-exposing-credentials-in-clear-text)    |         |
|[Remediation for Microsoft LAPS usage](#remediation-for-microsoft-laps-usage)    |         |
|[Remediation for Remove discoverable passwords in Active Directory account attributes (Preview)](#remediation-for-remove-discoverable-passwords-in-active-directory-account-attributes-preview)    |         |
|[Remediation for Riskiest lateral movement paths (LMP)](#remediation-for-riskiest-lateral-movement-paths-lmp)    |         |
|[Remediation for Unsecure Kerberos delegation](#remediation-for-unsecure-kerberos-delegation)    |         |
|[Remediation for Unsecure SID History attributes](#remediation-for-unsecure-sid-history-attributes)    |         |
|[Remediation for Unsecure account attributes](#remediation-for-unsecure-account-attributes)    |         |
|[Remediation for Weak cipher usage](#remediation-for-weak-cipher-usage)    |         |

## Remediation for Accounts with non-default Primary Group ID

1. Review the list of exposed entities to discover which of your accounts have a suspicious primaryGroupId.  

1. Take appropriate action on those accounts by resetting their attribute to their default values or adding the member to the relevant group:  

  - User accounts: 513 (Domain Users) or 514 (Domain Guests);  
    
  - Computer accounts: 515 (Domain Computers);  
  
  - Domain controller accounts: 516 (Domain Controllers);  
  
  - Read-only domain controller (RODC) accounts: 521 (Read-only Domain Controllers).

## Remediation for Remove access rights on suspicious accounts with the Admin SDHolder permission


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for **Remove access rights on suspicious accounts with the Admin SDHolder permission**.

    For example:

    :::image type="content" source="media/secure-score/remove-suspicious-access-rights.png" alt-text="Screenshot of the Admin SDHolder security assessment." lightbox="media/secure-score/remove-suspicious-access-rights.png":::

1. Review the list of exposed entities to discover which of your non-sensitive accounts have the **Admin SDHolder** permission.

1. Take appropriate action on those entities by removing their privileged access rights. For example:

    1. Use the **ADSI Edit** tool to connect to your domain controller.
    1. Browse to the **CN=System**> **CN=AdminSDHolder** container and open the **CN=AdminSDHolder** container properties.
    1. Select the **Security** tab > **Advanced**, and remove any non-sensitive entities. These are the entities marked as exposed in the security assessment.

    For more information, see [Active Directory Service Interfaces](/windows/win32/adsi/active-directory-service-interfaces-adsi) and [ADSI Edit](/previous-versions/windows/it-pro/windows-server-2003/cc773354(v=ws.10)) documentation

To achieve the full score, remediate all exposed entities.

## Remediation for Change password for krbtgt account

1. Review the list of exposed entities to discover which of your krbtgt accounts have an old password. 

1. Take appropriate action on those accounts by resetting their password **twice** to invalidate the Golden Ticket attack. 

> [!NOTE]
> The krbtgt Kerberos account in all Active Directory domains supports key storage in all Kerberos Key Distribution Centers (KDC). To renew the Kerberos keys for TGT encryption, periodically change the krbtgt account password. It is recommended to use the [Microsoft-provided script.](https://github.com/microsoft/New-KrbtgtKeys.ps1)  
> When resetting the password twice, wait at least 10 hours between resets to avoid Kerberos authentication issues. This wait time is enforced by the script and aligns with best practices.

## Remediation for Change password of built-in domain Administrator account

1. Review the list of exposed entities to discover which of your built-in domain Administrator accounts have an old password.  

1. Take appropriate action on those accounts by resetting their password.  

   For example:

   :::image type="content" source="../media/change-password-domain-administrator-account/screenshot-of-report.png" alt-text="Screenshot that shows a list of exposed entities for the security posture assessment.":::

## Remediation for Dormant entities in sensitive groups


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your sensitive accounts are dormant.

   :::image type="content" source="../media/cas-isp-dormant-entities-sensitive-groups-1.png" alt-text="Screenshot that shows improvement actions for Remove dormant accounts from sensitive groups." lightbox="../media/cas-isp-dormant-entities-sensitive-groups-1.png":::


1. Take appropriate action on those user accounts by removing their privileged access rights or by deleting the account.


## Remediation for Remove non-admin accounts with DCSync permissions

## Remediation for Entities exposing credentials in clear text

## Remediation for Microsoft LAPS usage

## Remediation for Remove discoverable passwords in Active Directory account attributes (Preview)

## Remediation for Riskiest lateral movement paths (LMP)

## Remediation for Unsecure Kerberos delegation

## Remediation for Unsecure SID History attributes

## Remediation for Unsecure account attributes

## Remediation for Weak cipher usage