---
title: Work with results containing Microsoft Sentinel data
description: Work with advanced hunting in the portal unifying Defender XDR and Sentinel data
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - m365initiative-m365-defender
  - tier1
  - usx-security
ms.topic: conceptual
ms.custom:
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.date: 11/19/2024
---

# Work with advanced hunting results containing Microsoft Sentinel data

## Explore results


:::image type="content" source="/defender/media/advanced-hunting-unified-results.png" alt-text="Screenshot of advanced hunting results with options to expand result rows in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-unified-results.png":::

You can also explore the results in-line with the following features:

- Expand a result by selecting the dropdown arrow at the left of each result.
- Where applicable, expand details for results that are in JSON or array format by selecting the dropdown arrow at the left of applicable result row for added readability.
- Open the side pane to see a record's details (concurrent with expanded rows).

You can also right-click on any result value in a row so that you can use it to:

- Add more filters to the existing query
- Copy the value for use in further investigation
- Update the query to extend a JSON field to a new column

For Microsoft Defender XDR data, you can take further action by selecting the checkboxes to the left of each result row. Select **Link to incident** to link the selected results to an incident (read [Link query results to an incident](advanced-hunting-link-to-incident.md)) or **Take actions** to open the Take actions wizard (read [Take action on advanced hunting query results](advanced-hunting-take-action.md)).

## Link query results to an incident

You can use the link to incident feature to add advanced hunting query results to a new or existing incident under investigation. This feature helps you to easily capture records from advanced hunting activities, which allows you to create a richer timeline or context of events regarding an incident.

### Link results to new or existing incidents

1.	In the advanced hunting query pane, enter your query in the query field provided, then select **Run query** to get your results.
   :::image type="content" source="/defender/media/advanced-hunting-results-link1.png" alt-text="Screenshot of the advanced hunting page in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-results-link1.png":::

2.	In the Results page, select the events or records that are related to a new or current investigation you're working on, then select **Link to incident**.
   :::image type="content" source="/defender/media/advanced-hunting-results-link2.png" alt-text="Screenshot of the link to incident feature in advanced hunting in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-results-link2.png":::

3.	In the **Alert details** section in the Link to incident pane, select **Create new incident** to convert the events to alerts and group them to a new incident:

    You can also select **Link to an existing incident** to add the selected records to an existing incident. Choose the related incident from the dropdown list of existing incidents. You can also enter the first few characters of the incident name or ID to find the incident you want.<br>
   :::image type="content" source="/defender/media/advanced-hunting-results-link4.png" alt-text="Screenshot of the options available in saved queries in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-results-link4.png":::
4.	For either selection, provide the following details, then select **Next**:
    - **Alert title** – A descriptive title for the results that your incident responders can understand; this descriptive title becomes the alert title
    - **Severity** – Choose the severity applicable to the group of alerts
    - **Category** – Choose the appropriate threat category for the alerts
    - **Description** – Give a helpful description of the grouped alerts
    - **Recommended actions** – List the recommended remediation actions for the security analysts who are investigating the incident
5.	In the **Entities** section, select the entities that are involved in the suspicious events. Those entities are used to correlate other alerts to the linked incident and are visible from the incident page. 

      For Microsoft Defender XDR data, the entities are automatically selected. If the data is from Microsoft Sentinel, you need to select the entities manually.

      There are two sections for which you can select entities:

    a. **Impacted assets** – Impacted assets that appear in the selected events should be added here. The following types of assets can be added: 
    - Account
    - Device
    - Mailbox
    - Cloud application
    - Azure resource
    - Amazon Web Services resource
    - Google Cloud Platform resource

    b. **Related evidence** – Non-assets that appear in the selected events can be added in this section. The supported entity types are:
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
 
> [!NOTE]
> For queries containing only XDR data, only entity types that are available in XDR tables are shown.

6. After an entity type is selected, select an identifier type that exists in the selected records so that it can be used to identify this entity. Each entity type has a list of supported identifiers, as can be seen in the relevant drop down. Read the description displayed when hovering on each identifier to better understand it.
7. After selecting the identifier, select a column from the query results that contain the selected identifier. You can select **Explore query and results** to open the advanced hunting context panel. This allows you to explore your query and results to make sure you chose the right column for the selected identifier. 
     <br>
    :::image type="content" source="/defender/media/advanced-hunting-defender-results-identifier.png" alt-text="Screenshot of the link to incident wizard entities branch in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-defender-results-identifier.png":::
     <br>
    In our example, we used a query to find events related to a possible email exfiltration incident, therefore the recipient's mailbox and recipient's account are the impacted entities, and the sender's IP as well as email message are related evidence.
    
    :::image type="content" source="/defender/media/advanced-hunting-defender-results-link-entities.png" alt-text="Screenshot of the link to incident wizard full entities branch in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-defender-results-link-entities.png":::
    
    A different alert is created for each record with a unique combination of impacted entities. In our example, if there are three different recipient mailboxes and recipient object ID combinations, for instance, then three alerts are created and linked to the chosen incident.

6. Select **Next**.
7. Review the details you've provided in the Summary section. 
8. Select **Done**.

### View linked records in the incident
You can select the generated link from the summary step of the wizard or select the incident name from the incident queue, to view the incident to which the events are linked.

:::image type="content" source="/defender/media/advanced-hunting-results-link7.png" alt-text="Screenshot of the summary step in the link to incident wizard in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-results-link7.png":::

In our example, the three alerts, representing the three selected events, were linked successfully to a new incident.
In each of the alert pages, you can find the complete information on the event or events in timeline view (if available) and the query results view. 

You can also select the event from the timeline view or from the query results view to open the **Inspect record** pane.

:::image type="content" source="/defender/media/advanced-hunting-results-link8.png" alt-text="Screenshot of the incident page in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-results-link8.png":::

### Filter for events added using advanced hunting

You can view which alerts were generated from advanced hunting by filtering incidents and alerts by **Manual** detection source.

:::image type="content" source="/defender/media/advanced-hunting-results-link9.png" alt-text="Screenshot of the filter dropdown in advanced hunting in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-results-link9.png":::