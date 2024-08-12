---
title: Exclude machines from agentless scanning Microsoft Defender for Cloud
description: Learn how to exclude machines from agentless scanning in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 01/16/2024
---

# Exclude machines from agentless scanning

[Agentless machine scanning](concept-agentless-data-collection.md) in Microsoft Defender for Cloud improves the security posture on machines connected to Defender for Cloud. Agentless scanning doesn't need any installed agents or network connectivity, and doesn't effect machine performance.

By default agentless scanning is turned on for all supported in the subscription that has Defender for Cloud turned on. In some circumstances, you might want to exclude machines from agentless scanning. You can do this using pre-existing environment tags. 

Then, during Defender for Cloud continuous machine discovery, excluded machines are skipped.

## Exclude machines

1. In Defender for Cloud, select **Environment settings**.
1. Select the relevant subscription or multicloud connector.
1. For either the Defender Cloud Security Posture Management (CSPM) or Defender for Servers P2 plan, select **Settings**.
1. In **Agnelss scanning for machines**, select **Edit configuration**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scanning-edit-configuration.png" alt-text="Screenshot of the link to edit the agentless scanning configuration." lightbox="media/enable-vulnerability-assessment-agentless/agentless-scanning-edit-configuration.png":::

1. In **Agentless scanning configuration**, Enter the tag name and value for machines that you want to exclude. You can enter `multiple tag:value` pairs.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scanning-exclude-tags.png" alt-text="Screenshot of the tag and value fields for excluding machines from agentless scanning.":::

1. Select **Save**.

## Related content

Learn more [agentless scanning](concept-agentless-data-collection.md).
