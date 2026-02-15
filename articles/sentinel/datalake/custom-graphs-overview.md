---
title: Custom graphs in Microsoft Sentinel- Overview
description: An overview of custom graphs in Microsoft Sentinel 
author: EdB-MSFT
ms.author: edbaynash
ms.date: 12/09/2025
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

#customer intent: As a security researcher, I want to create custom graphs in my tenant so that I can continuously monitor and detect systemic threats.

---

# Custom Graph overview

Custom graphs in Microsoft Sentinel extend the graph platform capabilities of Microsoft Sentinel. Defenders and security researchers can now create and customize new graphs, visualize interconnected assets, activities, or threat intelligence across multiple sources and from their suite of security tools.

Use the Jupyter pyspark notebooks in the Microsoft Sentinel Visual Studio Code extension to create custom graphs with your Microsoft Sentinel data. Work with the graph builder Python library to define nodes and edges, and use Graph Query Language (GQL) to query and analyze your graphs. Materialize your custom graphs in your tenant for continuous monitoring and detection of systemic threats, and leverage built-in graph algorithms for deeper insights.

| Step | Description |
|------|-------------|
| **1. Create and investigate a ephemeral graph** | - Jupyter notebooks in Sentinel provide an interactive environment for exploring and analyzing data in Sentinel Lake.<br>- The Microsoft Sentinel extension includes a graph builder Python library.<br>- Use the Jupyter notebook in Sentinel to define nodes and edges with Lake data, and create ephemeral graphs.<br>- The graph builder library allows you to query a ephemeral graph using Graph Query Language (GQL) in the Jupyter graph notebook. |
| **2. Materialize custom graphs in tenant** | - Materialize a ephemeral graph in your tenant for continued detection and collaboration.<br>- Use Sentinel jobs to tailor how often you want to refresh a materialized graph with Lake data.<br>- Query and visualize materialized graphs in the Sentinel VSCE extension. |
| **3. Run advanced graph algorithms** | - Use built-in support for Graph Frames analytics and graph traversal functions.<br>- Leverage purpose-built Sentinel graph algorithms for common security use cases. |




## Permissions required to create and query custom graphs


