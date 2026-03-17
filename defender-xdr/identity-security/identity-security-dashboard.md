---
title: Microsoft Defender coverage and maturity dashboard
description: Learn how to use the Coverage and maturity dashboard in Microsoft Defender to understand identity protection posture across on-premises, cloud, SaaS, and partner environments.
ms.date: 03/17/2026
ms.topic: how-to
ms.author: abbyweisberg
author: AbbyMSFT
ms.reviewer: maelgami
ai-usage: ai-assisted
ms.service: defender-xdr
---

# View your identity coverage and maturity

The Coverage and maturity page provides a unified view of how well identities are protected across your organization, including on-premises environments, cloud identity providers (IdPs), SaaS applications, and partner integrations.

The dashboard supports both:

- high-level visibility and progress tracking
- guided gap prioritization and protection improvements

Use the dashboard to understand your overall identity protection posture at a glance. It shows your current coverage and maturity across identity sources, helping you track progress over time using maturity indicators and security scores at both an organizational and per-source level.

For teams focused on strengthening identity protection, the dashboard highlights protection gaps by source and helps prioritize actions. It identifies where coverage is missing or incomplete and guides you to the most impactful next steps to improve protection and reduce risk.

In one consolidated view, you can:

- See coverage, maturity, and progress across cloud providers, SaaS apps, partner integrations, and on-premises environments.
- Clearly identify protection gaps by source, including unprotected identities and areas where sensors need to be deployed, IdPs connected, applications configured, or integrations enabled.
- Follow actionable, prioritized recommendations that include effort estimates and direct links to remediation, helping teams focus first on the changes that deliver the greatest security impact.

## Prerequisites

To access the Coverage and maturity dashboard, you need:

- A Microsoft Defender for Cloud Apps or Microsoft Defender for Identity license.
- A user role with at least [Security Reader](/azure/active-directory/roles/permissions-reference#security-reader) permissions.

> [!IMPORTANT]
> Use roles with the fewest permissions to help improve security for your organization. Global Administrator is a highly privileged role that you should limit to scenarios when you can't use an existing role.

## Access the dashboard

To access the dashboard, sign in to Microsoft Defender and select **Identities > Coverage and maturity**.

## Maturity level

The maturity level widget shows your organization's overall identity security coverage in Microsoft Defender. It indicates how mature and comprehensive your identity security posture is, including how well your identity ecosystem is monitored, integrated, and secured. The widget is tailored specifically to your environment, showing you how comprehensive your protection is and where you have gaps that can leave you vulnerable to attacks.

The maturity tiers are:

| Tier name | Customer state | Description |
| --- | --- | --- |
| Connected | Initial deployment | You connected your environments and gained visibility, but protection is partial. Only one environment is connected. |
| Protected | Operational | You deployed sensors and SaaS connectors. Key assets are covered, but gaps in non-human or PAM/IGA remain. |
| Fortified | Advanced | You have high coverage across hybrid and multicloud environments. You're tackling advanced use cases like agentic and non-human identities. |
| Resilient | Fully mature | You achieved full coverage of all identity types across all environments. |

Select **Learn more** on the maturity score widget for documentation that explains how the maturity score works.

### Maturity level calculation

The level is calculated from the individual coverage scores of each identity source in your organization.

The maturity score uses a weighted matrix of environment coverage and identity type depth. It distributes 100 points across critical domains. When you achieve full coverage across all identity types and environments, your maturity score reaches 100% and the dashboard displays "Fully licensed, fully deployed."

## Top setup tasks

The **Top setup tasks** section lists the five most impactful deployment gaps across your identity-related sources. Each task includes its **impact**, your **personal maturity score**, and the **estimated effort** required to complete it.

The dashboard prioritizes deployment gaps by impact, from highest to lowest, to help you maximize security improvements while minimizing effort. Tasks that deliver the greatest impact with the least effort are ranked higher.

The priority order for deployment gaps is:

- On-premises sensor deployment, Entra ID connector, and App Governance
- SaaS app connectors
- IdP, PAM, and IGA integrations

When you select a task, you go directly to the relevant location in the Microsoft Defender portal, where you can complete or fix the task. A green checkmark appears when you complete a task successfully.

After you complete all five tasks, the card refreshes automatically and displays the next five highest-priority tasks, based on remaining deployment gaps and their impact and effort.

If the dashboard detects no deployment gaps, the section indicates that your environment is fully protected.

## Coverage sources

The dashboard displays one coverage card for each identity domain: identity providers, SaaS identities, on-premises identities, and PAM & IGA identities. The cards you see depend on your environment and licensing. If you can enable coverage for a domain, the card provides a link to configure it.

Each card includes:

- The total number of identities in this domain. Select the identity count to go to the identity inventory page with the relevant filter applied.
- The coverage score. The percentage of completed tasks that to connect all of the identities detected in your environment.
- The active connections, shown as *X protected / Y total*. For example, "12 apps connected / 36 apps in use."
- Actions required, the number of unresolved gaps.
- The **Review and improve coverage** button. Select to see the list of gaps for this identity domain.

If any servers or applications have health issues, the card displays a health notification. Select the notification to go to the **Health issues** tab, where you can review and resolve the issues.

### Identity providers identities card

The Identity providers identities card consolidates identity coverage from Microsoft Entra ID and other connected identity providers into a single view. When you connect Microsoft Entra ID, you get risk insights based on Entra ID Protection, the ability to search Entra sign-in events by using advanced hunting, identity correlation across environments, and security posture recommendations for Entra identities. The integration also enhances detections for OAuth applications and Entra ID accounts.

The Identity providers identities card shows the following information:

| Item | Description |
| --- | --- |
| Protected human identities | The number of human identities protected by connected identity providers. |
| Protected non-human identities | The number of non-human identities protected by connected identity providers. |
| Coverage score | The percentage of completed tasks that are connected to secure your identity provider identities. |
| Actions required | Number of unresolved deployment gaps. |

### On-premises identities card

When you activate sensors on your on-premises infrastructure, you get enhanced threat detections for Active Directory identities, identity security posture recommendations, automated attack disruption by using Defender XDR, and direct remediation actions on Active Directory identities.

The on-premises identities card shows:

| Item | Description |
| --- | --- |
| Protection score | The percentage of active sensors out of discovered sensors. |
| Active servers | X servers activated / Y servers in use. |
| Actions required | Number of unresolved deployment gaps. |

The card displays a health notification if any servers or sensors have health issues. Select the notification to go to the **Health issues** tab, where you can review and resolve the issues.

### SaaS identities card

When you connect SaaS applications, you can track user accounts across SaaS apps, investigate user activities in advanced hunting, get security posture recommendations for SaaS configurations, and detect threats to OAuth applications.

The SaaS identities card shows:

| Item | Description |
| --- | --- |
| Protection score | The percentage of connected SaaS out of discovered SaaS. |
| Active connectors | X supported apps installed / Y supported apps in use. |
| Actions required | Number of unresolved deployment gaps. |

If any app connectors have an unhealthy deployment, the card displays a notification. Select the notification to go to the **App connectors settings** page.

### PAM & IGA identities card

When you connect privileged access management (PAM) and identity governance and administration (IGA) solutions, this card provides a unified view of those identity sources. You can correlate and track user accounts across connected providers, investigate identity-related activities, and use advanced hunting to identify suspicious behavior. You can also take remediation actions directly on affected accounts.

Partner gaps count toward your organization's maturity score. For example, if your organization uses CyberArk or SailPoint, unresolved gaps are reflected in your score. When you resolve them, your maturity score increases.

The PAM & IGA identities card shows the following information:

| Item | Description |
| --- | --- |
| Coverage score | The percentage of connected PAM and IGA solutions out of discovered solutions. |
| Active connectors | X supported connectors / Y supported connectors in use. |
| Actions required | Number of unresolved deployment gaps. |

## Known limitation

The Coverage and maturity dashboard identifies all servers without a Microsoft Defender for Identity sensor and links to sensor deployment instructions. Currently, the dashboard directs all such servers to [Defender for Identity sensor version 3 deployment](/defender-for-identity/deploy/activate-sensor). Sensor version 3 requires Microsoft Defender for Endpoint. Servers that don't have Defender for Endpoint must deploy [Defender for Identity sensor version 2](/defender-for-identity/deploy/install-sensor) instead.

On the **Sensors** page (**Settings** > **Identities** > **Sensors**), the deployment table shows only servers that have Microsoft Defender for Endpoint installed. As a result, servers without Defender for Endpoint don't appear on that page, even though they appear in the Coverage and maturity dashboard.

## Next steps

- [Microsoft Defender for Identity deployment overview](/defender-for-identity/deploy/deploy-defender-identity)
- [Enable instant visibility, protection, and governance actions for your apps](/defender-cloud-apps/enable-instant-visibility-protection-and-governance-actions-for-your-apps)
- [Non-Microsoft identity and PAM integration](identity-security-overview.md)
