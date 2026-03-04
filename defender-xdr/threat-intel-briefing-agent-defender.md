---
title: Security Copilot Threat Intelligence Briefing Agent in Microsoft Defender 
description: Learn about the Security Copilot Threat Intelligence Briefing Agent, including requirements for setup and providing feedback to the agent
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- msec-ai-copilot
ms.topic: how-to
search.appverid:
- MET150
ms.date: 02/15/2026
appliesto:
- Microsoft Defender XDR
#customer intent: As a security analyst, I want to learn about the Threat Intelligence Briefing Agent in Microsoft Defender so that I can generate threat intelligence briefings efficiently.
---

# Microsoft Security Copilot Threat Intelligence Briefing Agent in Microsoft Defender 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

>[!NOTE]
> This article discusses the Threat Intelligence Briefing Agent embedded experience in Microsoft Defender portal. To learn more about the standalone experience in Security Copilot, read [Threat Intelligence Briefing Agent (standalone experience)](/copilot/security/threat-intel-briefing-agent).

Threat intelligence analysts face several challenges in delivering insightful, actionable, contextualized intelligence. The task of developing threat intelligence briefings involves collecting information from various threat feeds, tools, and portals. Analysts must filter and correlate this information, and analyze and map organizational risks. These activities happen before analysts can even start developing the report itself and generating insights for when they deliver the briefing. By then, as these processes can take anywhere from hours to days, the threats facing the organization already evolved, which can render the briefing obsolete.  

The Microsoft Security Copilot Threat Intelligence Briefing Agent in Microsoft Defender addresses these pain points. It generates threat intelligence briefings based on the latest threat actor activity and both internal and external vulnerability information in a matter of minutes. It can help security teams save time by creating a customized, relevant report that provides CISOs, security managers, and analysts with key situational awareness and a solid foundation for defense work.

The agent leverages dynamic automation and deep generative AI along with its wealth of threat intelligence knowledge and signals. When building the briefing, the agent dynamically chooses the next step based on the outcome of the previous step. This approach allows it to decide in real-time what threat intelligence to include and prioritize. The agent then translates this technical information into a digestible report that various audiences can consume.

The Threat Intelligence Briefing Agent is best suited for customers who turn on Microsoft Defender for Endpoint and Microsoft Defender External Attack Surface, as the agent relies on signals and insights from these first-party integrations to deliver accurate and context-rich reports.

Watch this video to see the Threat Intelligence Briefing Agent in action, from setup to generating your first briefing.
> [!VIDEO  https://learn-video.azurefd.net/vod/player?id=07ffea67-4ebf-4f13-9a7e-dcc49bcaac93]

## Where to find the Threat Intelligence Briefing Agent

The Threat Intelligence Briefing Agent appears as a banner at the top of the [Threat analytics](threat-analytics.md) page in the Microsoft Defender portal. 

:::image type="content" source="media/ti-briefing-agent/agent.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent banner on top of the Threat analytics page." lightbox="media/ti-briefing-agent/agent.png":::

To access Threat analytics, from the navigation menu, select **Threat intelligence** > **Threat analytics**.

## Prerequisites

### Products
You need [Microsoft Security Copilot](/copilot/security/microsoft-security-copilot) to run this agent.

### Security Copilot plugins
To run this agent, you need the following plugins:
- Microsoft Threat Intelligence
- Microsoft Threat Intelligence agents

The following plugin is optional but can add more context to the output:
- Microsoft Defender External Attack Surface Management

### User account permissions 

>[!IMPORTANT]
> **Identity and permissions requirement:** This agent requires connection to an existing user account or creation of a new [agent identity](#set-up-an-agent-identity-for-the-agent) (recommended). The agent can read data from Defender External Attack Surface Management and Defender Vulnerability Management. You must configure the user account or agent identity with the appropriate permissions before setting up the agent.

The user account connected to the agent or the created agent identity must have these permissions:

**Required permissions:**
- **Microsoft Defender for Endpoint:** Access to Defender Vulnerability Management data
- **Security Reader:** Access to Threat Analytics and agent results
- **Security Admin:** Access to agent onboarding and configuration

**Optional permissions:**
- **Exposure Management (read):** Access to Microsoft Security Exposure Management insights, including External Attack Surface Management data

**Role-based access:**
- Owners and contributors can see the report generated by the Threat Intelligence Briefing Agent within the Microsoft Security Copilot agent library page

>[!IMPORTANT]
> After setting up permissions, activate the Microsoft Defender XDR [Unified role-based access control (RBAC)](manage-rbac.md) model for the role to take effect.

>[!TIP]
> Consider using a dedicated service account for running agents to maintain separation of duties and enhance security monitoring.

### Trigger
This agent runs at the set time interval that you configured during setup, or manually when you want to run it.

## Set up an agent identity for the agent

The Threat Intelligence Briefing Agent can run under a dedicated [agent identity](https://aka.ms/WhatAreAgentIdentities) (service principal) with only the minimal read permissions required in Microsoft Defender. This section describes how you can create or reuse a least-privileged role, register the agent's service principal, and assign the role.

Before setting up an agent identity for the Threat Intelligence Briefing Agent, make sure that you have the agent in your environment. You must also have the following prerequisites:

- Tenant-level admin rights to register a service principal and assign roles.
- Azure CLI installed and authenticated (az login). For more information, see [Get started with Azure CLI](/cli/azure/get-started-with-azure-cli).
- Access to Defender XDR Unified RBAC or equivalent permissions management.

To set up an agent identity:
1. **Create or reuse a least-privileged role**

   Create a role or reuse an existing role that includes the following minimum permissions:
      - Security operations > Security data > **Security data basics (read)**
      - Security posture > Posture management > **Vulnerability management (read)**

   You can reuse other roles that provide at least these levels of read access. Apply least privilege and scope assignments narrowly.

1. **Register the agent's service principal (agent identity)**
   
   Run the following Azure CLI commands as a tenant admin to create the service principal in your tenant:

   ```azurecli-interactive
   TOKEN=$(az account get-access-token \
      --tenant <your tenant ID> \
      --resource-type ms-graph \
      --query accessToken -o tsv)
   ```
   ```azurecli-interactive
   curl -X POST https://graph.microsoft.com/v1.0/servicePrincipals \
      -H "Authorization: Bearer $TOKEN" \
      -H "Content-Type: application/json" \
      -d '{
         "appId": "43d7b169-1d9e-4d32-8cd8-06c5974ed90c"
      }'
   ```
   **Optional:** Validate that the service principal was created:
   ```azurecli-interactive
   curl -X GET "https://graph.microsoft.com/v1.0/servicePrincipals?$filter=appId eq '43d7b169-1d9e-4d32-8cd8-06c5974ed90c'" \
     -H "Authorization: Bearer $TOKEN"
   ```

1. **Assign the least-privileged role to the service principal**
   1. In the Defender portal, go to **Settings** > **Roles and permissions (Unified RBAC)** > **Assignments** > **Add assignment**
   1. Specify the following parameters:
      - **Principal:** Select the service principal created in step 2.
      - **Role:** Choose the custom role with the two read permissions mentioned in step 1.
      - **Scope:** Select the minimal scope required (specific assets or subscriptions).
   1. Save the assignment.
1. [Set up the Threat Intelligence Briefing Agent](#set-up-the-agent) and connect the created agent identity


## Set up the agent
To run the Threat Intelligence Briefing Agent for the first time, follow these steps:

1. On the Threat Intelligence Briefing Agent banner at the top of the Threat analytics page, select **Set up agent**.

   :::image type="content" source="media/ti-briefing-agent/setup-agent.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent banner on top of the Threat analytics page with the Setup agent button highlighted." lightbox="media/ti-briefing-agent/setup-agent.png":::

1. On the pop-up window that appears, review the agent details, and then select **Next**.

   :::image type="content" source="media/ti-briefing-agent/review-details.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent setup page showing the agent details." lightbox="media/ti-briefing-agent/review-details.png":::

1. Connect a user account or agent identity, and then select **Continue** to open a new window where you can perform this step. 

   :::image type="content" source="media/ti-briefing-agent/connect-user.png" alt-text="Screenshots of the Threat Intelligence Briefing Agent setup page showing the steps to connect a user account." lightbox="media/ti-briefing-agent/connect-user.png":::

1. Wait for the agent to finish connecting to the identity or account, and then select **Continue**.

   :::image type="content" source="media/ti-briefing-agent/review-user.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent setup page showing the user account details." lightbox="media/ti-briefing-agent/review-user.png":::

1. Specify the following parameters to customize the agent output:
    - **Insights:** The number of vulnerabilities the agent researches for active threats.
    - **Look back days:** The number of days the agent goes back to research threats against your vulnerabilities.
    - **Region:** The geographical area that the agent checks for relevant threats.
    - **Industry:** The sector or industry vertical that the agent checks for relevant threats.
    - **Scheduled runs settings:** Choose whether you want to run the agent manually or have it send briefings at regular intervals automatically. By default, the agent runs every seven days.
    - **Generated brief recipient:** The email address of the user or distribution group that the agent sends the briefing to.

   :::image type="content" source="media/ti-briefing-agent/set-parameters.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent setup page showing the different parameters." lightbox="media/ti-briefing-agent/set-parameters.png":::

1. Select **Deploy agent**. When the agent activates, you can go back to the Threat analytics page or select **Manage agent** to update your agent parameters.
 
   :::image type="content" source="media/ti-briefing-agent/finish-setup.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent setup page showing successful agent deployment." lightbox="media/ti-briefing-agent/finish-setup.png":::

## View briefing and manage the agent
Select **Run agent** to generate an ad-hoc or the most up-to-date briefing. Select **View full brief** to view the full report.

:::image type="content" source="media/ti-briefing-agent/run-agent.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent banner on top of the Threat analytics page with the View full brief and Run agent buttons highlighted." lightbox="media/ti-briefing-agent/run-agent.png":::

When you select **View full brief**, a side panel appears containing a relevant summary of threat information and detailed technical analysis, including any actively exploited vulnerability and its possible organizational impact. You can download the report as a markdown file or copy its contents by selecting their respective icons at the top of the panel.

:::image type="content" source="media/ti-briefing-agent/full-brief.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent side panel in the Threat analytics page with the Download and Copy buttons highlighted." lightbox="media/ti-briefing-agent/full-brief.png":::

Select **Manage agent** to view and manage the agent's settings. 

:::image type="content" source="media/ti-briefing-agent/manage-agent.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent side panel in the Threat analytics page with the Manage agent button highlighted." lightbox="media/ti-briefing-agent/manage-agent.png":::

You can also access the agent settings by:
- Selecting the three dots in the agent banner and then selecting **Manage agent**.
- Going to **System** > **Settings** > **Microsoft Defender XDR** > **Threat Intelligence Briefing Agent** in the Defender portal navigation menu.

   :::image type="content" source="media/ti-briefing-agent/settings.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent settings page in the Defender portal." lightbox="media/ti-briefing-agent/settings.png":::

## Assess and provide feedback on the agent’s output

The Threat Intelligence Briefing Agent saves the reports it generates in the Security Copilot standalone portal, under **Activity**. You can access this Activity page from the Defender portal by selecting **View agent activity** from the Threat Intelligence Briefing Agent settings page.

:::image type="content" source="media/ti-briefing-agent/view-agent-activity.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent settings page in the Defender portal with View agent activity button highlighted." lightbox="media/ti-briefing-agent/view-agent-activity.png":::

The Activity page displays the times the Threat Intelligence Briefing Agent ran to generate a report, the method of generation, and status. To assess the agent's output, select one of the reports.

:::image type="content" source="media/ti-briefing-agent/agent-activity.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent activity page in the Security Copilot standalone portal." lightbox="media/ti-briefing-agent/agent-activity.png":::


To view the agent’s progress toward producing a threat briefing, select **View activity**. This selection opens an activity map where you can see the details of the activity, providing you with transparency on the steps taken by the agent to produce the output. The Threat Intelligence Briefing Agent dynamically chooses the next step based on the outcome of the previous one as it builds the briefing.

:::image type="content" source="media/ti-briefing-agent/view-activity.png" alt-text="Screenshot of a Threat Intelligence Briefing Agent report in the Security Copilot standalone portal with the View activity button highlighted." lightbox="media/ti-briefing-agent/view-activity.png":::

:::image type="content" source="media/ti-briefing-agent/activity-map.png" alt-text="Screenshot of a Threat Intelligence Briefing Agent report activity map." lightbox="media/ti-briefing-agent/activity-map.png":::

To provide feedback about the briefing, select the **thumbs up** or **thumbs down** icon. In the pop-up window that appears, elaborate your feedback in the text box provided and then select **Submit**. You can choose to provide your feedback to the agent, so you can teach it what you like and how it can get even better, or to Microsoft, to tell us what you think about the results the agent generates and what we can do to improve them. 


## See also
- [Microsoft Security Copilot agents](/copilot/security/agents-overview)
- [Responsible AI FAQs for Security Copilot Agent](/copilot/security/rai-faqs-security-copilot-agents)
