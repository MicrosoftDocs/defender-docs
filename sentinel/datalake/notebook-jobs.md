---  
title: Create and manage Jupyter notebook jobs
titleSuffix: Microsoft Security  
description: Create and schedule Jupyter notebook jobs in the Microsoft Sentinel extension for Visual Studio Code to automate data processing, analysis, and writing results to custom tables.
ms.author: edbaynash  
author: EdB-MSFT  
ms.reviewer: zeinam
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.topic: how-to  
ms.date: 06/25/2026

# Customer intent: As a security engineer or data scientist, I want to explore and analyze security data in the Microsoft Sentinel data lake using Jupyter notebooks, so that I can gain insights and build advanced analytics solutions.
---

# Create and manage Jupyter notebook jobs
 
You can create scheduled jobs to run at specific times or intervals using the Microsoft Sentinel extension for Visual Studio Code. Jobs allow you to automate data processing tasks to summarize, transform, or analyze data in the Microsoft Sentinel data lake and federated tables. Jobs are also used to process data and write results to custom tables in the lake tier or analytics tier.

This article shows you how to create, schedule, edit, and manage notebook jobs, including configuring job schedules, viewing job details and run history, and monitoring jobs in the Microsoft Defender portal.

<a name="permissions"></a>
## Required permissions for notebook jobs

Microsoft Entra ID roles provide broad access across all workspaces in the data lake. To create and schedule jobs, read tables across all workspaces, write to the analytics and lake tiers, you must have one of the supported Microsoft Entra ID roles. For more information on roles and permissions, see [Roles and permissions in Microsoft Sentinel](../roles.md#roles-and-permissions-for-the-microsoft-sentinel-data-lake).

To create new custom tables in the analytics tier, the data lake managed identity must be assigned the **Log Analytics Contributor** role in the Log Analytics workspace.

To assign the role, follow the steps below:

1. In the Azure portal, navigate to the Log Analytics workspace that you want to assign the role to.
1. Select **Access control (IAM)** in the left navigation pane.
1. Select **Add role assignment**.
1. In the **Role** table, select **Log Analytics Contributor**, then select **Next**
1. Select **Managed identity**, then select **Select members**.
1. Your data lake managed identity is a system assigned managed identity named `msg-resources-<guid>`. Select the managed identity, then select **Select**. 
1. Select **Review and assign**.

For more information on assigning roles to managed identities, see [Assign Azure roles using the Azure portal](/azure/role-based-access-control/role-assignments-portal).

## Create and schedule a job 

You can create a job in one of three ways:

1. In the notebook editor, select **Create schedule Job** from the toolbar.
1. In the **Explorer** pane, right-click the notebook file and select **Microsoft Sentinel**, then select **Create schedule Job**.

    :::image type="content" source="./media/notebook-jobs/create-job.png" lightbox="./media/notebook-jobs/create-job.png" alt-text="A screenshot showing how to create a new job in Visual Studio Code."  :::
1. From the list of jobs, select the **+** icon to create a new job.

    :::image type="content" source="./media/notebook-jobs/create-job-from-toolbar.png" lightbox="./media/notebook-jobs/create-job-from-toolbar.png" alt-text="A screenshot showing how to create a new job from the jobs list in Visual Studio Code."  :::
1. Select **Use existing notebook** to select an existing notebook file, or select **Create new notebook** to create a new notebook file for the job.

    :::image type="content" source="./media/notebook-jobs/new-or-existing-workbook.png" lightbox="./media/notebook-jobs/new-or-existing-workbook.png" alt-text="A screenshot showing how to select an existing notebook for the job."  :::


1. On the **Job configuration** page, in the **Job details** section enter a **name** and **description** for the job.
1. Select the spark pool size to run the job according to your jobs compute needs.
1. To run a job manually without a schedule, select **On demand** in the  **Schedule** section, then select **Submit** to save the job configuration and publish the job.
    
1. To specify a schedule for the job, select **Scheduled** in the **Schedule** section.  
    1. Select a **Repeat frequency** for the job. You can choose from **By the minute**, **Hourly**, **Weekly**, **Daily**, or **Monthly**.
    1. Additional schedule options, such as day of the week, time of day, or day of the month, are displayed depending on the frequency you select.

    1. Select a **Start on** time for the schedule to start running.
    1. Select an **End on** time for the schedule to stop running. If you don't want to set an end time for the schedule, select **Set job to run indefinitely**.
    Dates and times are in the user's timezone.

    1. Select **Submit** to save the job configuration and publish the job.

    :::image type="content" source="./media/notebook-jobs/job-configuration.png" lightbox="./media/notebook-jobs/job-configuration.png" alt-text="A screenshot showing the job configuration page."  :::

1. To view your jobs, select the Microsoft Sentinel ![The Microsoft Sentinel icon in the VS Code left toolbar](./media/notebook-jobs/sentinel-icon.png) icon in the left toolbar. Jobs are displayed on the **Jobs** panel.

1. Select a job to see the job details. 
1. You can run the job immediately by selecting **Run now**, disable and enable the job schedule, or delete the job.

    :::image type="content" source="./media/notebook-jobs/job-details.png" lightbox="./media/notebook-jobs/job-details.png" alt-text="A screenshot showing the job details page."  :::

1. View the job history in the **Run history** tab.

    :::image type="content" source="./media/notebook-jobs/run-history.png" lightbox="./media/notebook-jobs/run-history.png" alt-text="A screenshot showing the job runs page."  :::

1. Select an activity to see more details.
    :::image type="content" source="./media/notebook-jobs/run-details.png" lightbox="./media/notebook-jobs/run-details.png" alt-text="A screenshot showing the job run details page.":::

## Create and manage parameterized notebook jobs

Notebook jobs can use parameters defined in the notebook. Parameters help you reuse the same notebook job with different input values without editing the notebook code each time. For example, you might run the same analysis for different users, entities, time ranges, or other investigation inputs.

Parameterized notebook jobs support three levels of values:

- **Notebook values**: Default parameter values defined in the notebook.
- **Job configuration values**: Values saved with the notebook job and used for scheduled runs.
- **Runtime values**: Values provided when you run the job manually. Runtime values apply only to that job run.

### Create a parameterized notebook job

When you create a notebook job from a notebook that contains parameters, the Microsoft Sentinel extension reads the parameters from the notebook and displays them in the job configuration.

To create a parameterized notebook job:

1. In the notebook, create a code cell near the top of the notebook that contains the parameter defaults. Open the cell menu and select **Mark Cell as Parameters**.

    :::image type="content" source="./media/notebook-jobs/mark-cell-as-parameters.png" lightbox="./media/notebook-jobs/mark-cell-as-parameters.png" alt-text="Screenshot of Visual Studio Code showing the Mark Cell as Parameters menu item for a notebook cell.":::

1. Define the parameters in the cell. For example:

    ```python
    # Parameters
    lookback_days = [7, 14, 30, 90]
    min_failed_attempts = [5, 10, 20]
    ```

1. In the **Explorer** pane, right-click the notebook file, select **Microsoft Sentinel**, and then select **Create Scheduled Job**.

    :::image type="content" source="./media/notebook-jobs/create-scheduled-job-from-notebook.png" lightbox="./media/notebook-jobs/create-scheduled-job-from-notebook.png" alt-text="Screenshot of Visual Studio Code showing the Microsoft Sentinel menu with Create Scheduled Job selected.":::

1. In the job editor, expand **Default parameters**, and then select **Refresh parameters** to load the latest parameter definitions from the notebook.

    :::image type="content" source="./media/notebook-jobs/refresh-notebook-job-parameters.png" lightbox="./media/notebook-jobs/refresh-notebook-job-parameters.png" alt-text="Screenshot of the scheduled notebook job editor showing the Refresh parameters button under Default parameters.":::

1. Review or update the default parameter values, and then submit the job.

You can keep the notebook default values or change the values before you submit the job. Values that you change are saved with the job configuration and used for future scheduled runs.

If a parameter value doesn't match the expected type, the extension shows an inline validation error and prevents you from submitting the job until the error is fixed.

### Add parameters to an existing notebook job

To add parameters to an existing notebook job, download the latest notebook, update the notebook locally to define the parameters, and then edit the job. When you upload or refresh the updated notebook in the job configuration, the parameters are available for the job.

After the parameters are available, you can update their values and submit the job again. Updated parameter values are saved with the job configuration and used for future scheduled runs.

### Refresh parameters from the notebook

If the notebook is updated after the job is created, refresh the job parameters to sync the job configuration with the latest notebook parameters.

Refreshing parameters:

- Adds new parameters that were added to the notebook.
- Removes parameters that were removed from the notebook.
- Preserves existing job configuration values that you changed.

Refreshing parameters doesn't overwrite parameter values that were already edited in the job configuration.

### Reset parameter values

You can reset parameter values to the defaults defined in the notebook.

Use reset for an individual parameter to restore only that value. Use **Reset all** to restore all parameter values to the notebook defaults. When you reset all parameter values, confirm the reset before the values are restored.

### Run with custom runtime parameter values

When you select **Run now** for a parameterized notebook job, the Microsoft Sentinel extension opens a runtime parameters dialog. The dialog is prepopulated with the parameter values saved in the job configuration.

:::image type="content" source="./media/notebook-jobs/run-job-with-parameter-overrides.png" lightbox="./media/notebook-jobs/run-job-with-parameter-overrides.png" alt-text="Screenshot of the Run job dialog showing parameter values that can be changed before running a notebook job.":::

You can keep the saved values or change them for the current run. Runtime parameter changes apply only to that job run and don't update the saved job configuration or future scheduled runs.

Use runtime parameters when you want to reuse the same job for different inputs, such as running the same risk analysis for a different user.

### View job run history

After you run a parameterized notebook job, view the job status and run history the same way you view other notebook job runs. In the **Run history** tab, select a run to see more details.

### Jobs with no parameters

If the selected notebook doesn't define parameters, the job configuration shows an empty parameter state. To add parameters, update the notebook to include parameter definitions, save the notebook, and upload or refresh the job configuration.

## Edit a submitted job

Submitting a job creates a job definition that includes the notebook file, the job configuration, and the schedule. The job definition is uploaded from your VS Code editor and stored in the Microsoft Sentinel data lake. Once submitted, the job is no longer connected to the notebook file on your local file system. If you want to edit the code in the notebook job, you must download the job definition, edit the notebook file, and then resubmit the job.

To edit a submitted job follow the steps below:

1. In the **Jobs** section, select the job you want to edit.
1. Select the **Download** cloud icon to download the job definition to your local file system. In the jobs details editor, you can see the job configuration. You can also select **Download latest notebook**.

    :::image type="content" source="./media/notebook-jobs/edit-download-job.png" lightbox="./media/notebook-jobs/edit-download-job.png" alt-text="A screenshot showing the edit and download job icon in VS Code."  :::

1. Edit the downloaded `ipynb` workbook file to make your changes.

1. Return to the **Job details** tab and select **Edit job**.

1. Edit the job name, description, cluster configuration, and schedule. Changing the job name creates a new job definition when you submit the job.
1. Select **Submit** to upload the updated notebook file and job configuration.

1. A confirmation is displayed when the job is successfully submitted.

    :::image type="content" source="./media/notebook-jobs/edit-job.png" lightbox="./media/notebook-jobs/edit-job.png" alt-text="A screenshot showing the edit jib page in VS Code.":::



## View jobs in the Microsoft Defender portal

In addition to viewing jobs in VS Code, you can also view your notebook jobs in the Defender portal. To view your jobs in the Defender portal, Select **Microsoft Sentinel** > **Data lake exploration** > **Jobs** .

The page shows a list of jobs and their types. Select a notebook job to view its details. You can enable and disable the job's schedule but you can't edit a notebook job in the Defender portal.

:::image type="content" source="media/notebook-jobs/view-jobs-in-defender-portal.png" lightbox="media/notebook-jobs/view-jobs-in-defender-portal.png" alt-text="A screenshot showing the jobs page in the Defender portal.":::

1. Select a job to view the job details.

:::image type="content" source="media/notebook-jobs/portal-job-details.png" lightbox="media/notebook-jobs/portal-job-details.png" alt-text="A screenshot showing the job details in the Defender portal.":::

1. Select **View history** to see the history of job runs.

:::image type="content" source="media/notebook-jobs/portal-job-history.png" lightbox="media/notebook-jobs/portal-job-history.png" alt-text="A screenshot showing the jobs history page in the Defender portal.":::



## Service parameters and limits and troubleshooting

The following sections summarize column naming rules, service limits, and troubleshooting resources for notebook jobs in the Microsoft Sentinel data lake.

### Column names

The following rules apply to column names when using the save_as method to write data from a notebook to the Microsoft Sentinel data lake.

+ Column names must start with a letter.

+ The following standard columns aren't supported for export. The ingestion process overwrites these columns in the destination tier:

    + TenantId
    + _TimeReceived
    + Type
    + SourceSystem
    + _ResourceId
    + _SubscriptionId
    + _ItemId
    + _BilledSize
    + _IsBillable
    + _WorkspaceId

+ `TimeGenerated` is overwritten if it's older than two days. To preserve the original event time, write the source timestamp to a separate column.

For a list of service limits for the Microsoft Sentinel data lake, see [Microsoft Sentinel data lake service limits](notebooks.md#service-parameters-and-limits-for-vs-code-notebooks).  

### Troubleshooting
For troubleshooting notebook jobs and data lake operations, see [Troubleshoot notebooks on the Microsoft Sentinel data lake](notebooks-troubleshooting.md).

## Related content

- [Sample notebooks for Microsoft Sentinel data lake](./notebook-examples.md)
- [Microsoft Sentinel Provider class reference](./sentinel-provider-class-reference.md)
- [Microsoft Sentinel data lake overview](./sentinel-lake-overview.md)
- [Roles and permissions in Microsoft Sentinel](../roles.md#roles-and-permissions-for-the-microsoft-sentinel-data-lake)
