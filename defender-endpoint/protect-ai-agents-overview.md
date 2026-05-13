---
title: AI agent protection overview for endpoints
description: Learn how Microsoft Defender for Endpoint helps discover and protect AI coding agents running on endpoint devices, and how it integrates with Microsoft Defender XDR AI security capabilities.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: concept-article
ms.custom: msecd-doc-authoring-106
ms.date: 05/13/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As a security administrator, I want to understand how Defender for Endpoint discovers and protects AI coding agents on my organization's devices so that I can manage AI-related security risks on endpoints.

---

# AI agent protection overview for endpoints

AI coding agents run locally on endpoint devices, where they can access code repositories, invoke tools, and interact with cloud services. Microsoft Defender for Endpoint extends endpoint protection to these agents by automatically discovering supported AI coding agents and surfacing them as security assets in the Microsoft Defender portal.

Endpoint-based AI agent discovery is part of a broader set of AI security capabilities in Microsoft Defender. While Defender for Endpoint focuses on discovering local agents on devices, Microsoft Defender XDR provides the full lifecycle of AI agent security, including posture management, threat detection, runtime protection, and investigation.

## How endpoint AI agent discovery works

Microsoft Defender for Endpoint detects supported AI coding agents running on onboarded devices. No extra configuration, scripts, or agent deployment is required. When Defender Antivirus identifies a supported AI coding agent on a device, the agent appears automatically in the Defender portal as a discoverable asset.

Discovered agents are visible in:

- **AI agent inventory** &mdash; A centralized view of all discovered local AI coding agents, accessible from **Assets** > **AI Agents** > **Local AI Agents (Preview)** in the Defender portal.
- **Exposure map** &mdash; Visual representation of relationships between AI agents, devices, identities, and cloud resources. Use this to assess potential blast radius.
- **Advanced Hunting** &mdash; Query the `ExposureGraphEdges` and `ExposureGraphNodes` tables using Kusto Query Language (KQL) to investigate agent presence across your environment.

> [!NOTE]
> Endpoint AI agent discovery provides discovery and investigation capabilities only. It doesn't include security posture assessment, governance controls, alerts, or runtime protection for endpoint agents at this time.

## Supported platforms and agents

Endpoint AI agent discovery supports the following platforms:

- **Windows 11** &mdash; Supported
- **macOS** &mdash; Planned for a future release

Devices must be onboarded to Microsoft Defender for Endpoint, and Microsoft Defender Antivirus must be the primary antivirus solution. Only commercial cloud environments are supported.

For the full list of supported AI coding agents, see [Supported AI coding agents](/defender-xdr/security-for-ai/ai-agent-inventory#supported-ai-coding-agents).

## Broader AI security capabilities in Microsoft Defender

Endpoint-based discovery is one layer of a comprehensive AI security approach in Microsoft Defender. The broader capabilities, managed through Microsoft Defender XDR, include:

- **AI agent inventory for cloud and platform agents** &mdash; Discover agents built with Microsoft Copilot Studio, Microsoft Foundry, AWS Bedrock, and GCP Vertex AI.
- **Security posture management** &mdash; Assess agent configurations, identify risks, and get prioritized security recommendations.
- **Threat detection and runtime protection** &mdash; Detect suspicious agent behavior and block unsafe actions in real time.
- **Investigation and hunting** &mdash; Correlate AI agent alerts into incidents and query agent activity using Advanced Hunting.

For details on these capabilities, see [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai).

## Related content

- [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory)
- [Detect, block, and investigate threats to AI agents using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-detection-protection)
- [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai)
