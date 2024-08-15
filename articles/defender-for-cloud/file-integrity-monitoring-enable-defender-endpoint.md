---
title: Enable File Integrity Monitoring with Microsoft Defender for Endpoint
description: Learn how to enable File Integrity Monitor when you collect data with Microsoft Defender for Endpoint.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/11/2024
---

# Enable File Integrity Monitoring using Microsoft Defender for Endpoint

To provide [File Integrity Monitoring (FIM)](file-integrity-monitoring-overview.md), Microsoft Defender for Endpoint collects data from machines according to data collection rules. When the current state of your system files is compared with the state during the previous scan, FIM notifies you about suspicious modifications.

Using FIM you can:

- Monitor changes made to critical files and Windows registries from a predefined list in real-time.
- Access and analyze the audited changes in a designated Workspace.
- Take advantage of the 500-MB benefit included in the Defender for Servers Plan 2.
- Maintain compliance: FIM offers built-in support for relevant security regulatory compliance standards, such as PCI-DSS, CIS, NIST, and others

FIM alerts you to any potentially suspicious activities. These activities include:

- The creation or deletion of files and registry keys
- Modifications to files, such as changes in the file's size, name, location, or the hash of its content
- Alterations to the registry, including changes in its size, type, and content
- Details about the change, including the source of the change. These include account details, which indicate who made the changes, and information about the initiating process.

For guidance on which files to monitor, see [Which files should I monitor?](file-integrity-monitoring-overview.md#which-files-should-i-monitor).

## Availability

|Aspect|Details|
|----|:----|
|Release state:|Preview|
|Pricing:|Requires [Microsoft Defender for Servers Plan 2](plan-defender-for-servers-select-plan.md#plan-features)|
|Required roles and permissions:|**Workspace owner** can enable and disable FIM. For more information, see [Azure Roles for Log Analytics](/services-hub/health/azure-roles#azure-roles).<br />**Reader** can view results.|
|Clouds:|:::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br />:::image type="icon" source="./media/icons/yes-icon.png"::: [Azure Arc](/azure/azure-arc/servers/overview) enabled devices.<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Connected AWS accounts<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Connected GCP accounts|

## Prerequisites

To track changes to your files and registries on machines with Defender for Endpoint, you need to:

- Enable [Defender for Servers Plan 2](defender-for-servers-introduction.md).

- Enable [Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) on machines you want to monitor

## Enable File Integrity Monitoring with Defender for Endpoint

### Enable in the Azure portal

To enable FIM in the Azure portal, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defenders for Servers plan and select **Settings**.
1. In the **File Integrity Monitoring** section, switch the toggle to **On**. Then select **Edit configuration**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png" alt-text="Screenshot of how to enable File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png":::

1. The **FIM configuration** pane opens. In the **Workspace selection** dropdown, select the workspace where you want to store the FIM data. If you want to create a new workspace, select **Create new**.

   :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png" alt-text="Screenshot of the FIM configuration pane." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png":::

1. In the lower section of the **FIM configuration** pane, select the **Windows registry**, **Windows files**, and **Linux files** tabs to choose the files and registries you want to monitor. If you choose the top selection in each tab, all files and registries are monitored. Select **Apply** to save your changes.

   :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration-tabs.png" alt-text="Screenshot of the FIM configuration tabs." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration-tabs.png":::

1. Select **Continue**.

1. Select **Save**.

### Enable with API

FIM collected events are ingested into the designated workspace defined in the onboarding process into a dedicated table called `MDCFileIntegrityMonitoringEvents`.

### Ensure that FIM is successfully deployed

- Test flow
- Create filename: ""
- Check that events are collected and ingested into the designated workspace

## Disable File Integrity Monitoring with Defender for Endpoint

After FIM is disabled, no new events are collected. However, the data collected before the disabling the feature remain in the workspace, according to the workspace's retention policy. For more information, see [Manage data retention in a Log Analytics workspace](/azure/azure-monitor/logs/data-retention-configure).

### Disable in the Azure portal

To disable FIM in the Azure portal, follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Search for and select **Microsoft Defender for Cloud**.
1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defenders for Servers plan and select **Settings**.
1. In the **File Integrity Monitoring** section, switch the toggle to **Off**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/disable-file-integrity-monitoring.png" alt-text="Screenshot of how to disable File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/disable-file-integrity-monitoring.png":::

1. Select **Apply**.

1. Select **Continue**.

1. Select **Save**.

### Disable with API

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

## Retrieve and analyze FIM data  

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

## Related content

Learn more about Defender for Cloud in:

- [Setting security policies](tutorial-security-policy.md) - Learn how to configure security policies for your Azure subscriptions and resource groups.
- [Managing security recommendations](review-security-recommendations.md) - Learn how recommendations help you protect your Azure resources.
- [Azure Security blog](https://azure.microsoft.com/blog/topics/security/) - Get the latest Azure security news and information.
