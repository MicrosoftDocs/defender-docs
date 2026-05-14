---
title: Discover local AI agents
description: Learn how to discover, view, and investigate AI coding agents running locally on Windows 11 devices using Microsoft Defender for Endpoint.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.date: 05/14/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As a security administrator, I want to discover and monitor AI coding agents running on my organization's Windows 11 devices so that I can manage AI-related security risks on endpoints.

---

# Discover local AI agents

Microsoft Defender for Endpoint automatically discovers supported AI coding agents running locally on onboarded Windows 11 devices. Discovered agents appear as assets in the Defender portal's AI agent inventory, where you can view agent details, explore device and identity relationships using the exposure map, and investigate agent presence using advanced hunting.

> [!NOTE]
> Local AI coding agent discovery provides **discovery and investigation capabilities only**. It doesn't include security posture assessment, governance controls, or alerts for endpoint agents at this time.

## Prerequisites

Before you can discover local AI coding agents on endpoints, make sure the following requirements are met:

- Devices run **Windows 11**. macOS support is planned for a future release.
- Devices are [onboarded to Microsoft Defender for Endpoint](/defender-endpoint/onboard-configure).
- **Microsoft Defender Antivirus** is the primary antivirus solution on the device.
- Your environment is in the **commercial cloud**. Sovereign and national clouds aren't supported.

No additional deployment, configuration, or scripts are required beyond device onboarding. Agent discovery begins automatically after your tenant is enabled.

## Supported AI coding agents

The following local AI coding agents are discovered on endpoints:

| Agent | Supported type |
|---|---|
| ChatGPT Desktop | Desktop |
| Claude Code | CLI, Desktop, and VS Code extension |
| Cline | VS Code extension |
| Codex | CLI |
| Cursor | Desktop |
| Gemini | VS Code extension |
| Gemini CLI | CLI |
| GitHub Copilot | CLI and VS Code extension |
| Ollama Desktop | Desktop |
| Poe Desktop | Desktop |
| Roo Code | VS Code extension |

## View local AI coding agents in the inventory

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
1. In the left navigation pane, select **Assets** > **AI Agents**.
1. Select **Local AI Agents (Preview)** to see a filtered list of AI coding agents discovered on endpoint devices.

For more information on using the AI agent inventory, see [Discover and manage security posture of supported AI agents using the AI agent inventory UI](/defender-xdr/security-for-ai/ai-agent-inventory#discover-and-manage-security-posture-of-supported-ai-agents-using-the-ai-agent-inventory-ui).

## View agent details

1. From the **Local AI Agents** list, select an agent to open the **Agent entity page**.
1. Review the agent details, including:

    - Associated device
    - Operating system and machine context
    - Discovery timestamp

## Explore broader AI agent security capabilities

Local AI coding agent discovery is one layer of a comprehensive AI security approach in Microsoft Defender. For information on broader AI agent security capabilities—including discovery of cloud and platform agents, security posture management, threat detection, and runtime protection—see [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory).


