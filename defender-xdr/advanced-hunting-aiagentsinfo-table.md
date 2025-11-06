---
title: AIAgentsInfo table in the advanced hunting schema
description: Learn about information associated with alerts in the AIAgentsInfo table of the advanced hunting schema
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: abbyweisberg
author: AbbyMSFT
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: 
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Defender for Cloud Apps
ms.topic: reference
ms.date: 11/06/2025
---

# AIAgentsInfo

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]



The `AIAgentsInfo` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about various entities—files, IP addresses, URLs, users, or devices—associated with alerts from Microsoft Defender for Endpoint, Microsoft Defender for Office 365, Microsoft Defender for Cloud Apps, and Microsoft Defender for Identity. Use this reference to construct queries that return information from this table.

This advanced hunting table is populated by records from various Microsoft Defender services. If your organization hasn’t deployed the service in Microsoft Defender XDR, queries that use the table aren’t going to work or return any results. For more information about how to deploy services in Defender XDR, read [Deploy supported services](deploy-supported-services.md).

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Last date and time recorded for the agent info |
| `AIAgentId` | `guid` | Unique identifier for the agent as assigned to it in Microsoft 365 Copilot or Copilot Studio |
| `AIAgentName` | `string` | Display name of the agent |
| `AgentCreationTime` | `datetime` | Date and time when the agent was created |
| `CreatorAccountUpn` | `string` | User principal name (UPN) of the account that created the agent |
| `OwnerAccountUpns` | `string` | User principal names (UPN) of all the owners of the agent |
| `LastModifiedByUpn` | `string` | User principal name (UPN) of the account that last modified that agent |
| `LastModifiedTime` | `datetime` | Date and time when the agent was last modified |
| `LastPublishedTime` | `datetime` | Date and time when the agent was last published |
| `LastPublishedByUpn` | `string` | User principal name (UPN) of the account that last published the agent |
| `AgentDescription` | `string` | Description of the agent as displayed in the agent's source |
| `AgentStatus` | `string` |Status of the agent; possible values: Created, Published, Deleted |
| `UserAuthenticationType` | `string` |The agent’s configured authentication type for users interacting with the agent; possible values: None, Microsoft, Custom.|
| `AgentUsers` | `string` |List of user principal names (UPNs) or group IDs that can use the agent |
| `KnowledgeDetails` | `string` |Details about the knowledge sources added to the agent |
| `AgentActionTriggers` | `string` |List of triggers that makes an autonomous agent take action |
| `RawAgentInfo` | `string` |Contents of the raw JSON that describes the agent and contains configuration details, as received from the provider |
| `AuthenticationTrigger` | `string` |Indicates when authentication is triggered for the agent; possible values: As Needed, Always|
| `AccessControlPolicy` | `string` |Ssers that can interact with the agent; possible values: Any, Copilot readers, Group membership, Any (multitenant) |
| `AuthorizedSecurityGroupIds` |`dynamic` |List of Azure Active Directory Group IDs that are allowed to interact with the agent |
| `AgentTopicsDetails` | `dynamic` |Specifications of the topics that the agent can perform |
| `AgentToolsDetails` | `dynamic` |Specifications of the tools that the agent can access and perform actions on |
| `EnvironmentId` | `string` |The identifier of the Microsoft Power Platform environment the agent resides in |
| `Platform` | `string` |The platform that provided the information about the agents; possible values: Copilot Studio |

## Related topics
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
