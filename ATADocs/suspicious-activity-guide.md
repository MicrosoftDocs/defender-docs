---
# required metadata

title: ATA suspicious activity guide
description: This article provides a list of the suspicious activities ATA can detect and steps for remediation.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 1fe5fd6f-1b79-4a25-8051-2f94ff6c71c1

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Advanced Threat Analytics suspicious activity guide

[!INCLUDE [Banner for top of topics](includes/banner.md)]

Following proper investigation, any suspicious activity can be classified as:

- **True positive**: A malicious action detected by ATA.

- **Benign true positive**: An action detected by ATA that is real but not malicious, such as a penetration test.
- **False positive**: A false alarm, meaning the activity didn't happen.

For more information on how to work with ATA alerts, see [Working with suspicious activities](working-with-suspicious-activities.md).

For questions or feedback, contact the ATA team at [ATAEval@microsoft.com](mailto:ATAEval@microsoft.com).

## Abnormal modification of sensitive groups

**Description**

Attackers add users to highly privileged groups. They do so to gain access to more resources and gain persistency. Detections rely on profiling the user group modification activities, and alerting when an abnormal addition to a sensitive group is seen. Profiling is continuously performed by ATA. The minimum period before an alert can be triggered is one month per domain controller.

For a definition of sensitive groups in ATA, see [Working with the ATA console](working-with-ata-console.md#sensitive-groups).

The detection relies on [events audited on domain controllers](configure-event-collection.md).
To make sure your domain controllers audit the needed events, use [this tool](https://github.com/microsoft/Azure-Advanced-Threat-Protection/tree/master/Auditing).

**Investigation**

1. Is the group modification legitimate? </br>Legitimate group modifications that rarely occur, and weren't learned as "normal", might cause an alert, which would be considered a benign true positive.

1. If the added object was a user account, check which actions the user account took after being added to the admin group. Go to the user's page in ATA to get more context. Were there any other suspicious activities associated with the account before or after the addition took place? Download the **Sensitive group modification** report to see what other modifications were made and by whom during the same time period.

**Remediation**

Minimize the number of users who are authorized to modify sensitive groups.

Set up [Privileged Access Management for Active Directory](/microsoft-identity-manager/pam/privileged-identity-management-for-active-directory-domain-services) if applicable.

## Broken trust between computers and domain

> [!NOTE]
> The Broken trust between computers and domain alert was deprecated and only appears in ATA versions prior to 1.9.

**Description**

Broken trust means that Active Directory security requirements may not be in effect for these computers. This is considered a baseline security and compliance failure and a soft target for attackers. In this detection, an alert is triggered if more than five Kerberos authentication failures are seen from a computer account within 24 hours.

**Investigation**

Is the computer being investigated allowing domain users to sign in?

- If yes, you may ignore this computer in the remediation steps.

**Remediation**

Rejoin the machine back to the domain if necessary or reset the machine's password.

## Brute force attack using LDAP simple bind

**Description**

>[!NOTE]
> The main difference between **Suspicious authentication failures** and this detection is that in this detection, ATA can determine whether different passwords were in use.

In a brute-force attack, an attacker attempts to authenticate with many different passwords for different accounts until a correct password is found for at least one account. Once found, an attacker can sign in using that account.

In this detection, an alert is triggered when ATA detects a massive number of simple bind authentications. This can be either *horizontally* with a small set of passwords across many users; or *vertically"* with a large set of passwords on just a few users; or any combination of these two options.

**Investigation**

1. If there are many accounts involved, select **Download details** to view the list in an Excel spreadsheet.

1. Select the alert to go to its dedicated page. Check if any login attempts ended with a successful authentication. The attempts would appear as **Guessed accounts** on the right side of the infographic. If yes, are any of the **Guessed accounts** normally used from the source computer? If yes, **Suppress** the suspicious activity.

1. If there are no **Guessed accounts**, are any of the **Attacked accounts** normally used from the source computer? If yes, **Suppress** the suspicious activity.

**Remediation**

[Complex and long passwords](/windows/device-security/security-policy-settings/password-policy) provide the necessary first level of security against brute-force attacks.

## Encryption downgrade activity

**Description**

Encryption downgrade is a method of weakening Kerberos by downgrading the encryption level of different fields of the protocol that are normally encrypted using the highest level of encryption. A weakened encrypted field can be an easier target to offline brute force attempts. Various attack methods utilize weak Kerberos encryption cyphers. In this detection, ATA learns the Kerberos encryption types used by computers and users, and alerts you when a weaker cypher is used that: (1) is unusual for the source computer and/or user; and (2) matches known attack techniques.

There are three detection types:

1. Skeleton Key – is malware that runs on domain controllers and allows authentication to the domain with any account without knowing its password. This malware often uses weaker encryption algorithms to hash the user's passwords on the domain  controller. In this detection, the encryption method of the KRB_ERR message from the domain controller to the account asking for a ticket was downgraded compared to the previously learned behavior.

1. Golden Ticket – In a [Golden Ticket](#golden-ticket) alert, the encryption method of the TGT field of TGS_REQ (service request) message from the source computer was downgraded compared to the previously learned behavior. This isn't based on a time anomaly (as in the other Golden Ticket detection). In addition, there was no Kerberos authentication request associated with the previous service request detected by ATA.

1. Overpass-the-Hash – An attacker can use a weak stolen hash in order to create a strong ticket, with a Kerberos AS request. In this detection, the AS_REQ message encryption type from the source computer was downgraded compared to the previously learned behavior (that is, the computer was using AES).

**Investigation**

First check the description of the alert to see which of the above three detection types you're dealing with. For further information, download the Excel spreadsheet.

1. Skeleton Key - Check if Skeleton Key has affected your domain controllers.
1. Golden Ticket – In the Excel spreadsheet, go to the **Network activity** tab. You'll see that the relevant downgraded field is **Request Ticket Encryption Type**, and **Source Computer Supported Encryption Types** lists stronger encryption methods.
    1.Check the source computer and account, or if there are multiple source computers and accounts check if they have something in common (for example, all the marketing personnel use a specific app that might be causing the alert to be triggered). There are cases in which a custom application that is rarely used is authenticating using a lower encryption cipher. Check if there are any such custom apps on the source computer. If so, it's probably a benign true positive and you can **Suppress** it.
    1.Check the resource accessed by those tickets. If there's one resource they're all accessing, validate it, and make sure it's a valid resource they're supposed to access. Also, verify if the target resource supports strong encryption methods. You can check this in Active Directory by checking the attribute `msDS-SupportedEncryptionTypes`, of the resource service account.
1. Overpass-the-Hash – In the Excel spreadsheet, go to the **Network activity** tab. You'll see that the relevant downgraded field is **Encrypted Timestamp Encryption Type** and **Source Computer Supported Encryption Types** contains stronger encryption methods.
    1.There are cases in which this alert might be triggered when users sign in using smartcards if the smartcard configuration was changed recently. Check if there were changes like this for the account(s) involved. If so, this is probably a benign true positive and you can **Suppress** it.
    1.Check the resource accessed by those tickets. If there's one resource they're all accessing, validate it and make sure it's a valid resource they're supposed to access. Also, verify if the target resource supports strong encryption methods. You can check this in Active Directory by checking the attribute `msDS-SupportedEncryptionTypes`, of the resource service account.

**Remediation**

1. Skeleton Key – Remove the malware. For more information, see [Skeleton Key Malware Analysis](https://www.virusbulletin.com/virusbulletin/2016/01/paper-digital-bian-lian-face-changing-skeleton-key-malware).

1. Golden Ticket – Follow the instructions of the [Golden Ticket](#golden-ticket) suspicious activities.
    Also, because creating a Golden Ticket requires domain admin rights, implement [Pass the hash recommendations](https://www.microsoft.com/download/details.aspx?id=36036).

1. Overpass-the-Hash – If the involved account isn't sensitive, then reset the password of that account. This prevents the attacker from creating new Kerberos tickets from the password hash, although the existing tickets can still be used until they expire. If it's a sensitive account, you should consider resetting the KRBTGT account twice as in the Golden Ticket suspicious activity. Resetting the KRBTGT twice invalidates all Kerberos tickets in this domain so plan before doing so. See guidance in the [KRBTGT account article](/windows/security/identity-protection/access-control/active-directory-accounts#krbtgt-account). Since this is a lateral movement technique, follow the best practices of [Pass the hash recommendations](https://www.microsoft.com/download/details.aspx?id=36036).

## Honeytoken activity

**Description**

Honeytoken accounts are decoy accounts set up to identify and track malicious activity that involves these accounts. Honeytoken accounts should be left unused, while having an attractive name to lure attackers (for example,
SQL-Admin). Any activity from them might indicate malicious behavior.

For more information on honey token accounts, see [Install ATA - Step 7](install-ata-step7.md).

**Investigation**

1. Check whether the owner of the source computer used the Honeytoken account to authenticate, using the method described in the suspicious activity page (for example, Kerberos, LDAP, NTLM).

1. Browse to the source computer(s) profile page(s) and check which other accounts authenticated from them. Check with the owners of those accounts if they used the Honeytoken account.

1. This could be a non-interactive login, so make sure to check for applications or scripts that are running on the source computer.

If after performing steps 1 through 3, if there's no evidence of benign use, assume this is malicious.

**Remediation**

Make sure Honeytoken accounts are used only for their intended purpose, otherwise they might generate many alerts.

## Identity theft using Pass-the-Hash attack

**Description**

Pass-the-Hash is a lateral movement technique in which attackers steal a user's NTLM hash from one computer and use it to gain access to another computer.

**Investigation**

Was the hash used from a computer owned or used regularly by the targeted user? If yes, the alert is a false positive, if not, it's probably a true positive.

**Remediation**

1. If the involved account isn't sensitive, reset the password of that account. Resetting the password prevents the attacker from creating new Kerberos tickets from the password hash. Existing tickets are still usable until they expire.

1. If the involved account is sensitive, consider resetting the KRBTGT account twice, as in the Golden Ticket suspicious activity. Resetting the KRBTGT twice invalidates all domain Kerberos tickets, so plan around the impact before doing so. See guidance in the [KRBTGT account article](/windows/security/identity-protection/access-control/active-directory-accounts#krbtgt-account). As this is typically a lateral movement technique, follow the best practices of [Pass the hash recommendations](https://www.microsoft.com/download/details.aspx?id=36036).

## Identity theft using Pass-the-Ticket attack

**Description**

Pass-the-Ticket is a lateral movement technique in which attackers steal a Kerberos ticket from one computer and use it to gain access to another computer by reusing the stolen ticket. In this detection, a Kerberos ticket is seen used on two (or more) different computers.

**Investigation**

1. Select the **Download details** button to view the full list of IP addresses involved. Is the IP address of one or both computers part of a subnet allocated from an undersized DHCP pool, for example, VPN or WiFi? Is the IP address shared? For example, by a NAT device? If the answer to any of these questions is yes, the alert is a false positive.

1. Is there a custom application that forwards tickets on behalf of users? If so, it's a benign true positive.

**Remediation**

1. If the involved account isn't sensitive, then reset the password of that account. Password reset prevents the attacker from creating new Kerberos tickets from the password hash. Any existing tickets remain usable until expired.

1. If it's a sensitive account, you should consider resetting the KRBTGT account twice as in the Golden Ticket suspicious activity. Resetting the KRBTGT twice invalidates all Kerberos tickets in this domain so plan before doing so. See guidance in the [KRBTGT account article](/windows/security/identity-protection/access-control/active-directory-accounts#krbtgt-account).  Since this is a lateral movement technique, follow the best practices in [Pass the hash recommendations](https://www.microsoft.com/download/details.aspx?id=36036).

## Kerberos Golden Ticket activity<a name="golden-ticket"></a>

**Description**

Attackers with domain admin rights can compromise your [KRBTGT account](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/dn745899(v=ws.11)#Sec_KRBTGT). Attackers can use the KRBTGT account to create a Kerberos ticket granting ticket (TGT) providing authorization to any resource. The ticket  expiration can be set to any arbitrary time. This fake TGT is called a "Golden Ticket" and allows attackers to achieve and maintain persistency in your network.

In this detection, an alert is triggered when a Kerberos ticket granting ticket (TGT) is used for more than the allowed time permitted as specified in the [Maximum lifetime for user ticket](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj852169(v=ws.11))
security policy.

**Investigation**

1. Was there any recent (within the last few hours) change made to the **Maximum lifetime for user ticket** setting in group policy? If yes, then **Close** the alert (it was a false positive).

1. Is the ATA Gateway involved in this alert a virtual machine? If yes, did it recently resume from a saved state? If yes, then **Close** this alert.

1. If the answer to the above questions is no, assume this is malicious.

**Remediation**

Change the Kerberos Ticket Granting Ticket (KRBTGT) password twice according to the guidance in the [KRBTGT account article](/windows/security/identity-protection/access-control/active-directory-accounts#krbtgt-account). Resetting the KRBTGT twice invalidates all Kerberos tickets in this domain so plan before doing so.
Also, because creating a Golden Ticket requires domain admin rights, implement [Pass the hash recommendations](https://www.microsoft.com/download/details.aspx?id=36036).

## Malicious data protection private information request

**Description**

The Data Protection API (DPAPI) is used by Windows to securely protect passwords saved by browsers, encrypted files, and other sensitive data. Domain controllers hold a backup master key that can be used to decrypt all secrets encrypted with
DPAPI on domain-joined Windows machines. Attackers can use that master key to decrypt any secrets protected by DPAPI on all domain-joined machines.
In this detection, an alert is triggered when the DPAPI is used to retrieve the backup master key.

**Investigation**

1. Is the source computer running an organization-approved advanced security scanner against Active Directory?

1. If yes and it should always be doing so, **Close and exclude** the suspicious activity.

1. If yes and it shouldn't do this, **Close** the suspicious activity.

**Remediation**

To use DPAPI, an attacker needs domain admin rights. Implement [Pass the hash recommendations](https://www.microsoft.com/download/details.aspx?id=36036).

## Malicious replication of Directory Services

**Description**

Active Directory replication is the process by which changes that are made on one domain controller are synchronized with all other domain controllers. Given necessary permissions, attackers can initiate a replication request, allowing them to retrieve the data stored in Active Directory, including password hashes.

In this detection, an alert is triggered when a replication request is initiated from a computer that isn't a domain controller.

**Investigation**

1. Is the computer in question a domain controller? For example, a newly promoted domain controller that had replication issues. If yes, **Close** the suspicious activity.
1. Is the computer in question supposed to be replicating data from Active Directory? For example, Microsoft Entra Connect. If yes, **Close and exclude** the suspicious activity.
1. Select the source computer or account to go to its profile page. Check what happened around the time of the replication, searching for unusual activities, such as: who was logged in, which resources where accessed.

**Remediation**

Validate the following permissions:

- Replicate directory changes

- Replicate directory changes all

For more information, see [Grant Active Directory Domain Services permissions for profile synchronization in SharePoint Server 2013](/SharePoint/administration/user-profile-service-administration).
You can leverage [AD ACL Scanner](/archive/blogs/pfesweplat/take-control-over-ad-permissions-and-the-ad-acl-scanner-tool) or create a Windows PowerShell script to determine who in the domain has these permissions.

## Massive object deletion

**Description**

In some scenarios, attackers perform denial of service (DoS) attacks rather than only stealing information. Deleting a large number of accounts is one method of attempting a DoS attack.

In this detection, an alert is triggered any time more than 5% of all accounts are deleted. The detection requires read access to the deleted object container.
For information about configuring read-only permissions on the deleted object container, see **Changing permissions on a deleted object container** in [View or Set Permissions on a Directory Object](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc816824(v=ws.10)).

**Investigation**

Review the list of deleted accounts and determine if there's a pattern or a business reason that justifies a large-scale deletion.

**Remediation**

Remove permissions for users who can delete accounts in Active Directory. For more information, see [View or Set Permissions on a Directory Object](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc816824(v=ws.10)).

## Privilege escalation using forged authorization data

**Description**

Known vulnerabilities in older versions of Windows Server allow attackers to manipulate the Privileged Attribute Certificate (PAC). PAC is a field in the Kerberos ticket that has user authorization data (in Active Directory this is group membership) and grants attackers additional privileges.

**Investigation**

1. Select the alert to access the details page.

1. Is the destination computer (under the **ACCESSED** column) patched with MS14-068 (domain controller) or MS11-013 (server)? If yes, **Close** the suspicious activity (it's a false positive).

1. If the destination computer isn't patched, does the source computer run (under the **FROM** column) an OS/application known to modify the PAC? If yes, **Suppress** the suspicious activity (it's a benign true positive).

1. If the answer to the two previous questions was no, assume this activity is malicious.

**Remediation**

Make sure all domain controllers with operating systems up to Windows Server 2012 R2 are installed with [KB3011780](https://support.microsoft.com/help/2496930/ms11-013-vulnerabilities-in-kerberos-could-allow-elevation-of-privilege) and
all member servers and domain controllers up to 2012 R2 are up to date with KB2496930. For more information, see [Silver PAC](/security-updates/SecurityBulletins/2011/ms11-013) and [Forged PAC](/security-updates/SecurityBulletins/2014/ms14-068).

## Reconnaissance using account enumeration

**Description**

In account enumeration reconnaissance, an attacker uses a dictionary with thousands of user names, or tools such as KrbGuess to attempt to guess user names in your domain. The attacker makes Kerberos requests using these names  to try to find a valid username in your domain. If a guess successfully determines a username, the attacker will get the Kerberos error **Preauthentication required** instead of **Security principal unknown**.

In this detection, ATA can detect where the attack came from, the total number of guess attempts and how many were matched. If there are too many unknown users, ATA will detect it as a suspicious activity.

**Investigation**

1. Select the alert to get to its details page.

    1. Should this host machine query the domain controller as to whether accounts exist (for example, Exchange servers)?

1. Is there a script or application running on the host that could generate this behavior?

    If the answer to either of these questions is yes, **Close** the suspicious activity (it's a benign true positive) and exclude that host from the suspicious activity.

1. Download the details of the alert in an Excel spreadsheet to conveniently see the list of account attempts, divided into existing and non-existing accounts. If you look at the non-existing accounts sheet in the spreadsheet and the accounts look familiar, they may be disabled accounts or employees who left the company. In this case, it's unlikely that the attempt is coming from a dictionary. Most likely, it's an application or script that is checking to see which accounts still exist in Active Directory, meaning that it's a benign true positive.

1. If the names are largely unfamiliar, did any of the guess attempts match existing account names in Active Directory? If there are no matches, the attempt was futile, but you should pay attention to the alert to see if it gets updated over time.

1. If any of the guess attempts match existing account names, the attacker knows of the existence of accounts in your environment and can attempt to use brute force to access your domain using the discovered user names. Check the guessed account names for additional suspicious activities. Check to see if any of the matched accounts are sensitive accounts.

**Remediation**

[Complex and long passwords](/windows/device-security/security-policy-settings/password-policy) provide the necessary first level of security against brute-force attacks.

## Reconnaissance using Directory Services queries

**Description**

Directory services reconnaissance is used by attackers to map the directory structure and target privileged accounts for later steps in an attack. The Security Account Manager Remote (SAM-R) protocol is one of the methods used to query the directory to perform such mapping.

In this detection, no alerts would be triggered in the first month after ATA is deployed. During the learning period, ATA profiles which SAM-R queries are made from which computers, both enumeration and individual queries of sensitive accounts.

**Investigation**

1. Select the alert to get to its details page. Check which queries were performed (for example, Enterprise admins, or Administrator) and whether or not they were successful.

1. Are such queries supposed to be made from the source computer in question?

1. If yes and the alert gets updated, **Suppress** the suspicious activity.

1. If yes and it shouldn't do this anymore, **Close** the suspicious activity.

1. If there's information on the involved account: are such queries supposed to be made by that account or does that account normally sign in to the source computer?

   - If yes and the alert gets updated, **Suppress** the suspicious activity.

   - If yes and it shouldn't do this anymore, **Close** the suspicious activity.

   - If the answer was no to all of the above, assume this is malicious.

1. If there's no information about the account that was involved, you can go to the endpoint and check which account was logged in at the time of the alert.

**Remediation**

1. Is the computer running a vulnerability scanning tool?
1. Investigate whether the specific queried users and groups in the attack are privileged or high value accounts (that is, CEO, CFO, IT management, and so on).  If so, look at other activity on the endpoint as well and monitor computers that the queried accounts are logged into, as they're probably targets for lateral movement.

## Reconnaissance using DNS

**Description**

Your DNS server contains a map of all the computers, IP addresses, and services in your network. This information is used by attackers to map your network structure and target interesting computers for later steps in their attack.

There are several query types in the DNS protocol. ATA detects the AXFR (Transfer) request originating from non-DNS servers.

**Investigation**

1. Is the source machine (**Originating from…**) a DNS server? If yes, then this is probably a false positive. To validate, select the alert to get to its details page. In the table, under **Query**, check which domains were queried. Are these existing domains? If yes, then **Close** the suspicious activity (it's a false positive). Also, make sure UDP port 53 is open between the ATA Gateway and the source computer to prevent future false positives.
1. Is the source machine running a security scanner? If yes, **Exclude** the entities in ATA, either directly with **Close and exclude** or via the **Exclusion** page (under **Configuration** – available for ATA admins).
1. If the answer to all the preceding questions is no, keep investigating focusing on the source computer. Select the source computer to go to its profile page. Check what happened around the time of the request, searching for unusual activities, such as: who was logged in, which resources where accessed.

**Remediation**

Securing an internal DNS server to prevent reconnaissance using DNS from occurring can be accomplished by disabling or restricting zone transfers only to specified IP addresses. For more information on restricting zone transfers, see [Restrict Zone Transfers](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee649273(v=ws.10)).
Modifying zone transfers is one task among a checklist that should be addressed for [securing your DNS servers from both internal and external attacks](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc770432(v=ws.11)).

## Reconnaissance using SMB session enumeration

**Description**

Server Message Block (SMB) enumeration enables attackers to get information about where users recently logged on. Once attackers have this information, they can move laterally in the network to get to a specific sensitive account.

In this detection, an alert is triggered when an SMB session enumeration is performed against a domain controller.

**Investigation**

1. Select the alert to get to its details page. Check the account/s that performed the operation and which accounts were exposed, if any.

   - Is there some kind of security scanner running on the source computer? If yes, **Close and exclude** the suspicious activity.

1. Check which involved user/s performed the operation. Do they normally log into the source computer or are they administrators who should perform such actions?

1. If yes and the alert gets updated, **Suppress** the suspicious activity.

1. If yes and it shouldn't get updated, **Close** the suspicious activity.

1. If the answer to all the above is no, assume the activity is malicious.

**Remediation**

1. Contain the source computer.
1. Find and remove the tool that performed the attack.

## Remote execution attempt detected

**Description**

Attackers who compromise administrative credentials or use a zero-day exploit can execute remote commands on your domain controller. This can be used for gaining persistence, collecting information, denial of service (DOS) attacks or any other reason. ATA detects PSexec and Remote WMI connections.

**Investigation**

1. This is common for administrative workstations as well as for IT team members and service accounts that perform administrative tasks against domain controllers. If this is this the case, and the alert gets updated because the same admin or computer is performing the task, **Suppress** the alert.
1. Is the computer in question allowed to perform this remote execution against your domain controller?
   - Is the account in question allowed to perform this remote execution against your domain controller?
   - If the answer to both questions is yes, then **Close** the alert.
1. If the answer to either questions is no, this activity should be considered a true positive. Try to find the source of the attempt by checking computer and account profiles. Select the source computer or account to go to its profile page. Check what happened around the time of these attempts, searching for unusual activities, such as: who was logged in, which resources where accessed.

**Remediation**

1. Restrict remote access to domain controllers from non-Tier 0 machines.

1. Implement [privileged access](/security/compass/overview) to allow only hardened machines to connect to domain controllers for admins.

## Sensitive account credentials exposed & Services exposing account credentials

> [!NOTE]
> This suspicious activity was deprecated and only appears in ATA versions prior to 1.9. For ATA 1.9 and later, see [Reports](reports.md).

**Description**

Some services send account credentials in plain text. This can even happen for sensitive accounts. Attackers monitoring network traffic can catch and then reuse these credentials for malicious purposes. Any clear text password for a sensitive account triggers the alert, while for non-sensitive accounts the alert is triggered if five or more different accounts  send clear text passwords from the same source computer.

**Investigation**

Select the alert to get to its details page. See which accounts were exposed. If there are many such accounts, select **Download details** to view the list in an Excel spreadsheet.

Usually there's a script or legacy application on the source computers that uses LDAP simple bind.

**Remediation**

Verify the configuration on the source computers and make sure not to use LDAP simple bind. Instead of using LDAP simple binds you can use LDAP SALS or LDAPS.

## Suspicious authentication failures

**Description**

In a brute-force attack, an attacker attempts to authenticate with many different passwords for different accounts until a correct password is found for at least one account. Once found, an attacker can sign in using that account.

In this detection, an alert is triggered when many authentication failures using Kerberos or NTLM occurred, this can be either horizontally with a small set of passwords across many users; or vertically with a large set of passwords on just a few users; or any combination of these two options. The minimum period before an alert can be triggered is one week.

**Investigation**

1. Select **Download details** to view the full information in an Excel spreadsheet. You can get the following information:
   - List of the attacked accounts
   - List of guessed accounts in which login attempts ended with successful authentication
   - If the authentication attempts were performed using NTLM, you'll see relevant event activities
   - If the authentication attempts were performed using Kerberos, you will see relevant network activities
1. Select the source computer to go to its profile page. Check what happened around the time of these attempts, searching for unusual activities, such as: who was logged in, which resources where accessed.
1. If the authentication was performed using NTLM, and you see that the alert occurs many times, and there isn't enough information available about the server that the source machine tried to access, you should enable **NTLM auditing** on the involved domain controllers. To do this, turn on event 8004. This is the NTLM authentication event that includes information about the source computer, user account, and **server** that the source machine tried to access. After you know which server sent the authentication validation, you should investigate the server by checking its events such as 4624 to better understand the authentication process.

**Remediation**

[Complex and long passwords](/windows/security/threat-protection/security-policy-settings/password-policy) provide the necessary first level of security against brute-force attacks.

## Suspicious service creation <a name="suspicious-service-creation"></a>

**Description**

Attackers attempt to run suspicious services on your network. ATA raises an alert when a new service that seems suspicious has been created on a domain controller. This alert relies on event 7045, and it's detected from each domain controller that is covered by an ATA Gateway or Lightweight Gateway.

**Investigation**

1. If the computer in question is an administrative workstation, or a computer on which IT team members and service accounts perform administrative tasks, this may be a false positive and you may need to **Suppress** the alert and add it to the Exclusions list if necessary.

1. Is the service something you recognize on this computer?

   - Is the **account** in question allowed to install this service?

   - If the answer to both questions is *yes*, then **Close** the alert or add it to the Exclusions list.

1. If the answer to either questions is *no*, then this should be considered a true positive.

**Remediation**

- Implement less privileged access on domain machines to allow only specific users the right to create new services.

## Suspicion of identity theft based on abnormal behavior

**Description**

ATA learns the entity behavior for users, computers, and resources over a sliding three-week period. The behavior model is based on the following activities: the machines the entities logged in to, the resources the entity requested access to, and the time these operations took place. ATA sends an alert when there's a deviation from the entity's behavior based on machine learning algorithms.

**Investigation**

1. Is the user in question supposed to be performing these operations?

1. Consider the following cases as potential false positives: a user who returned from vacation, IT personnel who perform excess access as part of their duty (for example a spike in help-desk support in a given day or week), remote desktop applications.+
If you **Close and exclude** the alert, the user will no longer be part of the detection

**Remediation**

 Different actions should be taken depending on what caused this abnormal behavior to occur. For example, if the network was scanned, the source machine should be blocked from the network (unless it's approved).

## Unusual protocol implementation

**Description**

Attackers use tools that implement various protocols (SMB, Kerberos, NTLM) in non-standard ways. While this type of network traffic is accepted by Windows without warnings, ATA is able to recognize potential malicious intent. The behavior is indicative of techniques such as Over-Pass-the-Hash, as well as exploits used by advanced ransomware, such as WannaCry.

**Investigation**

Identify the protocol that is unusual – from the suspicious activity time line, select the suspicious activity to access the details page; the protocol appears above the arrow: Kerberos or NTLM.

- **Kerberos**: Often triggered if a hacking tool such as Mimikatz was potentially used an Overpass-the-Hash attack. Check if the source computer is running an application that implements its own Kerberos stack, that isn't in accordance with the Kerberos RFC. In that case, it's a benign true positive and the alert can be **Closed**. If the alert keeps being triggered, and it's still the case, you can **Suppress** the alert.

- **NTLM**: Could be either WannaCry or tools such as Metasploit, Medusa, and Hydra.

To determine whether the activity is a WannaCry attack, perform the following steps:

1. Check if the source computer is running an attack tool such as Metasploit, Medusa, or Hydra.

1. If no attack tools are found, check if the source computer is running an application that implements its own NTLM or SMB stack.

1. If not, check if caused by WannaCry by running a WannaCry scanner script, for example [this scanner](https://github.com/apkjet/TrustlookWannaCryToolkit/tree/master/scanner) against the source computer involved in the suspicious activity. If the scanner finds that the machine as infected or vulnerable, work on patching the machine and removing the malware and blocking it from the network.

1. If the script didn't find that the machine is infected or vulnerable, then it could still be infected but SMBv1 might have been disabled or the machine has been patched, which would affect the scanning tool.

**Remediation**

Apply the latest patches to all of your machines, and check all security updates are applied.

1. [Disable SMBv1](https://techcommunity.microsoft.com/t5/storage-at-microsoft/stop-using-smb1/ba-p/425858)

1. [Remove WannaCry](https://support.microsoft.com/help/890830/remove-specific-prevalent-malware-with-windows-malicious-software-remo)

1. Data in the control of some ransom software can sometimes be decrypted. Decryption is only possible if the user hasn't restarted or turned off the computer. For more information, see [Wanna Cry Ransomware](https://answers.microsoft.com/en-us/windows/forum/windows_10-security/wanna-cry-ransomware/5afdb045-8f36-4f55-a992-53398d21ed07?auth=1)

>[!NOTE]
> To disable a suspicious activity alert, contact support.

## See also

- [ATA suspicious activity playbook](https://aka.ms/ataplaybook)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
- [Working with suspicious activities](working-with-suspicious-activities.md)
