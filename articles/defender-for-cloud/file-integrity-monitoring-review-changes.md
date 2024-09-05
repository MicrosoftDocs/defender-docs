---
title: Review machine changes with file integrity monitoring in Microsoft Defender for Cloud 
description: Learn how to review machine changes with file integrity monitoring in Microsoft Defender for Cloud 
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/11/2024
---

# Review changes with file integrity monitoring (Defender for Endpoint)

In the Defender for Servers plan in Microsoft Defender for Cloud, the [file integrity monitoring](file-integrity-monitoring-overview.md) feature provides visibility into machine changes by examining operating system files, Windows registries, application software, and Linux system files to detect suspicious tampering activity such as file and registry modifications.

File integrity monitoring uses Azure Automation change tracking. This article describes how to monitor machine changes captured by file integrity monitoring. 


## Prerequisites

[File integrity monitoring using the integrated Defender for Endpoint sensor](file-integrity-monitoring-enable-defender-endpoint.md) must be enabled.

> [!NOTE]
> If you haven't enabled FIM yet, you'll see a message that says **File Integrity Monitoring is not enabled**. To enable FIM, select **Onboard subscriptions** and then [enable File Integrity Monitoring](file-integrity-monitoring-enable-defender-endpoint.md).


## Monitor entities and files

To monitor entities and files, follow these steps:

1. From Defender for Cloud's sidebar, go to **Workload protections** > **File integrity monitoring**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/workload-protections-file-integrity-monitoring.png" alt-text="Screenshot of how to access File Integrity Monitoring in Workload protections." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/workload-protections-file-integrity-monitoring.png":::

1. A window opens with all resources that contain tracked changed files and registries.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-results.png" alt-text="Screenshot of the File Integrity Monitoring results." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-results.png":::

1. If you select a resource, a window opens with a query showing the changes made to the tracked files and registries on that resource.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-query.png" alt-text="Screenshot of the File Integrity Monitoring query." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-query.png":::

1. If you select the subscription of the resource (under the column **Subscription name**), a query opens with all the tracked files and registries in that subscription.

> [!NOTE]
> If you previously used [File Integrity Monitoring over MMA](file-integrity-monitoring-enable-log-analytics.md), you can return to that method by selecting **Change to previous experience**. This will be available until the FIM over MMA feature is deprecated. For information on the deprecation plan, see [Prepare for retirement of the Log Analytics agent](prepare-deprecation-log-analytics-mma-agent.md).

## Retrieve and analyze file integrity monitoring data  

The file integrity monitoring data resides within the Azure Log Analytics workspace in the `MDCFileIntegrityMonitoringEvents` table.  

1. Set a time range to retrieve a summary of changes by resource. In the following example, we retrieve all changes in the last 14 days in the categories of registry and files:  

    ```kusto  
    MDCFileIntegrityMonitoringEvents  
    | where TimeGenerated > ago(14d)  
    | where ConfigChangeType in ('Registry', 'Files')  
    | summarize count() by Computer, ConfigChangeType  
    ```

1. To view detailed information about registry changes:  
  
    1. Remove `Files` from the `where` clause.  

    1. Replace the summarization line with an ordering clause:  

    ```kusto  
    MDCFileIntegrityMonitoringEvents  
    | where TimeGenerated > ago(14d)  
    | where ConfigChangeType == 'Registry'  
    | order by Computer, RegistryKey  
    ```

1. The reports can be exported to CSV for archival purposes and  channeled to a Power BI report for further analysis.

