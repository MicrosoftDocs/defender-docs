---
title: Monitored activities
description: Describes each activity type monitored by Microsoft Defender for Identity
ms.date: 02/12/2024
ms.topic: conceptual
---

# Microsoft Defender for Identity monitored activities

Microsoft Defender for Identity monitors information generated from your organization's Active Directory, network activities and event activities to detect suspicious activity. The monitored activity information enables Defender for Identity to help you determine the validity of each potential threat and correctly triage and respond.

In the case of a valid threat, or **true positive**, Defender for Identity enables you to discover the scope of the breach for each incident, investigate which entities are involved, and determine how to remediate them.

The information monitored by Defender for Identity is presented in the form of activities. Defender for Identity currently supports monitoring of the following activity types:

> [!NOTE]
>
> - This article is relevant for all Defender for Identity sensor types.
> - Defender for Identity monitored activities appear on both the user and machine profile page.
> - Defender for Identity monitored activities are also available in Microsoft Defender XDR's [Advanced Hunting](https://security.microsoft.com/advanced-hunting) page.

## Monitored user activities: User account AD attribute changes

|Monitored activity|Description|
|---------------------|------------------|
|Account Constrained Delegation State Changed|The account state is now enabled or disabled for delegation.|
|Account Constrained Delegation SPNs Changed|Constrained delegation restricts the services to which the specified server can act on behalf of the user.|
|Account Delegation Changed | Changes to the account delegation settings |
|Account Disabled Changed|Indicates whether an account is disabled or enabled.|
|Account Expired|Date when the account expires.|
|Account Expiry Time Changed|Change to the date when the account expires.|
|Account Locked Changed|Changes to the account lock settings.|
|Account Password Changed|User changed their password.|
|Account Password Expired|User's password expired.|
|Account Password Never Expires Changed|User's password changed to never expire.|
|Account Password Not Required Changed|User account was changed to allow logging in with a blank password.|
|Account Smartcard Required Changed|Account changes to require users to log on to a device using a smart card.|
|Account Supported Encryption Types Changed|Kerberos supported encryption types were changed (types: Des, AES 129, AES 256)|
|Account Unlock changed | Changes to the account unlock settings |
|Account UPN Name Changed|User's principle name was changed.|
|Group Membership Changed|User was added/removed, to/from a group, by another user or by themselves.|
|User Mail Changed|Users email attribute was changed.|
|User Manager Changed|User's manager attribute was changed.|
|User Phone Number Changed|User's phone number attribute was changed.|
|User Title Changed|User's title attribute was changed.|

## Monitored user activities: AD security principal operations

|Monitored activity|Description|
|---------------------|------------------|
|User Account Created|User account was created|  
|Computer Account Created|Computer account was created|
|Security Principal Deleted Changed|Account was deleted/restored (both user and computer).|
|Security Principal Display Name Changed|Account display name was changed from X to Y.|
|Security Principal Name Changed|Account name attribute was changed.|
|Security Principal Path Changed|Account Distinguished name was changed from X to Y.|
|Security Principal Sam Name Changed|SAM name changed (SAM is the logon name used to support clients and servers running earlier versions of the operating system).|

## Monitored user activities: Domain controller based user operations

|Monitored activity|Description|
|---------------------|------------------|
|Directory Service Replication|User tried to replicate the directory service.|
|DNS Query|Type of query user performed against the domain controller (**AXFR**,**TXT**, **MX**, **NS**, **SRV**, **ANY**, **DNSKEY**).|
|gMSA Password retrieval | gMSA account password was retrieved by a user. <br> To monitor this activity, event 4662 must be collected. For more information, see [Configure Windows Event collection](configure-windows-event-collection.md).|
|LDAP Query | User performed an LDAP query.|
|Potential lateral movement |  A lateral movement was identified.|
|PowerShell execution | User attempted to remotely execute a PowerShell method.|
|Private Data Retrieval|User attempted/succeeded to query private data using LSARPC protocol.|
|Service Creation|User attempted to remotely create a specific service to a remote machine.|
|SMB Session Enumeration|User attempted to enumerate all users with open SMB sessions on the domain controllers.|
|SMB file copy|User copied files using SMB|
|SAMR Query|User performed a SAMR query.|
|Task Scheduling|User tried to remotely schedule X task to a remote machine.|
|Wmi Execution|User attempted to remotely execute a WMI method.|

## Monitored user activities: Login operations

For more information, see [Supported logon types](/microsoft-365/security/defender/advanced-hunting-identitylogonevents-table#supported-logon-types) for the `IdentityLogonEvents` table.

## Monitored machine activities: Machine account

|Monitored activity|Description|
|---------------------|------------------|
|Computer Operating System Changed|Change to the computer OS.|
|SID-History changed | Changes to the computer SID history |

## See Also

- [Managing security alerts](/defender-for-identity/manage-security-alerts)
- [Security alert guide](/defender-for-identity/alerts-overview)
- [Investigate assets](/defender-for-identity/investigate-assets)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
