---
title: DeviceLogonEvents table in the advanced hunting schema
description: Learn how to use the DeviceLogonEvents table in advanced hunting to investigate authentication events and access-token privilege context.
#customer intent: As a security analyst, I want to understand DeviceLogonEvents fields so that I can investigate authentication activity and privileged logons.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom: 
- cx-ti
- cx-ah
- msecd-doc-authoring-1015
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: reference
ms.date: 08/24/2026
ai-usage: ai-assisted
---

# DeviceLogonEvents

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The `DeviceLogonEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about user logons and other authentication events on devices. Use this reference to construct queries that return information from this table.

> [!TIP]
> For detailed information about the event types (`ActionType` values) supported by a table, use the built-in schema reference available in the Defender portal.

This advanced hunting table is populated by records from Microsoft Defender for Endpoint. If your organization hasn't deployed the service in Microsoft Defender, queries that use the table return no results. For information about deploying Defender for Endpoint in the Defender portal, see [Deploy supported services](deploy-supported-services.md).

For information about other tables in the advanced hunting schema, see the [advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the event was recorded |
| `DeviceId` | `string` | Unique identifier for the device in the service |
| `DeviceName` | `string` | Fully qualified domain name (FQDN) of the device |
| `ActionType` | `string` | Type of activity that triggered the event |
| `LogonType` | `string` | Type of logon session, specifically:<br><br> - **Interactive**: User physically interacts with the device using the local keyboard and screen<br><br> - **Remote interactive (RDP) logons**: User interacts with the device remotely using Remote Desktop, Terminal Services, Remote Assistance, or other RDP clients<br><br> - **Network**: Session initiated when the device is accessed using PsExec or when shared resources on the device, such as printers and shared folders, are accessed<br><br> - **Batch**: Session initiated by scheduled tasks<br><br> - **Service**: Session initiated by services as they start<br> |
| `AccountDomain` | `string` | Domain of the account |
| `AccountName` | `string` | User name of the account |
| `AccountSid` | `string` | Security Identifier (SID) of the account |
| `Protocol` | `string` | Protocol used during the communication |
| `FailureReason` | `string` | Information explaining why the recorded action failed |
| `IsLocalAdmin` | `boolean` | Boolean indicator of whether the user is a local administrator on the device |
| `LogonId` | `long` | Identifier for a logon session. This identifier is unique on the same device only between restarts. |
| `RemoteDeviceName` | `string` | Name of the device that performed a remote operation on the affected device. Depending on the event being reported, this name could be a fully qualified domain name (FQDN), a NetBIOS name, or a hostname without domain information. |
| `RemoteIP` | `string` | IP address of the device from which the logon attempt was performed |
| `RemoteIPType` | `string` | Type of IP address, for example Public, Private, Reserved, Loopback, Teredo, FourToSixMapping, and Broadcast |
| `RemotePort` | `int` | TCP port on the remote device that was being connected to |
| `InitiatingProcessAccountDomain` | `string` | Domain of the account that ran the process responsible for the event |
| `InitiatingProcessAccountName` | `string` | User name of the account that ran the process responsible for the event |
| `InitiatingProcessAccountSid` | `string` | Security Identifier (SID) of the account that ran the process responsible for the event |
| `InitiatingProcessAccountUpn` | `string` | User principal name (UPN) of the account that ran the process responsible for the event |
| `InitiatingProcessAccountObjectId` | `string` | Microsoft Entra object ID of the user account that ran the process responsible for the event |
| `InitiatingProcessIntegrityLevel` | `string` | Integrity level of the process that initiated the event. Windows assigns integrity levels to processes based on certain characteristics, such as if they were launched from an internet download. These integrity levels influence permissions to resources. |
| `InitiatingProcessTokenElevation` | `string` | Token type indicating the presence or absence of User Account Control (UAC) privilege elevation applied to the process that initiated the event |
| `InitiatingProcessSHA1` | `string` | SHA-1 hash of the process (image file) that initiated the event |
| `InitiatingProcessSHA256` | `string` | SHA-256 hash of the process (image file) that initiated the event. This field is usually not populated. Use the `InitiatingProcessSHA1` column when available. |
| `InitiatingProcessMD5` | `string` | MD5 hash of the process (image file) that initiated the event |
| `InitiatingProcessFileName` | `string` | Name of the process file that initiated the event; if unavailable, the name of the process that initiated the event might be shown instead |
| `InitiatingProcessFileSize` | `long` | Size of the file that ran the process responsible for the event |
| `InitiatingProcessVersionInfoCompanyName` | `string` | Company name from the version information of the process (image file) responsible for the event |
| `InitiatingProcessVersionInfoProductName` | `string` | Product name from the version information of the process (image file) responsible for the event |
| `InitiatingProcessVersionInfoProductVersion` | `string` | Product version from the version information of the process (image file) responsible for the event |
| `InitiatingProcessVersionInfoInternalFileName` | `string` | Internal file name from the version information of the process (image file) responsible for the event |
| `InitiatingProcessVersionInfoOriginalFileName` | `string` | Original file name from the version information of the process (image file) responsible for the event |
| `InitiatingProcessVersionInfoFileDescription` | `string` | Description from the version information of the process (image file) responsible for the event |
| `InitiatingProcessId` | `long` | Process ID (PID) of the process that initiated the event |
| `InitiatingProcessCommandLine` | `string` | Command line used to run the process that initiated the event |
| `InitiatingProcessCreationTime` | `datetime` | Date and time when the process that initiated the event was started |
| `InitiatingProcessFolderPath` | `string` | Folder containing the process (image file) that initiated the event |
| `InitiatingProcessParentId` | `long` | Process ID (PID) of the parent process that spawned the process responsible for the event |
| `InitiatingProcessParentFileName` | `string` | Name or full path of the parent process that spawned the process responsible for the event |
| `InitiatingProcessParentCreationTime` | `datetime` | Date and time when the parent of the process responsible for the event was started |
| `ReportId` | `long` | Event identifier based on a repeating counter. To identify unique events, this column must be used in conjunction with the DeviceName and Timestamp columns. |
| `AppGuardContainerId` | `string` | Identifier for the virtualized container used by Application Guard to isolate browser activity |
| `AdditionalFields` | `string` | Additional information about the event in JSON array format |
| `InitiatingProcessSessionId` | `long` | Windows session ID of the initiating process |
| `IsInitiatingProcessRemoteSession` | `bool` | Indicates whether the initiating process was run under a remote desktop protocol (RDP) session (`true`) or locally (`false`) |
| `InitiatingProcessRemoteSessionDeviceName` | `string` | Device name of the remote device from which the initiating process's RDP session was initiated |
| `InitiatingProcessRemoteSessionIP` | `string` | IP address of the remote device from which the initiating process's RDP session was initiated |
| `InitiatingProcessUniqueId` | `string` | Unique identifier of the initiating process; this is equal to the Process Start Key in Windows devices |

## Access-token context fields

For token creation events where `InitiatingProcessFileName` is `lsass.exe`, the `AdditionalFields` column can contain access-token privilege context captured at logon:

- `TokenHasDomainAdminSid`: The token contains the Domain Admins group security identifier (SID).
- `TokenHasSchemaAdminSid`: The token contains the Schema Admins group SID.
- `TokenHasEnterpriseAdminSid`: The token contains the Enterprise Admins group SID.
- `TokenHasGroupPolicyCreatorSid`: The token contains the Group Policy Creator Owners group SID.
- `TokenHasDomainControllerSid`: The token contains the Domain Controllers group SID, which indicates a domain controller computer account logon.
- `TokenHasCertificatePublisherSid`: The token contains the Certificate Publishers group SID. This field is relevant to Active Directory Certificate Services scenarios.
- `TokenHasLocalAccountSid`: The token contains a local account SID instead of a domain account SID.
- `TokenHasNtlmAuthSid`: The token contains the NT LAN Manager (NTLM) authentication SID instead of a Kerberos authentication SID.
- `TokenHasThisOrgCertificateSid`: The token contains a SID associated with certificate-based authentication issued by the organization, such as a Public Key Cryptography for Initial Authentication in Kerberos (PKINIT) logon.
- `NumberOfSidsInDomainAdminToken`: If the token contains the Domain Admins group SID, this field reports the total number of SIDs in the token.

Defender derives these fields from the token's SID list when Windows creates the access token. The fields represent the privileges and group memberships present at logon, including temporary privilege elevation. Because directory membership can change after logon, the token context might not match the current directory state.

The following query finds token creation events that contain a Domain Admins or Enterprise Admins group SID and parses the token context from `AdditionalFields`:

```kusto
DeviceLogonEvents
| where InitiatingProcessFileName == "lsass.exe"
| where AdditionalFields has "TokenHasDomainAdminSid"
    or AdditionalFields has "TokenHasEnterpriseAdminSid"
| extend TokenContext = parse_json(AdditionalFields)
| project Timestamp, DeviceName, AccountDomain, AccountName, LogonType,
    TokenHasDomainAdminSid = TokenContext.TokenHasDomainAdminSid,
    TokenHasEnterpriseAdminSid = TokenContext.TokenHasEnterpriseAdminSid,
    NumberOfSidsInDomainAdminToken = TokenContext.NumberOfSidsInDomainAdminToken
```

> [!NOTE]
> The collection of DeviceLogonEvents isn't supported on Windows 7 or Windows Server 2008 R2 devices onboarded to Defender for Endpoint. We recommend upgrading to a more recent operating system for optimal visibility into user logon activity.

## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
