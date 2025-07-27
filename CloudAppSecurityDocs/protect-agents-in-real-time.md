---
title: Protect AI agents in real time |
description: This article outlines the steps to protect AI agents in real time using Defender for Cloud Apps.
ms.service: cloud-app-security
ms.date: 07/27/2025
ms.topic: how-to
---

# Protect agents in real time

This article provides an overview of how to protect AI agents in real time using Microsoft Defender for Cloud Apps.

## Overview

As AI agents become increasingly accessible through low-code/no-code platforms like Microsoft Copilot Studio, organizations are facing new types of security risks at scale. These include attempts to manipulate agents into behaving in unintended ways or injecting malicious instructions into the data sources the agent relies on to generate its responses. 

To help address these challenges, Microsoft Defender secures AI agents built with the Microsoft Copilot Studio custom engine. This integration enables Microsoft Defender to monitor agent tool invocation calls in real time, detect security threats such as suspicious tool usage patterns or cross-prompt injection attacks, prevent the invocation of the tool, and block the attack before it's executed.

If a suspicious action is detected, the agent halts processing and you're notified that your message has been blocked. If the operation is approved, the agent continues running as expected without any interruption to the user experience.

Defender uses advanced detection mechanisms to identify behaviors like misuse of sensitive tools, anomalous execution patterns, or external prompt injection attempts (XPIA), helping ensure agents behave as intended and remain compliant with organizational policies. 

Each blocked action triggers an alert that is surfaced in the Microsoft Defender portal, fully integrated into the XDR Alerts and Incidents experience, providing security teams with actionable insights and traceability.


## Why Security for LCNC AI Agents Matters 

The democratization of AI agent creation means that thousands of agents can be deployed across an organization in a matter of weeks. Without proper guardrails, these agents can: 

- Access sensitive data unintentionally 

- Execute high-privilege actions without oversight

- Be vulnerable to prompt injection or jailbreak attacks

- Operate without visibility from security teams


## Prerequisites

- Defender for Cloud Apps license (which is also included in the E5 security package) 

- A user with Security Administrator privileges is required to enable the solution on the Security portal side

- A user with a Power Platform Administrator role is required for configuring this integration from the power platform side.

- You need to register a Microsoft Entra app, to use for authentication with the external monitoring provider. 
  For more information, see [Register an application in Microsoft Entra ID](/identity-platform/quickstart-register-app).

## Turn on real time protection during agent runtime


To enable real-time protection for AI agents, follow these steps:

1. **Go to [Microsoft Defender portal](https://security.microsoft.com)**: 
   - Navigate to System > Settings > Cloud Apps > Copilot Studio AI Agents.
2. **Setup your Microsoft 365 connector**
   - Select both "Microsoft Entra ID Management events" and "Microsoft 365 activities".
3. **Verify that the Microsoft 365 App Connector is connected**: 
   - Ensure that the Microsoft 365 App Connector is connected and operational. If not, follow the instructions to set it up.
4. **Turn on Real time protection during agent runtime**: 
   - Get the App ID from your Power Platform administrator, enter it in the box, and select "Save". For more information on how the Entra ID or Power Platform administrators are expected to register the Azure Entra Application, see <link>.
   - Copy the URL provided and share it with the Power Platform administrator.

## Next steps 

- [Register an application in Microsoft Entra ID](/identity-platform/quickstart-register-app)
- 