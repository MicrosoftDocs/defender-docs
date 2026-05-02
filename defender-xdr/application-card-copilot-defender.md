---
title: Application card for Microsoft Copilot in Microsoft Defender
description: Learn about the capabilities, intended uses, limitations, and responsible AI practices for Microsoft Copilot in Microsoft Defender.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: guywild
author: guywi-ms
ms.reviewer: corinaf
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- msec-ai-copilot
ai-usage: ai-assisted
ms.custom: responsible-ai-transparency
ms.topic: concept-article
ms.date: 04/12/2026
#customer intent: I want to understand how Microsoft Copilot in Microsoft Defender works, its intended uses, limitations, and responsible AI practices.
---

# Application card: Microsoft Copilot in Microsoft Defender

## What is an application card?

Microsoft's application and platform cards are intended to help you understand how our AI technology works, the choices application owners can make that influence application performance and behavior, and the importance of considering the whole application, including the technology, the people, and the environment. Application cards are created for AI applications and platform cards are created for AI platform services. These resources can support the development or deployment of your own applications and can be shared with users or stakeholders impacted by them.

As part of its commitment to responsible AI, Microsoft adheres to six core principles: fairness, reliability and safety, privacy and security, inclusiveness, transparency, and accountability. These principles are embedded in the Responsible AI Standard, which guides teams in designing, building, and testing AI applications. Application and platform cards play a key role in operationalizing these principles by offering transparency around capabilities, intended uses, and limitations. For further insight, readers are encouraged to explore Microsoft's [Responsible AI Transparency Report](https://www.microsoft.com/ai/responsible-ai) and [Code of Conduct](https://www.microsoft.com/ai/principles-and-approach), which outline how enterprise customers and individuals can engage with AI responsibly.

## Overview

Microsoft Copilot in Microsoft Defender is the integration of Microsoft Security Copilot within the Microsoft Defender portal. It is an AI-powered security application designed to help security analysts investigate and respond to cybersecurity threats more efficiently and effectively. By combining large language models with security-specific data and intelligence, Copilot in Defender provides contextual insights, automated analysis, and actionable recommendations directly within the security workflows that analysts use every day.

Security operations center (SOC) teams face growing volumes of alerts, increasingly sophisticated attacks, and the challenge of staffing experienced analysts. Copilot in Defender addresses these challenges by accelerating incident investigation, reducing the time required to analyze complex threats, and enabling analysts at all experience levels to perform tasks that traditionally required deep expertise. The application draws on data from the workloads that Microsoft Defender monitors, including endpoints, identities, email, cloud applications, and more, to deliver relevant and contextualized assistance.

Microsoft Copilot in Microsoft Defender is intended for enterprise customers, specifically security analysts, incident responders, threat hunters, and threat intelligence analysts who use the Microsoft Defender portal to protect their organizations. For more information, see [Microsoft Security Copilot in Microsoft Defender](security-copilot-in-microsoft-365-defender.md).

## Key terms

The following table provides a glossary of key terms related to Microsoft Copilot in Microsoft Defender.

|Term  |Description  |
|---------|---------|
|**Advanced hunting**|A query-based threat hunting tool in Microsoft Defender that uses Kusto Query Language (KQL) to let security teams proactively search for threats, suspicious activities, and indicators of compromise across security data. Copilot in Defender can generate KQL queries from natural language requests.|
|**Guided response**|An AI-generated set of recommended actions provided by Copilot in Defender to help security analysts triage, contain, investigate, and remediate security incidents. Each recommendation includes a rationale explaining why the action is suggested.|
|**Incident**|A collection of correlated alerts and associated data that together represent a potential or confirmed security attack. Copilot in Defender can summarize incidents, highlight key details, and suggest appropriate response actions.|
|**KQL (Kusto Query Language)**|A read-only query language used in advanced hunting within Microsoft Defender and Microsoft Sentinel. Copilot in Defender can translate natural language questions into KQL queries, reducing the technical barrier for threat hunters.|
|**Large language model (LLM)**|A type of AI model trained on large datasets of text that can understand and generate natural language. Copilot in Defender uses large language models to analyze security data, generate summaries, and provide recommendations.|
|**MITRE ATT&CK**|A globally recognized knowledge base of adversary tactics and techniques based on real-world observations. Copilot in Defender maps findings from script analysis and threat detection to MITRE ATT&CK techniques to help analysts understand attacker behavior.|
|**Red teaming**|A security testing practice in which a team simulates real-world attacks against a product to identify failure modes, vulnerabilities, and scenarios outside of intended use. Microsoft conducted red teaming on Copilot in Defender before release.|
|**Security Compute Units (SCUs)**|The provisioned capacity units that measure and manage the compute resources consumed by Microsoft Security Copilot. Access to Copilot in Defender requires provisioned SCU capacity.|
|**Security Copilot**|The Microsoft Security platform that brings together AI and human expertise to help security teams respond to threats faster and more effectively. Copilot in Defender is the embedded experience of Security Copilot within the Microsoft Defender portal.|

## Key features or capabilities

The key features and capabilities in the following table describe what Microsoft Copilot in Microsoft Defender is designed to do and how it performs across supported tasks.

|Feature  |Description  |
|---------|---------|
|**Incident summarization**|Copilot automatically generates a concise summary when an analyst opens an incident, including the attack timeline, affected assets, indicators of compromise, and threat actor names. This helps analysts immediately understand the scope and severity of an attack without manually reviewing each alert. Summaries can contain up to 100 correlated alerts and are cached for up to one week at no additional compute cost if the incident has not changed. <br/><br/> For more information, see [Summarize an incident with Microsoft Copilot in Microsoft Defender](security-copilot-m365d-incident-summary.md).|
|**Guided responses**|Copilot provides contextual, AI-generated recommendations to help analysts respond to incidents. Recommendations are organized into four categories: triage (classify the incident), containment (stop the attack from spreading), investigation (further analysis steps), and remediation (specific response actions for affected entities). Administrators can also upload organization-specific response guidelines to tailor the recommendations to their environment. <br/><br/> For more information, see [Use guided responses with Copilot in Microsoft Defender](security-copilot-m365d-guided-response.md).|
|**Script and command-line analysis**|Copilot analyzes potentially malicious or obfuscated scripts, such as PowerShell command lines, and provides a plain-language explanation of what the script does, whether it is malicious, and which MITRE ATT&CK techniques it employs. This reduces the need for external analysis tools and enables analysts with varying levels of experience to assess threats quickly. <br/><br/> For more information, see [Script analysis with Microsoft Copilot in Microsoft Defender](security-copilot-m365d-script-analysis.md).|
|**File analysis**|Copilot assesses suspicious files by generating a summary that includes detection information, related file certificates, a list of API calls, and strings found in the file. Analysis results are automatically generated when an analyst opens a file page, helping accelerate investigation of potentially malicious files. <br/><br/> For more information, see [File analysis with Microsoft Copilot in Microsoft Defender](copilot-in-defender-file-analysis.md).|
|**Device summarization**|Copilot generates a summary of a device's security posture, including the status of protection capabilities such as attack surface reduction and tamper protection, any unusual user activity, a list of vulnerable software, firewall settings, and relevant Microsoft Intune information. This enables analysts to quickly evaluate whether a device is at risk. <br/><br/> For more information, see [Device summary with Microsoft Copilot in Microsoft Defender](copilot-in-defender-device-summary.md).|
|**Identity summarization**|Copilot provides a contextual overview of a user identity, including account creation date, criticality level, role and role changes, sign-in behaviors and patterns, authentication methods, risks from Microsoft Entra ID, and contact information. This helps analysts rapidly assess whether a user account is compromised or at risk. <br/><br/> For more information, see [Summarize identity information with Microsoft Copilot in Microsoft Defender](security-copilot-defender-identity-summary.md).|
|**Incident report generation**|Copilot compiles all incident information, including management actions, timestamps, analysts involved, classification reasoning, investigation and remediation actions, and follow-up recommendations, into a structured report that can be exported to PDF or posted to an incident activity log. <br/><br/> For more information, see [Create an incident report with Microsoft Copilot in Microsoft Defender](security-copilot-m365d-create-incident-report.md).|
|**Natural language query assistant**|Copilot converts natural language threat hunting questions into ready-to-run KQL queries for use in advanced hunting. This reduces the time and expertise required to write hunting queries from scratch, enabling analysts to focus on threat investigation rather than query syntax. <br/><br/> For more information, see [Build KQL queries for hunting using Microsoft Copilot in Microsoft Defender](advanced-hunting-security-copilot-query-assistant.md).|
|**Threat intelligence briefing**|The Threat Intelligence Briefing Agent autonomously gathers and synthesizes relevant threat intelligence data, delivering customized briefings that include the latest threat actor activity, vulnerability information, and active exploit details. Briefings can be scheduled or generated on demand and are customizable by insights depth, look-back period, region, and industry. <br/><br/> For more information, see [Threat Intelligence Briefing Agent](threat-intel-briefing-agent-defender.md).|
|**Security Alert Triage**|The Security Alert Triage Agent is an autonomous agent that helps security teams triage alerts at scale. It applies AI-driven, dynamic reasoning across evidence to deliver clear verdicts for supported security workloads, including phishing, identity, and cloud alerts. By identifying which alerts represent real attacks and which are false positives, the agent enables analysts to focus on investigating real threats, with transparent, step-by-step reasoning to support every decision. <br/><br/> For more information, see [Security Alert Triage Agent in Microsoft Defender](security-alert-triage-agent.md).|
|**Dynamic threat detection**|The Dynamic Threat Detection Agent is an always-on, adaptive backend service that uses AI to identify gaps in traditional rule-based detection by correlating alerts, events, anomalies, and threat intelligence across Microsoft Defender and Microsoft Sentinel environments. When a hidden threat is detected, the agent generates a dynamic alert with full context, natural language explanations, mapped MITRE ATT&CK techniques, and tailored remediation steps. <br/><br/> For more information, see [Dynamic Threat Detection Agent in Microsoft Defender](dynamic-threat-detection-agent.md).|
|**Threat intelligence analysis**|Copilot consolidates and summarizes threat intelligence so security teams can prioritize threats based on exposure levels, understand threat actors that may target their industry, and stay informed about emerging vulnerabilities and campaigns. <br/><br/> For more information, see [Microsoft Defender Threat Intelligence](defender-threat-intelligence.md).|

## Intended uses

Microsoft Copilot in Microsoft Defender can be used in multiple scenarios across a variety of industries. Some examples of use cases include:

- **Accelerating incident investigation and response:** A security analyst at a financial services organization receives a high-severity incident alert involving multiple correlated alerts across endpoints and email. Using Copilot, the analyst immediately receives a summary of the attack timeline, affected assets, and indicators of compromise. Copilot then provides guided response recommendations to contain the threat and remediate affected systems, reducing investigation time from hours to minutes and enabling faster containment of the attack.

- **Triaging user-reported phishing at scale:** A large enterprise receives hundreds of user-reported phishing emails each day. The Phishing Triage Agent autonomously evaluates each submission, classifies it as a genuine threat or a false positive, and provides a natural language rationale for its determination. SOC analysts can then focus their time on confirmed threats rather than manually reviewing every reported email, improving both response speed and analyst efficiency.

- **Enabling junior analysts to perform advanced threat hunting:** A government agency's SOC team includes analysts who are not yet proficient in KQL. Using the natural language query assistant, these analysts can describe what they are looking for in plain English, and Copilot generates the appropriate KQL query. This enables less experienced team members to participate in proactive threat hunting alongside senior analysts, broadening the team's coverage without additional training overhead.

- **Analyzing obfuscated scripts and suspicious files:** During an investigation into a potential ransomware attack, an analyst encounters an obfuscated PowerShell script. Rather than relying on external analysis tools or waiting for a senior team member, the analyst uses Copilot's script analysis capability to receive a plain-language explanation of the script's behavior, its risk level, and the MITRE ATT&CK techniques it employs. This significantly shortens the time to determine whether the script is malicious and what remediation steps are needed.

- **Staying ahead of emerging threats with intelligence briefings:** A security team at a healthcare organization wants to stay informed about threat actors and vulnerabilities relevant to their industry. The Threat Intelligence Briefing Agent delivers scheduled, customized briefings that summarize the latest threat actor activity, exploitation trends, and vulnerability disclosures, enabling the team to proactively adjust their defenses and prioritize patching efforts.

- **Streamlining incident documentation and reporting:** After resolving a complex, multi-alert incident, a security team needs to produce a detailed incident report for compliance and executive review. Copilot automatically compiles the incident timeline, response actions, analysts involved, and classification reasoning into a structured report that can be exported to PDF, saving analysts significant time on documentation.

- **Assessing identity and device risk during investigations:** While investigating a suspicious sign-in incident, an analyst uses Copilot to generate an identity summary that highlights the user's role, recent role changes, sign-in patterns, and risk flags from Microsoft Entra ID. The analyst also generates a device summary for the endpoint involved, revealing vulnerable software and unusual activity. Together, these summaries enable the analyst to quickly determine the scope of the compromise and take targeted action.

## Models and training data

Microsoft Defender extends Microsoft Security Copilot, leveraging its existing agents and underlying AI models. As such, it's dependent on any external configuration that these provide. For example, model choice for Microsoft Security Copilot for the embedded natural language prompt experience. To learn more, see [Microsoft Security Copilot Responsible AI FAQ](/copilot/security/rai-faqs-security-copilot).

Customer data is not shared with OpenAI or used to train Azure OpenAI foundation models. Administrators have full control over how their organization's data is used, including whether to allow Microsoft to capture data for product validation or security AI model improvement. Data sharing preferences can be configured at any time, and customer data is stored in the geographic location selected during setup. For detailed information about data handling, storage, retention, and sharing controls, see [Privacy and data security in Microsoft Security Copilot](/copilot/security/privacy-data-security).

## Performance

Microsoft Copilot in Microsoft Defender is designed to perform reliably across a range of security investigation and response workflows within the Microsoft Defender portal. The application operates in environments where security analysts interact with incident data, alerts, threat intelligence, device and identity information, file metadata, and scripts. Copilot processes text-based inputs, including natural language prompts, script content, and structured security data, and generates text-based outputs such as summaries, recommendations, KQL queries, reports, and classification verdicts. It does not process or generate image, video, or audio content.

The application is designed and evaluated primarily for use in English. Analysts who submit prompts and review Copilot-generated outputs in English can expect the highest level of accuracy and coherence. While the Microsoft Defender portal supports multiple languages for its broader interface, Copilot's natural language understanding and generation capabilities are optimized for English. Using unsupported languages may result in reduced accuracy or less relevant outputs, and users should exercise caution when operating outside the intended language scope.

Copilot in Defender performs best when analysts interact with it within the intended investigation workflows, such as opening an incident page to receive a summary, requesting guided responses during triage, or entering a natural language question in the advanced hunting query assistant. The application leverages data from the workloads that Microsoft Defender monitors, including Microsoft Defender for Endpoint, Microsoft Defender for Identity, Microsoft Defender for Office 365, Microsoft Defender for Cloud Apps, and Microsoft Defender Vulnerability Management, as well as Microsoft Sentinel data when available. The quality and completeness of Copilot outputs depend on the availability and richness of data within the customer's environment.

Performance is also influenced by the complexity of the input. Simple, clearly scoped prompts tend to produce more accurate and actionable results, while prompts that are ambiguous, extremely long, or outside the security domain may yield less relevant outputs. For autonomous agents such as the Phishing Triage Agent and Dynamic Threat Detection Agent, performance is measured through classification accuracy and detection precision, with continuous improvement driven by analyst feedback and ongoing model refinement.

## Limitations

Understanding Microsoft Copilot in Microsoft Defender's limitations is crucial to determine if it is used within safe and effective boundaries. While we encourage customers to leverage Microsoft Copilot in Microsoft Defender in their innovative solutions or applications, it's important to note that Microsoft Copilot in Microsoft Defender was not designed for every possible scenario. We encourage users to refer to either the [Microsoft Enterprise AI Services Code of Conduct](https://www.microsoft.com/licensing/terms/productoffering/MicrosoftAzure) (for organizations) or the Code of Conduct section in the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) (for individuals) as well as the following considerations when choosing a use case:

- **Security domain scope:** Microsoft Copilot in Microsoft Defender is designed to generate responses related to the security domain, such as incident investigation, threat intelligence, and threat hunting. Prompts outside the scope of security might result in responses that lack accuracy and comprehensiveness. Users should ensure that their use of Copilot is limited to security-related tasks within the Microsoft Defender portal.

- **English language optimization:** Copilot in Defender was developed and evaluated primarily in English. Using unsupported languages might result in reduced accuracy, less relevant outputs, or incomplete responses. Users should exercise caution when operating outside the intended language scope and verify outputs carefully in those scenarios.

- **Code generation accuracy:** Copilot in Defender might generate code or include code snippets, such as KQL queries, in its responses. While these outputs appear valid, they might not always be semantically or syntactically correct, or they might not accurately reflect the analyst's intent. Users should always review, test, and validate any generated code before using it in production, following the same precautions as they would with any code that they did not independently author: rigorous testing, IP scanning, and checking for security vulnerabilities.

- **Prompt length constraints:** The system might not be able to process very long prompts, such as those containing hundreds of thousands of characters. Analysts should keep prompts concise and well-scoped for best results.

- **Response latency and capacity:** Generating and verifying responses can take time, up to several minutes in some cases, and requires significant compute capacity. Usage might be subject to capacity throttling, particularly during periods of high demand. Users should plan for potential delays when relying on Copilot for time-sensitive tasks.

- **AI-generated output accuracy:** Like any AI-powered technology, Copilot in Defender does not get everything right. Outputs might be inaccurate, incomplete, biased, or misaligned with the analyst's intent. This can occur due to ambiguity in inputs, limitations of the underlying models, or gaps in available data. Users should always review Copilot-generated content before acting on it and use the built-in feedback tools to report inaccurate or problematic outputs.

- **Matches with public code:** Copilot in Defender generates code probabilistically, and while the likelihood of producing code that matches publicly available code is low, it is possible. Users should take precautions to ensure suitability and originality, including rigorous testing, IP scanning, and checking for security vulnerabilities.

- **Not a substitute for human judgment:** Copilot in Defender is designed to assist, not replace, security analysts. All recommendations, summaries, and classifications should be reviewed by a qualified analyst before action is taken, particularly for consequential decisions such as containment, remediation, or escalation.

## Evaluations

Performance and safety evaluations assess whether AI applications are operating reliably and securely by examining factors like groundedness, relevance, and coherence while identifying the risks of generating harmful content. The following evaluations were conducted with safety components already in place, which are also described in [Safety components and mitigations](#safety-components-and-mitigations).

### Performance and quality evaluations

Performance evaluations for AI applications are essential to improving their reliability in real-world applications. Metrics like groundedness, relevance, and coherence help assess the accuracy and consistency of AI-generated outputs, so that they are factually supported in grounded content scenarios, contextually appropriate, and logically structured. For Microsoft Copilot in Microsoft Defender, we conducted performance evaluations for the following metrics, which are available through [Microsoft Foundry](/azure/ai-foundry/what-is-azure-ai-foundry):

- Groundedness
- Coherence
- Fluency
- Similarity

### Performance and quality evaluation methods

Performance evaluations for Microsoft Copilot in Microsoft Defender were conducted on text-based outputs generated across the full range of supported capabilities, including incident summarization, guided responses, script and file analysis, identity and device summarization, KQL query generation, and threat intelligence briefings. Evaluations used AI-assisted automated evaluators available through Microsoft Foundry, applied against curated datasets of realistic security investigation scenarios drawn from synthetic and representative real-world inputs.
 
Groundedness measures whether generated outputs are factually supported by the source data available in the environment, such as incident alerts, threat intelligence signals, and security telemetry. An ideal result is one in which all claims in the output are traceable to and consistent with the underlying data. A suboptimal result contains claims that are fabricated, hallucinated, or inconsistent with the source data provided to the model.
 
Coherence measures the logical structure, clarity, and internal consistency of generated outputs. An ideal result is well-organized, easy to follow, and free of contradictions. A suboptimal result is disjointed, self-contradictory, or difficult for an analyst to interpret and act on.
 
Fluency measures the grammatical correctness and linguistic quality of generated text. An ideal result reads naturally and is free of grammatical errors or awkward constructions. A suboptimal result contains grammatical mistakes or phrasing that impedes readability or analyst comprehension.
 
Similarity measures the degree of alignment between generated outputs and reference outputs produced by subject matter experts for the same inputs. An ideal result closely mirrors the intent, coverage, and accuracy of the expert reference. A suboptimal result diverges significantly from the expected response in content, scope, or accuracy.
 
Each metric was scored on a numerical scale using AI-assisted judges calibrated against human annotations. Evaluations were run iteratively across dataset updates to track quality over time and support continuous improvement.

### Risk and safety evaluations

Evaluating potential risks associated with AI-generated content is essential for safeguarding against content risks with varying degrees of severity. This includes evaluating an AI application's predisposition towards generating harmful content or testing vulnerabilities to jailbreak attacks. For Microsoft Copilot in Microsoft Defender, we conducted risk and safety evaluations for the following metrics available through Microsoft Foundry:

- Hate and unfairness
- Sexual
- Violence
- Self-harm
- Protected material
- Indirect jailbreak
- Direct jailbreak
- Code vulnerability
- Ungrounded attributes

### Risk and safety evaluation methods

Risk and safety evaluations for Microsoft Copilot in Microsoft Defender were conducted using adversarial datasets and AI-assisted classifiers available through Microsoft Foundry, applied to text-based inputs and outputs. Adversarial prompts were crafted to simulate attempts to elicit harmful, policy-violating, or off-topic content across a range of risk categories. Outputs were scored for the presence of such content using classifiers trained and calibrated to Microsoft's safety standards.
 
Hate and unfairness evaluates whether outputs contain derogatory, discriminatory, or prejudicial content targeting individuals or groups based on protected characteristics. An ideal result contains no such content. A suboptimal result includes language that demeans, stereotypes, or unfairly characterizes individuals or groups.
 
Sexual evaluates whether outputs contain sexually explicit or inappropriate content. An ideal result contains no such content. A suboptimal result includes language of a sexual nature that is inappropriate for a professional security operations context.
 
Violence evaluates whether outputs contain content that glorifies, instructs, or encourages violent acts. An ideal result contains no such content. A suboptimal result includes language that promotes or facilitates harm to individuals or groups.
 
Self-harm evaluates whether outputs contain content that promotes, instructs, or encourages self-injurious behavior. An ideal result contains no such content. A suboptimal result includes language that could contribute to self-harm.
 
Protected material evaluates whether outputs reproduce copyrighted text, code, or other protected content verbatim or in a manner that creates legal exposure. An ideal result does not reproduce protected material. A suboptimal result contains verbatim reproduction of third-party protected content.
 
Indirect jailbreak evaluates the application's resilience to prompt injection attacks embedded in external content, such as data retrieved from emails, documents, or security alerts, that attempt to redirect the model's behavior. An ideal result is one in which the model does not follow injected instructions. A suboptimal result is one in which injected instructions alter the model's outputs or behavior.
 
Direct jailbreak evaluates the application's resilience to explicit attempts by users to bypass safety constraints, override system instructions, or elicit content outside the intended scope of the application. An ideal result is one in which the model refuses or appropriately handles such attempts. A suboptimal result is one in which the model complies with instructions designed to circumvent safety controls.
 
Code vulnerability evaluates whether generated code outputs, such as KQL queries or script snippets, contain security vulnerabilities that could expose the analyst or their environment to risk. An ideal result is code that is free of exploitable vulnerabilities. A suboptimal result contains code with known vulnerability patterns, such as injection risks or insecure constructs.
 
Ungrounded attributes evaluates whether outputs assign characteristics, behaviors, or attributes to entities, such as users, devices, or threat actors, that are not supported by the underlying data. An ideal result attributes only what is evidenced in the available security data. A suboptimal result fabricates or infers attributes without evidentiary basis, which could lead an analyst to incorrect conclusions.
 
Each metric was scored using AI-assisted classifiers, with scores calibrated against human annotations. Evaluations were conducted iteratively and informed the design of safety mitigations described in [Safety components and mitigations](#safety-components-and-mitigations).

### Evaluation data for quality and safety

Our evaluation data is custom-built to assess AI application performance across key areas of safety and quality, simulating real-world scenarios and risks. We begin by identifying relevant evaluation aspects of concern based on multi-disciplinary research and expert input. These concerns are translated into targeted evaluation objectives and guide formulation of evaluation metrics. For safety, we create adversarial prompts to elicit undesirable or edge-case responses, which are then scored using AI-assisted annotators trained to assess alignment with Microsoft's safety standards. For quality, we craft rubric-based prompts relevant to scenarios including evaluating retrieval-augmented generation (RAG) applications and agents. Datasets are curated from diverse sources including synthetic and public datasets to simulate real-world user scenarios. Using the curated datasets, both evaluations undergo iterative refinement and human alignment to improve metric efficacy and reliability. This methodology forms the foundation of repeatable, rigorous assessments that reflect how customers use evaluations to build better and safer AI.

### Custom evaluations

Microsoft Copilot in Microsoft Defender underwent substantial custom evaluation and testing prior to release. This included comprehensive red teaming, a practice in which dedicated teams rigorously test the product to identify failure modes and scenarios that might cause the application to produce outputs outside its intended uses or that do not align with the [Microsoft AI Principles](https://www.microsoft.com/ai/responsible-ai). Red teaming exercises were designed to evaluate the application's resilience against adversarial inputs, attempts to elicit harmful or off-topic content, and edge-case scenarios that could compromise safety or reliability.

In addition to red teaming, Microsoft conducted iterative testing across the full range of Copilot in Defender capabilities, including incident summarization, guided responses, script analysis, file analysis, identity and device summarization, KQL query generation, and threat intelligence briefings. These evaluations assessed the accuracy, groundedness, relevance, and coherence of generated outputs across text-based modalities (natural language and KQL code). An ideal result is one that is factually accurate, grounded in the available security data, relevant to the analyst's query, and clearly structured. A suboptimal result would be one that is factually incorrect, unsupported by the data, irrelevant to the analyst's intent, or difficult to follow.

An invite-only early access program provided an additional evaluation mechanism, enabling real-world users to interact with the application and provide structured feedback before general availability. User feedback, collected through "Off-target," "Report," and "Confirm" buttons on every Copilot response, is an ongoing evaluation signal that Microsoft uses to identify quality issues and drive continuous improvement. For autonomous agents such as the Phishing Triage Agent, evaluation also includes classification accuracy metrics and analyst feedback on triage decisions to continuously refine the agent's performance.

## Safety components and mitigations

- **Red teaming and adversarial testing:** Before release, Microsoft conducted extensive red teaming to identify failure modes and conditions under which the application could generate outputs outside its intended scope. Dedicated teams simulated adversarial inputs, jailbreak attempts, and edge-case scenarios to assess the application's resilience and inform the design of safety controls.

- **Human-in-the-loop design:** Copilot in Defender keeps humans at the center of all workflows. All generated outputs, including summaries, recommendations, classifications, and code, are presented to analysts for review before any action is taken. This design ensures that human judgment is the final decision point for all security operations activities.

- **Content filtering and safety systems:** A multi-layered safety system is designed to mitigate harmful content generation and prevent misuse. This includes harmful content annotation, content classifiers, and built-in safeguards that screen both inputs and outputs for off-topic, harmful, or otherwise inappropriate content.

- **Operational monitoring:** Microsoft continuously monitors the operational performance of Copilot in Defender to detect anomalies, degraded performance, and potential misuse. This monitoring enables rapid identification and resolution of issues that could impact the quality or safety of the application.

- **User feedback mechanism:** Every Copilot response includes feedback controls, specifically "Off-target," "Report," and "Confirm" buttons, that allow analysts to flag inaccurate, incomplete, or objectionable outputs. This feedback goes directly to Microsoft and is used to improve the quality and safety of the application over time.

- **Scope boundary enforcement:** Copilot in Defender is designed to respond only to prompts related to the security domain. Prompts that fall outside the scope of security operations, such as requests for unrelated general knowledge or non-security tasks, are handled with appropriate guardrails to reduce the risk of generating off-topic or misleading content.

- **Role-based access and permissions:** Access to Copilot in Defender is governed by role-based access controls. Users must have provisioned access to Microsoft Security Copilot, and specific features and agents require additional permissions, such as Security Reader, Security Administrator, or specific Microsoft Entra roles. This limits exposure to authorized personnel and enforces the principle of least privilege.

- **Transparent reasoning for autonomous agents:** For agentic capabilities such as the Phishing Triage Agent, the application provides a transparent rationale for its classification verdicts in natural language, detailing the reasoning and evidence behind conclusions. A visual representation of the reasoning process is also available, enabling analysts to understand and verify the agent's decision-making process.

- **Analyst feedback loop for agentic AI:** Analysts can provide feedback on autonomous agent classifications, such as phishing triage decisions. Over time, this feedback helps refine the agent's behavior to better reflect organizational context, reduce false positives, and improve classification accuracy.

- **EU AI Act compliance:** Microsoft is committed to compliance with the EU AI Act. The application is developed in alignment with Microsoft's Responsible AI Standard, which accounts for regulatory proposals including the EU AI Act. For more information, see [Microsoft's compliance with the EU AI Act](https://www.microsoft.com/trust-center/compliance/eu-ai-act).

## Best practices for deploying and adopting Microsoft Copilot in Microsoft Defender

Responsible AI is a shared commitment between Microsoft and its customers. While Microsoft builds AI applications with safety, fairness, and transparency at the core, customers play a critical role in deploying and using these technologies responsibly within their own contexts. To support this partnership, we offer the following best practices for deployers and end users to help customers implement responsible AI effectively.

Deployers and end-users should:

- **Exercise caution and evaluate outcomes when using Microsoft Copilot in Microsoft Defender for consequential decisions or in sensitive domains:** Consequential decisions are those that may have a legal or significant impact on a person's access to education, employment, financial platforms, government benefits, healthcare, housing, insurance, legal platforms, or that could result in physical, psychological, or financial harm. Sensitive domains such as financial platforms, healthcare, and housing require particular care due to the potential for disproportionate impact on different groups of people. When using AI for decisions in these areas, make sure that impacted stakeholders can understand how decisions are made, appeal decisions, and update any relevant input data.

- **Evaluate legal and regulatory considerations:** Customers need to evaluate potential specific legal and regulatory obligations when using any AI platforms and solutions, which may not be appropriate for use in every industry or scenario. Additionally, AI platforms or solutions are not designed for and may not be used in ways prohibited in applicable terms of service and relevant codes of conduct.

End-users should:

- **Exercise human oversight when appropriate:** Human oversight is an important safeguard when interacting with AI applications. While we continuously improve our AI applications, AI might still make mistakes. The outputs generated may be inaccurate, incomplete, biased, misaligned, or irrelevant to your intended goals. This could happen due to various reasons, such as ambiguity in the inputs or limitations of the underlying models. As such, users should review the responses generated by Microsoft Copilot in Microsoft Defender and verify that they match their expectations and requirements.

- **Be aware of the risk of overreliance:** Overreliance on AI happens when users accept incorrect or incomplete AI outputs, mainly because mistakes in AI outputs may be hard to detect. For end-users, overreliance could result in decreased productivity, loss of trust, application abandonment, financial loss, psychological harm, or physical harm. Security analysts should treat Copilot outputs as a starting point for investigation, not as a final determination, and should independently verify critical findings before taking consequential actions.

- **Exercise caution when designing agentic AI in sensitive domains:** Users should exercise caution when designing and/or deploying agentic AI applications in sensitive domains where agent actions are irreversible or highly consequential. Additional precautions should also be taken when creating autonomous agentic AI as described further in either the [Microsoft Enterprise AI Services Code of Conduct](https://www.microsoft.com/licensing/terms/productoffering/MicrosoftAzure) (for organizations) or the Code of Conduct section in the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) (for individuals).

- **Provide feedback to improve Copilot quality:** When a response is inaccurate, incomplete, or unclear, use the "Off-target" and "Report" buttons to flag problematic output. When responses are useful and accurate, use the "Confirm" button. These feedback controls appear at the bottom of every Copilot response and help Microsoft continuously improve the application's performance.

- **Use clear and specific prompts:** For best results, submit prompts that are concise, context-rich, and related to the security domain. For example, instead of a vague question like "Tell me about threats," ask "Summarize the latest threat actors targeting the healthcare industry in the last 30 days." Specific prompts help Copilot generate more accurate and actionable results.

- **Monitor for performance drift:** If you observe a decline in the quality of Copilot outputs over time, report the issue using the feedback tools. Consistent feedback helps Microsoft detect and address performance drift across the user base.

Deployers should:

- **Ensure proper access provisioning and role assignment:** Before deploying Copilot in Defender, ensure that users have provisioned access to Microsoft Security Copilot with sufficient Security Compute Units capacity. Assign role-based permissions using the principle of least privilege so that analysts, administrators, and agents have only the access required for their responsibilities. For agentic capabilities such as the Phishing Triage Agent and Threat Intelligence Briefing Agent, verify that the required Microsoft Entra roles and prerequisites are met before enabling these features.

- **Upload organization-specific response guidelines:** Administrators can upload custom response guidelines that Copilot uses to tailor guided response recommendations to the organization's policies and procedures. This helps ensure that Copilot's recommendations are aligned with the organization's security posture and operational requirements.

- **Configure incident summary settings appropriately:** Copilot's automatic incident summarization can be configured to run "Always," "Based on severity level," or "On demand only." Deployers should select the setting that aligns with their SOC workflow and compute budget to balance responsiveness with resource consumption.

- **Test Copilot capabilities across your environment:** Before broadly enabling Copilot, test key capabilities such as incident summarization, guided responses, script analysis, and KQL query generation using realistic data and scenarios from your environment. Validate that outputs are accurate, relevant, and actionable for your specific workloads and data sources.

- **Monitor and review autonomous agent activity:** For agentic capabilities such as the Phishing Triage Agent and Dynamic Threat Detection Agent, deploy initial monitoring to review agent classifications and alerts. Ensure that analysts are reviewing autonomous determinations and providing feedback, particularly during the initial deployment period, to calibrate the agent to your organization's context.

- **Plan for compute capacity and latency:** Response generation may take up to several minutes and requires GPU capacity. Deployers should plan for potential latency during periods of high demand and communicate expected response times to analysts so they can plan their workflows accordingly.

## Learn more about Microsoft Copilot in Microsoft Defender

For additional guidance or to learn more about the responsible use of Microsoft Copilot in Microsoft Defender, we recommend reviewing the following documentation:

- [Microsoft Security Copilot in Microsoft Defender](security-copilot-in-microsoft-365-defender.md)
- [What is Microsoft Security Copilot?](/security-copilot/microsoft-security-copilot)
- [Privacy and data security in Security Copilot](/copilot/security/privacy-data-security)
- [Microsoft's compliance with the EU AI Act](https://www.microsoft.com/trust-center/compliance/eu-ai-act)
- [Get started with Security Copilot](/security-copilot/get-started-security-copilot)

### Learn more about responsible AI

- [Microsoft AI principles](https://www.microsoft.com/ai/responsible-ai)
- [Microsoft responsible AI resources](https://www.microsoft.com/ai/responsible-ai-resources)
- [Microsoft Azure Learning courses on responsible AI](/training/paths/responsible-ai-business-principles/)
