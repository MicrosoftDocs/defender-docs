---
title: Use Watchlists to Correlate and Enrich Event Data in Microsoft Sentinel
description: Learn how to use watchlists in Microsoft Sentinel to correlate and enrich event data, reduce alert fatigue, and respond to threats. Understand key scenarios, limitations, and query patterns for watchlist integration.
ms.author: guywild
author: guywi-ms
ms.reviewer: noak
ms.topic: concept-article
ms.date: 06/23/2026
ai-usage: ai-assisted
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security


#Customer intent: As a security analyst, I want to understand how to use watchlists in Microsoft Sentinel so that I can efficiently correlate and enrich event data, reduce alert fatigue, and respond to threats.

---

# Watchlists in Microsoft Sentinel

Watchlists in Microsoft Sentinel help security analysts efficiently correlate and enrich event data. They give you a flexible way to manage reference data, like lists of high-value assets or terminated employees. Integrate watchlists into your detection rules, threat hunting, and response workflows to reduce alert fatigue and respond to threats faster. This article explains how to use watchlists in Microsoft Sentinel, outlines key scenarios and limitations, and gives guidance on creating and querying watchlists to enhance your security operations.

Use watchlists in your search queries, detection rules, threat hunting, and response playbooks. Watchlists are stored in your Microsoft Sentinel workspace in the `Watchlist` table as name-value pairs and cached for optimal query performance.

> [!IMPORTANT]
> The features for watchlist templates and the ability to create a watchlist from a file in Azure Storage are currently in **PREVIEW**. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.
>

## When to use watchlists

Use watchlists in these scenarios:

- **Investigate threats** by importing IP addresses, file hashes, and other data from comma-separated values (CSV) files, then use watchlist name-value pairs for joins and filters in alert rules, threat hunting, workbooks, notebooks, and queries.

- **Import business data** as a watchlist. For example, import user lists with privileged system access or lists of terminated employees. Then, use the watchlist to create allowlists and blocklists to detect or prevent those users from signing in to the network.

- **Reduce alert fatigue**. Create allowlists to suppress alerts from a group of users, like users from authorized IP addresses who perform tasks that would normally trigger the alert. Prevent benign events from becoming alerts.

- **Enrich event data** with name-value combinations from external data sources.

## Watchlist limitations

Review the following limitations before you create watchlists:

| Limitation | Details |
| --- | --- |
| **Watchlist name and alias length** | Watchlist names and aliases must be between 3 and 64 characters. First and last characters must be alphanumeric; spaces, hyphens, and underscores allowed between. |
| **Intended use** | Use watchlists only for reference data. Watchlists aren't designed for large data volumes. |
| **Maximum active watchlist items** | You can have a maximum of 10 million active watchlist items across all watchlists in a workspace. Deleted items don't count. For larger volumes, use [custom logs](/azure/azure-monitor/agents/data-sources-custom-logs). |
| **Data retention** | Data in the Log Analytics Watchlist table is retained for 28 days. |
| **Refresh interval** | Watchlists refresh every 12 days, updating the `TimeGenerated` field. |
| **Cross-workspace management** | Managing watchlists across workspaces using Azure Lighthouse isn't supported. |
| **Local file upload size** | Local file uploads are limited to files of up to 3.8 MB. |
| **Azure Storage file upload size (preview)** | Azure Storage uploads are limited to files of up to 500 MB. |
| **Column and table restrictions** | Watchlists must follow [Kusto Query Language (KQL) entity naming restrictions](/kusto/query/schema-entities/entity-names?view=microsoft-sentinel&preserve-view=true) for columns and names. |

## Microsoft Sentinel watchlist creation methods

To create watchlists in Microsoft Sentinel, use one of the following methods:

- Upload a file from a local folder or from your Azure Storage account.
- Download a watchlist template from Microsoft Sentinel, add your data, and upload the file.

To create a watchlist from a large file (up to 500 MB), upload the file to your Azure Storage account. Create a shared access signature (SAS) URL so Microsoft Sentinel can retrieve the watchlist data. A SAS URL includes both the resource URI and the SAS token for a resource, like a CSV file in your storage account. Add the watchlist to your workspace in Microsoft Sentinel.

For more information, see:

- [Create watchlists in Microsoft Sentinel](watchlists-create.md)
- [Built-in watchlist schemas](watchlist-schemas.md)
- [Azure Storage SAS token](/azure/storage/common/storage-sas-overview#sas-token)

## Watchlists in queries for searches and detection rules

To correlate your watchlist data with other Microsoft Sentinel data, use Kusto tabular operators such as `join` and `lookup` with the `Watchlist` table. Microsoft Sentinel provides the following built-in functions to help you query watchlists:

- `_GetWatchlistAlias` - returns the aliases of all your watchlists
- `_GetWatchlist` - queries the name-value pairs of the specified watchlist

When you create a watchlist, you define the *SearchKey*. The search key is the name of a column in your watchlist that you expect to use as a join with other data or as a frequent object of searches. For example, suppose you have a server watchlist that contains country/region names and their respective two-letter country codes. You expect to use the country codes often for searches or joins. So you use the country code column as the search key.

  ```kusto
  Heartbeat
  | lookup kind=leftouter _GetWatchlist('mywatchlist') 
    on $left.RemoteIPCountry == $right.SearchKey
  ```

Let's look at some other example queries.

Suppose you want to use a watchlist in an analytics rule. You create a watchlist called `ipwatchlist` with columns for `IPAddress` and `Location`. You set `IPAddress` as the **SearchKey**.

  |`IPAddress,Location`   |
  |---------|
  |`10.0.100.11,Home`     |
  |`172.16.107.23,Work`   |
  |`10.0.150.39,Home`     |
  |`172.20.32.117,Work`   |

To include only events from IP addresses in the watchlist, you might use a query where `watchlist` is used as a variable or inline.

This example query uses the watchlist as a variable:

  ```kusto
    //Watchlist as a variable
    let watchlist = (_GetWatchlist('ipwatchlist') | project IPAddress);
    Heartbeat
    | where ComputerIP in (watchlist)
  ```

This example query uses the watchlist inline with the query and the search key defined for the watchlist.

  ```kusto
    //Watchlist inline with the query
    //Use SearchKey for the best performance
    Heartbeat
    | where ComputerIP in ( 
        (_GetWatchlist('ipwatchlist')
        | project SearchKey)
    )
  ```

For more information on building queries and detection rules with watchlists, see [Build queries and detection rules with watchlists in Microsoft Sentinel](watchlists-queries.md), and for Kusto operators and statements, see the following articles:

- [***where*** operator](/kusto/query/where-operator?view=microsoft-sentinel&preserve-view=true)
- [***project*** operator](/kusto/query/project-operator?view=microsoft-sentinel&preserve-view=true)
- [***lookup*** operator](/kusto/query/lookup-operator?view=microsoft-sentinel&preserve-view=true)
- [***in*** operator](/kusto/query/in-cs-operator?view=microsoft-sentinel&preserve-view=true)
- [***let*** statement](/kusto/query/let-statement?view=microsoft-sentinel&preserve-view=true)

[!INCLUDE [kusto-reference-general-no-alert](includes/kusto-reference-general-no-alert.md)]

## Troubleshoot watchlists during incidents and query issues

### Troubleshoot portal or API availability issues

If the **Watchlists** page is blank, repeatedly refreshes, or watchlist operations return `502 Bad Gateway` or other `5XX` responses, first determine whether the issue is likely service-side before you change watchlist configuration.

Use the following checks:

- Confirm whether the issue affects all watchlists or multiple watchlists.
- Confirm whether the issue affects multiple users.
- Confirm whether the issue affects both the Azure portal and automation or API-based operations.
- Validate whether watchlist data is still queryable from Logs:

  ```kusto
  _GetWatchlistAlias
  ```

  If you know the alias of the watchlist, also test:

  ```kusto
  _GetWatchlist('watchlist-alias')
  | take 10
  ```

- Check [Azure Service Health](https://portal.azure.com/#view/Microsoft_Azure_Health/AzureHealthBrowseBlade/~/serviceIssues) and active incident communications for Microsoft Sentinel-related impact.
- Avoid repeated delete and recreate attempts while the incident is active. A portal or API failure doesn't necessarily indicate watchlist data loss.
- Treat a blank portal or watchlist create, read, update, and delete (CRUD) operations returning `502` or other `5XX` errors across users or workspaces as a potential service incident until you rule out broader platform impact.
- If a Logic Apps workflow that calls watchlist operations starts returning `502 Bad Gateway` or similar transient failures, validate Microsoft Sentinel service health before you assume the issue is caused by connector permissions or workflow configuration. Automation failures can surface as generic access or gateway errors during a watchlist service incident even when the workflow identity and configuration are unchanged.

During a service incident, the safest first validation is to confirm whether watchlists are still queryable. If query access also fails, capture the timestamp, operation, and HTTP status code before you open a support request.

### Understand retention and refresh behavior

The 28-day retention value doesn't mean that a watchlist becomes unusable after 28 days.

Watchlists remain available until you delete them. The retention value applies to records in the underlying Log Analytics watchlist table, while the watchlist service refreshes watchlist data on a recurring interval. Because the watchlist is refreshed regularly, it remains queryable over time unless you delete it or another issue affects availability.

This distinction is important when you plan long-term analytics or validate whether a watchlist should still appear in query results.

### Troubleshoot watchlists that show zero rows after creation

If a watchlist is created successfully but the portal or `_GetWatchlist()` returns no rows, review workspace ingestion constraints as part of troubleshooting.

- Confirm that the watchlist was created in the expected workspace.
- Query the watchlist by alias:

  ```kusto
  _GetWatchlist('watchlist-alias')
  | take 10
  ```

- Review the Log Analytics workspace configuration for ingestion limits, including the daily cap.
- If the workspace has reached its daily cap, allow ingestion to resume and then validate the watchlist again.

A zero-row result doesn't always indicate that the watchlist definition is missing. Ingestion-related workspace limits can affect when watchlist data becomes visible in the workspace.

### Troubleshoot management-plane and query behavior divergence

Query access and management access can behave differently during a transient service issue.

In some cases, you can still query watchlists with `_GetWatchlistAlias` or `_GetWatchlist()` even when the portal experience, edit operations, or other management-plane actions are temporarily unavailable. If query results are returned but the portal is blank or watchlist updates fail, validate service health before you assume the watchlist was deleted or its schema changed.

A successful KQL query indicates that watchlist data might still be available in the workspace even if the management experience is degraded.

### Troubleshoot empty or partial query results

> [!IMPORTANT]
> Watchlist query results can be affected by the query time range and by filters applied in the surrounding query.

Watchlists are refreshed on a recurring interval, and query functions return the current watchlist state from the underlying watchlist data. If you apply a narrow global datetime scope or other restrictive filters while troubleshooting, the query can exclude records needed to return the expected watchlist contents. In that case, `_GetWatchlist()` can appear to return empty or partial results even though the watchlist still exists.

When you troubleshoot unexpected empty results:

- Confirm that you're querying the correct watchlist alias.
- Remove or widen the query-level time scope.
- Re-run the query and compare the results.

For scenarios that depend on query-level datetime scope, use a time range that is broad enough to include the watchlist refresh cycle.

## Related content

- [Create watchlists in Microsoft Sentinel](watchlists-create.md)
- [Manage watchlists in Microsoft Sentinel](watchlists-manage.md)
