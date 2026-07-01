---
title: Migrate Microsoft Sentinel incident creation rules to alert grouping in Microsoft Defender
description: Learn how to migrate Microsoft Sentinel incident creation behavior to Microsoft Defender alert grouping rules during onboarding.
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - sentinel-only
ms.topic: how-to
ms.date: 06/11/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
---

# Migrate Microsoft Sentinel incident creation rules to alert grouping rules

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Use this guide when you onboard a Microsoft Sentinel workspace to the Defender portal and want to preserve Sentinel-like incident creation behavior for Defender alerts.

## What alert grouping rules do

Alert grouping rules in Microsoft Defender control how related alerts are grouped into incidents. They provide the Defender-side behavior controls that align with incident creation behavior used in Microsoft Sentinel Incident creation rules.

When you choose **Retain Sentinel incident creation behavior for XDR alerts** during onboarding, Defender applies equivalent grouping behavior as part of onboarding.

## Prerequisites

- A Microsoft Sentinel workspace with incident creation settings rules configured.
- Permission to onboard the workspace in the Defender portal.
- Permission to view and manage detection rules in Microsoft Defender.

## Migrate incident creation behavior during onboarding

To migrate incident creation behavior when you onboard a Microsoft Sentinel workspace to the Defender portal, follow the directions in [Connect Microsoft Sentinel to the Microsoft Defender portal](microsoft-sentinel-onboard.md#onboard-microsoft-sentinel). During the onboarding flow, make sure you do the following:

1. Set the workspace you want to use as the primary workspace.
1. In the onboarding dialog, select **Retain Sentinel incident creation behavior for XDR alerts**.

This option applies migration behavior during onboarding. Later changes to Sentinel rule grouping aren't continuously synced to Defender.

## Validate migrated alert grouping rules

After onboarding finishes:

1. Go to **Settings** > **Microsoft Defender XDR** > **Alert grouping**.
1. Verify that expected rules are present and enabled.
1. Open a migrated rule and confirm key behavior settings match your expected incident grouping outcomes.

:::image type="content" source="./media/migrate-sentinel-incident-creation-rules-alert-grouping/alert-grouping-rules-list.png" alt-text="Screenshot of the alert grouping rules page showing migrated rules in Microsoft Defender." lightbox="./media/migrate-sentinel-incident-creation-rules-alert-grouping/alert-grouping-rules-list.png":::

## Validate incident and automation outcomes

1. Trigger representative detections.
1. Verify incident grouping still matches expected automation patterns.
1. Validate playbooks, routing, and ticketing integrations that depend on incident behavior.
1. Confirm incident title behavior matches your operational expectations. Incident titles might differ from Sentinel depending on correlation context.
1. If manual incident merges are used in your process, validate those workflows. Manual merges can combine incidents that were originally kept separate.

To review correlation behavior and incident merges during investigation, see [Alert correlation and incident merging in the Microsoft Defender portal](/defender-xdr/alerts-incidents-correlation).

The associated incidents view improves analyst context, but it doesn't change grouping rules by itself.

:::image type="content" source="./media/migrate-sentinel-incident-creation-rules-alert-grouping/associated-incidents-filter.png" alt-text="Screenshot of the incident graph filter showing associated incidents options." lightbox="./media/migrate-sentinel-incident-creation-rules-alert-grouping/associated-incidents-filter.png":::

## Related content

- [Manage analytics rule correlation settings in Microsoft Defender XDR](/defender-xdr/exclude-analytics-rules-correlation)
- [Use functions, saved queries, and custom rules](/defender-xdr/advanced-hunting-defender-use-custom-rules#analytics-rules)
- [Microsoft Defender XDR incidents and Microsoft incident creation rules](/azure/sentinel/microsoft-365-defender-sentinel-integration#microsoft-incident-creation-rules)
- [Automatically create incidents from Microsoft security alerts](/azure/sentinel/create-incidents-from-alerts)

[!INCLUDE [Microsoft Defender tech community](../includes/defender-m3d-techcommunity.md)]
