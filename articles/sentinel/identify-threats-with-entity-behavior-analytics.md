---
title: Advanced threat detection with User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel | Microsoft Docs
description: Create behavioral baselines for entities (users, hostnames, IP addresses) and use them to detect anomalous behavior and identify zero-day advanced persistent threats (APT).
author: guywi-ms
ms.author: guywild
ms.topic: conceptual
ms.date: 10/16/2024
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ms.custom: sfi-image-nochange

#Customer intent: As a security analyst, I want to leverage User and Entity Behavior Analytics (UEBA) so that I can efficiently detect and prioritize sophisticated threats within my organization.

---

# Advanced threat detection by using User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel

[!INCLUDE [reference-to-feature-availability](includes/reference-to-feature-availability.md)]

This article explains what Microsoft Sentinel User and Entity Behavior Analytics (UEBA) is, how it works, how to onboard to it, and how to use UEBA to detect and investigate anomalies and enhance your threat detection capabilities.

[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

## What is UEBA?

User and Entity Behavior Analytics in Microsoft Sentinel uses machine learning to build dynamic behavioral profiles for users, hosts, IP addresses, applications, and other entities. It detects anomalies by comparing current activity to established baselines, helping security teams identify threats such as compromised accounts, insider attacks, and lateral movement. UEBA is natively integrated into Microsoft Sentinel and the Microsoft Defender portal, providing a seamless experience for security operations teams.

## Why is UEBA important?

Detecting anomalous behavior within an organization is often complex and time-consuming. Microsoft Sentinel's User and Entity Behavior Analytics (UEBA) simplifies this challenge by using machine learning to build dynamic behavioral baselines and peer comparisons across your environment. Rather than just collecting logs, UEBA continuously learns from your data to surface meaningful anomalies that help analysts detect and investigate potential threats more effectively.

Traditional security tools rely on static rules and signatures, which can miss subtle or emerging threats. UEBA addresses this gap by identifying unknown risks, reducing alert fatigue, and providing rich context by correlating activity across users, devices, and locations. Sentinel ingests data from connected sources, applies behavioral modeling to detect deviations, and uses peer group analysis and blast radius evaluation to assess the impact. Each entity is assigned a risk score based on the severity and context of its behavior, which enables faster, smarter threat detection and response.

The following diagram illustrates how UEBA processes data from connected sources to detect anomalies and assign risk scores:

:::image type="content" source="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-architecture.png" alt-text="Diagram showing UEBA architecture, illustrating how data flows from connected sources through behavioral modeling to produce risk scores." lightbox="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-architecture.png":::


## Enable UEBA to create behavior profiles and detect anomalies

Enable UEBA in Microsoft Sentinel - as described in [Enable entity behavior analytics](enable-entity-behavior-analytics.md) - and connect key data sources, such as Microsoft Entra ID, Defender for Identity, and Office 365. 

UEBA automatically builds behavioral baselines and peer comparisons for users and entities, detecting anomalies that may indicate insider threats, compromised accounts, or lateral movement.

UEBA evaluates actions performed by users, hosts, and IP addresses in context, identifying anomalous behavior based on multiple dimensions, including:

- Deviations across geographical locations, devices, and environments  
- Changes over time and activity frequency compared to the entity’s historical behavior  
- Differences compared to peer groups  
- Deviations from organization-wide behavior patterns  

:::image type="content" source="media/identify-threats-with-entity-behavior-analytics/context.png" alt-text="Entity context":::

Analysts can query the [BehaviorAnalytics](#behavioranalytics-table) and [Anomalies](#anomalies-table) tables to investigate risk scores and suspicious activity. Enriched entity profiles provide additional context that helps speed up triage and response. Integrating UEBA insights into workbooks, incident workflows, and hunting queries helps maximize their value across the SOC.

To query the `BehaviorAnalytics`, `IdentityInfo`, `Anomalies`, and `UserPeerAnalytics` tables, install the UEBA solution, which includes dozens of ready-to-use queries. 

## Understand UEBA tables and scoring

This section provides an overview of each of the UEBA tables. For schema details, see the [UEBA reference](ueba-reference.md), and for runnable examples, see [sample KQL queries](ueba-useful-queries.md).

### IdentityInfo table

The `IdentityInfo` table provides detailed profiles of entities, such as users, devices, and groups. These profiles are essential for understanding user behavior within the system.

Microsoft Sentinel builds user profiles by using entity information from Microsoft Entra ID and, optionally, your on-premises Active Directory. When you enable UEBA, Sentinel synchronizes data from Entra ID, which you can access through the `IdentityInfo` table.

You can also integrate on-premises Active Directory user entity information by using Microsoft Defender for Identity.

### UserPeerAnalytics table

The `UserPeerAnalytics` table lists dynamically calculated peer groups to establish behavioral baselines for comparison.

User peer metadata provides critical context for threat detection, incident investigation, and threat hunting. By analyzing the normal activities of a user's peers, security analysts can determine whether a user's behavior deviates from typical patterns.

Microsoft Sentinel determines and ranks a user's peers based on factors such as Microsoft Entra security group membership, mailing lists, and other associations. The top 20 ranked peers are stored in the `UserPeerAnalytics` table.

The following screenshot illustrates the schema of the `UserPeerAnalytics` table and shows the eight highest-ranked peers for the user Kendall Collins. Sentinel uses the TF-IDF (term frequency–inverse document frequency) algorithm to normalize weights when calculating peer ranks. Smaller groups carry higher weight.

:::image type="content" source="./media/identify-threats-with-entity-behavior-analytics/user-peers-metadata.png" alt-text="Screen shot of user peers metadata table" lightbox="./media/identify-threats-with-entity-behavior-analytics/user-peers-metadata.png":::

### BehaviorAnalytics table

The BehaviorAnalytics table contains enriched behavioral data, including geolocation and threat intelligence (TI). Deviations from baseline appear here with a score for prioritization. The specific data available depends on the connectors you enabled during the onboarding process (for example, Azure AD, AWS, GCP, Okta, and other integrated sources).

### Anomalies table

The Anomalies table stores events identified as anomalous to support detection and investigation workflows.

For more information on UEBA tables, see [UEBA enrichments reference](ueba-reference.md) and [Anomalies detected by the Microsoft Sentinel machine learning engine](anomalies-reference.md).

For more information on the schema and tables, see [UEBA data sources](ueba-reference.md#ueba-data-sources).

### UEBA scoring

Microsoft Sentinel's UEBA provides two distinct scoring mechanisms to help security teams prioritize investigations and detect anomalies effectively:

| Aspect | Investigation priority score | Anomaly score |
|--------|------------------------------|---------------|
| **Table** | `BehaviorAnalytics` | `Anomalies` |
| **Purpose** | Indicates how unusual a single event is, based on profile-driven logic | Reflects holistic anomalous behavior across multiple events using machine learning |
| **How it's calculated** | **Entity Anomaly Score:** Measures rarity of entities (user, device, country, ISP, user agent). First-time or uncommon entities receive higher scores. <br><br>**Time Series Score:** Detects abnormal patterns over time, such as spikes in failed sign-ins or unexpected group membership changes. | AI/ML anomaly detector trained on your workspace's telemetry |
| **Range** | 0–10 (0 = benign, 10 = highly anomalous) | 0–1 (0 = benign, 1 = highly anomalous) |
| **Processing** | Near real-time, event-level | Batch processing, behavior-level |
| **Trade-offs** | Profile-based; may be less precise but enables quick triage | More precise but requires batch processing; less immediate |
| **Best for** | Quick triage and drilling into single events | Identifying patterns and aggregated anomalies over time |

### Example scenario

A user performs an Azure operation for the first time:

- **Investigation priority score:** High, because it's a first-time event.
- **Anomaly score:** Low, because occasional first-time Azure actions are common and not inherently risky.

### Correlation

While these scores serve different purposes, you can expect some correlation. High anomaly scores often align with high investigation priority, but not always. Each score provides unique insight for layered detection.

## UEBA experiences in the Defender portal empower analysts and streamline workflows

By surfacing anomalies in investigation graphs and user pages, and prompting analysts to incorporate anomaly data in hunting queries, UEBA facilitates faster threat detection, smarter prioritization, and more efficient incident response. 

This section outlines the key UEBA analyst experiences available in the Defender portal when you enable UEBA.

### UEBA insights in user investigations

Analysts can quickly assess user risk using UEBA context displayed in side panels and the Overview tab on all user pages. When unusual behavior is detected, the portal automatically tags users with **UEBA anomalies** helping prioritize investigations based on recent activity. For more information, see [User entity page in Microsoft Defender](https://aka.ms/ueba-entity-details).

Each user page includes a **Top UEBA anomalies** section, showing the top three anomalies from the past 30 days, along with direct links to pre-built anomaly queries and the Sentinel events timeline for deeper analysis.

:::image type="content" source="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-user-investigations.png" alt-text="Screenshot that shows the overview tab of the User page for a user with UEBA anomalies in the past 30 days." lightbox="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-user-investigations.png":::

### Built-in user anomaly queries in incident investigations

During incident investigations, analysts can launch built-in queries directly from incident graphs to retrieve all user anomalies related to the case.

:::image type="content" source="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-incident-investigations.png" alt-text="Screenshot that shows an incident graph, highlighting the Go hunt All user anomalies option, which allows analysts to quickly find all anomalies related to the user." lightbox="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-incident-investigations.png":::

For more information, see [Investigate incidents in the Microsoft Defender portal](https://aka.ms/ueba-go-hunt).

### Enrich Advanced Hunting queries and custom detections with UEBA data

When analysts write Advanced Hunting or custom detection queries using UEBA-related tables, the Defender portal displays a banner that prompts them to join the **Anomalies** table. This helps enrich investigations with behavioral insights and strengthens the overall analysis.

:::image type="content" source="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-advanced-hunting.png" alt-text="Screenshot that shows the Advanced Hunting page with a banner that prompts the analyst to join the Anomalies table and enrich their analysis with behavioral insights." lightbox="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-advanced-hunting.png":::

For more information, see: 
- [Proactively hunt for threats with advanced hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview).
- [KQL join operator](/kusto/query/join-operator?view=microsoft-sentinel).
- [UEBA data sources](ueba-reference.md#ueba-data-sources).
- [Anomalies detected by the Microsoft Sentinel machine learning engine](anomalies-reference.md).

## Aggregate behavior insights with the UEBA behaviors layer (Preview)

As Microsoft Sentinel collects logs from supported data sources, the behaviors layer uses AI to transform raw security logs into structured, contextualized behavioral insights. While UEBA builds baseline profiles to detect anomalous activity, the behaviors layer aggregates related events into meaningful behaviors that explain "who did what to whom."

The behaviors layer enriches raw logs with:
- **MITRE ATT&CK mappings** that align behaviors with known tactics and techniques
- **Entity role identification** that clarifies the actors and targets involved
- **Natural language explanations** that make complex activities immediately understandable

By converting fragmented logs into coherent behavior objects, the behaviors layer accelerates threat hunting, simplifies detection authoring, and provides richer context for UEBA anomaly detection. Together, these capabilities help analysts quickly understand not just *that* something anomalous happened, but *what* happened and *why* it matters.

For more information, see [Translate raw security logs to behavioral insights using UEBA behaviors in Microsoft Sentinel (Preview)](../sentinel/entity-behaviors-layer.md).

## Next steps
In this article, you learned about Microsoft Sentinel's entity behavior analytics capabilities. For practical guidance on implementation, and to use the insights you've gained, see the following articles:

- [Enable entity behavior analytics](./enable-entity-behavior-analytics.md) in Microsoft Sentinel.
- [List of anomalies](anomalies-reference.md#ueba-anomalies) detected by the UEBA engine.
- [Investigate incidents with UEBA data](investigate-with-ueba.md).
- [See UEBA reference](ueba-reference.md).
- [See sample KQL queries](ueba-useful-queries.md).
- [Hunt for security threats](./hunting.md).

For more information, see the [Microsoft Sentinel UEBA reference](ueba-reference.md).
