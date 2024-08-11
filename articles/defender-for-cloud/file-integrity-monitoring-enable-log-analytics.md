---
title: Enable File Integrity Monitoring (Log Analytics agent)
description: Learn how to enable File Integrity Monitoring with the Log Analytics agent to track and identify changes in your environment.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 05/16/2024
#customer intent: As a user, I want to learn how to enable File Integrity Monitoring with the Log Analytics agent so that I can track and identify changes in my environment.
---

# Enable file integrity monitoring with the MMA

In the Defender for Servers plan in Microsoft Defender for Cloud, [file integrity monitoring](file-integrity-monitoring-overview.md) examines operating system files, Windows registries, application software, and Linux system files for changes that might indicate an attack.


File integrity monitoring uses the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA) to collect and upload data to the Log Analytics workspace. By comparing the current state of these items with the state during the previous scan, file integrity monitoring notifies you if suspicious modifications have been made.

> [!NOTE]
> - File integrity monitoring in general availability (GA) uses the MMA for change tracking.The MMA is set to retire, and file integrity monitoring using the MMA will be deprecated in November 2024.
> - File integrity monitoring was available [in preview using the Azure Monitoring Agent (AMA)](file-integiry-monitoring-enable-ama.md) This preview is no longer supported.
> - A new version of the feature, using the Microsoft Defender for Endpoint agent that's integrated with Defender for Servers will be released in preview around August 2024.


## Prerequisites

- File integrity monitoring is available in [Defender for Servers Plan 2](defender-for-servers-introduction.md)). The plan must be enabled.
- Using the Log Analytics agent, file integrity monitoring uploads data to the Log Analytics workspace. Data charges apply, based on the amount of data you upload. Learn more about [Log Analytics pricing](https://azure.microsoft.com/pricing/details/log-analytics/).
- You need Workspace Owner permissions to enable/disable file integrity monitoring. Learn more about [Azure roles for Log Analytics](/services-hub/health/azure-roles#azure-roles). The Reader role can view results.
- File integrity monitoring is supported for Azure VMs, on-premises machines onboarded as Azure Arc VMs, and AWS accounts and GCP projects connected to Defender for Cloud.
- When monitoring SQL Servers, file integrity monitoring might create this account: `NT Service\HealthService`. If you delete the account, it's automatically recreated.
- You can't work with file integrity monitoring using the REST API. It's only available in the Azure portal.


## Enable file integrity monitoring with the MMA

1. From the **Workload protections** > **Advanced protection**, select **File integrity monitoring**.

   :::image type="content" source="./media/file-integrity-monitoring-overview/open-file-integrity-monitoring.png" alt-text="Screenshot of screenshot of opening the File Integrity Monitoring dashboard." lightbox="./media/file-integrity-monitoring-overview/open-file-integrity-monitoring.png":::

    The following information is provided for each workspace:

    - Total number of changes that occurred in the last week (you might see a dash "-“ if file integrity monitoring isn't enabled on the workspace)
    - Total number of computers and VMs reporting to the workspace
    - Geographic location of the workspace
    - Azure subscription that the workspace is under

1. Use this page to:

    - Access and view the status and settings of each workspace

    - ![Upgrade plan icon.][4] Upgrade the workspace to use enhanced security features. This icon indicates that the workspace or subscription isn't protected with Microsoft Defender for Servers. To use the file integrity monitoring features, your subscription must be protected with this plan. Learn about how to [enable Defender for Servers](plan-defender-for-servers-select-plan.md).

    - ![Enable icon][3] Enable file integrity monitoring on all machines under the workspace and configure the file integrity monitoring options. This icon indicates that file integrity monitoring isn't enabled for the workspace. If there's no enable or upgrade button, and the space is blank, it means that file integrity monitoring is already enabled on the workspace.

        :::image type="content" source="./media/file-integrity-monitoring-overview/workspace-list-fim.png" alt-text="Screenshot of enabling file integrity monitoring for a specific workspace.":::

1. Select **Enable file integrity monitoring**. The details of the workspace including the number of Windows and Linux machines under the workspace is shown.

    :::image type="content" source="./media/file-integrity-monitoring-overview/workspace-fim-status.png" alt-text="Screenshot of file integrity monitoringM workspace details page.":::
   The recommended settings for Windows and Linux are also listed.  Expand **Windows files**, **Registry**, and **Linux files** to see the full list of recommended items.

1. Clear the checkboxes for any recommended entities you don't want to be monitored by file integrity monitoring.

1. Select **Apply file integrity monitoring** to enable file integrity monitoring.

You can change the settings at any time. Learn more about [editing monitored entities](#edit-monitored-entities).

### Disable file integrity monitoring

File integrity monitoring uses the Azure Monitor Change Tracking solution to track and identify changes in your environment. By disabling file integrity monitoring, you remove the Change Tracking solution from selected workspace.

1. From the **File Integrity Monitoring dashboard** for a workspace, select **Disable**.

    :::image type="content" source="./media/file-integrity-monitoring-overview/disable-file-integrity-monitoring.png" alt-text="Screenshot of disabling file integrity monitoring from the settings page.":::

1. Select **Remove**.

## Monitor workspaces, entities, and files

### Audit monitored workspaces

The **File integrity monitoring** dashboard displays for workspaces where file integrity monitoring is enabled. The file integrity monitoring dashboard opens after you enable on a workspace or when you select a workspace in the **file integrity monitoring** window that already has file integrity monitoring enabled.

:::image type="content" source="./media/file-integrity-monitoring-overview/fim-dashboard.png" alt-text="Screenshot of the file integrity monitoring dashboard and its various informational panels.":::

The file integrity monitoring dashboard for a workspace displays the following details:

- Total number of machines connected to the workspace
- Total number of changes that occurred during the selected time period
- A breakdown of change type (files, registry)
- A breakdown of change category (modified, added, removed)

Select **Filter** at the top of the dashboard to change the time period for which changes are shown.

:::image type="content" source="./media/file-integrity-monitoring-overview/dashboard-filter.png" alt-text="Screenshot of time period filter for the file integrity monitoring dashboard.":::

The **Servers** tab lists the machines reporting to this workspace. For each machine, the dashboard lists:

- Total changes that occurred during the selected period of time
- A breakdown of total changes as file changes or registry changes

When you select a machine, the query appears along with the results that identify the changes made during the selected time period for the machine. You can expand a change for more information.

:::image type="content" source="./media/file-integrity-monitoring-overview/query-machine-changes.png" alt-text="Screenshot of log Analytics query showing the changes identified by Microsoft Defender for Cloud's file integrity monitoring." lightbox="./media/file-integrity-monitoring-overview/query-machine-changes.png":::

The **Changes** tab (shown below) lists all changes for the workspace during the selected time period. For each entity that was changed, the dashboard lists the:

- Machine that the change occurred on
- Type of change (registry or file)
- Category of change (modified, added, removed)
- Date and time of change

:::image type="content" source="./media/file-integrity-monitoring-overview/changes-tab.png" alt-text="Screenshot of Microsoft Defender for Cloud's file integrity monitoring changes tab." lightbox="./media/file-integrity-monitoring-overview/changes-tab.png":::

**Change details** opens when you enter a change in the search field or select an entity listed under the **Changes** tab.

:::image type="content" source="./media/file-integrity-monitoring-overview/change-details.png" alt-text="Screenshot of Microsoft Defender for Cloud's file integrity monitoring showing the details pane for a change." lightbox="./media/file-integrity-monitoring-overview/change-details.png":::

### Edit monitored entities

1. From the **File Integrity Monitoring dashboard** for a workspace, select **Settings** from the toolbar.

    :::image type="content" source="./media/file-integrity-monitoring-overview/file-integrity-monitoring-dashboard-settings.png" alt-text="Screenshot of accessing the file integrity monitoring settings for a workspace." lightbox="./media/file-integrity-monitoring-overview/file-integrity-monitoring-dashboard-settings.png":::

   **Workspace Configuration** opens with tabs for each type of element that can be monitored:

      - Windows registry
      - Windows files
      - Linux Files
      - File content
      - Windows services

      Each tab lists the entities that you can edit in that category. For each entity listed, Defender for Cloud identifies whether file integrity monitoring is enabled (true) or not enabled (false). Edit the entity to enable or disable file integrity monitoring.

    :::image type="content" source="./media/file-integrity-monitoring-overview/file-integrity-monitoring-workspace-configuration.png" alt-text="Screenshot of workspace configuration for file integrity monitoring in Microsoft Defender for Cloud.":::

1. Select an entry from one of the tabs and edit any of the available fields in the **Edit for Change Tracking** pane. Options include:

    - Enable (True) or disable (False) file integrity monitoring
    - Provide or change the entity name
    - Provide or change the value or path
    - Delete the entity

1. Discard or save your changes.

### Add a new entity to monitor

1. From the **File Integrity Monitoring dashboard** for a workspace, select **Settings** from the toolbar.

    The **Workspace Configuration** opens.

1. On the **Workspace Configuration**:

    1. Select the tab for the type of entity that you want to add: Windows registry, Windows files, Linux Files, file content, or Windows services.
    1. Select **Add**.

        In this example, we selected **Linux Files**.

        :::image type="content" source="./media/file-integrity-monitoring-overview/file-integrity-monitoring-add-element.png" alt-text="Screenshot of adding an element to monitor in Microsoft Defender for Cloud's file integrity monitoring." lightbox="./media/file-integrity-monitoring-overview/file-integrity-monitoring-add-element.png":::

1. Select **Add**. **Add for Change Tracking** opens.

1. Enter the necessary information and select **Save**.

### Folder and path monitoring using wildcards

Use wildcards to simplify tracking across directories. The following rules apply when you configure folder monitoring using wildcards:

- Wildcards are required for tracking multiple files.
- Wildcards can only be used in the last segment of a path, such as `C:\folder\file` or `/etc/*.conf`
- If an environment variable includes a path that isn't valid, validation succeeds but the path fails when inventory runs.
- When setting the path, avoid general paths such as `c:\*.*`, which results in too many folders being traversed.

## Compare baselines using File Integrity Monitoring

File integrity monitoring informs you when changes occur to sensitive areas in your resources, so you can investigate and address unauthorized activity. File integrity monitoring monitors Windows files, Windows registries, and Linux files.

### Enable built-in recursive registry checks

The file integrity monitoring registry hive defaults provide a convenient way to monitor recursive changes within common security areas.  For example, an adversary might configure a script to execute in LOCAL_SYSTEM context by configuring an execution at startup or shutdown.  To monitor changes of this type, enable the built-in check.

![Registry.](./media/file-integrity-monitoring-enable-log-analytics/baselines-registry.png)

>[!NOTE]
> Recursive checks apply only to recommended security hives and not to custom registry paths.

### Add a custom registry check

File integrity monitoring baselines start by identifying characteristics of a known-good state for the operating system and supporting application.  For this example, we'll focus on the password policy configurations for Windows Server 2008 and higher.

|Policy Name                 | Registry Setting|
|----------------------------|-----------------|
|Domain controller: Refuse machine account password changes| MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\RefusePasswordChange|
|Domain member: Digitally encrypt or sign secure channel data (always)|MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\RequireSignOrSeal|
|Domain member: Digitally encrypt secure channel data (when possible)|MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\SealSecureChannel|
|Domain member: Digitally sign secure channel data (when possible)|MACHINE\System\CurrentControlSet\Services   \Netlogon\Parameters\SignSecureChannel|
|Domain member: Disable machine account password changes|MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\DisablePasswordChange|
|Domain member: Maximum machine account password age|MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\MaximumPasswordAge|
|Domain member: Require strong (Windows 2000 or later) session key|MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\RequireStrongKey|
|Network security: Restrict NTLM:  NTLM authentication in this domain|MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\RestrictNTLMInDomain|
|Network security: Restrict NTLM: Add server exceptions in this domain|MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\DCAllowedNTLMServers|
|Network security: Restrict NTLM: Audit NTLM authentication in this domain|MACHINE\System\CurrentControlSet\Services  \Netlogon\Parameters\AuditNTLMInDomain|

> [!NOTE]
> To learn more about registry settings supported by various operating system versions, refer to the [Group Policy Settings reference spreadsheet](https://www.microsoft.com/download/confirmation.aspx?id=25250).

Monitor registry baselines:

1. In the **Add Windows Registry for Change Tracking** window, select the **Windows Registry Key** text box.
1. Enter the following registry key:

    ```reg
    HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters
    ```

    :::image type="content" source="./media/file-integrity-monitoring-enable-log-analytics/baselines-add-registry.png" alt-text="Screenshot of enable file integrity monitoring on a registry.":::

### Track changes to Windows files

1. In the **Add Windows File for Change Tracking** window, in the **Enter path** text box, enter the folder that contains the files that you want to track.
In the example in the following figure, **Contoso Web App** resides in the D:\ drive within the **ContosWebApp** folder structure.

1. Create a custom Windows file entry by providing a name of the setting class, enabling recursion, and specifying the top folder with a wildcard (*) suffix.

    :::image type="content" source="./media/file-integrity-monitoring-enable-log-analytics/baselines-add-file.png" alt-text="Screenshot of enable file integrity monitoring on a file.":::

### Retrieve change data

File Integrity Monitoring data resides within the Azure Log Analytics/ConfigurationChange table set.

1. Set a time range to retrieve a summary of changes by resource.

    In the following example, we're retrieving all changes in the last 14 days in the categories of registry and files:

    ```kusto
    ConfigurationChange
    | where TimeGenerated > ago(14d)
    | where ConfigChangeType in ('Registry', 'Files')
    | summarize count() by Computer, ConfigChangeType
    ```

1. To view details of the registry changes:

    1. Remove **Files** from the **where** clause.
    1. Remove the summarization line and replace it with an ordering clause:

    ```kusto
    ConfigurationChange
    | where TimeGenerated > ago(14d)
    | where ConfigChangeType in ('Registry')
    | order by Computer, RegistryKey
    ```

Reports can be exported to CSV for archival and/or channeled to a Power BI report.

![File integrity monitoring data.](./media/file-integrity-monitoring-enable-log-analytics/baselines-data.png)

<!--Image references-->
[3]: ./media/file-integrity-monitoring-overview/enable.png
[4]: ./media/file-integrity-monitoring-overview/upgrade-plan.png

