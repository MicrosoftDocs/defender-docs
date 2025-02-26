---
title: Exclude machines from agentless scanning Microsoft Defender for Cloud
description: Learn how to exclude machines from agentless scanning in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 02/19/2025
---

# Exclude machines from agentless scanning

[Agentless machine scanning](concept-agentless-data-collection.md) in Microsoft Defender for Cloud improves the security posture of machines connected to Defender for Cloud. Agentless scanning doesn't need any installed agents or network connectivity, and doesn't affect machine performance.

By default agentless scanning is turned on for all supported machines when Defender for Servers Plan 2, or the Defender Cloud Security Posture Management (CSPM) plan is enabled.

In some circumstances, you might want to exclude machines from agentless scanning recommendations. You can do this using preexisting environment tags. Excluded machines are skipped during continuous machine discovery.

## Prerequisites

- Defender for Servers Plan 2, or Defender CSPM.
- Agentless scanning enabled in the plan.

## Exclude machines

1. In Defender for Cloud, select **Environment settings**.
1. Select the relevant subscription or multicloud connector.
1. For either the Defender Cloud Security Posture Management (CSPM) or Defender for Servers P2 plan, select **Settings**.
1. In **Agentless scanning for machines**, select **Edit configuration**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scanning-edit-configuration.png" alt-text="Screenshot of the link to edit the agentless scanning configuration." lightbox="media/enable-vulnerability-assessment-agentless/agentless-scanning-edit-configuration.png":::

1. In **Agentless scanning configuration**, Enter the tag name and value for machines that you want to exclude. You can enter `multiple tag:value` pairs.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scanning-exclude-tags.png" alt-text="Screenshot of the tag and value fields for excluding machines from agentless scanning.":::

1. Select **Save**.
