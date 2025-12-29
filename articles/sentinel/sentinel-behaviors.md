---
title: Extract behavioral insights from raw security logs using Sentinel behaviors (Preview)
description: Explore Sentinel behaviors that converts security telemetry into normalized behavioral patterns for investigation, hunting, and detection engineering.
author: guywi-ms
ms.author: guywild
ms.reviewer: mshechter
ms.date: 12/29/2025
ms.topic: how-to
ms.service: microsoft-sentinel
#Customer intent: As a security analyst, I want to use Sentinel behaviors to translate raw security telemetry into human-readable patterns with MITRE ATT&CK context for faster threat detection and investigation.
---

# Extract behavioral insights from raw security logs using Sentinel behaviors (Preview)

**Sentinel behaviors** uses AI to translate raw security telemetry into easy-to-understand behavioral patterns that answer the questions *"What happened?* and *Who did what to whom?"*. 

Instead of analyzing individual AWS CloudTrail events or firewall logs, analysts see a behavior - like "**Inbound remote management session from external address**" - that summarizes multiple raw events and maps them to known tactics, techniques, and procedures (TTPs). This abstraction layer enables faster threat detection, investigation, and response across your security operations. 

This article explains how the Sentinel behaviors works, how to enable it, and how to use Sentinel behaviors to enhance security operations.  

## How Sentinel behaviors works

Sentinel behaviors:

- **Explains events in context:** It adds security context and narrative to sequences of raw logs, making them easier to understand (for example, who did *what* to *whom*, and *why it matters*).

- **Unifies schemas:** Behaviors are represented in a single, unified schema across different products and data types, so analysts no longer need to mentally translate between different log formats or join high volume tables.

- **Maps to MITRE ATT&CK:** Every behavior is tagged with relevant MITRE tactics and techniques, providing industry-standard context at a glance.

- **Works with anomalous *and* normal events:** It's not limited to anomalies. Sentinel behaviors surfaces *all kinds of activities* (normal or malicious) in a structured way.

- **Integrates into Sentinel:** Behaviors are stored in your Log Analytics workspace as special tables. You can query them with KQL, use them in detection rules, or view them alongside incidents, just like any other log data in Sentinel.

- **Near real-time availability:** Behaviors are aggregated and sequenced behaviors based on a time window, tailored to each logic. Once the time window closes or the pattern is identified, the behavior log is created immediately.

Behaviors can be aggregations or sequencing of raw logs:

- **Aggregation Behaviors**: Detect volume-based patterns (for example, "User accessed 50+ resources in 1 hour" or "Login from 10+ different IP addresses"). These are great for spotting unusual activity levels and turning high volume logs into security insights.

- **Sequencing behaviors**: Detect multistep patterns that surface complex chains that wouldn't be obvious from individual events.

Generative AI capabilities power Sentinel behaviors to create and scale the insights that behaviors provide on top of the raw logs. The AI is used to create the behaviors’ logic, entities mapping, MITRE mapping, and explainability, as well as for quality guardrails. Each behavior maps to the raw logs, so you can always see which events are part of the logic described in the behavior. You can find the originating eventIDs in the **"additional fields"**.

<!-- [\[link to RAI FAQ\]](#_10._RAI_FAQ) -->

## Value proposition

Sentinel behaviors brings several key benefits to Security Operations teams, helping them work faster and smarter with high-volume data. In summary, it provides:

- **Clarity:** Translates low-level, noisy logs into clear, human-readable summaries of activity. Analysts see **what happened in plain language**, without wading through raw event syntax. For example, instead of 100 individual log lines about port scans, a behavior might say "Port scanning activity detected from host X targeting Y." This clarity improves understanding and onboarding for junior analysts.

- **Context:** Strings related events together into meaningful patterns, enriched with contextual info. Each behavior is tagged with relevant MITRE ATT&CK tactics and techniques and includes roles of entities (such as actor versus target). This approach gives instant security context – you don't just see *what* happened, but also *how it fits* in an attack framework or timeline.

- **Prioritization:** By working at the behavior level, analysts can focus on higher-level signals rather than disparate low-level events. Behaviors help highlight what matters – they naturally aggregate minor events into bigger stories, so important patterns stand out. This approach also aids **incident prioritization**: seeing multiple related behaviors can indicate a concentrated attack sequence, versus isolated benign events.

- **Efficiency:** Reduces investigation and hunting time by **stitching events into cohesive stories.** For the behaviors logic already in the system, analysts no longer need to manually join data from multiple sources or pivot across numerous tables. Those behaviors rules expand over time. For example, if investigating a suspected breach, an analyst can query the Behaviors table for an entity (user, host, and so on) and get an immediate timeline of that entity's actions (across AWS, on-prem firewall, and so on) instead of querying each log source separately. This approach speeds up MTTR (Mean Time to Respond) significantly.

- There's no full coverage of the originating table to behaviors.<!-- The number of rules and insights will expand over time. -->

## Prerequisites

To use Sentinel behaviors, you need:

- A Microsoft Sentinel workspace that's onboarded to the Defender portal.
- Ingest one or more of the [supported data sources](#supported-data-sources) into the Analytics tier.  
- Existing UEBA capabilities aren't a prerequisite.
- No additional license is required.

## Permissions required 

To enable and use Sentinel behaviors, you need these permissions:

## Enable Sentinel behaviors 

To enable Sentinel behaviors in your workspace:

1. In the Defender portal, select **System > Settings > Microsoft Sentinel > SIEM workspaces**.
1. Select the Sentinel workspace where you want to enable Sentinel behaviors.
1. Select **Enable behavior analytics > Configure UEBA > New! Sentinel Behaviors**.
1. Toggle on **Enable Sentinel Behaviors**.

  > [!IMPORTANT]
  > This feature currently works **on a single workspace in your tenant**.

## Supported data sources

The list of supported data sources and vendors/services that send logs to these data sources is evolving.
Sentinel behaviors automatically aggregates insights for all supported vendors based on the logs you collect.

During public preview, Sentinel behaviors focuses on non-Microsoft data sources that traditionally lack easy behavioral context in Sentinel. 

| Data source | Supported vendors and services | Sentinel connector |
|-------------|---------------------------|-------|
| **CommonSecurityLog** | <ul><li>Cyber Ark Vault</li><li>Palo Alto Threats</li></ul> |  |
| **AWSCloudTrail** | <ul><li>EC2</li><li>IAM</li><li>S3</li><li>EKS</li><li>Secrets Manager</li></ul> |  |

> [!IMPORTANT]
> These sources are separate from other UEBA capabilities and need to be enabled specifically. If you enabled AWSCloudTrail for UEBA behaviorAnalytics and Anomalies, you still need to enable it for behaviors.

**What happens after enabling:** After you enable the feature, two new tables ("BehaviorInfo" and "BehaviorEntities") start to populate in your Log Analytics workspace as data comes in. Within a few minutes, you should be able to run log queries to see behaviors derived from recent events.

**Verification:** Verify it's working by running a simple KQL query in Defender's Advanced Hunting. If the customer has the behaviorInfo table because they have MDA and MDC, the query is on the same table, and a union happens behind the scenes. For example:

```kusto
BehaviorInfo
| summarize count() by Title
```

This should return a breakdown of different behavior types being generated (Title is the field representing the kind of behavior). If you see results here, Sentinel behaviors is active. You can also join the two tables:

```kusto
BehaviorInfo
| join kind=inner BehaviorEntities on BehaviorId
| take 10
```

to see sample behaviors with their associated entities. In the description of the behavior, you can see the full explainability of what happened with the associated entities and their roles.

## Use cases and examples

Sentinel behaviors enhances various SOC workflows. Here's how SOC personas (analysts, hunters, detection engineers) can leverage behaviors in **investigations, hunting, detection, and more**, with practical examples:

### Investigation and incident enrichment

For **SOC Analysts responding to incidents**, Sentinel behaviors provides immediate clarity on what activities occurred around an alert or involved entity.

- **Before (without Behaviors):** An analyst triaging an incident might have to pivot across multiple raw log tables to piece together a timeline. For example, if an alert triggers on a suspicious AWS activity, the analyst would manually query CloudTrail logs, then perhaps firewall logs, to understand what that user or host did around that time. This is time-consuming and requires familiarity with each data source’s schema.

- **After (with Behaviors):** Sentinel automatically stitches relevant events into **behavior entries** that can be attached to the incident or queried on demand. The analyst might see related Behaviors like “User created an EC2 instance (AWSCloudTrail)” or “Outbound connection to rare host blocked (Palo Alto),” all using a unified schema. This enriched context reduces the Mean Time to Resolution because the analyst understands the incident’s scope faster – they see the *story* of what happened, not just the alert that triggered.

- **How it works:** Behaviors from various sources can be correlated by entities and time. In practice, you can use KQL to pull behaviors for entities in an incident. Note that not all logs are covered with behaviors, and this coverage will expand over time – both within a data source and across sources.

*Example:* An alert flags possible credential exfiltration. The analyst checks BehaviorInfo and finds a behavior: **"Suspicious mass secret access via AWS IAM by User123"**, mapped to MITRE Technique T1552 (Unsecured Credentials). This single behavior was generated by aggregating 20 AWS API calls. Armed with this, the analyst immediately knows User123 accessed many secrets – crucial context to escalate the incident – without manually reading all 20 log entries.

### Threat hunting

For **Threat Hunters**, Sentinel behaviors acts as a force multiplier by allowing hunting on TTPs and behaviors rather than raw events. Hunters can proactively search for known malicious patterns or explore entity activities in a more intuitive way:

- **Before:** Hunting in Sentinel across multiple datasets meant writing complex queries joining different tables or scanning specific event IDs. Because each log source has its own format, hunters had to normalize data mentally or via KQL and often missed subtle sequences. For example, hunting for signs of reconnaissance might require checking an AWS CloudTrail event type *and* certain firewall connection patterns separately. Security context was mainly available for alerts and incidents, not for raw telemetry, making proactive hunts harder.

- **After:** Behaviors are *already normalized and enriched* with context. A hunter can query the Behaviors table by MITRE technique or by high-level Title across sources. For instance, they could search for any behaviors mapped to "Initial Access" tactics in the last 24 hours, regardless of whether they came from AWS or on-prem logs. Because behaviors distill what happened in a source-agnostic way, the hunter can find relevant activity without writing source-specific queries. This approach improves hunting efficacy and helps discover attacks earlier in the kill chain (even if no alert was generated).

- There's no full coverage of the originating table to behaviors. The number of rules and insights will expand over time.

- **How it works:** The Behaviors table includes columns like Categories (MITRE tactics) and MitreTechniques, as well as a descriptive Title. A hunter can use these to filter. For example, BehaviorInfo | where Categories has "Discovery" | summarize count() by Title might reveal unusual discovery behaviors. Hunters can also see the rarer behaviors in the environment, using *count distinct* on the Title field and pivot to the interesting behaviors type and see which entities, then investigate further. Because the behaviors link back to underlying data (via BehaviorId and AdditionalFields which often contain original log references), a hunter can always drill down to raw logs for verification if needed[^1].

*Example:* A threat hunter wants to identify any stealthy credential access. They query for behaviors with Title containing "enumerate credentials" or similar. Sentinel behaviors returns a few instances of **"Attempted credential dump from Vault by user AdminJoe"** (a behavior derived from CyberArk logs). Even though no alert fired, this behavior stands out. The hunter investigates and finds it was an unusual activity for AdminJoe, potentially catching an early-stage attack. Without Sentinel behaviors, this pattern might have been lost in thousands of vault audit events.

Moreover, hunters can use Sentinel behaviors to hunt **by MITRE tactic**. For example, filter `BehaviorInfo` where `Categories == "Lateral Movement" to instantly see all lateral movement behaviors (across any source). This is powerful because it abstracts *how* an action was done – focusing instead on the intent (tactic).

```kusto
// Find all behaviors for a specific user over last 7 days
BehaviorInfo
| join kind=inner BehaviorEntities on BehaviorId
| where TimeGenerated >= ago(7d)
| where EntityType == "User" and EntityId == "user@domain.com"
| project TimeGenerated, Title, Description, Categories
| order by TimeGenerated desc
// Find rare behaviors (potential anomalies)
BehaviorInfo
| where TimeGenerated >= ago(30d)
| summarize Count=count() by Title
| where Count < 5 // Behaviors seen less than 5 times
| order by Count asc
// Find behaviors by MITRE technique
BehaviorInfo
| where MitreTechniques has "T1078" // Valid Accounts
| project TimeGenerated, Title, Description, SourceTable
```

### Detection engineering and automation

For **Detection Engineers** and those building analytic rules, Sentinel behaviors simplifies rule logic and enables new correlation possibilities:

- **Before:** Creating custom correlation rules on raw logs was challenging. Each data source has different schemas, so writing a generalized detection (say, "Multiple failed admin actions across cloud and on-prem") meant either writing multiple rules or a very complex single query with normalization logic. Also, lacking context, many rules had to include lots of conditions to reduce false positives, or they relied on alerts as inputs rather than raw events. Automation (SOAR playbooks) similarly struggled if triggers were too low-level – you risked responding to benign events.

- **After:** Behaviors provide **high-quality, normalized signals** that can serve as the triggers or building blocks for detection rules. Since behaviors already aggregate related events, a single behavior can replace what previously required correlating many atomic events. Also, each behavior comes with MITRE tags and entity roles, which you can use in rule logic (for example, a rule could look for a sequence: Behavior with T1078 (Valid Accounts) followed by Behavior with T1566 (Phishing) by the same user). Detection engineers can write rules that are **simpler** and more **explainable**, because the rule conditions align with human-understandable behavior descriptions.

- **How it works:** The **BehaviorInfo** table is fully accessible via KQL, so you can use it in analytic rule queries just like any other log. For example, a detection rule might be: *"Alert if a user has a 'Creation of new AWS access key' behavior followed by an 'Elevation of privileges in AWS' behavior within 1 hour."* This rule catches a potential key compromise and privilege escalation sequence. Without Sentinel behaviors, that rule would require stitching together raw CloudTrail events and interpreting them in the rule logic. With behaviors, it's straightforward and resilient to log schema changes (since the schema is unified).

Additionally, for **automation** (SOAR), behaviors can act as reliable triggers. Instead of creating alerts for non-risky activities, use behaviors as building blocks for automation such as an email or verification with user.

## Pricing model

Sentinel behaviors introduces new log data into your Sentinel workspace, which affects cost and licensing. Consider the following points:

- **No extra license cost:** The Behaviors feature is part of the Sentinel solution (currently in preview) – you don't pay extra to turn it on. If you enable Sentinel on a workspace and onboard to the Defender portal, you can use behaviors. There's no need for a separate SKU or add-on license, nor a prerequisite to enable other UEBA capabilities.

- **Log data ingestion charges:** Behaviors are stored as records in Azure Monitor (Log Analytics) like any other log. Specifically, behaviors reside in two tables (BehaviorInfo and BehaviorEntities) within your Log Analytics workspace. This storage means that **each behavior record adds to your data volume** and you pay according to your Sentinel/Log Analytics data ingestion rates.

## Privacy and responsible AI considerations

Microsoft developed the Behaviors feature with **privacy and responsible AI principles** in mind. It doesn't introduce new compliance risks or opaque "black box" analytics into your SOC.

**Responsible AI and use of ML/AI:** Sentinel behaviors is "AI-powered" because it uses machine learning (including NLP/LLM techniques) in its creation. However, Microsoft carefully applied AI in a way that maintains **deterministic and explainable outputs** for the end user:

- The "AI" (including large language models) is used offline by Microsoft's engineering team to help **develop and validate the behavioral rules** – for example, to suggest correlations of events or to generate the natural-language descriptions of behaviors. These AI-generated rules are then tested and deployed as standard detection rules (KQL queries running on your data). The key point: at runtime in your environment, behaviors are generated by **fixed, tested correlation logic**, not an AI model making unpredictable decisions. This means each behavior output is **repeatable and explainable** (traceable to specific log patterns) rather than a probabilistic AI guess. It avoids the risk of AI hallucination or bias in your live security data.

## Limitations and known issues (Public Preview)

As a preview feature, Sentinel behaviors comes with certain limitations and is under active development. Be aware of the following limitations when using it:

- **Environment:** Sentinel workspace onboarded to the Defender portal. The feature works on a <u>single workspace in the tenant</u>, per the customer's choosing.<!-- This limitation will be removed in the near future. -->

- **Data source coverage:** In this public preview, behaviors are only generated for specific third-party data sources (AWS CloudTrail and certain CommonSecurityLog sources like Palo Alto and CyberArk, as listed earlier). Those data sources will expand over time – both more behaviors from each data source, and new data sources. These data sources are separate from the other UEBA capabilities, and data sources need to be onboarded to both.

- **Partial coverage within sources:** Even for supported sources, Sentinel behaviors might not capture **every possible action or attack technique** in those logs. So, you might notice that some events still don't produce corresponding behavior. Over time, coverage will increase as more behavior rules are added. Be aware that **absence of a behavior does not equal absence of activity** – always use raw logs as a fallback if you suspect something. The documentation (or release notes) includes lists of what types of behaviors are currently available, to help set expectations.

- **Potential noise and relevance problems:** While behaviors aim to reduce noise by aggregation and sequencing, there can still be scenarios where too many behavior records are generated, or some behaviors aren't very useful. We welcome you to provide feedback on specific behavior types.

- **No anomaly or alert status:** Behaviors are **neutral observations** – they're not classified as “malicious” or “benign” by the system. They're effectively always “informational” logs. So the presence of a behavior in itself doesn't mean you have a problem; it means “this happened.” Some preview users expected behaviors to be flagged if they were unusual (like anomalies)[^2], but that's not in scope for this layer. The anomaly detection still lives in the separate UEBA anomalies. Eventually, anomalies might be calculated on top of behaviors (for example, marking a behavior as anomalous if it deviates from baseline), but in this preview, you won't see, for example, a field that says “anomaly = true” on a behavior. Thus, analysts must use their judgment or combine with UEBA anomaly data to decide which behaviors are noteworthy. We mention this to manage expectations: **Behaviors do not equal alerts.** They might highlight suspicious patterns, but they aren't scored or deduplicated – some assembly required.

In summary, **use Sentinel behaviors as a helpful supplemental tool, but don't solely rely on it** yet for critical decisions. It's a feature that will grow more robustly.

## Troubleshooting

- **No behaviors appearing**: Check that supported data sources are actively ingesting to Analytics tier, verify the data source toggle is on, wait 15-30 minutes after enabling.

- **Fewer behaviors than expected**: Remember coverage is partial and growing; check the supported behavior types list; verify log volume meets minimum thresholds.

- **Understanding behavior counts**: A single behavior might represent tens or hundreds of raw events - this is by design for noise reduction.

- **Tracing back to raw logs**: Use the AdditionalFields column in BehaviorInfo which contains references to original event IDs.

## BehaviorInfo and BehaviorEntities schemas

The system stores behaviors data in **two interrelated log tables** in your Log Analytics workspace: **BehaviorInfo** and **BehaviorEntities**. These tables are Azure Monitor Logs tables (just like any other Sentinel table). You can find their full reference schemas on Microsoft Learn:

- **BehaviorInfo** table – This table contains one record per behavior event. Each record represents a specific observed behavior or pattern. Key fields include a unique **BehaviorId**, **TimeGenerated**, a **Title**, data source (table), a contextual dynamic **Description**, **Categories** (MITRE TTPs), and various other properties or an AdditionalFields JSON with more details (such as the row event IDs). Essentially, BehaviorInfo is where you find the “what happened” description and classification of the behavior.

- **BehaviorEntities** table – This table lists the entities involved in each behavior. There might be multiple records in BehaviorEntities for one BehaviorId (for example, one behavior might involve a source IP, a user account, and a host, each as separate entity entries). Fields include the same **BehaviorId** (to join back to BehaviorInfo), **EntityType** (user, host, file, and more), **EntityRole** (whether that entity was an “Actor”, “Target”, or “Other” in that behavior), and more. BehaviorEntities essentially answers “who or what was involved in that behavior?”.

**Important:** Always use the **BehaviorId** field to join BehaviorInfo with BehaviorEntities[^3]. Example:

```kusto
BehaviorInfo
| join kind=inner BehaviorEntities on BehaviorId
| where TimeGenerated >= ago(1d)
| project TimeGenerated, Title, Description, EntityType, EntityRole, EntityId
```

This will give you each behavior and each entity involved in it. The EntityId or identifying info for the entity is in BehaviorEntities, whereas BehaviorInfo might just say “User” or “Host” in text.

The schema reference pages linked in the following section provide the full list of columns in each table, along with their definitions and examples of values. It's a good idea for detection engineers to familiarize themselves with the schema, especially fields like ActionType (the normalized name of the behavior) and the various entity role fields.

For detailed schema information, refer to the official documentation here:

- [Definitions of all BehaviorInfo columns and usage notes](/azure/azure-monitor/reference/tables/behaviorinfo)

- [Definitions of all BehaviorEntities columns](/azure/azure-monitor/reference/tables/behaviorentities)

Finally, remember that BehaviorInfo and BehaviorEntities are *additive* – they don't replace the existing log tables. They exist side-by-side with your raw data. You can mix them in any analytics or queries you build (join on Time or entities to correlate raw events with behaviors).

[^1]: <https://outlook.office.com/owa/?viewmodel=IAttachmentViewModelPopoutFactory&AttachmentId=AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AbPP4kzljlk2qSPs1IbTldgADiYZLAwAAARIAEACDrrJbE5hzSqEmXZ4m6AAe&ItemId=AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AbPP4kzljlk2qSPs1IbTldgADiYZLAwAA&AttachmentName=Private%20Preview%20Guidelines%20-%20UEBA%20Behaviors%20Layer.pdf&web=1>

[^2]: <https://microsoft-my.sharepoint.com/personal/taylorwong_microsoft_com/Documents/Recordings/Discuss%20Healthstream%20feedback%20for%20Sentinel%20behaviors-20251118_071223-Meeting%20Recording.mp4?web=1>

[^3]: <https://outlook.office.com/owa/?viewmodel=IAttachmentViewModelPopoutFactory&AttachmentId=AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AbPP4kzljlk2qSPs1IbTldgADiYZLAwAAARIAEACDrrJbE5hzSqEmXZ4m6AAe&ItemId=AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AbPP4kzljlk2qSPs1IbTldgADiYZLAwAA&AttachmentName=Private%20Preview%20Guidelines%20-%20UEBA%20Behaviors%20Layer.pdf&web=1>