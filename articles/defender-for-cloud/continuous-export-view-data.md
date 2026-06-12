---
title: View exported data in Azure Monitor
description: Learn how to view the data you exported with continuous export in Azure Monitor and analyze it effectively.
ms.topic: how-to
ms.date: 05/24/2026
#customer intent: As a security analyst, I want to be able to view the exported data in Azure Monitor so that I can analyze and respond to security alerts and recommendations effectively.
---

# View exported data in Azure Monitor

This article explains how to view Microsoft Defender for Cloud data exported to Azure Monitor. It covers Log Analytics and Azure Event Hubs, and it explains how to create Azure Monitor alert rules based on exported data.

## Prerequisites

Before you begin, set up continuous export with one of these methods:

- [Set up continuous export in the Azure portal](continuous-export.md) 
- [Set up continuous export with Azure Policy](continuous-export-azure-policy.md)
- [Set up continuous export with Representational State Transfer (REST) API](continuous-export-rest-api.md).

## View exported data in Log Analytics

When you export Defender for Cloud data to a Log Analytics workspace, two main tables are created automatically:

- `SecurityAlert`
- `SecurityRecommendation`

You can query these tables in Log Analytics to confirm that continuous export is working.

1. Sign in to the Azure portal at [portal.azure.com](https://portal.azure.com/).

1. Search for and select **Log Analytics workspaces**. 

1. Select **the workspace** that you configured as your continuous export target.  

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

1. Sign in to the Azure portal at [portal.azure.com](https://portal.azure.com/).

1. Search for and select **Event Hubs namespaces**.

1. Select **the namespace and event hub** that you configured for continuous export.

1. In the event hub menu, select **Metrics** to view message activity, or **Process data** > **Capture** to review event contents stored in your capture destination.

1. Optionally, use a connected tool such as [Microsoft Sentinel](/azure/sentinel/), a security information and event management (SIEM) solution, or a custom consumer app to read and process the exported events.

> [!NOTE]
> Defender for Cloud sends data in JavaScript Object Notation (JSON) format. You can use Event Hubs Capture or consumer groups to store and analyze the exported events.

## Create alert rules in Azure Monitor (optional)

You can create Azure Monitor alerts based on your exported Defender for Cloud data. These alerts let you automatically trigger actions, such as sending email notifications or creating information technology service management (ITSM) tickets, when specific security events occur.

1. Sign in to the Azure portal at [portal.azure.com](https://portal.azure.com/).

1. Search for and select **Monitor**.

1. Select **Alerts**.

1. Select **+ Create** > **Alert rule**.

    :::image type="content" source="media/continuous-export-view-data/azure-monitor-alerts.png" alt-text="Azure Monitor Alerts page with the + Create menu open and Alert rule selected." lightbox="media/continuous-export-view-data/azure-monitor-alerts.png":::

1. Set up your new rule the same way you'd configure log alert rules in Azure Monitor. For details, see [Configure log alert rules](/azure/azure-monitor/alerts/alerts-unified-log):

    - For **Resource types**, select the Log Analytics workspace to which you exported security alerts and recommendations.
    - For **Condition**, select **Custom log search**. In the page that appears, configure the query, lookback period, and frequency period. In the query, enter **SecurityAlert** or **SecurityRecommendation**. 
    - Optionally, create action groups to trigger automated responses. For setup guidance, see [Azure Monitor action groups](/azure/azure-monitor/alerts/action-groups). Action groups can send email, create ITSM tickets, run webhooks, and more.
    
After you save the rule, Defender for Cloud alerts or recommendations appear in Azure Monitor based on your continuous export configuration and alert rule conditions. If you’ve linked an action group, it triggers automatically when the rule criteria are met.

## Next step

> [!div class="nextstepaction"]
> [Download a CSV report](export-alerts-to-csv.md)

