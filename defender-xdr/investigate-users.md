---
title: Investigate Identities
description: Learn how to use the Identity page in Microsoft Defender. Investigate user identities, review alerts, analyze activity timelines, and assess security risks across linked accounts.
#customer intent: As a security analyst using Microsoft Defender, I want to understand how to use the Identity page so that I can investigate potentially compromised identities, assess risk, and correlate alerts across linked user accounts.
ms.author: abbyweisberg
author: AbbyMSFT
ms.reviewer: maelgami
ms.date: 06/22/2026
ms.topic: article
ms.service: microsoft-defender
ms.custom: sfi-image-nochange, msecd-doc-authoring-1018
ai-usage: ai-assisted
---

# Investigate an identity

In Microsoft Defender, an **identity** represents a person or entity in your organization. Users often have multiple accounts across providers such as on-premises Active Directory, Microsoft Entra ID, SaaS applications, and other IDPs. Defender correlates these accounts into a single identity.

Each identity has a primary account. When multiple accounts are associated with an identity, Microsoft Defender designates one account as primary and uses it for identity-level profile details.

The **Identity** page consolidates identity details, observed activity, alerts, and exposure across linked accounts so security teams can quickly assess risk, determine possible compromise, understand the identity’s access across the environment, and respond to it with remediation actions. You can open the **Identity** page by selecting an identity from several areas in the Microsoft Defender portal, including:

- Identities inventory
- Alerts queue
- Individual alert pages
- Incidents or devices
- Advanced hunting results
- Activity log
- Action center

The Identity page is organized into a top section and a set of tabs. The top section shows identity context such as the org information and tags, and includes the **Actions** menu. Use the tabs to review summary details, related alerts, and deeper investigation views.

- Org information: The identity’s job title, department, and more.
- Account tags: Active Directory tags associated with the identity

:::image type="content" source="media/investigate-users/identity-page.png" alt-text="Screenshot of the Identity page in Microsoft Defender portal." lightbox="media/investigate-users/identity-page.png":::

## Identity actions

From the **Overview** page, use the **Actions** menu to trigger remediation actions on the identity. Actions apply to the accounts associated with the identity and depend on which connectors are enabled, spanning on-premises Active Directory, Microsoft Entra ID, identity and access management (IAM) systems, and SaaS apps. Available actions can include disabling or enabling accounts, revoking sessions, forcing a password change, and marking the user as compromised. You can also view the identity's account settings.

For the full list of remediation actions and the identity providers and connected apps that support them, see [Remediation actions in Microsoft Defender for Identity](/defender-for-identity/remediation-actions#supported-actions).

:::image type="content" source="media/investigate-users/identity-actions.png" alt-text="Screenshot of the identity page with the identity actions menu showing." lightbox="media/investigate-users/identity-actions.png":::

## Overview tab

The **Overview** tab provides a high‑level snapshot that helps analysts quickly assess risk and decide whether deeper investigation is required.

The overview tab includes sections for:

- Entity details
- Incidents and alerts
- Associated interactive logon devices

#### Entity details

The Entity details panel summarizes key identity information and investigation signals, including:

- Microsoft Entra ID attributes and contact information
- Protection and User threat indications
- First seen and last seen timestamps
- Number of devices the identity has signed into
- Linked user accounts, devices, and group memberships
- Related alerts and incidents, grouped by severity

Other details appear depending on enabled services and features. For example:

- Environments with Microsoft Defender for Identity can see:
  - Active Directory account control flags, such as password‑never‑expires or account lock status
  - An organization tree that shows the identity’s position in the reporting hierarchy.
- (Preview) Environments with [Microsoft Purview Insider Risk Management](/purview/insider-risk-management-solution-overview) can see a user's insider risk severity and gain insights on a user's suspicious activities in the user page. Select the **insider risk severity** to see the risk insights about the user.
- (Preview) Environments with [Microsoft Sentinel User and Entity Behavior Analytics (UEBA)](/azure/sentinel/identify-threats-with-entity-behavior-analytics), can see:
  - The user's top three UEBA anomalies from the last 30 days.
  - Links to launch pre-built advanced hunting queries and view all anomalous behaviors related to the user on the [Microsoft Sentinel events tab](#microsoft-sentinel-events-tab).

## Incidents and alerts tab

The **Incidents and alerts** tab lists all alerts and incidents involving the identity within the supported retention window. See the incidents page or the alerts page for a detailed description of the specific item.

:::image type="content" source="media/investigate-users/identity-incidents-and-alerts.png" alt-text="Screenshot of the Incidents and alerts tab on the Identity page in Microsoft Defender." lightbox="media/investigate-users/identity-incidents-and-alerts.png":::

## Observed in organization tab

The **Observed in organization** tab shows where and how the identity appears across the environment, helping analysts understand blast radius and potential lateral movement.

:::image type="content" source="media/investigate-users/identity-observed-in-organization.png" alt-text="Screenshot of the Observed in organization tab on the Identity page in Microsoft Defender." lightbox="media/investigate-users/identity-observed-in-organization.png":::

This tab can include:

| Section | Description |
| ---- | ---- |
| Accounts | All accounts associated with the identity across identity systems, including automatically and manually correlated accounts. Analysts can [manually link other related accounts](/defender-for-identity/manage-related-identities-accounts). An indicator shows which account is the primary account. |
| Devices | Devices the identity signed into. This usually shows you recent activity, |
| Locations | Locations observed for sign-ins |
| Groups | Groups associated with the identity (when available) |

### Primary accounts

Each identity can include multiple related accounts from different identity providers. Microsoft Defender identifies one account as the primary account and uses that account’s profile values for identity-level fields, such as display name and job title.

Microsoft Defender uses internal correlation logic to determine the primary account.

In the **Accounts** table, the primary account is identified by the primary account icon next to the account's display name.

## Risk score tab

The **Risk score** tab summarizes the identity's risk level by combining alert activity with identity attributes like role assignments and sensitivity classification. Use this tab to understand an identity's risk score, identify contributing factors, and prioritize investigation.

| Section | Description |
| --- | --- |
| **Risk Summary** | Displays: <ul><li>The identity's overall risk score (0–100)</li><li>How the identity compares to other identities in your organization by percentile</li><li>The account sets linked to the identity</li><li>The Microsoft Entra ID risk level for each Microsoft Entra account, including the last updated time. Select the Microsoft Entra ID risk level to see timeline details</li><li>Likelihood of compromise</li><li>Impact of compromise</li></ul> |
| **Likelihood of Compromise** | Shows the likelihood severity level and breaks down alerts by MITRE ATT&CK kill chain stage (for example, Initial Access, Persistence, and Privilege Escalation) for each account set. |
| **Impact of Compromise** | Shows the potential impact level based on the identity's criticality level, classification (for example, Global Administrator), and Microsoft Entra Privileged Identity Management (PIM) role assignments. |
| **Risk Trend** | A line chart that shows how the risk score changed over a configurable time period (for example, 30 days). Select **Go to timeline** to view the full activity timeline. |
| **Likelihood of Compromise Details** | A bar chart that shows alert distribution across MITRE ATT&CK categories, with a filterable alert table. Use the **Active alerts only** toggle to focus on unresolved alerts. Filter by account set, status, or kill chain stage. |

The **Confirm safe** action now includes **Reset risk** for both the identity risk score and the Microsoft Entra risk level. For more information, see [Remediation actions in Microsoft Defender for Identity](/defender-for-identity/remediation-actions#supported-actions).

> [!NOTE]
> Identity risk in Microsoft Defender for Identity uses automated decay logic to allow SOC prioritization. If no new risk factors are detected, the identity risk score decreases over time. Microsoft Entra ID maintains its own risk level independently and doesn't apply decay. As a result, you might see an Entra risk level with no corresponding identity risk score when the Entra risk update time is older than 30 days.

> [!NOTE]
> Identity risk in Microsoft Defender for Identity uses automated decay logic to allow SOC prioritization. If no new risk factors are detected, the identity risk score decreases over time. Microsoft Entra ID maintains its own risk level independently and doesn't apply decay. As a result, you might see an Entra risk level with no corresponding identity risk score when the Entra risk update time is older than 30 days.

## Timeline tab

The **Timeline** tab provides a chronological, identity-centric view of activity and alerts correlated to the identity across your environment: on-premises Active Directory, Microsoft Entra ID, IAM and other identity providers, SaaS applications, cloud, and endpoints. It aggregates data from integrated Microsoft security products, such as Microsoft Defender for Identity, Microsoft Defender for Endpoint, Microsoft Defender for Cloud Apps, and Microsoft Sentinel.

The timeline brings together sign-ins, audit events, risk signals, applied controls, and Conditional Access evaluations alongside all workload activity, so you can reconstruct sequences of activity and correlate events during an investigation. Because activity is correlated at the identity level, the timeline includes events where the identity is the actor or the target. It covers every account linked to the identity, including manually and policy-based (custom) correlated accounts. Duplicate events are removed so the same activity isn't shown twice; for example, when a sign-in appears in both the Entra ID and cloud app data, the timeline favors the Entra ID source.

:::image type="content" source="media/investigate-users/identity-timeline.png" alt-text="Screenshot of the Timeline tab on the Identity page in Microsoft Defender." lightbox="media/investigate-users/identity-timeline.png":::

### Types of activities that appear in the timeline

The following data types are available in the timeline:

- A user's impacted alerts
- Active Directory and Microsoft Entra ID activities, including Microsoft Entra sign-ins and Microsoft Graph activity (audit) events
- Microsoft Entra ID risk signals and Conditional Access evaluation results, shown inline
- Cloud apps events
- Device logon events
- Directory services changes
- Activities associated with custom (manually or policy-based) correlated accounts

### Tables aggregated into the timeline

The timeline draws from multiple advanced hunting tables and normalizes them into a single schema. The following tables are used to build the identity timeline:

- AlertInfo
- IdentityLogonEvents
- IdentityQueryEvents
- IdentityDirectoryEvents
- CloudAppEvents
- DeviceLogonEvents
- EntraIdSignInEvents
- GraphApiAuditEvents

<!-- TODO: Confirm the public advanced hunting table names and reference links for each entry above. The spec also lists "AppIdentityEvents (IdentityEvents)" and "BehaviorInfo (P1)"—verify whether these are shipped and publicly documented before including them. -->

> [!NOTE]
> Microsoft Defender can display date and time information using either your local time zone or UTC. The selected time zone applies to all date and time information shown in the Identity timeline.
>
> To set the time zone for these features, go to **Settings** \> **Security center** \> **Time zone**.

### Timeline schema

The timeline normalizes events from the different source tables into a unified schema. Some columns are shown by default; others can be added from **Customize columns**. The following columns are available:

> [!NOTE]
> A field is populated only if it exists in the source table for that event. If the source table doesn't provide a value for a column, that column is empty for the event.

| Column | Type | Shown by default | Filterable by default |
|---|---|---|---|
| Time | DateTime | Yes | Yes |
| Type | Enum (Event or Alert) | Yes | Yes |
| Title | String | Yes | Yes |
| Source provider account ID | String | Yes | Yes |
| Account display name | String | Yes | Yes |
| Source provider | String | Yes | Yes |
| IP address | String | Yes | Yes |
| Device | String | Yes | Yes |
| Risk/Severity | String | Yes | Yes |
| Location | String | Yes | Yes |
| Conditional Access policies | Dynamic | Yes | No |
| Source table | String | Yes | No |
| Sentinel workspace | String | No | No |
| Target | Dynamic | No | Not filterable |
| Session ID | String | No | No |
| Unique token identifier | String | No | No |
| Additional information | Dynamic | No | Not filterable |
| ReportId | String | No | No |

### Event details pane

Select an event in the timeline to open a side pane with the event details. The pane organizes the information into tabs. For Microsoft Entra ID sign-in events, the pane includes a **Conditional Access** tab that shows the Conditional Access policies evaluated during the sign-in, including each policy's name, grant controls, and result (for example, **Success**, **Not applied**, or **Block**). Reviewing these evaluation results helps analysts understand which controls applied during an investigation.

:::image type="content" source="media/investigate-users/identity-timeline-conditional-access.png" alt-text="Screenshot of the sign-in event details pane on the Identity timeline showing Conditional Access policy evaluation results." lightbox="media/investigate-users/identity-timeline-conditional-access.png":::

## Security recommendations tab

The **Security recommendations** tab displays identity related posture assessments identified through Identity Security Posture Management (ISPM). These recommendations highlight misconfigurations or risky settings across the identity’s accounts, and selecting a recommendation opens the details in Microsoft Secure Score for remediation guidance.

:::image type="content" source="media/investigate-users/identity-posture-recommendations.png" alt-text="Screenshot of the Security recommendations tab on the Identity page in Microsoft Defender." lightbox="media/investigate-users/identity-posture-recommendations.png":::

## Attack paths tab

The **Attack paths** tab visualizes potential lateral movement paths that involve the identity or lead to it. These insights help security teams understand exploitable relationships and reduce identity‑based attack surface.

## Policies tab

The **Policies** tab displays identity‑related security policies that are relevant to the identity based on its attributes, roles, and observed activity.

This view provides investigation context by showing which policies apply to the identity and how they influence access or risk evaluation. Policies are managed elsewhere; this tab helps analysts correlate policy enforcement with sign‑ins, alerts, and investigation findings.

## Identity Explorer tab (Preview)

> [!NOTE]
> The Identity Explorer tab requires a Microsoft Sentinel Data Lake license.

The **Identity Explorer** tab uses the [hunting graph](advanced-hunting-graph.md) to visualize identity attack paths and exposure scenarios as interactive graphs. The graph is pre-seeded with the current identity, so you can immediately see how the identity relates to other entities in your environment.

Use the Identity Explorer to discover lateral movement paths, privilege escalation routes, and credential-access risks associated with the identity.

:::image type="content" source="media/hunting-graph-identity/hunting-graph.png" alt-text="Screenshot of the Identity Explorer tab on the Identity page showing an entity relationship map with identity nodes and connections." lightbox="media/hunting-graph-identity/hunting-graph.png":::

### Search with predefined scenarios

Select **Search with predefined scenarios** to run identity-focused queries. Each scenario maps to one or more [MITRE ATT&CK](https://attack.mitre.org/) techniques and focuses on a specific type of identity risk.

:::image type="content" source="media/hunting-graph-identity/hunting-graph-scenario.png" alt-text="Screenshot of the predefined identity scenarios panel in Identity Explorer." lightbox="media/hunting-graph-identity/hunting-graph-scenario.png":::

The following table describes the predefined identity scenarios available in Identity Explorer.

| Scenario | Description | MITRE Technique |
|---|---|---|
| **Synced Entra users with permissions on OAuth application, allowing authentication as privileged Service Principal** | OAuth applications acting as privileged service principals that can access resources without user interaction. | Privilege Escalation, Lateral Movement |
| **Non-privileged users have a path leading to sensitive user/group (On-Prem/Cloud)** | Non-privileged users who have paths to sensitive identities, showing potential privilege escalation. | Privilege Escalation, Lateral Movement |
| **Service accounts with RDP access to critical device** | Service accounts that can remotely access critical devices via RDP, creating persistent access risks if compromised. | Lateral Movement |
| **Kerberoastable users with a path to a critical asset** | Kerberoastable users with attack paths to critical assets, allowing offline password attacks that can lead to privilege escalation. | Privilege Escalation, Credential Access |
| **Synced Entra users with direct permissions to cloud resources** | Microsoft Entra users with hybrid permissions on multiple cloud resources, breaking security boundaries and violating least privilege. | Lateral Movement |
| **External Entra users with direct permissions to cloud resources** | External identities with direct access to cloud resources, representing third-party risk and possible data exposure. | Lateral Movement |
| **Non-privileged users with a path to own AD domain (DCSync)** | Non-privileged users with paths that enable full Active Directory domain compromise via DCSync. | Privilege Escalation, Credential Access |
| **Non-privileged users that can reach Domain Admins group (<5 hops)** | Non-privileged users who can reach the Domain Admins group in fewer than five steps. | Privilege Escalation, Lateral Movement |
| **ASREPRoastable users with a path to a critical asset** | AS-REP roastable accounts with paths to critical assets that can be attacked through offline password cracking. | Privilege Escalation, Credential Access |
| **Non-privileged user account which is exposed on multiple devices have RDP login permissions to critical assets (On-Prem/Cloud)** | Non-privileged users exposed on multiple devices who can remotely access critical assets via RDP. | Credential Access |

For more information about the hunting graph and its features, see [Hunt for threats using the hunting graph](advanced-hunting-graph.md).

## Microsoft Sentinel events tab

When Microsoft Sentinel is connected to the Defender portal, this tab shows a Microsoft Sentinel timeline for the identity. The timeline includes alerts associated with the identity, including alerts also shown on the **Incidents and alerts** tab and alerts created by Microsoft Sentinel. It also shows bookmarked hunts that reference the identity, activity events from external data sources, and unusual behaviors identified by Microsoft Sentinel anomaly rules.

:::image type="content" source="media/investigate-users/user-incident-sentinel-events.png" alt-text="Screenshot of the Microsoft Sentinel events tab on the Identity page in Microsoft Defender." lightbox="media/investigate-users/user-incident-sentinel-events.png":::

### Insights

The **Insights** section shows entity insights, which are investigation queries defined by Microsoft security researchers to help analysts investigate identities more efficiently. These insights automatically highlight key security signals such as sign-in activity, group changes, and anomalous behavior, and present results as tables and charts. Insights are powered by Microsoft Sentinel and the data sources connected to it, including Microsoft Entra ID logs and Microsoft Sentinel UEBA when enabled.

#### Types of insights

The following are some of the insights shown:

- User peers based on security groups membership
- Actions by account
- Actions on account
- Event logs cleared by user
- Group additions
- Anomalously high office operation count
- Resource access
- Anomalously high Azure sign-in result count
- UEBA insights
- User access permissions to Azure subscriptions
- Threat indicators related to user
- Watchlist insights (Preview)
- Windows sign-in activity

#### Data sources for insights

Insights are based on the following data sources:

- Syslog (Linux)
- SecurityEvent (Windows)
- AuditLogs (Microsoft Entra ID)
- SigninLogs (Microsoft Entra ID)
- OfficeActivity (Office 365)
- BehaviorAnalytics (Microsoft Sentinel UEBA)
- Heartbeat (Azure Monitor Agent)
- CommonSecurityLog (Microsoft Sentinel)

#### Explore insights in Advanced hunting

To further explore any insight, select the link accompanying the insight. The link opens the **Advanced hunting** page with the query underlying the insight and its raw results. You can modify the query or drill down into the results to expand your investigation.

:::image type="content" source="media/investigate-users/insights-advanced-hunting.png" alt-text="Screenshot of the Advanced hunting screen with insight query." lightbox="media/investigate-users/insights-advanced-hunting.png":::

## Next steps

- [Investigate incidents in Microsoft Defender](/defender-xdr/investigate-incidents)
- [Investigate alerts in Microsoft Defender](/defender-xdr/investigate-alerts)
