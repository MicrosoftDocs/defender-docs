---
title: Create deep links to Microsoft Sentinel graph queries
description: "Learn how to build a Microsoft Sentinel graph deep link that opens, and optionally runs, a query on a specific graph by using URL parameters."
author: EdB-MSFT
ms.author: edbaynash
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.topic: how-to
ms.custom: msecd-doc-authoring-1012
ms.date: 07/05/2026
ai-usage: ai-assisted

#customer intent: As a developer, I want to generate a URL that opens and optionally runs a query on a specific Microsoft Sentinel graph, so that I can share or launch preconfigured graph queries programmatically.

---

# Create deep links to Microsoft Sentinel graph queries

You can create a deep link that opens the Microsoft Sentinel graph page with a specific query already in the editor and, optionally, runs the query automatically when the page loads. Embed these links in runbooks, incident reports, or other documentation so that a responder can select a link and jump straight to a preconfigured investigation query on the correct graph.

Deep link queries are embedded in the URL as Base64 (base64url) text so they can be passed reliably as a single URL parameter. The query isn't encrypted, signed, or compressed.

## Prerequisites

To create a deep link, you need the following prerequisites:

- A graph instance that exists in your tenant. You pass its name in the `graphInstance` parameter. To find valid names, see [Find valid graphInstance values](#find-valid-graphinstance-values).
- The query text that you want to open in the editor.

To open a linked query, you need permission to view the graph and run queries. Deep links don't bypass access controls, so a user without those permissions can't access the linked query. For more information, see [Get started with custom graphs in Microsoft Sentinel](./create-custom-graphs.md#permissions).

## Construct the deep link URL

A deep link URL consists of several components. The following breaks down the basic structure and each piece:

```http
https://security.microsoft.com/graphs?tid=<tenant-id>&graphInstance=<graph-name>&query=<encoded-query>&autoRun=<true|false>&addQuery=<true|false>
```

### URL components

| Component | Required | Description |
|---|---|---|
| `https://security.microsoft.com/graphs` | — | Base URL for Microsoft Sentinel graphs. |
| `tid=<tenant-id>` | No | Your Azure tenant ID (GUID). If omitted, the current tenant is used. |
| `graphInstance=<graph-name>` | Yes | Name of the graph instance to open, for example `IdentityAttackScenarioGraph`. If the value is missing or unknown, nothing is prefilled. |
| `query=<encoded-query>` | No | Your base64url-encoded Graph Query Language (GQL) query. Prefills the editor with the decoded query. |
| `language=<language>` | No | Query language. The only supported value is `gql`. Case-insensitive; any unknown value falls back to `gql`. |
| `autoRun=<true\|false>` | No | Whether to run the query automatically when the tab opens. Defaults to `true`. Only the literal string `false` (case-insensitive) disables autorun; any other value runs the query. |
| `addQuery=<true\|false>` | No | Whether to prefill the editor with the query. Defaults to `true`. Set to `false` to leave the editor empty even when `query` is present. |

### Example breakdown

The following deep link opens the Microsoft Sentinel graph page with a specific query prefilled in the editor, but doesn't run it automatically:

```http
https://security.microsoft.com/graphs
  ?tid=12345678-1234-1234-1234-123456789012
  &graphInstance=IdentityAttackScenarioGraph
  &query=Ly8gVmlzdWFsaXplIGFueSBncmFwaApNQVRDSCAoeCktW3ldLT4oeikKUkVUVVJOICoKTElNSVQgMTAw
  &autoRun=false
```

The `query` parameter decodes to the following GQL query:

```gql
// Visualize any graph
MATCH (x)-[y]->(z)
RETURN *
LIMIT 100
```

Breakdown:

- **Base**: `https://security.microsoft.com/graphs`
- **Tenant**: `tid=12345678-1234-1234-1234-123456789012`
- **Graph**: `graphInstance=IdentityAttackScenarioGraph`
- **Query**: `query=Ly8gVmlzdWFsaXplIGFueSBncmFwaApNQVRDSCAoeCktW3ldLT4oeikKUkVUVVJOICoKTElNSVQgMTAw` (encodes to the GQL shown above)
- **Auto-run**: `autoRun=false` (query won't run automatically)

## Encode the query with base64url

Encode the `query` value with the following steps. These steps match the `encodeQueryBase64` function in `QueryUtils.ts`.

1. UTF-8 encode the raw query text into bytes.
1. Base64 encode those bytes.
1. Replace `+` with `-` and `/` with `_` to make the value URL-safe.
1. Strip any trailing `=` padding characters.
1. Place the result in the URL as the `query` parameter. Standard URL encoding is safe to apply on top.

> [!NOTE]
> The maximum generated-link length is 7,168 characters. Very large queries may not produce a working deep link.

## Generate the link

The following JavaScript matches the application encoder exactly and assembles a complete deep link:

```javascript
function encodeQueryBase64(query) {
  const bytes = new TextEncoder().encode(query);
  const binary = String.fromCharCode(...bytes);
  return btoa(binary)
    .replace(/\+/g, '-')
    .replace(/\//g, '_')
    .replace(/=+$/g, '');
}

const base = 'https://security.microsoft.com/graphs';
const params = new URLSearchParams({
  graphInstance: 'IdentityAttackScenarioGraph',
  query: encodeQueryBase64('MATCH (x)-[y]->(z)\nRETURN *\nLIMIT 100'),
  autoRun: 'true',
});
const deeplink = `${base}?${params.toString()}`;
```

## Conditions for autorun

For the query to run automatically, all of the following conditions must be true:

- `autoRun` isn't set to the literal string `false`.
- The decoded query isn't empty.
- The `graphInstance` exists for the tenant.

## Find valid graphInstance values

You can use any graph instance that exists in your tenant by its instance name. To find the available names, either browse the Microsoft Sentinel graphs UI or call the Microsoft Sentinel Graph Service `GET /graph-instances` API. This API returns the graph instances available to your tenant. You can optionally filter the results with `?graphTypes=`. Use the name of any returned instance.

```http
GET https://api.securityplatform.microsoft.com/graphs/graph-instances?graphTypes=Custom
```

## Common use cases

- **Open the graph and prefill the query without running it**: Set `autoRun=false`, as shown in the example. Users can review and edit the query before it runs, which avoids unnecessary query costs.
- **Open the graph with no query**: Omit the `query` parameter, or set `addQuery=false`. Use this option to direct users to a graph for manual exploration without imposing a predefined query.
- **Target a specific tenant**: Include `tid=<tenant-id>`. The deep link then opens in the correct tenant without the user switching tenants manually.

## Related content

- [Microsoft Sentinel graph overview](sentinel-graph-overview.md)
- [Custom graphs in Microsoft Sentinel](custom-graphs-overview.md)
- [Create custom graphs in Microsoft Sentinel](create-custom-graphs.md)
- [GQL reference for Microsoft Sentinel graph](gql-reference-for-sentinel-custom-graph.md)
