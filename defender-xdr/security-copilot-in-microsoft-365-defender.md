---
title: Microsoft Security Copilot in Microsoft Defender
description: Learn about Microsoft Security Copilot capabilities embedded in Microsoft Defender.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.topic: article
ms.update-cycle: 180-days
ms.date: 01/08/2026
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
#customer intent: As an IT admin, I want to learn about Microsoft Security Copilot capabilities embedded in Microsoft Defender so that I can use them to perform my security tasks efficiently.
#customer intent: As a security analyst, I want to learn about Microsoft Security Copilot capabilities embedded in Microsoft Defender so that I can use them to perform my security tasks efficiently.
---

# Microsoft Security Copilot in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!NOTE]
> Microsoft Defender XDR provides a unified XDR experience for Microsoft Defender for Endpoint, Microsoft Defender for Identity, Microsoft Defender for Office 365, Microsoft Defender for Cloud Apps, and Microsoft Defender for Vulnerability Management. Learn more about this pre- and post-breach defense suite in [What is Microsoft Defender XDR?](microsoft-365-defender.md)

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
You can access Copilot in 2 ways:

- Security Copilot is embedded in the Microsoft Defender portal to help provide security teams with enhanced capabilities to investigate and respond to incidents, hunt for threats, and protect their organization with relevant threat intelligence.
- Defender Chat experience (preview) is an open prompt chat assistant built into Microsoft Defender XDR. It helps SOC analysts investigate threats, explore incidents, and answer security questions in plain language, without needing to navigate multiple screens or write complex queries.

Copilot in Defender and the Defender Chat experience operate using [Microsoft's AI principles](https://www.microsoft.com/ai/responsible-ai). For more information, see the [Responsible AI FAQs](responsible-ai-copilot-defender.md).

### [Security Copilot](#tab/copilot-in-defender)

## Key features

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

Security operations teams usually write reports to record important information, including what response actions were taken and the corresponding results, the team members involved, and other information to aid future security decisions and learning. Oftentimes, documenting incidents can be time-consuming. For an incident report to be effective, it must contain an incident's summary along with the actions taken, including what actions were taken by whom and when. Copilot [generates an incident report](security-copilot-m365d-create-incident-report.md) by quickly consolidating these pieces of information.

:::image type="content" source="media/copilot-in-defender/create-report/incident-report-main1-small.png" alt-text="Screenshot of the incident report card in the incident page showing the top half of the card." lightbox="media/copilot-in-defender/create-report/incident-report-main1.png":::

### Hunt like a pro

Copilot in Defender helps security teams proactively hunt for threats in their network by quickly building appropriate KQL queries.

Security teams who use advanced hunting to proactively hunt for threats in their network can now use a query assistant that converts any natural-language question, in the context of threat hunting, into a ready-to-run KQL query. The query assistant saves security teams time by generating a KQL query that can then be automatically run or further tweaked according to the analyst needs. Read more about [Query assistant](advanced-hunting-security-copilot-query-assistant.md).

:::image type="content" source="/defender/media/advanced-hunting-security-copilot-pane.png" alt-text="Screenshot of the Copilot pane in advanced hunting." lightbox="/defender/media/advanced-hunting-security-copilot-pane-big.png":::

### Protect your organization with relevant threat intelligence

Empower your security organization to make informed decisions with the latest threat intelligence. Copilot consolidates and summarizes threat intelligence to help security teams prioritize and respond to threats effectively.

#### Monitor threat intelligence

Ask Copilot to summarize the relevant threats impacting your environment, to prioritize resolving threats based on your exposure levels, or to find threat actors that might be targeting your industry. Read more about [Security Copilot in threat intelligence](/defender/threat-intelligence/using-copilot-threat-intelligence-defender-xdr).

:::image type="content" source="./media/security-copilot-in-microsoft-365-defender/copilot-defender-threat-intel-small.png" alt-text="Screenshot of the Copilot pane in threat intelligence in Defender XDR." lightbox="./media/security-copilot-in-microsoft-365-defender/copilot-defender-threat-intel-full.png":::

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

### [Defender Chat experience (preview)](#tab/defender-chat)

## Get Started

To open Defender Chat Agent, from anywhere in the Defender XDR portal, select the **Copilot** button in the top navigation bar of Microsoft Defender XDR. The chat panel slides open on the right side of the screen and stays in context while you continue working. A welcome screen appears with a greeting and an input field ready for your first question.

:::image type="content" source="./media/security-copilot-in-microsoft-365-defender/open-chat.png" alt-text="Screenshot of the Defender Chat welcome screen and the Copilot icon selected in the top right corner.":::

To close the panel, click **Close** in the header or click the Copilot button again. Your conversation is preserved and you can reopen the panel and pick up where you left off.

### Supported Investigation Areas

Defender Chat Agent supports questions across the following security domains:

#### Incidents

Ask about specific incidents or query your incident queue.

| Example Prompt                                                           | What You Get                                                          |
|--------------------------------------------------------------------------|-----------------------------------------------------------------------|
| "Tell me about incident 12345"                                           | Full incident details - severity, status, assigned analyst, timeline  |
| "Who are the users involved in this incident?"                           | List of identities associated with the incident                       |
| "What are the MITRE techniques in this incident?"                        | MITRE ATT&CK techniques mapped to the incident's alerts               |
| "Show me high-severity active incidents from the past week"              | Filtered incident queue results                                       |
| "Which incidents involve critical assets?"                               | Incidents tagged with critical asset markers                          |
| "Which day had the most incidents in the last 10 days?"                  | Incident trend analysis                                               |
| "What are the most common attack techniques in current open incidents?"  | Cross-incident technique analysis                                     |

#### Alerts

Get details about specific alerts or alerts linked to an incident.

| Example Prompt                                                           | What You Get                                                          |
|--------------------------------------------------------------------------|-----------------------------------------------------------------------|
| "What alerts are part of incident 789?"                                   | Alert list with IDs, titles, and severities                           |
| "What is the severity and category of this alert?"                        | Alert classification details                                          |
| "Which assets or endpoints are impacted by this alert?"                   | Impacted entities and assets                                          |
| "What MITRE ATT&CK techniques are linked to this alert?"                  | MITRE mappings for the alert                                          |
| "Has the user involved in this alert had any previous suspicious activity?" | Related user investigation history                                     |
| "Generate a report summarizing this alert for escalation"                | Formatted alert summary                                               |

#### Evidence

Retrieve evidence items and impacted assets for incidents and alerts. 

| Example Prompt                                                           | What You Get                                                          |
|--------------------------------------------------------------------------|-----------------------------------------------------------------------|
| "Show me the evidence for incident 456"                                   | Entities (IPs, files, processes), impacted assets (users, devices), and their verdicts |
| "What evidence is associated with this alert?"                            | Alert-level evidence with entity details                              |

#### Identities

Research user accounts and identities that appear in your security data. 

| Example Prompt                                                           | What You Get                                                          |
|--------------------------------------------------------------------------|-----------------------------------------------------------------------|
| "Give me details on user@contoso.com"                                    | User profile, risk scores, tags, associated devices, and activity    |
| "When was the last authentication of this user?"                         | Most recent login information                                         |
| "Which users are involved in the most incidents this month?"             | User-to-incident correlation                                         |
| "Identify service accounts with interactive logons in the last 30 days"  | Service account activity (based on incident data)                    |

#### Devices

Look up device information and investigate device involvement in incidents. 

| Example Prompt                                                           | What You Get                                                          |
|--------------------------------------------------------------------------|-----------------------------------------------------------------------|
| "What do you know about device XYZ?"                                     | Device details — OS, health state, risk level, exposure               |
| "Which machines were involved in multiple incidents recently?"           | Multi-incident device correlation                                     |
| "Are there other alerts linked to this device in the last 7 days?"       | Device-scoped alert history                                           |

#### IP Addresses

Check IP address intelligence and reputation. 

| Example Prompt                                                           | What You Get                                                          |
|--------------------------------------------------------------------------|-----------------------------------------------------------------------|
| "Is the IP 203.0.113.42 suspicious?"                                     | Geolocation, organization prevalence, threat reputation, and associated devices |
| "Analyze IP 10.0.0.15"                                                   | Full IP intelligence including observed device connections           |

### Page Context Awareness

Defender Chat Agent is aware of the page you're currently viewing in the Defender portal and can answer questions based on that context.

If you ask a question such as "Which users are involved in *this* incident?",  the Chat Agent understands which incident, alert, device, or entity you're referring to based on your current page without having to need to provide IDs or names.

How It Works 

Conversational AI 

Defender Chat Agent uses large language models to understand your questions and generate responses. It's designed specifically for security operations — it understands SOC terminology, threat concepts, and the structure of incidents, alerts, and entities in Defender XDR. 

Automatic Data Retrieval 

When you ask a question, the Chat Agent automatically queries the relevant data from Defender XDR on your behalf — such as incident details, alert lists, device information, or IP intelligence — and incorporates that data into its response. You don't need to look anything up manually. 

Multi-Turn Conversations 

You can ask follow-up questions naturally — the Chat Agent remembers the full context of your conversation. For example, you can start with "Show me high-severity incidents from the past week," then follow up with "Tell me more about the first one," and the Chat Agent understands what you mean. 

Step-by-Step Plans 

For complex or multi-step requests, the Chat Agent may first present a proposed plan outlining the steps it intends to take. You can Approve or Reject the plan before any actions are taken. This keeps you in control, especially for investigations that require multiple data lookups. 

Example: If you ask "Investigate incident 12345 and summarize the key findings," the Chat Agent might propose a plan like: 

Retrieve incident details 

Fetch associated alerts 

Collect evidence and impacted entities 

Summarize findings 

Once approved, the Chat Agent executes each step and shows its progress in real time — you can see which step is in progress and which have completed. 

Clarifying Questions 

If your request is ambiguous, the Chat Agent may ask a clarifying question and offer quick-select options (up to 4 suggestions) to help you get to the right answer faster. Simply click an option or type your own response. 

Unsupported Questions 

Defender Chat Agent is designed specifically for security investigation within Defender XDR. If you ask a question outside this scope (for example, general knowledge or non-security topics), the Chat Agent will politely let you know and offer to help with a security-related question instead. 

 

Conversation History 

Your conversations are saved automatically. Use the Conversations panel on the left side of the chat to: 

Resume a previous conversation — click any past conversation to pick up where you left off 

Start a new session — click New Session in the header to begin a fresh conversation 

Delete a conversation — hover over a conversation and click Delete 

Clear all conversations — use Clear all to remove your full history 

Note: Conversations are stored locally in your browser. They are not synced across devices or shared with other users. 

 

Working with Responses 

Responses are formatted with structured tables, bullet points, and section headers for readability. You can: 

Copy a response — click the copy icon on any message to copy it to your clipboard 

Export tables — tables in responses can be exported to Excel for further analysis 

Stop generation — if a response is taking too long or heading in the wrong direction, click Stop to interrupt it 

Retry — if something goes wrong, you can retry a response with one click 

### Important Notes

- AI accuracy: Defender Chat Agent is an AI assistant. Responses may occasionally be incomplete or incorrect. Always validate critical findings before taking action.
- Security focused: The Chat Agent only responds to security investigation questions related to Defender XDR. Off-topic questions are politely declined.
- Data scope: The Chat Agent only accesses data within your organization's Defender XDR environment. It doesn't access external threat databases or data outside your tenant.
- Rate limits: During periods of high demand, the Chat Agent may temporarily be unavailable. If this happens, wait a moment and try again.

### Limitations

The following capabilities are not available in the current public preview:

- Response actions: the Chat Agent can't take actions (e.g., isolate a device, close an incident) on your behalf
- Organization knowledge: custom SOPs or organizational documents are not integrated
- Promptbook / saved prompts: saving favorite prompts or creating prompt libraries
- Device timeline queries: detailed device timeline exploration (for example, *show all PowerShell executions on this device*)
- Identity inventory queries: broad identity inventory questions beyond what's available in incident data
- Threat intelligence lookups: hash, domain, or file-based TI queries
- Natural language to KQL: converting questions to Advanced Hunting queries

### Frequently Asked Questions

#### What languages does Defender Chat Agent support?

Defender Chat Agent is available in English, German, Spanish, French, Italian, Japanese, Korean, Portuguese (Brazil), Russian, Simplified Chinese, and Traditional Chinese.

---

## Provide feedback

All Copilot in Defender capabilities have an option for providing feedback. Reviewing and [providing feedback](/security-copilot/rai-faqs-security-copilot#what-are-the-limitations-of-security-copilot-how-can-users-minimize-the-impact-of-security-copilots-limitations-when-using-the-system) about the results helps improve future responses. To provide feedback, perform the following steps:

In Copilot:

1. Select the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards.](media/copilot-in-defender/copilot-defender-feedback.png) located at the bottom of any results card in the Copilot side panel.
2. Select **Looks right** if you deem the results accurate. You can provide more information in the next dialog box.
3. Select **Needs improvement** if you assessed the result as lacking or incomplete. You can provide more information about your assessment in the next dialog box and submit this assessment to Microsoft.
4. You can also report the results if it contains questionable or ambiguous information by selecting **Inappropriate**. Provide more information about the results in the next dialog box and select Submit.

In Defender Chat experience:

Use the 👍 / 👎 buttons on any response. During Private Preview, your feedback is especially important and directly influences future improvements.

## Privacy and data security

Copilot continuously evolves using [data](/security-copilot/privacy-data-security#customer-data-and-system-generated-logs) that is [stored](/security-copilot/privacy-data-security#customer-data-storage-location), [processed](/security-copilot/privacy-data-security#location-for-prompt-evaluation), and [shared](/security-copilot/privacy-data-security#customer-data-sharing-preferences) depending on the settings defined by your administrator. Microsoft ensures that your data is always protected and secure when using Copilot. To learn more about data security and privacy in Copilot, see [Privacy and data security in Copilot](/security-copilot/privacy-data-security).

<a name='microsoft-365-defender-plugin-in-security-copilot'></a>

## Plugins in Security Copilot

Copilot uses [preinstalled Microsoft plugins](/security-copilot/manage-plugins#preinstalled-plugins) like Microsoft Defender XDR, Defender Threat Intelligence, and Natural Language to KQL for Microsoft Sentinel and Defender XDR plugins to generate relevant information, provide more context to incidents, and generate more accurate results. Ensure that [plugins are turned on in Copilot](/security-copilot/manage-plugins#managing-preinstalled-plugins) to allow access to relevant data and to generate requested content from other Microsoft services in your organization.

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
