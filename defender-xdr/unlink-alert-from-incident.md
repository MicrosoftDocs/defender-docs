---
title: Unlink alerts from incidents in the Microsoft Defender portal
description: Learn how to unlink an alert from an incident in the Microsoft Defender portal, to correct false and/or missed correlations, so you can investigate incidents more accurately.
ms.service: defender-xdr
ms.author: yelevin
author: yelevin
ms.localizationpriority: medium
manager: raynew
audience: ITPro
ms.collection: 
- m365-security
- tier2
- usx-security
- sentinel-only
ms.topic: how-to
ms.date: 11/21/2024
search.appverid: met150
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
---

# Unlink alerts from incidents in the Microsoft Defender portal

While Microsoft Defender already uses advanced correlation mechanisms, you might want to decide differently whether a given alert belongs with a particular incident or not. In such a case, you can unlink an alert from one incident and link it to another. Every alert must belong to an incident, so you can either link the alert to another existing incident, or to a new incident that you create on the spot.

This article explains how to move alerts from one incident to another.

## Prerequisites

- Users must have permissions to view the incidents queue.
- Users must have read and write permissions on all the alerts they wish to correlate.

## Access the panel to unlink alerts

There are many ways to get to this panel. You can access it from anywhere you can select or take action on alerts. For example:

In any of the following locations, select one or more alerts by marking the checkboxes at the beginning of their rows. When one or more alerts are marked, the **Link alerts to another incident** button appears on the toolbar.

- The **Incidents** queue. Expand a given incident to reveal the alerts it contains.
- The **Alerts** tab on the incident details page.
- The **Alerts** queue.

Also, on the details panel on an alert details page, the **Link alerts to another incident** button always appears.

## Select the alert or alerts to unlink

1. Open one of the locations mentioned in the previous section.

1. Select the alert or alerts you want to move by marking the checkboxes at the beginning of their rows in the queue. When one or more alerts are marked, the **Link alerts to another incident** button appears on the toolbar.

1. Select **Link alerts to another incident** from the toolbar. A flyout opens. If you selected only one alert, the flyout is labeled **Link alert to another incident**. If you selected two or more alerts, it's labeled **Link multiple alerts to another incident**. In all other respects, it's the same flyout.

1. If the alert or alerts belong with another existing incident, select **Link to an existing incident**. Otherwise, select **Create a new incident**. Alerts must belong to an incident.

1. If you selected **Link to an existing incident**, a new text field, **Incident name or ID**, appears immediately following the selection. Begin typing the name or ID number of the incident you want to attach the alert or alerts to. As you type, the list of available incidents is dynamically displayed and filtered by what you type. When you see the one you want in the list, select it.

1. In the **Comment** field, type a comment on why you want to move the alerts.

1. Select **Save** at the bottom of the flyout to execute the move.

## Notes

## See also

- [Alert correlation and incident merging in the Microsoft Defender portal](alerts-incidents-correlation.md)
- [Merge incidents manually in the Microsoft Defender portal](merge-incidents-manually.md)
