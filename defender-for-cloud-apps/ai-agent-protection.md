---
title: Protect your Microsoft Copilot Studio AI agents (Preview)
description: Learn how to enable and manage AI Agent protection for Microsoft Copilot Studio AI agents using Microsoft Defender.
ms.date: 11/02/2025
ms.topic: how-to
ms.service: defender-for-cloud-apps
ms.reviewer: gayasalomon
#customer-intent: As a security administrator, I want my Copilot Studio AI agents to be protected against suspicious or harmful actions so that I can reduce security risks to my organization.
---

# Protect your Microsoft Copilot Studio AI agents (Preview)

As no code/low code platforms become increasingly accessible, organizations face new types of security risks. These platforms empower people to build and deploy custom agents without centralized security review or controls in place. Attackers can attempt to manipulate these agents by:
- injecting malicious prompts
- triggering unintended tool executions
- exploiting data sources to escalate privileges or exfiltrate data.

Microsoft Defender protection for AI agents helps you by identifying the AI agents in your environment, providing monitoring capabilities, threat protection, and real-time protection during agent runtime to block suspicious tool invocations before they can execute.

> [!NOTE]
> - Microsoft Defender protection for AI agents supports AI agents created with Microsoft Copilot Studio.
> - This feature is currently in public preview and included with your Microsoft Defender for Cloud Apps license at no extra cost. When the feature becomes generally available, licensing requirements might change.

## Prerequisites

Before enabling AI agent protection, make sure:

- You have a valid Microsoft E5 Security license and a Microsoft Defender for Cloud Apps license.
- You have Security Administrator privileges in the Microsoft Defender portal.
 

## Related articles

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
