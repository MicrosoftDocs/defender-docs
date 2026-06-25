---
title: "Microsoft Sentinel migration: Select a target Microsoft platform to host exported data"
description: Compare Microsoft target platforms for hosting historical data during a Microsoft Sentinel migration, with guidance on when to choose Microsoft Sentinel data lake, Azure Data Explorer, or Azure Blob Storage.
author: EdB-MSFT
ms.author: edbaynash
ms.topic: how-to
ms.date: 05/27/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014

#Customer intent: As a data engineer, I want to compare Microsoft target platforms for historical data migration so that I can select the most suitable option based on performance, cost, usability, and management overhead.

---

# Select a target Microsoft platform to host the exported historical data

One of the important decisions you make during your migration process is where to store your historical data. To decide where to store your historical data, you need to understand and compare the various target platforms. 

This article compares target platforms in terms of performance, cost, usability and management overhead.

> [!NOTE]
> The considerations in this article apply only to historical log migration. They don't apply to other scenarios, such as long-term retention of operational data.

## Recommended path: Microsoft Sentinel data lake

For most new migrations, we recommend that you store your historical data in [Microsoft Sentinel data lake](/azure/sentinel/datalake/sentinel-lake-overview), the native data layer of the Microsoft Sentinel platform. The data lake gives you:

- **Cost-effective long-term retention.** Keep up to 12 years of security data in a single, open-format (Parquet) store, without choosing between coverage and cost.
- **A single copy of your data.** Data in the analytics tier is mirrored to the lake tier, so you don't pay to maintain duplicate copies for hunting and investigation.
- **Native Sentinel and Defender integration.** Hunt, investigate, and run analytics against historical data directly from the Microsoft Defender portal—no separate cluster or proxy to manage.
- **Multiple analytics engines.** Use KQL for ad-hoc queries and Jupyter notebooks with Python and machine learning libraries for deeper analysis, forensics, and anomaly detection.
- **A fully managed service.** You don't deploy, scale, or patch infrastructure.

Choose Microsoft Sentinel data lake when you want the simplest path to a unified, queryable history of your security data inside Microsoft Sentinel.

To learn more, see [What is Microsoft Sentinel data lake?](/azure/sentinel/datalake/sentinel-lake-overview) and [Onboard to Microsoft Sentinel data lake](/azure/sentinel/datalake/sentinel-lake-onboarding).

## Alternative target platforms

Microsoft Sentinel data lake is the recommended target for most customers, but other platforms remain valid for specific scenarios. Use the comparison in this section when you have an existing investment in Azure Data Explorer (ADX) or Azure Blob Storage, or when a particular scenario isn't yet covered by the data lake.

|  |[Microsoft Sentinel data lake](/azure/sentinel/datalake/sentinel-lake-overview) |[Azure Data Explorer (ADX)](/azure/data-explorer/data-explorer-overview)  |[Azure Blob Storage](/azure/storage/blobs/storage-blobs-overview) |
|---------|---------|---------|---------|
|**Capabilities**: |• Purpose-built security data lake integrated with Microsoft Sentinel and the Defender portal.<br>• Single copy of data in the analytics and lake tiers.<br>• Up to 12 years of retention in open Parquet format.<br>• Query with KQL and Jupyter notebooks (Python + machine learning libraries).<br>• Promote data on demand back to the analytics tier when you need full SIEM capabilities. |• ADX and Microsoft Sentinel both use Kusto Query Language (KQL), so you can query, aggregate, or correlate data in both platforms. For example, you can run a KQL query from Microsoft Sentinel to [join data stored in ADX with data stored in Log Analytics](/azure/azure-monitor/logs/azure-monitor-data-explorer-proxy).<br>• With ADX, you have substantial control over the cluster size and configuration. For example, you can create a larger cluster to achieve higher ingestion throughput, or a smaller cluster to control your costs. |• Blob storage is optimized for storing massive amounts of unstructured data.<br>• Offers competitive costs.<br>• Suitable when your organization doesn't prioritize accessibility or performance, such as when you need to meet compliance or audit requirements. |
|**Usability**:     |**Great**<br><br>Query and investigate historical data directly from the Microsoft Defender portal with the same KQL experience you already use for Sentinel. Notebooks provide a familiar interface for advanced analysis. |**Good**<br><br>Fairly easy to use in the context of Microsoft Sentinel. For example, you can use an Azure workbook to visualize data spread in Microsoft Sentinel and ADX. You can also query ADX data from the Microsoft Sentinel portal using the [ADX proxy](/azure/azure-monitor/logs/azure-monitor-data-explorer-proxy).  |**Poor**<br><br>With historical data migrations, you might have to deal with millions of files, and exploring the data becomes a challenge. |
|**Management overhead**:     |**Fully managed**<br><br>Microsoft manages the data lake infrastructure, scaling, and patching. You don't run a cluster or maintain storage accounts. |**High**<br><br>ADX is external to Microsoft Sentinel and requires monitoring and maintenance.        |**Low**<br><br>The platform itself requires little maintenance, but you still need to set up monitoring and configuration tasks, such as lifecycle management. |
|**Performance**:     |**High**<br><br>The data lake separates storage from compute and supports multiple analytics engines, so you can scale query workloads independently from ingestion. Promote data to the analytics tier when you need interactive SIEM performance. |**High to low**<br><br>• ADX query performance depends on the number of nodes in the cluster, the cluster virtual machine SKU, data partitioning, and more.<br>• As you add nodes to the cluster, performance improves at added cost.<br>• If you use ADX, we recommend that you size your cluster to balance performance and cost based on your organization's needs, including how fast your migration needs to complete, how often the data is accessed, and the expected response time.         |**Low**<br><br>Offers two performance tiers: Premium or Standard. Both are an option for long-term storage, but Standard is more cost-efficient. Learn about [performance and scalability limits](/azure/storage/common/scalability-targets-standard-account). |
|**Cost**:     |**Low to medium**<br><br>Pay for storage in the lake tier plus on-demand compute for KQL jobs and notebooks. The single-copy model avoids duplicate storage charges in Sentinel and the lake. See [Microsoft Sentinel data lake billing](/azure/sentinel/datalake/sentinel-mcp-billing) for details. |**High to low**<br><br>• ADX is a cluster of virtual machines, so you're charged based on compute, storage, and networking usage, plus an ADX markup (see the [pricing details](https://azure.microsoft.com/pricing/details/data-explorer/)). The more nodes you add and the more data you store, the higher the cost.<br>• ADX also offers autoscaling to adapt to demand and benefits from Reserved Instance pricing. You can run your own cost calculations in the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/).         |**Low**<br><br>With optimal setup, Azure Blob Storage has the lowest costs. For greater efficiency and cost savings, use [Azure Storage lifecycle management](/azure/storage/blobs/lifecycle-management-overview) to automatically move older blobs into cheaper storage tiers. |
|**How to access data**:     |KQL queries and Jupyter notebooks from the Microsoft Defender portal; promote data back to the analytics tier when needed. |Direct KQL queries         | KQL [***externaldata*** operator](/kusto/query/externaldata-operator?view=microsoft-sentinel&preserve-view=true) |
|**Scenario**:     |**Recommended default**<br><br>Use for most new migrations when you want long-term retention, integrated investigation, and advanced analytics inside Microsoft Sentinel without managing infrastructure. |**Frequent access**<br><br>Relevant when you need to access the data frequently and need to control how the cluster is sized and configured.         |**Compliance/audit**<br><br>• Optimal for storing massive amounts of unstructured data.<br>• Relevant when you don't need quick access to the data or high performance, such as for compliance or audit purposes. |
|**Complexity**:     |Low         |Medium         |Low |

## General considerations

After you review the platform comparison, use the following factors to finalize your decision.

- [How will your organization use the ingested logs?](#use-of-ingested-logs)
- [How fast does the migration need to run?](#migration-speed)
- [What is the amount of data to ingest?](#amount-of-data)
- What are the estimated migration costs, during and after migration?

### Use of ingested logs

Define how your organization will use the ingested logs to guide your selection of the ingestion platform.

Consider these three general scenarios:

- Your organization needs to keep the logs only for compliance or audit purposes. In this case, your organization rarely accesses the data. Even when your organization accesses the data, high performance and ease of use aren't a priority.
- Your organization needs to retain the logs so that your teams can access them easily and fairly quickly.
- Your organization needs to retain the logs so that your teams can access them occasionally. Performance and ease of use are secondary.

In most of these scenarios, Microsoft Sentinel data lake is the recommended target. Review the [platform comparison](#alternative-target-platforms) when one of the alternative platforms fits an existing investment or a specialized requirement.

### Migration speed

In some scenarios, you have to meet a tight deadline. For example, your organization might need to urgently move from a previous SIEM because of a license expiration event.

Review the components and factors that determine migration speed: data source, compute power, and target platform.
- [Data source](#data-source)
- [Compute power](#compute-power)
- [Target platform](#target-platform)

#### Data source

The data source is typically a local file system or cloud storage, such as Amazon S3. A server's storage performance depends on multiple factors, including disk technology (SSD vs HDD), the nature of the IO requests, and the size of each request.

For example, Azure virtual machine performance ranges from 30 MB per second on smaller VM SKUs to 20 GB per second for some of the storage-optimized SKUs that use NVM Express (NVMe) disks. Learn how to [design your Azure VM for high storage performance](/azure/virtual-machines/premium-storage-performance). You can also apply most of these concepts to on-premises servers.

#### Compute power

In some cases, even if your disk is capable of copying your data quickly, compute power is the bottleneck in the copy process. When compute power is the bottleneck, you can choose one of these scaling options: 

- **Scale vertically.** Increase the power of a single server by adding more CPUs or increasing the CPU speed.
- **Scale horizontally.** Add more servers, which increases the parallelism of the copy process.

#### Target platform

Azure Monitor Basic Logs, Azure Data Explorer, and Azure Blob Storage each have a different performance profile.

- **Microsoft Sentinel data lake.** The data lake is designed for high-throughput ingestion of large volumes of security data. Because storage and compute are separated, ingestion scales independently from query workloads. For service limits, see [Microsoft Sentinel data lake service limits](/azure/sentinel/datalake/sentinel-lake-service-limits).
- **Azure Data Explorer.** Ingestion performance varies depending on the size of the cluster you provision and the batching settings you apply. [Learn about ingestion best practices](/azure/data-explorer/ingestion-faq), including performance and monitoring.
- **Azure Blob Storage.** The performance of an Azure Blob Storage account can vary greatly depending on the number and size of the files, job size, concurrency, and other factors. [Learn how to optimize AzCopy performance with Azure Storage](/azure/storage/common/storage-use-azcopy-optimize).

### Amount of data

The amount of data is the main factor that affects the duration of the migration process. You should therefore consider how to set up your environment based on your data set.

To determine the minimum duration of the migration and where the bottleneck could be, consider the amount of data and the ingestion speed of the target platform. For example, if you select a target platform that can ingest 1 GB per second and you have to migrate 100 TB, your migration takes a minimum of 100,000 GB divided by 1 GB per second. Divide the result by 3,600 and the migration takes at least 27 hours. This calculation is correct only when the rest of the components in the pipeline—such as the local disk, the network, and the virtual machines—can perform at a speed of 1 GB per second.

## Related content

[Select a data ingestion tool](migration-ingestion-tool.md)
