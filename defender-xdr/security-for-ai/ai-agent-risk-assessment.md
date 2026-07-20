---
title: AI agent posture risk in Microsoft Defender (Preview)
description: Learn how Microsoft Defender assesses AI agent posture risk using risk indicators, risk levels, and security recommendations.
ms.service: microsoft-defender
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.topic: concept-article
ms.date: 07/14/2026
audience: Admin
ai-usage: ai-assisted
#customer-intent: As a security administrator, I want to learn how Microsoft Defender assesses AI agent posture risk so that I can prioritize and remediate security issues.
---

# AI agent posture risk in Microsoft Defender (preview)

Microsoft Defender assesses posture risk for AI agents in your organization, including enterprise agents registered with [Microsoft Agent 365](/microsoft-agent-365/overview) and local agents discovered on endpoint devices. Each agent is evaluated against a set of risk indicators and assigned an overall risk level. Defender also shows security recommendations when it identifies actionable posture issues.

Risk indicators can be based on:

- The agent's configuration, tools, access, and settings.
- Runtime activity of the agent.
- Endpoint and user context for local agents.
- Active security alerts associated with the agent.

For steps to review risk information and recommendations in the Microsoft Defender portal, see [Discover AI agents and assess security posture using Microsoft Defender](ai-agent-inventory.md).

## How AI agent posture risk is assessed

A risk indicator represents a security condition associated with an agent. For example, an indicator might show that an agent is published, can run without human approval, has privileged access, or has active security alerts.

### Risk indicator states

Each risk indicator has one of the following states:

| State | Description |
|---|---|
| Active | Defender assessed the condition and determined that the risk is present. |
| Not active | Defender assessed the condition and determined that the risk isn't present. |
| Not assessed | Defender couldn't assess the condition because the required information wasn't available. |

Only active indicators contribute to the agent's risk level.

### Likelihood, impact, and severity

Each risk indicator affects one or both of the following risk dimensions:

- **Likelihood**: How easily the agent could be misused or compromised.
- **Impact**: The potential damage if the agent is misused or compromised.

Each indicator also has a severity of Low, Medium, High, or Critical. Most indicators have a fixed severity.

The severity of the following indicators is calculated separately for each agent:

- **Critical Resource**, based on the agent's criticality.
- **Active Threat**, based on the number and severity of qualifying active alerts.

### How the risk level is determined

Microsoft Defender combines all active risk indicators to determine the agent's overall risk level.

The result depends on:

- The severity of each active indicator.
- Whether each indicator affects likelihood, impact, or both.
- The combination of active indicators associated with the agent.

Indicators that are inactive or not assessed don't affect the risk level.

The resulting risk level can be:

| Risk level | Description |
|---|---|
| High | The agent has a serious combination of active risk indicators and should be prioritized for review. |
| Medium | The agent has notable risk that should be reviewed and mitigated. |
| Low | The agent has a minor active risk. |
| No known risk | Defender assessed the agent and found no active risk indicators. |
| Not evaluated | Defender didn't have enough information to assess the agent. |

## Enterprise-agent risk indicators

Enterprise-agent risk indicators are derived from the agent's configuration, runtime activity, and active alerts.

> [!NOTE]
> Not all risk indicators apply to all agent platforms. Microsoft Defender assesses an indicator only when the required platform support and data are available.

The following risk indicators can apply to enterprise agents:

| Risk indicator | Affects | Severity | Active when |
|---|---|---|---|
| Published Agent | Likelihood and impact | Low | The agent is published and has at least one channel. |
| Weak Instructions | Likelihood | Medium | The agent has instructions that contain fewer than 30 characters. |
| High Autonomy | Likelihood | Low | The agent has triggers and either has a tool or an MCP server that can run without human approval. |
| Indirect Prompt Injection Exposure | Likelihood | High | The agent has tools, connectors, or capabilities that allow untrusted input to reach an action that reads data, performs an external action, or sends data outside the agent. |
| Privileged Data Access | Impact | Medium | The agent has a tool, MCP server, or capability that can write, delete, or modify data. |
| Data Exfiltration Exposure | Likelihood | Medium | The agent has an action that can read or retrieve data and another action that can send data outside the agent, creating a potential data-exfiltration path. |
| Privileged Business System Access | Impact | Medium | The agent can write to a recognized business system, such as a customer relationship management, enterprise resource planning, human resources, or financial system. |
| Privileged Software Development Access | Impact | Medium | The agent can write to a recognized software development system, such as source control, continuous integration and delivery systems, or cloud infrastructure. |
| No Authentication | Likelihood | High | Users can access the agent without signing in. |
| Production Environment | Impact | Medium | The agent is deployed in an environment identified as a production environment. |
| Coordinator Agent | Impact | Medium | The agent has at least one connected agent and can orchestrate actions across other agents. |
| Cross-tenant Access | Likelihood and impact | High | The agent supports multitenant authentication and can be accessed by users from other tenants. |
| Critical Resource | Impact | Based on the agent's criticality, from Low through Critical | The agent is classified as a critical resource. |
| Active Threat | Likelihood | Based on the number and severity of qualifying active alerts, from Low through Critical | The agent has qualifying active alerts. |

### Active Threat indicator

The **Active Threat** indicator reflects qualifying active security alerts associated with an enterprise agent.

An alert contributes to the indicator when:

- Its status is **New** or **In Progress**.
- Its severity is Low, Medium, or High.
- Its severity isn't Informational.

Microsoft Defender determines the severity of the **Active Threat** indicator based on the number and severity of qualifying active alerts. The indicator severity can be Low, Medium, High, or Critical.

As the number or severity of qualifying alerts increases, the severity of the indicator can increase. When the agent has no qualifying active alerts, the indicator isn't active.

## Local-agent risk indicators

Local-agent risk indicators are based on endpoint context, user context, and the local agent's access to sensitive systems. Local agents are assessed using local-agent-specific signals, so their available indicators and supporting evidence can differ from enterprise agents.

The following risk indicators can apply to local agents:

| Risk indicator | Description |
|---|---|
| Critical Resource | The agent is classified as a critical resource. If the agent is compromised, attackers might gain access to a high-value organizational asset. |
| Used by a critical user | The agent is used by a user with a criticality classification. If the agent is compromised, attackers might be able to act on behalf of a highly privileged account. |
| Used by a user with risk detection | The agent is used by a user with a leaked credential risk detection. If the user account is compromised, attackers might be able to access or misuse the agent and its connected resources. |
| Running on a critical device | The agent is running on a device with a criticality classification. Because agents often have broad access to host resources, compromising the agent could provide attackers with access to a high-value organizational asset. |
| Running on a device with vulnerabilities | The agent is running on a device with high-severity vulnerabilities. If the device is compromised, attackers might be able to gain control of the agent. |
| Privileged Business System Access | The agent has write access to business systems such as CRM, ERP, finance, and HR platforms, increasing the potential business impact of a compromise. |
| Privileged Software Development Access | The agent has write access to software development resources, such as source code repositories, CI/CD pipelines, or development platforms. |

## Security recommendations

Security recommendations identify actionable changes that can reduce an agent's exposure or address an unsafe configuration.

Recommendations are shown when Microsoft Defender identifies an actionable posture issue for an affected agent. Some recommendations apply only when the agent can take actions, such as when the agent has at least one tool, knowledge source, capability, or MCP server.

Recommendations are calculated separately from the agent's risk level. A high-risk agent might have no recommendations when none of its active indicators match an available recommendation. A lower-risk agent might still receive a recommendation when Defender identifies an actionable configuration issue.

> [!IMPORTANT]
> Review an agent's risk level and recommendations together. The risk level represents the agent's overall exposure, while recommendations identify available actions to improve its security posture.

## Related content

- [Discover AI agents and assess security posture using Microsoft Defender](ai-agent-inventory.md)
- [Enable security for AI agents using Microsoft Defender](get-started-defender-security-for-ai.md)
- [Protect AI agents in real time using Microsoft Defender](ai-agent-real-time-protection.md)
- [Detect and investigate threats to AI agents using Microsoft Defender](ai-agent-detection-protection.md)
- [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](defender-security-for-ai.md)