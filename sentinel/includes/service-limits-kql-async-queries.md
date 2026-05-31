---
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: abhiag
ms.topic: include
ms.date: 05/28/2026
---

## Service parameters and limits for KQL async queries


The following table lists the service parameters and limits for KQL async queries in the Microsoft Sentinel data lake.

> [!NOTE]
> All limits in this table apply **per tenant**. There's no per-user limit. Asynchronous KQL queries share the same rate-limit and concurrency counters as [interactive KQL queries](#service-parameters-and-limits-for-kql-queries-in-the-lake-tier); KQL jobs have their own separate quota.

When either the rate limit or the concurrency limit is exceeded, the request is **rejected** and not queued. The concurrency counter decrements as soon as a running query finishes, and the rate-limit counter resets every minute.

| Category                                       | Parameter/limit                                          |
|------------------------------------------------|----------------------------------------------------------|
| Rate limit per tenant                          | 30 queries per minute (combined with interactive KQL queries)   |
| Concurrency per tenant                         | 10 concurrent queries (combined with interactive KQL queries)   |
| Async query execution timeout                  | 1 hour                                                   |
| Cache duration                                 | 24 hours                                                 |
| Number of times users can fetch cached results | Unlimited                                                |
| Query scope                                    | Multiple workspaces                                      |
| Query time range                               | Up to 12 years                                           |

