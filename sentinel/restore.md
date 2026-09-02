---
title: Restore archived logs from search - Microsoft Sentinel
description: Learn how to restore archived logs from search job results.
author: EdB-MSFT
ms.topic: how-to
ms.date: 06/15/2026
ms.author: edbaynash
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014


#Customer intent: As a security analyst, I want to restore archived log data so that I can perform high-performance queries and analytics on historical data.

---

# Restore archived logs from search

When you need to investigate historical security data that has been moved to long-term storage, you can restore archived logs to make them available for high-performance queries and analytics. This article walks you through how to restore archived log data in Microsoft Sentinel, view the restored results, and delete restored tables when you no longer need them.

[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

## Prerequisites

Restoring archived log data in Microsoft Sentinel relies on the Azure Monitor restore capability. Before you begin, review the requirements and limitations in [Restore in Azure Monitor](/azure/azure-monitor/logs/restore).

## Restore archived log data

To restore archived log data in Microsoft Sentinel, specify the table and time range for the data you want to restore. Within a few minutes, the log data is available within the Log Analytics workspace. Then you can use the data in high-performance queries that support full Kusto Query Language (KQL).

Restore archived data directly from the **Search** page or from a saved search.

1. In the [Defender portal](https://security.microsoft.com/), the **Search** page is at the Microsoft Sentinel root level. In Microsoft Sentinel, select **Search**. In the [Azure portal](https://portal.azure.com), the **Search** page is listed under **General**.

1. Restore log data using one of the following methods:

   - Select :::image type="icon" source="media/restore/restore-button.png" border="false"::: **Restore** at the top of the page. In the **Restoration** pane on the side, select the table and time range you want to restore, and then select **Restore at the bottom of the pane**.

   - Select **Saved searches**, locate the search results you want to restore, and then select **Restore**. If you have multiple tables, select the one you want to restore and then select **Actions > Restore** in the side pane. For example:

      :::image type="content" source="media/restore/restore-azure.png" alt-text="Screenshot of restoring a specific site search.":::

1. Wait for the log data to be restored. View the status of your restoration job by selecting on the **Restoration** tab.

## View restored log data

View the status and results of the log data restore by going to the **Restoration** tab. You can view the restored data when the status of the restore job shows **Data Available**.

1. In Microsoft Sentinel, select **Search** > **Restoration**.

1. When your restore job is complete and the status is updated, select the table name and review the results.

   In the [Azure portal](https://portal.azure.com), results are shown in the **Logs** query page. In the [Defender portal](https://security.microsoft.com/), results are shown in the **Advanced hunting** page.

   For example:

   :::image type="content" source="media/restore/restored-data-logs-view.png" alt-text="Screenshot that shows the logs query pane with the restored table results.":::

   The **Time range** is set to a custom time range that uses the start and end times of the restored data.

## Delete restored data tables

To save costs, we recommend you delete the restored table when you no longer need it. When you delete a restored table, the underlying source data isn't deleted.

1. In Microsoft Sentinel, select **Search** > **Restoration** and identify the table you want to delete.

1. Select **Delete** for that table row to delete the restored table.

## Next steps

- [Hunt with bookmarks](bookmarks.md)
