---
title: Microsoft Security Copilot Agents in Microsoft Defender
description: Learn about Security Copilot agents in Microsoft Defender that can help you perform your security tasks easily.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: guywild
author: guywi-ms
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
ms.date: 11/18/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
#customer intent: As a security analyst, I want to know about the Security Copilot agents available in Microsoft Defender so that I can use them to perform my security tasks efficiently.
---

# Microsoft Security Copilot Agents in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Security Copilot agents are available in Microsoft Defender to help you perform your security tasks efficiently. Security Copilot agents are AI-powered assistants that can help you with various tasks by working seamlessly with Microsoft security products.

## Agents in Microsoft Defender

| Agent         | [Phishing Triage Agent](phishing-triage-agent.md)      | [Threat Intelligence Briefing Agent](threat-intel-briefing-agent-defender.md)       |
| ------------- | ------------- | ------------- |
| Description | The Phishing Triage Agent helps security operations analysts triage and classify user-submitted phishing incidents. The agent operates autonomously, provides a transparent rationale for its classification verdicts in natural language, and continuously learns and improves its accuracy based on feedback from analysts.  | The Threat Intelligence Briefing Agent generates threat intelligence briefings based on the latest threat actor activity and both internal and external vulnerability information in a matter of minutes. The agent can help security teams save time by creating a customized, relevant report that provides CISOs, security managers, and analysts with key situational awareness and a solid foundation for defense work.|
| Trigger | The agent is triggered when a user in your organization submits a phishing incident. The agent autonomously analyzes the submitted email to classify it as either phishing or not phishing based on its training and the context of the organization. | This agent runs at the set time interval that you configured during setup, or manually when you want to run it. |
| Permissions | **Required permissions:**<ul><li>Security data basics (read)<li>Email & collaboration content (read)<li>Email & collaboration metadata (read)<li>Security Copilot (read)<li>Alerts (manage)</ul> |**Required permissions:**<ul><li>Vulnerability Management (read)<li>Security Reader</ul><br>**Optional permissions:**<ul><li>Exposure Management (read)</ul> |
|Identity |The agent operates in the context of the identity you associate with it. You need to create the agent's identity and assign the appropriate permissions before starting the setup.  |
|Products |Tenants must have the following products enabled to use the agent:<ul><li>An active subscription to Security Copilot and provisioned capacity in Security Compute Units (SCU) to power Security Copilot workload. See [Get started with Security Copilot](/copilot/security/get-started-security-copilot) for more information.<li>Microsoft Defender for Office 365 Plan 2 deployed</ul>  | Tenants must have an active subscription to Security Copilot and provisioned capacity in Security Compute Units (SCU) to power Security Copilot workload.|
|Plugins |The following plugins must be enabled in Security Copilot:<ul><li>Microsoft Defender XDR<li>Microsoft Threat Intelligence<li>Phishing Triage Agent</ul> | The following plugins are required to run this agent:<ul><li>Microsoft Threat Intelligence<li>Microsoft Threat Intelligence agents</ul><br>The following plugin is optional but can add more context to the output:<ul><li>Microsoft Defender External Attack Surface Management</ul> |
|Roles with access |The **Security Administrator** role is required to set up and manage the agent. Users with the same permissions as the Phishing Triage Agent can view the agent's activity and results, and provide feedback on the agent's classification verdict. | The **Security Administrator** role is required to set up and manage the agent. Users with the same permissions as the Threat Intelligence Briefing Agent can view the agent's activity and results. |



