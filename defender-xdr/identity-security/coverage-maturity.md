---
title: View your identity coverage and maturity (Preview)
description: Learn how to use the Coverage and maturity page in Microsoft Defender to check your identity protection status and close coverage gaps in your environments.
ms.date: 03/23/2026
ms.topic: how-to
ms.author: abbyweisberg
author: AbbyMSFT
ms.reviewer: maelgami
ai-usage: ai-assisted
ms.service: defender-xdr
ms.custom: msecd-doc-authoring-106

#customer intent: As a security admin, I want to see how well my identities are protected so that I can find and close coverage gaps in my environments.
---

# View your identity coverage and maturity (Preview)

The Microsoft Defender **Coverage and maturity** page shows how well your identities are protected in your on-premises, cloud, SaaS, and partner environments.

You can use this page to:

- **Check your protection status**: Get a quick, high-level view of how complete your identity coverage is, and track progress over time.
- **Close protection gaps**:  See where coverage is missing and what to do about it. Tasks are prioritized by security impact and effort, so you can focus on the most important fixes first.

>[!NOTE]
>The **Coverage and maturity** page  is being rolled out gradually to customers, and might not yet be available in your organization.

## Prerequisites

To use the **Coverage and maturity** page, you need:

- A Microsoft Defender for Cloud Apps or Microsoft Defender for Identity license.
- A user role with at least [Security Reader](/azure/active-directory/roles/permissions-reference#security-reader) permissions.

> [!IMPORTANT]
> Use roles with the fewest permissions to help improve security for your organization. Global Administrator is a highly privileged role that you should limit to scenarios when you can't use an existing role.

## Access the **Coverage and maturity** page

To access the **Coverage and maturity** page, sign in to the [Microsoft Defender portal](https://security.microsoft.com) and select **Identities > Coverage and maturity**.

:::image type="content" source="media/coverage-maturity-page.png" alt-text="Screenshot that shows the Coverage and maturity page in Microsoft Defender.":::

## Maturity level

The maturity level shows how complete your identity protection is overall. It reflects how much of your identity environment is connected, monitored, and secured. The level is tailored to your environment based on the identity sources that Defender detects, so it reflects your specific coverage status.

The maturity tiers are:

| Tier | Description |
| --- | --- |
| **Connected** | You connected at least one environment and gained initial visibility, but protection is partial. |
| **Protected** | You deployed sensors and SaaS connectors. Key assets are covered, but some gaps remain. |
| **Fortified** | You have broad coverage in hybrid and multicloud environments, including non-human identities. |
| **Resilient** | You achieved full coverage of all identity types in all environments. |

### Maturity level calculation

The maturity level is based on a score ranging from 0 to 100, based on the combined coverage scores of the identity sources detected in your organization. Sources that don't exist in your environment aren't included in the calculation. As your score increases, your maturity tier progresses from **Connected** through **Protected** and **Fortified** to **Resilient**.

## Top setup tasks

The **Top setup tasks** section shows the five most important things you can do to improve your coverage. Each task shows its **impact**, **maturity score effect**, and **estimated effort**.

Tasks are ranked so that high-impact, low-effort items appear first:

1. On-premises sensor deployment, Microsoft Entra ID connector, and app governance
2. SaaS app connectors
3. Identity provider, PAM, and IGA integrations

Select a task to go directly to the setup page in the portal. A green checkmark appears when you complete a task. After you finish all five, the list refreshes with the next five priorities.

## Coverage sources

The page shows one card for each identity source: **Identity providers**, **SaaS identities**, **On-premises identities**, and **PAM & IGA identities**. The cards you see depend on your environment and licensing.

:::image type="content" source="media/coverage-sources.png" alt-text="Screenshot that shows the coverage sources section of the Coverage and maturity page in Microsoft Defender.":::

Each card shows:

- **Identity count**: The number of protected identities. Select the count to view them in the identity inventory.
- **Coverage score**: The percentage of setup tasks completed for this source.
- **Active connections**: How many sources are connected out of the total detected (for example, "12 apps connected / 36 apps in use").
- **Actions required**: The number of unresolved gaps.
- **Review and improve coverage**: Select to see the specific gaps for this source.

If any servers or app connectors have health issues, the card shows a notification that links to the **Health issues** page.

### Identity providers card

Shows identities from Microsoft Entra ID and other connected identity providers. Connecting Microsoft Entra ID enables risk insights, sign-in event hunting, linking identities between environments, and security recommendations.

| Item | Description |
| --- | --- |
| Protected human identities | Human identities protected by connected identity providers. |
| Protected non-human identities | Non-human identities protected by connected identity providers. |
| Coverage score | Percentage of setup tasks completed for identity providers. |
| Actions required | Number of unresolved gaps. |

### On-premises identities card

Shows identities from on-premises Active Directory. Deploying sensors enables threat detections, security recommendations, automated attack disruption, and remediation actions for AD identities.

| Item | Description |
| --- | --- |
| Coverage score | Percentage of active sensors out of discovered sensors. |
| Active sensors | Sensors activated out of total servers. |
| Actions required | Number of unresolved gaps. |

> [!NOTE]
> The **Coverage and maturity** page lists all servers that don't have a Defender for Identity sensor. It links to the **Sensor activation** page (**Settings** > **Identities** > **Sensors**), where you can install sensor version 3. However, sensor version 3 requires Defender for Endpoint. If a server doesn't have Defender for Endpoint, it won't appear on the Sensor activation page. For those servers, deploy [sensor version 2](/defender-for-identity/deploy/install-sensor) instead.

### SaaS identities card

Shows identities from connected SaaS applications. Connecting SaaS apps enables user tracking, activity hunting, security recommendations, and OAuth app threat detection.

| Item | Description |
| --- | --- |
| Coverage score | Percentage of connected SaaS apps out of discovered apps. |
| Active connectors | Connected apps out of total supported apps. |
| Actions required | Number of unresolved gaps. |

### PAM & IGA identities card

Shows partner integrations for privileged access management (PAM) and identity governance and administration (IGA) solutions. Partner gaps count toward your maturity score. Resolving them increases the score.

| Item | Description |
| --- | --- |
| Coverage score | Percentage of connected PAM and IGA solutions out of discovered solutions. |
| Active connectors | Connected solutions out of total supported solutions. |
| Actions required | Number of unresolved gaps. |

## Related content

- [Microsoft Defender for Identity deployment overview](/defender-for-identity/deploy/deploy-defender-identity)
- [Enable instant visibility, protection, and governance actions for your apps](/defender-cloud-apps/enable-instant-visibility-protection-and-governance-actions-for-your-apps)
- [Non-Microsoft identity and PAM integration](identity-security-overview.md)
