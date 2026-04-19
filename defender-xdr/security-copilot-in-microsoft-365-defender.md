---
title: Microsoft Security Copilot and Chat in Microsoft Defender
description: Learn about Microsoft Security Copilot capabilities embedded in Microsoft Defender. Chat with your security data in natural language and get AI-powered insights, summaries, and recommendations to help you investigate and respond to threats faster and more effectively.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.topic: article
ms.update-cycle: 180-days
ms.date: 04/08/2026

#customer intent: As an IT admin, I want to learn about Microsoft Security Copilot capabilities embedded in Microsoft Defender so that I can use them to perform my security tasks efficiently.
#customer intent: As a security analyst, I want to learn about Microsoft Security Copilot capabilities embedded in Microsoft Defender so that I can use them to perform my security tasks efficiently.
---

# Microsoft Security Copilot and Chat in Microsoft Defender

This article provides an overview for users of Microsoft Security Copilot in Microsoft Defender, including steps to access, key capabilities, and links to the details of these capabilities.

## Know before you begin

If you're new to Security Copilot, you should familiarize yourself with it by reading the following articles:

- [What is Security Copilot?](/security-copilot/microsoft-security-copilot)
- [Security Copilot experiences](/security-copilot/experiences-security-copilot)
- [Get started with Security Copilot](/security-copilot/get-started-security-copilot)
- [Understand authentication in Security Copilot](/security-copilot/authentication)
- [Prompting in Security Copilot](/security-copilot/prompting-security-copilot)
- [Responsible AI FAQs](responsible-ai-copilot-defender.md)

## Microsoft Security Copilot integration in Microsoft Defender

[Microsoft Security Copilot](/security-copilot/microsoft-security-copilot) brings together the power of AI and human expertise to help security teams respond to attacks faster and more effectively.
You can access Copilot in two ways:

- Security Copilot is embedded in the Microsoft Defender portal to help provide security teams with enhanced capabilities to investigate and respond to incidents, hunt for threats, and protect their organization with relevant threat intelligence.
- Defender Chat experience (preview) is an open prompt chat assistant built into Microsoft Defender. It helps SOC analysts investigate threats, explore incidents, and answer security questions in plain language, without needing to navigate multiple screens or write complex queries.

Both Copilot in Defender and the Defender Chat experiences operate using [Microsoft's AI principles](https://www.microsoft.com/ai/responsible-ai). For more information, see the [Responsible AI FAQs](responsible-ai-copilot-defender.md).

### [Defender Chat experience (preview)](#tab/defender-chat)

## Get Started

To open the Defender chat experience from anywhere in the Defender portal, select the **Copilot** button in the top navigation bar. The chat panel slides open on the right side of the screen and stays in context while you continue working. A welcome screen appears with a greeting and an input field ready for your first question.

:::image type="content" source="./media/security-copilot-in-microsoft-365-defender/open-chat.png" alt-text="Screenshot of the Defender Chat welcome screen and the Copilot icon selected in the top right corner.":::

To close the panel, select **Close** in the header or select the Copilot button again. Your conversation is preserved and you can reopen the panel and pick up where you left off.

## Page Context Awareness

Defender Chat responds based on the page you're currently viewing in the Defender portal and can answer questions based on that context.

If you ask a question such as "Which users are involved in *this* incident?",  the chat understands which incident, alert, device, or entity you're referring to based on your current page without having to need to provide IDs or names.

## Chat conversation capabilities

### Interactive conversations

The chat remembers the full context of your conversation, so you can ask follow-up questions naturally. For example, you can start with *Show me high-severity incidents from the past week*, then follow up with *Tell me more about the first one*, and the chat understands what you mean.

### Step-by-Step Plans

For complex or multi-step requests, the chat might first present a proposed plan outlining the steps it intends to take. You can Approve or Reject the plan before any actions are taken. This keeps you in control, especially for investigations that require multiple data lookups.

For example: If you ask *Investigate incident 12345 and summarize the key findings*, the chat might propose the following plan:

1. Retrieve incident details
1. Fetch associated alerts
1. Collect evidence and impacted entities
1. Summarize findings

Once approved, the chat executes each step and shows its progress in real time.

### Clarifying Questions

If your request is ambiguous, the chat might ask a clarifying question and offer quick-select options (up to four suggestions) to help you get to the right answer faster. Select an option or type your own response.

### Conversation History

Your conversations are saved automatically. Use the Conversations panel on the left side of the chat to:

- Resume a previous conversation
- Start a new session
- Delete a conversation
- Clear all conversations

> [!NOTE]
>
> Conversations are stored locally in your browser. They aren't synced across devices or shared with other users.

### Working with Responses

Responses are formatted with structured tables, bullet points, and section headers for readability. You can:

- Copy a response: Select the *copy* icon on any message to copy it to your clipboard
- Export tables: Select *Export* on any table to export it to Excel for further analysis
- Stop generation: Select *Stop* to interrupt a response that's is taking too long or heading in the wrong direction
- Retry: If something goes wrong, select *Retry* to attempt the response again

### [Security Copilot](#tab/copilot-in-defender)

## Key features

- Embedded chat capability enabling conversation and steering
- Context-aware answers across investigation incidents, alerts, identities, devices, IPs and evidence
- Follow-up questions for clarification

### Investigate and respond to incidents like an expert

These AI tools enable security teams to tackle attack investigations in a timely manner with ease and precision. They can understand attacks immediately, quickly analyze suspicious files and scripts, and promptly assess and apply appropriate mitigation to stop and contain attacks.

#### Summarize incidents quickly

Investigating incidents with multiple alerts can be a daunting task. To immediately understand an incident, you can tap Copilot to [summarize an incident](security-copilot-m365d-incident-summary.md) for you. Copilot creates an overview of the attack. The overview contains essential information for you to understand what transpired in the attack, what assets are involved, and the timeline of the attack. Copilot automatically creates a summary when you navigate to an incident's page. It also helps you understand the assets involved and how to act by suggesting prompts about related identities, devices, IPs, and so on.

:::image type="content" source="media/copilot-in-defender/incident-summary/copilot-defender-incident-summary.png" alt-text="Screenshot of the incident summary card on the Copilot pane as seen in the Microsoft Defender incident page." lightbox="media/copilot-in-defender/incident-summary/copilot-defender-incident-summary.png":::

#### Take action on incidents through guided responses

Resolving incidents require analysts to have an understanding of an attack to know what solutions are appropriate. Copilot recommends solutions through [guided responses](security-copilot-m365d-guided-response.md) that are specific to each incident.

:::image type="content" source="media/copilot-in-defender/guided-response/copilot-defender-guided-response-small.png" alt-text="Screenshot highlighting the Copilot pane with the guided responses in the Microsoft Defender incident page." lightbox="media/copilot-in-defender/guided-response/copilot-defender-guided-response.png":::

#### Run script analysis with ease

Most attackers rely on sophisticated malware when launching attacks to avoid detection and analysis. These malware are usually obfuscated, and might be in the form of scripts or command lines in PowerShell. Copilot can quickly [analyze scripts](security-copilot-m365d-script-analysis.md), reducing the time for investigation.

:::image type="content" source="media/copilot-in-defender/script-analyzer/copilot-defender-script-analysis-incident-small.png" alt-text="Screenshot highlighting the script analysis button in the attack story view in the incident page." lightbox="media/copilot-in-defender/script-analyzer/copilot-defender-script-analysis-incident.png":::

#### Generate device summaries

Investigating devices involved in incidents can be a tasking job. To quickly assess a device, Copilot can [summarize a device's information](copilot-in-defender-device-summary.md), including the device's security posture, any unusual behaviors, a list of vulnerable software, and relevant Microsoft Intune information.

:::image type="content" source="media/copilot-in-defender/device-summary/copilot-defender-device-summary-device-page-small.png" alt-text="Screenshot of the device summary results in Copilot in Defender." lightbox="media/copilot-in-defender/device-summary/copilot-defender-device-summary-device-page.png":::

#### Analyze files promptly

Copilot helps security teams quickly assess and understand suspicious files with [file analysis](copilot-in-defender-file-analysis.md). Copilot provides a file's summary, including detection information, related file certificates, a list of API calls, and strings found in the file.

:::image type="content" source="media/copilot-in-defender/file-analysis/copilot-defender-file-analysis-hide-small.png" alt-text="Screenshot of the file analysis results in Copilot in Defender with the Hide details option highlighted." lightbox="media/copilot-in-defender/file-analysis/copilot-defender-file-analysis-hide.png":::

#### Investigate identities immediately

Quickly assess a user's risk by generating an [identity summary](security-copilot-defender-identity-summary.md) with Copilot. Identify when an identity is at risk or suspicious with contextualized information about a user's role and role changes, sign in behaviors, devices signed in to, and relevant contact information.

:::image type="content" source="media/copilot-in-defender/identity-summary/identity-incident-graph-small.png" alt-text="Screenshot showing the Summarize option in the user details pane." lightbox="media/copilot-in-defender/identity-summary/identity-incident-graph.png":::

#### Write incident reports efficiently

Security operations teams usually write reports to record important information, including what response actions were taken and the corresponding results, the team members involved, and other information to aid future security decisions and learning. Documenting incidents can be time-consuming. An effective incident report must contain an incident's summary along with the actions taken, including who took what actions and when. Copilot [generates an incident report](security-copilot-m365d-create-incident-report.md) by quickly consolidating these pieces of information.

:::image type="content" source="media/copilot-in-defender/create-report/incident-report-main1-small.png" alt-text="Screenshot of the incident report card in the incident page showing the top half of the card." lightbox="media/copilot-in-defender/create-report/incident-report-main1.png":::

### Hunt like a pro

Copilot in Defender helps security teams proactively hunt for threats in their network by quickly building appropriate KQL queries.

Security teams who use advanced hunting to proactively hunt for threats in their network can now use a query assistant that converts any natural-language question, in the context of threat hunting, into a ready-to-run KQL query. The query assistant saves security teams time by generating a KQL query that can then be automatically run or further tweaked according to the analyst needs. Read more about [Query assistant](advanced-hunting-security-copilot-query-assistant.md).

:::image type="content" source="/defender/media/advanced-hunting-security-copilot-pane.png" alt-text="Screenshot of the Copilot pane in advanced hunting." lightbox="/defender/media/advanced-hunting-security-copilot-pane-big.png":::

### Protect your organization with relevant threat intelligence

Empower your security organization to make informed decisions with the latest threat intelligence. Copilot consolidates and summarizes threat intelligence to help security teams prioritize and respond to threats effectively.

#### Monitor threat intelligence

Ask Copilot to summarize the relevant threats impacting your environment, to prioritize resolving threats based on your exposure levels, or to find threat actors that might be targeting your industry. Read more about [Security Copilot in threat intelligence](/defender/threat-intelligence/using-copilot-threat-intelligence-defender-xdr).

:::image type="content" source="./media/security-copilot-in-microsoft-365-defender/copilot-defender-threat-intel-small.png" alt-text="Screenshot of the Copilot pane in threat intelligence in Defender." lightbox="./media/security-copilot-in-microsoft-365-defender/copilot-defender-threat-intel-full.png":::

<a name='access-security-copilot-in-microsoft-365-defender'></a>

## Access Copilot in Defender

To ensure that you have access to Copilot in Defender, see the [Security Copilot purchase and licensing information](/security-copilot/faq-security-copilot). Once you have access to Security Copilot, the key features become available in the Microsoft Defender portal.

## Sample prompts in Copilot

In the Microsoft Defender portal, you can find sample prompts to help you navigate and use some Copilot capabilities. The prompts are designed to help you understand these capabilities and how to use them effectively. Here are some examples of prompts you might see in the portal:

Advanced hunting prompts:

:::image type="content" source="./media/security-copilot-in-microsoft-365-defender/sample-prompt-adv-hunting-small.png" alt-text="Screenshot highlighting the Copilot prompts in the advanced hunting page." lightbox="./media/security-copilot-in-microsoft-365-defender/sample-prompt-adv-hunting.png":::

Threat intelligence prompts:

:::image type="content" source="./media/security-copilot-in-microsoft-365-defender/sample-prompt-threat-intel-small.png" alt-text="Screenshot highlighting the Copilot prompts in the threat intelligence page." lightbox="./media/security-copilot-in-microsoft-365-defender/sample-prompt-threat-intel.png":::

You can extend your investigation in the Security Copilot standalone portal using natural language prompts. The following are sample prompts that you can type in the prompt bar to help you summarize an incident with recommendations:

- Type **Summarize incident {incident number} and conclude with a set of recommendations** to generate the incident summary and recommendations.
- Type **What can you tell me about the reputation of the indicators in the script? Are they malicious? If so, why?** to analyze the script and generate details about the script.

Prompting in Copilot helps you navigate and use the capabilities effectively. You can also use the prompt bar to generate KQL queries, summarize incidents, and analyze files. See tips to create effective prompts in [effective prompting](/copilot/security/prompting-tips). You can also use prebuilt promptbooks to help you get started with Copilot. To learn more about promptbooks, see [promptbooks in Copilot](/copilot/security/using-promptbooks).

---

## Provide feedback

All Copilot in Defender capabilities have an option for providing feedback. Reviewing and [providing feedback](/security-copilot/rai-faqs-security-copilot#what-are-the-limitations-of-security-copilot-how-can-users-minimize-the-impact-of-security-copilots-limitations-when-using-the-system) about the results helps improve future responses. To provide feedback, perform the following steps:

In Copilot:

1. Select the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards.](media/copilot-in-defender/copilot-defender-feedback.png) located at the bottom of any results card in the Copilot side panel.
2. Select **Looks right** if you deem the results accurate. You can provide more information in the next dialog box.
3. Select **Needs improvement** if you assessed the result as lacking or incomplete. You can provide more information about your assessment in the next dialog box and submit this assessment to Microsoft.
4. You can also report the results if it contains questionable or ambiguous information by selecting **Inappropriate**. Provide more information about the results in the next dialog box and select Submit.

In Defender Chat experience:

Use the 👍 / 👎 buttons on any response.

## Privacy and data security

Copilot continuously evolves using [data](/security-copilot/privacy-data-security#customer-data-and-system-generated-logs) that is [stored](/security-copilot/privacy-data-security#customer-data-storage-location), [processed](/security-copilot/privacy-data-security#location-for-prompt-evaluation), and [shared](/security-copilot/privacy-data-security#customer-data-sharing-preferences) depending on the settings defined by your administrator. Microsoft ensures that your data is always protected and secure when using Copilot. To learn more about data security and privacy in Copilot, see [Privacy and data security in Copilot](/security-copilot/privacy-data-security).

<a name='microsoft-365-defender-plugin-in-security-copilot'></a>

## Plugins in Security Copilot

Copilot uses [preinstalled Microsoft plugins](/security-copilot/manage-plugins#preinstalled-plugins) like Microsoft Defender, Defender Threat Intelligence, and Natural Language to KQL for Microsoft Sentinel and Defender plugins to generate relevant information, provide more context to incidents, and generate more accurate results. Ensure that [plugins are turned on in Copilot](/security-copilot/manage-plugins#managing-preinstalled-plugins) to allow access to relevant data and to generate requested content from other Microsoft services in your organization.

## Next steps

- [Learn how to summarize incidents](security-copilot-m365d-incident-summary.md)
- [Use guided responses when responding to incidents](security-copilot-m365d-guided-response.md)
- [Run script analysis](security-copilot-m365d-script-analysis.md)
- [Analyze files](copilot-in-defender-file-analysis.md)
- [Generate device summaries](copilot-in-defender-device-summary.md)
- [Generate identity summaries](security-copilot-defender-identity-summary.md)
- [Generate KQL queries](advanced-hunting-security-copilot.md)
- [Create incident reports](security-copilot-m365d-create-incident-report.md)
- [Use threat intelligence](/defender/threat-intelligence/security-copilot-and-defender-threat-intelligence)

## See also

- [Get started with Security Copilot](/security-copilot/get-started-security-copilot)
- [Privacy and data security in Copilot](/security-copilot/privacy-data-security)
- [Security Copilot Responsible AI FAQs](/security-copilot/responsible-ai-overview-security-copilot)
- Other [Security Copilot embedded experiences](/security-copilot/experiences-security-copilot)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
