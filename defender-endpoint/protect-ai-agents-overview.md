---
title: Overview
description: Learn how Microsoft Defender for Endpoint helps protect AI agents on your devices through discovery and investigation capabilities.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.custom: msecd-doc-authoring-106
ms.date: 05/14/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As a security administrator, I want to understand how Defender for Endpoint provides visibility and protection for AI coding agents on my organization's devices.

---

# Overview

Microsoft Defender for Endpoint helps you discover and investigate AI coding agents running on your organization's devices. By automatically detecting supported agents and surfacing them in the Microsoft Defender portal, you gain visibility into AI-related assets and can assess their presence across your environment.

## AI agent discovery on endpoints

Defender for Endpoint automatically detects supported AI coding agents running locally on onboarded Windows 11 devices. When Microsoft Defender Antivirus identifies a supported AI coding agent, the agent is displayed as a discoverable asset in the Defender portal with full visibility into:

- **AI agent inventory** &mdash; A centralized view of all discovered local AI coding agents with device associations and discovery metadata.
- **Exposure map** &mdash; Visual relationships between AI agents, devices, identities, and cloud resources to help assess potential impact.
- **Advanced Hunting** &mdash; Query agent discovery data using Kusto Query Language (KQL) to investigate agent presence across your environment.

For specific steps on discovering and viewing local AI agents, see [Discover local AI agents](/defender-endpoint/discover-local-ai-agents.md).

## Broader AI security capabilities

Microsoft Defender for Endpoint's discovery capabilities are part of a comprehensive AI security approach. Microsoft Defender XDR provides additional capabilities across your organization's AI ecosystem:

- **Discover cloud and platform agents** &mdash; Find agents built with Microsoft Copilot Studio, Microsoft Foundry, AWS Bedrock, and GCP Vertex AI.
- **Assess security posture** &mdash; Evaluate agent configurations, identify risks, and get prioritized recommendations.
- **Detect and investigate threats** &mdash; Correlate alerts and investigate suspicious agent behavior across your security infrastructure.

For details on these capabilities and how to leverage them, see [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai).

## Related content

- [Discover local AI agents](/defender-endpoint/discover-local-ai-agents.md)
- [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory)
- [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai)
