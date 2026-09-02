---
title: Security Copilot Threat Intelligence Briefing Agent in Microsoft Defender 
description: Learn what the Security Copilot Threat Intelligence Briefing Agent does in Microsoft Defender, how to set it up, view briefings, and provide feedback.
ms.service: defender-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier1
- security-copilot
- msec-ai-copilot
ms.topic: how-to
ms.date: 06/16/2026
appliesto:
- Microsoft Defender XDR
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
#customer intent: As a security analyst, I want to learn about the Threat Intelligence Briefing Agent in Microsoft Defender so that I can generate threat intelligence briefings efficiently.
---

# Microsoft Security Copilot Threat Intelligence Briefing Agent in Microsoft Defender 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

>[!NOTE]
> This article discusses the Threat Intelligence Briefing Agent embedded experience in Microsoft Defender portal. To learn more about the standalone experience in Security Copilot, read [Threat Intelligence Briefing Agent (standalone experience)](/copilot/security/threat-intel-briefing-agent).

Threat intelligence analysts face many challenges when they create useful, actionable briefings. Building a briefing requires collecting data from multiple threat feeds, tools, and portals. Analysts must then filter, correlate, and analyze this data to map risks to their organization. All of this work happens before they can even start writing the report. Because these steps can take hours or even days, threats often change before the briefing is ready, which can make it outdated.  

The Microsoft Security Copilot Threat Intelligence Briefing Agent in Microsoft Defender addresses these pain points. It generates threat intelligence briefings based on the latest threat actor activity and both internal and external vulnerability information in a matter of minutes. It can help security teams save time by creating a customized, relevant report that provides CISOs, security managers, and analysts with key situational awareness and a solid foundation for defense work.

The agent uses automation and generative AI along with broad threat intelligence data. As it builds the briefing, it picks each next step based on the result of the previous one. This lets it decide in real time which threats to include and rank. The agent then turns the collected threat intelligence and vulnerability findings into a clear report that different audiences can read and act on.

The Threat Intelligence Briefing Agent is best suited for customers who turn on Microsoft Defender for Endpoint and Microsoft Defender External Attack Surface, as the agent relies on signals and insights from these first-party integrations to deliver accurate and context-rich reports.

Watch this video to see the Threat Intelligence Briefing Agent in action, from setup to generating your first briefing.
> [!VIDEO  https://learn-video.azurefd.net/vod/player?id=07ffea67-4ebf-4f13-9a7e-dcc49bcaac93]

## Where to find the Threat Intelligence Briefing Agent

You can find the Threat Intelligence Briefing Agent as a banner at the top of the [Threat analytics](threat-analytics.md) page in the Defender portal.

:::image type="content" source="media/ti-briefing-agent/agent.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent banner on top of the Threat analytics page." lightbox="media/ti-briefing-agent/agent.png":::

To open Threat analytics, go to **Threat intelligence** > **Threat analytics** in the navigation menu.

## Prerequisites

Before you set up the Threat Intelligence Briefing Agent, make sure you have the following products, plugins, and permissions in place.

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
> **Identity and permissions requirement:** This agent must connect to a user account or a new [agent identity](#set-up-an-agent-identity-for-the-agent) (recommended). The agent can read data from Defender External Attack Surface Management and Defender Vulnerability Management. Set up the right permissions on the account or identity before you configure the agent.

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
> After setting up permissions, activate the Microsoft Defender [unified role-based access control (RBAC)](manage-rbac.md) model for the role to take effect.

>[!TIP]
> Consider using a dedicated service account for running agents to maintain separation of duties and enhance security monitoring.

### Trigger
This agent runs at the set time interval that you configured during setup, or manually when you want to run it.

## Set up an agent identity for the agent

A service principal is an application identity in Microsoft Entra ID that lets an app access resources on its own behalf. The Threat Intelligence Briefing Agent can run under a dedicated [agent identity](https://aka.ms/WhatAreAgentIdentities) (service principal) with only the minimal read permissions required in Microsoft Defender. This section describes how you can create or reuse a least-privileged role, register the agent's service principal, and assign the role.

Before setting up an agent identity for the Threat Intelligence Briefing Agent, make sure that you have the agent in your environment. You must also have the following prerequisites:

- Tenant-level admin rights to register a service principal and assign roles.
- Azure CLI installed and authenticated (az login). For more information, see [Get started with Azure CLI](/cli/azure/get-started-with-azure-cli).
- Access to Defender unified RBAC or equivalent permissions management.

To set up an agent identity:
1. **Create or reuse a least-privileged role**

   Create a role or reuse an existing role that includes the following minimum permissions:
      - Security operations > Security data > **Security data basics (read)**
      - Security posture > Posture management > **Vulnerability management (read)**

   You can reuse other roles that provide at least these levels of read access. Apply least privilege and scope assignments narrowly.

1. **Register the agent's service principal (agent identity)**
   
   First, get a Microsoft Graph access token. You use this token to authenticate the API calls in the following steps. Run the following commands as a tenant admin:

   ```azurecli-interactive
   TOKEN=$(az account get-access-token \
      --tenant <your tenant ID> \
      --resource-type ms-graph \
      --query accessToken -o tsv)
   ```

   Next, create the service principal for the agent identity in your tenant:

   ```azurecli-interactive
   curl -X POST https://graph.microsoft.com/v1.0/servicePrincipals \
      -H "Authorization: Bearer $TOKEN" \
      -H "Content-Type: application/json" \
      -d '{
         "appId": "43d7b169-1d9e-4d32-8cd8-06c5974ed90c"
      }'
   ```
   **Optional:** Run the following request to look up the service principal by app ID and confirm it was created:
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

1. **Configure Defender for Endpoint role permissions**

   In addition to the Unified RBAC role assignment, the agent identity must have the required Defender for Endpoint permissions to access vulnerability and device data:

   1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).
   1. Navigate to **Settings** > **Endpoints** > **Permissions** > **Roles**.
   1. Locate the custom role assigned to the Threat Intelligence Briefing Agent (for example, "Threat Intelligence Briefing Agent").
   1. Edit the role and confirm that the following permissions are enabled:
      - **Advanced Hunting** – Read
      - **Vulnerability Management** – Read
      - **Machine Configuration** – Read
      - **Device Inventory** – Read
   1. Save any changes if updates are made.

1. **Grant Device Group access to the agent identity**

   The agent identity must also have access to the Device Groups that contain your endpoints. Without this access, the agent can't query device vulnerability data, and the Exposure Report section of the briefing may show as "not available" or return zero results.

   1. In the Microsoft Defender portal, go to **Settings** > **Endpoints** > **Device Groups**.
   1. For each Device Group that contains production endpoints:
      1. Open the Device Group.
      1. Select the **User Access** section.
      1. Add the Threat Intelligence Briefing Agent identity.
      1. Assign **Read** access.
   1. Save the changes.

1. **Wait for permissions to synchronize, then set up the agent**

   > [!IMPORTANT]
   > Allow time for permission updates to synchronize across Microsoft Defender services before running the agent.

   After permissions synchronize, [set up the Threat Intelligence Briefing Agent](#set-up-the-agent) and connect the created agent identity.


## Set up the agent
To run the Threat Intelligence Briefing Agent for the first time, follow these steps:

1. On the Threat Intelligence Briefing Agent banner at the top of the Threat analytics page, select **Set up agent**.

   :::image type="content" source="media/ti-briefing-agent/setup-agent.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent banner on top of the Threat analytics page with the Setup agent button highlighted." lightbox="media/ti-briefing-agent/setup-agent.png":::

1. On the pop-up window that appears, review the agent details, and then select **Next**.

   :::image type="content" source="media/ti-briefing-agent/review-details.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent setup page showing the agent details." lightbox="media/ti-briefing-agent/review-details.png":::

1. Connect a user account or agent identity, and then select **Continue**. A new window opens where you complete this step.

   :::image type="content" source="media/ti-briefing-agent/connect-user.png" alt-text="Screenshots of the Threat Intelligence Briefing Agent setup page showing the steps to connect a user account." lightbox="media/ti-briefing-agent/connect-user.png":::

1. Wait for the agent to finish connecting to the identity or account, and then select **Continue**.

   :::image type="content" source="media/ti-briefing-agent/review-user.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent setup page showing the user account details." lightbox="media/ti-briefing-agent/review-user.png":::

1. Specify the following parameters to customize the agent output:
    - **Insights:** The number of vulnerabilities the agent researches for active threats.
    - **Look back days:** The number of days the agent goes back to research threats against your vulnerabilities.
    - **Region:** The geographical area that the agent checks for relevant threats.
    - **Industry:** The sector or industry vertical that the agent checks for relevant threats.
    - **Scheduled runs settings:** Choose whether to run the agent manually or send briefings at regular intervals. By default, the agent runs every seven days.
    - **Generated brief recipient:** The email address of the user or distribution group that the agent sends the briefing to.

   :::image type="content" source="media/ti-briefing-agent/set-parameters.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent setup page showing the different parameters." lightbox="media/ti-briefing-agent/set-parameters.png":::

1. Select **Deploy agent**. When the agent activates, you can go back to the Threat analytics page or select **Manage agent** to update your agent parameters.
 
   :::image type="content" source="media/ti-briefing-agent/finish-setup.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent setup page showing successful agent deployment." lightbox="media/ti-briefing-agent/finish-setup.png":::

## View briefing and manage the agent
Select **Run agent** to generate an ad-hoc or the most up-to-date briefing. Select **View full brief** to view the full report.

:::image type="content" source="media/ti-briefing-agent/run-agent.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent banner on top of the Threat analytics page with the View full brief and Run agent buttons highlighted." lightbox="media/ti-briefing-agent/run-agent.png":::

When you select **View full brief**, a side panel opens with a threat summary and detailed technical analysis. The panel covers actively exploited vulnerabilities and their possible impact on your organization. To download the report as a markdown file or copy its contents, select the matching icons at the top of the panel.

:::image type="content" source="media/ti-briefing-agent/full-brief.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent side panel in the Threat analytics page with the Download and Copy buttons highlighted." lightbox="media/ti-briefing-agent/full-brief.png":::

Select **Manage agent** to view and manage the agent's settings. 

:::image type="content" source="media/ti-briefing-agent/manage-agent.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent side panel in the Threat analytics page with the Manage agent button highlighted." lightbox="media/ti-briefing-agent/manage-agent.png":::

You can also access the agent settings by:
- Select the three dots in the agent banner, then select **Manage agent**.
- Go to **System** > **Settings** > **Microsoft Defender XDR** > **Threat Intelligence Briefing Agent** in the Defender portal.

   :::image type="content" source="media/ti-briefing-agent/settings.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent settings page in the Defender portal." lightbox="media/ti-briefing-agent/settings.png":::

## Assess and provide feedback on the agent’s output

The Threat Intelligence Briefing Agent saves the reports it generates in the Security Copilot standalone portal, under **Activity**. You can access this Activity page from the Defender portal by selecting **View agent activity** from the Threat Intelligence Briefing Agent settings page.

:::image type="content" source="media/ti-briefing-agent/view-agent-activity.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent settings page in the Defender portal with View agent activity button highlighted." lightbox="media/ti-briefing-agent/view-agent-activity.png":::

The Activity page displays the times the Threat Intelligence Briefing Agent ran to generate a report, the method of generation, and status. To assess the agent's output, select one of the reports.

:::image type="content" source="media/ti-briefing-agent/agent-activity.png" alt-text="Screenshot of the Threat Intelligence Briefing Agent activity page in the Security Copilot standalone portal." lightbox="media/ti-briefing-agent/agent-activity.png":::


To view the agent’s progress toward producing a threat briefing, select **View activity**. This selection opens an activity map where you can see the details of the activity, providing you with transparency on the steps taken by the agent to produce the output. The Threat Intelligence Briefing Agent dynamically chooses the next step based on the outcome of the previous one as it builds the briefing.

:::image type="content" source="media/ti-briefing-agent/view-activity.png" alt-text="Screenshot of a Threat Intelligence Briefing Agent report in the Security Copilot standalone portal with the View activity button highlighted." lightbox="media/ti-briefing-agent/view-activity.png":::

:::image type="content" source="media/ti-briefing-agent/activity-map.png" alt-text="Screenshot of a Threat Intelligence Briefing Agent report activity map." lightbox="media/ti-briefing-agent/activity-map.png":::

To share feedback about the briefing, select the **thumbs up** or **thumbs down** icon. In the window that appears, type your feedback in the text box and select **Submit**. You can send feedback to the agent to help it learn what you prefer, or to Microsoft to help us improve the results.


<a name="see-also"></a>
## Related content
- [Microsoft Security Copilot agents](/copilot/security/agents-overview)
- [Responsible AI FAQs for Security Copilot Agent](/copilot/security/rai-faqs-security-copilot-agents)
