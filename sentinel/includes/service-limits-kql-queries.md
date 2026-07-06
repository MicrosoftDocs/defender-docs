---
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: abhiag
ms.topic: include
ms.date: 05/28/2026
---

## Service parameters and limits for KQL queries in the lake tier

The following service parameters and limits apply when writing queries in the Microsoft Sentinel data lake.

> [!NOTE]
> All limits in this table apply **per tenant**. There's no per-user limit. Interactive KQL queries and [asynchronous KQL queries](#service-parameters-and-limits-for-kql-async-queries) share the same rate-limit and concurrency counters.

When either the rate limit or the concurrency limit is exceeded, the request is **rejected** and not queued. The concurrency counter decrements as soon as a running query finishes, and the rate-limit counter resets every minute.

| Category                       | Parameter/limit                                                                                                                                                                |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Rate limit per tenant          | 30 queries per minute (combined interactive and async)                                                                                                                         |
| Concurrency per tenant         | 10 concurrent queries (combined interactive and async)                                                                                                                         |
| Query result data              | 64 MB. To override the default for a specific query, see [Query limits](/azure/data-explorer/kusto/concepts/querylimits) in the Kusto Query Language reference.                |
| Query result rows              | 500,000 rows. To override the default for a specific query, see [Query limits](/azure/data-explorer/kusto/concepts/querylimits) in the Kusto Query Language reference.         |
| Query scope                    | Multiple workspaces                                                                                                                                                            |
| Query timeout                  | 4 minutes                                                                                                                                                                      |
| Queryable time range           | Up to 12 years, depending on data retention.                                                                                                                                   |
