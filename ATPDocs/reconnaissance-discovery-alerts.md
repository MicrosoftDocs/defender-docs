---
title: Reconnaissance and discovery security alerts
description: This article explains Microsoft Defender for Identity alerts issued when reconnaissance and discovery attacks are detected against your organization.
ms.date: 04/16/2023
ms.topic: conceptual
---

# Reconnaissance and discovery alerts

Typically, cyberattacks are launched against any accessible entity, such as a low-privileged user, and then quickly move laterally until the attacker gains access to valuable assets. Valuable assets can be sensitive accounts, domain administrators, or highly sensitive data. Microsoft Defender for Identity identifies these advanced threats at the source throughout the entire attack kill chain and classifies them into the following phases:

1. **Reconnaissance and discovery**
1. [Persistence and privilege escalation alerts](persistence-privilege-escalation-alerts.md)
1. [Credential access alerts](credential-access-alerts.md)
1. [Lateral movement alerts](lateral-movement-alerts.md)
1. [Other alerts](other-alerts.md)

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [Understanding security alerts](understanding-security-alerts.md). For information about **True positive (TP)**, **Benign true positive (B-TP)**, and **False positive (FP)**, see [security alert classifications](understanding-security-alerts.md#security-alert-classifications).

The following security alerts help you identify and remediate **Reconnaissance and discovery** phase suspicious activities detected by Defender for Identity in your network.

Reconnaissance and discovery consist of techniques an adversary may use to gain knowledge about the system and internal network. These techniques help adversaries observe the environment and orient themselves before deciding how to act. They also allow adversaries to explore what they can control and what’s around their entry point to discover how it could benefit their current objective. Native operating system tools are often used toward this post-compromise information-gathering objective. In Microsoft Defender for Identity, these alerts usually involve internal account enumeration with different techniques.

## Account enumeration reconnaissance (external ID 2003)

*Previous name:* Reconnaissance using account enumeration

**Severity**: Medium

**Description**:

In account enumeration reconnaissance, an attacker uses a dictionary with thousands of user names, or tools such as KrbGuess in an attempt to guess user names in the domain.

**Kerberos**: Attacker makes Kerberos requests using these names to try to find a valid username in the domain. When a guess successfully determines a username, the attacker gets the **Preauthentication required** instead of **Security principal unknown** Kerberos error.

**NTLM**: Attacker makes NTLM authentication requests using the dictionary of names to try to find a valid username in the domain. If a guess successfully determines a username, the attacker gets the **WrongPassword (0xc000006a)** instead of **NoSuchUser (0xc0000064)** NTLM error.

In this alert detection, Defender for Identity detects where the account enumeration attack came from, the total number of guess attempts, and how many attempts were matched. If there are too many unknown users, Defender for Identity detects it as a suspicious activity. The alert is based on authentication events from sensors running on domain controller and AD FS / AD CS servers.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  |[Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007/)  |
|---------|---------|
|MITRE attack technique  | [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/)        |
|MITRE attack sub-technique | [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)        |

**Suggested steps for prevention**:

1. Enforce [Complex and long passwords](/windows/device-security/security-policy-settings/password-policy) in the organization. Complex and long passwords provide the necessary first level of security against brute-force attacks. Brute force attacks are typically the next step in the cyber-attack kill chain following enumeration.

## Account Enumeration reconnaissance (LDAP) (external ID 2437) (Preview)

**Severity**: Medium

**Description**:

In account enumeration reconnaissance, an attacker uses a dictionary with thousands of user names, or tools such as Ldapnomnom in an attempt to guess user names in the domain.  

**LDAP**: Attacker makes LDAP Ping requests (cLDAP) using these names to try to find a valid username in the domain. If a guess successfully determines a username, the attacker may receive a response indicating that the user exists in the domain.  

In this alert detection, Defender for Identity detects where the account enumeration attack came from, the total number of guess attempts, and how many attempts were matched. If there are too many unknown users, Defender for Identity detects it as a suspicious activity. The alert is based on LDAP search activities from sensors running on domain controller servers. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  |[Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007/)  |
|---------|---------|
|MITRE attack technique  | [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/)        |
|MITRE attack sub-technique | [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)        |

## Network-mapping reconnaissance (DNS) (external ID 2007)

*Previous name:* Reconnaissance using DNS

**Severity**: Medium

**Description**:

Your DNS server contains a map of all the computers, IP addresses, and services in your network. This information is used by attackers to map your network structure and target interesting computers for later steps in their attack.

There are several query types in the DNS protocol. This Defender for Identity security alert detects suspicious requests, either requests using an AXFR (transfer)  originating from non-DNS servers, or those using an excessive number of requests.

**Learning period**:

This alert has a learning period of eight days from the start of domain controller monitoring.

**MITRE**:

|Primary MITRE tactic  | [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007) |
|---------|---------|
|MITRE attack technique  |   [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [Network Service Scanning (T1046)](https://attack.mitre.org/techniques/T1046/), [Remote System Discovery (T1018)](https://attack.mitre.org/techniques/T1018/)     |
|MITRE attack sub-technique |  N/A       |

**Suggested steps for prevention**:

It's important to preventing future attacks using AXFR queries by securing your internal DNS server.

- Secure your internal DNS server to prevent reconnaissance using DNS by disabling zone transfers or by [restricting zone transfers](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee649273(v=ws.10)) only to specified IP addresses. Modifying zone transfers is one task among a checklist that should be addressed for [securing your DNS servers from both internal and external attacks](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee649273(v=ws.10)).

## User and IP address reconnaissance (SMB) (external ID 2012)

*Previous name:* Reconnaissance using SMB Session Enumeration

**Severity**: Medium

**Description**:

Enumeration using Server Message Block (SMB) protocol enables attackers to get information about where users recently logged on. Once attackers have this information, they can move laterally in the network to get to a specific sensitive account.

In this detection, an alert is triggered when an SMB session enumeration is performed against a domain controller.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007) |
|---------|---------|
|MITRE attack technique  | [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [System Network Connections Discovery (T1049)](https://attack.mitre.org/techniques/T1049/)        |
|MITRE attack sub-technique |  [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)       |

## User and Group membership reconnaissance (SAMR) (external ID 2021)

*Previous name:* Reconnaissance using directory services queries

**Severity**: Medium

**Description**:

User and group membership reconnaissance are used by attackers to map the directory structure and target privileged accounts for later steps in their attack. The Security Account Manager Remote (SAM-R) protocol is one of the methods used to query the directory to perform this type of mapping.
In this detection, no alerts are triggered in the first month after Defender for Identity is deployed (learning period). During the learning period, Defender for Identity profiles which SAM-R queries are made from which computers, both enumeration and individual queries of sensitive accounts.

**Learning period**:

Four weeks per domain controller starting from the first network activity of SAMR against the specific DC.

**MITRE**:

|Primary MITRE tactic  | [Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007) |
|---------|---------|
|MITRE attack technique  | [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [Permission Groups Discovery (T1069)](https://attack.mitre.org/techniques/T1069/)        |
|MITRE attack sub-technique |  [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/), [Domain Group (T1069.002)](https://attack.mitre.org/techniques/T1069/002/)       |

**Suggested steps for prevention**:

1. Apply Network access and restrict clients allowed to make remote calls to SAM group policy.

## Active Directory attributes reconnaissance (LDAP) (external ID 2210)

**Severity**: Medium

**Description**:

Active Directory LDAP reconnaissance is used by attackers to gain critical information about the domain environment. This information can help attackers map the domain structure, as well as identify privileged accounts for use in later steps in their attack kill chain. Lightweight Directory Access Protocol (LDAP) is one of the most popular methods used for both legitimate and malicious purposes to query Active Directory.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  |[Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007/)  |
|---------|---------|
|MITRE attack technique  | [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/), [Indirect Command Execution (T1202)](https://attack.mitre.org/techniques/T1202/), [Permission Groups Discovery (T1069)](https://attack.mitre.org/techniques/T1069/)        |
|MITRE attack sub-technique | [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/), [Domain Groups (T1069.002)](https://attack.mitre.org/techniques/T1069/002/)        |

## Honeytoken was queried via SAM-R (external ID 2439)

**Severity**: Low

**Description**:

User reconnaissance is used by attackers to map the directory structure and target privileged accounts for later steps in their attack. The Security Account Manager Remote (SAM-R) protocol is one of the methods used to query the directory to perform this type of mapping.
In this detection, Microsoft Defender for Identity will trigger this alert for any reconnaissance activities against a pre-configured [honeytoken user](entity-tags.md)

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  |[Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007/)  |
|---------|---------|
|MITRE attack technique  | [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/)|
|MITRE attack sub-technique | [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)|

## Honeytoken was queried via LDAP (external ID 2429)

**Severity**: Low

**Description**:

User reconnaissance is used by attackers to map the directory structure and target privileged accounts for later steps in their attack. Lightweight Directory Access Protocol (LDAP) is one of the most popular methods used for both legitimate and malicious purposes to query Active Directory.

In this detection, Microsoft Defender for Identity will trigger this alert for any reconnaissance activities against a pre-configured [honeytoken user](entity-tags.md).

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  |[Discovery (TA0007)](https://attack.mitre.org/tactics/TA0007/)  |
|---------|---------|
|MITRE attack technique  | [Account Discovery (T1087)](https://attack.mitre.org/techniques/T1087/)  |
|MITRE attack sub-technique | [Domain Account (T1087.002)](https://attack.mitre.org/techniques/T1087/002/)  |

## Suspicious Okta account Enumeration 

**Severity**: High

**Description**:

In account enumeration, attackers will try to guess user names by performing logins into Okta with users which are not belonged to the organization. 
We will recommend investigating to source IP performing the failed attempts and determine whether they are legitimate or not. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  |[Initial Access (TA0001)](https://attack.mitre.org/tactics/TA0001/), [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005/), [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003/), [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004/)  |
|---------|---------|
|MITRE attack technique  | [Valid Accounts (T1078)](https://attack.mitre.org/techniques/T1087/)  |
|MITRE attack sub-technique | [Cloud Accounts (T1078.004)](https://attack.mitre.org/techniques/T1078/004/)  |



## See also

- [Investigate assets](investigate-assets.md)
- [Understanding security alerts](understanding-security-alerts.md)
- [Manage security alerts](/defender-for-identity/manage-security-alerts)
- [Defender for Identity SIEM log reference](cef-format-sa.md)
- [Working with lateral movement paths](/defender-for-identity/understand-lateral-movement-paths)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)


