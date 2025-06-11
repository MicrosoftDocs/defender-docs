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

# DisruptionAndResponseEvents

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]



The `DisruptionAndResponseEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information automatic attack disruption events in Microsoft Defender for Endpoint. [ADD MORE DESCRIPTION] Use this reference to construct queries that return information from this table.

> [!TIP]
> For detailed information about the events types (`ActionType` values) supported by a table, use the built-in schema reference available in Microsoft Defender XDR.

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).


| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the event was recorded |
| `ActionType` | `string` | Type of disruption action taken  |
| `DeviceId` | `string` | Unique identifier for the device that reported the event; the reporting device can be the device that reported the event, the device that blocked the access, or the compromised device itself   |
| `SourceDeviceId` | `string` | Unique identifier for the device that blocked the traffic or access attempt  |
| `TargetDeviceId` | `string` | Unique identifier for the device that was contained by other devices in the network   |
| `TargetDeviceName ` | `string` | Name of the device that the compromised account attempted to access   |
| `TargetDomainName ` | `string` | Domain name of the device that the compromised account attempted to access  |
| `DeviceName` | `string` | Name of the device that reported the event; the reporting device can be the device that reported the event, the device that blocked the access, or the compromised device itself   |
| `DomainName` | `string` | Domain name that the device that reported the event is joined to; the reporting device can be the device that reported the event, the device that blocked the access, or the compromised device itself  |
| `InitiatingProcessId ` | `integer` | Process ID (PID) of the process that triggered that block action, based on the perspective of the device that logged the event  |
| `InitiatingProcessFileName` | `string` |Name of the process that triggered the block action, based on the perspective of the device that logged the event  |
| `SourceUserSid` | `string` | The compromised account’s security identifier   |
| `SourceUserName` | `string` | The compromised account’s user name  |
| `SourceUserDomainName` | `string` | The compromised account’s domain name   |
| `SourceIPAddress` | `string` | IP address where the attacker communication came from, if the IP was not blocked by automatic attack disruption  |
| `SourcePort` | `integer` | Port where the attacker communication came from  |
| `IPAddress` | `string` | IP address that was blocked by automatic attack disruption  |
| `Port` | `string` | Port that was blocked by automatic attack disruption  |
| `SourceDeviceName` | `string` | Host name of the device where the attack came from |
| `SourceDomainName` | `string` | Domain name of the attacker device  |
| `AuthenticationProtocol` | `string` | Authentication protocol that the compromised user used to sign in; possible values: Undefined, NTLM, Kerberos |
| `Service` | `string` | Name of the service the attacker attempted to use, if the attacker signed in using Kerberos or NTLM  |
| `InterfaceUuidSourceDomainName` | `string` | Unique identifier (UUID) for the Remote Procedure Call (RPC) interface that the attacker attempted to access |
| `InterfaceFriendlyName` | `string` |Friendly name of the interface represented by the interface UUID  |
| `FileName` | `string` | Name of the file that the attacker attempted to access |
| `ShareName` | `string` | Name of the share location that the attacker attempted to access |
| `LogonType` | `string` | Type of logon session the user attempted; possible values: interactive, remote interactive (RDP), network, batch job, service  |
| `LogonId ` | `long` | Identifier for a logon session. This identifier is unique on the same device only between restarts.  |
| `SessionId ` | `long` | Domain name of the attacker device  |
| `CompromisedAccountCount` | `integer` | Number of compromised accounts that are part of the policy |
| `PolicyId` | `string` | Unique identifier for the policy |
| `PolicyName` | `string` | Name of the policy  |
| `PolicyVersion` | `string` | Version of the policy	Version of the policy |
| `PolicyHash` | `string` | Unique hash of the policy  |
| `DataSources` | `array` |Products or services that provided information for the event |

## Related topics
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
