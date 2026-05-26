---
title: Deploy AI agents in Microsoft Defender
description: Learn about AI agents in Microsoft Defender that can help you perform your security tasks easily.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier1
- security-copilot
- magic-ai-copilot 
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 05/12/2026
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

To purchase, deploy, and use agents from Security Store, you need: 

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

- [Security Alert Triage Agent (Preview)](#security-alert-triage-agent-preview)
- [Threat Intelligence Briefing Agent](#threat-intelligence-briefing-agent)
- [Threat Hunting Agent](#threat-hunting-agent)
- [Security Analyst Agent](#security-analyst-agent)
- [Dynamic Threat Detection Agent](#dynamic-threat-detection-agent)

### Security Alert Triage Agent (Preview)

> [!NOTE]
> The Security Alert Triage Agent is the same agent as the [Phishing Triage Agent](phishing-triage-agent.md) with extended capabilities to triage a broader set of alert types. The Security Alert Triage Agent is available only to customers who are part of the preview. If you aren't part of the preview, the Phishing Triage Agent continues to be available in Security Store.

The [Security Alert Triage Agent](security-alert-triage-agent.md) is an autonomous agent that helps security teams triage alerts at scale across multiple workloads. The agent applies AI-driven, dynamic reasoning to deliver clear verdicts for supported security workloads. This is the same agent as the [Phishing Triage Agent](phishing-triage-agent.md), which has demonstrated measurable improvements in triage accuracy and efficiency. The agent can now triage a broader set of alerts in Microsoft Defender, including email and collaboration alerts (generally available), and cloud and identity alerts (preview). The agent operates autonomously, provides transparent rationale for its classification verdicts in natural language, and continuously learns and improves its accuracy based on feedback from analysts.

| Attribute | Description |
|---|---|
| Identity | Create a new agent identity or connect to an existing user account |
| License | Depends on alert types:<ul><li>**Email and collaboration alerts:** [Microsoft Defender for Office P2](/office365/servicedescriptions/office-365-advanced-threat-protection-service-description)<li>**Cloud alerts:** [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction) and [Microsoft Defender for Containers](/azure/defender-for-cloud/defender-for-containers-deployment-overview)<li>**Identity alerts:** [Entra ID P2 license](/entra/fundamentals/licensing), [Microsoft Defender for Identity](/defender-for-identity/what-is), and [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps)</ul>|
| Permissions | The agent requires these permissions to operate, depending on the alert types you want to triage:<ul><li>**All alert types:** Security Copilot (read), Security data basics (read), Alerts (manage)<li>**Email and collaboration alerts:** Email & collaboration metadata (read), Email & collaboration content (read)<li>**Cloud and identity alerts:** No additional permissions required beyond the base permissions</ul> |
| Plugins | The agent automatically activates these Security Copilot plugins:<ul><li>[Microsoft Defender XDR](security-copilot-in-microsoft-365-defender.md)<li>[Microsoft Threat Intelligence](/defender/threat-intelligence/security-copilot-and-defender-threat-intelligence)<li>[Security Alert Triage Agent](security-alert-triage-agent.md)|
| Products | <ul><li>[Security Copilot](/copilot/security/get-started-security-copilot)<li>Microsoft Defender for Office 365 Plan 2 (for email and collaboration alerts)<li>Microsoft Defender for Cloud (for cloud alerts)<li>Microsoft Defender for Identity and Microsoft Defender for Cloud Apps (for identity alerts)</ul> | 
| Role-based access | [Security Administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator) Microsoft Entra role is required to set up and manage the agent<br><br>Users with the same permissions as the Security Alert Triage Agent can view the agent's activity and results, and provide feedback on the agent's classification verdict. |
| Trigger | Runs automatically when a new alert is detected for the configured alert types, including user-reported emails (for email and collaboration alerts), cloud security alerts (for cloud alerts), and identity alerts. |

### Threat Intelligence Briefing Agent

The [Threat Intelligence Briefing Agent](threat-intel-briefing-agent-defender.md) provides security operations teams with regular, customized threat intelligence briefings. The agent autonomously gathers and synthesizes relevant threat intelligence data from various sources, delivering concise and actionable insights to help analysts stay informed about emerging threats and trends.

| Attribute | Description |
|---|---|
| Identity | Create a new agent identity or connect to an existing user account |
| License | **Not Applicable** |
| Permissions | **Required permissions:**<ul><li>Microsoft Defender for Endpoint<li>Security Reader</ul>**Optional permissions:**<ul><li>Exposure Management (read)</ul> |
| Products | [Security Copilot](/copilot/security/get-started-security-copilot) | 
| Plugins | The following plugins are required to run this agent:<ul><li>Microsoft Threat Intelligence<li>Microsoft Threat Intelligence agents</ul>The following plugin is optional but can add more context to the output:<ul><li>Microsoft Defender External Attack Surface Management</ul> |
| Role-based access | The **Security Administrator** role is required to set up and manage the agent.<br><br>Users with the same permissions as the Threat Intelligence Briefing Agent can view the agent's activity and results. |
| Trigger | Runs at the set time interval that you configured during setup, or manually when you want to run it |

#### Configure Defender for Endpoint permissions for the agent identity

When running the Threat Intelligence Briefing Agent with an [agent identity](threat-intel-briefing-agent-defender.md#set-up-an-agent-identity-for-the-agent), you must also configure the following Defender for Endpoint role permissions and Device Group access. Without these permissions, the Exposure Report may show as "not available" or return zero CVEs even when vulnerabilities exist in your environment.

**Step 1 – Update the agent role permissions**

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).
1. Navigate to **Settings** > **Endpoints** > **Permissions** > **Roles**.
1. Locate the custom role assigned to the Threat Intelligence Briefing Agent.
1. Edit the role and confirm that the following permissions are enabled:
   - **Advanced Hunting** – Read
   - **Vulnerability Management** – Read
   - **Machine Configuration** – Read
   - **Device Inventory** – Read
1. Save any changes if updates are made.

**Step 2 – Grant Device Group access to the agent**

1. In the Microsoft Defender portal, go to **Settings** > **Endpoints** > **Device Groups**.
1. For each Device Group that contains production endpoints:
   1. Open the Device Group.
   1. Select the **User Access** section.
   1. Add the Threat Intelligence Briefing Agent identity.
   1. Assign **Read** access.
1. Save the changes.

> [!IMPORTANT]
> Allow time for permission updates to synchronize across Microsoft Defender services before running the agent.

### Threat Hunting Agent

The [Threat Hunting Agent](advanced-hunting-security-copilot-threat-hunting-agent.md) revolutionizes threat hunting by enabling you to investigate threats using natural language from start to finish. It not only generates KQL queries but also interprets results, surfaces insights, and guides you through full hunting sessions. These capabilities empower you to hunt threats faster, more accurately, and with greater confidence.

:::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-answer.png" alt-text="Screenshot of the Copilot pane in advanced hunting with the answer highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-answer.png":::

### Security Analyst Agent

The [Security Analyst Agent](/copilot/security/security-analyst-agent) helps security analysts quickly identify, assess, and prioritize risks by performing ready-to-use or custom analyses on security data. The agent provides actionable and prioritized insights, recommendations, and reports to uncover top vulnerabilities and risks. It supports data from Microsoft Defender XDR, Sentinel Log Analytics, or Sentinel Data Lake, and can perform complex analysis tasks such as anomaly detection, clustering, risk scoring, and forecasting without requiring code or queries.

| Attribute | Description |
|---|---|
| Identity | Tied to your user identity; each user configures the agent independently |
| License | **Not Applicable** |
| Permissions | Read access to Microsoft Defender XDR, Microsoft Sentinel Log Analytics Workspace, or Microsoft Sentinel Data Lake, depending on the data source you choose |
| Products | <ul><li>[Security Copilot](/copilot/security/get-started-security-copilot)<li>Microsoft Defender XDR (optional data source)<li>Microsoft Sentinel (optional data source)</ul> |
| Role-based access | Users with read access to the selected data sources can configure and use the agent. |
| Trigger | Runs on demand when you enter a security analysis prompt in the agent chat or select **Analyze with copilot** from advanced hunting query results |

### Dynamic Threat Detection Agent

The [Dynamic Threat Detection Agent](dynamic-threat-detection-agent.md) in the Defender portal is an always-on, adaptive backend service that uncovers hidden threats across Defender and Microsoft Sentinel environments. It uses AI to identify gaps and uncover false negatives by correlating alerts, events, anomalies, and threat intelligence. When the agent identifies a gap, it generates a dynamic alert with the full context in the alert details, including natural language explanations, mapped [MITRE ATT&CK techniques](https://attack.mitre.org/), and tailored remediation steps.
