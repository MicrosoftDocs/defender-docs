---
title: Develop a Security Copilot agent platform solution
description: Learn how to create and deploy a Security Copilot agent that correlates identity, endpoint, and cloud security signals to automate threat investigations.
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: smarapareddy
ms.date: 06/29/2026
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-10012

#customer intent: As a security developer, I want to create and deploy a Security Copilot agent so that I can automate identity risk investigations by correlating authentication, endpoint, and cloud security signals.
---

# Develop a Security Copilot agent platform solution

In this article, you build a Security Copilot agent that uses the fictional ISV **IdentityDrift**  with Microsoft Entra ID, Microsoft Defender for Endpoint, and Microsoft Defender for Cloud alerts.

This article is part of a series that walks you through [ingesting test data to the data lake](ingest-sample-data.md), developing an agent, and [publishing](publish-agent-to-security-store.md) the example *IdentityDrift* platform solution. The solution includes a Security Copilot agent that correlates identity, endpoint, and cloud security signals to automate threat investigations.


After completing the steps in this article, you can:

- Create and manage Security Copilot workspaces
- Create and test a Security Copilot agent

## Prerequisites

Complete the following how-to tutorials to set up your environment and prepare the agent instructions for the IdentityDrift Investigation Agent:

- [Sentinel Data Lake Onboarding](sentinel-data-lake-onboarding.md)
- [Ingest Data to Sentinel Data Lake](ingest-sample-data.md)
- [Onboarding to Security Copilot for non-Microsoft 365 E5 and E7 customers](/copilot/security/manual-onboarding#option-1-recommended-provision-capacity-through-security-copilot)
- [Use an MCP tool in Visual Studio Code](../datalake/sentinel-mcp-use-tool-visual-studio-code.md)
- [Use an MCP tool in Microsoft Foundry (preview)](../datalake/sentinel-mcp-use-tool-azure-ai-foundry.md)

### Permissions

- You must have the **Security Administrator** role to create Secure Compute Units (SCUs). This is a prerequisite to run agents in Security Copilot.
- The **Security Operator** role is sufficient to create and test agents.


## Create a Security Copilot workspace

Follow these steps to create a Security Copilot workspace. This is the environment where you build and run your agent.

1. Navigate to [Security Copilot](https://securitycopilot.microsoft.com/)
1. Sign in with your credentials that have the required permissions

### Create SCU capacity and a new workspace

Create the Security Compute Units (SCU) capacity for your workspace. On the home page, Security Copilot prompts you to create capacity.

1. Select the appropriate **Azure Subscription** and **Resource Group**.
1. Add a **Capacity name**, select a **Prompt evaluation location**, and select a **Capacity region**.
1. Under **Create a new workspace**, select 1 or 2 SCUs depending on your requirements.
1. Select **Create**.

   :::image type="content" source="./media/build-agent-security-copilot/create-security-capacity.png" alt-text="Screenshot of the Security Copilot capacity creation page showing the subscription, resource group, capacity name, and SCU selection fields." lightbox="./media/build-agent-security-copilot/create-security-capacity.png":::  
   The prices shown in this image are for example purposes only and are not intended to reflect actual prices.


   > [!NOTE]
   > Security Compute Units (SCUs) are billed hourly. To optimize costs during testing, delete your SCU capacity when not actively running agents, and recreate it when needed. For more information, see [Microsoft Security Copilot Security Compute Units and capacity](/copilot/security/security-compute-units-capacity#provisioned-capacity).

To create a workspace:

1. Select the SCU capacity name you created in the previous step.
1. Complete the workspace creation dialog.

    :::image type="content" source="./media/build-agent-security-copilot/select-capacity.png" alt-text="Screenshot of Security Copilot showing the workspace creation dialog with SCU capacity selection and workspace name fields." lightbox="./media/build-agent-security-copilot/select-capacity.png":::

   > [TIP]
   > During the workspace creation, if you encounter any issues such as a *failed to create workspace* message, return to the **Assign roles** step and under **Contributors**, select **No one. Add them later**.

   :::image type="content" source="./media/build-agent-security-copilot/workspace-assign-roles.png" alt-text="Screenshot of the workspace creation Assign roles step with the No one option selected." lightbox="./media/build-agent-security-copilot/workspace-assign-roles.png":::

## Create the IdentityDrift Investigation Agent

1. To create the agent in your workspace, select **Build** and then select **Start from scratch**

   :::image type="content" source="./media/build-agent-security-copilot/agent-build-page.png" alt-text="Screenshot of the Security Copilot Build page with the Start from scratch option highlighted." lightbox="./media/build-agent-security-copilot/agent-build-page.png":::


1. Configure the agent, providing the following details:

    + **Agent display name:** Enter `IdentityDrift-Investigation-Agent`

    + **Agent description:** Provide a brief description, for example, *Investigate identity risk by correlating authentication signals, access telemetry, endpoint activity, and security alerts*

   :::image type="content" source="./media/build-agent-security-copilot/agent-details-name-description.png" alt-text="Screenshot of the agent details page showing the display name and description fields." lightbox="./media/build-agent-security-copilot/agent-details-name-description.png":::

1. Agent instructions define how the agent behaves. Copy the following instructions and paste them into the **Instructions** field.
   ```
   1. UserPrincipalName Input
 
   Ensure to use the UserPrincipalName input throughout the analysis.
    
   2. Global Query Rule (MANDATORY)
   
   Every query MUST filter to the last 24 hours:
   
   | where TimeGenerated > ago(24h)
   
   Never use 7 days, 30 days, or "all time." Always 24h. To avoid oversized responses, summarize and limit outputs (do not return raw     event dumps).
   
   3. Query Data Lake for CommonSecurity_ID_KQL_CL
   
   IMPORTANT:
   
   - Do NOT assume the existence of any specific columns such as Action, EventType, or Application
   - Use only columns that exist in the query result
   - Prefer the following safe fields when available:
     - TimeGenerated
     - SourceUserName
     - SourceIP
     - DestinationHostName
     - AdditionalExtensions
     - DeviceCustomString1
   
   Search commonsecurity_ID_KQL_CL table records for events that match the provided user input (use SourceUserName as the identifier).
   
   Sample KQL Query (replace {{UserPrincipalName}}):
   
   CommonSecurity_ID_KQL_CL
   | where TimeGenerated > ago(24h)
       and SourceUserName has '{{UserPrincipalName}}'
   | summarize
       TotalEvents=count(),
       MFA_Approved=countif(DeviceCustomString1 has "Approved"),
       PrivilegedActions=countif(DeviceCustomString1 has "Privilege"),
       SensitiveAccess=countif(DeviceCustomString1 has "Sensitive"),
       Activities=makeset(AdditionalExtensions),
       TargetResources=makeset(DestinationHostName),
       IPs=makeset(SourceIP)
       by SourceUserName
   
   4. Query Data Lake SigninLogs_KQL_CL Table
   
   - Same user input
   - Filter last 24 hours
   - Extract:
     - Sign-in success vs failure
     - IP diversity
     - Result descriptions
   
   5. Query Data Lake AADRiskyUsers_KQL_CL Table
   
   - Same user input
   - Filter last 24 hours
   - Extract:
     - RiskLevel
     - RiskState
     - RiskLastUpdatedDateTime
   
   6. Query Data Lake DeviceProcessEvents_KQL_CL Table
   
   - Same user input
   - Filter last 24 hours
   - Identify suspicious post-authentication activity
   
   Guidance:
   
   - Remove domain from UPN to derive AccountName
   - Look for LOLBins in FileName column 
     - powershell.exe
     - cmd.exe
     - kubectl.exe
     - az.exe
   
   7. Query Microsoft Defender for Cloud SecurityAlert Table
   
   Query SecurityAlert to identify confirmed runtime threats related to Kubernetes or cloud workloads that may correlate with identity activity.
   
   - Alerts generated by Microsoft Defender for Cloud Kubernetes‑related alert types such as:
     - K8S.NODE_MalwareBlocked
     - K8S.NODE_DriftBlocked
   
   Guidance:
   
   - Filter to last 24 hours
   - Do NOT expect user identity fields in SecurityAlert
   - Extract:
     - AlertType
     - AlertSeverity
     - CompromisedEntity (ClusterName)
     - Context from ExtendedProperties
   
   8. Correlation & Reasoning
   
   Use the Sentinel Data Exploration MCP tool to correlate activity between CommonSecurity_ID_KQL_CL , SigninLogs_KQL_CL, AADRiskyUsers_KQL_CL,    DeviceProcessEvents_KQL_CL and SecurityAlert_KQL_CL
   
   Match overlapping:
   
   - User identifiers
   - IP addresses
   - Device names
   - Authentication privilege escalation
   - Suspicious endpoint execution post authentication compromise
   
   9. Surface Key Insights
   
   Identify:
   
   - Risky sign-ins followed by privileged access
   - Unexpected MFA approvals
   - Access to vulnerable or high-value workloads
   - Privilege escalation preceding endpoint activity and Kubernetes control‑plane actions
   - Suspicious endpoint or Kubernetes tooling execution
   - Defender for Cloud alerts occurring after identity or control‑plane activity
   
   10. Provide Summary Findings
   
   Summarize:
   
   - MFA outcomes
   - Sign-in success vs failure trends
   - Identity risk posture
   - Privileged access highlights
   - Endpoint execution signals
   - Defender for Cloud security alerts and their timing
   
   Highlight discrepancies or noteworthy observations across identity, access, and endpoint telemetry.
   
   ### Sample Automation Flow (Short Version)
   
   1. Query **CommonSecurity_ID_KQL_CL** for identity access context
   2. Query **SigninLogs_KQL_CL** and **AADRiskyUsers_KQL_CL** for authentication and risk posture
   3. Query **DeviceProcessEvents_KQL_CL** for endpoint behavior
   4. Query **SecurityAlert_KQL_CL** for Defender for Cloud runtime threats
   5. Correlate all signals using Sentinel MCP and surface actionable security insights   
   ```
   


1. Open the **Inputs** section and select **Add input**.

1. Define `UserPrincipalName` as the input for the user identity you're investigating.

   :::image type="content" source="./media/build-agent-security-copilot/agent-instructions-inputs.png" alt-text="Screenshot of the agent configuration page showing the instructions field and the UserPrincipalName input defined." lightbox="./media/build-agent-security-copilot/agent-instructions-inputs.png":::


1. Open the **Tools** section, select **Add tool**.
1. Select the following **Sentinel MCP** skills and the **IdentityDrift-Investigation-Agent**:

   - List Sentinel Workspaces
   - Semantic search on table catalog
   - Execute KQL (Kusto Query Language) query
   - IdentityDrift-Investigation-Agent

1. Select **Add selected** to confirm your tool selection.

   :::image type="content" source="./media/build-agent-security-copilot/agent-add-tools-dialog.png" alt-text="Screenshot of the Add a tool dialog with the Sentinel MCP skills and IdentityDrift-Investigation-Agent selected." lightbox="./media/build-agent-security-copilot/agent-add-tools-dialog.png":::

1. Select **Publish** and select the appropriate **scope**:
   - **Myself** – Agent is available only to you
   - **Everyone in my workspace** – Agent is shared with all workspace members

   :::image type="content" source="./media/build-agent-security-copilot/agent-configuration-publish.png" alt-text="Screenshot of the completed agent configuration page with instructions, inputs, and tools configured, and the Publish button highlighted." lightbox="./media/build-agent-security-copilot/agent-configuration-publish.png":::

## Set up the IdentityDrift Investigation Agent

1. In your Security Copilot workspace, navigate to **Agents**
1. Locate and select **IdentityDrift-Investigation-Agent**.
1. Select **Setup** and complete the sign-in to finish the agent setup.

   :::image type="content" source="./media/build-agent-security-copilot/agent-ready-for-setup.png" alt-text="Screenshot of the Security Copilot Agents page showing the IdentityDrift-Investigation-Agent ready for setup." lightbox="./media/build-agent-security-copilot/agent-ready-for-setup.png":::


### Run the IdentityDrift Investigation Agent

To run the agent, select **Run**, then select **One time**, and enter the **UserPrincipalName** to investigate.

Based on sample data from [Ingest Data to Microsoft Sentinel Data Lake](./ingest-sample-data.md), enter the username: *u1291@contoso.onmicrosoft.com* to run the agent.

:::image type="content" source="./media/build-agent-security-copilot/agent-run-one-time.png" alt-text="Screenshot of the agent page with the Run dropdown open and the One time option highlighted." lightbox="./media/build-agent-security-copilot/agent-run-one-time.png":::

The following images show the results of the agent run, including the Identity Access Context, Authentication and Risk Posture, Correlation and Insights, Summary Findings, Noteworthy Observations, and Actionable Recommendations.

:::image type="content" source="./media/build-agent-security-copilot/agent-run-results-identity-access.png" alt-text="Screenshot of the agent run results showing the Identity Access Context and Authentication and Risk Posture sections." lightbox="./media/build-agent-security-copilot/agent-run-results-identity-access.png":::

:::image type="content" source="./media/build-agent-security-copilot/agent-run-results-correlation-insights.png" alt-text="Screenshot of the agent run results showing the Correlation and Insights and Summary Findings sections." lightbox="./media/build-agent-security-copilot/agent-run-results-correlation-insights.png":::

:::image type="content" source="./media/build-agent-security-copilot/agent-run-results-summary-recommendations.png" alt-text="Screenshot of the agent run results showing the Noteworthy Observations and Actionable Recommendation sections." lightbox="./media/build-agent-security-copilot/agent-run-results-summary-recommendations.png":::


## Related content

- [Create and manage Security Copilot workspaces](/copilot/security/manage-workspaces)
- [Build an agent in Security Copilot](/copilot/security/developer/create-agent-dev)

> [!div class="nextstepaction"]
> Continue to [Publish your agent to the Security Store](publish-agent-to-security-store.md)
