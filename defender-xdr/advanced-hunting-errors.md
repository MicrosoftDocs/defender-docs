---
title: Handle errors in advanced hunting for Microsoft Defender XDR
description: Understand errors displayed when using advanced hunting
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom:
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: error-reference
ms.date: 01/15/2026
---

# Handle advanced hunting errors

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]



Advanced hunting displays errors to notify you about syntax mistakes and whenever queries reach [predefined quotas and usage parameters](advanced-hunting-limits.md). Refer to the following table for tips on how to resolve or avoid errors.

| Error type | Cause | Resolution | Error message examples |
|--|--|--|--|
| Syntax errors | The query contained unrecognized names, including references to nonexistent operators, columns, functions, or tables. | Ensure references to [Kusto operators and functions](/azure/data-explorer/kusto/query/) are correct. Check [the schema](advanced-hunting-schema-tables.md) for the correct advanced hunting columns, functions, and tables. Enclose variable strings in quotes so they're recognized. While writing your queries, use the autocomplete suggestions from IntelliSense. | `A recognition error occurred.` |
| Semantic errors | While the query uses valid operator, column, function, or table names, there were errors in its structure and resulting logic. In some cases, advanced hunting identifies the specific operator that caused the error. | Check for errors in the structure of query. Refer to [Kusto documentation](/azure/data-explorer/kusto/query/) for guidance. While writing your queries, use the autocomplete suggestions from IntelliSense. |  `'project' operator: Failed to resolve scalar expression named 'x'`|
| Timeouts | A query can only run within a [limited period before timing out](advanced-hunting-limits.md). This error can happen more frequently when running complex queries. | [Optimize the query](advanced-hunting-best-practices.md) | `Query exceeded the timeout period.` |
| CPU throttling | Queries in the same tenant exceeded the [CPU resources](advanced-hunting-limits.md) that were allocated based on tenant size. | The service checks CPU resource usage every 15 minutes and daily and displays warnings after usage exceeds 10% of the allocated quota. If you reach 100% utilization, the service blocks queries until after the next daily or 15-minute cycle. [Optimize your queries to avoid hitting CPU quotas](advanced-hunting-best-practices.md) | `You have exceeded processing resources allocated to this tenant. You can run queries again in <duration>.` | 
| Excessive resource consumption | The query consumed excessive amounts of resources and was stopped from completing. In some cases, advanced hunting identifies the specific operator that wasn't optimized. | [Optimize the query](advanced-hunting-best-practices.md) | -`Query stopped due to excessive resource consumption.`<br>-`Query stopped. Adjust use of the <operator name> operator to avoid excessive resource consumption.` |
| Unknown errors | The query failed because of an unknown reason. | Try running the query again. Contact Microsoft through the portal if queries continue to return unknown errors. | `An unexpected error occurred during query execution. Please try again in a few minutes.` |



## Related topics
- [Advanced hunting best practices](advanced-hunting-best-practices.md)
- [Quotas and usage parameters](advanced-hunting-limits.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Kusto Query Language overview](/azure/data-explorer/kusto/query/)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
