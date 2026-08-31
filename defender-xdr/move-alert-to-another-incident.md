---
title: Move alerts from one incident to another in the Microsoft Defender portal
description: Learn how to detach an alert from an incident in the Microsoft Defender portal, to correct false and/or missed correlations, and attach the alert to another (new or existing) incident, so you can investigate and remediate security threats more effectively.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
- usx-security
- sentinel-only
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Move alerts from one incident to another in the Microsoft Defender portal

While Microsoft Defender already uses advanced correlation mechanisms, you might want to decide differently whether a given alert belongs with a particular incident or not. In such a case, you can detach an alert from one incident and attach it to another. Every alert must belong to an incident, so you must attach the alert either to another existing incident, or to a new incident that you create on the spot.

This article explains how to move alerts from one incident to another.

## Prerequisites

Before you move alerts between incidents, make sure you have the following permissions:

- Users must have permissions to view the incidents queue.
- Users must have read and write permissions on all the alerts they wish to move between incidents.

## Access the panel to move alerts

There are many ways to open the **Move alerts to another incident** panel. You can access it from anywhere you can select or take action on alerts. For example:

In any of the following locations, select one or more alerts by marking the checkboxes at the beginning of their rows. When one or more alerts are marked, the **Move alerts to another incident** button appears on the toolbar.

- The **Incidents** queue. Expand a given incident to reveal the alerts it contains.
- The **Alerts** tab on the incident details page.
- The **Alerts** queue.

Also, on the details panel on an alert details page, the **Move alert to another incident** button always appears.

## Select the alert or alerts to move

To choose the alerts you want to move and open the move panel, follow these steps:

1. Open the **Incidents** queue, the **Alerts** tab on the incident details page, the **Alerts** queue, or an alert details page.

1. Select the alert or alerts you want to move by marking the checkboxes at the beginning of their rows in the queue. When one or more alerts are marked, the **Move alerts to another incident** button appears on the toolbar.

    :::image type="content" source="media/move-alert-to-another-incident/move-alert-to-another-incident-from-alerts-tab.png" alt-text="Screenshot of selecting alerts from the queue to move to another incident." lightbox="media/move-alert-to-another-incident/move-alert-to-another-incident-from-alerts-tab.png":::

1. Select **Move alerts to another incident** from the toolbar. A flyout panel opens. If you selected only one alert, the panel is labeled **Move alert to another incident**. If you selected two or more alerts, it's labeled **Move multiple alerts to another incident**. In all other respects, the flyout panel is the same.

1. If the alert or alerts belong with another existing incident, select **Link to an existing incident**. Otherwise, select **Create a new incident**. Alerts must belong to an incident.

### Move alert or alerts to an existing incident

To move the selected alerts to an existing incident, complete the following steps:

1. If you selected **Link to an existing incident**, a new text field, **Incident name or ID**, appears immediately following the selection. Begin typing the name or ID number of the incident you want to attach the alert or alerts to. As you type, the list of available incidents is dynamically displayed and filtered by what you type. When you see the one you want in the list, select it.

    :::image type="content" source="media/move-alert-to-another-incident/move-alert-to-existing-incident-select.png" alt-text="Screenshot of selecting an existing incident to move an alert to.":::

1. In the **Comment** field, type a comment explaining why you want to move the alerts.

    :::image type="content" source="media/move-alert-to-another-incident/move-alert-to-existing-incident-save.png" alt-text="Screenshot of adding a comment explaining why moving an alert.":::

1. Provide feedback explaining why you are moving the alert or alerts by selecting one of the predefined options. Providing feedback helps Microsoft improve alert correlation in the future.

1. Select **Save** at the bottom of the panel to execute the move.

### Move alert or alerts to a new incident

To create a new incident for the selected alerts, follow these steps:

1. If you selected **Create a new incident**, enter a comment explaining why you want to move the alerts.

1. Provide feedback explaining why you are moving the alert or alerts by selecting one of the predefined options. Providing feedback helps Microsoft improve alert correlation in the future.

1. Select **Save** at the bottom of the panel to execute the move.

    :::image type="content" source="media/move-alert-to-another-incident/move-alert-to-new-incident.png" alt-text="Screenshot of selecting a new incident to move an alert to.":::

    After the move is saved, a new incident is created with the alert or alerts you moved to it. The incident is given a name automatically based on the name of the alert or alerts.

<a name="activity-log"></a>
## Review activity log entries for moved alerts

When an alert is correlated with an incident, a message is written to the incident's activity log, attesting that the alert was correlated with it. This message is written in either of the following circumstances:

- An alert is created and automatically correlated with a new or existing incident.
- An alert is moved from one incident to another. The message appears in the log of the destination incident.

<a name="see-also"></a>
## Related content

- [Alert correlation and incident merging in the Microsoft Defender portal](alerts-incidents-correlation.md)
- [Merge incidents manually in the Microsoft Defender portal](merge-incidents-manually.md)
