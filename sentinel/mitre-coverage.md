---
title: View MITRE ATT&CK coverage in Microsoft Sentinel
description: View your organization's MITRE ATT&CK coverage in Microsoft Sentinel. Identify active detections and available rules to strengthen security.
author: mberdugo 
ms.topic: how-to
ms.date: 06/16/2025
ms.author: monaberdugo 
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.custom: sfi-image-nochange, msecd-doc-authoring-1012

#Customer intent: As a security analyst, I want to use the MITRE ATT&CK framework in Microsoft Sentinel so that I can assess and enhance my organization's threat detection and response capabilities.

---

# View MITRE ATT&CK framework coverage in Microsoft Sentinel

[MITRE ATT&CK](https://attack.mitre.org/#) is a publicly accessible knowledge base of tactics and techniques commonly used by attackers. It's created and maintained based on real-world observations. Many organizations use the MITRE ATT&CK knowledge base to develop specific threat models and methodologies to verify security status in their environments.

Microsoft Sentinel analyzes ingested data, not only to [detect threats](detect-threats-built-in.md) and help you [investigate](investigate-cases.md), but also to visualize the nature and coverage of your organization's security status.

This article describes how to use the **MITRE** page in Microsoft Sentinel to view the analytics rules (detections) already active in your workspace and the detections available for you to configure. Use this page to understand your organization's security coverage based on the tactics and techniques from the MITRE ATT&CK framework.

> [!IMPORTANT]
> The MITRE page in Microsoft Sentinel is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

## Prerequisites

Before you view the MITRE coverage for your organization in Microsoft Sentinel, ensure you have the following prerequisites:

- An active Microsoft Sentinel instance.
- Necessary permissions to view content in Microsoft Sentinel. For more information, see [Roles and permissions in Microsoft Sentinel](roles.md).
- Data connectors configured to ingest relevant security data into Microsoft Sentinel. For more information, see [Microsoft Sentinel data connectors](connect-data-sources.md).
- Active scheduled query rules and near real-time (NRT) rules set up in Microsoft Sentinel. For more information, see [Threat detection in Microsoft Sentinel](threat-detection.md).
- Familiarity with the MITRE ATT&CK framework and its tactics and techniques.

## MITRE ATT&CK framework version

Microsoft Sentinel is currently aligned to The MITRE ATT&CK framework, version 18.

##  View current MITRE coverage

By default, both currently active scheduled query and near real-time (NRT) rules are indicated in the coverage matrix.

To view the current MITRE coverage for your organization:

1. Do one of the following, depending on the portal you're using:

    ### [Defender portal](#tab/defender-portal)

    In the Defender portal, select **Microsoft Sentinel > Threat management > MITRE ATT&CK**.

    :::image type="content" source="media/mitre-coverage/mitre-coverage-defender.png" alt-text="Screenshot of the MITRE ATT&CK page in the Defender portal." lightbox="media/mitre-coverage/mitre-coverage-defender.png":::

    To filter the page by a specific threat scenario, toggle the **View MITRE by threat scenario** option on, and then select a threat scenario from the drop-down menu. The page is updated accordingly. For example:

    :::image type="content" source="media/mitre-coverage/mitre-by-threat-scenario.png" alt-text="Screenshot of the MITRE ATT&CK page filtered by a specific threat scenario.":::

    ### [Azure portal](#tab/azure-portal)

    In the Azure portal, under **Threat management**, select **MITRE ATT&CK (Preview)**.

    :::image type="content" source="media/mitre-coverage/mitre-coverage.png" alt-text="Screenshot of the MITRE ATT&CK coverage matrix in the Azure portal showing technique coverage levels." lightbox="media/mitre-coverage/mitre-coverage.png":::

    ---

1. Use any of the following methods:

    - **Use the legend** to understand how many detections are currently active in your workspace for a specific technique.

    - **Use the search bar** to search for a specific technique in the matrix, using the technique name or ID, to view your organization's security status for the selected technique.

    - **Select a specific technique** in the matrix to view more details in the details pane. There, use the links to jump to any of the following locations:

        - In the **Description** area, select **View full technique details ...** for more information about the selected technique in the MITRE ATT&CK framework knowledge base.

        - Scroll down in the pane and select links to any of the active items to jump to the relevant area in Microsoft Sentinel.

        For example, select **Hunting queries** to jump to the **Hunting** page. There, you see a filtered list of the hunting queries that are associated with the selected technique, and available for you to configure in your workspace.

    On the Defender portal, the details pane also shows recommended coverage details, including the ratio of active detections and security services (products) out of all recommended detections and services for the selected technique.

## Simulate possible coverage with available detections

In the MITRE coverage matrix, *simulated* coverage refers to detections that are available but not currently configured in your Microsoft Sentinel workspace. View your simulated coverage to understand your organization's possible security status if you configured all available detections.

1. In Microsoft Sentinel, under **Threat management**, select **MITRE ATT&CK (Preview)**, and then select items in the **Simulated rules** menu to simulate your organization's possible security status.

1. Use the coverage matrix elements as you would otherwise to view the simulated coverage for a specific technique.

## Use the MITRE ATT&CK framework in analytics rules and incidents

Scheduled rules with MITRE techniques applied that run regularly in your Microsoft Sentinel workspace improve your organization's security status in the MITRE coverage matrix.

- **Analytics rules**:

    - When configuring analytics rules, select specific MITRE techniques to apply to your rule.
    - When searching for analytics rules, filter the rules displayed by technique to find your rules quicker.

    For more information, see [Detect threats out-of-the-box](detect-threats-built-in.md) and [Create custom analytics rules to detect threats](detect-threats-custom.md).

- **Incidents**:

    When incidents are created for alerts that are surfaced by rules with MITRE techniques configured, the techniques are also added to the incidents.

    For more information, see [Investigate incidents with Microsoft Sentinel](investigate-cases.md). If Microsoft Sentinel is onboarded to the Defender portal, then [investigate incidents in the Microsoft Defender portal](/defender-xdr/investigate-incidents) instead.

- **Threat hunting**:

    - When you're creating a new hunting query, select the specific tactics and techniques to apply to your query.
    - When searching for active hunting queries, filter the queries displayed by tactics by selecting an item from the list above the grid. Select a query to see tactic and technique details in the details pane on the side.
    - When you're creating bookmarks, either use the technique mapping inherited from the hunting query, or create your own mapping.

    For more information, see [Hunt for threats with Microsoft Sentinel](hunting.md) and [Keep track of data during hunting with Microsoft Sentinel](bookmarks.md).

## Related content

For more information, see:

- [MITRE | ATT&CK framework](https://attack.mitre.org/)
- [MITRE ATT&CK for Industrial Control Systems](https://www.mitre.org/news-insights/news-release/mitre-releases-framework-cyber-attacks-industrial-control-systems)
