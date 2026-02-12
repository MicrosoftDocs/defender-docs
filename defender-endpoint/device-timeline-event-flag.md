---
title: Review device timeline in Microsoft Defender for Endpoint
description: Use the device timeline to review events, flag important activities, and investigate anomalous behavior on devices.
keywords: Defender for Endpoint device timeline, event flags
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.reviewer: efratka, alonshar
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
ms.subservice: edr
search.appverid: met150
ms.date: 03/26/2025
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 2

---
# Review device timeline in Microsoft Defender for Endpoint

The device timeline provides a chronological view of events and associated alerts observed on a device, helping you investigate anomalous behavior and potential attacks. You can explore specific events, review MITRE ATT&CK techniques, use process trees, and flag events for follow-up.

## Access the device timeline

1. Navigate to the device page from:
   - **Device inventory** (**Assets** > **Devices**)
   - An alert in the **Alerts queue**
   - An incident in **Incidents & alerts**
2. Select the **Timeline** tab

## Key timeline capabilities

The device timeline includes several features to help you investigate events efficiently:

| Feature | Description | How to use |
|---------|-------------|------------|
| **Custom time range picker** | Select specific date ranges to focus your investigation | Select the date range picker at the top of the timeline |
| **Process tree view** | Visualize parent-child relationships between processes | Select an event to open the side panel with process tree |
| **MITRE ATT&CK techniques** | View all related MITRE techniques for events | Techniques appear as bold text with blue icons; select to see details |
| **User page integration** | See which user accounts are associated with events | Select user names in events to navigate to user investigation page |
| **Visible filters** | See which filters are currently applied to the timeline | Active filters appear at the top of the timeline |
| **Event flagging** | Mark important events for follow-up during investigation | Select the flag icon next to an event |

:::image type="content" source="media/custom-time-range.png" alt-text="Screenshot of the custom time range.":::

:::image type="content" source="media/event-side-panel.png" alt-text="Screenshot of the event side panel." lightbox="media/event-side-panel.png":::

:::image type="content" source="media/new-timeline-mitre-techniques.png" alt-text="Screenshot of all MITRE techniques." lightbox="media/new-timeline-mitre-techniques.png":::

> [!IMPORTANT]
> Some information relates to a prereleased product feature in public preview which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

In Microsoft Defender for Endpoint, **Techniques** are an additional data type in the event timeline. Techniques provide more insight on activities associated with [MITRE ATT&CK](https://attack.mitre.org/) techniques or subtechniques.

This feature simplifies the investigation experience by helping analysts understand the activities that were observed on a device. Analysts can then decide to investigate further.

During preview, Techniques are available by default and shown together with events when a device's timeline is viewed.

:::image type="content" source="media/new-timeline-mitre-techniques.png" alt-text="Screenshot of all MITRE techniques." lightbox="media/new-timeline-mitre-techniques.png":::

Techniques are highlighted in bold text and appear with a blue icon on the left. The corresponding MITRE ATT&CK ID and technique name also appear as tags under Additional information.

Search and Export options are also available for Techniques.

### Investigate using the side pane

Select a Technique to open its corresponding side pane. Here you can see additional information and insights like related ATT&CK techniques, tactics, and descriptions.

Select the specific *Attack technique* to open the related ATT&CK technique page where you can find more information about it.

You can copy an entity's details when you see a blue icon on the right. For instance, to copy a related file's SHA1, select the blue page icon.

:::image type="content" source="media/new-timeline-process-tree.png" alt-text="Screenshot that shows the copy entity details." lightbox="media/new-timeline-process-tree.png":::

:::image type="content" source="media/new-timeline-side-panel-1.png" alt-text="Screenshot that shows the side pane details." lightbox="media/new-timeline-side-panel-1.png":::

You can do the same for command lines.

:::image type="content" source="media/techniques-side-pane-command-1.png" alt-text="Screenshot that shows the option to copy command line." lightbox="media/techniques-side-pane-command-1.png":::

### Investigate related events

To use [advanced hunting](/defender-xdr/advanced-hunting-overview) to find events related to the selected Technique, select **Hunt for related events**. This leads to the advanced hunting page with a query to find events related to the Technique.

:::image type="content" source="media/techniques-hunt-for-related-events-1.png" alt-text="Screenshot that shows the Hunt for related events option." lightbox="media/techniques-hunt-for-related-events-1.png":::

> [!NOTE]
> Querying using the **Hunt for related events** button from a Technique side pane displays all the events related to the identified technique but does not include the Technique itself in the query results.
 
 ### EDR client (MsSense.exe) Resource Manager 

When the EDR client on a device is running low on resources, it enters critical mode to maintain the normal working operation of the device. The device won't process new events until the EDR client returns to a normal state. A new event appears in the **Timeline** for that device indicating that the EDR client switched to **Critical** mode. 

When the EDR client's resource usage goes back to normal levels, it will automatically return to normal mode.

### Customize your device timeline

On the upper right-hand side of the device timeline, you can choose a date range to limit the number of events and techniques in the timeline.

You can customize which columns to expose. You can also filter for flagged events by data type or by event group.

### Choose columns to expose

You can choose which columns to expose in the timeline by selecting the **Choose columns** button.

:::image type="content" source="media/new-timeline-customize-columns.png" alt-text="Screenshot that shows the pane in which you can customize columns." lightbox="media/new-timeline-customize-columns.png":::


From there you can select which information set to include.

### Filter to view techniques or events only

To view only either events or techniques, select **Filters** from the device timeline and choose your preferred Data type to view.

:::image type="content" source="media/new-timeline-filter.png" alt-text="Screenshot that shows the Filters pane." lightbox="media/new-timeline-filter.png":::

## Timeline event flags

Event flags in the Defender for Endpoint device timeline help you filter and organize specific events when you're investigating potential attacks.

The Defender for Endpoint device timeline provides a chronological view of the events and associated alerts observed on a device. This list of events provides full visibility into any events, files, and IP addresses observed on the device. The list can sometimes be lengthy. Device timeline event flags help you track events that could be related.

After you've gone through a device timeline, you can sort, filter, and export the specific events that you flagged.

While navigating the device timeline, you can search and filter for specific events. You can set event flags by:

- Highlighting the most important events
- Marking events that require deep dive
- Building a clean breach timeline

## Flag an event

1. Find the event that you want to flag.

1. Select the flag icon in the Flag column. 

:::image type="content" source="media/device-flags.png" alt-text="The device timeline flag" lightbox="media/device-flags.png":::

## View flagged events

1. In the timeline **Filters** section, enable **Flagged events**.
1. Select **Apply**. Only flagged events are displayed.

You can apply more filters by clicking on the time bar. This will only show events prior to the flagged event.  

:::image type="content" source="media/device-flag-filter.png" alt-text="Screenshot that shows the device timeline flag with the filter switched on." lightbox="media/device-flag-filter.png":::


