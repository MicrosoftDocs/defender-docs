---
title: Protect AI agents in real time
description: Learn how to enable and manage real-time runtime protection for Microsoft Copilot Studio AI agents using Microsoft Defender.
ms.date: 07/27/2025
ms.topic: how-to
---

# Protect agents in real time (Preview)


This article describes how to enable real-time agent protection in Microsoft Defender for AI agents built using the Microsoft Copilot Studio custom engine.

> [!NOTE]
> Real-time agent protection currently supports only agents created with the Copilot Studio custom engine.

## Overview

As AI agents become increasingly accessible through low-code/no-code (LCNC) platforms like Microsoft Copilot Studio, organizations are facing new types of security risks at scale. These platforms empower non-technical users to build and deploy custom agents—often without centralized security review or controls in place.

These risks stem from how attackers exploit agents during run time. Threat actors might attempt to:

- Manipulate agents into behaving in unintended ways  
- Inject malicious instructions into upstream data sources  
- Trigger tools in ways that expose sensitive information or functionality  


## How real-time agent protection works

Real-time agent protection is a runtime security capability in Microsoft Defender. When a user sends a message to an AI agent built with Microsoft Copilot Studio, the message is intercepted before the agent takes any action. Microsoft Defender reviews the request in real time and determines whether it's legitimate, helping mitigate the risk of malicious or unauthorized behavior.

When Microsoft Defender detects suspicious behavior:

- The tool invocation is blocked before it executes  
- The agent halts processing and the user receives a message that their request was blocked. 
- An alert is generated in the Microsoft Defender portal and surfaced in the XDR Incidents and Alerts experience  

If no threats are detected, the agent continues running with no visible impact to the end user.

Microsoft Defender detection logic evaluates patterns such as:

- Misuse of sensitive tools  
- Anomalous or unexpected execution behavior  
- Cross-prompt injection attempts (XPIA)
- Unauthorized access to sensitive data or functionality

This helps ensure that agents operate within expected bounds and reduces the risk of malicious activity at run time.

## Prerequisites

Before enabling real-time agent protection, make sure:

- You have a valid Microsoft Defender license (included in Microsoft 365 E5 Security)

- You have Security Administrator privileges in the Microsoft Defender portal

- A Power Platform Administrator is available to complete agent configuration

- A Microsoft Entra ID application is registered for authentication

- The App ID is obtained from the Power Platform environment


## Turn on real time agent protection

To turn on real-time agent protection for Copilot Studio AI agents:

1. **Sign in to the [Microsoft Defender portal](https://security.microsoft.com)**:
1. Navigate to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Under **Microsoft 365 connector**, do the following:
    1.  Select **Microsoft Entra ID Management events**.
    1.  Select **Microsoft 365 activities**.
1. Verify that the Microsoft 365 App Connector status shows **Connected**.
1. **Turn on Real time protection during agent runtime**:
    1. Enter the App ID provided by your Power Platform administrator.
    1. Select **Save**.
    1. Copy the URL provided.
    1. Share the URL with the Power Platform administrator. 
1. In the Power Platform Admin Center, the administrator uses the URL to install the Defender plugin and activate it for selected environments.

## Next steps 

- [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app).