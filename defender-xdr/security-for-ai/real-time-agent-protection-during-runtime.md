---
title: Detect, block, and investigate threats to AI agents using Microsoft Defender
description: Learn how to detect, block, and investigate threats to AI agents in real-time using Microsoft Defender.
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.service: microsoft-defender
ms.update-cycle: 180-days
ms.date: 03/03/2026
audience: Admin
ms.topic: concept-article
#customer-intent: As a security administrator, I want to learn how to detect, block, and investigate threats to AI agents in real-time using Microsoft Defender.
---

# Detect, block, and investigate threats to AI agents using Microsoft Defender

AI agents can be targeted by a range of threats, including prompt‑based attacks, unsafe tool usage, and attempts to exfiltrate data or manipulate agent behavior. Microsoft Defender helps security teams detect suspicious and malicious AI agent activity, block unsafe actions at runtime where supported, and investigate incidents using familiar security operations workflows.

This article explains how Microsoft Defender detects threats across all Agent 365‑managed agents, provides real‑time protection to block malicious actions for supported agents, and enables investigation and hunting using incident correlation and Advanced Hunting.

## Detect threats for all Agent 365-managed agents

Microsoft Defender continuously monitors AI agent activity and detects suspicious and malicious behavior across all Agent 365‑managed agents. Defender analyzes agent telemetry, tool usage, and execution patterns to identify threats such as *persistent jailbreak attempts*, *suspicious user activity involving a jailbreak attempt*, and *suspicious agent execution attempts*.

Microsoft Defender surfaces detections as near‑real‑time alerts in the Defender portal and enables security teams to investigate them using familiar security operations workflows, including alert triage, incident correlation, and Advanced Hunting.

For more information, see [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview).

## Enable an extended set of detections for supported agents

Beyond the core detections automatically available for all Agent 365‑managed agents, you can enable an extended set of detections for agents built with Microsoft Copilot Studio and Microsoft Foundry. 

To enable these extended detections:

- For Microsoft Copilot Studio agents, see [Copilot Studio integration in Microsoft Defender for Cloud Apps](/defender-cloud-apps/ai-agent-inventory). 
- For Microsoft Foundry agents, see [Enable threat protection for Microsoft Foundry AI workloads](/defender-for-cloud/ai-onboarding).


## Block suspicious AI agent actions with real-time protection for supported agents 

Real-time protection during agent runtime in Microsoft Defender reduces these risks by inspecting tool invocations before the agent runs any actions.

If Microsoft Defender determines that a prompt is suspicious:

- The tool invocation is blocked before it runs.
- The user gets notified that their message was blocked.
- An informative alert is created and appears in the Microsoft Defender portal under XDR Incidents and Alerts.

## Investigate AI agent threats 



