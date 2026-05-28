---
title: Set up continuous export to an event hub behind a firewall
description: Learn how to set up continuous export of Microsoft Defender for Cloud security alerts and recommendations to an event hub behind a firewall.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 05/24/2026
ms.custom: sfi-image-nochange
#customer intent: As a security analyst, I want to learn how to set up continuous export of alerts and recommendations to an event hub behind a firewall so that I can analyze the data in Log Analytics or Azure Event Hubs.
---

# Set up continuous export to an event hub behind a firewall

Microsoft Defender for Cloud supports continuous export of alerts and recommendations to Azure Event Hubs. If your event hub is behind a firewall, you can allow Defender for Cloud as a trusted service so export can continue. This article explains how to configure that trusted-service access.

## Prerequisites

Before you enable trusted-service access, configure continuous export by using one of these methods:

- [Set up continuous export in the Azure portal](continuous-export.md).
- [Set up continuous export with Azure Policy](continuous-export-azure-policy.md).
- [Set up continuous export with REST API](continuous-export-rest-api.md).

## Set up continuous export to the event hub

Enable continuous export as a trusted service to send data to an event hub protected by Azure Firewall.

**To grant access to continuous export as a trusted service**:

1. Sign in to the Azure portal at [portal.azure.com](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant resource.

1. Select **Continuous export**.

1. Select **Export as a trusted service**.

    :::image type="content" source="media/continuous-export-event-hub-firewall/export-as-trusted.png" alt-text="Screenshot that shows where the checkbox is located to select export as trusted service." lightbox="media/continuous-export-event-hub-firewall/export-as-trusted.png":::

## Add the relevant role assignment to the destination event hub

To add the relevant role assignment to the event hub configured as your continuous export destination:

1. Go to the event hub that you configured as the continuous export destination.

1. In the resource menu, select **Access control (IAM)** > **Add role assignment**.

    :::image type="content" source="media/continuous-export-event-hub-firewall/add-role-assignment.png" alt-text="Screenshot that shows the Add role assignment button." lightbox="media/continuous-export-event-hub-firewall/add-role-assignment.png":::

1. Select **Azure Event Hubs Data Sender**.

1. Select the **Members** tab.

1. Choose **+ Select members**.

1. Search for and then select **Windows Azure Security Resource Provider**.

    :::image type="content" source="media/continuous-export-event-hub-firewall/windows-security-resource.png" alt-text="Screenshot that shows you where to enter and search for Microsoft Azure Security Resource Provider." lightbox="media/continuous-export-event-hub-firewall/windows-security-resource.png":::

1. Select **Review + assign**.

## Next step

> [!div class="nextstepaction"]
> [View exported data in Azure Monitor](continuous-export-view-data.md)

