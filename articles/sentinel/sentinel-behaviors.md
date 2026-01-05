---
title: Translate raw security logs to behavioral insights using Microsoft Sentinel behaviors (Preview)
description: Sentinel behaviors translates security telemetry into normalized behavioral patterns for investigation, hunting, and detection engineering.
author: guywi-ms
ms.author: guywild
ms.reviewer: mshechter
ms.date: 12/29/2025
ms.topic: how-to
ms.service: microsoft-sentinel
#Customer intent: As a security analyst, I want to use Sentinel behaviors to translate raw security telemetry into human-readable patterns with MITRE ATT&CK context for faster threat detection and investigation.
---

# Translate raw security logs to behavioral insights using Microsoft Sentinel behaviors (Preview)

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

| **User action**                                              | **Permission required**                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Enable behaviors | **Global Administrator** or **Security Administrator** role in Microsoft Entra ID. |
| Query behaviors tables                                         | <ul><li>Read access to BehaviorInfo and BehaviorEntities tables in the Log Analytics workspace</li><li>Advanced Hunting query permissions in Microsoft 365 Defender portal</li><li>Read access to source tables (e.g., AWSCloudTrail, CommonSecurityLog) for tracing back to raw events</li></ul> |

For more information about unified RBAC in the Defender portal, see [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac).

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
| [AWSCloudTrail](/azure/azure-monitor/reference/tables/awscloudtrail) | <ul><li>EC2</li><li>IAM</li><li>S3</li><li>EKS</li><li>Secrets Manager</li></ul> |<ul><li>[Amazon Web Services](../sentinel/data-connectors-reference.md#find-your-microsoft-sentinel-data-connector#amazon-web-services)</li><li>[Amazon Web Services S3](../sentinel/data-connectors-reference.md#find-your-microsoft-sentinel-data-connector#amazon-web-services-s3)</li></ul> |

> [!IMPORTANT]
> These sources are separate from other UEBA capabilities and need to be enabled specifically. If you enabled AWSCloudTrail for UEBA behaviorAnalytics and Anomalies, you still need to enable it for behaviors.

## Use cases and examples

Sentinel behaviors enhance several SOC workflows by transforming raw logs into clear, contextualized activity summaries. Here's how analysts, hunters, and detection engineers can use behaviors during investigations, hunting, and alert creation.

### Investigation and incident enrichment

Behaviors give SOC analysts immediate clarity about what happened around an alert, without pivoting across multiple raw log tables.

- **Workflow without behaviors:** Analysts often need to reconstruct timelines manually by querying event‑specific tables and stitching results together.

  *Example*: An alert fires on a suspicious AWS activity. The analyst queries the `AWSCloudTrail` table, then pivots to firewall data to understand what the user or host did. This requires knowledge of each schema and slows triage.

- **Workflow with behaviors:** Sentinel automatically aggregates related events into behavior entries that can be attached to an incident or queried on demand.

  *Example:* An alert indicates possible credential exfiltration. In the `BehaviorInfo` table, the analyst sees the behavior **Suspicious mass secret access via AWS IAM by User123** mapped to **MITRE Technique T1552 (Unsecured Credentials)**. Sentinel generated this behavior by aggregating 20 AWS log entries. The analyst immediately understands that User123 accessed many secrets – crucial context to escalate the incident – without manually reviewing all 20 log entries.

### Threat hunting

Behaviors allow hunters to search on TTPs and activity summaries, rather than writing complex joins or normalizing raw logs by themselves.

- **Workflow without behaviors:** Hunts require complex KQL, table joins, and familiarity with every data source format. Important activity may be buried in large datasets with little built‑in security context. 

  *Example:* Hunting for signs of reconnaissance might require scanning `AWSCloudTrail` events *and* certain firewall connection patterns separately. Context exists mostly in incidents and alerts, making proactive hunting harder.

- **Workflow with behaviors:** Behaviors are normalized, enriched, and mapped to MITRE tactics and techniques. Hunters can search for meaningful patterns without depending on each source’s schema.

  A hunter can filter the BehaviorInfo table by tactic (`Categories`), technique, title, or entity. For example:

  ```kusto
  BehaviorInfo 
  | where Categories has "Discovery" 
  | summarize count() by Title 
  ```

  Hunters can also: 
  
  - Identify rare behaviors, using `count distinct` on the `Title` field.
  - Explore an interesting behavior type, identify the entities involved, and investigate further. 
  - Drill down to raw logs using the `BehaviorId` and `AdditionalFields` columns, which often reference the underlying raw logs.

  *Example:* A hunter searching for stealthy credential access queries for behaviors with “enumerate credentials” in the `Title` column. The results return a few instances of **"Attempted credential dump from Vault by user AdminJoe"** (derived from `CyberArk` logs). Although alerts weren't fired, this behavior is uncommon for AdminJoe and prompts further investigation - something that's difficult to detect in verbose Vault audit logs.

  Hunters can also hunt by: 
  
  - MITRE tactic:

    ```kusto    
    // Find behaviors by MITRE tactic
    BehaviorInfo
    | where Categories == "Lateral Movement"
    ```

  - Technique:

    ```kusto
    // Find behaviors by MITRE technique
    BehaviorInfo
    | where MitreTechniques has "T1078" // Valid Accounts
    | project TimeGenerated, Title, Description, SourceTable
    ```

  - Specific user:

    ```kusto
    // Find all behaviors for a specific user over last 7 days
    BehaviorInfo
    | join kind=inner BehaviorEntities on BehaviorId
    | where TimeGenerated >= ago(7d)
    | where EntityType == "User" and EntityId == "user@domain.com"
    | project TimeGenerated, Title, Description, Categories
    | order by TimeGenerated desc
    ```

  - Rare behaviors (potential anomalies):

    ```kusto
    // Find rare behaviors (potential anomalies)
    BehaviorInfo
    | where TimeGenerated >= ago(30d)
    | summarize Count=count() by Title
    | where Count < 5 // Behaviors seen less than 5 times
    | order by Count asc
    ```

### Detection engineering and automation

Behaviors simplify rule logic by providing normalized, high‑quality signals with built‑in context, and enable new correlation possibilities.

- **Workflow without behaviors:** Cross‑source correlation rules are complex because each log format is different. Rules often require:

  - Normalization logic
  - Schema‑specific conditions
  - Multiple separate rules
  - Reliance on alerts rather than raw activity

  Automation might also trigger too frequently if it's driven by low‑level events.

- **Workflow with behaviors:** Behaviors already aggregate related events and include MITRE mappings, entity roles, and consistent schemas, so detection engineers can create simpler, clearer detection rules. 
  
  *Example:* To alert on a potential key compromise and privilege escalation sequence, a detection engineer writes a detection rule using this logic: *"Alert if a user has a 'Creation of new AWS access key' behavior followed by an 'Elevation of privileges in AWS' behavior within 1 hour."* 
  
  Without Sentinel behaviors, this rule would require stitching together raw `AWSCloudTrail` events and interpreting them in the rule logic. With behaviors, it's straightforward and resilient to log schema changes because the schema is unified.

  Behaviors also serve as reliable triggers for automation. Instead of creating alerts for non-risky activities, use behaviors to trigger automation - for example, to send an email or initiate verification.

## Pricing model

Using Sentinel behaviors results in the following costs:

- **No extra license cost:** Behaviors are included as part of Microsoft Sentinel (currently in preview). You don’t need a separate SKU, UEBA add‑on, or additional licensing. If your workspace is connected to Sentinel and onboarded to the Defender portal, you can use behaviors at no additional feature cost.

- **Log data ingestion charges:** Behavior records are stored in the `BehaviorInfo` and `BehaviorEntities` tables in your Sentinel workspace. Each behavior contributes to your workspace’s data ingestion volume and is billed at your existing Log Analytics/Sentinel ingestion rate. Behaviors are additive - they don’t replace your existing raw logs.

## Privacy and responsible AI considerations

Microsoft developed the Behaviors feature with **privacy and responsible AI principles** in mind. It doesn't introduce new compliance risks or opaque "black box" analytics into your SOC.

**Responsible AI and use of ML/AI:** Sentinel behaviors is "AI-powered" because it uses machine learning (including NLP/LLM techniques) in its creation. However, Microsoft carefully applied AI in a way that maintains **deterministic and explainable outputs** for the end user:

- The "AI" (including large language models) is used offline by Microsoft's engineering team to help **develop and validate the behavioral rules** – for example, to suggest correlations of events or to generate the natural-language descriptions of behaviors. These AI-generated rules are then tested and deployed as standard detection rules (KQL queries running on your data). The key point: at runtime in your environment, behaviors are generated by **fixed, tested correlation logic**, not an AI model making unpredictable decisions. This means each behavior output is **repeatable and explainable** (traceable to specific log patterns) rather than a probabilistic AI guess. It avoids the risk of AI hallucination or bias in your live security data.

## Limitations in public preview 

These limitations apply during the public preview of Sentinel behaviors:

- You can enable behaviors on a single Sentinel workspace per tenant.
- Sentinel generates behaviors for a limited set of [supported data sources and vendors or services](#supported-data-sources). 
- Sentinel does not currently capture every possible action or attack technique, even for supported sources. Some events might not produce corresponding behaviors. Don't assume that the absence of a behavior means no activity occurred. Always review raw logs if you suspect something might be missing. 
- Behaviors aim to reduce noise by aggregating and sequencing events, but you might still see too many behavior records. We welcome your feedback on specific behavior types to help improve coverage and relevance.
- Behaviors are not alerts or anomalies. They're neutral observations, not classified as malicious or benign. The presence of a behavior means “this happened,” not “this is a threat.” Anomaly detection remains separate in UEBA. Use judgment or combine behaviors with UEBA anomaly data to identify noteworthy patterns.

## Best practices and troubleshooting tips for using behaviors

- **If behaviors aren't being generated**: Ensure supported data sources are actively sending logs to the Analytics tier, confirm the data source toggle is on, and wait 15–30 minutes after enabling.
- **I see fewer behaviors than expected**: Coverage is partial and growing; check the supported behavior types list; verify that the log volume meets minimum thresholds. <!-- ??? -->
- **Behavior counts**: A single behavior might represent tens or hundreds of raw events - this is designed to reduce noise.
- **BehaviorInfo and BehaviorEntities tables** – The `BehaviorInfo` table contains one record per behavior event to explain “what happened” . The `BehaviorEntities` table lists the entities involved in each behavior. For more information about each of the columns in these tables, see [BehaviorInfo (Preview)](/defender-xdr/advanced-hunting-behaviorinfo-table) and [BehaviorEntities (Preview)](/defender-xdr/advanced-hunting-behaviorentities-table).
    - **Drill down from behaviors to raw logs**: Use the `AdditionalFields` column in `BehaviorInfo`, which contains references to the original event IDs.
    - **Join BehaviorInfo and BehaviorEntities**: Use the `BehaviorId` field to join `BehaviorInfo` with `BehaviorEntities`. 

      For example:

      ```kusto
      BehaviorInfo
      | join kind=inner BehaviorEntities on BehaviorId
      | where TimeGenerated >= ago(1d)
      | project TimeGenerated, Title, Description, EntityType, EntityRole, EntityId
      ```

      This gives you each behavior and each entity involved in it. The `EntityId` or identifying information for the entity is in `BehaviorEntities`, whereas `BehaviorInfo` might refer to “User” or “Host” in the text.

For more practical examples of using behaviors, see [Use cases and examples](#use-cases-and-examples).      


