---
title: Link query results to an incident
description: Link query results to an incident
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - m365initiative-m365-defender
  - tier1
ms.custom:
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: how-to
ms.date: 06/08/2026
ai-usage: ai-assisted
---

# Link query results to an incident

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Use the link to incident feature to add advanced hunting query results to a new or existing incident under investigation. This feature helps you capture records from advanced hunting activities, including behavior-based results, so you can create richer incident context.

## Required permissions for linking incidents

To link query results to an incident, you need the same permissions required for managing custom detections. For more information, see [Create custom detection rules](custom-detection-rules.md#required-permissions-for-managing-custom-detections).

To link results from the `BehaviorInfo` table (preview), you also need access to the [BehaviorInfo](advanced-hunting-behaviorinfo-table.md) and [BehaviorEntities](advanced-hunting-behaviorentities-table.md) tables, and the relevant behaviors data sources must be onboarded. For onboarding guidance, see [Deploy supported services](deploy-supported-services.md) and [Enable the UEBA behaviors layer](/azure/sentinel/entity-behaviors-layer#enable-the-ueba-behaviors-layer).

## Link results to new or existing incidents

1. In the advanced hunting query page, first enter your query in the query field provided then select **Run query** to get your results.

    :::image type="content" source="media/advanced-hunting-link-to-incident/link-to-incident-1.png" alt-text="Screenshot of the advanced hunting page in the Microsoft Defender portal." lightbox="media/advanced-hunting-link-to-incident/link-to-incident-1.png":::

2. In the Results page, select the events or records that are related to a new or current investigation you're working on, then select **Link to incident**.

    :::image type="content" source="media/advanced-hunting-link-to-incident/link-to-incident-1b.png" alt-text="Screenshot of the link to incident feature in advanced hunting in the Microsoft Defender portal." lightbox="media/advanced-hunting-link-to-incident/link-to-incident-1b.png":::

3. Find the **Alert details** section in the Link to incident pane, then select **Create new incident** to convert the events to alerts and group them to a new incident:

    Or select **Link to an existing incident** to add the selected records to an existing one. Choose the related incident from the dropdown list of existing incidents. You can also enter the first few characters of the incident name or ID to find the existing incident.

   :::image type="content" source="media/advanced-hunting-results-link4.png" alt-text="Screenshot of the options available in saved queries in the Microsoft Defender portal." lightbox="media/advanced-hunting-results-link4.png":::

4. For either selection, provide the following details, then select **Next**:
      - **Alert title** - Provide a descriptive title for the results that your incident responders can understand. This descriptive title becomes the alert title.
      - **Severity** - Choose the severity applicable to the group of alerts.
      - **Category** - Choose the appropriate threat category for the alerts.
      - **Description** - Give a helpful description for the grouped alerts.
      - **Recommended actions** - Provide remediation actions.

5. In the **Entities** section, you can find which entities are used to correlate other alerts to the linked incident. They also appear in the incident page. You can review the preselected entities categorized as follows:

    a. **Impacted assets** – Assets impacted by the selected events, can be:
    - Account
    - Device
    - Mailbox
    - Cloud application
    - Azure resource
    - Amazon Web Services resource
    - Google Cloud Platform resource

    b. **Related evidence** – Non-assets that appear in the selected events. The supported entity types are:
    - Process
    - File
    - Registry value
    - IP
    - OAuth application
    - DNS
    - Security group
    - URL
    - Mail cluster
    - Mail message

6. After an entity type is selected, select an identifier type that exists in the selected records so that it can be used to identify this entity. Each entity type has a list of supported identifiers, as can be seen in the relevant drop-down. Read the description displayed when hovering on each identifier to better understand it.
7. After selecting the identifier, select a column from the query results that contain the selected identifier. You can select **Explore query and results** to open the advanced hunting context panel. This allows you to explore your query and results to make sure you chose the right column for the selected identifier.

    :::image type="content" source="media/advanced-hunting-defender-results-identifier.png" alt-text="Screenshot of the link to incident wizard entities branch in the Microsoft Defender portal." lightbox="media/advanced-hunting-defender-results-identifier.png":::

    In our example, we used a query to find events related to a possible email exfiltration incident, therefore the recipient's mailbox and recipient's account are the impacted entities, and the sender's IP as well as email message are related evidence.

    :::image type="content" source="media/advanced-hunting-defender-results-link-entities.png" alt-text="Screenshot of the link to incident wizard full entities branch in the Microsoft Defender portal." lightbox="media/advanced-hunting-defender-results-link-entities.png":::

    A different alert is created for each record with a unique combination of impacted entities. In our example, if there are three different recipient mailboxes and recipient object ID combinations, for instance, then three alerts are created and linked to the chosen incident.

8. Select **Next**.
9. Review the details you provided in the Summary section.
10. Select **Done**.

## Link a behavior result to an incident (Preview)

When you query the `BehaviorInfo` table, you can link a single behavior record to a new or existing incident.

Before you start, make sure that behavior-based data sources are onboarded and that you have access to the `BehaviorInfo` and `BehaviorEntities` tables. You also need the permissions required to manage custom detections. For more information, see [Required permissions for linking incidents](#required-permissions-for-linking-incidents).

This preview follows [existing RBAC](manage-rbac.md) and [incident scoping policies](./scoping.md). If **Link to incident** isn't available, or if the wizard doesn't populate entities as expected, verify your table access, data source onboarding, and incident scope.

In this workflow, you select one `BehaviorId` at a time. The wizard creates one alert per selected behavior, and alert metadata and entities are automatically enriched from the selected behavior record. You can review and edit the auto-populated fields, and severity and recommended actions remain under your control.

1. In the advanced hunting query page, run a query on the `BehaviorInfo` table to retrieve behavior records.

    Example query:

    ```kusto
    BehaviorInfo
    | where ServiceSource == "Microsoft Sentinel"
    | take 10
    ```

    :::image type="content" source="media/advanced-hunting-link-to-incident/behavior-query-results.png" alt-text="Screenshot of a BehaviorInfo query in advanced hunting." lightbox="media/advanced-hunting-link-to-incident/behavior-query-results.png":::

2. In the Results page, select a single behavior record (`BehaviorId`) related to the investigation, and then select **Link to incident**.

    :::image type="content" source="media/advanced-hunting-link-to-incident/behavior-select-record-link.png" alt-text="Screenshot of selecting a behavior record and choosing Link to incident." lightbox="media/advanced-hunting-link-to-incident/behavior-select-record-link.png":::

3. In the **Alert details** section, select **Create new incident** to create a single alert from the selected behavior and link it to a new incident. Or select **Correlate alerts with an existing incident** to add the selected record to an existing incident. If you choose an existing incident, select the incident from the list, or enter the first few characters of the incident name or ID to find it.

    :::image type="content" source="media/advanced-hunting-link-to-incident/behavior-alert-details-pane.png" alt-text="Screenshot of alert details options in the Link to incident pane." lightbox="media/advanced-hunting-link-to-incident/behavior-alert-details-pane.png":::

4. Review the alert details, and then select **Next**. The following fields are automatically populated from the selected behavior record and remain editable:

    - **Alert title**
    - **Category**
    - **Description**
    - **MITRE ATT&CK framework**

    You can also provide values for the following fields:

    - **Severity**
    - **Recommended actions**

5. In the **Entities** section, the involved entities are automatically populated from the selected behavior record. The wizard uses data from the `BehaviorEntities` table to prepopulate the related entities, and you can review and edit them before you continue.

    As with other link to incident workflows, you can review the entities under **Impacted assets** and **Related evidence**, and edit them if needed. The wizard currently supports UEBA entities. For non-UEBA behaviors or behaviors with unsupported entities, you might need to map some entities manually.

    :::image type="content" source="media/advanced-hunting-link-to-incident/behavior-entities.png" alt-text="Screenshot of populated entities for a selected behavior record." lightbox="media/advanced-hunting-link-to-incident/behavior-entities.png":::

6. If you select **Explore query and results**, the advanced hunting context panel opens with a query filtered to the selected `BehaviorId`. If your original query doesn't already include `BehaviorEntities`, the panel uses a joined query to show the related entities from that table so you can verify that the selected entity values and mappings are correct.

    :::image type="content" source="media/advanced-hunting-link-to-incident/behavior-explore-query-filtered.png" alt-text="Screenshot of Explore query and results filtered by BehaviorId." lightbox="media/advanced-hunting-link-to-incident/behavior-explore-query-filtered.png":::

7. Select **Next**, review the Summary step, and then select **Done**.

    :::image type="content" source="media/advanced-hunting-link-to-incident/behavior-summary-step.png" alt-text="Screenshot of the summary step for linking a behavior result to an incident." lightbox="media/advanced-hunting-link-to-incident/behavior-summary-step.png":::

## View linked records in the incident

To view the incident the events are linked to, select the generated link from the summary step of the wizard, or select the incident name from the incident queue.

:::image type="content" source="media/advanced-hunting-results-link7.png" alt-text="Screenshot of the summary step in the link to incident wizard in the Microsoft Defender portal." lightbox="media/advanced-hunting-results-link7.png":::

In our example, the alert created from the selected event was linked successfully to a new incident.
In the alert page, you can find the complete information on the event in timeline view (if available) and the query results view.

You can also select the event from the timeline view or from the query results view to open the **Inspect record** pane.

:::image type="content" source="media/advanced-hunting-results-link8.png" alt-text="Screenshot of the incident page in the Microsoft Defender portal." lightbox="media/advanced-hunting-results-link8.png":::

## Filter for events added using advanced hunting

You can view which alerts were generated from advanced hunting by filtering incidents and alerts by **Manual** detection source.

:::image type="content" source="media/advanced-hunting-results-link9.png" alt-text="Screenshot of the filter dropdown in advanced hunting in the Microsoft Defender portal." lightbox="media/advanced-hunting-results-link9.png":::
