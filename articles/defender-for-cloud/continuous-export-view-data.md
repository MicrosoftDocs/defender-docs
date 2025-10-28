---
title: View exported data in Azure Monitor
description: Learn how to view the data you exported with continuous export in Azure Monitor and analyze it effectively.
author: Elazark
ms.author: Elkrieger
ms.topic: how-to
ms.date: 10/12/2025
#customer intent: As a security analyst, I want to be able to view the exported data in Azure Monitor so that I can analyze and respond to security alerts and recommendations effectively.
---

# View exported data in Azure Monitor

After you've set up continuous export of Microsoft Defender for Cloud security alerts and recommendations, you can view the data in Azure Monitor. This article describes how to view the data in Log Analytics or in Azure Event Hubs, and create alert rules in Azure Monitor based on that data.

## Prerequisites

Before you begin, setup continuous export with one of these methods:

- [Setup continuous export in the Azure portal](continuous-export.md) 
- [Setup continuous export with Azure Policy](continuous-export-azure-policy.md)
- [Setup continuous export with REST API](continuous-export-rest-api.md).

## View exported data in Log Analytics

When you export Defender for Cloud data to a Log Analytics workspace, two main tables are created automatically:

- `SecurityAlert`
- `SecurityRecommendation`

You can query these tables in Log Analytics to confirm that continuous export is working.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Log Analytics workspaces**. 

1. Select the workspace that you configured as your continuous export target.  

1. In the workspace menu, under **General**, select **Logs**.  

1. In the query window, enter one of the following queries and select **Run**:

    ```kusto
    SecurityAlert
    ```
    
    or 
    
    ```kusto
    SecurityRecommendation
    ```

## View exported data in Azure Event Hubs

When you export data to Azure Event Hubs, Defender for Cloud continuously streams alerts and recommendations as event messages. You can view these exported events in the Azure portal and analyze them further by connecting a downstream service.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Event Hubs namespaces**.

1. Select the namespace and event hub that you configured for continuous export.

1. In the event hub menu, select **Metrics** to view message activity, or **Process data** > **Capture** to review event contents stored in your capture destination.

1. Optionally, use a connected tool such as [Microsoft Sentinel](/azure/sentinel/), a SIEM, or a custom consumer app to read and process the exported events.

> [!NOTE]
> Defender for Cloud sends data in JSON format. You can use Event Hubs Capture or consumer groups to store and analyze the exported events.

## Create alert rules in Azure Monitor (optional)

You can create Azure Monitor alerts based on your exported Defender for Cloud data. These alerts let you automatically trigger actions, such as sending email notifications or creating ITSM tickets, when specific security events occur.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Monitor**.

1. Select **Alerts**.

1. Select + **Create** > **Alert rule**.

    :::image type="content" source="media/continuous-export-view-data/azure-monitor-alerts.png" alt-text="Screenshot that shows the Azure Monitor alerts page." lightbox="media/continuous-export-view-data/azure-monitor-alerts.png":::

1. Set up your new rule the same way you'd configure a [log alert rule in Azure Monitor](/azure/azure-monitor/alerts/alerts-unified-log):

    - For **Resource types**, select the Log Analytics workspace to which you exported security alerts and recommendations.
    - For **Condition**, select **Custom log search**. In the page that appears, configure the query, lookback period, and frequency period. In the query, enter **SecurityAlert** or **SecurityRecommendation**. 
    - Optionally, create an [action group](/azure/azure-monitor/alerts/action-groups) to trigger. Action groups can automate sending an email, creating an ITSM ticket, running a webhook, and more, based on an event in your environment.
    
After you save the rule, Defender for Cloud alerts or recommendations appear in Azure Monitor based on your continuous export configuration and alert rule conditions. If you’ve linked an action group, it triggers automatically when the rule criteria are met.

## Next step

> [!div class="nextstepaction"]
> [Download a CSV report](export-alerts-to-csv.md)
