---
title: Get started with custom graphs in Microsoft Sentinel
description: Learn how to create and manage custom graphs in Microsoft Sentinel to model attack patterns, investigate threats, and run advanced graph algorithms.
author: EdB-MSFT
ms.author: edbaynash
ms.date: 11/17/2025
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

#customer intent: As a security researcher, I want to create custom graphs in my tenant so that I can continuously monitor and detect systemic threats.





Sourin Paul

11/14/2025

DRAFT – Do NOT publish



- Note: Do not publish documentation in production. These will be shared with customers as PDF and hosted internally in **aka.ms/customgraphs (TBD)**
---



## Get started with custom graphs in Microsoft Sentinel

Custom graphs in Microsoft Sentinel allow security researchers and analysts to create tailored graph representations of their security data. By building custom graphs, you can model specific attack patterns, investigate threats, and run advanced graph algorithms to uncover hidden relationships within your digital environment. This guide will walk you through the steps to create and manage custom graphs using Jupyter notebooks in the Microsoft Sentinel Visual Studio Code extension.

### Prerequisites

#### Onboard to Microsoft Sentinel graph

To create custom graphs, you must be onboarded to Microsoft Sentinel data lake. For more information, see [Onboard to Microsoft Sentinel data lake](sentinel-lake-onboard-defender.md).

#### Permissions

To interact with custom graphs, you need the following XDR permissions in Sentinel Lake. The following table lists the permission requirements for common graph operations:

| Graph operation| Permissions required|
|---------------------|-------------------------|
| Create and query an ephemeral graph | Use a [custom Microsoft Defender XDR unified RBAC role with *data (manage)*](https://aka.ms/data-lake-custom-urbac) permissions over the Microsoft Sentinel data collection. |
| Materialize a graph in tenant | Use one of the following Microsoft Entra ID roles:<br>[Security operator](/entra/identity/role-based-access-control/permissions-reference#security-operator)<br>[Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator)<br>[Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) |
| Query a materialized graph | Use a [custom Microsoft Defender XDR unified RBAC role with *security data basics (read)*](/defender-xdr/custom-permissions-details) permissions over the Microsoft Sentinel data collection. |

Microsoft Entra ID roles provide broad access across all workspaces in the data lake. For more information, see [Roles and permissions in Microsoft Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/roles#roles-and-permissions-for-the-microsoft-sentinel-data-lake).

#### Install Visual Studio Code and the Microsoft Sentinel extension 

Custom graphs are created using Jupyter notebooks in the Microsoft Sentinel Visual Studio Code extension. For more information see[Install Visual Studio Code and the Microsoft Sentinel extension ](notebooks.md#install-visual-studio-code-and-the-microsoft-sentinel-extension)

## Create a custom graph 

>>>>>>>>>> Important: All screenshots must be updated before our final release.

Creating and working with custom graphs involves the following steps
1. Create an ephemeral graph
1. Materialize the graph in your tenant
1. View and manage materialized graphs


### Create an ephemeral graph

Create a ephemeral graph using a Jupyter notebook in the Microsoft Sentinel Visual Studio Code extension. 




1.  Select the ‘+’ (Create a Graph) icon to create a graph

:::image type="content" source="media/custom-graphs/image1.gif" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

2.  Select “Notebook sample” to create a graph

> \<Screenshot TBD\>

3.  Choose a graph sample to get started

> \<Screenshot TBD\>

4.  The sample notebook walks you through a step-by-step process to create your first graph. Once familiar, you could create new Jupyter notebooks to create graphs.

:::image type="content" source="media/custom-graphs/image2.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

5.  Select the “Graph” kernel so you can access the MicrosoftSentinelGraphProvider library.

:::image type="content" source="media/custom-graphs/image3.png" alt-text="A screenshot of a computer":::

*** Note***

- *Selecting the kernel starts the Spark session and runs the code in the notebook. After selecting the pool, it can take 3-5 mins for the session to start. Subsequent runs are faster as you will have an active session.*

- *The graph libraries are only available in the “Graph” kernel to ensure existing notebook jobs in your environment remain operational.*

6.  Run the first cell in the template, to ensure you can access the latest graph libraries

:::image type="content" source="media/custom-graphs/image4.png" alt-text="A screenshot of a computer program AI-generated content may be incorrect.":::

7.  You can run through the remaining cells in the sample, or refer to [Microsoft Sentinel Graph Provider library](#microsoft-sentinel-graph-provider-reference) to interactively build graphs

8.  Once graph is built, you can query your graph using the below code sample in a cell

:::image type="content" source="media/custom-graphs/image5.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::  
  
  
//////Code block:

\# This shows a sample of 100 elements from the graph as a visual. You can control the sample size with the limit parameter Ex: my_graph.show(limit=50).

my_graph.show()

Congratulations! You have created your first custom graph.

### Materialize graph in your tenant

Once you have created a graph and want to persist it, you can simply store the graph in tenant.

1.  While in the graph notebook, select **Create Scheduled Job**

> :::image type="content" source="media/custom-graphs/image6.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

2.  In the “**Create graph job**” form, enter the **Graph name** and **Description**, and verify the correct graph notebook is included in **Path**.

:::image type="content" source="media/custom-graphs/image7.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

3.  To build the graph without configuring refresh schedule, select **On demand** in the **Schedule** section, then select **Submit** to create the graph.

4.  Alternatively, to customize how often graph data is refreshed, select **Scheduled** in the **Schedule** section.

    1.  Select a **Repeat frequency** for the job. You can choose from **By the minute**, **Hourly**, **Weekly**, **Daily**, or **Monthly**.

    2.  Additional options are displayed to configure the schedule, depending on the frequency you select. For example day of the week, time of day, or day of the month.

    3.  Select a **Start on** time for the schedule to start running.

    4.  Select an **End on** time for the schedule to stop running. If you don't want to set an end time for the schedule, select **Set job to run indefinitely**. Dates and times are in the user's timezone.

    5.  Select **Submit** to save the job configuration and publish the job.

> :::image type="content" source="media/custom-graphs/image8.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

This will initiate the graph building process in your tenant. You can now view the newly created graph and its latest status in the Sentinel extension.

### Viewing and managing materialized graphs

1.  In Microsoft Sentinel extension, select Graphs -\> Custom Graphs -\> and your materialized graph

:::image type="content" source="media/custom-graphs/image9.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

2.  In **Graph details** -\> **Status** field shows the latest status of a graph. Once graph building process is complete, status will change to **‘Ready”**.

:::image type="content" source="media/custom-graphs/image10.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

3.  You can now query the graph in the Query Editor tab.

:::image type="content" source="media/custom-graphs/image11.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

You can learn more about GQL query language \<here\>

For sample graph notebooks that demonstrate how to build graphs from Microsoft Sentinel data lake, see “Graph samples” \<link\>





# Appendix:

## Graph samples (TBD)

## Overview of Graph & Sentinel Graph (TBD)
