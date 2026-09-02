---
title: View your identity coverage and maturity (Preview)
description: Learn how to use the Coverage and maturity page in Microsoft Defender to check your identity protection status and close coverage gaps in your environments.
ms.date: 06/16/2026
ms.topic: how-to
ms.author: abbyweisberg
author: AbbyMSFT
ms.reviewer: maelgami
ai-usage: ai-assisted
ms.service: defender-xdr
ms.custom: msecd-doc-authoring-1014

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

## Access the **Coverage and maturity** page

To access the **Coverage and maturity** page, sign in to the [Microsoft Defender portal](https://security.microsoft.com) and select **Identities > Coverage and maturity**.

:::image type="content" source="media/coverage-maturity-page.png" alt-text="Screenshot that shows the Coverage and maturity page in Microsoft Defender." lightbox="media/coverage-maturity-page.png":::

<a name="maturity-level"></a>
## Understand your maturity level

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

<a name="top-setup-tasks"></a>
## Review top setup tasks to improve coverage

The **Top setup tasks** section shows up to five cards at the top of the page representing the most important things you can do to improve your coverage. Each card shows the task name, source type (such as Identity provider or SaaS), **impact** level, and **estimated effort**.

Tasks are ranked so that high-impact, low-effort items appear first:

1. On-premises sensor deployment, Microsoft Entra ID connector, and app governance
1. SaaS app connectors
1. Identity provider, PAM, and IGA integrations

Select a card to go directly to the setup page in the portal. After you complete a task, the card is removed and replaced with the next priority.

By default, only components detected in your environment are shown. To also see other supported integrations that aren't currently in use, change the filter on the **Review and improve coverage** side panel. For more information, see [Review and improve coverage](#review-and-improve-coverage).

<a name="coverage-sources"></a>
## Review identity coverage sources

The page shows one card for each identity source: **Identity providers**, **SaaS identities**, **On-premises identities**, and **PAM & IGA identities**. The cards you see depend on your environment and licensing.

:::image type="content" source="media/coverage-sources.png" alt-text="Screenshot that shows the coverage sources section of the Coverage and maturity page in Microsoft Defender.":::

Each card shows:

- **Identity count**: The number of protected identities. Select the count to view them in the identity inventory.
- **Coverage score**: The percentage of setup tasks completed for this source.
- **Active connections**: How many sources are connected out of the total detected (for example, "12 apps connected / 36 apps in use").
- **Actions required**: The number of unresolved gaps.
- **Review and improve coverage**: Select to see the specific gaps for this source.

If any servers or app connectors have health issues, the affected identity source card shows a notification that links to the **Health issues** page.

<a name="identity-providers-card"></a>
### Review the Identity providers card

The **Identity providers** card shows identities from Microsoft Entra ID and other connected identity providers. Connecting Microsoft Entra ID enables risk insights, sign-in event hunting, linking identities between environments, and security recommendations.

| Item | Description |
| --- | --- |
| Protected human identities | Human identities protected by connected identity providers. |
| Protected non-human identities | Non-human identities protected by connected identity providers. |
| Coverage score | Percentage of setup tasks completed for identity providers. |
| Actions required | Number of unresolved gaps. |

<a name="on-premises-identities-card"></a>
### Review the On-premises identities card

The **On-premises identities** card shows identities from on-premises Active Directory. Deploying sensors enables threat detections, security recommendations, automated attack disruption, and remediation actions for AD identities.

| Item | Description |
| --- | --- |
| Coverage score | Percentage of active sensors out of discovered sensors. |
| Active sensors | Sensors activated out of total servers. |
| Actions required | Number of unresolved gaps. |

> [!NOTE]
> The **Coverage and maturity** page lists all servers that don't have a Defender for Identity sensor. Sensor version 3 requires Defender for Endpoint. If a server has Defender for Endpoint, you can install sensor version 3 from the **Sensor activation** page (**Settings** > **Identities** > **Sensors**). If a server doesn't have Defender for Endpoint, it won't appear on the Sensor activation page. For those servers, deploy [sensor version 2](/defender-for-identity/deploy/install-sensor) instead.

<a name="saas-identities-card"></a>
### Review the SaaS identities card

The **SaaS identities** card shows identities from connected SaaS applications. Connecting SaaS apps enables user tracking, activity hunting, security recommendations, and OAuth app threat detection.

| Item | Description |
| --- | --- |
| Coverage score | Percentage of connected SaaS apps out of discovered apps. |
| Active connectors | Connected apps out of total supported apps. |
| Actions required | Number of unresolved gaps. |

<a name="pam--iga-identities-card"></a>
### Review the PAM & IGA identities card

The **PAM & IGA identities** card shows partner integrations for privileged access management (PAM) and identity governance and administration (IGA) solutions. Partner gaps count toward your maturity score. Resolving them increases the score.

| Item | Description |
| --- | --- |
| Coverage score | Percentage of connected PAM and IGA solutions out of discovered solutions. |
| Active connectors | Connected solutions out of total supported solutions. |
| Actions required | Number of unresolved gaps. |

## Review and improve coverage

To see the specific setup actions for a coverage source, select **Review and improve coverage** on its card. A side panel opens with the source name and the following information:

- A summary of the benefits of expanding coverage for that source.
- A connection count. For example, **2/2 connected** for identity providers, on-premises, and PAM & IGA sources, or **6/21 active connectors** for SaaS apps.
- A **Coverage progress** list of the setup actions available for that source.
- A configuration button at the bottom of the panel that opens the related settings page (for example, **Configure on-premises sensors** or **Configure cloud apps connectors**).

The following screenshot shows the Identity providers side panel as an example:

:::image type="content" source="media/identity-providers-side-panel.png" alt-text="Screenshot that shows the Identity providers side panel in Microsoft Defender." lightbox="media/identity-providers-side-panel.png":::

The **Coverage progress** list includes the following columns. Select the checkbox next to an action to mark it complete.

| Column | Description |
| --- | --- |
| **Action name** | The setup task, such as connecting a specific app, sensor, or partner solution. |
| **Impact** | The security impact of completing the action. |
| **Effort** | The estimated effort to complete the action. |

### SaaS identities panel

The SaaS identities panel includes additional options that aren't available for other coverage sources:

- An **Observed** column that indicates whether each application is detected in your environment.
- A **Show Only Observed Applications** toggle. By default, only observed applications are shown. Turn off the toggle to also see other supported SaaS apps that aren't currently observed.

:::image type="content" source="media/saas-identities-side-panel.png" alt-text="Screenshot that shows the SaaS identities side panel with the Observed column and Show Only Observed Applications toggle in Microsoft Defender." lightbox="media/saas-identities-side-panel.png":::

## Related content

- [Microsoft Defender for Identity deployment overview](/defender-for-identity/deploy/deploy-defender-identity)
- [Enable instant visibility, protection, and governance actions for your apps](/defender-cloud-apps/enable-instant-visibility-protection-and-governance-actions-for-your-apps)
- [Non-Microsoft identity and PAM integration](identity-security-overview.md)
