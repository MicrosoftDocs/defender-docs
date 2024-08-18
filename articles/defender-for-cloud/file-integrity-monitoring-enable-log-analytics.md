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

In the Defender for Servers plan in Microsoft Defender for Cloud, [file integrity monitoring](file-integrity-monitoring-overview.md) feature provides visibility into machine changes by examining operating system files, Windows registries, application software, and Linux system files to detect suspicious tampering activity such as file and registry modifications.

File integrity monitoring uses Azure Automation change tracking. This article describes how to set up file integrity monitoring with the [Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA))](/azure/automation/change-tracking/overview), so that you can monitor changes directly in Defender for Cloud.

> [!Note]
> - File integrity monitoring using the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) is generally availability (GA).
> - The MMA is set to retire, and file integrity monitoring using the MMA will be deprecated in November 2024.
> - A new version of file integrity monitoring using the Microsoft Defender for Endpoint agent that's integrated by default into Defender for Cloud will be released in August 2024.
> - There's also a preview version of file integrity monitoring using the Azure Monitor Agent (AMA). Support for this version will end when Defender for Endpoint agent support is released.


This article describes how to set up file integrity monitoring with the MMA



## Prerequisites

- [Defender for Servers Plan 2](defender-for-servers-introduction.md) must be enabled.
- With the MMA, file integrity monitoring uploads data to a Log Analytics workspace. Data charges apply, based on the amount of data you upload. Learn more about [Log Analytics pricing](https://azure.microsoft.com/pricing/details/log-analytics/).
- You need Workspace Owner permissions to enable/disable file integrity monitoring. Learn more about [Azure roles for Log Analytics](/services-hub/health/azure-roles#azure-roles). The Reader role can view results.
- File integrity monitoring is supported for Azure VMs, on-premises machines onboarded as Azure Arc VMs, and AWS accounts and GCP projects connected to Defender for Cloud.
- When monitoring SQL Servers, file integrity monitoring might create this account: `NT Service\HealthService`. If you delete the account, it's automatically recreated.
- You can't work with file integrity monitoring using the REST API. It's only available in the Azure portal.



## Enable file integrity monitoring with the MMA

1. In Defender for Cloud open **Workload protections**.
1. In the **Advanced protection** area, select **File integrity monitoring**.

   :::image type="content" source="./media/file-integrity-monitoring-overview/open-file-integrity-monitoring.png" alt-text="Screenshot of screenshot of opening the File Integrity Monitoring dashboard." lightbox="./media/file-integrity-monitoring-overview/open-file-integrity-monitoring.png":::

1. Review workspace information.

    - Total number of changes that occurred in the last week (you might see a dash "-“ if file integrity monitoring isn't enabled on the workspace)
    - Total number of computers and VMs reporting to the workspace
    - Geographic location of the workspace
    - Azure subscription that the workspace is under

    If there's no enable or upgrade button, and the space is blank for a workspace, it means that file integrity monitoring is already enabled on the workspace.

    :::image type="content" source="./media/file-integrity-monitoring-overview/workspace-list-fim.png" alt-text="Screenshot of enabling file integrity monitoring for a specific workspace.":::


1. Enable Defender for Cloud plans if needed.

    The ![Upgrade plan icon.][4] indicates that the workspace or subscription isn't protected with the Defender for Servers plan. Defender for Servers Plan 2 must be enabled to use file integrity monitoring features. Learn [how to enable Defender for Servers](plan-defender-for-servers-select-plan.md).

1. Select the ![Enable icon][3] to turn on file integrity monitoring for a workspace.
1. Review the workspace details, including the number of Windows and Linux machines in the workspace.
1. Expand **Windows files**, **Registry**, and **Linux files** to see the full list of recommended items.

    :::image type="content" source="./media/file-integrity-monitoring-overview/workspace-fim-status.png" alt-text="Screenshot of file integrity monitoringM workspace details page.":::
   The recommended settings for Windows and Linux are also listed.  

1. Clear the checkboxes for any recommended entities you don't want to monitor for changes.

1. Select **Apply file integrity monitoring** to enable file integrity monitoring.

You can change the settings at any time.

### Disable file integrity monitoring

When you disable file integrity monitoring, you remove the Change Tracking solution from the selected Log Analytics workspace.

1. In Defender for Cloud open **Workload protections**.
1. In the **Advanced protection** area, select **File integrity monitoring**.
1. Select a workspace with file integrity monitoring enabled.
1. In the **File Integrity Monitoring** page for the workspace, select **Disable**.

    :::image type="content" source="./media/file-integrity-monitoring-overview/disable-file-integrity-monitoring.png" alt-text="Screenshot of disabling file integrity monitoring from the settings page.":::

1. Select **Remove**.

## Monitor changes

### Audit monitored workspaces

1. In Defender for Cloud open **Workload protections**.
1. In the **Advanced protection** area, select **File integrity monitoring**.
1. Select a workspace with file integrity monitoring enabled.
1. In the **File Integrity Monitoring** page for the workspace, review changes, including:

    - Total number of machines connected to the workspace
    - Total number of changes that occurred during the selected time period
    - A breakdown of change type (files, registry)
    - A breakdown of change category (modified, added, removed)

:::image type="content" source="./media/file-integrity-monitoring-overview/fim-dashboard.png" alt-text="Screenshot of the file integrity monitoring dashboard and its various informational panels.":::

1. Select **Filter** at the top of the dashboard to change the time period for which changes are shown.

:::image type="content" source="./media/file-integrity-monitoring-overview/dashboard-filter.png" alt-text="Screenshot of time period filter for the file integrity monitoring dashboard.":::

1. On the **Servers** tab, review the machines reporting to this workspace. For each machine, the dashboard lists:

    - Total changes that occurred during the selected period of time
    - A breakdown of total changes as file changes or registry changes

1. Select a machine. The query appears along with the results that identify the changes made during the selected time period for the machine. You can expand a change for more information.

    :::image type="content" source="./media/file-integrity-monitoring-overview/query-machine-changes.png" alt-text="Screenshot of log Analytics query showing the changes identified by Microsoft Defender for Cloud's file integrity monitoring." lightbox="./media/file-integrity-monitoring-overview/query-machine-changes.png":::

1. On the **Changes** tab, review all changes for the workspace during the selected time period. For each entity that was changed, you can see:

    - Machine that the change occurred on
    - Type of change (registry or file)
    - Category of change (modified, added, removed)
    - Date and time of change

    :::image type="content" source="./media/file-integrity-monitoring-overview/changes-tab.png" alt-text="Screenshot of Microsoft Defender for Cloud's file integrity monitoring changes tab." lightbox="./media/file-integrity-monitoring-overview/changes-tab.png":::

1. Enter a change in the search field or select an entity listed under the **Changes** tab to open the **Change details** page.

    :::image type="content" source="./media/file-integrity-monitoring-overview/change-details.png" alt-text="Screenshot of Microsoft Defender for Cloud's file integrity monitoring showing the details pane for a change." lightbox="./media/file-integrity-monitoring-overview/change-details.png":::

## Customise monitoring

1. 1. In Defender for Cloud open **Workload protections**.
1. In the **Advanced protection** area, select **File integrity monitoring**.
1. Select a workspace with file integrity monitoring enabled.
1. In the **File Integrity Monitoring** page for the workspace, select **Settings** from the toolbar.

    :::image type="content" source="./media/file-integrity-monitoring-overview/file-integrity-monitoring-dashboard-settings.png" alt-text="Screenshot of accessing the file integrity monitoring settings for a workspace." lightbox="./media/file-integrity-monitoring-overview/file-integrity-monitoring-dashboard-settings.png":::

1. In **Workspace Configuration** review elements that can be modified under the tabs: Windows registry, Windows files, Linux files, File content, Windows services.

    :::image type="content" source="./media/file-integrity-monitoring-overview/file-integrity-monitoring-workspace-configuration.png" alt-text="Screenshot of workspace configuration for file integrity monitoring in Microsoft Defender for Cloud.":::

1. Select an entry from one of the tabs and edit any of the available fields in the **Edit for Change Tracking** pane. Options include:

    - Enable (True) or disable (False) file integrity monitoring
    - Provide or change the entity name
    - Provide or change the value or path
    - Delete the entity

1. Discard or save changes.

### Monitor folders and paths using wildcards

Use wildcards to simplify tracking across directories. The following rules apply when you configure folder monitoring using wildcards:

- Wildcards are required for tracking multiple files.
- Wildcards can only be used in the last segment of a path, such as `C:\folder\file` or `/etc/*.conf`
- If an environment variable includes a path that isn't valid, validation succeeds but the path fails when inventory runs.
- When setting the path, avoid general paths such as `c:\*.*`, which results in too many folders being traversed.

### Add an entity to monitor

1. From the **File Integrity Monitoring** page in a workspace, select **Settings** from the toolbar.

1. On the **Workspace Configuration** select the tab for the type of entity that you want to add: Windows registry, Windows files, Linux Files, file content, or Windows services.
1. Select **Add**. In this example, we selected **Linux Files**.

    :::image type="content" source="./media/file-integrity-monitoring-overview/file-integrity-monitoring-add-element.png" alt-text="Screenshot of adding an element to monitor in Microsoft Defender for Cloud's file integrity monitoring." lightbox="./media/file-integrity-monitoring-overview/file-integrity-monitoring-add-element.png":::

1. In **Add for Change Tracking**, enter the necessary information and select **Save**.


## Compare baselines

File integrity monitoring informs you when changes occur to sensitive areas in your resources, so you can investigate and address unauthorized activity. 

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

