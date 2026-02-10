---
title: Alert Triage Agent frequently asked questions
description: Get answers to common questions about the Alert Triage Agent in Microsoft Defender, including setup, operation, trust, and capacity planning.
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
ms.topic: faq
search.appverid:
- MOE150
- MET150
ms.date: 01/25/2026
appliesto:
- Microsoft Defender XDR
#customer intent: As a security professional, I want to understand common questions about the Alert Triage Agent so that I can make informed decisions about implementing and using it.
---

# Alert Triage Agent frequently asked questions

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article provides answers to commonly asked questions about the Alert Triage Agent. For information about the agent's capabilities and requirements, see [Alert Triage Agent overview](alert-triage-agent-overview.md) and [permissions and prerequisites](alert-triage-agent-prerequisites.md).

## General information

### When is the agent triggered?

The agent automatically runs when a relevant alert is created. For example, the Alert Triage Agent triggers when a user reports a potential threat or when supported alert types are generated in your environment.

### Why are Alert Triage Agents important?

Security alerts often arrive in high volume, overwhelming analysts with repetitive investigations—many of which turn out to be false positives. This manual triage can consume significant time, sometimes up to 30 minutes per alert. By automating classification, prioritization, and enrichment, the Alert Triage Agent reduces analyst fatigue and frees up time for higher-impact investigations and proactive security work.

### Can the Alert Triage Agent be trusted?

Microsoft AI agents follow strict Responsible AI guidelines and undergo thorough reviews to ensure compliance with all AI standards and safeguards. The Alert Triage Agent is fully incorporated into these controls. During setup, you assign the agent an identity and configure it with the minimum permissions required for its operation, ensuring that it doesn't have unnecessary permissions. All agent activities are logged in detail, with the complete flow available for review by analysts and admins at any time. Feedback provided to the agent to help it adapt to the organization's environment is logged, reflected in the system, and accessible for review and modification by admins as needed.

### How does the agent differ from a standard SOAR solution?

While both SOAR solutions and the Alert Triage Agent aim to automate aspects of security operations, their approaches are fundamentally different. SOAR tools rely on static, policy- and rule-based workflows that require predefined logic and manual tuning. In contrast, the agent uses recursive reasoning to autonomously complete tasks—learning, adapting, and improving over time.

The agent doesn't need to be reprogrammed for every new situation. Within defined boundaries, it adjusts to the task at hand, making it far more flexible than traditional automation. Rather than being rigid and reactive, it continuously evolves with your environment and threat landscape, guided by analyst feedback and grounded in real data. Purpose-built for security teams, the Alert Triage Agent helps accelerate responses and reduce manual workloads, freeing up analysts to focus on strategic initiatives.

### What level of visibility and control do I have over the agent?

Microsoft provides tools for organizations to maintain visibility into and control over the Alert Triage Agent from deployment through ongoing operations. [The agents adhere to Microsoft's Responsible AI (RAI) standards](/copilot/security/rai-faqs-security-copilot-agents) for fairness, reliability, safety, privacy, security, inclusiveness, transparency, and accountability.

Administrators configure the agent's identity and access levels during installation, following least-privilege principles. Security and IT teams can authorize specific actions, monitor performance, and review outputs directly in Microsoft Defender. Capacity consumption and data access limits are also configurable by administrators.

The Alert Triage Agent operates within a zero-trust environment. The system enforces organizational policies on every agent action by evaluating the intent and scope of each operation. All decisions, reasoning, and actions taken by the agent are transparently documented as a decision tree within Defender and recorded in Microsoft Purview audit logs for traceability and compliance.

## Setup and configuration

### I want to try an Alert Triage Agent - how do I set it up in Microsoft Defender?

To set up the agent, you must have access to **Security Copilot in Microsoft Defender** and meet the necessary [prerequisites](alert-triage-agent-prerequisites.md). If you haven't onboarded to Security Copilot, see [Get started with Security Copilot](/copilot/security/get-started-security-copilot) or contact your Microsoft representative. After you've onboarded to Security Copilot, it can take a bit of time for the agent setup option to become available in the Microsoft Defender portal.

For detailed setup instructions, see [Set up the Alert Triage Agent](alert-triage-agent-setup.md).

### What happens if I haven't configured all the prerequisites?

The agent requires specific configurations to function properly. If prerequisites like URBAC settings, user reported settings, or alert policies aren't configured, the agent may not be able to process alerts effectively or may not trigger at all. Review the [prerequisites](alert-triage-agent-prerequisites.md) carefully and ensure all requirements are met before setup.

### Can I change the agent's identity after setup?

Yes, you can change the agent's identity after the initial setup. Navigate to the agent management page and select the option to edit the agent's identity and role. For detailed steps, see [Change the agent's identity and role](alert-triage-agent-management.md#change-the-agents-identity-and-role).

### What permissions does the agent need, and why?

The agent needs specific permissions to access and analyze security data:
- **Security data basics (read)**: Access basic security data like alerts and incidents
- **Alerts (manage)**: Classify alerts and monitor alert states
- **Security Copilot (read)**: Access Security Copilot capabilities
- **Email & collaboration metadata/content (read)**: Access reported email content for analysis

These permissions follow the principle of least privilege and are scoped only to the data sources the agent needs to analyze. For more details, see [Phishing Triage Agent required permissions](alert-triage-agent-prerequisites.md#phishing-triage-agent-required-permissions).

## Capacity and usage

### I've tried an Alert Triage Agent - how can I estimate the SCU capacity needed for the agent in my organization?

After setup, the agent automatically starts consuming SCUs provisioned for the workspace when the trial period ends.

It's important to ensure that your organization has sufficient SCUs for healthy agent operation. To evaluate SCU usage and plan capacity going forward, see the [Usage monitoring dashboard in the Security Copilot portal](https://securitycopilot.microsoft.com/usage-monitoring) and check whether you're entitled to SCUs as part of the [Microsoft Security Copilot inclusion model](/copilot/security/security-copilot-inclusion). The dashboard shows:

- **Cost per alert processed**
- **Capacity consumption over time**

You can also export the dashboard data into Excel for more detailed analysis, and to filter on agent operations only.

After evaluating your SCU usage needs, update the SCU capacity for your organization. For more information about managing SCUs, see [Manage security compute unit usage in Security Copilot](/copilot/security/manage-usage).

### What factors affect SCU consumption?

SCU consumption depends on several factors:
- **Alert volume**: More alerts processed means higher SCU consumption
- **Alert complexity**: Complex alerts requiring more analysis consume more SCUs
- **Feedback processing**: Teaching the agent through feedback consumes additional SCUs
- **Organizational context**: Larger amounts of organizational data to consider may increase processing requirements

Monitor your usage through the Security Copilot portal to understand your specific consumption patterns.

## Operation and management

### How do I know the agent is working correctly?

You can verify the agent is operating correctly by:
- Checking the agent status in **Security Copilot > Agents**
- Monitoring the incident queue for agent-tagged incidents
- Reviewing agent metrics and activity on the Alert Triage Agent dashboard
- Observing agent classifications and reasoning in processed incidents

For detailed monitoring instructions, see [Monitor agent performance](alert-triage-agent-management.md#monitor-agent-performance).

### What should I do if the agent makes incorrect classifications?

If the agent makes incorrect classifications, you can:
1. Provide feedback through the incident interface to teach the agent your organization's preferences
2. Review and adjust the feedback to ensure it aligns with your security policies
3. Monitor feedback effectiveness through the feedback management page
4. Consider adjusting the agent's training based on patterns in incorrect classifications

For guidance on providing effective feedback, see [Best practices for writing feedback](alert-triage-agent-usage.md#best-practices-for-writing-feedback).

### Can I pause or disable the agent temporarily?

Yes, you can pause the agent's operations at any time. Navigate to the Alert Triage Agent page and select **Pause**. When paused, the agent stops processing new alerts but retains all existing data and settings. Select **Run** to resume operations. For more details, see [Pause and resume agent operations](alert-triage-agent-management.md#pause-and-resume-agent-operations).

### What happens to my data if I remove the agent?

When you remove the agent:
- Triage and classification of new incidents stops
- All feedback and lessons stored in the agent's memory are deleted
- Previously triaged incidents and their history are retained for reference
- Agent identity and permissions are removed

This action cannot be undone, so ensure you want to permanently remove the agent before proceeding.

## Troubleshooting

### The agent isn't processing alerts in my environment. What should I check?

If the agent isn't processing alerts, verify:
1. All [prerequisites](alert-triage-agent-prerequisites.md) are properly configured
2. The agent has the required permissions and they're correctly assigned
3. The agent identity hasn't expired (for user accounts)
4. URBAC is activated for the relevant workloads
5. Alert policies for supported alert types are enabled
6. The agent status shows as "Running" rather than "Paused"

### I'm getting feedback failures when trying to teach the agent. How do I resolve this?

Feedback failures can occur for several reasons:
- **Irrelevant feedback**: The feedback doesn't relate to supported features
- **Conflicting feedback**: New feedback conflicts with existing lessons
- **Unsupported content**: The feedback contains elements the agent cannot process

For specific resolution steps, see [Resolve feedback failures](alert-triage-agent-usage.md#resolve-feedback-failures).

### How do I get support for agent-related issues?

For support with Alert Triage Agent issues:
1. Review the troubleshooting guidance in this FAQ and related documentation
2. Check the agent's activity logs and error messages in the Defender portal
3. Contact Microsoft support through your standard support channels
4. Provide specific details about the issue, including agent configuration and error messages

## Next steps

- [Get started with Alert Triage Agent overview](alert-triage-agent-overview.md)
- [Review prerequisites and permissions](alert-triage-agent-prerequisites.md)
- [Set up the Alert Triage Agent](alert-triage-agent-setup.md)

## Related content

- [Microsoft Security Copilot agents](/copilot/security/agents-overview)
- [Responsible AI FAQs for Security Copilot Agent](/copilot/security/rai-faqs-security-copilot-agents)
- [Security Copilot agents in Microsoft Defender](security-copilot-agents-defender.md)