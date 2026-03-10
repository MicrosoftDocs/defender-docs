---
title: Investigate non-human identities
description: Learn how to investigate non-human identities in Microsoft Defender, including OAuth apps and service accounts, and review risk scores, identity graphs, permissions, and data usage.
#customer intent: As a security analyst using Microsoft Defender, I want to understand how to investigate non-human identities so that I can assess risk, understand permissions, and identify potential security issues with OAuth apps and service accounts.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 03/10/2026
ms.topic: article
ms.service: microsoft-defender-for-identity
ai-usage: ai-assisted
---

# Investigate non-human identities in Microsoft Defender (Preview)

When you select a non-human identity from the [Identity inventory](identity-inventory.md), a details pane opens that helps you understand the identity's context, risk level, relationships, and activity.

The non-human identity details pane has these tabs:

- [Summary](#summary)
- [Risk score](#risk-score)
- [Graph](#graph)
- [Permissions](#permissions)
- [Data usage](#data-usage)
- [Users](#users)
- [Sensitivity labels](#sensitivity-labels)

:::image type="content" source="media/investigate-non-human-identities/non-human-identities.png" alt-text="Screenshot of the non-human identity details pane in the Microsoft Defender portal.":::

## Summary

The **Summary** tab provides a high-level overview of the selected non-human identity. Use this tab to quickly check the identity's basic profile.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-summary.png" alt-text="Screenshot of the Summary tab for a non-human identity in the Microsoft Defender portal.":::

## Risk score

The **Risk score** tab displays a 1-100 risk score for the identity, where higher values indicate greater risk. The risk score helps you quickly prioritize which non-human identities need attention first, without manually sifting through long lists.

The tab shows the risk summary, which includes the factors behind the identity's risk score, helping you understand why it's flagged as risky and make informed decisions about next steps.

> [!NOTE]
> The risk score currently applies only to OAuth apps registered in Microsoft Entra ID.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-risk-score.png" alt-text="Screenshot of the Risk score tab for a non-human identity in the Microsoft Defender portal.":::

## Graph

The **Graph** tab displays a visual identity graph that shows how the selected non-human identity connects to other entities in your organization, like users, resources, SaaS workloads, and critical assets.

Use the identity graph to:

- Understand what the non-human identity can access and how it's connected.
- Identify risky or unexpected relationships, like high-privilege access paths or sensitive resource exposure.
- Make faster, more confident decisions about review, remediation, or deeper investigation.

Select any node or edge in the graph to open a details panel with deeper context and attributes for that entity or relationship. When applicable, the details panel also shows attack paths involving the selected nodes or edges.

To explore further, select **View in map** below the graph to open the full Attack Map experience in a new window.

> [!NOTE]
> The identity graph is currently only available for OAuth apps registered in Microsoft Entra ID.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-graph.png" alt-text="Screenshot of the Graph tab for a non-human identity in the Microsoft Defender portal.":::

## Permissions

The **Permissions** tab shows the permissions granted to the non-human identity, including the permission type (application-only, delegated, or mixed) and consent type (admin or user consent).

Use this tab to review the level of access the identity has and to identify overprivileged or unnecessarily broad permissions.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-permissions.png" alt-text="Screenshot of the Permissions tab for a non-human identity in the Microsoft Defender portal.":::

## Data usage

The **Data usage** tab shows the identity's activity patterns, including recent sign-in activity and resource access.

Use this tab to learn how the identity is used and to identify unusual or unexpected activity.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-data-usage.png" alt-text="Screenshot of the Data usage tab for a non-human identity in the Microsoft Defender portal.":::

## Users

The **Users** tab shows the users associated with the non-human identity, like users who consented to the app or are assigned to it. Use this tab to learn which users interact with the identity and assess the scope of its access.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-users.png" alt-text="Screenshot of the Users tab for a non-human identity in the Microsoft Defender portal.":::

## Sensitivity labels

The **Sensitivity labels** tab shows the Microsoft Purview sensitivity labels applied to data that the non-human identity can access. Use this tab to learn whether the identity has access to sensitive or classified information.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-sensitivity-labels.png" alt-text="Screenshot of the Sensitivity labels tab for a non-human identity in the Microsoft Defender portal.":::


## Next steps

- [Identity inventory](identity-inventory.md)
- [Investigate users in Microsoft Defender XDR](/defender-xdr/investigate-users)
- [Investigate assets in Microsoft Defender for Identity](investigate-assets.md)
