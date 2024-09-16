---
title: Exclude machines from agentless scanning Microsoft Defender for Cloud
description: Learn how to exclude machines from agentless scanning in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/12/2024
---

# Exclude machines from agentless scanning

[Agentless machine scanning](concept-agentless-data-collection.md) in Microsoft Defender for Cloud improves the security posture on machines connected to Defender for Cloud. Agentless scanning doesn't need any installed agents or network connectivity, and doesn't effect machine performance.

By default agentless scanning is turned on in a subscription for all supported machines when Defender for Servers Plan 2, or the Defender Cloud Security Posture Management (CSPM) plan is turned on.


In some circumstances, you might want to exclude machines from agentless scanning recommendations. You can do this using pre-existing environment tags. Exclude machines are then skipped during Defender for Cloud continuous machine discovery.

## Prerequisites

- Defender for Servers Plan 2, or the Defender CSPM plan is turned on.
- Agentless scanning is enabled in the plan.

## Exclude machines

1. In Defender for Cloud, select **Environment settings**.
1. Select the relevant subscription or multicloud connector.
1. For either the Defender Cloud Security Posture Management (CSPM) or Defender for Servers P2 plan, select **Settings**.
1. In **Agentless scanning for machines**, select **Edit configuration**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scanning-edit-configuration.png" alt-text="Screenshot of the link to edit the agentless scanning configuration." lightbox="media/enable-vulnerability-assessment-agentless/agentless-scanning-edit-configuration.png":::

1. In **Agentless scanning configuration**, Enter the tag name and value for machines that you want to exclude. You can enter `multiple tag:value` pairs.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scanning-exclude-tags.png" alt-text="Screenshot of the tag and value fields for excluding machines from agentless scanning.":::

1. Select **Save**.

