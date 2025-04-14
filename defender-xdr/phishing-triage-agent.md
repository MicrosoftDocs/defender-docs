---
title: Phishing Triage Agent in Microsoft Defender
description: Learn about the Phishing Triage Agent, including requirements for setup and providing feedback to the agent.
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
ms.topic: conceptual
search.appverid:
- MOE150
- MET150
ms.date: 04/28/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Defender for Office 365 Plan 2
---

# Phishing Triage Agent in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The Phishing Triage Agent is a Microsoft Security Copilot agent in Microsoft Defender designed to scale security teams' response to efficiently triage and classify user-submitted phishing incidents. It assists security operations center (SOC) teams by integrating with Microsoft security solutions to autonomously triage volumes of phishing submissions, reducing the team's manual workload and allowing them to focus on critical tasks and strategic actions.

Managing a huge volume of phishing incidents, which may include false alarms, can be challenging for SOC operations. Analysts need to ensure that these incidents are triaged and resolved efficiently and reliably so they can concentrate on more critical phishing incidents.

With the Phishing Triage Agent, SOC teams can benefit from an AI-powered virtual agent capable of classifying hundreds of phishing submissions with speed and accuracy. The agent also helps remove false alarms, enabling teams to resolve true positive phishing incidents more swiftly.

Phishing Triage adjusts to an organization’s context by actively seeking feedback and learning from its users. The agent provides a transparent rationale for its verdicts, ensuring its operations align with your organization’s established triage parameters. It dynamically adjusts by learning from the feedback it gets to operate according to your organization’s changing needs.

## Overview

The Phishing Triage Agent is designed to scale your security operations teams' processes in classifying and triaging user-submitted phishing incidents. The agent can help you with the following tasks:

- Autonomously classify hundreds of phishing incidents based on user-submitted emails and attachments.
- Provide a transparent rationale for its classification verdicts, including the reasoning behind its decisions and the evidence it used to arrive at those conclusions.
- Learn from user feedback to improve its classification accuracy over time.
- Operate in the background, continuously triaging phishing incidents without requiring constant human intervention.

### Trigger

The Phishing Triage Agent is triggered when a user in your organization submits a phishing incident. The agent automatically analyzes the submitted email and its attachments to classify them as either phishing or not phishing based on its training and the context of the organization.

### Permissions

The Phishing Triage Agent requires the following permissions to run:

- Security data basics (read)
- Email & collaboration content (read)
- Email & collaboration metadata (read)
- Security Copilot (read)
- Alerts (manage)

### Identity

The Phishing Triage Agent requires an identity to run. You can create the Phishing Triage Agent’s identity to access plugins and services and to operate with the correct permissions.

You can also select the agent’s identity from the following options:

- [options]

### Products

The tenant must have any of the following licenses deployed:

- Microsoft Defender for Office 365 Plan 2
- Microsoft 365 E5

### Plugins

The following plugins must be enabled in Security Copilot:

- Microsoft Defender XDR
- Microsoft Threat Intelligence

### Role-based access

Users with the following roles can view the Phishing Triage Agent's output:

- [options]

## Prerequisites

The following are organizational requirements to run Phishing Triage Agent in your environment:

- Access to Security Copilot. See purchase information to know the prerequisites for using Security Copilot
- Access to the Microsoft Defender portal
- The alert policy **Email reported by user as malware or phish** must be turned on. See Alert policies in the Microsoft Defender portal for more information
- Unified role-based access control (URBAC) must be enabled in your organization. See [Unified role-based access control (URBAC)](manage-rbac.md) for more information.

Users with Security Administrator or Microsoft Entra Administrator roles are required to setup the Phishing Triage Agent.

## Set up the Phishing Triage Agent

To set up the Phishing Triage Agent, follow these steps:

1. Sign in to the Microsoft Defender portal as a Security Administrator and navigate to the incidents queue.
2. Look for the Phishing Triage Agent set up above the queue, then select **Set up agent**.
3. Assign permissions and roles to the agent by selecting **Create an agent identity**, then select Continue.
4. In the Agent identity roles, select a role for the agent. Ensure that the role has the required permissions to view and analyze emails.
5. Select **Deploy agent** to create the agent identity. The agent is created and deployed in the background.

## Review the Phishing Triage Agent output

Users can review the Phishing Triage Agent’s triaged agents, actions taken in an incident, and overall performance in terms of total incidents resolved and mean time to resolve.

### Review triaged incidents

After setting up the Phishing Triage Agent, it will automatically run in the background and begin to triage user-submitted phishing incidents. You can filter the incident queue for incidents with the **Agent** tag to view the incidents triaged by the agent.

[SCREENSHOT]

Select an incident to review. In the incident page, look for the Phishing Triage Agent activity in the Copilot pane.

[SCREENSHOT]

Review the agent’s classification verdict and reason. If the agent’s classification does not align with your parameters, select **Change classification**. To learn more about the agent’s actions before arriving at a classification, select **View agent activity**.

[SCREENSHOT]

### Review the agent's actions

In the **Activity** tab of an incident page, you can view all the actions taken by the agent. You can follow how the agent validates its action per step.

[SCREENSHOT]

Select the final verdict to read about the agent’s reason, investigation details, email preview, and to view other evidence the agent used for its verdict.

[SCREENSHOT]

You can **Change classification** on the final verdict card. Selecting this option opens the Manage alert pane where you can provide the classification and add comments. Tick the **Use this feedback to teach the agent** option to improve the agent’s subsequent responses.

[SCREENSHOT]

### Review the agent's performance

You can review the overall performance of the Phishing Triage Agent by navigating to the **Agents** page in the Microsoft Defender portal. The performance metrics include the total number of incidents triaged by the agent and the mean time to resolve. The numbers displayed are based on the last 30 days of data. Here's an example.

[SCREENSHOT]

## Providing feedback to the Phishing Triage Agent

The Phishing Triage Agent relies on your feedback on its output to continuously improve its triaging activities and adapt to you organization's evolving security needs. We recommend that you regularly provide feedback to the agent to improve to ensure that it adapts to your organization’s specific needs.

There are two ways to provide feedback to the agent:

1. Select the thumbs up/thumbs down options on the Copilot card.
2. You can improve the agent's accuracy by providing feedback whenever you change an incident's classification. See [Review the agent's actions](#review-the-agents-actions) for the steps.

## Frequently asked questions (FAQs)

### How is the Phishing Triage Agent different from Microsoft Defender for Office 365 automated investigation and response (AIR)?

Defender for Office 365 provides built-in automation that helps organizations triage, investigate, remediate, and respond to user reports of phishing and other email and collaboration-related threats. The Phishing Triage agent augments this capability by automating actions expert SOC analysts take to deeply investigate an email reported as potential phishing.  Within minutes, the agent summarizes all findings and provides a final verdict for the message. A further advantage of the agent is its ability to adapt to the customer's environment based on history, customizations, and analyst feedback to enhance automated response to user-reported threats.

When the Phishing Triage Agent is enabled, [automated Investigations and response (AIR) in Defender for Office 365](/defender-office-365/air-about) consumes the agent’s analysis. AIR investigations then expand on the agent’s output to detect similar threats and identify threat remediation actions for SOC analyst to approve. Customers can also enable auto-remediation in AIR to further enhance customer protection and SOC efficiency.

### Can the Phishing Triage Agent handle encrypted emails?

The Phishing Triage Agent follows the same API model as the Microsoft Defender for Office 365. The agent can triage encrypted emails, but it cannot decrypt them. The agent provides a verdict based on the information available in the email header and metadata. If the email is encrypted, the agent isn't able to analyze its content or attachments.

### Does the Phishing Triage Agent store emails?

The agent stores logs of the input and output of its activities, and as part of that it might contain submission artifacts. The agent doesn't store email copy directly.

All the agent's data storage follows Security Copilot privacy and data security policies. See [Privacy and data security in Microsoft Security Copilot](/copilot/security/privacy-data-security) for more information.

### What does the Phishing Triage Agent do with emails that users don't report?

Like an SOC analyst with *Email & collaboration content (read)* permissions, the Phishing Triage Agent can read emails that users don't report. Since all preview or download actions by an SOC analyst are logged and audited in the audit logs, the same applies to the Phishing Triage Agent. The agent will not take any action on emails that are not reported by users unless it is explicitly configured to do so.

### Can we specify the mailboxes scope for the Phishing Triage Agent?

Scoping mailboxes is currently not supported in Defender for Office 365, and therefore not supported for the Phishing Triage Agent. The agent can't scope the mailboxes it can triage, but its analysis is limited to user-reported emails that are part of the alert policy **Email reported by user as malware or phish**.

### Can I still use the Phishing Triage Agent if I'm using third-party reporting tools for user submissions?

You might be able to use the Phishing Triage Agent if the third-party reporting tool is integrated with Microsoft Defender for Office 365. See [Options for third-party reporting tools](/defender-office-365/submissions-user-reported-messages-custom-mailbox#options-for-third-party-reporting-tools) for more information.

### Can I remove the Phishing Triage Agent?

Yes. You can disable the agent or remove it any time using the setup page.

Removing the agent does not revert any changes made to the incidents it triaged. The agent is longer able to triage new incidents, but retains the history of all incidents it triaged.

## Related content

- Microsoft Security Copilot Agents
- Responsible AI in Microsoft Security Copilot