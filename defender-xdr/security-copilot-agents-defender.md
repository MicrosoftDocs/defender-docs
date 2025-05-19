---
title: Microsoft Security Copilot Agents in Microsoft Defender
description: Learn about Security Copilot agents in Microsoft Defender that can help you perform your security tasks easily.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- magic-ai-copilot 
ms.topic: concept-article
search.appverid:
- MOE150
- MET150
ms.date: 04/28/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
#customer intent: As a security analyst, I want to know about the Security Copilot agents available in Microsoft Defender so that I can use them to perform my security tasks efficiently.
---

# Microsoft Security Copilot Agents in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Security Copilot agents are available in Microsoft Defender to help you perform your security tasks efficiently. Security Copilot agents are AI-powered assistants that can help you with various tasks by working seamlessly with Microsoft security products.

## Agents in Microsoft Defender

### Phishing Triage Agent

The [Phishing Triage Agent](phishing-triage-agent.md) helps security operations analysts to triage and classify user-submitted phishing incidents. The agent operates autonomously, provides a transparent rationale for its classification verdicts in natural language, and continuously learns and improves its accuracy based on feedback provided by analysts.

#### Trigger

The agent is triggered when a user in your organization submits a phishing incident. The agent autonomously analyzes the submitted email to classify them as either phishing or not phishing based on its training and the context of the organization.

#### Products

Tenants must have the following products enabled to use the agent:

- An active subscription to Security Copilot and provisioned capacity in Security Compute Units (SCU) to power Security Copilot workload. See [Get started with Security Copilot](/copilot/security/get-started-security-copilot) for more information.
- Microsoft Defender for Office 365 Plan 2 deployed

#### Plugins

The following plugins must be enabled in Security Copilot:

- Microsoft Defender XDR
- Microsoft Threat Intelligence
- Phishing Triage Agent