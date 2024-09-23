---
title: Review machine changes with file integrity monitoring in Microsoft Defender for Cloud 
description: Learn how to review machine changes with file integrity monitoring in Microsoft Defender for Cloud 
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/11/2024
---

# Review file changes with file integrity monitoring

In Defender for Servers Plan 2 in Microsoft Defender for Cloud, the [file integrity monitoring feature](file-integrity-monitoring-overview.md) helps keeps enterprise assets and resources secure by scanning and analyzing files, and comparing their current state with previous scans.

File integrity monitoring uses the Microsoft Defender for Endpoint agent to collect data from machines, in accordance with collection rules. [Defender for Endpoint is integrated by default](integration-defender-for-endpoint.md#integration-with-defender-for-endpoint-edr) with Defender for Cloud.

> [!Note]
> The older method of data collection uses the Log Analytics agent (also known as the Microsoft Monitoring agent (MMA)). Support for using the MMA will end in November 2024.

This article shows you how to review file changes.


## Prerequisites

- Defender for Servers Plan 2 must be enabled.
- [File integrity monitoring with the Defender for Endpoint agent](file-integrity-monitoring-enable-defender-endpoint.md) must be enabled. If it isn't enabled this message appears - **File Integrity Monitoring is not enabled**. To enable select **Onboard subscriptions**, and then enable the feature.


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

