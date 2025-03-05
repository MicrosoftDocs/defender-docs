---
title: Persistence and privilege escalation security alerts
description: This article explains Microsoft Defender for Identity alerts issued when persistence attacks are detected against your organization.
ms.date: 04/17/2023
ms.topic: conceptual
---

# Persistence and privilege escalation alerts

Typically, cyberattacks are launched against any accessible entity, such as a low-privileged user, and then quickly move laterally until the attacker gains access to valuable assets. Valuable assets can be sensitive accounts, domain administrators, or highly sensitive data. Microsoft Defender for Identity identifies these advanced threats at the source throughout the entire attack kill chain and classifies them into the following phases:

1. [Reconnaissance and discovery alerts](reconnaissance-discovery-alerts.md)
1. **Persistence and privilege escalation**
1. [Credential access alerts](credential-access-alerts.md)
1. [Lateral movement alerts](lateral-movement-alerts.md)
1. [Other alerts](other-alerts.md)

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [Understanding security alerts](understanding-security-alerts.md). For information about **True positive (TP)**, **Benign true positive (B-TP)**, and **False positive (FP)**, see [security alert classifications](understanding-security-alerts.md#security-alert-classifications).

The following security alerts help you identify and remediate **Persistence and privilege escalation** phase suspicious activities detected by Defender for Identity in your network.

After the attacker uses techniques to keep access to different on-premises resources they start the Privilege Escalation phase, which consists of techniques that adversaries use to gain higher-level permissions on a system or network. Adversaries can often enter and explore a network with unprivileged access but require elevated permissions to follow through on their objectives. Common approaches are to take advantage of system weaknesses, misconfigurations, and vulnerabilities.

## Suspected Golden Ticket usage (encryption downgrade) (external ID 2009)

*Previous name:* Encryption downgrade activity

**Severity**: Medium

**Description**:

Encryption downgrade is a method of weakening Kerberos by downgrading the encryption level of different protocol fields that normally have the highest level of encryption. A weakened encrypted field can be an easier target to offline brute force attempts. Various attack methods utilize weak Kerberos encryption cyphers. In this detection, Defender for Identity learns the Kerberos encryption types used by computers and users, and alerts you when a weaker cypher is used that is unusual for the source computer and/or user and matches known attack techniques.

In a Golden Ticket alert, the encryption method of the TGT field of TGS_REQ (service request) message from the source computer was detected as downgraded compared to the previously learned behavior. This is not based on a time anomaly (as in the other Golden Ticket detection). In addition, in the case of this alert, there was no Kerberos authentication request associated with the previous service request, detected by Defender for Identity.

**Learning period**:

This alert has a learning period of 5 days from the start of domain controller monitoring.

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004), [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)        |
|MITRE attack technique  |  [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/)       |
|MITRE attack sub-technique |  [Golden Ticket(T1558.001)](https://attack.mitre.org/techniques/T1558/001/)       |

**Suggested steps for prevention**:

1. Make sure all domain controllers with operating systems up to Windows Server 2012 R2 are installed with [KB3011780](https://www.microsoft.com/download/details.aspx?id=44978) and all member servers and domain controllers up to 2012 R2 are up-to-date with [KB2496930](https://support.microsoft.com/help/2496930/ms11-013-vulnerabilities-in-kerberos-could-allow-elevation-of-privileg). For more information, see [Silver PAC](/security-updates/SecurityBulletins/2011/ms11-013) and [Forged PAC](/security-updates/SecurityBulletins/2014/ms14-068).

## Suspected Golden Ticket usage (nonexistent account) (external ID 2027)

Previous name: Kerberos golden ticket

**Severity**: High

**Description**:

Attackers with domain admin rights can compromise the KRBTGT account. Using the KRBTGT account, they can create a Kerberos ticket granting ticket (TGT) that provides authorization to any resource and set the ticket expiration to any arbitrary time. This fake TGT is called a "Golden Ticket" and allows attackers to achieve network persistence. In this detection, an alert is triggered by a nonexistent account.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004), [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)        |
|MITRE attack technique  |  [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/), [Exploitation for Privilege Escalation (T1068)](https://attack.mitre.org/techniques/T1068/), [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)       |
|MITRE attack sub-technique |  [Golden Ticket(T1558.001)](https://attack.mitre.org/techniques/T1558/001/)  

## Suspected Golden Ticket usage (ticket anomaly) (external ID 2032)

**Severity**: High

**Description**:

Attackers with domain admin rights can compromise the KRBTGT account. Using the KRBTGT account, they can create a Kerberos ticket granting ticket (TGT) that provides authorization to any resource and set the ticket expiration to any arbitrary time. This fake TGT is called a "Golden Ticket" and allows attackers to achieve network persistence. Forged Golden Tickets of this type have unique characteristics this detection is specifically designed to identify.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004), [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)        |
|MITRE attack technique  |  [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/)       |
|MITRE attack sub-technique |  [Golden Ticket(T1558.001)](https://attack.mitre.org/techniques/T1558/001/)  

## Suspected Golden Ticket usage (ticket anomaly using RBCD) (external ID 2040)

**Severity**: High

**Description**:

Attackers with domain admin rights can compromise the KRBTGT account. Using the KRBTGT account, they can create a Kerberos ticket granting ticket (TGT) that provides authorization to any resource. This fake TGT is called a "Golden Ticket" and allows attackers to achieve network persistence. In this detection, the alert is triggered by a golden ticket that was created by setting Resource Based Constrained Delegation (RBCD) permissions using the KRBTGT account for account (user\computer) with SPN.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003) |
|---------|---------|
|Secondary MITRE tactic    |  [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)        |
|MITRE attack technique  |  [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/)       |
|MITRE attack sub-technique |  [Golden Ticket(T1558.001)](https://attack.mitre.org/techniques/T1558/001/)  

## Suspected Golden Ticket usage (time anomaly) (external ID 2022)

Previous name: Kerberos golden ticket

**Severity**: High

**Description**:

Attackers with domain admin rights can compromise the KRBTGT account. Using the KRBTGT account, they can create a Kerberos ticket granting ticket (TGT) that provides authorization to any resource and set the ticket expiration to any arbitrary time. This fake TGT is called a "Golden Ticket" and allows attackers to achieve network persistence. This alert is triggered when a Kerberos ticket granting ticket is used for more than the allowed time permitted, as specified in the Maximum lifetime for user ticket.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004), [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)        |
|MITRE attack technique  |  [Steal or Forge Kerberos Tickets (T1558)](https://attack.mitre.org/techniques/T1558/)       |
|MITRE attack sub-technique |  [Golden Ticket(T1558.001)](https://attack.mitre.org/techniques/T1558/001/)  

## Suspected skeleton key attack (encryption downgrade) (external ID 2010)

*Previous name:* Encryption downgrade activity

**Severity**: Medium

**Description**:

Encryption downgrade is a method of weakening Kerberos using a downgraded encryption level for different fields of the protocol that normally have the highest level of encryption. A weakened encrypted field can be an easier target to offline brute force attempts. Various attack methods utilize weak Kerberos encryption cyphers. In this detection, Defender for Identity learns the Kerberos encryption types used by computers and users. The alert is issued when a weaker cypher is used that is unusual for the source computer, and/or user, and matches known attack techniques.

Skeleton Key is malware that runs on domain controllers and allows authentication to the domain with any account without knowing its password. This malware often uses weaker encryption algorithms to hash the user's passwords on the domain controller. In this alert, the learned behavior of previous KRB_ERR message encryption from domain controller to the account requesting a ticket, was downgraded.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003)  |
|---------|---------|
|Secondary MITRE tactic    |  [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)       |
|MITRE attack technique  |   [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/),[Modify Authentication Process (T1556)](https://attack.mitre.org/techniques/T1556/)      |
|MITRE attack sub-technique |  [Domain Controller Authentication (T1556.001)](https://attack.mitre.org/techniques/T1556/001/)       |

## Suspicious additions to sensitive groups (external ID 2024)

**Severity**: Medium

**Description**:

Attackers add users to highly privileged groups. Adding users is done to gain access to more resources, and gain persistency. This detection relies on profiling the group modification activities of users, and alerting when an abnormal addition to a sensitive group is seen. Defender for Identity profiles continuously.

For a definition of sensitive groups in Defender for Identity, see [Working with sensitive accounts](/defender-for-identity/entity-tags).

The detection relies on events audited on domain controllers. Make sure your domain controllers are [auditing the events needed](configure-windows-event-collection.md).

**Learning period**:

Four weeks per domain controller, starting from the first event.

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003) |
|---------|---------|
|Secondary MITRE tactic    | [Credential Access (TA0006)](https://attack.mitre.org/tactics/TA0006)        |
|MITRE attack technique  |  [Account Manipulation (T1098)](https://attack.mitre.org/techniques/T1098/),[Domain Policy Modification (T1484)](https://attack.mitre.org/techniques/T1484/)      |
|MITRE attack sub-technique | N/A        |

**Suggested steps for prevention**:

1. To help prevent future attacks, minimize the number of users authorized to modify sensitive groups.
1. Set up Privileged Access Management for Active Directory if applicable.

## Suspected Netlogon privilege elevation attempt (CVE-2020-1472 exploitation) (external ID 2411)

**Severity**: High

**Description**:
Microsoft published [CVE-2020-1472](https://portal.msrc.microsoft.com/security-guidance/advisory/CVE-2020-1472) announcing that a new vulnerability exists that allows the elevation of privileges to the domain controller.

An elevation of privilege vulnerability exists when an attacker establishes a vulnerable Netlogon secure channel connection to a domain controller, using the Netlogon Remote Protocol ([MS-NRPC](/openspecs/windows_protocols/ms-nrpc/ff8f970f-3e37-40f7-bd4b-af7336e4792f)), also known as *Netlogon Elevation of Privilege Vulnerability*.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)  |
|---------|---------|
|MITRE attack technique | N/A        |
|MITRE attack sub-technique | N/A        |

**Suggested steps for prevention**:

1. Review [our guidance](https://support.microsoft.com/help/4557222/how-to-manage-the-changes-in-netlogon-secure-channel-connections-assoc) on managing changes in Netlogon secure channel connection which relate to and can prevent this vulnerability.

## Honeytoken user attributes modified (external ID 2427)

**Severity**: High

**Description**:
Every user object in Active Directory has attributes that contain information such as first name, middle name, last name, phone number, address and more. Sometimes attackers will try and manipulate these objects for their benefit, for example by changing the phone number of an account to get access to any multifactor authentication attempt. Microsoft Defender for Identity will trigger this alert for any attribute modification against a pre-configured [honeytoken user](entity-tags.md).

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003)  |
|---------|---------|
|MITRE attack technique  |  [Account Manipulation (T1098)](https://attack.mitre.org/techniques/T1098/)     |
|MITRE attack sub-technique | N/A        |

## Honeytoken group membership changed (external ID 2428)

**Severity**: High

**Description**:
In Active Directory, each user is a member of one or more groups. After gaining access to an account, attackers may attempt to add or remove permissions from it to other users, by removing or adding them to security groups. Microsoft Defender for Identity triggers an alert whenever there is a change made to a preconfigured [honeytoken user account](entity-tags.md).

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003)  |
|---------|---------|
|MITRE attack technique  |  [Account Manipulation (T1098)](https://attack.mitre.org/techniques/T1098/)     |
|MITRE attack sub-technique | N/A        |

## Suspected SID-History injection (external ID 1106)

**Severity**: High

**Description**:
SIDHistory is an attribute in Active Directory that allows users to retain their permissions and access to resources when their account is migrated from one domain to another. When a user account is migrated to a new domain, the user's SID is added to the SIDHistory attribute of their account in the new domain. This attribute contains a list of SIDs from the user's previous domain.

Adversaries may use the SIH history injection to escalate privileges and bypass access controls. This detection will trigger when newly added SID was added to the SIDHistory attribute.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  |[Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)  |
|---------|---------|
|MITRE attack technique  |[Account Manipulation (T1134)](https://attack.mitre.org/techniques/T1134/)     |
|MITRE attack sub-technique |[SID-History Injection(T1134.005)](https://attack.mitre.org/techniques/T1134/005/)       |

## Suspicious modification of a dNSHostName attribute (CVE-2022-26923)  (external ID 2421)

**Severity**: High

**Description**:

This attack involves the unauthorized modification of the dNSHostName attribute, potentially exploiting a known vulnerability (CVE-2022-26923). Attackers may manipulate this attribute to compromise the integrity of the Domain Name System (DNS) resolution process, leading to various security risks, including man-in-the-middle attacks or unauthorized access to network resources. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004) |
|---------|---------|
|Secondary MITRE tactic    |  [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005)       |
|MITRE attack technique  |   [Exploitation for Privilege Escalation (T1068)](https://attack.mitre.org/techniques/T1068/),[Access Token Manipulation (T1134)](https://attack.mitre.org/techniques/T1134/)      |
|MITRE attack sub-technique |  [Token Impersonation/Theft (T1134.001)](https://attack.mitre.org/techniques/T1134/001/)       |

## Suspicious modification of domain AdminSdHolder  (external ID 2430)

**Severity**: High

**Description**:

Attackers may target the Domain AdminSdHolder, making unauthorized modifications. This can lead to security vulnerabilities by altering the security descriptors of privileged accounts. Regular monitoring and securing of critical Active Directory objects are essential to prevent unauthorized changes.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003 ) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)        |
|MITRE attack technique  |   [Account Manipulation (T1098)](https://attack.mitre.org/techniques/T1098/)  |
|MITRE attack sub-technique |  N/A     |

## Suspicious Kerberos delegation attempt by a newly created computer  (external ID 2422)

**Severity**: High

**Description**:

This attack involves a suspicious Kerberos ticket request by a newly created computer. Unauthorized Kerberos ticket requests can indicate potential security threats. Monitoring abnormal ticket requests, validating computer accounts, and promptly addressing suspicious activity are essential for preventing unauthorized access and potential compromise. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005 ) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)        |
|MITRE attack technique  |   [Domain Policy Modification (T1484)](https://attack.mitre.org/techniques/T1484/)  |
|MITRE attack sub-technique |  N/A     |

## Suspicious Domain Controller certificate request (ESC8)  (external ID 2432)

**Severity**: High

**Description**:

An abnormal request for a Domain Controller certificate (ESC8) raises concerns about potential security threats. This could be an attempt to compromise the integrity of the certificate infrastructure, leading to unauthorized access and data breaches. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005 ) |
|---------|---------|
|Secondary MITRE tactic    | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003),[Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004/),[Initial Access (TA0001)](https://attack.mitre.org/tactics/TA0001/)     |
|MITRE attack technique  |   [Valid Accounts (T1078)](https://attack.mitre.org/techniques/T1078/)  |
|MITRE attack sub-technique |  N/A     |

> [!NOTE]
> Suspicious Domain Controller certificate request (ESC8) alerts are only supported by Defender for Identity sensors on AD CS.

## Suspicious modifications to the AD CS security permissions/settings  (external ID 2435)

**Severity**: Medium

**Description**:

Attackers may target the security permissions and settings of the Active Directory Certificate Services (AD CS) to manipulate the issuance and management of certificates. Unauthorized modifications can introduce vulnerabilities, compromise certificate integrity, and impact the overall security of the PKI infrastructure. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005 ) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004/)         |
|MITRE attack technique  |   [Domain Policy Modification (T1484)](https://attack.mitre.org/techniques/T1484/)  |
|MITRE attack sub-technique |  N/A     |

> [!NOTE]
> Suspicious modifications to the AD CS security permissions/settings alerts are only supported by Defender for Identity sensors on AD CS.

## Suspicious modification of the trust relationship of AD FS server  (external ID 2420)

**Severity**: Medium

**Description**:

Unauthorized changes to the trust relationship of AD FS servers can compromise the security of federated identity systems. Monitoring and securing trust configurations are critical for preventing unauthorized access.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005 ) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004/)         |
|MITRE attack technique  |   [Domain Policy Modification (T1484)](https://attack.mitre.org/techniques/T1484/)  |
|MITRE attack sub-technique | [Domain Trust Modification (T1484.002)](https://attack.mitre.org/techniques/T1562/002/)     |

> [!NOTE]
> Suspicious modification of the trust relationship of AD FS server alerts are only supported by Defender for Identity sensors on AD FS.

## Suspicious modification of the Resource Based Constrained Delegation attribute by a machine account  (external ID 2423)

**Severity**: High

**Description**:

Unauthorized changes to the Resource-Based Constrained Delegation attribute by a machine account can lead to security breaches, allowing attackers to impersonate users and access resources. Monitoring and securing delegation configurations are essential for preventing misuse. 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005 ) |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004/)         |
|MITRE attack technique  |   [Domain Policy Modification (T1484)](https://attack.mitre.org/techniques/T1484/)  |
|MITRE attack sub-technique |  N/A   |


## Next steps

- [Investigate assets](investigate-assets.md)
- [Understanding security alerts](understanding-security-alerts.md)
- [Manage security alerts](/defender-for-identity/manage-security-alerts)
- [Defender for Identity SIEM log reference](cef-format-sa.md)
- [Working with lateral movement paths](/defender-for-identity/understand-lateral-movement-paths)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)





