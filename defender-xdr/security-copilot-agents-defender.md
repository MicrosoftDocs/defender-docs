---
title: Deploy AI agents in Microsoft Defender
description: Learn about AI agents in Microsoft Defender that can help you perform your security tasks easily.
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

# Deploy AI agents in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[Security Store](/security/store/what-is-security-store) in the Microsoft Defender portal offers various agents that help you perform your security tasks efficiently. These agents include [Microsoft Security Copilot agents](/copilot/security/agents-overview) published by Microsoft and partners. These agents integrate with Microsoft Defender and carry out various security operations (SOC) tasks, such as incident triage, investigation, threat hunting, and threat intelligence.

This article explains how to discover and deploy AI agents in Microsoft Defender.

> [!NOTE]
> To learn more about publishing agents to Security Store, see [Publish agents to Microsoft Security Store](/security/store/publish-a-security-copilot-agent-or-analytics-solution-in-security-store).

## Prerequisites

To purchase and deploy agents from Security Store, you need: 

- [Access to a Security Copilot workspace provisioned with SCU capacity](/copilot/security/get-started-security-copilot).
- For partner-published agents, you need the [Azure subscription contributor or owner role](/marketplace/roles-permissions).

## Discover and deploy agents in the Microsoft Defender portal

To discover and deploy agents in the Microsoft Defender portal: 

1. Select **Security Copilot > Security Store**. 
1. Browse or search for the agent you want to deploy.
1. Select the agent to view its details, including its capabilities, requirements, and setup instructions.
1. To purchase and deploy the agent: 

    - Select **Get agent** to begin the deployment process if you have sufficient permissions. For more information, see [Prerequisites](#prerequisites).

    - Select **Copy link** to copy the agent's details page URL and share it with a security administrator, if you don't have permissions to deploy agents.

        :::image type="content" source="./media/security-copilot-agents-defender/microsoft-defender-security-store.png" alt-text="Screenshot showing Security Store page in Microsoft Defender portal." lightbox="./media/security-copilot-agents-defender/microsoft-defender-security-store.png":::

    - For partner-published agents, complete the purchase and deploy on the [Security Store website](https://securitystore.microsoft.com/), as described in the [Microsoft Security Store documentation](/security/store/get-agents-in-security-store). 

        You can manage centralized purchases for partner-published agents through public offers, or through private offers, as described in [How to Purchase SaaS Solutions (Private Offers)](/security/store/how-to-purchase-saas-solutions-private-offers).

1. After purchasing the agent, select **Security Copilot > Agents**, find your agent in the **Ready for setup** section, and then select **Set up** to begin agent setup.

    For more information on setting up, managing, and running partner-published agents, see [Manage Security Copilot agents](/copilot/security/agents-manage#set-up-for-partner-built-agents).

    For more information on Microsoft Security Copilot agents, see [Microsoft Security Copilot agents in Microsoft Defender](#microsoft-security-copilot-agents-in-microsoft-defender).

    After setup, the agent appears in the **Agents in use** section.

## Microsoft Security Copilot agents in Microsoft Defender

This section details the Microsoft Security Copilot agents that are available in the Microsoft Defender portal.

### Phishing Triage Agent

The [Phishing Triage Agent](phishing-triage-agent.md) helps security operations analysts triage and classify user-submitted phishing incidents. The agent operates autonomously, provides a transparent rationale for its classification verdicts in natural language, and continuously learns and improves its accuracy based on feedback from analysts.

| Attribute | Description |
|---|---|
| Identity | Operates in the context of the user you connect to the agent |
| License | [Microsoft Defender for Endpoint P2](/defender-endpoint/microsoft-defender-endpoint)|
| Permissions | The agent requires these permissions to operate:<ul><li>Read Security data basics (read)<li>Email & collaboration content (read)<li>Email & collaboration metadata (read)<li>Security Copilot (read)<li>Alerts (manage)</ul> |
| Plugins | The agent automatically activates these Security Copilot plugins:<ul><li>[Microsoft Defender XDR](security-copilot-in-microsoft-365-defender.md)<li>[Microsoft Threat Intelligence](/defender/threat-intelligence/security-copilot-and-defender-threat-intelligence)<li>[Phishing Triage Agent](phishing-triage-agent.md)|
| Products | <ul><li>[Security Copilot](/copilot/security/get-started-security-copilot)<li>Microsoft Defender for Office 365 Plan 2</ul> | 
| Role-based access | [Security Administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator) Microsoft Entra role is required to set up and manage the agent<br><br>Users with the same permissions as the Phishing Triage Agent can view the agent's activity and results, and provide feedback on the agent's classification verdict. |
| Trigger | Triggered when a user in your organization submits a phishing incident |

### Threat Intelligence Briefing Agent

The [Threat Intelligence Briefing Agent](threat-intel-briefing-agent-defender.md) provides security operations teams with regular, customized threat intelligence briefings. The agent autonomously gathers and synthesizes relevant threat intelligence data from various sources, delivering concise and actionable insights to help analysts stay informed about emerging threats and trends.

| Attribute | Description |
|---|---|
| Identity | Requires connection to an existing user account or creation of a new agent identity |
| License | [Defender EASM Standard](https://www.microsoft.com/security/pricing/microsoft-defender-external-attack-surface-management?msockid=2f55df1fd6fd61f12ba8ca23d7976094) |
| Permissions | **Required permissions:**<ul><li>Microsoft Defender for Endpoint<li>Security Reader</ul>**Optional permissions:**<ul><li>Exposure Management (read)</ul> |
| Products | [Security Copilot](/copilot/security/get-started-security-copilot) | 
| Plugins | The following plugins are required to run this agent:<ul><li>Microsoft Threat Intelligence<li>Microsoft Threat Intelligence agents</ul>The following plugin is optional but can add more context to the output:<ul><li>Microsoft Defender External Attack Surface Management</ul> |
| Role-based access | The **Security Administrator** role is required to set up and manage the agent.<br><br>Users with the same permissions as the Threat Intelligence Briefing Agent can view the agent's activity and results. |
| Trigger | Runs at the set time interval that you configured during setup, or manually when you want to run it |

