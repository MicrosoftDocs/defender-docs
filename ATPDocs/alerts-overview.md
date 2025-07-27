---
title: Security alerts
description: This article provides a list of the security alerts issued by Microsoft Defender for Identity.
ms.date: 05/08/2025
ms.topic: reference
ms.reviewer: rlitinsky
---

# Security alerts in Microsoft Defender for Identity

## What are Microsoft Defender for Identity security alerts?

Microsoft Defender for Identity security alerts provide information about the suspicious activities detected by Defender for Identity, and the actors and computers involved in each threat. Alert evidence lists contain direct links to the involved users and computers, to help make your investigations easy and direct.

> [!NOTE]
> Defender for Identity isn't designed to serve as an auditing or logging solution that captures every single operation or activity on the servers where the sensor is installed. It only captures the data required for its detection and recommendation mechanisms.

The Identity alerts page gives you cross-domain signal enrichment and  automated identity response capabilities. The benefit of investigating alerts with [Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-defender) is that Microsoft Defender for Identity alerts are correlated with information obtained from each of the other products in the suite. These enhanced alerts are consistent with the other Microsoft Defender XDR alert formats originating from [Microsoft Defender for Office 365](/microsoft-365/security/office-365-security) and [Microsoft Defender for Endpoint](/microsoft-365/security/defender-endpoint).

Alerts originating from Defender for Identity trigger [Microsoft Defender XDR automated investigation and response (AIR)](/microsoft-365/security/defender/m365d-autoir) capabilities, including automatically remediating alerts and the mitigation of tools and processes that can contribute to the suspicious activity.

Microsoft Defender for Identity alerts currently appear in two different layouts in the Microsoft Defender XDR portal. While the alert views may show different information, all alerts are based on detections from Defender for Identity sensors. The differences in layout and information shown are part of an ongoing transition to a unified alerting experience across Microsoft Defender products.

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [View and manage alerts](understanding-security-alerts.md).

For information about **True positive (TP)**, **Benign true positive (B-TP)**, and **False positive (FP)**, see [security alert classifications](understanding-security-alerts.md#classify-security-alerts).

## Alert categories

Defender for Identity security alerts are divided into the following categories or phases, like the phases seen in a typical cyber-attack kill chain. Learn more about each phase, the alerts designed to detect each attack, and how to use the alerts to help protect your network using the following links:

1. [Reconnaissance and discovery alerts](#reconnaissance-and-discovery-alerts)
1. [Persistence and privilege escalation alerts](persistence-privilege-escalation-alerts.md)
1. [Credential access alerts](credential-access-alerts.md)
1. [Lateral movement alerts](lateral-movement-alerts.md)
1. [Other alerts](other-alerts.md)

 
## Reconnaissance and discovery alerts

Reconnaissance and discovery consist of techniques an adversary may use to gain knowledge about the system and internal network. These techniques help adversaries observe the environment and orient themselves before deciding how to act. They also allow adversaries to explore what they can control and what’s around their entry point to discover how it could benefit their current objective. Native operating system tools are often used toward this post-compromise information-gathering objective. In Microsoft Defender for Identity, these alerts usually involve internal account enumeration with different techniques.





|Security alert|Severity|External ID|
|------------|----------|----------|
|<details><summary>Account enumeration reconnaissance</summary>
<br> **Previous name**: Reconnaissance using account enumeration<br>
</details>|Medium|2023|
|<details><summary>Account Enumeration reconnaissance (LDAP)</summary>
<br>**Description**:<br>
In account enumeration reconnaissance, an attacker uses a dictionary with thousands of user names, or tools such as Ldapnomnom in an attempt to guess user names in the domain.  <br>
**LDAP**: Attacker makes LDAP Ping requests (cLDAP) using these names to try to find a valid username in the domain. If a guess successfully determines a username, the attacker may receive a response indicating that the user exists in the domain.  <br>
In this alert detection, Defender for Identity detects where the account enumeration attack came from, the total number of guess attempts, and how many attempts were matched. If there are too many unknown users, Defender for Identity detects it as a suspicious activity. The alert is based on LDAP search activities from sensors running on domain controller servers. <br>
**Learning period**:<br>
None<br>
**MITRE**:<br>
**MITRE**:<br>
- **Primary MITRE tactic**: [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007/)<br>
- **MITRE attack technique**: [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/)<br>
- **MITRE attack sub-technique**: [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)<br>
</details>|Medium|2437|
|<details><summary>Network-mapping reconnaissance (DNS)</summary><br>
**Previous name**: Reconnaissance using DNS<br>
**Description**:<br>
Your DNS server contains a map of all the computers, IP addresses, and services in your network. This information is used by attackers to map your network structure and target interesting computers for later steps in their attack.<br>
There are several query types in the DNS protocol. This Defender for Identity security alert detects suspicious requests, either requests using an AXFR (transfer)  originating from non-DNS servers, or those using an excessive number of requests.<br>
**Learning period**:<br>
Eight days from the start of domain controller monitoring.<br>
**MITRE**:<br>-  **Primary MITRE tactic**:  [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007) <br>-  **MITRE attack technique**:    [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [Network Service Scanning (T1046)](https://attack.mitre.org/techniques/T1046/), [Remote System Discovery (T1018)](https://attack.mitre.org/techniques/T1018/)     <br>-  **MITRE attack sub-technique**:   N/A       <br>
**Suggested steps for prevention**:<br>
It's important to preventing future attacks using AXFR queries by securing your internal DNS server.<br>
- Secure your internal DNS server to prevent reconnaissance using DNS by disabling zone transfers or by [restricting zone transfers](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee649273(v=ws.10)) only to specified IP addresses. Modifying zone transfers is one task among a checklist that should be addressed for [securing your DNS servers from both internal and external attacks](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee649273(v=ws.10)).
</details>|Medium|2007|
|<details><summary>User and IP address reconnaissance (SMB)</summary>
**Previous name**: Reconnaissance using SMB Session Enumeration<br>
**Description**:<br>
Enumeration using Server Message Block (SMB) protocol enables attackers to get information about where users recently logged on. Once attackers have this information, they can move laterally in the network to get to a specific sensitive account.<br>
In this detection, an alert is triggered when an SMB session enumeration is performed against a domain controller.<br>
**Learning period**:<br>
None<br>
**MITRE**:<br>
- **Primary MITRE tactic**: [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007)<br>
- **MITRE attack technique**: [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [Network Service Scanning (T1046)](https://attack.mitre.org/techniques/T1046/), [Remote System Discovery (T1018)](https://attack.mitre.org/techniques/T1018/)<br>
- **MITRE attack sub-technique**: N/A<br>
</details>|Medium|2012|
|<details><summary>User and Group membership reconnaissance (SAMR)</summary>
**Previous name**: Reconnaissance using directory services queries<br>
**Description**:<br>
User and group membership reconnaissance are used by attackers to map the directory structure and target privileged accounts for later steps in their attack. The Security Account Manager Remote (SAM-R) protocol is one of the methods used to query the directory to perform this type of mapping.<br>
In this detection, no alerts are triggered in the first month after Defender for Identity is deployed (learning period). During the learning period, Defender for Identity profiles which SAM-R queries are made from which computers, both enumeration and individual queries of sensitive accounts.<br>
**Learning period**:<br>
Four weeks per domain controller starting from the first network activity of SAMR against the specific DC.<br>
**MITRE**:<br>-  **Primary MITRE tactic**:  [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007) <br>-  **MITRE attack technique**:  [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [Permission Groups Discovery (T1069)](https://attack.mitre.org/techniques/T1069/)        <br>-  **MITRE attack sub-technique**:   [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/), [Domain Group (T1069.002)](https://attack.mitre.org/techniques/T1069/002/)       <br>
**Suggested steps for prevention**:<br>
1. Apply Network access and restrict clients allowed to make remote calls to SAM group policy.
</details>|Medium|2021|
|<details><summary>Active Directory attributes reconnaissance (LDAP)</summary>
**Description**:<br>
Active Directory LDAP reconnaissance is used by attackers to gain critical information about the domain environment. This information can help attackers map the domain structure, as well as identify privileged accounts for use in later steps in their attack kill chain. Lightweight Directory Access Protocol (LDAP) is one of the most popular methods used for both legitimate and malicious purposes to query Active Directory.<br>
**Learning period**:<br>
None<br>
**MITRE**:<br>
- **Primary MITRE tactic**: [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007)<br>
- **MITRE attack technique**: [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [System Network Connections Discovery (T1049)](https://attack.mitre.org/techniques/T1049/)<br>
- **MITRE attack sub-technique**: [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)<br>
</details>|Medium|2210|
|<details><summary>Honeytoken was queried via LDAP</summary>
**Description**:<br>
User reconnaissance is used by attackers to map the directory structure and target privileged accounts for later steps in their attack. Lightweight Directory Access Protocol (LDAP) is one of the most popular methods used for both legitimate and malicious purposes to query Active Directory.<br>
In this detection, Microsoft Defender for Identity will trigger this alert for any reconnaissance activities against a pre-configured [honeytoken user](entity-tags.md).<br>
**Learning period**:<br>
None<br>
**MITRE**:<br>
- **Primary MITRE tactic**: [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007)<br>
- **MITRE attack technique**: [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [Permission Groups Discovery (T1069)](https://attack.mitre.org/techniques/T1069/)<br>
- **MITRE attack sub-technique**: [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/), [Domain Group (T1069.002)](https://attack.mitre.org/techniques/T1069/002/)<br>
</details>|Low|2429|
|<details><summary>Suspicious Okta account Enumeration</summary>
**Description**:<br>
In account enumeration, attackers will try to guess user names by performing logins into Okta with users which are not belonged to the organization. <br>
We will recommend investigating to source IP performing the failed attempts and determine whether they are legitimate or not. <br>
**Learning period**:<br>
None<br>
**MITRE**:<br>
**MITRE**:<br>
 - **Primary MITRE tactic**: [Initial Access (TA0001)](https://attack.mitre.org/tactics/TA0001/), [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005/), [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003/), [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004/)<br>
 - **MITRE attack technique**: [Valid Accounts (T1078)](https://attack.mitre.org/techniques/T1087/)<br>
 - **MITRE attack sub-technique**: [Cloud Accounts (T1078.004)](https://attack.mitre.org/techniques/T1078/004/)<br>
</details>|High|    |

##  Map security alerts to unique external ID and MITRE ATT&CK Matrix tactics

The following table lists the mapping between alert names, their corresponding unique external IDs, their severity, and their MITRE ATT&CK Matrix&trade; tactic. When used with scripts or automation, Microsoft recommends use of alert external IDs in place of alert names, as only security alert external IDs are permanent, and not subject to change.

| Security  alert name                                         | Unique  external ID | Severity                                                 | MITRE  ATT&CK Matrix™                                        |
| ------------------------------------------------------------ | ------------------- | -------------------------------------------------------- | ------------------------------------------------------------ |
| [Suspected SID-History injection](persistence-privilege-escalation-alerts.md#suspected-sid-history-injection-external-id-1106)              | 1106                | High                                                   | Privilege Escalation                                             |
| [Suspected   overpass-the-hash attack (Kerberos)](lateral-movement-alerts.md#suspected-overpass-the-hash-attack-kerberos-external-id-2002)              | 2002                | Medium                                                   | Lateral movement                                             |
| [Account   enumeration reconnaissance](reconnaissance-discovery-alerts.md#account-enumeration-reconnaissance-external-id-2003)                         | 2003                | Medium                                                   | Discovery                                                    |
| [Suspected   Brute Force attack (LDAP)](credential-access-alerts.md#suspected-brute-force-attack-ldap-external-id-2004)                        | 2004                | Medium                                                   | Credential access                                            |
| [Suspected   DCSync attack (replication of directory services)](credential-access-alerts.md#suspected-dcsync-attack-replication-of-directory-services-external-id-2006) | 2006                | High                                                     | Credential access, Persistence                               |
| [Network   mapping reconnaissance (DNS)](reconnaissance-discovery-alerts.md#network-mapping-reconnaissance-dns-external-id-2007)                       | 2007                | Medium                                                   | Discovery                                                    |
| [Suspected over-pass-the-hash attack (forced encryption type)](lateral-movement-alerts.md#suspected-over-pass-the-hash-attack-forced-encryption-type-external-id-2008)                       | 2008                | Medium                                                   | Lateral movement                                                    |
| [Suspected   Golden Ticket usage (encryption downgrade)](persistence-privilege-escalation-alerts.md#suspected-golden-ticket-usage-encryption-downgrade-external-id-2009)       | 2009                | Medium                                                   | Persistence, Privilege Escalation, Lateral movement          |
| [Suspected   Skeleton Key attack (encryption downgrade)](persistence-privilege-escalation-alerts.md#suspected-skeleton-key-attack-encryption-downgrade-external-id-2010)       | 2010                | Medium                                                   | Persistence, Lateral movement                                |
| [User   and IP address reconnaissance (SMB)](reconnaissance-discovery-alerts.md#user-and-ip-address-reconnaissance-smb-external-id-2012)                   | 2012                | Medium                                                   | Discovery                                                    |
| [Suspected   Golden Ticket usage (forged authorization data)](credential-access-alerts.md#suspected-golden-ticket-usage-forged-authorization-data-external-id-2013)  | 2013                | High                                                     | Credential access                                            |
| [Honeytoken  authentication activity](credential-access-alerts.md#honeytoken-activity-external-id-2014)                                        | 2014                | Medium                                                   | Credential access, Discovery                                 |
| [Suspected   identity theft (pass-the-hash)](lateral-movement-alerts.md#suspected-identity-theft-pass-the-hash-external-id-2017)                   | 2017                | High                                                     | Lateral movement                                             |
| [Suspected   identity theft (pass-the-ticket)](lateral-movement-alerts.md#suspected-identity-theft-pass-the-ticket-external-id-2018)                 | 2018                | High or Medium                                           | Lateral movement                                             |
| [Remote   code execution attempt](other-alerts.md#remote-code-execution-attempt-external-id-2019)                              | 2019                | Medium                                                   | Execution,  Persistence, Privilege escalation, Defense evasion, Lateral movement |
| [Malicious   request of Data Protection API master key](credential-access-alerts.md#malicious-request-of-data-protection-api-master-key-external-id-2020)        | 2020                | High                                                     | Credential access                                            |
| [User   and Group membership reconnaissance (SAMR)](reconnaissance-discovery-alerts.md#user-and-group-membership-reconnaissance-samr-external-id-2021)            | 2021                | Medium                                                   | Discovery                                                    |
| [Suspected   Golden Ticket usage (time anomaly)](persistence-privilege-escalation-alerts.md#suspected-golden-ticket-usage-time-anomaly-external-id-2022)               | 2022                | High                                                     | Persistence, Privilege Escalation, Lateral movement          |
| [Suspected   Brute Force attack (Kerberos, NTLM)](credential-access-alerts.md#suspected-brute-force-attack-kerberos-ntlm-external-id-2023)             | 2023                | Medium                                                   | Credential access                                            |
| [Suspicious   additions to sensitive groups](persistence-privilege-escalation-alerts.md#suspicious-additions-to-sensitive-groups-external-id-2024)                   | 2024                | Medium                                                   | Persistence, Credential access,                              |
| [Suspicious   VPN connection](other-alerts.md#suspicious-vpn-connection-external-id-2025)                                  | 2025                | Medium                                                   | Defense evasion, Persistence                                 |
| [Suspicious   service creation](other-alerts.md#suspicious-service-creation-external-id-2026)                                | 2026                | Medium                                                   | Execution,  Persistence, Privilege Escalation, Defense evasion, Lateral movement |
| [Suspected   Golden Ticket usage (nonexistent account)](persistence-privilege-escalation-alerts.md#suspected-golden-ticket-usage-nonexistent-account-external-id-2027)        | 2027                | High                                                     | Persistence, Privilege Escalation, Lateral movement          |
| [Suspected   DCShadow attack (domain controller promotion)](other-alerts.md#suspected-dcshadow-attack-domain-controller-promotion-external-id-2028)    | 2028                | High                                                     | Defense evasion                                              |
| [Suspected   DCShadow attack (domain controller replication request)](other-alerts.md#suspected-dcshadow-attack-domain-controller-replication-request-external-id-2029) | 2029                | High                                                     | Defense evasion                                              |
| [Data   exfiltration over SMB](other-alerts.md#data-exfiltration-over-smb-external-id-2030)                                 | 2030                | High                                                     | Exfiltration, Lateral movement, Command, and control          |
| [Suspicious   communication over DNS](other-alerts.md#suspicious-communication-over-dns-external-id-2031)                          | 2031                | Medium                                                   | Exfiltration                                                 |
| [Suspected   Golden Ticket usage (ticket anomaly)](persistence-privilege-escalation-alerts.md#suspected-golden-ticket-usage-ticket-anomaly-external-id-2032)             | 2032                | High                                                     | Persistence, Privilege Escalation, Lateral movement          |
| [Suspected   Brute Force attack (SMB)](lateral-movement-alerts.md#suspected-brute-force-attack-smb-external-id-2033)                         | 2033                | Medium                                                   | Lateral movement                                             |
| [Suspected   use of Metasploit hacking framework](lateral-movement-alerts.md#suspected-use-of-metasploit-hacking-framework-external-id-2034)              | 2034                | Medium                                                   | Lateral movement                                             |
| [Suspected   WannaCry ransomware attack](lateral-movement-alerts.md#suspected-wannacry-ransomware-attack-external-id-2035)                      | 2035                | Medium                                                   | Lateral movement                                             |
| [Remote code execution over DNS](lateral-movement-alerts.md#remote-code-execution-attempt-over-dns-external-id-2036)                               | 2036                | Medium                                                   | Lateral movement, Privilege escalation                       |
| [Suspected   NTLM relay attack](lateral-movement-alerts.md#suspected-ntlm-relay-attack-exchange-account-external-id-2037)                                | 2037                | Medium or Low if observed  using signed NTLM v2 protocol | Lateral  movement, Privilege escalation                      |
| [Security   principal reconnaissance (LDAP)](credential-access-alerts.md#security-principal-reconnaissance-ldap-external-id-2038)                   | 2038                | High (in case resolutions issues or Specific Tool detected) and Medium                                                   | Credential access                                            |
| [Suspected   NTLM authentication tampering](lateral-movement-alerts.md#suspected-ntlm-authentication-tampering-external-id-2039)                    | 2039                | Medium                                                   | Lateral  movement, Privilege escalation                      |
| [Suspected   Golden Ticket usage (ticket anomaly using RBCD)](persistence-privilege-escalation-alerts.md#suspected-golden-ticket-usage-ticket-anomaly-using-rbcd-external-id-2040)  | 2040                | High                                                     | Persistence                                                  |
| [Suspected   rogue Kerberos certificate usage](lateral-movement-alerts.md#suspected-rogue-kerberos-certificate-usage-external-id-2047)                 | 2047                | High                                                     | Lateral movement                                             |
| [Suspicious Kerberos delegation attempt using BronzeBit method (CVE-2020-17049 exploitation)](credential-access-alerts.md#suspicious-kerberos-delegation-attempt-using-bronzebit-method-cve-2020-17049-exploitation-external-id-2048)                 | 2048                | Medium                                                     | Credential access                                             |
| [Active   Directory attributes reconnaissance (LDAP)](reconnaissance-discovery-alerts.md#active-directory-attributes-reconnaissance-ldap-external-id-2210)          | 2210                | Medium                                                   | Discovery                                                    |
| [Suspected   SMB packet manipulation (CVE-2020-0796 exploitation)](lateral-movement-alerts.md#suspected-smb-packet-manipulation-cve-2020-0796-exploitation---external-id-2406) | 2406                | High                                                     | Lateral movement                                             |
| [Suspected   Kerberos SPN exposure](credential-access-alerts.md#suspected-kerberos-spn-exposure-external-id-2410)         | 2410                | High                                                     | Credential access                                            |
| [Suspected   Netlogon privilege elevation attempt (CVE-2020-1472 exploitation)](persistence-privilege-escalation-alerts.md#suspected-netlogon-privilege-elevation-attempt-cve-2020-1472-exploitation-external-id-2411)| 2411                | High                                                     | Privilege Escalation                                         |
| [Suspected   AS-REP Roasting attack](credential-access-alerts.md#suspected-as-rep-roasting-attack-external-id-2412)                           | 2412                | High                                                     | Credential access                                            |
| [Suspected AD FS DKM key read](credential-access-alerts.md#suspected-ad-fs-dkm-key-read-external-id-2413)     | 2413                | High                                                     | Credential access                                             |
| [Exchange   Server Remote Code Execution (CVE-2021-26855)](lateral-movement-alerts.md#exchange-server-remote-code-execution-cve-2021-26855-external-id-2414)     | 2414                | High                                                     | Lateral movement                                             |
| [Suspected   exploitation attempt on Windows Print Spooler service](lateral-movement-alerts.md#suspected-exploitation-attempt-on-windows-print-spooler-service-external-id-2415) | 2415                | High or Medium                                           | Lateral movement                                             |
| [Suspicious   network connection over Encrypting File System Remote Protocol](lateral-movement-alerts.md#suspicious-network-connection-over-encrypting-file-system-remote-protocol-external-id-2416) | 2416                | High or Medium                                           | Lateral movement                                             |
| [Suspected suspicious Kerberos ticket request](credential-access-alerts.md#suspected-suspicious-kerberos-ticket-request-external-id-2418) | 2418                | High                                           | Credential access                                             |
| [Suspicious modification of a sAMNameAccount attribute (CVE-2021-42278 and CVE-2021-42287 exploitation)](credential-access-alerts.md#suspicious-modification-of-a-samnameaccount-attribute-cve-2021-42278-and-cve-2021-42287-exploitation-external-id-2419) | 2419                | High                                                     | Credential access                                            |
| [Suspicious modification of the trust relationship of AD FS server](persistence-privilege-escalation-alerts.md#suspicious-modification-of-the-trust-relationship-of-ad-fs-server--external-id-2420) | 2420                | Medium                                                     | Privilege Escalation                                            |
| [Suspicious modification of a dNSHostName attribute (CVE-2022-26923)](persistence-privilege-escalation-alerts.md#suspicious-modification-of-a-dnshostname-attribute-cve-2022-26923--external-id-2421) | 2421                | High                                                     | Privilege Escalation                                            |
| [Suspicious Kerberos delegation attempt by a newly created computer](persistence-privilege-escalation-alerts.md#suspicious-kerberos-delegation-attempt-by-a-newly-created-computer--external-id-2422) | 2422                | High                                                     | Privilege Escalation                                            |
| [Suspicious modification of the Resource Based Constrained Delegation attribute by a machine account](persistence-privilege-escalation-alerts.md#suspicious-modification-of-the-resource-based-constrained-delegation-attribute-by-a-machine-account--external-id-2423) | 2423                | High                                                     | Privilege Escalation                                            |
| [Abnormal Active Directory Federation Services (AD FS) authentication using a suspicious certificate](credential-access-alerts.md#abnormal-active-directory-federation-services-ad-fs-authentication-using-a-suspicious-certificate-external-id-2424) | 2424                | High                                                     | Credential access                                            |
| [Suspicious certificate usage over Kerberos protocol (PKINIT)](lateral-movement-alerts.md#suspicious-certificate-usage-over-kerberos-protocol-pkinit-external-id-2425) | 2425                | High                                                     | Lateral movement                                            |
| [Suspected DFSCoerce attack using Distributed File System Protocol](credential-access-alerts.md#suspected-dfscoerce-attack-using-distributed-file-system-protocol-external-id-2426) | 2426                | High                                                     | Credential access                                            |
| [Honeytoken user attributes modified](persistence-privilege-escalation-alerts.md#honeytoken-user-attributes-modified-external-id-2427) | 2427                | High                                                     | Persistence                                            |
| [Honeytoken group membership changed](persistence-privilege-escalation-alerts.md#honeytoken-group-membership-changed-external-id-2428) | 2428                | High                                                     | Persistence                                           |
| [Honeytoken was queried via LDAP](reconnaissance-discovery-alerts.md#honeytoken-was-queried-via-ldap-external-id-2429) | 2429                | Low                                                     | Discovery                                           |
| [Suspicious modification of domain AdminSdHolder](persistence-privilege-escalation-alerts.md#suspicious-modification-of-domain-adminsdholder--external-id-2430) | 2430                | High                                                     | Persistence                                            |
| [Suspected account takeover using shadow credentials](credential-access-alerts.md#suspected-account-takeover-using-shadow-credentials-external-id-2431) | 2431                | High                                                     | Credential access                                            |
| [Suspicious Domain Controller certificate request (ESC8)](persistence-privilege-escalation-alerts.md#suspicious-domain-controller-certificate-request-esc8--external-id-2432) | 2432                | High                                                     | Privilege escalation                                            |
| [Suspicious deletion of the certificate database entries](other-alerts.md#suspicious-deletion-of-the-certificate-database-entries--external-id-2433) | 2433                | Medium                                                     | Defense evasion                                            |
| [Suspicious disable of audit filters of AD CS](other-alerts.md#suspicious-disable-of-audit-filters-of-ad-cs---external-id-2434) | 2434                | Medium                                                     | Defense evasion                                            |
| [Suspicious modifications to the AD CS security permissions/settings](persistence-privilege-escalation-alerts.md#suspicious-modifications-to-the-ad-cs-security-permissionssettings--external-id-2435) | 2435                | Medium                                                     | Privilege escalation                                            |
| [Account Enumeration reconnaissance (LDAP)](reconnaissance-discovery-alerts.md#account-enumeration-reconnaissance-ldap-external-id-2437-preview) (Preview) | 2437 | Medium  | Account Discovery, Domain Account |
| [Directory Services Restore Mode Password Change](other-alerts.md#directory-services-restore-mode-password-change-external-id-2438) | 2438 | Medium  | Persistence, Account Manipulation |
|[Group Policy Tampering ](/defender-for-identity/other-alerts)|2440|Medium|Defense evasion|

> [!NOTE]
> Contact support to disable security alerts.

## See Also

- [View and manage security alerts](understanding-security-alerts.md)
- [Investigate security alerts](/defender-for-identity/investigate-security-alerts)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
