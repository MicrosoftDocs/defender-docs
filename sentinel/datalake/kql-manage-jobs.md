---  
title: Manage KQL jobs
titleSuffix: Microsoft Security  
description: Managing KQL jobs in the Defender portal for Microsoft Sentinel data lake
ms.author: edbaynash  
author: EdB-MSFT  
ms.reviewer: zeinam
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform  
ms.topic: concept-article
ms.date: 06/01/2026
ms.collection: ms-security  

# Customer intent: As a threat hunter, security engineer or an security administrator, I want to manage KQL, notebook and graph jobs in the Microsoft Sentinel data lake.

---  
 
#  Manage jobs in the Microsoft Sentinel data lake 
 
A job is a one-time or scheduled task that runs against data in the Microsoft Sentinel data lake. The **Jobs** page, under **Microsoft Sentinel** > **Data lake exploration** in the Microsoft Defender portal, lists every job in your tenant so you can monitor and manage them from one place.

The data lake supports three job types:

- **KQL jobs** run a Kusto Query Language (KQL) query against the data lake tier and promote the results to the analytics tier. You create them from the **KQL queries** editor or the **Jobs** page. For more information, see [KQL jobs](kql-jobs.md).
- **Notebook jobs** run a notebook on a schedule against data in the lake. You create them from the notebook authoring experience. For more information, see [Notebook jobs](notebook-jobs.md).
- **Graph jobs** run a custom graph built in the Microsoft Sentinel Visual Studio Code extension, either on demand or on a schedule. You create them when you publish or refresh a custom graph. For more information, see [Custom graphs overview](custom-graphs-overview.md) and [Graph jobs](#graph-jobs) in this article.

The Jobs management page provides the following functions:

+ View all jobs in the Microsoft Sentinel data lake, including KQL, notebook, and graph jobs.
+ View a summary of KQL, notebook, and graph jobs.
+ View details of all jobs and apply filter to narrow down the list.
+ View recent job health issues.
+ Create a new job to run a KQL query. For more information on creating jobs, see [Create jobs in the Microsoft Sentinel data lake using KQL](kql-jobs.md). Notebook jobs and graph jobs can't be created from this page.
+ Edit job details for KQL jobs. 
+ Disable a job, preventing it from running until you enable it again.
+ Enable a job, allowing it to run again after being disabled.
+ View job history, including the run times, and statuses of the job.
+ Delete a job, removing it from the list of jobs. This action is permanent and can't be undone.

> [!NOTE]
> Graph jobs and notebook jobs are **view-only** from the Jobs page. To change a graph or notebook job's query, schedule, or pool size, edit and republish the graph or notebook from the VS Code extension. The Jobs page doesn't support create, edit, or delete actions for graph or notebook jobs.


## KQL jobs

A KQL job runs a Kusto Query Language (KQL) query against the data lake tier and writes the results to the analytics tier, either once or on a schedule. You can create KQL jobs in the **KQL queries** editor or from the **Jobs** page. For more information about creating KQL jobs, see [Create jobs in the Microsoft Sentinel data lake using KQL](kql-jobs.md).

The Jobs page supports the full KQL job lifecycle: you can create, edit, enable or disable, view run history for, and delete a KQL job from this page. To find KQL jobs, open the Jobs page and look for rows where the **Job type** column shows **KQL**. For step-by-step procedures, see [Manage jobs](#manage-jobs).

## Notebook jobs

A notebook job is a scheduled run of a notebook against data in the Microsoft Sentinel data lake. Notebook jobs are created from the VS Code extension when you schedule a notebook, not from the Jobs page. For more information about creating, editing, and scheduling notebook jobs, see [Notebook jobs](notebook-jobs.md).

To find notebook jobs, open the Jobs page and look for rows where the **Job type** column shows **Notebook**. Selecting a notebook job opens a details panel that shows:

+ Job name and description.
+ **Job type**: Notebook.
+ Status (enabled or disabled) and most recent run status.
+ Schedule configuration.
+ Last run and next run times.

<!-- TODO: confirm with engineering exactly which fields and actions the notebook job details panel exposes (for example, whether enable/disable and delete are available, and whether the History tab is populated). -->

## Graph jobs

A graph job is a scheduled notebook-based custom graph job in your Microsoft Sentinel data lake tenant. Graph jobs are created when you publish a custom graph from Sentinel VS Code extension or when graphs are subsequently refreshed per your schedule configurations. For more information about creating custom graphs, see [Create custom graphs](create-custom-graphs.md) and [Custom graphs overview](custom-graphs-overview.md).



To find graph jobs, open the Jobs page and look for rows where the **Job type** column shows **Graph**. Selecting a graph job opens a details panel that shows:

+ Job name and description.
+ **Job type**: Graph.
+ Status (enabled or disabled) and most recent run status.
+ Schedule configuration.
+ Pool size.
+ Last run and next run times.

<!-- TODO: confirm with engineering whether the History tab is populated for graph jobs before this section goes live - behavior was uncertain during the docs working session. -->

## Permissions

Microsoft Entra ID roles provide broad access across all workspaces in the data lake. To read tables across all workspaces, write to the analytics tier, and schedule jobs using KQL queries, you must have one of the supported Microsoft Entra ID roles. For more information on roles and permissions, see [Microsoft Sentinel data lake roles and permissions](../roles.md#roles-and-permissions-for-the-microsoft-sentinel-data-lake).


## Manage jobs

The Jobs page shows a list of jobs, including the job name, status, job type, last and next run dates, and the recent job health. You can filter the jobs by status, last run date, and creation date. The **Jobs status** column indicates whether the job is enabled or disabled. The **Job type** column indicates whether the job is a **KQL** job, a **Notebook** job, or a **Graph** job.
  
:::image type="content" source="media/kql-manage-jobs/jobs-page.png" lightbox="media/kql-manage-jobs/jobs-page.png" alt-text="A screenshot showing the jobs page in the Defender portal.":::

The **Recent health issues** column shows whether the job encountered any issues in its recent runs as per the filters. Select the link to view the job's health details.

:::image type="content" source="media/kql-manage-jobs/recent-health-issues.png" lightbox="media/kql-manage-jobs/recent-health-issues.png" alt-text="A screenshot showing the recent health issues panel.":::



To create a job from the jobs page, select **Create a new KQL job**. For more information on creating jobs, see [Create jobs in the Microsoft Sentinel data lake using KQL](kql-jobs.md).

### Job details

To see a job's details, select the job from the table.
The job details panel opens, showing the job's details. You can enable and disable a job, view its history, edit, or delete it.
Select the **Destination table** link to open the table in the KQL query editor in Advanced hunting.  
The query can be copied by selecting **Copy query**.  

:::image type="content" source="media/kql-manage-jobs/manage-job-details.png" alt-text="A screenshot showing the job details page." lightbox="media/kql-manage-jobs/manage-job-details.png":::



### Edit a job

To edit a job, select  **Edit** in the job details panel. The job details panel opens, allowing you to edit the following fields:

+ Job description.
+ KQL query. The query can be updated but must return the same output schema as the original query. For example, you can change the time range in the query, but you can't change the columns returned by the query.
+ Job schedule. You can change the job to run once or on a schedule, or change the schedule.

Select **Next** to continue to the next screen. 

After you edit the job, select **Submit** to save the changes. The job is updated and runs according to the new schedule or query.

> [!NOTE]
> Editing a one-time job immediately triggers its execution.

### View a job's run history

To view the history of a job, select **View history** in the job details panel. The job history panel opens, showing a list of job run times and statuses. The row count reflects the number of rows sent to the destination table in the analytics tier.

:::image type="content" source="media/kql-manage-jobs/job-history.png" lightbox="media/kql-manage-jobs/job-history.png" alt-text="A screenshot showing the job history panel.":::

### Enable or disable a job

To enable or disable a job, select **Enable** or **Disable** in the job details panel. When a job is disabled, it won't run until you enable it again. The status of the job changes to reflect whether it's enabled or disabled.

### Delete a job

To delete a job, select  **Delete** in the job details panel. A confirmation dialog appears, asking you to confirm the deletion. If you confirm, the job is permanently deleted and can't be recovered. You can't delete a running job.


## Considerations and limitations

For information on considerations and limitations when managing KQL jobs in the Microsoft Sentinel data lake, see [KQL jobs](kql-jobs.md#considerations-and-limitations).

## Next steps

- [Overview of the Microsoft Sentinel data lake](sentinel-lake-overview.md)
- [Create jobs in the Microsoft Sentinel data lake using KQL](kql-jobs.md)
- [Notebook jobs](notebook-jobs.md)
- [Custom graphs overview](custom-graphs-overview.md)
- [Data lake exploration - KQL queries](kql-queries.md)
- [Microsoft Sentinel data lake roles and permissions](../roles.md#roles-and-permissions-for-the-microsoft-sentinel-data-lake)
