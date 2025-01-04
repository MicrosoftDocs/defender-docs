---
title: Lateral movement security alerts
description: This article explains the Microsoft Defender for Identity alerts issued when attacks typically part of lateral movement phase efforts are detected against your organization.
ms.date: 03/23/2023
ms.topic: conceptual
---

# Lateral movement alerts

Typically, cyberattacks are launched against any accessible entity, such as a low-privileged user, and then quickly move laterally until the attacker gains access to valuable assets. Valuable assets can be sensitive accounts, domain administrators, or highly sensitive data. Microsoft Defender for Identity identifies these advanced threats at the source throughout the entire attack kill chain and classifies them into the following phases:

1. [Reconnaissance and discovery alerts](reconnaissance-discovery-alerts.md)
1. [Persistence and privilege escalation alerts](persistence-privilege-escalation-alerts.md)
1. [Credential access alerts](credential-access-alerts.md)
1. **Lateral movement**
1. [Other alerts](other-alerts.md)

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [Understanding security alerts](understanding-security-alerts.md). For information about **True positive (TP)**, **Benign true positive (B-TP)**, and **False positive (FP)**, see [security alert classifications](understanding-security-alerts.md#security-alert-classifications).

Lateral Movement consists of techniques that adversaries use to enter and control remote systems on a network. Following through on their primary objective often requires exploring the network to find their target and subsequently gaining access to it. Reaching their objective often involves pivoting through multiple systems and accounts to gain. Adversaries might install their own remote access tools to accomplish Lateral Movement or use legitimate credentials with native network and operating system tools, which may be stealthier. Microsoft Defender for Identity can cover different passing attacks (pass the ticket, pass the hash, etc.) or other exploitations against the domain controller, like PrintNightmare or remote code execution.

## Suspected exploitation attempt on Windows Print Spooler service (external ID 2415)

**Severity**: High or Medium

**Description**:

Adversaries might exploit the Windows Print Spooler service to perform privileged file operations in an improper manner. An attacker who has (or obtains) the ability to execute code on the target, and who successfully exploits the vulnerability, could run arbitrary code with SYSTEM privileges on a target system. If run against a domain controller, the attack would allow a compromised non-administrator account to perform actions against a domain controller as SYSTEM.

This functionally allows any attacker who enters the network to instantly elevate privileges to Domain Administrator, steal all domain credentials, and distribute further malware as a Domain Admin.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|MITRE attack technique    |  [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)       |
|MITRE attack sub-technique |  N/A       |

**Suggested steps for prevention**:

1. Due to the risk of the domain controller being compromised, install the security updates for [CVE-2021-34527](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34527) on Windows domain controllers, before installing on member servers and workstations.
1. You can use the Defender for Identity built-in security assessment that tracks the availability of Print spooler services on domain controllers. [Learn more](/defender-for-identity/security-assessment-print-spooler).

## Remote code execution attempt over DNS (external ID 2036)

**Severity**: Medium

**Description**:

12/11/2018 Microsoft published [CVE-2018-8626](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2018-8626), announcing that a newly discovered remote code execution vulnerability exists in Windows Domain Name System (DNS) servers. In this vulnerability, servers fail to properly handle requests. An attacker who successfully exploits the vulnerability can run arbitrary code in the context of the Local System Account. Windows servers currently configured as DNS servers are at risk from this vulnerability.

In this detection, a Defender for Identity security alert is triggered when DNS queries suspected of exploiting the CVE-2018-8626 security vulnerability are made against a domain controller in the network.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|Secondary MITRE tactic    |  [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)       |
|MITRE attack technique  |   [Exploitation for Privilege Escalation (T1068)](https://attack.mitre.org/techniques/T1068/), [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)      |
|MITRE attack sub-technique |  N/A       |

**Suggested remediation and steps for prevention**:

- Make sure all DNS servers in the environment are up-to-date, and patched against [CVE-2018-8626](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2018-8626).

## Suspected identity theft (pass-the-hash) (external ID 2017)

*Previous name:* Identity theft using Pass-the-Hash attack

**Severity**: High

**Description**:

Pass-the-Hash is a lateral movement technique in which attackers steal a user's NTLM hash from one computer and use it to gain access to another computer.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|MITRE attack technique  | [Use Alternate Authentication Material (T1550)](https://attack.mitre.org/techniques/T1550/)       |
|MITRE attack sub-technique | [Pass the Hash (T1550.002)](https://attack.mitre.org/techniques/T1550/002/)         |

## Suspected identity theft (pass-the-ticket) (external ID 2018)

*Previous name:* Identity theft using Pass-the-Ticket attack

**Severity**: High or Medium

**Description**:

Pass-the-Ticket is a lateral movement technique in which attackers steal a Kerberos ticket from one computer and use it to gain access to another computer by reusing the stolen ticket. In this detection, a Kerberos ticket is seen used on two (or more) different computers.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|MITRE attack technique  | [Use Alternate Authentication Material (T1550)](https://attack.mitre.org/techniques/T1550/)       |
|MITRE attack sub-technique | [Pass the Ticket (T1550.003)](https://attack.mitre.org/techniques/T1550/003/)         |

## Suspected NTLM authentication tampering (external ID 2039)

**Severity**: Medium

**Description**:

In June 2019, Microsoft published [Security Vulnerability CVE-2019-1040](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-1040), announcing discovery of a new tampering vulnerability in Microsoft Windows, when a "man-in-the-middle" attack is able to successfully bypass NTLM MIC (Message Integrity Check) protection.

Malicious actors that successfully exploit this vulnerability have the ability to downgrade NTLM security features, and may successfully create authenticated sessions on behalf of other accounts. Unpatched Windows Servers are at risk from this vulnerability.

In this detection, a Defender for Identity security alert is triggered when NTLM authentication requests suspected of exploiting security vulnerability identified in [CVE-2019-1040](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-1040) are made against a domain controller in the network.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)  |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)     |
|MITRE attack technique  | [Exploitation for Privilege Escalation (T1068)](https://attack.mitre.org/techniques/T1068/), [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)        |
|MITRE attack sub-technique |   N/A      |

**Suggested steps for prevention**:

1. Force the use of sealed NTLMv2 in the domain, using the **Network security: LAN Manager authentication level** group policy. For more information, see [LAN Manager authentication level instructions](/windows/security/threat-protection/security-policy-settings/network-security-lan-manager-authentication-level) for setting the group policy for domain controllers.

1. Make sure all devices in the environment are up-to-date, and patched against [CVE-2019-1040](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-1040).

## Suspected NTLM relay attack (Exchange account) (external ID 2037)

**Severity**: Medium or Low if observed using signed NTLM v2 protocol

**Description**:

An Exchange Server computer account can be configured to trigger NTLM authentication with the Exchange Server computer account to a remote http server, run by an attacker. The server waits for the Exchange Server communication to relay its own sensitive authentication to any other server, or even more interestingly to Active Directory over LDAP, and grabs the authentication information.

Once the relay server receives the NTLM authentication, it provides a challenge that was originally created by the target server. The client responds to the challenge, preventing an attacker from taking the response, and using it to continue NTLM negotiation with the target domain controller.

In this detection, an alert is triggered when Defender for Identity identify use of Exchange account credentials from a suspicious source.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)  |
|---------|---------|
|Secondary MITRE tactic    | [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)     |
|MITRE attack technique  | [Exploitation for Privilege Escalation (T1068)](https://attack.mitre.org/techniques/T1068/), [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/), [Man-in-the-Middle (T1557)](https://attack.mitre.org/techniques/T1557/)        |
|MITRE attack sub-technique |   [LLMNR/NBT-NS Poisoning and SMB Relay (T1557.001)](https://attack.mitre.org/techniques/T1557/001/)     |

**Suggested steps for prevention**:

1. Force the use of sealed NTLMv2 in the domain, using the **Network security: LAN Manager authentication level** group policy. For more information, see [LAN Manager authentication level instructions](/windows/security/threat-protection/security-policy-settings/network-security-lan-manager-authentication-level) for setting the group policy for domain controllers.

## Suspected overpass-the-hash attack (Kerberos) (external ID 2002)

*Previous name:* Unusual Kerberos protocol implementation (potential overpass-the-hash attack)

**Severity**: Medium

**Description**:

Attackers use tools that implement various protocols such as Kerberos and SMB in non-standard ways. While Microsoft Windows accepts this type of network traffic without warnings, Defender for Identity is able to recognize potential malicious intent. The behavior is indicative of techniques such as over-pass-the-hash, Brute Force, and advanced ransomware exploits such as WannaCry, are used.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)  |
|---------|---------|
|MITRE attack technique  |  [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/),[Use Alternate Authentication Material (T1550)](https://attack.mitre.org/techniques/T1550/)      |
|MITRE attack sub-technique | [Pass the Has (T1550.002)](https://attack.mitre.org/techniques/T1550/002/), [Pass the Ticket (T1550.003)](https://attack.mitre.org/techniques/T1550/003/)        |

## Suspected rogue Kerberos certificate usage (external ID 2047)

**Severity**: High

**Description**:

Rogue certificate attack is a persistence technique used by attackers after gaining control over the organization. Attackers compromise the Certificate Authority (CA) server and generate certificates that can be used as backdoor accounts in future attacks.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|Secondary MITRE tactic    | [Persistence (TA0003)](https://attack.mitre.org/tactics/TA0003), [Privilege Escalation (TA0004)](https://attack.mitre.org/tactics/TA0004)       |
|MITRE attack technique  |  N/A       |
|MITRE attack sub-technique |  N/A       |

## Suspected SMB packet manipulation (CVE-2020-0796 exploitation) - (external ID 2406)

**Severity**: High

**Description**:

03/12/2020 Microsoft published [CVE-2020-0796](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2020-0796), announcing that a newly remote code execution vulnerability exists in the way that the Microsoft Server Message Block 3.1.1 (SMBv3) protocol handles certain requests. An attacker who successfully exploited the vulnerability could gain the ability to execute code on the target server or client. Unpatched Windows servers are at risk from this vulnerability.

In this detection, a Defender for Identity security alert is triggered when SMBv3 packet suspected of exploiting the CVE-2020-0796 security vulnerability are made against a domain controller in the network.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)  |
|---------|---------|
|MITRE attack technique  |   [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)      |
|MITRE attack sub-technique |    N/A     |

**Suggested steps for prevention**:

1. If your have computers with operating systems that don't support [KB4551762](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4551762), we recommend disabling the SMBv3 compression feature in the environment, as described in the [Workarounds](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2020-0796) section.

1. Make sure all devices in the environment are up-to-date, and patched against [CVE-2020-0796](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2020-0796).

## Suspicious network connection over Encrypting File System Remote Protocol (external ID 2416)

**Severity**: High or Medium

**Description**:

Adversaries may exploit the Encrypting File System Remote Protocol to improperly perform privileged file operations.

In this attack, the attacker can escalate privileges in an Active Directory network by coercing authentication from machine accounts and relaying to the certificate service.

This attack allows an attacker to take over an Active Directory (AD) Domain by exploiting a flaw in the Encrypting File System Remote (EFSRPC) Protocol and chaining it with a flaw in Active Directory Certificate Services.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|MITRE attack technique    |  [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)       |
|MITRE attack sub-technique |  N/A       |

## Exchange Server Remote Code Execution (CVE-2021-26855) (external ID 2414)

**Severity**: High

**Description**:

Some Exchange vulnerabilities can be used in combination to allow unauthenticated remote code execution on devices running Exchange Server. Microsoft has also observed subsequent web shell implantation, code execution, and data exfiltration activities during attacks. This threat may be exacerbated by the fact that numerous organizations publish Exchange Server deployments to the internet to support mobile and work-from-home scenarios. In many of the observed attacks, one of the first steps attackers took following successful exploitation of CVE-2021-26855, which allows unauthenticated remote code execution, was to establish persistent access to the compromised environment via a web shell.

Adversaries may create authentication bypass vulnerability results from having to treat requests to static resources as authenticated requests on the backend, because files such as scripts and images must be available even without authentication.

**Prerequisites**:

Defender for Identity needs Windows Event 4662 to be enabled and collected to monitor for this attack. For information on how to configure and collect this event, see [Configure Windows Event collection](configure-windows-event-collection.md), and follow the instructions for [Enable auditing on an Exchange object](configure-windows-event-collection.md#enable-auditing-on-an-exchange-object). 

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|MITRE attack technique    |  [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)       |
|MITRE attack sub-technique |  N/A       |

**Suggested steps for prevention**:

Update your Exchange servers with the latest security patches. The vulnerabilities are addressed in the [March 2021 Exchange Server Security Updates](https://techcommunity.microsoft.com/t5/exchange-team-blog/released-march-2021-exchange-server-security-updates/ba-p/2175901).

## Suspected Brute Force attack (SMB) (external ID 2033)

*Previous name:* Unusual protocol implementation (potential use of malicious tools such as Hydra)

**Severity**: Medium

**Description**:

Attackers use tools that implement various protocols such as SMB, Kerberos, and NTLM in non-standard ways. While this type of network traffic is accepted by Windows without warnings, Defender for Identity is able to recognize potential malicious intent. The behavior is indicative of brute force techniques.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|MITRE attack technique  |  [Brute Force (T1110)](https://attack.mitre.org/techniques/T1110/)       |
|MITRE attack sub-technique |  [Password Guessing (T1110.001)](https://attack.mitre.org/techniques/T1110/001/), [Password Spraying (T1110.003)](https://attack.mitre.org/techniques/T1110/003/)       |

**Suggested steps for prevention**:

1. Enforce [Complex and long passwords](/windows/security/threat-protection/security-policy-settings/password-policy) in the organization. Complex and long passwords provide the necessary first level of security against future brute-force attacks.
1. [Disable SMBv1](https://blogs.technet.microsoft.com/filecab/2016/09/16/stop-using-smb1/)

## Suspected WannaCry ransomware attack (external ID 2035)

*Previous name:* Unusual protocol implementation (potential WannaCry ransomware attack)

**Severity**: Medium

**Description**:

Attackers use tools that implement various protocols in non-standard ways. While this type of network traffic is accepted by Windows without warnings, Defender for Identity is able to recognize potential malicious intent. The behavior is indicative of techniques used by advanced ransomware, such as WannaCry.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)  |
|---------|---------|
|MITRE attack technique  |   [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)      |
|MITRE attack sub-technique |    N/A     |

**Suggested steps for prevention**:

1. Patch all of your machines, making sure to apply security updates.
    - [Disable SMBv1](https://blogs.technet.microsoft.com/filecab/2016/09/16/stop-using-smb1/)

## Suspected use of Metasploit hacking framework (external ID 2034)

*Previous name:* Unusual protocol implementation (potential use of Metasploit hacking tools)

**Severity**: Medium

**Description**:

Attackers use tools that implement various protocols (SMB, Kerberos, NTLM) in non-standard ways. While this type of network traffic is accepted by Windows without warnings, Defender for Identity is able to recognize potential malicious intent. The behavior is indicative of techniques such as use of the Metasploit hacking framework.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)  |
|---------|---------|
|MITRE attack technique  |   [Exploitation of Remote Services (T1210)](https://attack.mitre.org/techniques/T1210/)      |
|MITRE attack sub-technique |    N/A     |

**Suggested remediation and steps for prevention**:

1. [Disable SMBv1](https://blogs.technet.microsoft.com/filecab/2016/09/16/stop-using-smb1/)

## Suspicious certificate usage over Kerberos protocol (PKINIT) (external ID 2425)

**Severity**: High

**Description**:

Attackers exploit vulnerabilities in the PKINIT extension of the Kerberos protocol by using suspicious certificates. This can lead to identity theft and unauthorized access. Possible attacks include the use of invalid or compromised certificates, man-in-the-middle attacks, and poor certificate management. Regular security audits and adherence to PKI best practices are crucial to mitigate these risks.

**Learning period**:

None

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008)  |
|---------|---------|
|MITRE attack technique  |  [Use Alternate Authentication Material (T1550)](https://attack.mitre.org/techniques/T1550/)      |
|MITRE attack sub-technique |     N/A     |

> [!NOTE]
> Suspicious certificate usage over Kerberos protocol (PKINIT) alerts are only supported by Defender for Identity sensors on AD CS.

## Suspected over-pass-the-hash attack (forced encryption type) (external ID 2008)

**Severity**: Medium

**Description**:

Over-pass-the-hash attacks involving forced encryption types can exploit vulnerabilities in protocols like Kerberos. Attackers attempt to manipulate network traffic, bypassing security measures and gaining unauthorized access. Defending against such attacks requires robust encryption configurations and monitoring.

**Learning period**:

1 month

**MITRE**:

|Primary MITRE tactic  | [Lateral Movement (TA0008)](https://attack.mitre.org/tactics/TA0008) |
|---------|---------|
|Secondary MITRE tactic    | [Defense Evasion (TA0005)](https://attack.mitre.org/tactics/TA0005) |
|MITRE attack technique  |  [Use Alternate Authentication Material (T1550)](https://attack.mitre.org/techniques/T1550/)       |
|MITRE attack sub-technique |  [Pass the Hash (T1550.002)](https://attack.mitre.org/techniques/T1550/002/), [Pass the Ticket (T1550.003)](https://attack.mitre.org/techniques/T1550/003/)   |

## Next steps

- [Investigate assets](investigate-assets.md)
- [Understanding security alerts](understanding-security-alerts.md)
- [Manage security alerts](/defender-for-identity/manage-security-alerts)
- [Defender for Identity SIEM log reference](cef-format-sa.md)
- [Working with lateral movement paths](/defender-for-identity/understand-lateral-movement-paths)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
