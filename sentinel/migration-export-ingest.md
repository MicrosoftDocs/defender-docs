---
title: "Microsoft Sentinel migration: Ingest data into target platform"
description: Learn how to ingest historical data into your selected target platform.
author: EdB-MSFT
ms.author: edbaynash
ms.topic: how-to
ms.date: 06/15/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014


#Customer intent: As a data engineer, I want to ingest historical data into my target platform so that I can ensure seamless data migration and integration for analysis and reporting.

---

# Ingest historical data into your target platform

In previous articles, you [selected a target platform for your historical data](migration-ingestion-target-platform.md). You also selected [a data transfer tool for migration ingestion](migration-ingestion-tool.md) and stored the historical data in a staging location. You can now start to ingest the data into the target platform. 

This article describes how to ingest your historical data into your selected target platform.

## Export data from the legacy SIEM

In general, SIEMs can export or dump data to a file in your local file system, so you can use this method to extract the historical data. It’s also important to set up a staging location for your exported files. The tool you use to transfer the data ingestion can copy the files from the staging location to the target platform. For information about the tools you can use for data ingestion, see [Select a target Microsoft platform to host the exported historical data](migration-ingestion-target-platform.md).

This diagram shows the high-level export and ingestion process.  

:::image type="content" source="media/migration-export-ingest/export-data.png" alt-text="Diagram illustrating steps involved in export and ingestion." lightbox="media/migration-export-ingest/export-data.png" border="false":::

To export data from your current SIEM, see one of the following sections:

- [Export data from ArcSight](migration-arcsight-historical-data.md)
- [Export data from Splunk](migration-splunk-historical-data.md)
- [Export data from QRadar](migration-qradar-historical-data.md)

## Ingest data to Microsoft Sentinel data lake

Microsoft Sentinel data lake is the native data layer of the Microsoft Sentinel platform. It's the simplest path to a unified, queryable history of your security data inside Microsoft Sentinel and the recommended platform for long-term data retention.

To ingest your historical data into Microsoft Sentinel data lake (option 1 in the [diagram above](#export-data-from-the-legacy-siem)) use the [Custom Log Ingestion tool](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal).

## Ingest to Azure Data Explorer

To ingest your historical data into Azure Data Explorer (ADX) (option 2 in the [diagram above](#export-data-from-the-legacy-siem)):

1. [Install and configure LightIngest](/azure/data-explorer/lightingest) on the system where logs are exported, or install LightIngest on another system that has access to the exported logs. LightIngest supports Windows only. 
1. If you don't have an existing ADX cluster, create a new cluster and copy the connection string. Learn how to [set up ADX](/azure/data-explorer/create-cluster-database-portal).
1. In ADX, create tables and define a schema for the CSV or JSON format (for QRadar). Learn how to create a table and define a schema [with sample data](/azure/data-explorer/ingest-sample-data) or [without sample data](/azure/data-explorer/one-click-table).  
1. [Run LightIngest](/azure/data-explorer/lightingest#run-lightingest) with the folder path that includes the exported logs as the path, and the ADX connection string as the output. When you run LightIngest, ensure that you provide the target ADX table name, that the argument pattern is set to `*.csv`, and the format is set to `.csv` (or `json` for QRadar).

## Ingest to Azure Blob Storage

To ingest your historical data into Azure Blob Storage (option 3 in the [diagram above](#export-data-from-the-legacy-siem)):

1. [Install and configure AzCopy](/azure/storage/common/storage-use-azcopy-v10) on the system to which you exported the logs. Alternatively, install AzCopy on another system that has access to the exported logs.  
1. [Create an Azure Blob Storage account](/azure/storage/common/storage-account-create) and copy the authorized [Microsoft Entra ID](/azure/storage/common/storage-use-azcopy-v10#option-1-use-azure-active-directory) credentials or [Shared Access Signature](/azure/storage/common/storage-use-azcopy-v10#option-2-use-a-sas-token) token.   
1. [Run AzCopy](/azure/storage/common/storage-use-azcopy-v10#run-azcopy) with the folder path that includes the exported logs as the source, and the Azure Blob Storage connection string as the output.

<a name="next-steps"></a>
## Next step

Now that you ingested historical data into your target platform, convert your dashboards to workbooks.

> [!div class="nextstepaction"]
> [Convert your dashboards to workbooks](migration-convert-dashboards.md)
