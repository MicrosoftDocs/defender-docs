---
title: Turn on auditing and health monitoring in Microsoft Sentinel
description: Turn on auditing and health monitoring in Microsoft Sentinel to collect resource health and audit data in the SentinelHealth and SentinelAudit tables for monitoring, alerting, and investigation.
ms.author: guywild
author: guywi-ms
ms.reviewer: noak
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016

#Customer intent: As a security engineer, I want to configure auditing and health monitoring for my Microsoft Sentinel resources so that I can ensure the integrity and health of our security infrastructure.

---

# Turn on auditing and health monitoring for Microsoft Sentinel

Monitor the health of supported Microsoft Sentinel resources and audit their integrity. Turn on auditing and health monitoring in Microsoft Sentinel's **Settings** page. Get insights on health drifts, such as the latest failure events or changes from success to failure states. Track unauthorized actions, and use audit and health data to create notifications and other automated actions.

The [*SentinelHealth*](health-table-reference.md) data table stores health data. The [*SentinelAudit*](audit-table-reference.md) data table stores audit information. To use these tables, first turn on auditing and health monitoring for your workspace. This article shows you how.

To implement the health and audit feature using API (Bicep/AZURE RESOURCE MANAGER (ARM)/REST), review the [Diagnostic Settings operations](/rest/api/monitor/diagnostic-settings). To configure the retention time for your audit and health events, see [Manage data retention in a Log Analytics workspace](/azure/azure-monitor/logs/data-retention-configure).

## Prerequisites

- Before you start, learn more about health monitoring and auditing in Microsoft Sentinel. For more information, see [Auditing and health monitoring in Microsoft Sentinel](health-audit.md).

## Turn on auditing and health monitoring for your workspace

To get started, enable auditing and health monitoring from the Microsoft Sentinel settings.

1. For Microsoft Sentinel in the [Azure portal](https://portal.azure.com), under **Configuration**, select **Settings** > **Settings**.<br> For Microsoft Sentinel in the [Defender portal](https://security.microsoft.com/), under **System**, select **Settings** > **Microsoft Sentinel**.

1. Select **Auditing and health monitoring**.

1. Select **Enable** to enable auditing and health monitoring across all resource types and to send the auditing and monitoring data to your Microsoft Sentinel workspace (and nowhere else). 

    Or, select the **Configure diagnostic settings** link to enable health monitoring only for the data collector and/or automation resources, or to configure advanced options, like more places to send the data.

    #### [Defender portal](#tab/defender-portal)
    :::image type="content" source="media/enable-monitoring/enable-health-monitoring-defender.png" alt-text="Screenshot shows how to get to the health monitoring settings in the Defender portal.":::

    #### [Azure portal](#tab/azure-portal)
    :::image type="content" source="media/enable-monitoring/enable-health-monitoring.png" alt-text="Screenshot shows how to get to the health monitoring settings.":::

    ---

    If you selected **Enable**, the button grays out and shows **Enabling...**, then **Enabled**. Auditing and health monitoring is now turned on. The system adds the right diagnostic settings for you. To view or edit them, select the **Configure diagnostic settings** link.

1. If you selected **Configure diagnostic settings**, then in the **Diagnostic settings** screen, select **+ Add diagnostic setting**.

    (If you're editing an existing setting, select it from the list of diagnostic settings.)

    - In the **Diagnostic setting name** field, enter a meaningful name for your setting.

    - In the **Logs** column, select the appropriate **Categories** for the resource types you want to monitor, for example **Data Collection - Connectors**. Select **allLogs** if you want to monitor analytics rules.

    - Under **Destination details**, select **Send to Log Analytics workspace**, and select your **Subscription** and **Log Analytics workspace** from the dropdown menus.

        :::image type="content" source="media/enable-monitoring/diagnostic-settings.png" alt-text="Screenshot of diagnostic settings screen for enabling auditing and health monitoring.":::

        If you require, you might select other destinations to which to send your data, in addition to the Log Analytics workspace.

1. Select **Save** on the top banner to save your new setting.

The *SentinelHealth* and *SentinelAudit* data tables are created at the first event generated for the selected resources.

## Verify that the tables are receiving data

Run Kusto Query Language (KQL) queries in the Azure portal or the Defender portal to make sure you're getting health and auditing data.

1. For Microsoft Sentinel in the [Azure portal](https://portal.azure.com), under **General**, select **Logs**.<br> For Microsoft Sentinel in the [Defender portal](https://security.microsoft.com/), under **Investigation & response**, select **Hunting** > **Advanced hunting**.

1. Run a query on the  *SentinelHealth* table to retrieve recent health records and confirm that data is flowing. For example:

   ```kusto
   _SentinelHealth()
    | take 20
   ```

1. Run a query on the  *SentinelAudit* table to retrieve recent audit events, such as changes to analytics rules. For example:

   ```kusto
   _SentinelAudit()
    | take 20
   ```

## Supported data tables and resource types

After you turn on the feature, the [*SentinelHealth*](health-table-reference.md) and [*SentinelAudit*](audit-table-reference.md) data tables are created. The tables appear when the first event occurs for the selected resources.

Health monitoring supports these resource types:

- Analytics rules
- Data connectors
- Automation rules
- Playbooks (Azure Logic Apps workflows)

> [!NOTE]
> When monitoring playbook health, make sure to collect Azure Logic Apps diagnostic events from your playbooks to get the full picture of your playbook activity. For more information, see [Monitor the health of your automation rules and playbooks](monitor-automation-health.md).

Only the analytics rule resource type is currently supported for auditing.

## Next steps

- Learn about [auditing and health monitoring in Microsoft Sentinel](health-audit.md).
- [Monitor the health of your data connectors](monitor-data-connector-health.md).
- [Monitor the health and integrity of your analytics rules](monitor-analytics-rule-integrity.md).
