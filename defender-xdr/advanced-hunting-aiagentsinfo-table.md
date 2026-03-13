---
title: AIAgentsInfo table in the advanced hunting schema
description: Learn about information associated with alerts in the AIAgentsInfo table of the advanced hunting schema
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: pauloliveria
author: poliveria
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

# AIAgentsInfo (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information relates to prereleased product that may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `AIAgentsInfo` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about various entities—files, IP addresses, URLs, users, or devices—associated with alerts from Microsoft Defender for Endpoint, Microsoft Defender for Office 365, Microsoft Defender for Cloud Apps, and Microsoft Defender for Identity. Use this reference to construct queries that return information from this table.

This advanced hunting table is populated by records from various Microsoft Defender services. If your organization doesn't deploy the service in Microsoft Defender XDR, queries that use the table don't work or return any results. For more information about how to deploy services in Microsoft Defender XDR, see [Deploy supported services](deploy-supported-services.md).

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
| `UserAuthenticationType` | `string` |The agent’s configured authentication type for users interacting with the agent; possible values: None, Microsoft, Custom|
| `AgentUsers` | `string` |List of user principal names (UPNs) or group IDs that can use the agent |
| `KnowledgeDetails` | `string` |Details about the knowledge sources added to the agent |
| `AgentActionTriggers` | `string` |List of triggers that makes an autonomous agent take action |
| `RawAgentInfo` | `string` |Contents of the raw JSON that describes the agent and contains configuration details, as received from the provider |
| `AuthenticationTrigger` | `string` |Indicates when authentication is triggered for the agent; possible values: As Needed, Always|
| `AccessControlPolicy` | `string` |Users that can interact with the agent; possible values: Any, Copilot readers, Group membership, Any (multitenant) |
| `AuthorizedSecurityGroupIds` |`dynamic` |List of Azure Active Directory Group IDs that are allowed to interact with the agent |
| `AgentTopicsDetails` | `dynamic` |Specifications of the topics that the agent can perform |
| `AgentToolsDetails` | `dynamic` |Specifications of the tools that the agent can access and perform actions on |
| `EnvironmentId` | `string` |The identifier of the Microsoft Power Platform environment the agent resides in |
| `Platform` | `string` |The platform that provided the information about the agents; possible values: Copilot Studio |
| `IsGenerativeOrchestrationEnabled` | `boolean` |ndicates whether the agent uses generative orchestration (that is, dynamically chooses tools, knowledge, and actions based on context) to operate|
| `AgentAppId` | `string` |The unique app identifier registered for the agent in Microsoft Entra |
| `ConnectedAgentsSchemaNames` | `dynamic` |Lists the schema names of connected agents, which are independently managed agents that are linked to the main one for orchestration |
| `ChildAgentsSchemaNames` | `dynamic` |Lists the schema names of the child agents that exist within the main agent |

## Sample queries


### Agent with no authentication

It's critical to identify agents that lack authentication mechanisms, as these agents might pose significant risks to the organization due to their public availability. Organizations should know about these agents so they can address any issues.

**Recommendations:**
- Confirm the agent's use case with the owner to determine if it's intended for public access.
- Review the topics, actions, and knowledge sources to ensure there's no internal or sensitive information included.
 
```kusto
 AIAgentsInfo
| summarize arg_max(Timestamp, *) by AIAgentId
| where AgentStatus != "Deleted" 
| where UserAuthenticationType == "None"
| project-reorder AgentCreationTime ,AIAgentId, AIAgentName, AgentStatus, CreatorAccountUpn, OwnerAccountUpns
```

### Suspicious HTTP request to nonstandard port 

Identify agents that use HTTP actions on ports other than 443 or 80.

**Recommendations:**
- Confirm with the agent owner whether it's necessary and inquire about the specific business use case.

```kusto
AIAgentsInfo
// Find agents with topic that contains Http request action to non 443 port
| summarize arg_max(Timestamp, *) by AIAgentId
| where AgentStatus != "Deleted"
| mvexpand Topic = AgentTopicsDetails
| where Topic has "HttpRequestAction"
| extend TopicActions = Topic.beginDialog.actions
| mvexpand action = TopicActions
| where action['$kind'] == "HttpRequestAction"
| extend Url = tostring(action.url.literalValue)
| extend ParsedUrl = parse_url(Url)
| extend Port = tostring(ParsedUrl["Port"])
| where isnotempty(Port) and Port != 443
| project-reorder AgentCreationTime ,AIAgentId, AIAgentName, ParsedUrl ,Url, Port, AgentStatus, CreatorAccountUpn, OwnerAccountUpns, Topic
```

### Suspicious HTTP request to connector endpoint 

Identify agents that use HTTP actions to an endpoint with an available Power Platform connector.

**Recommendations:**
- Verify with the agent owner if it's necessary and ask about the business use case. Consider using a connector instead.
 
```kusto
AIAgentsInfo
// Find agents with topic that contains Http request to endpoint with built-in connector
| summarize arg_max(Timestamp, *) by AIAgentId
| where AgentStatus != "Deleted"
| mvexpand Topic = AgentTopicsDetails
| where Topic has "HttpRequestAction"
| extend TopicActions = Topic.beginDialog.actions
| mvexpand action = TopicActions
| where action['$kind'] == "HttpRequestAction"
| extend Url = tostring(action.url.literalValue)
| extend ParsedUrl = parse_url(Url)
| extend Host = tostring(ParsedUrl["Host"])
| where Host has_any("graph.microsoft.com", "management.azure.com")
| project-reorder AgentCreationTime ,AIAgentId, AIAgentName, ParsedUrl ,Url, Host, AgentStatus, CreatorAccountUpn, OwnerAccountUpns, Topic
```

### Sending email to AI controlled input values 
  
Identify agents that use generative orchestration that involves sending email tools through Outlook, and the input values of the actions are populated by the generative orchestrator. This setup is risky, since with a successful XPIA attack, the agent can be used to leak data to arbitrary recipients.  
 
**Recommendations:** 
- Confirm with the agent owner whether it's required and inquire about the business use case. If feasible, hard code the recipient of the email into the action.
 
```kusto 
AIAgentsInfo
//Find agents with email sending tool via microsoft 365 connector, where the input //parameters of the inputs are populated by generative orchestrator
| summarize arg_max(Timestamp, *) by AIAgentId
| where AgentStatus != "Deleted"
| extend IsGenAIOrchestrator = tostring(todynamic(RawAgentInfo).Bot.Attributes.configuration) has '"GenerativeActionsEnabled": true'
| where IsGenAIOrchestrator
| mvexpand Action = AgentToolsDetails
| extend  OperationId = tostring(Action.action.operationId), ActionName = tostring(Action.modelDisplayName), Action
| where OperationId == "SendEmailV2" 
| where isempty(Action.inputs) //All inputs are populated by Orchestrator
| project-reorder AgentCreationTime ,AIAgentId, AIAgentName, AgentStatus, CreatorAccountUpn, OwnerAccountUpns, ActionName
```

### Hard-coded credentials in Topics or Actions
 
Agents with hard-coded credentials in Topics or Actions can expose clear-text credentials to unintended entities.

**Recommendations:**
- Consider keeping the credentials in Azure Key Vault and retrieve in runtime using Environment Variables (Use environment variables for Azure Key Vault secrets - Power Apps | Microsoft Learn) 
- If not possible, make sure secured input option are enabled (Manage sensitive input like passwords in Power Automate - Power Automate | Microsoft Learn).

```kusto  
//Find Agents with hard-coded credentials in Topics or Actions can expose clear-text credentials to unintended entities. 
let suspicious_patterns = @"(AKIA[0-9A-Z]{16})|(AIza[0-9A-Za-z_\-]{35})|(xox[baprs]-[0-9a-zA-Z]{10,48})|(ghp_[A-Za-z0-9]{36,59})|(sk_(live|test)_[A-Za-z0-9]{24})|(SG\.[A-Za-z0-9]{22}\.[A-Za-z0-9]{43})|(\d{8}:[\w\-]{35})|(eyJ[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+)|(Authorization\s*:\s*Basic\s+[A-Za-z0-9=:+]+)|([A-Za-z]+:\/\/[^\/\s]+:[^\/\s]+@[^\/\s]+)";
AIAgentsInfo
| summarize arg_max(Timestamp, *) by AIAgentId 
| where AgentStatus != "Deleted" 
| mv-expand tool = AgentToolsDetails
| mv-expand topic = AgentTopicsDetails
| where isnotempty(tool) and isnotempty(topic)
| where tool matches regex suspicious_patterns or topic matches regex suspicious_patterns
| extend SuspiciousMatchTool = tool, SuspiciousMatchTopic = topic
| project-reorder AgentCreationTime ,AIAgentId, AIAgentName, AgentStatus, CreatorAccountUpn, OwnerAccountUpns, SuspiciousMatchTool, SuspiciousMatchTopic
```

### Agents with a configured MCP tool 
Find agents with a configured MCP tool.

**Recommendations:** 
- Confirm with the agent owner if the MCP tool is still needed. Otherwise, consider removing it to mitigate any potential risks.

```kusto  
//Find agents with MCP tool configured
AIAgentsInfo
| summarize arg_max(Timestamp, *) by AIAgentId
| where AgentStatus != "Deleted"
| mvexpand Action = AgentToolsDetails
| where  Action.action.operationDetails["$kind"] == "ModelContextProtocolMetadata"
| extend MCPName = Action.action.operationDetails["operationId"]
| summarize MCPTools = make_set(MCPName) by AIAgentName, AIAgentId, EnvironmentId, CreatorAccountUpn
```

## Related topics
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
