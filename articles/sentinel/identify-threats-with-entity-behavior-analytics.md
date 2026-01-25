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

This article explains what Microsoft Sentinel User and Entity Behavior Analytics (UEBA) is, how it works, how to onboard to it, and how to use UEBA to surface and investigate anomalies and enhance your threat detection capabilities.

[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

## What is UEBA?

User and Entity Behavior Analytics in Microsoft Sentinel uses machine learning to build dynamic behavioral profiles for users, hosts, IP addresses, applications, and other entities. It detects anomalies by comparing current activity to established baselines, helping security teams identify threats such as compromised accounts, insider attacks, and lateral movement. UEBA is natively integrated into Microsoft Sentinel and the Microsoft Defender portal, providing a seamless experience for security operations teams.

### UEBA analytics architecture

:::image type="content" source="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-architecture.png" alt-text="Entity behavior analytics architecture":::

### UEBA tables in Sentinel

#### IdentityInfo table

The IdentityInfo table provides detailed entity profiles, such as users, devices, and groups. These profiles are essential for understanding user behavior within the system.

Microsoft Sentinel builds user profiles by using entity information from Microsoft Entra ID and, optionally, your on-premises Active Directory. When you enable UEBA, Sentinel synchronizes data from Entra ID, which you can access through the IdentityInfo table.

- **In Microsoft Sentinel (Azure portal)**: Query the IdentityInfo table in Log Analytics from the Logs page.
- **In Microsoft Defender portal**: Use Advanced Hunting to query the same table.

You can also integrate on-premises Active Directory user entity information by using Microsoft Defender for Identity.

#### UserPeerAnalytics table

The peers table lists dynamically calculated peer groups to establish behavioral baselines for comparison.

User peer metadata provides critical context for threat detection, incident investigation, and threat hunting. By analyzing the normal activities of a user's peers, security analysts can determine whether a user's behavior deviates from typical patterns.

Microsoft Sentinel calculates and ranks a user's peers based on factors such as Microsoft Entra security group membership, mailing lists, and other associations. The top 20 ranked peers are stored in the UserPeerAnalytics table.

The following screenshot illustrates the schema of the UserPeerAnalytics table and shows the eight highest-ranked peers for the user Kendall Collins. Sentinel uses the TF-IDF (term frequency–inverse document frequency) algorithm to normalize weights when calculating peer ranks. Smaller groups carry higher weight.

:::image type="content" source="./media/identify-threats-with-entity-behavior-analytics/user-peers-metadata.png" alt-text="Screen shot of user peers metadata table" lightbox="./media/identify-threats-with-entity-behavior-analytics/user-peers-metadata.png":::

#### BehaviorAnalytics table

The BehaviorAnalytics table contains enriched behavioral data, including geolocation and threat intelligence (TI). Deviations from baseline appear here with a score for prioritization. The specific data available depends on the connectors you enabled during the onboarding process (for example, Azure AD, AWS, GCP, Okta, and other integrated sources).

#### Anomalies table

The Anomalies table stores events identified as anomalous to support detection and investigation workflows.

For more information on UEBA tables, see [UEBA enrichments reference](ueba-reference.md) and [Anomalies detected by the Microsoft Sentinel machine learning engine](anomalies-reference.md).

For more information on the schema and tables, see [UEBA data sources](ueba-reference.md#ueba-data-sources).

## Why is UEBA important?

Detecting anomalous behavior within an organization is often complex and time-consuming. Microsoft Sentinel's User and Entity Behavior Analytics (UEBA) simplifies this challenge by using machine learning to build dynamic behavioral baselines and peer comparisons across your environment. Rather than just collecting logs, UEBA continuously learns from your data to surface meaningful anomalies that help analysts detect and investigate potential threats more effectively.

Traditional security tools rely on static rules and signatures, which can miss subtle or emerging threats. UEBA addresses this gap by identifying unknown risks, reducing alert fatigue, and providing rich context by correlating activity across users, devices, and locations. Sentinel ingests data from connected sources, applies behavioral modeling to detect deviations, and uses peer group analysis and blast radius evaluation to assess the impact. Each entity is assigned a risk score based on the severity and context of its behavior, which enables faster, smarter threat detection and response.

## Enable UEBA

To enable UEBA in Microsoft Sentinel, follow the steps outlined in [Enable entity behavior analytics](enable-entity-behavior-analytics.md). This guide walks you through configuring UEBA, connecting relevant data sources, and accessing entity profiles to start detecting behavioral anomalies across your environment.

## Leverage UEBA

To effectively leverage UEBA in Microsoft Sentinel, security teams should enable UEBA in the Sentinel or Microsoft Defender portal and ensure key data sources - such as Microsoft Entra ID, Defender for Identity, and Office 365 - are connected. Once enabled, UEBA automatically builds behavioral baselines and peer comparisons for users and entities, detecting anomalies that may indicate insider threats, compromised accounts, or lateral movement.

Actions performed by a user (or a host, or an address) are evaluated contextually, where a "true" outcome indicates an identified anomaly:

- across geographical locations, devices, and environments
- across time and frequency horizons (compared to user's own history)
- as compared to peers' behavior
- as compared to organization's behavior

:::image type="content" source="media/identify-threats-with-entity-behavior-analytics/context.png" alt-text="Entity context":::

Analysts can use the BehaviorAnalytics and Anomalies tables to query risk scores and investigate suspicious activity, while enriched entity profiles provide context for faster triage and response. Integrating UEBA insights into workbooks, incident workflows, and hunting queries helps maximize its value across the SOC.

To query the BehaviorAnalytics, IdentityInfo, Anomalies, and UserPeerAnalytics tables, you can install the UEBA solution, which includes dozens of useful queries that you can use. For more information, see [UEBA useful KQLs](ueba-reference.md).

## Understanding UEBA scoring in Microsoft Sentinel

Microsoft Sentinel's User and Entity Behavior Analytics (UEBA) provides two distinct scoring mechanisms to help security teams prioritize investigations and detect anomalies effectively:

### Investigation priority score

- **Where it appears:** BehaviorAnalytics table
- **Purpose:** Indicates how unusual a single event is, based on profile-driven logic.
- **How it's calculated:**
  - **Entity Anomaly Score:** Measures rarity of entities involved, such as user, device, country, ISP, and user agent. First-time or uncommon entities receive higher scores.
  - **Time Series Score:** Detects abnormal patterns over time, such as spikes in failed log-ons or unexpected group membership changes.
- **Range:** 0–10 (0 = benign, 10 = highly anomalous)
- **Key characteristics:**
  - Near real-time calculation for flexible investigation at the event level.
  - Profile-based approach might be less precise but enables quick triage of individual events.

### Anomaly score

- **Where it appears:** Anomalies table
- **Purpose:** Reflects holistic anomalous behavior across multiple events by using machine learning.
- **How it's calculated:** AI/ML anomaly detector, trained on your workspace's telemetry.
- **Range:** 0–1 (0 = benign, 1 = highly anomalous)
- **Key characteristics:**
  - Batch processing for detecting complex behavioral deviations.
  - Captures scenarios where a group of related activities signals risk, even if individual events seem normal.

### How they differ

**Investigation priority score:**
- Event-level, profile-based, near real-time
- Best for quick triage and drilling into single events

**Anomaly score:**
- Behavior-level, ML-driven, context-aware
- Best for identifying patterns and aggregated anomalies over time

### Example scenario

A user performs an Azure operation for the first time:

- **Investigation priority score:** High, because it's a first-time event.
- **Anomaly Score:** Low, because occasional first-time Azure actions are common and not inherently risky.

### Correlation

While these scores serve different purposes, you can expect some correlation. High anomaly scores often align with high investigation priority, but not always. Each score provides unique insight for layered detection.

## Next steps
In this article, you learned about Microsoft Sentinel's entity behavior analytics capabilities. For practical guidance on implementation, and to use the insights you've gained, see the following articles:

- [Enable entity behavior analytics](./enable-entity-behavior-analytics.md) in Microsoft Sentinel.
- [List of anomalies](anomalies-reference.md#ueba-anomalies) detected by the UEBA engine.
- [Investigate incidents with UEBA data](investigate-with-ueba.md).
- [Hunt for security threats](./hunting.md).

For more information, see the [Microsoft Sentinel UEBA reference](ueba-reference.md).
