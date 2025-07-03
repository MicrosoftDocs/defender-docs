---
title: DisruptionAndResponseEvents table in the advanced hunting schema
description: Learn about the DisruptionAndResponseEvents table in the advanced hunting schema
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: 
- cx-ti
- cx-ah
ms.topic: reference
ms.date: 06/11/2025
---

# DisruptionAndResponseEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]



> [!IMPORTANT]
> Some information relates to prereleased product which might be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.


The `DisruptionAndResponseEvents` table in the [advanced hunting](advanced-hunting-overview.md) contains information about [automatic attack disruption](automatic-attack-disruption.md) events in Microsoft Defender XDR. These events include both block and policy application events related to triggered attack disruption policies, and automatic actions that were taken across related workloads. 

Users can use this table to increase their visibility and awareness of active, complex attacks disrupted by automatic attack disruption. Understanding the scope of even complex attacks, their context, impact, and why disruption actions were taken, can help users make better and faster decisions and allocate resources more efficiently.

This advanced hunting table is populated by records from various Microsoft security services. If your organization hasn’t deployed the service in Microsoft Defender XDR, queries that use the table aren’t going to work or return complete results. For more information about how to deploy supported services in Defender XDR, read [Deploy supported services](deploy-supported-services.md).

Use this reference to construct queries that return information from this table.

> [!TIP]
> For detailed information about the events types (`ActionType` values) supported by a table, use the built-in schema reference available in Microsoft Defender XDR.

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).


| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the event was recorded |
| `ActionType` | `string` | Type of disruption action taken, for example: ContainedUserLogonBlocked, ContainedUserSmbFileOpenBlocked, SafeBootGuardApplied   |
| `DeviceId` | `string` | Unique identifier for the device that reported the event; the reporting device can be the one that blocked the access, the compromised device itself, or even a different device that is aware of the attack |
| `SourceDeviceId` | `string` | Unique identifier for the device that the attack originated from  |
| `TargetDeviceId` | `string` | Unique identifier for the device that was targeted or attacked |
| `TargetDeviceName ` | `string` | Name of the device that was targeted or attacked  |
| `TargetDomainName ` | `string` | Domain name of the device that was targeted or attacked  |
| `DeviceName` | `string` | Name of the device that reported the event; the reporting device can be the one that blocked the access, the compromised device itself, or even a different device that is aware of the attack  |
| `DomainName` | `string` | Domain name that the device that reported the event is joined to; the reporting device can be the one that blocked the access, the compromised device itself, or even a different device that is aware of the attack |
| `InitiatingProcessId` | `integer` | Process ID (PID) of the process that triggered that block action, based on the perspective of the reporting device |
| `InitiatingProcessFileName` | `string` |Name of the process that triggered the block action, based on the perspective of the reporting device |
| `SourceUserSid` | `string` | The security identifier of the account conducting the malicious activity   |
| `SourceUserName` | `string` | The user name of the account conducting the malicious activity  |
| `SourceUserDomainName` | `string` | The domain name of the account conducting the malicious activity  |
| `SourceIPAddress` | `string` | IP address where the attacker communication originated from and was blocked by automatic attack disruption  |
| `SourcePort` | `integer` | Port where the attacker communication originated from  |
| `IPAddress` | `string` | IP address that the attacker attempted to access |
| `Port` | `string` | Port that the attacker attempted to access |
| `SourceDeviceName` | `string` | Host name of the device where the attack originated from |
| `SourceDomainName` | `string` | Domain name of the device where the attack originated from  |
| `AuthenticationProtocol` | `string` | Authentication protocol that the compromised user used to sign in; possible values: Undefined, NTLM, Kerberos |
| `Service` | `string` | Name of the service the attacker attempted to use, if the attacker signed in using Kerberos or NTLM; for example: SMB, HTTP, cifs, SMB, host, ldap, SMB, krbtgt |
| `InterfaceUuidSourceDomainName` | `string` | Unique identifier (UUID) for the Remote Procedure Call (RPC) interface that the attacker attempted to access |
| `InterfaceFriendlyName` | `string` |Friendly name of the interface represented by the interface UUID  |
| `FileName` | `string` | Name of the file that the attacker attempted to access |
| `ShareName` | `string` | Name of the share location that the attacker attempted to access |
| `LogonType` | `string` | Type of logon session the user attempted; possible values: interactive, remote interactive (RDP), network, batch job, service  |
| `LogonId ` | `long` | Identifier for a logon session; this is unique on the same device only between restarts |
| `SessionId ` | `long` | Unique number assigned to a user by a website's server for the duration of the visit or session  |
| `CompromisedAccountCount` | `integer` | Number of compromised accounts that are part of the policy |
| `PolicyId` | `string` | Unique identifier for the policy |
| `PolicyName` | `string` | Name of the policy  |
| `PolicyVersion` | `string` | Version of the policy |
| `PolicyHash` | `string` | Unique hash of the policy  |
| `DataSources` | `array` |Products or services that provided information for the event; for example: Microsoft Defender for Endpoint |
| `IsPolicyOn` | `boolean` |Indicates the current state of the policy on the device at the time of the disruption event; possible values: true (the policy is on, therefore it was applied or enforced), false (the policy was turned off or revoked from the device) |
|`ReportType` | `string` | The nature and impact level of the reported event; possible values: Prevented (the action, such as a connection or authentication attempt, was fully blocked before execution), Blocked (an active connection or session was forcibly terminated, with partial impact on the device), PolicyUpdated (the client received and possibly applied a new policy) |

## Related topics
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
