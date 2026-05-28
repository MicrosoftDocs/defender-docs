---
title: AIAgentsInfo table in the advanced hunting schema
description: Learn about information associated with alerts in the AIAgentsInfo table of the advanced hunting schema
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
appliesto:
    - Microsoft Defender XDR
    - Microsoft Defender for Cloud Apps
ms.topic: reference
ms.date: 04/15/2026
---

# AIAgentsInfo (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information relates to prereleased product that may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `AIAgentsInfo` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about AI agents and their associated entities. Use this reference to construct queries that return information from this table.

Microsoft Defender populates this table through connectors in Microsoft Defender for Cloud Apps Power Plaform and Microsoft Agent 365. If your organization doesn't deploy these services, queries that use the table don't work or return any results. For more information, see:
- [Deploy services supported by Microsoft Defender XDR](deploy-supported-services.md)
- [Overview of Microsoft Agent 365](/microsoft-agent-365/overview)

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Last date and time recorded for the agent info |
| `RegistrySource` | `string` |Registry that provided the agent's metadata |
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
| `IsGenerativeOrchestrationEnabled` | `boolean` |Indicates whether the agent uses generative orchestration (that is, dynamically chooses tools, knowledge, and actions based on context) to operate|
| `AgentAppId` | `string` |The unique app identifier registered for the agent in Microsoft Entra |
| `ConnectedAgentsSchemaNames` | `dynamic` |Lists the schema names of connected agents, which are independently managed agents that are linked to the main one for orchestration |
| `ChildAgentsSchemaNames` | `dynamic` |Lists the schema names of the child agents that exist within the main agent |
| `Version` | `string` | Version of the agent|
| `IsBlocked` | `boolean` |Indicates whether the agent has been blocked by an administrator |
| `Instructions` | `string` |The agent's system prompt that defines its default behavior, persona, and operating boundaries |
| `EntraObjectId` | `string` |The agent's unique enterprise application object identifier by Microsoft Entra ID  |
| `EntraBlueprintId` | `string` | The agent's identity blueprint principal identifier by Microsoft Entra Agent ID |
| `AIModel` | `string` |The AI model powering the agent |
| `AccessCapabilities` | `dynamic` |Data access capabilities granted to the agent |
| `ElementTypes` | `dynamic` |Technical component types that make up the agent |
| `SourceAgentId` | `string` | The platform-native identifier of the agent, such as the Azure Resource Manager (ARM) identifier for Microsoft Foundry agents or the environment-scoped agent identifier for Copilot Studio agents|


## Sample queries

The following sample queries return results depending on the specified registry source or connector:
- To return results in Agent 365, add `RegistrySource == "A365"` in your query.
- To return results for Defender for Cloud Apps Power Platform, use `RegistrySource == "PowerPlatform"`.

### Queries that use Agent 365 as registry source

#### List all agents in Agent 365
This query identifies all agents that are published in Agent 365.

```kusto
let IdentityIdtoUPN = materialize (
  IdentityInfo
  | distinct AccountObjectId, AccountUpn
  | extend AccountObjectId = tostring(AccountObjectId)
  | where isnotempty(AccountObjectId) and isnotempty(AccountUpn));
AIAgentsInfo
  | where RegistrySource == "A365"
  | summarize arg_max(Timestamp, *) by AIAgentId
  | extend AIAgentId = tostring(AIAgentId)
  | extend RawAgentInfoJson = parse_json(RawAgentInfo)
  | extend DeveloperName = RawAgentInfoJson.developerName
  | extend OwnerId = tostring(RawAgentInfoJson.owners[0].entityId)
    | extend CreatorId = tostring(RawAgentInfoJson.creatorId)
    | join kind=leftouter IdentityIdtoUPN on $left.OwnerId == $right.AccountObjectId
    | project-rename OwnerUpn = AccountUpn
    | join kind=leftouter IdentityIdtoUPN on $left.CreatorId == $right.AccountObjectId
    | project-rename CreatorUpn = AccountUpn
    | project-away OwnerId, CreatorId, AccountObjectId, AccountObjectId1
  | project-reorder AgentCreationTime, AIAgentId, AIAgentName,  OwnerUpn, CreatorUpn, DeveloperName
```
#### Published agents without instructions

This query identifies Agent 365 AI agents that are published but lack configured instructions. Missing instructions increase the risk of prompt injection attacks, where malicious input can influence the agent to deviate from its intended behavior. Without clear guidance, the agent may respond unpredictably or expose sensitive data.

**Recommendations:** 
- Ensure all generative orchestration components have well-defined instructions that specify the agent's purpose, boundaries, and allowed actions. Regularly review and update instructions to maintain security and prevent misuse.

```kusto
let IdentityIdtoUPN = materialize (
IdentityInfo
| distinct AccountObjectId, AccountUpn
| extend AccountObjectId = tostring(AccountObjectId)
| where isnotempty(AccountObjectId) and isnotempty(AccountUpn));
AIAgentsInfo 
| summarize arg_max(Timestamp, *) by AIAgentId 
| where RegistrySource == "A365"
| where IsBlocked == 0 // not blocked
| where isnotnull(Instructions)
| where isempty(Instructions) or Instructions == "N/A"
| extend RawAgentInfoJson = parse_json(RawAgentInfo)
| extend DeveloperName = RawAgentInfoJson.developerName
| extend PublishedStatus = RawAgentInfoJson.publishedStatus
| where PublishedStatus == "Published" //published
| extend OwnerId = tostring(RawAgentInfoJson.owners[0].entityId)
| extend CreatorId = tostring(RawAgentInfoJson.creatorId)
| join kind=leftouter IdentityIdtoUPN on $left.OwnerId == $right.AccountObjectId
| project-rename OwnerUpn = AccountUpn
| join kind=leftouter IdentityIdtoUPN on $left.CreatorId == $right.AccountObjectId
| project-rename CreatorUpn = AccountUpn
| project-away RawAgentInfoJson, OwnerId, CreatorId, AccountObjectId, AccountObjectId1
| project-reorder AgentCreationTime, AIAgentId, AIAgentName, Instructions, OwnerUpn, CreatorUpn ,DeveloperName
```

#### MCP tools configured

This query identifies Agent 365 AI agents that have Model Context Protocol (MCP) tools configured. MCP tools extend agent capabilities but introduce additional security considerations because they can execute advanced operations and interact with external resources. If misconfigured or unnecessary, these tools might increase the attack surface and expose sensitive data or functionality.

**Recommendations:**
- Confirm with the agent owner whether the MCP tool is still required. If it is, review its configuration for compliance with security best practices and ensure least privilege access. Remove any unused or unnecessary MCP tools to reduce risk.

```kusto
let IdentityIdtoUPN = materialize (
  IdentityInfo
  | distinct AccountObjectId, AccountUpn
  | extend AccountObjectId = tostring(AccountObjectId)
  | where isnotempty(AccountObjectId) and isnotempty(AccountUpn));
  AIAgentsInfo
  | where RegistrySource == "A365"
  | summarize arg_max(Timestamp, *) by AIAgentId
  | extend RawAgentInfoJson = parse_json(RawAgentInfo)
  | extend DeveloperName = RawAgentInfoJson.developerName
  | extend OwnerId = tostring(RawAgentInfoJson.owners[0].entityId)
  | extend CreatorId = tostring(RawAgentInfoJson.creatorId)
  | join kind=leftouter IdentityIdtoUPN on $left.OwnerId == $right.AccountObjectId
  | project-rename OwnerUpn = AccountUpn
  | join kind=leftouter IdentityIdtoUPN on $left.CreatorId == $right.AccountObjectId
  | project-rename CreatorUpn = AccountUpn
  | where isnotempty(AgentActionTriggers)
  | extend AgentActionTriggersJson = parse_json(AgentActionTriggers)
  | where array_length(AgentActionTriggersJson) > 1
  | mv-expand Trigger = AgentActionTriggersJson
  | extend ActionType = Trigger.type
  | where ActionType == "RemoteMCPServer"
  | project-away Trigger, RawAgentInfoJson, AgentActionTriggersJson, OwnerId, CreatorId, AccountObjectId, AccountObjectId1
  | project-reorder AgentCreationTime, AIAgentId, AIAgentName, ActionType, OwnerUpn, CreatorUpn, DeveloperName
```

#### HTTP requests to non-HTTPS endpoints

This query identifies Agent 365 AI agents that send HTTP requests to endpoints using non-HTTPS schemes. Communication over unencrypted HTTP exposes sensitive data in transit and increases the risk of interception or tampering. Attackers could exploit this vulnerability to capture credentials, session tokens, or other confidential information, leading to data breaches or unauthorized access.

**Recommendations:**
- Review these agents and update all HTTP actions to use HTTPS endpoints. If non-secure communication is absolutely required for a specific business case, document the justification and apply compensating controls such as network-level encryption or IP restrictions.

```kusto
let IdentityIdtoUPN = materialize (
IdentityInfo
| distinct AccountObjectId, AccountUpn
| extend AccountObjectId = tostring(AccountObjectId)
| where isnotempty(AccountObjectId) and isnotempty(AccountUpn)); 
AIAgentsInfo
  | where RegistrySource == "A365"
  | summarize arg_max(Timestamp, *) by AIAgentId
  | extend RawAgentInfoJson = parse_json(RawAgentInfo)
  | extend DeveloperName = RawAgentInfoJson.developerName
  | extend OwnerId = tostring(RawAgentInfoJson.owners[0].entityId)
  | extend CreatorId = tostring(RawAgentInfoJson.creatorId)
  | join kind=leftouter IdentityIdtoUPN on $left.OwnerId == $right.AccountObjectId
  | project-rename OwnerUpn = AccountUpn
  | join kind=leftouter IdentityIdtoUPN on $left.CreatorId == $right.AccountObjectId
  | project-rename CreatorUpn = AccountUpn
  | where isnotempty(AgentActionTriggers)
  | extend AgentActionTriggersJson = parse_json(AgentActionTriggers)
  | where array_length(AgentActionTriggersJson) > 1
  | mv-expand Trigger = AgentActionTriggersJson
  | extend ServerUrls = Trigger.serverUrls
  | mv-expand Url = ServerUrls
  | extend ParsedUrl = parse_url(tostring(Url))
  | extend Scheme = tostring(ParsedUrl["Scheme"]) 
  | where isnotempty(Scheme) and Scheme != "https"
  | project-away RawAgentInfoJson, ParsedUrl, ServerUrls, OwnerId, CreatorId, AccountObjectId, AccountObjectId1
  | project-reorder AgentCreationTime, AIAgentId, AIAgentName, Url, Scheme, OwnerUpn, CreatorUpn, DeveloperName
```

### Queries that use Power Platform as registry source 

#### Agent with no authentication

It's important to identify agents that don't use authentication mechanisms. These agents might pose significant risks to the organization because they're publicly available. Organizations need to know about these agents so they can address any problems.

**Recommendations:**
- Confirm the agent's use case with the owner to determine if it's intended for public access.
- Review the topics, actions, and knowledge sources to ensure there's no internal or sensitive information included.
 
```kusto
AIAgentsInfo
| summarize arg_max(Timestamp, *) by AIAgentId
| where RegistrySource == "PowerPlatform"
| where AgentStatus != "Deleted" 
| where UserAuthenticationType == "None"
| project-reorder AgentCreationTime ,AIAgentId, AIAgentName, AgentStatus, CreatorAccountUpn, OwnerAccountUpns
```

#### Suspicious HTTP request to nonstandard port 

Identify agents that use HTTP actions on ports other than 443 or 80.

**Recommendations:**
- Confirm with the agent owner whether it's necessary and inquire about the specific business use case.

```kusto
AIAgentsInfo
// Find agents with topic that contains Http request action to non 443 port
| summarize arg_max(Timestamp, *) by AIAgentId
| where RegistrySource == "PowerPlatform"
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

#### Suspicious HTTP request to connector endpoint 

Identify agents that use HTTP actions to an endpoint with an available Power Platform connector.

**Recommendations:**
- Verify with the agent owner if it's necessary and ask about the business use case. Consider using a connector instead.
 
```kusto
AIAgentsInfo
// Find agents with topic that contains Http request to endpoint with built-in connector
| summarize arg_max(Timestamp, *) by AIAgentId
| where RegistrySource == "PowerPlatform"
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

#### Sending email to AI-controlled input values 
  
Identify agents that use generative orchestration that involves sending email tools through Outlook, and the input values of the actions populated by the generative orchestrator. This setup is risky, since with a successful XPIA attack, the agent can be used to leak data to arbitrary recipients.  
 
**Recommendations:** 
- Confirm with the agent owner whether it's required and inquire about the business use case. If feasible, hard code the recipient of the email into the action.
 
```kusto 
AIAgentsInfo
//Find agents with email sending tool via microsoft 365 connector, where the input //parameters of the inputs are populated by generative orchestrator
| summarize arg_max(Timestamp, *) by AIAgentId
| where RegistrySource == "PowerPlatform"
| where AgentStatus != "Deleted"
| extend IsGenAIOrchestrator = tostring(todynamic(RawAgentInfo).Bot.Attributes.configuration) has '"GenerativeActionsEnabled": true'
| where IsGenAIOrchestrator
| mvexpand Action = AgentToolsDetails
| extend  OperationId = tostring(Action.action.operationId), ActionName = tostring(Action.modelDisplayName), Action
| where OperationId == "SendEmailV2" 
| where isempty(Action.inputs) //All inputs are populated by Orchestrator
| project-reorder AgentCreationTime ,AIAgentId, AIAgentName, AgentStatus, CreatorAccountUpn, OwnerAccountUpns, ActionName
```

#### Hard-coded credentials in Topics or Actions
 
Agents with hard-coded credentials in Topics or Actions can expose clear-text credentials to unintended entities.

**Recommendations:**
- Consider keeping the credentials in Azure Key Vault and retrieving them at runtime by using environment variables (see [Use environment variables for Azure Key Vault secrets](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets)). 
- If you can't use Azure Key Vault, make sure you enable the secured input option (see [Manage sensitive input like passwords](/power-automate/how-tos-use-sensitive-input)).

```kusto  
//Find Agents with hard-coded credentials in Topics or Actions can expose clear-text credentials to unintended entities. 
let suspicious_patterns = @"(AKIA[0-9A-Z]{16})|(AIza[0-9A-Za-z_\-]{35})|(xox[baprs]-[0-9a-zA-Z]{10,48})|(ghp_[A-Za-z0-9]{36,59})|(sk_(live|test)_[A-Za-z0-9]{24})|(SG\.[A-Za-z0-9]{22}\.[A-Za-z0-9]{43})|(\d{8}:[\w\-]{35})|(eyJ[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+)|(Authorization\s*:\s*Basic\s+[A-Za-z0-9=:+]+)|([A-Za-z]+:\/\/[^\/\s]+:[^\/\s]+@[^\/\s]+)";
AIAgentsInfo
| summarize arg_max(Timestamp, *) by AIAgentId 
| where RegistrySource == "PowerPlatform"
| where AgentStatus != "Deleted" 
| mv-expand tool = AgentToolsDetails
| mv-expand topic = AgentTopicsDetails
| where isnotempty(tool) and isnotempty(topic)
| where tool matches regex suspicious_patterns or topic matches regex suspicious_patterns
| extend SuspiciousMatchTool = tool, SuspiciousMatchTopic = topic
| project-reorder AgentCreationTime ,AIAgentId, AIAgentName, AgentStatus, CreatorAccountUpn, OwnerAccountUpns, SuspiciousMatchTool, SuspiciousMatchTopic
```

#### Agents with a configured MCP tool 
Find agents with a configured MCP tool.

**Recommendations:** 
- Confirm with the agent owner if the MCP tool is still needed. Otherwise, consider removing it to mitigate any potential risks.

```kusto  
//Find agents with MCP tool configured
AIAgentsInfo
| summarize arg_max(Timestamp, *) by AIAgentId
| where RegistrySource == "PowerPlatform"
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
