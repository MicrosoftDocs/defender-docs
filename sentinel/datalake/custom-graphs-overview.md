---
title: Custom Graphs in Microsoft Sentinel Overview (Preview)
description: Learn how custom graphs in Microsoft Sentinel help you model connected security data from Sentinel data lake and external sources to visualize attack paths, uncover hidden relationships, and improve investigations.
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: sourinpaul
ms.date: 08/07/2026
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015

#customer intent: As a security researcher, I want to create custom graphs in my tenant so that I can continuously monitor and detect systemic threats.

---

# Custom Graph overview (preview)

Custom graphs let you build tailored security graphs tuned to your unique security scenarios using data from Sentinel data lake as well as non-Microsoft sources. With custom graph, powered by Fabric, you can build, query, and visualize connected data, uncover hidden patterns and attack paths, and help surface risks that are hard to detect when data is analyzed in isolation. Custom graphs provide the knowledge context that enables AI-powered agent experiences to work more effectively, speeding investigations, revealing blast radius, and helping you move from noisy, disconnected alerts to confident decisions at scale.

## Common scenarios

These scenarios show a sample of what’s possible with custom graphs. You can model any entities, relationships, and data from the Sentinel data lake. Build graphs tailored to your security workflows and investigative needs.

| Scenario |Key questions that graph can help answer |
|----------|---------------|
| **Phishing email kill chain with enriched business context** | - Who received the phishing email, who clicked on the links, and which clicks were actually allowed by the proxy?<br>- Which emails point to the same URL, revealing waves using shared infrastructure ? Follow attachment → download → process execution → device to show the chain from inbox to compromise. |
| **DNS C2 beacon hunter** | - Show device to domain activity that exhibits beaconing behavior (low interval variance and high time coverage), separating automated traffic from human browsing.<br>- Follow the full evidence chain from device → DNS query → resolved IP → threat indicator. |
| **Behavioral attack chain detection** | - Show all IPs/users that touch behaviors mapped to 3 or more different MITRE techniques.<br>- Follow the full path from a threat indicator through the matched IP through all associated behaviors to every affected user. |
| **OAuth privilege escalation** | - Show service principals that granted permissions to themselves, then chained those permissions to reach a Tier Zero directory role. Self escalation cycle signature. |


## Building custom graphs in Microsoft Sentinel

Use the Jupyter notebooks in Microsoft Visual Studio Code to interactively create and analyze custom graphs with your data in the Microsoft Sentinel data lake. The notebooks are provided by the Microsoft Sentinel Visual Studio Code extension that allows you to interact with the Microsoft Sentinel data lake using Python for Spark (PySpark). For more information on the Microsoft Sentinel Visual Studio Code extension, see [Install Visual Studio Code and the Microsoft Sentinel extension](./notebooks.md#install-visual-studio-code-and-the-microsoft-sentinel-extension).

You can author custom graphs using either AI‑assisted graph authoring or by writing your own code. Use the Microsoft Sentinel graph provider reference to define the nodes and edges in your graph model, transform your data from the Sentinel data lake, and query your graphs with Graph Query Language (GQL). For more information, see [AI-assisted custom graph authoring in Microsoft Sentinel](./create-graphs-with-ai.md),  [Microsoft Sentinel graph provider reference](./sentinel-graph-provider-reference.md) and [Graph Query Language (GQL) reference for Sentinel custom graph](./gql-reference-for-sentinel-custom-graph.md).

After you author the graph code in a notebook, run the notebook in an interactive session or publish a graph job. Graphs created during an interactive notebook session are temporary and available only in that session. An on-demand graph job materializes the graph for 30 days and then deletes it. A scheduled graph job rebuilds the graph on the refresh schedule you configure. You can access a materialized graph from the graph experience under Microsoft Sentinel in the Defender portal, Visual Studio Code notebooks, and graph query APIs.

Creating and querying custom graphs is billed under the Microsoft Sentinel graph meter. For more information, see [Graph charges](../billing.md#graph-charges).

The following table summarizes the steps to build custom graphs in Microsoft Sentinel:

| Step | Description |
|------|-------------|
| **1. Create and investigate a graph in an interactive notebook session** | - Jupyter notebooks in Microsoft Sentinel provide an interactive environment for exploring and analyzing data in the Microsoft Sentinel data lake.<br>- The Microsoft Sentinel extension includes the `sentinel_graph` Python library.<br>- Use a Jupyter notebook to define nodes and edges with data from the Microsoft Sentinel data lake and create graphs.<br>- Use the `sentinel_graph` library to query a graph with Graph Query Language (GQL). |
| **2. Schedule a graph job to materialize your graph** |- Materialize your graph in your tenant for continued access and collaboration.<br>- Use Sentinel jobs to tailor how often you want to refresh a materialized graph with Lake data.<br>- Query and visualize materialized graphs in graph experience in Microsoft Sentinel.|
| **3. Run advanced graph algorithms** |- Use Jupyter notebooks for accessing built-in support for GraphFrames analytics and graph traversal functions.<br>- Use purpose-built Sentinel graph algorithms for common security use cases.|

For detailed instructions on how to build custom graphs in Microsoft Sentinel, see [Custom graphs in Microsoft Sentinel](./create-custom-graphs.md).

## Visualizing graphs in Microsoft Sentinel

Microsoft Sentinel provides multiple options for visualizing graphs, including the graphs experience Microsoft Sentinel, Jupyter notebooks in the Sentinel Visual Studio Code extension. The graph experience lets you run Graph Query Language (GQL) queries, view the graph schema (the defined node and edge types), visualize the graph, view graph results in tabular format, and interactively traverse the graph to the next hop with a simple click. 

:::image type="content" source="./media/custom-graphs-overview/graph-exploration-phishing-query.png"    alt-text="Screenshot of the Sentinel graph in Microsoft Sentinel showing a graph visualization." lightbox="./media/custom-graphs-overview/graph-exploration-phishing-query.png":::

For more information on visualizing graphs in Microsoft Sentinel using Sentinel graph, see [Visualize graphs in Microsoft Sentinel graph (preview)](./graph-visualization.md).

## Related content

- [Custom graphs in Microsoft Sentinel](./create-custom-graphs.md)
- [Microsoft Sentinel graph provider reference](./sentinel-graph-provider-reference.md)
- [Graph Query Language (GQL) reference for Sentinel custom graph](./gql-reference-for-sentinel-custom-graph.md)
- [Visualize graphs in Microsoft Sentinel graph (preview)](./graph-visualization.md)