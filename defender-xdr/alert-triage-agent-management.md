---
title: Monitor and manage the Alert Triage Agent
description: Learn how to monitor agent performance, manage settings, and view feedback for the Alert Triage Agent in Microsoft Defender.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- magic-ai-copilot 
ms.topic: how-to
search.appverid:
- MOE150
- MET150
ms.date: 01/25/2026
appliesto:
- Microsoft Defender XDR
#customer intent: As a security administrator, I want to monitor and manage the Alert Triage Agent so that I can ensure it's operating effectively and make necessary configuration changes.
---

# Monitor and manage the Alert Triage Agent

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Once the Alert Triage Agent is deployed and active, you can monitor its performance, manage its settings, and review feedback to ensure it continues to operate effectively in your environment. This article covers the tools and processes for ongoing management of the agent.

## Monitor agent performance

To view agent metrics and manage the agent, go to the Alert Triage Agent card in the incident queue or the Agents page:

- To open the **Alert Triage Agent** page directly, select **Security Copilot > Agents**, look for the Alert Triage Agent under **Agents in use** and select **Go to agent**.

   This page consists of two tabs: **Overview** and **Performance**.

   - The **Overview** tab provides details about the agent's current status, identity, role, and recent activity. 

      :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-agent-page-overview.png" alt-text="Screenshot of the Overview tab on the Phishing Triage Agent page." lightbox="/defender/media/agents-in-defender/phishing-triage/phishing-triage-agent-page-overview.png":::

      Select an activity from the **Recent activity** list to view details about the agent's investigation and the agent full workflow.

      :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-agent-activity-details.png" alt-text="Screenshot of the activity details pane that opens from the Phishing Triage Agent page." lightbox="/defender/media/agents-in-defender/phishing-triage/phishing-triage-agent-activity-details.png":::

      Select **See full agent workflow** to view a graphical representation of the agent's decision-making process for that specific activity.

      :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-agent-workflow.png" alt-text="Screenshot of the full agent workflow page that opens from the Phishing Triage Agent page." lightbox="/defender/media/agents-in-defender/phishing-triage/phishing-triage-agent-workflow.png":::

   - The **Performance** tab displays key metrics about the agent's activity over time, including daily activity, mean time to triage (MTTT), and SCU consumption. 

      :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-agent-page.png" alt-text="Screenshot of the Performance tab on the Phishing Triage Agent page." lightbox="/defender/media/agents-in-defender/phishing-triage/phishing-triage-agent-page.png":::

   Select the ellipsis (...) at the top right corner of the page to access management options for the agent, as described in the sections below.

   Select **Pause** or **Run** to temporarily stop or restart the agent's activities.

- To open the Alert Triage Agent card in the incident queue, select **Investigation & response > Incidents & alerts > Incidents** .  

   The Alert Triage Agent card above the incident queue shows some of the agent's key metrics, including: 

   - **Incidents addressed:** Incidents containing user-reported alerts that the agent classified as true threats or false alarms.
   - **Incidents resolved:** Incidents that no longer require further handling, like false alarms.

   This data helps demonstrate the agent's impact and can be used to inform broader strategic conversations, highlight return on investment, or support decisions around scaling automation across your organization.

   Metrics are calculated based on the agent's activity, beginning either from its first recorded incident or from the last 30 days - whichever is more recent.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/incident-queue-with-agent.png" alt-text="Screenshot of the incident queue with the Phishing Triage Agent card highlighted." lightbox="/defender/media/agents-in-defender/phishing-triage/incident-queue-with-agent.png":::

   Select **Manage agent** on the card to open the **Alert Triage Agent** page, which has more performance metrics and management options.

## Manage agent settings

### Change the agent's identity and role

To manage the agent's identity and role: 

1. Select **Security Copilot > Agents**, look for the Alert Triage Agent under **Agents in use** and select **Go to agent**. 
1. Select the **ellipsis (...) > Edit agent** at the top right corner of the page. This opens the **Edit agent** page. 
1. Select **Identity and role > Select a new identity**.
1. Select a new identity, as described in the [Assign the agent's identity and permissions](alert-triage-agent-setup.md#assign-the-agents-identity-and-permissions). 

### Pause and resume agent operations

You can temporarily pause the agent's activities and resume them as needed:

1. Navigate to the Alert Triage Agent page as described above.
1. Select **Pause** to temporarily stop the agent from processing new alerts.
1. Select **Run** to resume agent operations.

When paused, the agent will not process new alerts, but existing incident data remains unchanged.

## View and manage feedback to the agent (Microsoft Defender for Office 365 alerts)

For phishing alerts that come from Microsoft Defender for Office 365 alerts, the Alert Triage Agent learns from user-submitted feedback and improves its performance over time. It stores applicable feedback in its memory as lessons. You can view and manage feedback for the Alert Triage Agent on the **Agent feedback** page.

This page provides a comprehensive list of all feedback submitted to the agent. You can review key details for each piece of feedback, including:

- The agent's original classification and the user-applied change
- The original feedback provided by the user, when changing the classification
- The translated lesson generated by the agent (if applicable)
- Feedback status: in use, not in use, or conflict
- The user who provided the feedback
- Feedback submission date, feedback ID, alert ID, and the incident ID

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-feedback-management.png" alt-text="Screenshot of the Feedback management page" lightbox="/defender/media/agents-in-defender/phishing-triage/phishing-triage-feedback-management.png":::

### Understand feedback statuses

This table explains the feedback statuses:

| Status | Description |
|:---|:---|
| In use | The feedback was successfully converted into a lesson in the agent's memory and is actively used to triage and classify similar incidents. |
| Conflict | The feedback provided conflicted with previously provided feedback in a similar incident. Learn how you can [resolve feedback failures](alert-triage-agent-usage.md#resolve-feedback-failures). |
| Not in use | The feedback was either not incorporated into the agent's memory or not marked by the user for teaching. Rejected lessons appear as "not in use" and are saved only for auditing, not for triaging and classifying incidents. For more details, select the details panel. |

> [!TIP]
> Feedback can only be managed individually. Bulk management of multiple feedback entries isn't currently supported.

### Review and reject feedback

To view and manage user-submitted feedback: 

1. Select **Security Copilot > Agents**, look for the Alert Triage Agent under **Agents in use** and select **Go to agent**. 
1. Select the **ellipsis (...) > Edit agent** at the top right corner of the page. This opens the **Edit agent** page. 
1. Select **Feedback** in the left pane to open the **Agent feedback** page.
1. Select an entry from the feedback list to open the **Review feedback** pane. 
1. Check the details of the feedback provided, the agent's lesson, the classification changes, and other important details. 

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/review-feedback-pane.png" alt-text="Screenshot of the Review feedback pane" lightbox="/defender/media/agents-in-defender/phishing-triage/review-feedback-pane.png":::
1. To reject specific feedback, select **Reject feedback**. The agent stops using the feedback in future triage decisions.

   > [!NOTE]
   > To reject feedback provided, you need the **Security Administrator** role in Microsoft Entra ID.

## Remove the agent

When you remove the agent, triage and classification of new incidents stop, and all feedback is deleted. However, the history of previously triaged incidents is retained for your reference.

To remove the agent: 

1. Select **Security Copilot > Agents**, look for the Alert Triage Agent under **Agents in use** and select **Go to agent**. 
1. Select the ellipsis (...) at the top right corner of the page, and then select **Remove**. 

## Monitor SCU usage and capacity planning

After setup, the agent automatically starts consuming SCUs provisioned for the workspace when the trial period ends. It's important to ensure that your organization has sufficient SCUs for healthy agent operation.

### Evaluate SCU usage

To evaluate SCU usage and plan capacity going forward, see the [Usage monitoring dashboard in the Security Copilot portal](https://securitycopilot.microsoft.com/usage-monitoring) and check whether you're entitled to SCUs as part of the [Microsoft Security Copilot inclusion model](/copilot/security/security-copilot-inclusion). The dashboard shows:

- **Cost per alert processed**
- **Capacity consumption over time**

You can also export the dashboard data into Excel for more detailed analysis, and to filter on agent operations only.

### Manage capacity

After evaluating your SCU usage needs, update the SCU capacity for your organization. For more information about managing SCUs, see [Manage security compute unit usage in Security Copilot](/copilot/security/manage-usage).

## Next steps

- [Review frequently asked questions](alert-triage-agent-faq.md)
- [Learn how to use the agent](alert-triage-agent-usage.md)

## Related content

- [Alert Triage Agent overview](alert-triage-agent-overview.md)
- [Set up the Alert Triage Agent](alert-triage-agent-setup.md)
- [Manage security compute unit usage in Security Copilot](/copilot/security/manage-usage)