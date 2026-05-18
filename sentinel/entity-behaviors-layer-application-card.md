---
title: Application card for Microsoft Sentinel UEBA behaviors layer
titleSuffix: Microsoft Security
description: Learn about the capabilities, intended uses, limitations, and responsible AI practices for the Microsoft Sentinel UEBA behaviors layer
author: guywi-ms
ms.author: guywild
ms.reviewer: mschechter
ms.topic: concept-article
ms.date: 04/10/2026
ms.service: microsoft-sentinel
ms.custom: responsible-ai-transparency
ms.collection: msec-ai-copilot

#customer intent: As a security analyst, I want to understand the responsible AI application card for the Microsoft Sentinel UEBA behaviors layer
---

# Application card: Microsoft Sentinel UEBA Behaviors Layer

## What is an Application Card?

Microsoft's Application and Platform cards are intended to help you understand how our AI technology works, the choices application owners can make that influence application performance and behavior, and the importance of considering the whole application, including the technology, the people, and the environment. Application cards are created for AI applications and platform cards are created for AI platform services. These resources can support the development or deployment of your own applications and can be shared with users or stakeholders impacted by them.

As part of its commitment to responsible AI, Microsoft adheres to six core principles: fairness, reliability and safety, privacy and security, inclusiveness, transparency, and accountability. These principles are embedded in the Responsible AI Standard, which guides teams in designing, building, and testing AI applications. Application and Platform Cards play a key role in operationalizing these principles by offering transparency around capabilities, intended uses, and limitations.

For further insight, readers are encouraged to explore Microsoft's [Responsible AI Transparency Report](https://www.microsoft.com/ai/responsible-ai) and [Code of Conduct](https://www.microsoft.com/legal/terms-of-use), which outline how enterprise customers and individuals can engage with AI responsibly.

## 1. Overview

The Microsoft Sentinel UEBA behaviors layer is an AI-powered capability within Microsoft Sentinel's User and Entity Behavior Analytics (UEBA) that transforms fragmented raw security logs into contextualized behavioral insights. It automatically aggregates and summarizes high-volume security events into structured, plain-language patterns that explain "who did what to whom," enriched with MITRE ATT&CK mappings, entity roles, and natural language explanations. This abstraction layer helps security teams move beyond manual log correlation by providing unified, consistent behavior records across diverse log sources.

The UEBA behaviors layer is designed for enterprise security teams—including SOC analysts, threat hunters, and detection engineers—who use Microsoft Sentinel for security operations. By reducing investigation time, translating noisy low-level logs into clear summaries, and adding industry-standard security context, the behaviors layer accelerates threat detection, investigation, and response without requiring deep familiarity with every log source format. It complements existing UEBA anomaly detection capabilities and integrates seamlessly into existing workflows for detection rules, incident analysis, and automation.

For more information, see [Translate raw security logs to behavioral insights using UEBA behaviors in Microsoft Sentinel](entity-behaviors-layer.md) and [Advanced threat detection with UEBA in Microsoft Sentinel](identify-threats-with-entity-behavior-analytics.md). Watch the [UEBA behaviors webinar](https://www.youtube.com/watch?v=SqbxmGdMP7c) for a full overview and demo.

## 2. Key terms

The following list provides a glossary of key terms related to the Microsoft Sentinel UEBA behaviors layer:

**Aggregated behavior:** A behavior type that detects volume-based patterns by collecting related events over time windows. For example, a user accessing 50 or more resources in one hour, or login attempts from 10 or more different IP addresses.

**Behavior record:** A structured data object created by the behaviors layer that includes a natural language description, unified schema, references to underlying raw logs, MITRE ATT&CK mappings, and entity relationship mappings.

**Entity:** A discrete object of interest in a security investigation, such as a user, host, IP address, application, or device. The behaviors layer identifies entities involved in each behavior and assigns them roles such as actor, target, or other.

**MITRE ATT&CK:** An industry-standard knowledge base of adversary tactics, techniques, and procedures used to categorize and contextualize security events. The behaviors layer tags every behavior with relevant MITRE ATT&CK tactics and techniques.

**Sequenced behavior:** A behavior type that identifies multi-step patterns or complex attack chains that are not obvious when examining individual events. For example, an access key created, followed by use from a new IP address, followed by privileged API calls.

**User and Entity Behavior Analytics (UEBA):** A capability in Microsoft Sentinel that uses machine learning to build dynamic behavioral profiles for users, hosts, IP addresses, applications, and other entities, and detects anomalies by comparing current activity to established baselines.

## 3. Key features or capabilities

The key features and capabilities outlined here describe what the Microsoft Sentinel UEBA behaviors layer is designed to do and how it performs across supported tasks.

- **Behavior aggregation:** The behaviors layer automatically groups and sequences related security events across multiple data sources into unified behavior objects. Instead of analysts manually correlating raw logs, the layer creates cohesive records that present what happened in a structured, queryable format, reducing investigation time and analyst effort.

- **Contextualization with MITRE ATT&CK mappings:** Each behavior is enriched with security context, including mapping to MITRE ATT&CK tactics and techniques. This helps analysts immediately understand the potential intent behind an activity—such as lateral movement or privilege escalation—without needing deep familiarity with every log format or vendor-specific schema.

- **Natural language explainability:** The behaviors layer generates plain-language summaries of each behavior, making investigations faster and more accessible. Analysts can quickly see what happened and why it matters, without manually interpreting raw log entries or writing complex queries to reconstruct timelines.

- **Unified schema across diverse log sources:** All behaviors use a consistent data structure regardless of the originating product or log type. This eliminates the need for analysts to translate different log formats or join high-volume tables, enabling cross-source correlation and consistent detection rule authoring.

- **Entity relationship mapping:** Each behavior identifies the entities involved—users, hosts, IP addresses—and their roles (actor, target, or other). This structured entity mapping enables rapid investigation by clearly showing who performed an action, what was affected, and how entities relate to one another within an event.

- **Support for detection rules and automation:** Behaviors provide normalized, high-quality signals with built-in context that simplify detection rule logic. Detection engineers can create clearer, simpler rules using behavior records rather than writing complex cross-source correlation queries. Behaviors also serve as reliable triggers for automation playbooks, reducing false positives from low-level event-driven alerts.

- **Seamless integration with existing workflows:** Behavior records are stored in dedicated tables (BehaviorInfo, BehaviorEntities, SentinelBehaviorInfo, SentinelBehaviorEntities) that integrate with existing Microsoft Sentinel workflows for detection rules, investigations, incident analysis, workbooks, and advanced hunting in the Microsoft Defender portal.

## 4. Intended uses

The Microsoft Sentinel UEBA behaviors layer can be used in multiple scenarios across a variety of industries. Some examples of use cases include:

- **Investigation and incident enrichment:** SOC analysts can use behaviors to gain immediate clarity about what happened around an alert without pivoting across multiple raw log tables. For example, when an alert indicates possible credential exfiltration, the analyst can see a behavior such as "Suspicious mass secret access via AWS IAM by User123" mapped to MITRE Technique T1552, aggregated from 20 raw AWS log entries. This provides the context needed to escalate or close an incident without manually reviewing each individual log entry.

- **Threat hunting across diverse data sources:** Threat hunters can search for meaningful patterns using MITRE tactics, techniques, behavior titles, or specific entities, rather than writing complex KQL queries or normalizing raw logs manually. For example, a hunter can filter behaviors by the "Discovery" tactic to identify reconnaissance activity, or search for rare behaviors seen fewer than five times in 30 days to surface potentially anomalous activity that wouldn't trigger traditional alert-based detections.

- **Simplified detection rule authoring:** Detection engineers can build clearer, more resilient detection rules by referencing behavior records instead of stitching together raw events. For example, a rule can alert when a user has a "Creation of new AWS access key" behavior followed by an "Elevation of privileges in AWS" behavior within one hour—logic that would otherwise require interpreting raw AWSCloudTrail events directly and would break if the log schema changed.

- **Automation triggers for non-alert workflows:** Security teams can use behaviors as triggers for automation playbooks in scenarios where creating a full alert would be excessive. For example, a behavior indicating that a user accessed an unusual number of resources can trigger an automated email notification or verification workflow without generating a formal security alert, reducing alert fatigue while maintaining visibility.

- **Cross-source correlation for multi-cloud environments:** Organizations operating across AWS, GCP, and on-premises environments can use the unified behavior schema to correlate activities across cloud providers and vendors without needing to understand each provider's log format. This enables consistent security monitoring and investigation across heterogeneous environments.

## 5. Models and training data

The Microsoft Sentinel UEBA behaviors layer leverages a variety of AI models to power the experience that users see. Generative AI mechanisms create behavior rules based on sample logs, generating aggregation and sequencing logic that reflects the intent and action behind those logs. These AI-generated rules are then validated to ensure that the intent, action, and entities are accurately captured and explained. Some examples of models involved include [Azure OpenAI Service models](https://aka.ms/aoa-transparency) and the machine learning models underlying Microsoft Sentinel's UEBA engine. To learn more about the data used to train the foundation models behind the UEBA behaviors layer, refer to the linked model cards to find the relevant data cards.

## 6. Performance

The Microsoft Sentinel UEBA behaviors layer is designed to perform reliably when processing supported security logs in near real-time to produce structured behavior records. The intended inputs are raw security logs from supported data sources ingested into the Microsoft Sentinel Analytics tier. The expected outputs are structured behavior records containing natural language descriptions, MITRE ATT&CK mappings, entity roles, and references to the underlying raw log entries, stored in the BehaviorInfo, BehaviorEntities, SentinelBehaviorInfo, and SentinelBehaviorEntities tables.

The behaviors layer currently supports a defined set of data sources: CommonSecurityLog (CyberArk Vault, Palo Alto Threats), AWSCloudTrail (EC2, IAM, S3, EKS, Secrets Manager), and GCPAuditLogs (admin activity, data access, and access transparency logs). The layer generates two types of behavioral patterns—aggregated behaviors that detect volume-based patterns over time windows, and sequenced behaviors that identify multi-step attack chains. Behavior records are created immediately when patterns are identified or when time windows close, at tailored intervals specific to each behavior's logic.

The behaviors layer requires a Microsoft Sentinel workspace onboarded to the Microsoft Defender portal, with at least one supported data source actively sending logs to the Analytics tier. After enabling, initial behavior generation typically begins within 15 to 30 minutes. The behaviors layer supports English language outputs for natural language descriptions and summaries. Performance depends on the quality and completeness of the ingested logs—incomplete or noisy logs can reduce the accuracy and usefulness of generated behaviors.

## 7. Limitations

Understanding the Microsoft Sentinel UEBA behaviors layer's limitations is crucial to determine if it is used within safe and effective boundaries. While we encourage customers to leverage the Microsoft Sentinel UEBA behaviors layer in their innovative solutions or applications, it's important to note that the Microsoft Sentinel UEBA behaviors layer was not designed for every possible scenario. We encourage users to refer to either the [Microsoft Enterprise AI Services Code of Conduct](https://www.microsoft.com/licensing/terms/productoffering/MicrosoftAzure) (for organizations) or the [Code of Conduct section in the Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) (for individuals) as well as the following considerations when choosing a use case:

- **Limited data source coverage:** The behaviors layer currently supports only CommonSecurityLog (CyberArk Vault and Palo Alto Threats), AWSCloudTrail, and GCPAuditLogs. Logs from unsupported vendors or data sources will not produce behavior records, even if the data source is connected to your workspace. Users should verify that their log sources are among the supported vendors before relying on behaviors for coverage.

- **Dependence on log quality:** The accuracy and usefulness of generated behaviors depend on the quality of the ingested raw logs. Incomplete, noisy, or improperly formatted logs can reduce accuracy and result in missing or misleading behavior records. Users should ensure high-quality log ingestion and validate that data connectors are properly configured.

- **Incomplete behavior coverage:** The behaviors layer does not currently capture every possible action or attack technique, even for supported data sources. Some events might not produce corresponding behavior records. Users should not assume that the absence of a behavior means no activity occurred, and should always review raw logs for critical investigations where something might be missing.

- **Behaviors are not alerts or anomalies:** Behaviors are neutral observations, not classified as malicious or benign. The presence of a behavior means "this happened," not "this is a threat." Anomaly detection remains a separate capability in UEBA. Users should combine behaviors with anomaly data and apply human judgment to identify truly noteworthy patterns.

- **Single workspace limitation:** The behaviors layer can currently be enabled on only a single Microsoft Sentinel workspace per tenant. Organizations with multiple workspaces should plan which workspace to enable the behaviors layer on based on their coverage and investigation needs.

- **Preview feature status:** The behaviors layer is a preview feature. The behavior schema, AI models, and supported data sources may evolve substantially before general availability. Microsoft makes no warranties, expressed or implied, with respect to prerelease information.

- **Potential for excessive behavior volume:** While behaviors aim to reduce noise by aggregating and sequencing events, some environments may still produce a high volume of behavior records. Users should monitor behavior data ingestion and provide feedback on specific behavior types to help improve coverage and relevance.

- **Sensitive data protection:** While AI-generated rules are validated to ensure sensitive data is protected, users should review behavior outputs to confirm that no sensitive information is inadvertently surfaced in natural language descriptions or behavior records.

## 8. Evaluations

Performance and safety evaluations assess whether AI applications are operating reliably and securely by examining factors like groundedness, relevance, and coherence while identifying the risks of generating harmful content. The following evaluations were conducted with safety components already in place, which are also described in [9. Safety Components and Mitigations](#9-safety-components-and-mitigations).

### 8.1 Performance and quality evaluations

Performance evaluations for AI applications are essential to improving their reliability in real-world applications. Metrics like groundedness, relevance, and coherence help assess the accuracy and consistency of AI-generated outputs, so that they are factually supported in grounded content scenarios, contextually appropriate, and logically structured. For the Microsoft Sentinel UEBA behaviors layer, we conducted performance evaluations for the following metrics, which are available through Microsoft Foundry:

- Groundedness
- Coherence
- Fluency
- Similarity

#### 8.1a Performance and quality evaluation methods

The Microsoft Sentinel UEBA behaviors layer was evaluated across text-based generative AI capabilities, as the application generates natural language behavior descriptions and structured behavior records from raw security logs. Evaluations focused on the accuracy of intent, action, and entity capture within AI-generated behavior rules, the correctness of MITRE ATT&CK mappings, the quality and clarity of natural language explanations, and the behavior volume thresholds to ensure generated behaviors provide meaningful value.

The evaluation methodology involved testing AI-generated behavior rules against representative sample logs from supported data sources, measuring whether the rules accurately reflected the underlying security events. An ideal result is one where the behavior rule correctly captures the intent and action behind the raw logs, assigns accurate MITRE ATT&CK mappings, identifies and roles entities correctly, and produces a clear, understandable natural language summary. A suboptimal result would involve misidentified intent or actions, incorrect MITRE mappings, missing entities, or unclear descriptions that require manual log review to understand.

### 8.2 Risk and safety evaluations

Evaluating potential risks associated with AI-generated content is essential for safeguarding against content risks with varying degrees of severity. This includes evaluating an AI application's predisposition towards generating harmful content or testing vulnerabilities to jailbreak attacks. For the Microsoft Sentinel UEBA behaviors layer, we conducted risk and safety evaluations for the following metrics available through Microsoft Foundry:

- Hate and unfairness
- Violence
- Self-harm
- Indirect jailbreak
- Direct jailbreak
- Ungrounded attributes

#### 8.2a Risk and safety evaluation methods

The Microsoft Sentinel UEBA behaviors layer was evaluated for text-based generative AI capabilities, specifically the natural language descriptions and structured outputs it produces from security log data. Safety evaluations tested whether the AI-generated behavior rules and descriptions could produce harmful, biased, or inappropriate content, or whether adversarial inputs could manipulate the system into generating unintended outputs.

An ideal evaluation result is one where the behaviors layer consistently produces neutral, factual, security-relevant behavior descriptions grounded in the underlying log data, without introducing harmful content, bias, or ungrounded claims. A suboptimal result would be one where the system generates misleading security claims not supported by the log data, surfaces sensitive information inappropriately, or produces outputs that could be manipulated through adversarial log entries.

### Evaluation data for quality and safety

Our evaluation data is custom-built to assess AI application performance across key areas of safety and quality, simulating real-world scenarios and risks. We begin by identifying relevant evaluation aspects of concern based on multi-disciplinary research and expert input. These concerns are translated into targeted evaluation objectives and guide formulation of evaluation metrics. For safety, we create adversarial prompts to elicit undesirable or edge-case responses, which are then scored using AI-assisted annotators trained to assess alignment with Microsoft's safety standards. For quality, we craft rubric-based prompts relevant to scenarios including evaluating retrieval-augmented generation (RAG) applications and agents. Datasets are curated from diverse sources including synthetic and public datasets to simulate real-world user scenarios. Using the curated datasets, both evaluations undergo iterative refinement and human alignment to improve metric efficacy and reliability. This methodology forms the foundation of repeatable, rigorous assessments that reflect how customers use evaluations to build better and safer AI.

### 8.3 Custom evaluations

The Microsoft Sentinel UEBA behaviors layer underwent custom evaluations specifically designed for its security-domain use cases. These evaluations focused on text-based modalities and assessed the accuracy of behavior rule generation from sample logs, the correctness of MITRE ATT&CK tactic and technique assignments, the completeness of entity identification and role assignment, and the quality and clarity of natural language behavior descriptions.

The evaluation methodology included testing with representative security log samples from supported data sources—including AWS CloudTrail, CommonSecurityLog (CyberArk Vault and Palo Alto), and GCP Audit Logs—and measuring whether the AI-generated behavior rules accurately reflected the security events. Evaluations also verified that behavior volume thresholds provided meaningful value and that sensitive data was not surfaced in behavior outputs. An ideal outcome is a complete, accurate behavior record that correctly summarizes the underlying security activity with proper MITRE context. A suboptimal outcome would involve missing or incorrect entity identification, wrong MITRE mappings, or behavior descriptions that do not accurately reflect the underlying log data.

## 9. Safety components and mitigations

- **AI-generated rule validation:** All AI-generated behavior rules undergo validation to ensure that intent, action, and entities are accurately captured and explained. Rules are also validated to confirm that behavior volume is above defined thresholds to provide meaningful value, and that sensitive data is protected in the generated outputs.

- **Privacy and responsible AI by design:** The behaviors layer was designed based on privacy and responsible AI principles to ensure transparency and explainability. Behaviors do not introduce new compliance risks or opaque analytics into your SOC. Each behavior includes references to the underlying raw logs, enabling analysts to verify any AI-generated output against the source data.

- **Role-based access control:** Access to behavior data requires appropriate permissions. Enabling the behaviors layer requires the Security Administrator role in Microsoft Entra ID and the Microsoft Sentinel Contributor role. Querying behaviors requires the Security Reader or Security Operator role and read access to the behavior tables and source tables, enforcing the principle of least privilege.

- **Neutral behavior classification:** Behaviors are intentionally designed as neutral observations rather than threat classifications. This design prevents the system from introducing false certainty about threats, ensuring that analysts apply human judgment and combine behaviors with anomaly detection and other signals to determine risk.

- **Data ingestion monitoring:** Users can monitor behavior data ingestion by querying the Usage table for entries related to SentinelBehaviorInfo and SentinelBehaviorEntities, providing visibility into data volume and enabling cost management.

- **Preview-stage controlled release:** The behaviors layer is released as a preview feature, allowing Microsoft to collect user feedback and identify issues before general availability. This iterative approach enables safety and performance improvements based on real-world usage.

- **Drill-down to raw logs:** Every behavior record includes references to the original event IDs through the AdditionalFields and SupportingEvidence fields, enabling analysts to verify any AI-generated behavior against the underlying raw log data. This transparency ensures that no behavior operates as a "black box."

## 10. Best practices for deploying and adopting the Microsoft Sentinel UEBA behaviors layer

Responsible AI is a shared commitment between Microsoft and its customers. While Microsoft builds AI applications with safety, fairness, and transparency at the core, customers play a critical role in deploying and using these technologies responsibly within their own contexts. To support this partnership, we offer the following best practices for deployers and end users to help customers implement responsible AI effectively.

Deployers and end-users should:

- **Exercise caution and evaluate outcomes when using the Microsoft Sentinel UEBA behaviors layer for consequential decisions or in sensitive domains:** Consequential decisions are those that may have a legal or significant impact on a person's access to education, employment, financial platforms, government benefits, healthcare, housing, insurance, legal platforms, or that could result in physical, psychological, or financial harm. Sensitive domains—such as financial platforms, healthcare, and housing—require particular care due to the potential for disproportionate impact on different groups of people. When using AI for decisions in these areas, make sure that impacted stakeholders can understand how decisions are made, appeal decisions, and update any relevant input data.

- **Evaluate legal and regulatory considerations:** Customers need to evaluate potential specific legal and regulatory obligations when using any AI platforms and solutions, which may not be appropriate for use in every industry or scenario. Additionally, AI platforms or solutions are not designed for and may not be used in ways prohibited in applicable terms of service and relevant codes of conduct.

End-users should:

- **Exercise human oversight when appropriate:** Human oversight is an important safeguard when interacting with AI applications. While we continuously improve our AI applications, AI might still make mistakes. The outputs generated may be inaccurate, incomplete, biased, misaligned, or irrelevant to your intended goals. This could happen due to various reasons, such as ambiguity in the inputs or limitations of the underlying models. As such, users should review the responses generated by the Microsoft Sentinel UEBA behaviors layer and verify that they match their expectations and requirements.

- **Be aware of the risk of overreliance:** Overreliance on AI happens when users accept incorrect or incomplete AI outputs, mainly because mistakes in AI outputs may be hard to detect. For the end-user, overreliance could result in decreased productivity, loss of trust, application abandonment, financial loss, psychological harm, physical harm, among others. In the context of the UEBA behaviors layer, overreliance might lead analysts to assume that the absence of a behavior means no suspicious activity occurred, or to treat a neutral behavior observation as a confirmed threat without further investigation. Always review raw logs when investigating critical security events.

- **Exercise caution when designing agentic AI in sensitive domains:** Users should exercise caution when designing and/or deploying agentic AI applications in sensitive domains where agent actions are irreversible or highly consequential. Additional precautions should also be taken when creating autonomous agentic AI as described further in either the [Microsoft Enterprise AI Services Code of Conduct](https://www.microsoft.com/licensing/terms/productoffering/MicrosoftAzure) (for organizations) or the [Code of Conduct section in the Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) (for individuals).

- **Understand that behaviors are not threat classifications:** Behaviors are neutral observations that indicate "this happened," not "this is a threat." Combine behaviors with UEBA anomaly data, alert data, and human judgment to determine whether a pattern is genuinely noteworthy. Do not use the presence or absence of a behavior as the sole basis for a security decision.

- **Validate AI-generated outputs before deploying detection rules:** Before deploying detection rules based on behavior records, review the AI-generated behavior descriptions and MITRE ATT&CK mappings to confirm accuracy. Test rules against representative data to verify that they produce expected results before enabling them in production environments.

- **Provide feedback to help improve the application:** Microsoft welcomes user feedback on behavior types, relevance, and accuracy to help improve the behaviors layer. If specific behavior types produce too many or too few records, or if descriptions are unclear, report this through your Microsoft support channels.

Deployers should:

- **Ensure proper onboarding and prerequisite configuration:** Before deploying the UEBA behaviors layer, verify that your Microsoft Sentinel workspace is onboarded to the Microsoft Defender portal, that at least one supported data source is actively sending logs to the Analytics tier, and that users have the appropriate roles (Security Administrator for enablement, Security Reader or Security Operator for querying).

- **Enable supported data connectors:** The behaviors layer only generates behaviors when supported data sources (CommonSecurityLog, AWSCloudTrail, GCPAuditLogs) are connected and actively sending logs. Verify that the correct vendors and log types are being ingested and that the data source toggles are enabled specifically for the behaviors layer, separate from other UEBA capabilities.

- **Monitor behavior data ingestion and costs:** Behavior records are stored in dedicated tables and contribute to your workspace's data ingestion volume, billed at your existing Log Analytics and Sentinel ingestion rate. Monitor the Usage table regularly to understand behavior data volume and manage costs effectively.

- **Plan for single-workspace limitation:** Since behaviors can currently be enabled on only one workspace per tenant, carefully select which workspace to enable based on the data sources it receives and your investigation priorities. Ensure the chosen workspace has the broadest coverage of supported log sources.

- **Keep the feature updated and monitor for changes:** As a preview feature, the behaviors layer may undergo schema changes, new data source support, and model improvements. Monitor Microsoft documentation for updates and plan for potential adjustments to detection rules and queries.

- **Test in controlled environments before broad adoption:** Enable the behaviors layer and test with representative data before relying on it for production security operations. Validate that behavior outputs meet your organization's accuracy and performance standards, and that detection rules based on behaviors produce expected results.

## 11. Learn more about the Microsoft Sentinel UEBA behaviors layer

For additional guidance or to learn more about the responsible use of the Microsoft Sentinel UEBA behaviors layer, we recommend reviewing the following documentation:

- [Translate raw security logs to behavioral insights using UEBA behaviors in Microsoft Sentinel](entity-behaviors-layer.md)
- [Advanced threat detection with UEBA in Microsoft Sentinel](identify-threats-with-entity-behavior-analytics.md)
- [Enable UEBA in Microsoft Sentinel](enable-entity-behavior-analytics.md)
- [Investigate incidents with UEBA data](investigate-with-ueba.md)
- [Microsoft Sentinel UEBA data sources and schema enrichments](ueba-reference.md)
- [Responsible AI FAQ for the Microsoft Sentinel UEBA behaviors layer](entity-behaviors-layer-rai-faqs.md)

### Learn more about responsible AI

- [Microsoft AI principles](https://www.microsoft.com/ai/principles-and-approach)
- [Microsoft responsible AI resources](https://www.microsoft.com/ai/responsible-ai)
- [Microsoft Azure Learning courses on responsible AI](/training/paths/responsible-ai-business-principles/)
