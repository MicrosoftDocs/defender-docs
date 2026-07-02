---
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: abhiag
ms.topic: include
ms.date: 05/28/2026
---

## Service parameters and limits for KQL jobs

The following table lists the service parameters and limits for KQL jobs in the Microsoft Sentinel data lake.

> [!NOTE]
> All limits in this table apply **per tenant**. There's no per-user limit. KQL jobs have their own concurrency quota and don't share counters with KQL queries.

When the concurrent-job-execution limit is exceeded, the request is **rejected** and not queued. The counter decrements as soon as a running job finishes.

| Category                            | Parameter/limit     |
|-------------------------------------|---------------------|
| Concurrent job execution per tenant | 5                   |
| Job query execution timeout         | 1 hour              |
| Jobs per tenant (enabled jobs)      | 100                 |
| Number of output tables per job     | 1                   |
| Query scope                         | Multiple workspaces |
| Query time range                    | Up to 12 years      |
