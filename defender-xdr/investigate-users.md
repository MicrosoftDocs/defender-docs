---
title: Investigate Identities
description: Learn how to use the Identity page in Microsoft Defender to investigate user identities, review alerts, analyze activity timelines, and assess security risks across linked accounts.
#customer intent: As a security analyst using Microsoft Defender, I want to understand how to use the Identity page so that I can investigate potentially compromised identities, assess risk, and correlate alerts across linked user accounts.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 02/15/2026
ms.topic: article
ms.service: microsoft-defender
---

# Identities in Microsoft Defender

In Microsoft Defender, an **identity** represents a person or entity in your organization. Because users often have multiple accounts across providers such as on-premises Active Directory, Microsoft Entra ID, SaaS applications, and other IDPs, Defender correlates them into a single identity. The **Identity** page consolidates identity details, observed activity, alerts, and exposure across linked accounts so security teams can quickly assess risk, determine possible compromise, and understand the identity’s access across the environment.

You can open the **Identity** page by selecting an identity from several areas in the Microsoft Defender portal, including:

- Identities inventory
- Alerts queue
- Individual alert pages
- Incidents or devices
- Advanced hunting results
- Activity log
- Action center

The Identity page is organized into a top section and a set of tabs. The top section shows identity context such as the org chart and tags, and includes the **Actions** menu. Use the tabs to review details about the identity, related alerts, and to look at deeper investigation views.

- **Org chart**: The identity’s place in the organizational hierarchy based on data from Microsoft Defender for Identity

- **Account tags**: Active Directory tags associated with the identity

The Identity page includes these tabs:

- Overview
- Incidents and alerts
- Observed in organization
- Timeline
- Security recommendations
- Attack paths
- Policies
- Microsoft Sentinel events

:::image type="content" source="media/investigate-users-new/identity-page.png" alt-text="Screenshot of a the identity page in Microsoft Defender portal." lightbox="media/investigate-users-new/identity-page.png":::

## Identity actions

From the **Overview** page, use the **Actions** menu to:

- Enable, disable, or suspend the user in Microsoft Entra ID.
- Direct the user to take specific actions, such as signing in again or resetting their password.
- View Microsoft Entra account settings, related governance, the user’s owned files, or the user’s shared files.

:::image type="content" source="media/investigate-users-new/identity-actions.png" alt-text="Screenshot of the actions menu on the Identities page in Microsoft Defender." lightbox="media/investigate-users-new/identity-actions.png":::

### Overview tab

The **Overview** tab provides a high-level snapshot that helps analysts quickly assess risk and decide whether deeper investigation is required.

The overview tab includes sections for:

- Entity details
- Incidents and alerts
- Associated interactive logon devices

#### Entity details

The Entity details panel summarizes key identity information and investigation signals, including:

- Microsoft Entra ID attributes and contact information
- Protection and User threat indications
- First seen and last seen timestamps
- Number of devices the identity signs into
- Linked user accounts, devices, and group memberships
- Related alerts and incidents, grouped by severity

Additional details appear depending on enabled services and features. For example:

- Environments with Microsoft Defender for Identity can see:

  - Active Directory account control flags, such as password-never-expires or account lock status
  - An organization tree that shows the identity’s position in the reporting hierarchy.

- (Preview) Environments with [Microsoft Purview Insider Risk Management](/purview/insider-risk-management-solution-overview) can see a user's insider risk severity and gain insights on a user's suspicious activities in the user page. Select the **insider risk severity** under Entity details to see the risk insights about the user.

- (Preview) Environments with [Microsoft Sentinel User and Entity Behavior Analytics (UEBA)](/azure/sentinel/identify-threats-with-entity-behavior-analytics) can see:

  - The user's top three UEBA anomalies from the last 30 days.
  - Links to launch pre-built advanced hunting queries and view all anomalous behaviors related to the user on the [Sentinel events tab](/defender-xdr/investigate-users#microsoft-sentinel-events).

### Incidents and alerts tab

The **Incidents and alerts** tab lists all alerts and incidents involving the identity within the supported retention window.

For a detailed description, see the incidents page or the alerts page.

:::image type="content" source="media/investigate-users-new/identity-incidents-and-alerts.png" alt-text="Screenshot of the Incidents and alerts tab on the Identities page in Microsoft Defender." lightbox="media/investigate-users-new/identity-incidents-and-alerts.png":::

### Observed in organization tab

The **Observed in organization** tab shows where and how the identity appears across the environment, helping analysts understand blast radius and potential lateral movement.

:::image type="content" source="media/investigate-users-new/identity-observed-in-organization.png" alt-text="Screenshot of the Observed in organization tab showing identity locations and sign-in activity." lightbox="media/investigate-users-new/identity-observed-in-organization.png":::

This tab can include:

| Section | Description |
| ---- | ---- |
| Accounts | All accounts associated with the identity across identity systems, including automatically and manually correlated accounts. Analysts can also link additional related accounts to the same identity. |
| Devices | Devices the identity signed into, typically covering recent activity. |
| Locations | Locations observed for sign-ins. |
| Groups | Groups associated with the identity, when available. |

When Microsoft Defender for Identity is available, this tab can also surface **lateral movement paths** identified in the on-premises environment.

### Timeline tab

The **Timeline** tab provides a chronological view of identity‑related activity and alerts aggregated from integrated Microsoft security products, such as Microsoft Defender for Identity, Microsoft Defender for Endpoint, Microsoft Defender for Cloud Apps, and Microsoft Sentinel.

The timeline helps you reconstruct sequences of activity and correlate events during investigations.

:::image type="content" source="media/investigate-users-new/identity-timeline.png" alt-text="Screenshot of the Timeline tab on the Identities page in Microsoft Defender." lightbox="media/investigate-users-new/identity-timeline.png":::

Security analysts can:

- Filter by activity type, severity, application, location, or protocol
- Adjust the time range or select a custom range
- Customize visible columns
- Export timeline data to CSV (within supported limits)

### Security Recommendations tab

The **Security recommendations** tab displays identity‑related posture assessments identified through Identity Security Posture Management (ISPM). These recommendations highlight misconfigurations or risky settings across supported identity providers. When you select a recommendation, you see the details in Microsoft Secure Score for remediation guidance.

:::image type="content" source="media/investigate-users-new/screenshot-of-posture-recommendations.png" alt-text="Screenshot of the Security recommendations tab showing identity posture assessments." lightbox="media/investigate-users-new/screenshot-of-posture-recommendations.png":::

### Attack Paths tab

The **Attack paths** tab visualizes potential lateral movement paths that involve the identity or lead to it. These insights help security teams understand exploitable relationships and reduce identity‑based attack surface.

### Policies tab

The **Policies** tab displays identity‑related security policies that are relevant to the identity based on its attributes, roles, and observed activity.

This view provides investigation context by showing which policies apply to the identity and how they influence access or risk evaluation. You manage policies elsewhere. This tab helps analysts correlate policy enforcement with sign‑ins, alerts, and investigation findings.

### Microsoft Sentinel Events

When you connect Microsoft Sentinel to the Defender portal, this tab can show a Sentinel timeline for the identity. The timeline includes alerts associated with the identity, including alerts also shown on the **Incidents and alerts** tab and alerts created by Microsoft Sentinel from non‑Microsoft data sources. It also shows bookmarked hunts that reference the identity, activity events from external data sources, and unusual behaviors identified by Microsoft Sentinel anomaly rules.

:::image type="content" source="media/investigate-users-new/user-incident-sentinel-events.png" alt-text="Screenshot of Microsoft Sentinel events tab on the Identity page." lightbox="media/investigate-users-new/user-incident-sentinel-events.png":::

#### Insights

The **Insights** section shows entity insights, which are investigation queries defined by Microsoft security researchers to help analysts investigate identities more efficiently. These insights automatically highlight key security signals such as sign‑in activity, group changes, and anomalous behavior, and present results as tables and visualizations. Microsoft Sentinel and the data sources connected to it, including Microsoft Entra ID logs and Microsoft Sentinel UEBA when enabled, power the insights.

To explore any insight further, select the accompanying link to open the **Advanced hunting** page, which displays the underlying query and raw results.

:::image type="content" source="media/investigate-users-new/insights-advanced-hunting.png" alt-text="Screenshot of the Advanced hunting page showing an insight query." lightbox="media/investigate-users-new/insights-advanced-hunting.png":::
