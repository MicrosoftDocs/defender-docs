---
title: Connect Microsoft Defender for Office 365 to Microsoft Sentinel
description: Learn how to connect Microsoft Defender for Office 365 data to Microsoft Sentinel. Ingest incidents, alerts, and other Defender XDR data for unified investigation and advanced hunting.
ms.service: defender-office-365
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 06/12/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Connect Microsoft Defender for Office 365 to Microsoft Sentinel

This article walks you through connecting Microsoft Defender for Office 365 to Microsoft Sentinel by using the Microsoft Defender XDR data connector. This includes incidents and data from the rest of the Microsoft Defender suite.

This integration provides security information and event management (SIEM) features with data from other Microsoft 365 sources. You can also sync incidents and alerts, and run advanced hunting queries.

<a name="what-you-need"></a>
## Prerequisites

Before you begin, make sure you have the following items:

- Microsoft Defender for Office 365 Plan 2 or higher. (Included in E5 plans)
- Microsoft Sentinel [Quickstart guide](/azure/sentinel/quickstart-onboard).
- Sufficient permissions (Security Administrator in Microsoft 365 & Read / Write permissions in Sentinel).

## Add the Microsoft Defender XDR Connector

Microsoft Defender for Office 365 data is onboarded to Microsoft Sentinel through the Microsoft Defender XDR connector. Follow these steps to add and configure the connector:

1. [Sign in to the Azure portal](https://portal.azure.com) and go to **Microsoft Sentinel**. Pick the workspace to use with Microsoft Defender XDR.
1. Under **Configuration**, select **Data connectors**.
1. Search for **Microsoft Defender XDR** and select the connector.
1. Select **Open Connector Page**.
1. Under **Configuration**, select **Connect incidents & alerts**. Keep **Turn off all Microsoft incident creation rules for these products** selected.
1. In the **Connect events** section, under **Microsoft Defender for Office 365**, select **EmailEvents**, **EmailUrlInfo**, **EmailAttachmentInfo**, and **EmailPostDeliveryEvents**, then select **Apply Changes**. You can also choose tables from other Defender products during this step.

## Next Steps

Admins can now view incidents, alerts, and raw data in Microsoft Sentinel. They can also use *advanced hunting* to explore new and existing data from Microsoft Defender.

<a name="more-information"></a>
## Related content

- [Connect Microsoft Defender data to Microsoft Sentinel | Microsoft Docs](/azure/sentinel/connect-microsoft-365-defender?tabs=MDE)
- [Connect Microsoft Teams to Microsoft Sentinel](/microsoftteams/teams-sentinel-guide)
