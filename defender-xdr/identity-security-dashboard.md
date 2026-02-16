---
title: Microsoft Defender coverage and maturity dashboard
description: Learn how to use the Coverage & Maturity dashboard in Microsoft Defender to understand identity protection posture across on-premises, cloud, SaaS, and partner environments.
ms.date: 02/16/2026
ms.topic: how-to
ms.author: abbyweisberg
author: AbbyMSFT
ms.reviewer: maelgami
ai-usage: ai-assisted
ms.service: Microsoft Defender
---

# Work with the Coverage & Maturity dashboard

The Coverage & Maturity dashboard provides a unified view of how well your identities are protected across the entire organization, including on-premises, cloud identity providers (IdPs), SaaS applications, and partner integrations.

Use the dashboard to understand your current protection posture, identify gaps, and take clear actions to increase identity coverage and reduce risk.

The dashboard provides:

- **A single, consolidated view of identity protection across all sources.** See how identities are protected across cloud providers, SaaS apps, partners, and on-premises environments.
- **Clear visibility into protection gaps.** Each widget quantifies the number of protected versus unprotected identities and highlights where you need to deploy sensors, connect IdPs, configure apps, or enable integrations.
- **Actionable next steps.** The dashboard guides you on exactly what to do next, with time estimates and a direct path to fix configuration or deploy missing components.

## Prerequisites

To access the Coverage & Maturity dashboard, you need:

- A Microsoft Defender for Cloud Apps or Microsoft Defender for Identity license.
- A user role with at least [Security Reader](/azure/active-directory/roles/permissions-reference#security-reader) permissions.

> [!IMPORTANT]
> Use roles with the fewest permissions to help improve security for your organization. Global Administrator is a highly privileged role that you should limit to scenarios when you can't use an existing role.

## Access the dashboard

To access the dashboard, sign into Microsoft Defender and select **Identities > Coverage and maturity**.

## Maturity score

The maturity score, called the Identity Resiliency Index, shows how much of your identity infrastructure is covered by Microsoft Defender protections. The score consists of a maturity tier label and a visual progress bar with color progression (red to yellow to green).

The maturity tiers are:

| Score range | Tier name | Customer state | Meaning |
|---|---|---|---|
| 0-39 | **Connected** | Initial deployment | You connected your environments and gained visibility, but protection is partial. Only one environment is connected. |
| 40-69 | **Protected** | Operational | You deployed sensors and SaaS connectors. Key assets are covered, but gaps in non-human or PIM/PAM/IdP remain. |
| 70-89 | **Fortified** | Advanced | You have high coverage across hybrid and multicloud. You're tackling advanced use cases like agentic identities. |
| 90-100 | **Resilient** | Fully mature | You achieved full coverage of all identity types across all environments. |

Select **Learn more** on the maturity score widget to open a side panel that explains how the maturity score works. The side panel shows:

- Your current maturity level with a progress bar.
- The top three upcoming tasks with name, time estimate, and call-to-action button.
- A list of all protection improvement tasks with the number of deployment gaps from all source cards.
- A link to documentation.

## Take recommended actions

The recommended actions section appears directly below the maturity score and displays three contextual action cards. Each action card includes a description, time estimate, and a **Take Action** button. The portal sources these actions from the deployment gaps it identifies across the coverage cards.

The portal sorts gaps by impact, highest first. The priority order for deployment gaps is:

1. On-premises sensor deployment, Entra ID connector, and App Governance.
1. SaaS app connectors.
1. IdP / PAM / PIM integrations.

The effort and impact for each gap type are:

| Gap type | Effort | Impact |
|---|---|---|
| Entra ID tasks | Low | High |
| SaaS app connectors | Low | Medium |
| On-premises sensor configuration | Low | Low |
| Legacy sensor configuration | Medium | Low |
| IdP and partner configuration | Low | Medium |

When you resolve all three displayed tasks, the section updates to show the next three deployment gaps. When no deployment gaps remain, the section indicates that your environment is fully protected.

## Review coverage cards

The dashboard displays one coverage card for each identity domain: on-premises identities, SaaS identities, Entra ID identities, and PIM / PAM & IdPs. The cards you see depend on your environment and licensing. If you can enable coverage for a domain, the card provides a link to configure it.

Select anywhere on the card to open the side panel with details.

Each card includes:

- The name of the identity domain.
- **Protection score**: Color-coded indicator reflecting the domain's protection logic.
- **Coverage breakdown**: Displays the format *X protected / Y total*. For example, "12 apps connected / 36 apps in use." If the deployment count increases, the percentage turns green. If the deployment count decreases, the percentage turns red.
- **Identity count**: Total number of identities in this domain. Select the identity count to go to the identity inventory page with the relevant filter applied.
- **Number of deployment gaps**: Count of unresolved gaps.

### On-premises identities card

When you activate sensors on your on-premises infrastructure, you get enhanced threat detections for Active Directory identities, identity security posture recommendations, automated attack disruption by using Defender XDR, and direct remediation actions on Active Directory identities.

The on-premises identities card shows the following information:

| Item | Description |
|---|---|
| **Protection score** | Percentage of servers with MDI sensors activated out of total servers discovered. |
| **Coverage breakdown** | X servers activated / Y servers in use |
| **Identity count** | Total on-premises identities. Select to go to the identity inventory page with filter. |
| **Deployment gaps** | Number of unresolved deployment gaps |

If any sensors have an unhealthy deployment, the card displays a notification. Select the notification to go to the **Health issues** page.

### SaaS identities card

When you connect SaaS applications, you can track user accounts across SaaS apps, investigate user activities in Advanced Hunting, get security posture recommendations for SaaS configurations, and detect threats to OAuth applications.

The SaaS identities card shows the following information:

| Item | Description |
|---|---|
| **Protection score** | Percentage of supported SaaS apps with connectors deployed out of supported SaaS apps discovered in use. |
| **Coverage breakdown** | X supported apps installed / Y supported apps in use |
| **Identity count** | Total SaaS identities. Select to navigate to the identity inventory page with filter. |
| **Deployment gaps** | Number of unresolved deployment gaps |

If any app connectors have an unhealthy deployment, the card displays a notification. Select the notification to go to the **App connectors settings** page.

### Entra ID identities card

> [!NOTE]
> This card only appears for customers with an Entra ID P2 license.

By connecting Entra ID, you get risk insights based on Entra ID Protection, you can hunt for Entra sign-in events in Advanced Hunting, link identities across your environments, receive security posture recommendations for Entra identities, and improve detections for OAuth applications and Entra accounts.

The Entra ID identities card shows the following information:

| Item | Description |
|---|---|
| **Protection score** | Based on: Entra ID P2 license available (50%), Microsoft 365 connector for enhanced detections (25%), and service principals protection enabled (25%). |
| **Coverage breakdown** | Microsoft 365 connector connected and App Governance enabled. |
| **Identity count** | Total Entra ID identities. Select to go to the identity inventory page with filter. |
| **Deployment gaps** | Number of unresolved deployment gaps |

### PIM / PAM & IdPs card

When you connect identity providers and privileged access management solutions, you get a unified view for investigation across all identity providers. You can track user accounts across those providers, investigate activities in Advanced Hunting, and take remediation actions directly on identity provider accounts.

The PIM / PAM & IdPs card shows the following information:

| Item | Description |
|---|---|
| **Protection score** | Percentage of IdP providers deployed out of IdP providers discovered in use. Supported IdPs: Okta, PingOne, CyberArk Identity, SailPoint. |
| **Coverage breakdown** | X IdPs installed / Y IdPs in use. Additional breakdown: Number of partners deployed. Supported PIM & PAM partners: BeyondTrust, Silverfort, Delinea, CyberArk. A tooltip describes the partner names. |
| **Identity count** | Total PIM / PAM & IdPs identities. Select to go to the identity inventory page with filter. |
| **Deployment gaps** | Number of unresolved deployment gaps |

## Maturity score calculation

The maturity score uses a weighted matrix of environment coverage and identity type depth. It distributes 100 points across critical domains. When you achieve full coverage across all identity types and environments, your maturity score reaches 100% and the dashboard displays "Fully licensed, fully deployed."

## Next steps

- [Microsoft Defender for Identity deployment overview](/defender-for-identity/deploy/deploy-defender-identity)
- [Enable instant visibility, protection, and governance actions for your apps](/defender-cloud-apps/enable-instant-visibility-protection-and-governance-actions-for-your-apps)
