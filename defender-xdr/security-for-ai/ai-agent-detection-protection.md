---
title: Detect and investigate threats to AI agents using Microsoft Defender (Preview)
description: Learn how to detect, investigate, and hunt for threats to AI agents using Microsoft Defender.
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.service: microsoft-defender
ms.update-cycle: 180-days
ms.date: 08/07/2026
audience: Admin
ms.topic: concept-article
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
#customer-intent: As a security administrator, I want to learn how to detect, investigate, and hunt for threats to AI agents using Microsoft Defender.
---

# Detect and investigate threats to AI agents using Microsoft Defender (Preview)

> [!IMPORTANT]
> This feature is currently in public preview. The Microsoft Defender preview terms apply to features that are in public preview.

Deployed AI agents operate autonomously, invoking tools, accessing data, and taking actions on connected systems in response to natural‑language input. This makes continuous detection and investigation critical. Microsoft Defender detects suspicious and malicious agent behavior, provides alerts in near‑real‑time, and enables security teams to investigate incidents and trace the full root cause and blast radius.

Microsoft Defender detects and enables security teams to investigate threats to AI agents managed through [Microsoft Agent 365](/microsoft-agent-365/overview), including the extended detection capabilities available for supported agent platforms. To block unsafe agent actions during runtime, see [Protect AI agents in real time using Microsoft Defender](ai-agent-real-time-protection.md).

## Prerequisites

- Enable security for AI agents, including the Microsoft 365 app connector to collect Agent 365 observability data for AI agent actions. See [Enable security for AI agents using Microsoft Defender](get-started-defender-security-for-ai.md).
- Ensure that your AI agent emits observability data to Microsoft 365:
  - Agents built with Microsoft Copilot Studio, Microsoft Foundry, and declarative agents built with the Microsoft 365 Copilot Agent Builder send observability data to Microsoft 365 by default.
  - For AI agents built on other platforms, enable observability using the Microsoft Agent 365 SDK, as described in the [Agent 365 development lifecycle documentation](/microsoft-agent-365/developer/a365-dev-lifecycle#1-build-and-run-agent).
    > [!NOTE]
    > Threat detection is supported only for published Microsoft Foundry agents. Unpublished agents, including agents used only in a playground environment, aren’t supported.
    > For more information, see [Publish agents to Microsoft 365 Copilot and Microsoft Teams in the Foundry portal](/azure/foundry/agents/how-to/publish-copilot?tabs=portal)
    
- To detect threats to local AI agents that run on endpoints, set up [AI agent runtime protection in Microsoft Defender for Endpoint](/defender-endpoint/configure-ai-agent-runtime-protection). Microsoft Defender for Endpoint must run in active mode. Local agents are onboarded separately from cloud agents.
- *(Optional)* To include the prompt snippets that triggered a detection as evidence in alerts, enable [prompt evidence collection](ai-agent-real-time-protection.md#control-prompt-evidence-in-alerts). This setting is enabled by default.

## Detect AI agent threats in near-real-time

Microsoft Defender continuously monitors AI agent activity and detects suspicious and malicious behavior for all Agent 365-managed agents. Defender analyzes agent telemetry, tool usage, and execution patterns to identify threats such as _jailbreak attempts_, _indirect prompt injection (XPIA) attempts_, _malicious content propagation_, _secret and credential leakage_, _evasion techniques_, _large language model (LLM) reconnaissance_, and _suspicious user or IP access_.

Microsoft Defender surfaces detections as near‑real‑time alerts in the Defender portal and enables security teams to investigate them using familiar security operations workflows, including alert triage, incident correlation, and Advanced Hunting.

For more information, see [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview).

Near-real-time detections rely on Agent 365 observability data, which also provides valuable context for [investigating incidents and threat hunting](#investigate-ai-agent-threats-and-hunt-for-risks-using-advanced-hunting). Microsoft Defender analyzes this data to identify suspicious agent behavior and generate alerts.

To enrich alert investigation with the prompt snippets that triggered a detection, enable prompt evidence collection. For more information, see [Control prompt evidence in alerts](ai-agent-real-time-protection.md#control-prompt-evidence-in-alerts).

## Investigate AI agent threats and hunt for risks using Advanced Hunting

Microsoft Defender correlates AI agent alerts into incidents and surfaces the related context so security teams can quickly assess impact and prioritize response. Advanced Hunting then lets analysts query Agent 365 observability data by using Kusto Query Language (KQL) to investigate incidents and hunt for risks throughout their environment.

### Investigate incidents and alerts

Microsoft Defender correlates AI agent alerts from near‑real‑time detections into incidents. Real‑time protection audit and block events are recorded as behaviors in the `BehaviorInfo` table, which you can correlate with alerts during investigation.

Security analysts can use the incident graph and investigation experience to understand the full context of a potential attack, including relationships between involved entities and the blast radius of AI agent threats. For more information, see [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview).

> [!NOTE]
> Block events from Microsoft Prompt Shields for Foundry and Microsoft 365 Copilot Agent Builder are also recorded as behaviors. This isn't yet supported for agents built with Microsoft Copilot Studio.

### Correlate alerts and Agent 365 observability data and hunt for risks using Advanced Hunting

Advanced Hunting in Microsoft Defender enables security teams to query Agent 365 observability data alongside other security data by using Kusto Query Language (KQL). This supports proactive threat hunting, incident investigation, and root‑cause analysis for agents, applications, identities, and devices.

For example, use Advanced Hunting to:

- Trace specific agent tool invocations and correlate them with related alerts or block events  

- Investigate the root cause and scope of a detected AI agent threat  

- Identify anomalous execution patterns or risky agent behavior throughout environments  

- Build custom detection rules based on agent activity signals  

### Advanced Hunting tables for AI agent investigation

The following Advanced Hunting tables provide visibility into [AI agent configuration](ai-agent-inventory.md#discover-and-assess-ai-agents-using-advanced-hunting), alerts, and activity. You can query these tables individually or correlate them to investigate incidents and hunt for agent-related risks. 

| Table name | Description | Common use cases |
|-----------|-------------|------------------|
| [AlertInfo](/defender-xdr/advanced-hunting-alertinfo-table) | Contains alert metadata generated by Microsoft Defender, including alerts related to near-real-time detections. | Investigate AI agent alerts, understand alert context, and pivot into related incidents and entities. |
| [CloudAppEvents](/defender-xdr/advanced-hunting-cloudappevents-table) | Contains Agent 365 observability data for AI agent activity, including agent actions, tool invocations, and data access events. | Hunt for suspicious agent behavior, trace agent actions, and perform root-cause analysis using Agent 365 observability data. |
| [AgentsInfo](/defender-xdr/advanced-hunting-agentsinfo-table) | Contains inventory and configuration details for AI agents, including agent identity, platform, ownership, and metadata. | Review agent posture, identify risky or misconfigured agents, and correlate agent identity with alerts and activity. |
| [AlertEvidence](/defender-xdr/advanced-hunting-alertevidence-table) | Contains entities and artifacts associated with alerts, such as agents, users, tools, URLs, or resources. | Understand the scope of an alert and identify related entities involved in an AI agent incident. |
| [BehaviorInfo](/defender-xdr/advanced-hunting-behaviorinfo-table) | Contains behaviors that record real-time protection rule activity, including audit and block events, as queryable telemetry. | Build custom detections, hunting queries, and downstream automation based on real-time protection events. |
| [BehaviorEntities](/defender-xdr/advanced-hunting-behaviorentities-table) | Contains the entities and artifacts associated with behaviors, such as agents, users, tools, and resources. | Correlate behaviors with related entities to investigate the scope of real-time protection events. |

## Next steps

- [Protect AI agents in real time using Microsoft Defender](ai-agent-real-time-protection.md)

- [Discover AI agents and assess security posture using Microsoft Defender](ai-agent-inventory.md)

- [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](defender-security-for-ai.md)
