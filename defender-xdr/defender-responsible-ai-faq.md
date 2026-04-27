---
title: Responsible AI for Defender and Defender Chat
description: Learn how <icrosoft applies responsible AI to Defender Chat
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.reviewer: Yuval.Zvulun
ms.topic: faq
ms.date: 04/10/2026

#customer intent: As a 
---

# Responsible AI FAQ for Microsoft Defender Chat

This FAQ describes how Responsible AI (RAI) principles apply to **Microsoft Defender Chat**, including how it works, its intended uses, limitations, and how Microsoft evaluates and improves the experience.

## What is Microsoft Defender Chat?

Microsoft Defender Chat is a natural language, generative AI-powered chat experience embedded within the Microsoft Defender XDR portal. It enables Security Operations Center (SOC) analysts, security administrators, and IT professionals to investigate security incidents, analyze threats, and perform complex security tasks through a conversational interface. 

The system takes **natural language text input** (up to 1,024 characters per message) and produces AI-generated responses in rich markdown format, including formatted text, tables, links, and structured data. Users type questions or describe security tasks in everyday language, and the system applies large language models (LLMs) alongside integrated Microsoft Defender XDR data sources to deliver contextual, actionable security insights. 

At a high level, the Defender Chat:

- Accepts user questions or instructions about security incidents, alerts, devices, users, and IP addresses. 
- Orchestrates behind-the-scenes data retrieval from Microsoft Defender XDR services. 
- Returns structured, contextualized analysis with actionable recommendations in a conversational format.

## What can the Defender Chat do?

The Defender Chat helps SOC analysts and security professionals with the following capabilities: 

- **Incident investigation and triage**: Query incident details, review severity, status, classification, and associated alerts. Browse the incident queue with filters for severity, status, tags, and priority scores. Drill into individual incidents to understand scope and impact.

- **Alert analysis**: Examine individual security alerts, including MITRE ATT&CK technique mappings, severity classifications, investigation states, and detailed descriptions. Review alerts associated with specific incidents.

- **Evidence collection and review**: Retrieve digital evidence linked to incidents and alerts, including impacted entities such as IP addresses, files, processes, hosts, user accounts, mailboxes, applications, cloud resources, and more. View verdict information, remediation status, and detected threats for each piece of evidence.

- **Device enrichment**: Look up detailed device information including operating system details, risk scores, active alerts, onboarding status, isolation state, and associated identifiers (AAD Device ID, DNS name, machine ID).

- **Identity and user enrichment**: Investigate user profiles with details such as department, job title, manager, and contact information. Review risk scores from multiple sources (Threat Score, Defender Risk Score, Entra ID Risk Level), associated devices, logon types, and activity timelines.

- **IP address intelligence**: Investigate IP addresses with geolocation data, reputation scores, and rules, organizational prevalence (how many devices in the organization communicated with the IP), and observed device associations.

- **Multi-step investigation plans**: For complex investigations requiring multiple data retrieval steps, the system proposes structured plans for user review and approval before execution. Users can approve or reject these plans, maintaining full control over the investigation workflow.

- **Contextual follow-up**: The system suggests relevant follow-up questions with up to four clickable options, guiding analysts through logical investigation paths.

## What is the Defender Chat intended use?

Microsoft Defender Chat is intended to support security professionals, including SOC analysts, security administrators, and IT professionals, in performing security investigation and response tasks within the Microsoft Defender XDR portal. Its primary intended uses include:

- **Security incident triage and investigation**: Helping analysts quickly understand the scope, severity, and impact of security incidents by aggregating and summarizing data from multiple Defender XDR data sources.

- **Threat analysis and enrichment**: Providing contextual information about entities involved in security events (devices, users, IP addresses) to help analysts assess risk and make informed decisions.

- **Investigation workflow acceleration**: Reducing the time analysts spend navigating between multiple portal pages and manually correlating data by surfacing relevant information through natural language queries.

- **Guided investigation**: Offering structured, multi-step investigation plans and contextual follow-up suggestions to help less experienced analysts follow effective investigation patterns.

Microsoft Defender Chat is **not** intended for:

- Automated remediation or response actions (it's a read-only investigation tool; it doesn't modify security configurations, quarantine devices, or take enforcement actions).

- Use outside the security investigation domain. Prompts unrelated to security operations can produce incomplete or inaccurate responses.

- Replacement of human analyst judgment. Qualified security professionals should review all AI-generated analysis before decisions or actions are taken.

## How was Microsoft Defender Chat evaluated? What metrics are used to measure performance?

Microsoft Defender Chat underwent thorough evaluation before release, including:

- **Red teaming exercises**: Rigorous testing to identify failure modes, edge cases, and scenarios where the system might produce responses outside its intended scope or that conflict with Microsoft's AI Principles.

- **Quality evaluation of responses**: Assessment of the accuracy, completeness, and relevance of AI-generated analyses across a range of security investigation scenarios, including incident triage, alert analysis, device and identity enrichment, and IP investigation.

- **Tool execution reliability**: Evaluation of the system's ability to correctly invoke the appropriate data retrieval tools, handle errors gracefully, and produce consistent results across different query types and data conditions.

- **Safety evaluation**: Testing to ensure the system doesn't reveal internal implementation details, tool names, or system prompt information to users, and that it handles adversarial or out-of-scope prompts appropriately.

User feedback plays a critical role in ongoing evaluation. Every response includes *thumbs up* and *thumbs down* feedback buttons. When a response is inaccurate, incomplete, or unclear, users are encouraged to use the thumbs down button and provide details. When responses are accurate and helpful, the *thumbs up* button helps confirm positive performance. This feedback is sent directly to Microsoft and is used to continuously improve the system.

## What are the limitations of Microsoft Defender Chat? How can users minimize the impact of its limitations when using the system?

Like any AI-powered system, Microsoft Defender Chat has some known limitations:

- **AI-generated content might be incorrect**: The system generates responses probabilistically and might produce inaccurate, incomplete, or outdated information. A persistent disclaimer ("AI-generated content might be incorrect. Check it for accuracy.") is displayed in the interface always. Users should always verify AI-generated analysis against authoritative data sources before making decisions.

- **Scope limited to security operations**: The system is designed to respond to prompts related to the security domain, specifically Microsoft Defender XDR investigation scenarios. Questions outside this scope might produce irrelevant, incomplete, or inaccurate responses.

- **Read-only access**: The system retrieves and analyzes data but can't take remediation or response actions. Users who need to take action based on the analysis must do so through the standard Defender XDR portal workflows.

- **Data currency**: Responses are based on the data available at the time of the query. If underlying data changes between queries, responses may become stale. Default lookback windows (typically 7 or 30 days depending on the query type) might not capture all relevant historical data.

- **Input length limitations**: User messages are limited to 1,024 characters. Complex queries might need to be broken into multiple messages.

- **Contextual inference**: The system infers context from the current page URL and conversation history. In some cases, these inferences might be incorrect, leading to results that don't match the user's intent. If results seem off, users should provide explicit identifiers (incident IDs, device names, etc.) rather than relying on contextual references like "this incident" or "here."

- **Rate limiting and capacity**: During periods of high demand, the system might experience throttling. Users will see a message indicating high demand and should try again after a brief wait.

- **Permission-dependent results**: The system respects existing Defender XDR role-based access control (RBAC). If a user doesn't have permission to access certain incidents, alerts, or entities, the system returns an error for those specific queries. Results reflect only what the authenticated user is authorized to view.

**To minimize the impact of these limitations**:

- Always verify AI-generated analysis against the underlying data in the Defender XDR portal.

- Provide specific identifiers (incident IDs, alert IDs, device names, user principal names) when possible, rather than relying on broad or ambiguous queries.

- Use the feedback buttons to report inaccurate or unhelpful responses, which helps improve system performance over time.

- Review proposed multi-step plans carefully before approving execution.

- Follow Security prompting guidance for best results.

## What operational factors and settings allow for effective and responsible use of Microsoft Defender Chat?

Microsoft Defender Chat provides several mechanisms for effective and responsible use:

- **Natural language interaction**: Users can type everyday language to describe what they need. For example, "Show me the highest severity incidents from the last seven days" or "What devices are affected by incident 12345?"

- **Transparent reasoning**: As the system processes a request, it displays a "Reasoning" section showing the tools being invoked and their status (in progress, completed, failed, or skipped), along with the duration. This gives users visibility into how the system arrives at its conclusions.

- **Plan approval for complex tasks**: When an investigation requires three or more sequential data retrieval steps, the system presents a structured plan for user approval. Users can review each proposed step, understand what data will be retrieved, and approve or reject the plan before execution proceeds. This keeps the human analyst in control of the investigation workflow.

- **Stop generation**: Users can stop the system from generating a response at any time using the "Stop" button, providing immediate control over the interaction.

- **Conversation history and sessions**: Conversations are saved locally in the browser. Users can access previous conversations through the navigation panel, start new sessions, or delete conversation history. This enables continuity across investigation sessions while keeping data local to the user's browser.

- **Copy and share**: Users can copy AI-generated responses for use in reports, tickets, or collaboration with other team members. 

- **Feedback mechanism**: Every response includes thumbs up and thumbs down buttons, enabling users to provide immediate, contextual feedback on response quality.

- **AI-generated content disclaimer**: A persistent disclaimer reminds users that AI-generated content might be incorrect and should be checked for accuracy.

- **Access controls**: The system inherits Microsoft Defender XDR RBAC permissions. Administrators control which users can access the Chat feature, and the system only returns data that the authenticated user is authorized to view.

- **Localization**: The system supports multiple languages including English, German, Spanish, French, Italian, Japanese, Chinese (Simplified and Traditional), Korean, Portuguese (Brazil), and Russian.

## How do I provide feedback on Microsoft Defender Chat?

Microsoft Defender Chat provides built-in feedback mechanisms directly in the interface:

- **Per-response feedback**: Every completed response includes *thumbs up* (I like this) and *thumbs down* (I don't like this) buttons. Clicking either button opens a feedback dialog where you can provide more detail about what was helpful or what could be improved. This feedback is sent directly to Microsoft and is used to improve the system.

- **General product feedback**: For broader feedback about the Chat experience, you can use the standard feedback channels available within the Microsoft Defender XDR portal.

Your feedback is valuable and directly contributes to improving the accuracy, relevance, and usefulness of the system. We encourage all users to provide feedback regularly, especially when responses are inaccurate or unhelpful.

## How is Microsoft approaching Responsible AI for Defender Chat?

At Microsoft, we take our commitment to responsible AI seriously. Defender Chat was developed in accordance with [Microsoft's AI Principles](https://www.microsoft.com/ai/principles-and-approach) and the [Microsoft Responsible AI Standard](https://aka.ms/RAIStandardPDF). Key aspects of our approach include:

- **Human-centered design**: The system is designed to augment security analysts' capabilities, not replace their judgment. Features like plan approval, transparent reasoning, and persistent accuracy disclaimers keep humans at the center of the investigation process.

- **Safety systems**: The system includes safeguards to prevent misuse, including scope limitation to security investigation scenarios, restrictions on revealing internal implementation details, and graceful handling of out-of-scope or adversarial prompts.

- **Privacy and data security**: The system operates within the existing Microsoft Defender XDR security and privacy framework. Conversation data is stored locally in the user's browser and isn't used to improve the chat. The system respects existing RBAC permissions and doesn't access data beyond what the authenticated user is authorized to view. For more information regarding privacy handling within XDR, see [Data retention and data security in Microsoft Defender XDR](./data-privacy.md).

- **Continuous improvement**: User feedback collected through the built-in feedback mechanisms is used to continuously evaluate and improve system performance, accuracy, and safety.

- **Transparency**: This FAQ, the persistent AI-generated content disclaimer, and the visible reasoning process are all part of our commitment to transparency about the system's capabilities and limitations.

Responsible AI is an ongoing journey. We're committed to making our AI systems more reliable, trustworthy, and safe, and your feedback helps us achieve that goal.

## Do you comply with the EU AI Act?

We're committed to compliance with the EU AI Act. Our multi-year effort to define, evolve, and implement our Responsible AI Standard and internal governance strengthened our readiness. For more information, see [The EU AI Act: A Microsoft overview](https://www.microsoft.com/trust-center/compliance/eu-ai-act).

At Microsoft, we recognize the importance of regulatory compliance as a cornerstone of trust and reliability in AI technologies. We're committed to creating responsible AI by design. Our goal is to develop and deploy AI that will have a beneficial impact on and earn trust from society.

Our work is guided by a core set of principles: fairness, reliability and safety, privacy and security, inclusiveness, transparency, and accountability. Microsoft's Responsible AI Standard takes these six principles and breaks them down into goals and requirements for the AI we make available.

Our Responsible AI Standard takes into account regulatory proposals and their evolution, including the initial proposal for the EU AI Act. We developed our most recent products and services in the AI space such as Microsoft Copilot and Microsoft Azure OpenAI Service in alignment with our Responsible AI Standard. As final requirements under the EU AI Act are defined in more detail, we look forward to working with policymakers to ensure feasible implementation and application of the rules, to demonstrating our compliance, and to engaging with our customers and other stakeholders to support compliance across the ecosystem.
