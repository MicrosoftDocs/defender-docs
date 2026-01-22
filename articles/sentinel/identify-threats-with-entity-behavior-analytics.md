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

# Advanced threat detection with User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel

[!INCLUDE [reference-to-feature-availability](includes/reference-to-feature-availability.md)]

This article explains what Microsoft Sentinel User and Entity Behavior Analytics (UEBA) is, how it works, how to onboard to it, and how to use UEBA to surface and investigate anomalies and enhance your threat detection capabilities.

[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

## What is UEBA?

User and Entity Behavior Analytics in Microsoft Sentinel uses machine learning to build dynamic behavioral profiles for users, hosts, IP addresses, applications, and other entities. It detects anomalies by comparing current activity to established baselines, helping security teams identify threats such as compromised accounts, insider attacks, and lateral movement. UEBA is natively integrated into Microsoft Sentinel and the Microsoft Defender portal, providing a seamless experience for security operations teams.

### UEBA analytics architecture

:::image type="content" source="media/identify-threats-with-entity-behavior-analytics/entity-behavior-analytics-architecture.png" alt-text="Entity behavior analytics architecture":::

### UEBA Tables in Sentinel

#### IdentityInfo table

The IdentityInfo table provides detailed entity profiles (users, devices, and groups) essential for understanding user behavior within the system.

Microsoft Sentinel builds user profiles using entity information from Microsoft Entra ID and, optionally, your on-premises Active Directory. When you enable UEBA, Sentinel synchronizes data from Entra ID, which you can access through the IdentityInfo table.

- **In Microsoft Sentinel (Azure portal)**: Query the IdentityInfo table in Log Analytics from the Logs page.
- **In Microsoft Defender portal**: Use Advanced Hunting to query the same table.

You can also integrate on-premises Active Directory user entity information by using Microsoft Defender for Identity.

#### UserPeerAnalytics Table

The peers table lists dynamically-calculated peer groups to establish behavioral baselines for comparison.

User peer metadata provides critical context for threat detection, incident investigation, and threat hunting. By analyzing the normal activities of a user's peers, security analysts can determine whether a user's behavior deviates from typical patterns.

Microsoft Sentinel calculates and ranks a user's peers based on factors such as Microsoft Entra security group membership, mailing lists, and other associations. The top 20 ranked peers are stored in the UserPeerAnalytics table.

The screenshot below illustrates the schema of the UserPeerAnalytics table and shows the eight highest-ranked peers for the user Kendall Collins. Sentinel uses the TF-IDF (term frequency–inverse document frequency) algorithm to normalize weights when calculating peer ranks: smaller groups carry higher weight.

:::image type="content" source="./media/identify-threats-with-entity-behavior-analytics/user-peers-metadata.png" alt-text="Screen shot of user peers metadata table" lightbox="./media/identify-threats-with-entity-behavior-analytics/user-peers-metadata.png":::

#### BehaviorAnalytics Table

The BehaviorAnalytics table contains enriched behavioral data, including geolocation and threat intelligence (TI). Deviations from baseline appear here with a score for prioritization. The specific data available depends on the connectors you enabled during the onboarding process (for example, Azure AD, AWS, GCP, Okta, and other integrated sources).

#### Anomalies Table

The Anomalies table stores events identified as anomalous to support detection and investigation workflows.

For more information on UEBA tables, see [UEBA enrichments reference](ueba-reference.md) and [Anomalies detected by the Microsoft Sentinel machine learning engine](anomalies-reference.md).

For more information on the schema and tables, see [UEBA data sources](ueba-reference.md#ueba-data-sources).

## Why is UEBA important?

Detecting anomalous behavior within an organization is often complex and time-consuming. Microsoft Sentinel's User and Entity Behavior Analytics (UEBA) simplifies this challenge by using machine learning to build dynamic behavioral baselines and peer comparisons across your environment. Rather than just collecting logs, UEBA continuously learns from your data to surface meaningful anomalies that help analysts detect and investigate potential threats more effectively.

Traditional security tools rely on static rules and signatures, which can miss subtle or emerging threats. UEBA addresses this gap by identifying unknown risks, reducing alert fatigue, and providing rich context by correlating activity across users, devices, and locations. Sentinel ingests data from connected sources, applies behavioral modeling to detect deviations, and uses peer group analysis and blast radius evaluation to assess the impact. Each entity is assigned a risk score based on the severity and context of its behavior—enabling faster, smarter threat detection and response.

## Enable UEBA

To enable UEBA in Microsoft Sentinel, follow the steps outlined in the official documentation: [Enable entity behavior analytics](enable-entity-behavior-analytics.md). This guide walks you through configuring UEBA, connecting relevant data sources, and accessing entity profiles to start detecting behavioral anomalies across your environment.
