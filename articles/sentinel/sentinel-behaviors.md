---
title: Extract behavioral patterns from raw security logs using Microsoft Sentinel behaviors (Preview)
description: Explore Sentinel behaviors that converts security telemetry into normalized behavioral patterns for investigation, hunting, and detection engineering.
author: guywi-ms
ms.author: guywild
ms.reviewer: mshechter
ms.date: 12/29/2025
ms.topic: how-to
ms.service: microsoft-sentinel
#Customer intent: As a security analyst, I want to use Sentinel behaviors to translate raw security telemetry into human-readable patterns with MITRE ATT&CK context for faster threat detection and investigation.
---

# Extract behavioral patterns from raw security logs using Microsoft Sentinel behaviors (Preview)

Microsoft Sentinel behaviors summarize high-volume raw logs into clear, plain-language patterns of security actions, explaining “who did what to whom” in a structured way enriched with MITRE ATT&CK mappings and entity roles.

Unlike alerts or anomalies, behaviors don’t indicate risk - they optimize your data for investigations, hunting, and detection by enhancing:

- **Efficiency**: Reduce investigation time by stitching related events into cohesive stories.
- **Clarity**: Translate noisy, low-level logs into plain-language summaries.
- **Context**: Add MITRE ATT&CK mapping and entity roles for instant security relevance.
- **Consistency**: Provide a unified schema across diverse log sources.

Instead of analyzing individual AWS CloudTrail events or firewall logs, analysts see a behavior - like "**Inbound remote management session from external address**" - that summarizes multiple raw events and maps them to known tactics, techniques, and procedures (TTPs). This abstraction layer enables faster threat detection, investigation, and response across your security operations. 

This article explains how Microsoft Sentinel behaviors work, how to enable behavior summaries, and how to use behaviors to enhance security operations.  

## How Microsoft Sentinel behaviors work

When you enable behaviors, Microsoft Sentinel processes supported security logs you collect into your Sentinel workspace in near real-time and summarizes two types of behavioral patterns:

- **Aggregated behaviors** detect volume-based patterns by collecting related events over time windows. Examples include "User accessed 50+ resources in 1 hour" or "Login attempts from 10+ different IP addresses." These behaviors excel at identifying unusual activity levels and converting high-volume logs into actionable security insights.

- **Sequenced behaviors** identify multi-step patterns or complex attack chains  - for example, credential theft followed by lateral movement - that are not obvious when you look at individual events.

Microsoft Sentinel summarizes behaviors at tailored time intervals specific to each behavior's logic, creating behavior records immediately when it identifies patterns or when the time windows close.

Each behavior record includes:

- **A simple, contextual description**: A natural language explanation of what happened in security-relevant terms - for example, who did *what* to *whom*, and *why it matters*.
- **Unified schema and references to the underlying raw logs**: All behaviors use a consistent data structure across different products and log types, so analysts don't need to translate different log formats or join high-volume tables.
- **MITRE ATT&CK mapping**: Every behavior is tagged with relevant MITRE tactics and techniques, providing industry-standard context at a glance. You don't just see *what* happened, but also *how it fits* in an attack framework or timeline.
- **Entity relationship mapping**: Each behavior identifies involved entities (users, hosts, IP addresses) and their roles (actor, target, or other).

[Microsoft Sentinel stores behavior records in two dedicated tables](#behaviorinfo-and-behaviorentities-schemas) in your Sentinel workspace, integrating seamlessly with your existing Sentinel workflows for detection rules, investigations, and incident analysis. It processes all types of security activity - not just suspicious events - and provides comprehensive visibility into both normal and anomalous behavior patterns. 

This diagram illustrates how Sentinel behaviors transform raw logs into structured behavior records that enhance security operations:

:::image type="content" source="media/sentinel-behaviors/sentinel-behaviors-data-flow.svg" alt-text="Diagram that shows how Sentinel behaviors transform raw logs into structured behavior records that enhance security operations." lightbox="media/sentinel-behaviors/sentinel-behaviors-data-flow.svg" ::: 

<!-- [\[link to RAI FAQ\]](#_10._RAI_FAQ) -->

## Prerequisites

To use Sentinel behaviors, you need:

- A Microsoft Sentinel workspace that's onboarded to the Defender portal.
- Ingest one or more of the [supported data sources](#supported-data-sources) into the Analytics tier. For more information about data tiers, see [Manage data tiers and retention in Microsoft Sentinel](../sentinel/manage-data-overview.md#how-data-tiers-and-retention-work).
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

The list of supported data sources and vendors or services that send logs to these data sources is evolving.
Sentinel behaviors automatically aggregates insights for all supported vendors based on the logs you collect.

During public preview, Sentinel behaviors focuses on non-Microsoft data sources that traditionally lack easy behavioral context in Sentinel. 

| Data source | Supported vendors and services | Sentinel connector |
|-------------|---------------------------|-------|
| [CommonSecurityLog](/azure/azure-monitor/reference/tables/commonsecuritylog) | <ul><li>Cyber Ark Vault</li><li>Palo Alto Threats</li></ul> |  |
| [AWSCloudTrail](/azure/azure-monitor/reference/tables/awscloudtrail) | <ul><li>EC2</li><li>IAM</li><li>S3</li><li>EKS</li><li>Secrets Manager</li></ul> |<ul><li>Amazon Web Services</li><li>Amazon Web Services S3</li></ul>For more information about these connectors, see [Sentinel data connectors](../sentinel/data-connectors-reference.md#find-your-microsoft-sentinel-data-connector) |

> [!IMPORTANT]
> These sources are separate from other UEBA capabilities and need to be enabled specifically. If you enabled AWSCloudTrail for UEBA behaviorAnalytics and Anomalies, you still need to enable it for behaviors.

## Use cases and examples

Sentinel behaviors enhances various SOC workflows. Here's how SOC analysts, hunters, detection engineers can leverage behaviors in investigations, hunting, detection.

### Investigation and incident enrichment

For **SOC Analysts responding to incidents**, Sentinel behaviors provides immediate clarity on what activities occurred around an alert or involved entity.

- **Before (without Behaviors):** An analyst triaging an incident might have to pivot across multiple raw log tables to piece together a timeline. 

  *Example*: An alert triggers on a suspicious AWS activity. The has to manually query `CloudTrail` logs, then maybe firewall logs, to understand what that user or host did around that time. This is time-consuming and requires familiarity with each data source’s schema.

- **After (with Behaviors):** Sentinel automatically stitches relevant events into **behavior entries** that can be attached to the incident or queried on demand. 

  *Example:* An alert flags possible credential exfiltration. In `BehaviorInfo`, the analyst finds a behavior: **"Suspicious mass secret access via AWS IAM by User123"**, mapped to MITRE Technique T1552 (Unsecured Credentials). This single behavior was generated by aggregating 20 AWS API calls. The analyst immediately knows User123 accessed many secrets – crucial context to escalate the incident – without manually reading all 20 log entries.

### Threat hunting

For threat hunters, behaviors act as a force multiplier by allowing hunting on TTPs and behaviors rather than raw events. Hunters can proactively search for known malicious patterns or explore entity activities in a more intuitive way:

- **Before:** Hunting in Sentinel across multiple datasets means writing complex queries joining different tables or scanning specific event IDs. Because each log source has its own format, hunters had to normalize data mentally or using KQL and often miss subtle sequences. For example, hunting for signs of reconnaissance might require checking an `AWSCloudTrail` event type *and* certain firewall connection patterns separately. Security context is mainly available for alerts and incidents, not for raw telemetry, making proactive hunts harder.

- **After:** Behaviors are *already normalized and enriched* with context. A hunter can query the `BehaviorInfo` table by MITRE technique or by high-level `Title` across sources. For instance, they can search for any behaviors mapped to `Initial Access` tactics in the last 24 hours, regardless of whether they came from AWS or on-prem logs. Because behaviors distill what happened in a source-agnostic way, the hunter can find relevant activity without writing source-specific queries. This approach improves hunting efficacy and helps discover attacks earlier in the kill chain (even if no alert was generated).

- **How it works:** The `BehaviorInfo` table includes columns like `Categories` (MITRE tactics) and `MitreTechniques`, as well as a descriptive `Title`. A hunter can use these to filter. For example, BehaviorInfo | where Categories has "Discovery" | summarize count() by Title might reveal unusual discovery behaviors. Hunters can also see the rarer behaviors in the environment, using *count distinct* on the Title field and pivot to the interesting behaviors type and see which entities, then investigate further. Because the behaviors link back to underlying data (via BehaviorId and AdditionalFields which often contain original log references), a hunter can always drill down to raw logs for verification if needed[^1].

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

For detection engineers and those building analytic rules, Sentinel behaviors simplify rule logic and enable new correlation possibilities:

- **Before:** Creating custom correlation rules on raw logs can be challenging. Each data source has different schemas, so writing a generalized detection - for example, "Multiple failed admin actions across cloud and on-prem" - means either writing multiple rules or a very complex single query with normalization logic. Also, lacking context, many rules have to include lots of conditions to reduce false positives, or they rely on alerts as inputs rather than raw events. Automation (SOAR playbooks) can also be challenging if triggers are too low-level – you risk responding to benign events.

- **After:** Behaviors provide high-quality, normalized signals that can serve as the triggers or building blocks for detection rules. Behaviors already aggregate related events, therefore, a single behavior can replace what previously required correlating many atomic events. Also, each behavior comes with MITRE tags and entity roles, which you can use in rule logic - for example, a rule can look for a sequence: Behavior with T1078 (Valid Accounts) followed by Behavior with T1566 (Phishing) by the same user. Detection engineers can write rules that are **simpler** and more **explainable**, because the rule conditions align with human-understandable behavior descriptions.

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

## Public preview limitations and known issues 

These limitations apply during the public preview of Sentinel behaviors:

- You can enable behaviors on a single Sentinel workspace per tenant.
- Sentinel generates behaviors for a limited set of [supported data sources and vendors or services](#supported-data-sources). 
- Sentinel does not currently capture every possible action or attack technique, even for supported sources. Some events might not produce corresponding behaviors. Don't assume that the absence of a behavior means no activity occurred. Always review raw logs if you suspect something might be missing. 
- Behaviors aim to reduce noise by aggregating and sequencing events, but you might still see too many behavior records. We welcome your feedback on specific behavior types to help improve coverage and relevance.
- Behaviors are not alerts or anomalies. They're neutral observations, not classified as malicious or benign. The presence of a behavior means “this happened,” not “this is a threat.” Anomaly detection remains separate in UEBA. Use judgment or combine behaviors with UEBA anomaly data to identify noteworthy patterns.

## Troubleshoot behavior issues

- **If behaviors don't get generated**: Ensure supported data sources are actively sending logs to the Analytics tier, confirm the data source toggle is on, and wait 15–30 minutes after enabling.
- **I see fewer behaviors than expected**: Coverage is partial and growing; check the supported behavior types list; verify that the log volume meets minimum thresholds. <!-- ??? -->
- **Understanding behavior counts**: A single behavior might represent tens or hundreds of raw events - this is designed to reduce noise.


## BehaviorInfo and BehaviorEntities schemas

The system stores behaviors data in **two interrelated log tables** in your Log Analytics workspace: **BehaviorInfo** and **BehaviorEntities**. These tables are Azure Monitor Logs tables (just like any other Sentinel table). You can find their full reference schemas on Microsoft Learn:

- **BehaviorInfo** table – This table contains one record per behavior event. Each record represents a specific observed behavior or pattern. Key fields include a unique **BehaviorId**, **TimeGenerated**, a **Title**, data source (table), a contextual dynamic **Description**, **Categories** (MITRE TTPs), and various other properties or an AdditionalFields JSON with more details (such as the row event IDs). Essentially, BehaviorInfo is where you find the “what happened” description and classification of the behavior.

- **BehaviorEntities** table – This table lists the entities involved in each behavior. There might be multiple records in BehaviorEntities for one BehaviorId (for example, one behavior might involve a source IP, a user account, and a host, each as separate entity entries). Fields include the same **BehaviorId** (to join back to BehaviorInfo), **EntityType** (user, host, file, and more), **EntityRole** (whether that entity was an “Actor”, “Target”, or “Other” in that behavior), and more. BehaviorEntities essentially answers “who or what was involved in that behavior?”.

- **Tracing back to raw logs**: Use the `AdditionalFields` column in `BehaviorInfo`, which contains references to the original event IDs.

Use the `BehaviorId` field to join `BehaviorInfo` with `BehaviorEntities`. 

For example:

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

