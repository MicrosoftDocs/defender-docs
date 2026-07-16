---
title: Use Microsoft Defender for Endpoint sensitivity labels to protect your data and prioritize security incident response
description: Learn how Microsoft Defender for Endpoint sensitivity labels help protect sensitive data and prioritize incident investigation.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-security
- ContentEngagementFY23
- tier2
 - EngageScoreSep2022
ms.topic: how-to
ms.subservice: edr
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016

ai-usage: ai-assisted
---
# Microsoft Defender for Endpoint sensitivity labels protect and prioritize incident response

## Use sensitivity labels in Defender for Endpoint

A typical advanced persistent threat (APT) lifecycle involves data exfiltration, where data is *taken* from the organization. Sensitivity labels help security teams know where to start. They show which data has the highest priority to protect.

Defender for Endpoint uses sensitivity labels to simplify how you prioritize security incidents. For example, labels help you quickly spot incidents that involve devices with sensitive or confidential information.

Here's how to use sensitivity labels in Defender for Endpoint.

## Investigate incidents that involve sensitive data on devices with Defender for Endpoint

Learn how to use data sensitivity labels to prioritize incident investigation.

> [!NOTE]
> Labels are detected for Windows 10, version 1809 or later, and Windows 11.

1. In Microsoft Defender portal, select **Incidents & alerts** \> **Incidents**.

1. Scroll over to see the **Data sensitivity** column. This column shows the sensitivity labels found on devices related to each incident. Use it to check whether sensitive files are affected.

   :::image type="content" source="media/data-sensitivity-column.png" alt-text="The Highly confidential option in the data sensitivity column" lightbox="media/data-sensitivity-column.png":::

    You can also filter based on **Data sensitivity**

    :::image type="content" source="media/data-sensitivity-filter.png" alt-text="The data sensitivity filter" lightbox="media/data-sensitivity-filter.png":::

1. Open the incident page to further investigate.

   :::image type="content" source="media/incident-page.png" alt-text="The incident page details" lightbox="media/incident-page.png":::

1. Select the **Devices** tab to identify devices storing files with sensitivity labels.

   :::image type="content" source="media/investigate-devices-tab.png" alt-text="The Device tab" lightbox="media/investigate-devices-tab.png":::

1. Select the devices that store sensitive data. Search the timeline to find which files might be affected. Then take action to protect that data.

   To narrow the results, search the device timeline for a specific sensitivity label. Only events for files that match that label name appear.

   :::image type="content" source="media/machine-timeline-labels.png" alt-text="The device timeline with narrowed down search results based on label" lightbox="media/machine-timeline-labels.png":::

> [!TIP]
> Sensitivity label and file protection status data are also exposed through the 'DeviceFileEvents' in advanced hunting, allowing advanced queries and schedule detection to take into account sensitivity labels and file protection status.

## Related information about sensitivity labels

For more details about sensitivity labels, see the following articles:

- [Learn about sensitivity labels in Office 365](/Microsoft-365/compliance/sensitivity-labels)
- [Apply sensitivity labels in email or Office apps](https://support.microsoft.com/office/apply-sensitivity-labels-to-your-files-and-email-in-office-2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9)
- [Use sensitivity labels as a condition in Data Loss Prevention policies](/Microsoft-365/compliance/dlp-sensitivity-label-as-condition)


