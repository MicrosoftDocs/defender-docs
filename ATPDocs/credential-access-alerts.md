---
title: Credential access security alerts
description: This article explains Microsoft Defender for Identity alerts issued when credential access attacks are detected against your organization.
ms.date: 04/16/2023
ms.topic: conceptual
---

# Credential access alerts

Typically, cyberattacks are launched against any accessible entity, such as a low-privileged user, and then quickly move laterally until the attacker gains access to valuable assets. Valuable assets can be sensitive accounts, domain administrators, or highly sensitive data. Microsoft Defender for Identity identifies these advanced threats at the source throughout the entire attack kill chain and classifies them into the following phases:

1. [Reconnaissance and discovery alerts](reconnaissance-discovery-alerts.md)
1. [Persistence and privilege escalation alerts](persistence-privilege-escalation-alerts.md)
1. **Credential access**
1. [Lateral movement alerts](lateral-movement-alerts.md)
1. [Other alerts](other-alerts.md)

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [Understanding security alerts](understanding-security-alerts.md). For information about **True positive (TP)**, **Benign true positive (B-TP)**, and **False positive (FP)**, see [security alert classifications](understanding-security-alerts.md#security-alert-classifications).

The following security alerts help you identify and remediate **Credential access** phase suspicious activities detected by Defender for Identity in your network.

Credential Access consists of techniques for stealing credentials like account names and passwords. Techniques used to get credentials include keylogging or credential dumping. Using legitimate credentials can give adversaries access to systems, make them harder to detect, and provide the opportunity to create more accounts to help achieve their goals.

## Suspected Brute Force attack (LDAP) (external ID 2004)

*Previous name:* Brute force attack using LDAP simple bind

**Severity**: Medium

**Description**:

In a brute-force attack, the attacker attempts to authenticate with many different passwords for different accounts until a correct password is found for at least one account. Once found, an attacker can log in using that account.

In this detection, an alert is triggered when Defender for Identity detects a massive number of simple bind authentications. This alert detects brute force attacks performed either *horizontally* with a small set of passwords across many users, *vertically* with a large set of passwords on just a few users, or any combination of the two options. The alert is based on authentication events from sensors running on domain controller and AD FS / AD CS servers.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006) |
|---------|---------|
|MITRE attack technique  |  [Brute Force (T1110)](https://attack.mitre.org/techniques/T1110/)       |
|MITRE attack sub-technique |  [Password Guessing (T1110.001)](https://attack.mitre.org/techniques/T1110/001/), [Password Spraying (T1110.003)](https://attack.mitre.org/techniques/T1110/003/)       |

**Suggested steps for prevention**:

1. Enforce [complex and long passwords](/windows/device-security/security-policy-settings/password-policy) in the organization. Doing so provides the necessary first level of security against future brute-force attacks.
1. Prevent future usage of LDAP clear text protocol in your organization.

## Suspected Golden Ticket usage (forged authorization data) (external ID 2013)

Previous name: Privilege escalation using forged authorization data

**Severity**: High

**Description**:

Known vulnerabilities in older versions of Windows Server allow attackers to manipulate the Privileged Attribute Certificate (PAC), a field in the Kerberos ticket that contains a user authorization data (in Active Directory this is group membership), granting attackers additional privileges.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/)        |
|MITRE attack sub-technique |   [Golden Ticket (T1558.001)](https://attack.mitre.org/techniques/T1558/001/)    |

**Suggested steps for prevention**:

1. Make sure all domain controllers with operating systems up to Windows Server 2012 R2 are installed with [KB3011780](https://www.microsoft.com/download/details.aspx?id=44978) and all member servers and domain controllers up to 2012 R2 are up-to-date with [KB2496930](https://support.microsoft.com/help/2496930/ms11-013-vulnerabilities-in-kerberos-could-allow-elevation-of-privileg). For more information, see [Silver PAC](/security-updates/SecurityBulletins/2011/ms11-013) and [Forged PAC](/security-updates/SecurityBulletins/2014/ms14-068).

## Malicious request of Data Protection API master key (external ID 2020)

*Previous name:* Malicious Data Protection Private Information Request

**Severity**: High

**Description**:

The Data Protection API (DPAPI) is used by Windows to securely protect passwords saved by browsers, encrypted files, and other sensitive data. Domain controllers hold a backup master key that can be used to decrypt all secrets encrypted with DPAPI on domain-joined Windows machines. Attackers can use the master key to decrypt any secrets protected by DPAPI on all domain-joined machines.
In this detection, a Defender for Identity alert is triggered when the DPAPI is used to retrieve the backup master key.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Credentials from Password Stores (T1555)](https://attack.mitre.org/techniques/T1555/)        |
|MITRE attack sub-technique |  N/A     |

## Suspected Brute Force attack (Kerberos, NTLM) (external ID 2023)

*Previous name:* Suspicious authentication failures

**Severity**: Medium

**Description**:

In a brute-force attack, the attacker attempts to authenticate with multiple passwords on different accounts until a correct password is found or by using one password in a large-scale password spray that works for at least one account. Once found, the attacker logs in using the authenticated account.

In this detection, an alert is triggered when many authentication failures occur using Kerberos, NTLM, or use of a password spray is detected. Using Kerberos or NTLM, this type of attack is typically committed either *horizontal*, using a small set of passwords across many users, *vertical* with a large set of passwords on a few users, or any combination of the two.

In a password spray, after successfully enumerating a list of valid users from the domain controller, attackers try ONE carefully crafted password against ALL of the known user accounts (one password to many accounts). If the initial password spray fails, they try again, utilizing a different carefully crafted password, normally after waiting 30 minutes between attempts. The wait time allows attackers to avoid triggering most time-based account lockout thresholds. Password spray has quickly become a favorite technique of both attackers and pen testers. Password spray attacks have proven to be effective at gaining an initial foothold in an organization, and for making subsequent lateral moves, trying to escalate privileges. The minimum period before an alert can be triggered is one week.

**Learning period**:

1 week

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006) |
|---------|---------|
|MITRE attack technique  |  [Brute Force (T1110)](https://attack.mitre.org/techniques/T1110/)       |
|MITRE attack sub-technique |  [Password Guessing (T1110.001)](https://attack.mitre.org/techniques/T1110/001/), [Password Spraying (T1110.003)](https://attack.mitre.org/techniques/T1110/003/)       |

**Suggested steps for prevention**:

1. Enforce [complex and long passwords](/windows/device-security/security-policy-settings/password-policy) in the organization. Doing so provides the necessary first level of security against future brute-force attacks.

## Security principal reconnaissance (LDAP) (external ID 2038)

**Severity**: Medium

**Description**:

Security principal reconnaissance is used by attackers to gain critical information about the domain environment. Information that helps attackers map the domain structure, as well as identify privileged accounts for use in later steps in their attack kill chain. Lightweight Directory Access Protocol (LDAP) is one the most popular methods used for both legitimate and malicious purposes to query Active Directory. LDAP focused security principal reconnaissance is commonly used as the first phase of a Kerberoasting attack. Kerberoasting attacks are used to get a target list of Security Principal Names (SPNs), which attackers then attempt to get Ticket Granting Server (TGS) tickets for.

To allow Defender for Identity to accurately profile and learn legitimate users, no alerts of this type are triggered in the first 10 days following Defender for Identity deployment. Once the Defender for Identity initial learning phase is completed, alerts are generated on computers that perform suspicious LDAP enumeration queries or queries targeted to sensitive groups that using methods not previously observed.

**Learning period**:

15 days per computer, starting from the day of the first event, observed from the machine.

**MITRE**:

|Primary MITRE tactic  | [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007)  |
|---------|---------|
|Secondary MITRE tactic    |[Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)         |
|MITRE attack technique  |  [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/)     |
|MITRE attack sub-technique | [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)        |

**Kerberoasting specific suggested steps for prevention**:

1. Require use of [long and complex passwords for users with service principal accounts](/windows/security/threat-protection/security-policy-settings/minimum-password-length).
1. [Replace the user account by Group Managed Service Account (gMSA)](/windows-server/security/group-managed-service-accounts/group-managed-service-accounts-overview).

> [!NOTE]
> Security principal reconnaissance (LDAP) alerts are supported by Defender for Identity sensors only.

## Suspected Kerberos SPN exposure (external ID 2410)

**Severity**: High

**Description**:

Attackers use tools to enumerate service accounts and their respective SPNs (Service principal names), request a Kerberos service ticket for the services, capture the Ticket Granting Service (TGS) tickets from memory and extract their hashes, and save them for later use in an offline brute force attack.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/)        |
|MITRE attack sub-technique |   [Kerberoasting (T1558.003)](https://attack.mitre.org/techniques/T1558/003/)    |

## Suspected AS-REP Roasting attack (external ID 2412)

**Severity**: High

**Description**:

Attackers use tools to detect accounts with their *Kerberos preauthentication* disabled and send AS-REQ requests without the encrypted timestamp. In response they receive AS-REP messages with TGT data, which may be encrypted with an insecure algorithm such as RC4, and save them for later use in an offline password cracking attack (similar to Kerberoasting) and expose plaintext credentials.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/)        |
|MITRE attack sub-technique |   [AS-REP Roasting (T1558.004)](https://attack.mitre.org/techniques/T1558/004/)    |

**Suggested steps for prevention**:

1. Enable Kerberos preauthentication. For more information about account attributes and how to remediate them, see [Unsecure account attributes](/defender-for-identity/security-assessment-unsecure-account-attributes).

## Suspicious modification of a sAMNameAccount attribute (CVE-2021-42278 and CVE-2021-42287 exploitation) (external ID 2419)

**Severity**: High

**Description**:

An attacker can create a straightforward path to a Domain Admin user in an Active Directory environment that isn't patched. This escalation attack allows attackers to easily elevate their privilege to that of a Domain Admin once they compromise a regular user in the domain.

When performing an authentication using Kerberos, Ticket-Granting-Ticket (TGT) and the Ticket-Granting-Service (TGS) are requested from the Key Distribution Center (KDC). If a TGS was requested for an account that couldn't be found, the KDC attemptS to search it again with a trailing &dollar;.

When processing the TGS request, the KDC fails its lookup for the requestor machine *DC1* the attacker created. Therefore, the KDC performs another lookup appending a trailing &dollar;. The lookup succeeds. As a result, the KDC issues the ticket using the privileges of *DC1$*.

Combining CVEs CVE-2021-42278 and CVE-2021-42287, an attacker with domain user credentials can leverage them for granting access as a domain admin.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Access Token Manipulation (T1134)](https://attack.mitre.org/techniques/T1134),[Exploitation for Privilege Escalation (T1068)](https://attack.mitre.org/techniques/T1068),[Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558)     |
|MITRE attack sub-technique | [Token Impersonation/Theft (T1134.001)](https://attack.mitre.org/techniques/T1134/001/)        |

<a name="honeytoken-activity-external-id-2014"></a>

## Honeytoken authentication activity (external ID 2014)

*Previous name:* Honeytoken activity

**Severity**: Medium

**Description**:

Honeytoken accounts are decoy accounts set up to identify and track malicious activity that involves these accounts. Honeytoken accounts should be left unused while having an attractive name to lure attackers (for example, SQL-Admin). Any authentication activity from them might indicate malicious behavior.
For more information on honeytoken accounts, see [Manage sensitive or honeytoken accounts](/defender-for-identity/entity-tags).

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|Secondary MITRE tactic    | [Discovery](https://attack.mitre.org/tactics/TA0007)        |
|MITRE attack technique  | [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/)        |
|MITRE attack sub-technique | [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)        |

## Suspected DCSync attack (replication of directory services) (external ID 2006)

*Previous name:* Malicious replication of directory services

**Severity**: High

**Description**:

Active Directory replication is the process by which changes that are made on one domain controller are synchronized with all other domain controllers. Given necessary permissions, attackers can initiate a replication request, allowing them to retrieve the data stored in Active Directory, including password hashes.

In this detection, an alert is triggered when a replication request is initiated from a computer that isn't a domain controller.

> [!NOTE]
> If you have domain controllers on which Defender for Identity sensors are not installed, those domain controllers are not covered by Defender for Identity. When deploying a new domain controller on an unregistered or unprotected domain controller, it may not immediately be identified by Defender for Identity as a domain controller. It is highly recommended to install the Defender for Identity sensor on every domain controller to get full coverage.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|Secondary MITRE tactic    | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003)      |
|MITRE attack technique  | [OS Credential Dumping (T1003)](https://attack.mitre.org/techniques/T1003/)        |
|MITRE attack sub-technique | [DCSync (T1003.006)](https://attack.mitre.org/techniques/T1003/006/)        |

**Suggested steps for prevention:**:

Validate the following permissions:

1. Replicate directory changes.
1. Replicate directory changes all.
1. For more information, see [Grant Active Directory Domain Services permissions for profile synchronization in SharePoint Server 2013](/SharePoint/administration/user-profile-service-administration). You can use [AD ACL Scanner](/archive/blogs/pfesweplat/take-control-over-ad-permissions-and-the-ad-acl-scanner-tool) or create a Windows PowerShell script to determine who in the domain has these permissions.

## Suspected AD FS DKM key read (external ID 2413)

**Severity**: High

**Description**:

The token signing and token decryption certificate, including the Active Directory Federation Services (AD FS) private keys, are stored in the AD FS configuration database. The certificates are encrypted using a technology called Distribute Key Manager. AD FS creates and uses these DKM keys when needed. To perform attacks like Golden SAML, the attacker would need the private keys that sign the SAML objects, similarly to how the **krbtgt** account is needed for Golden Ticket attacks. Using the AD FS user account, an attacker can access the DKM key and decrypt the certificates used to sign SAML tokens. This detection tries to find any actors that try to read the DKM key of AD FS object.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Unsecured Credentials (T1552)](https://attack.mitre.org/techniques/T1552/)        |
|MITRE attack sub-technique | [Unsecured Credentials: Private Keys (T1552.004)](https://attack.mitre.org/techniques/T1552/004/)  |

## Suspected DFSCoerce attack using Distributed File System Protocol (external ID 2426)

**Severity**: High

**Description**:

DFSCoerce attack can be used to force a domain controller to authenticate against a remote machine which is under an attacker’s control using the MS-DFSNM API, which triggers NTLM authentication. This, ultimately, enables a threat actor to launch an NTLM relay attack.  

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Forced Authentication (T1187)](https://attack.mitre.org/techniques/T1187/)        |
|MITRE attack sub-technique | N/A |

## Suspicious Kerberos delegation attempt using BronzeBit method (CVE-2020-17049 exploitation) (external ID 2048)

**Severity**: Medium

**Description**:

Exploiting a vulnerability (CVE-2020-17049), attackers attempt suspicious Kerberos delegation using the BronzeBit method. This could lead to unauthorized privilege escalation and compromise the security of the Kerberos authentication process. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/)        |
|MITRE attack sub-technique | N/A |

## Abnormal Active Directory Federation Services (AD FS) authentication using a suspicious certificate (external ID 2424)

**Severity**: High

**Description**:

Anomalous authentication attempts using suspicious certificates in Active Directory Federation Services (AD FS) may indicate potential security breaches. Monitoring and validating certificates during AD FS authentication are crucial for preventing unauthorized access. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Forge Web Credentials (T1606)](https://attack.mitre.org/techniques/T1606/)        |
|MITRE attack sub-technique | N/A |

> [!NOTE]
> Abnormal Active Directory Federation Services (AD FS) authentication using a suspicious certificate alerts are only supported by Defender for Identity sensors on AD FS.

## Suspected account takeover using shadow credentials (external ID 2431)

**Severity**: High

**Description**:

The use of shadow credentials in an account takeover attempt suggests malicious activity. Attackers may attempt to exploit weak or compromised credentials to gain unauthorized access and control over user accounts. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [OS Credential Dumping (T1003)](https://attack.mitre.org/techniques/T1003/)        |
|MITRE attack sub-technique | N/A |

## Suspected suspicious Kerberos ticket request (external ID 2418)

**Severity**: High

**Description**:

This attack involves the suspicion of abnormal Kerberos ticket requests. Attackers may attempt to exploit vulnerabilities in the Kerberos authentication process, potentially leading to unauthorized access and compromise of the security infrastructure. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|Secondary MITRE tactic    | [Collection (TA0009)](https://attack.mitre.org/tactics/TA0009)      |
|MITRE attack technique  | [Adversary-in-the-Middle (T1557)](https://attack.mitre.org/techniques/T1557/)        |
|MITRE attack sub-technique | [LLMNR/NBT-NS Poisoning and SMB Relay (T1557.001)](https://attack.mitre.org/techniques/T1557/001/)  |

## Password spray against OneLogin 

**Severity**: High

**Description**:

In Password spray, attackers try to guess small subset of passwords against large number of users. This is done in order to try and find if any of the users is using known\weak password. 
We recommend investigating the source IP performing the failed logins to determine whether they're legitimate or not. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Brute Force (T1110)](https://attack.mitre.org/techniques/T1110/)        |
|MITRE attack sub-technique | [Password Spraying (T1110.003)](https://attack.mitre.org/techniques/T1110/003/)  |

## Suspicious OneLogin MFA fatigue 

**Severity**: High

**Description**:

In MFA fatigue, attackers send multiple MFA attempts to user while trying to make them feel there's a bug in the system that keeps showing MFA requests which ask to allow the login or deny. Attackers try to force the victim to allow the login, which will stop the notifications and allow the attacker to login to the system. 

We recommend investigating the source IP performing the failed MFA attempts to determine whether they're legitimate or not and if the user is performing logins. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)  |
|---------|---------|
|MITRE attack technique  | [Multifactor Authentication Request Generation (T1621)](https://attack.mitre.org/techniques/T1621/)        |
|MITRE attack sub-technique | N/A  |

## See also

- [Investigate assets](investigate-assets.md)
- [Understanding security alerts](understanding-security-alerts.md)
- [Manage security alerts](/defender-for-identity/manage-security-alerts)
- [Defender for Identity SIEM log reference](cef-format-sa.md)
- [Working with lateral movement paths](/defender-for-identity/understand-lateral-movement-paths)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)


