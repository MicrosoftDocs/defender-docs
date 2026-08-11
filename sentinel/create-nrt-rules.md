---
title: Work with near-real-time (NRT) detection analytics rules in Microsoft Sentinel
description: View and create near-real-time (NRT) analytics rules in Microsoft Sentinel for up-to-the-minute threat detection, including key limitations and usage considerations.
ms.author: guywild
author: guywi-ms
ms.reviewer: noak
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016

#Customer intent: As a security engineer, I want to configure near-real-time detection analytics rules so that analysts can achieve up-to-the-minute threat detection and automate responses in my security operations.

---
# Work with near-real-time (NRT) detection analytics rules in Microsoft Sentinel

>[!IMPORTANT]
> [**Custom detections**](/defender-xdr/custom-detections-overview?toc=/azure/sentinel/TOC.json&bc=/azure/sentinel/breadcrumb/toc.json) is now the best way to create new rules across Microsoft Sentinel SIEM Microsoft Defender XDR. With custom detections, you can reduce ingestion costs, get unlimited real-time detections, and benefit from seamless integration with Defender XDR data, functions, and remediation actions with automatic entity mapping. For more information, read [Custom detections are now the unified experience for creating detections in Microsoft Defender XDR](https://techcommunity.microsoft.com/blog/microsoftthreatprotectionblog/custom-detections-are-now-the-unified-experience-for-creating-detections-in-micr/4463875).


Microsoft Sentinel’s [near-real-time analytics rules](near-real-time-rules.md) provide up-to-the-minute threat detection out-of-the-box. Near-real-time analytics rules are designed to be highly responsive by running their queries at intervals just one minute apart.

For the time being, NRT rule templates have limited application, as outlined in [Considerations for NRT rules](near-real-time-rules.md#considerations), but the technology is rapidly evolving and growing.

[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

## View near-real-time (NRT) rules

To view your existing NRT rules, filter the analytics rules list by rule type:

# [Defender portal](#tab/defender-portal)

To view NRT rules in the Defender portal:

1. From the Microsoft Defender navigation menu, expand **Microsoft Sentinel**, then **Configuration**. Select **Analytics**.

1. On the **Analytics** screen, with the **Active rules** tab selected, filter the list for **NRT** templates:

    1. Select **Add filter** and choose **Rule type** from the list of filters.

    1. From the resulting list, select **NRT**. Then select **Apply**.

# [Azure portal](#tab/azure-portal)

To view NRT rules in the Azure portal:

1. From the **Configuration** section of the Microsoft Sentinel navigation menu, select **Analytics**.

1. On the **Analytics** screen, with the **Active rules** tab selected, filter the list for **NRT** templates:

    1. Select **Add filter** and choose **Rule type** from the list of filters.

    1. From the resulting list, select **NRT**. Then select **Apply**.

---

## Create NRT rules

Create NRT rules by following the same procedure used for regular [scheduled-query analytics rules](detect-threats-custom.md):

# [Defender portal](#tab/defender-portal)

To create an NRT rule in the Defender portal:

1. From the Microsoft Defender navigation menu, expand **Microsoft Sentinel**, then **Configuration**. Select **Analytics**.

1. In the action bar at the top of the grid, select **+Create** and select **NRT query rule**. This opens the **Analytics rule wizard**.

    :::image type="content" source="media/create-nrt-rules/defender-create-nrt-rule.png" alt-text="Screenshot shows how to create a new NRT rule." lightbox="media/create-nrt-rules/create-nrt-rule.png":::

# [Azure portal](#tab/azure-portal)

To create an NRT rule in the Azure portal:

1. From the **Configuration** section of the Microsoft Sentinel navigation menu, select **Analytics**.

1. In the action bar at the top, select **+Create** and select **NRT query rule**. This opens the **Analytics rule wizard**.

    :::image type="content" source="media/create-nrt-rules/create-nrt-rule.png" alt-text="Screenshot shows how to create a new NRT rule." lightbox="media/create-nrt-rules/create-nrt-rule.png":::

---

1. Follow the steps in [Create a scheduled query analytics rule](detect-threats-custom.md) to complete the **Analytics rule wizard**.

    The configuration of NRT rules is in most ways the same as that of scheduled analytics rules. 

    - You can refer to multiple tables and [**watchlists**](watchlists.md) in your query logic.

    - You can use all of the alert enrichment methods: [**entity mapping**](map-data-fields-to-entities.md), [**custom details**](surface-custom-details-in-alerts.md), and [**alert details**](customize-alert-details.md).

    - You can choose how to group alerts into incidents, and to suppress a query when a particular result has been generated.

    - You can automate responses to both alerts and incidents.

    - You can run the rule query across multiple workspaces.

    Because of the [**nature and limitations of NRT rules**](near-real-time-rules.md#considerations), however, the following features of scheduled analytics rules will *not be available* in the wizard:

    - **Query scheduling** is not configurable, since queries are automatically scheduled to run once per minute with a one-minute lookback period. 
    - **Alert threshold** is irrelevant, since an alert is always generated.
    - **Event grouping** configuration is now available to a limited degree. You can choose to have an NRT rule generate an alert for each event for up to 30 events. If you choose this option and the rule results in more than 30 events, single-event alerts will be generated for the first 29 events, and a 30th alert will summarize all the events in the result set.

    In addition, due to the size limits of the alerts, your query should make use of `project` statements to include only the necessary fields from your table. Otherwise, the information you want to surface could end up being truncated.

<a name="next-steps"></a>
## Related content

For more information about NRT rules, see the following articles:

- [Near-real-time (NRT) analytics rules in Microsoft Sentinel](near-real-time-rules.md)
- [Other analytics rule types](threat-detection.md)
