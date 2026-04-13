---
title: Investigate an Active Directory domain (Preview)
description: Learn how to investigate an Active Directory domain in Microsoft Defender. Review domain health scores, security policies, trust relationships, and recommendations.
#customer intent: As a security admin, I want to view the security posture of my Active Directory domains so that I can identify coverage gaps, review security policies, and act on recommendations.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 03/17/2026
ms.topic: concept-article
ms.service: microsoft-defender-for-identity
ms.custom: msecd-doc-authoring-106
ai-usage: ai-assisted
---

# Investigate an Active Directory domain (Preview)

Active Directory domains are frequently targeted in identity-based attacks. Configuration issues such as unhealthy sensors, weak security policies, or risky trust relationships can expose an environment, but the information needed to assess a domain's security is often distributed between different tools and views.

The Active Directory domain page in Microsoft Defender brings together domain health, sensor coverage, security policies, trust relationships, and recommendations for your on-premises Active Directory environment into a single view. Use it to determine whether a domain is healthy and fully monitored, identify configuration or policy issues that increase risk, review trust relationships, and act on prioritized recommendations.

## Prerequisites

- A Microsoft Defender for Identity license, or another license that includes Defender for Identity (such as E5).
- A user role with at least [Security Reader](/azure/active-directory/roles/permissions-reference#security-reader) permissions.

## Access the Domain page

You can reach the Active Directory domain page through multiple entry points in Microsoft Defender:

- Select a domain name from the **Domain** column in the identity inventory.
- Select a domain from a domain-related security alert or incident.
- Search for a domain by name using the global search bar.

To switch between domains when you're on the domain page, use the domain selector at the top right of the page.

## Overview tab

:::image type="content" source="media/investigate-domain/domain-page-overview.png" alt-text="Screenshot that shows the domain overview tab with domain details, deployment health, health score, and identity summary cards.":::

The **Overview** tab provides a domain summary with the following sections:

| Section | Description |
|---|---|
| **Domain details** | Shows key domain attributes: <ol><li>Provider</li><li>Domain name</li><li>Functional level</li><li>Creation date</li><li>Identities count</li><li>Service accounts count</li><li>Group accounts count</li><li>Computer accounts count</li></ol> Select any count to view the filtered list. |
| **Properties** | Shows the domain's **Canonical Name**, **SID**, and **ID**. |
| **Deployment Health** | Shows sensor deployment coverage and health status. A 100% coverage score means all domain controllers have sensors deployed. Select a deployment issue to navigate to sensor deployment settings. |
| **Health Score** | Displays an overall health score (Low, Medium, or High) based on identity infrastructure coverage, sensor health, and active recommendations. Select **How to fix** to view recommended actions. |
| **All Domain Identities** | Shows the total number of identities, including how many are classified as **Critical** or **Sensitive**. Select **View domain identities** to open the identity inventory filtered to this domain. |
| **Service accounts** | Shows a donut chart of service accounts by type: sMSA (standalone Managed Service Account), gMSA (group Managed Service Account), and User. Select **View domain service accounts** to open the service accounts page. |
| **Sensitive Entities** | Shows the count of sensitive identities, groups, and computers. Select any count to view the details. |
| **Active Recommendations** | Lists security recommendations that affect the health score, with links to remediation guidance. For example, the **Unsecure Domain Configurations** recommendation links to the corresponding security posture assessment. |
| **Group Policies** | Lists Group Policy Objects (GPOs) applied in the domain. Use this section to verify active policies and identify domains with no GPOs configured. |

## Incidents and alerts tab

Shows all incidents and alerts connected to the domain. Data on this tab includes only incidents and alerts created on or after February 1, 2026.

The tab includes default filters for **Status** (New, In progress) and **Alert severity** (High, Medium, Low). You can export, copy the list link, refresh, and customize columns.

| Column | Description |
|---|---|
| **Incident name** | The name of the incident. |
| **Incident Id** | The unique identifier of the incident. |
| **Priority score** | The priority score assigned to the incident. |
| **Tags** | Tags associated with the incident. |
| **Severity** | The severity level of the incident (High, Medium, Low). |
| **Investigation state** | The current state of the investigation. |
| **Categories** | The threat categories associated with the incident. |
| **Impacted assets** | The assets affected by the incident. |
| **Active alerts** | The number of active alerts in the incident. |

## Security Policies tab

Provides human-readable summaries of key Active Directory security policies in four cards. Use this tab to review critical Active Directory configurations and check whether they meet current security standards.

:::image type="content" source="media/investigate-domain/domain-page-security-policies.png" alt-text="Screenshot that shows the Security policies tab of the Investigate domains page in Microsoft Defender.":::

| Card | Details |
|---|---|
| **Password Policy** | Password maximum age, minimum age, history, complexity, authenticated password change only, no clear-text password change, admin lockout after failed attempts, password store clear text, and password change is refused. |
| **Account Lockout Policy** | Lockout duration and lockout threshold. |
| **Kerberos Policy** | Maximum ticket age and maximum renewal age. |
| **LDAP & Machine Account** | LDAP signing policy and machine account quota. If the domain has active recommendations for insecure configurations, a warning banner appears with a link to view the recommendations. |

## Trusts tab

Shows trust relationships for the domain. You can export the list.

| Column | Description |
|---|---|
| **Display Name** | The name of the trusted domain. |
| **Direction** | The direction of the trust (for example, Inbound, Outbound, or Bidirectional). |
| **Attributes** | The attributes of the trust relationship. |

Use this tab to review which domains trust each other and in which direction.

## Group Accounts tab

Lists the groups in the domain. You can filter by tags, type, and scope. You can mark groups as sensitive to support exposure analysis and detect potential attack paths.

| Column | Description |
|---|---|
| **Name** | The name of the group. Select to view group details. |
| **Tags** | Tags assigned to the group, such as Sensitive. |
| **Type** | The group type (for example, Security). |
| **Scope** | The group scope (Universal, Global, or DomainLocal). |
| **Direct Members** | The number of direct members in the group. |
| **Canonical Name** | The full canonical name path of the group in Active Directory. |
| **Description** | The description of the group. |

## Computer Accounts tab

Lists the computer accounts in the domain. You can filter by tags. You can mark computer accounts as sensitive to support exposure analysis and detect potential attack paths.

| Column | Description |
|---|---|
| **Name** | The name of the computer account. Select to view computer details. |
| **Tags** | Tags assigned to the computer, such as Sensitive. |
| **Update Time** | The date and time the computer account was last updated. |
| **SID** | The Security Identifier of the computer account. |
| **Canonical Name** | The full canonical name path of the computer in Active Directory. |
| **Description** | The description of the computer account. |

## Related content

- [View the identity inventory](/defender-for-identity/identity-inventory)
- [Investigate and protect Service Accounts](/defender-for-identity/service-account-discovery)
- [Security posture assessments](/defender-for-identity/security-assessment)
- [Understand and investigate lateral movement paths](/defender-for-identity/understand-lateral-movement-paths)
