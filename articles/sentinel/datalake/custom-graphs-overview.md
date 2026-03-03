---
title: Custom graphs in Microsoft Sentinel- Overview
description: An overview of custom graphs in Microsoft Sentinel 
author: EdB-MSFT
ms.author: edbaynash
ms.date: 03/03/2026
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform

#customer intent: As a security researcher, I want to create custom graphs in my tenant so that I can continuously monitor and detect systemic threats.

---

# Custom Graph overview

Custom graphs in Microsoft Sentinel extend the graph platform capabilities of Microsoft Sentinel. Defenders and security researchers can now create and customize new graphs, visualize interconnected assets, activities, or threat intelligence across multiple sources and from their suite of security tools.

Custom graphs enable organizations to create custom enterprise knowledge graphs for various use cases. In a large enterprise where users, devices, service principals, and applications are constantly changing, new credentials are issued, groups evolve, and permissions shift by the hour. Over time, this constant change creates a complex web of implicit trust and shared access that static tools can't capture.


Custom graphs allow you to model and build a graph iteratively using a notebook built with the Microsoft Sentinel Visual Studio Code extension. Notebook-based graphs allow you to perform ad hoc graphical investigations that require quick pattern examination and rapidly changing relationships. Pull data from the Microsoft Sentinel data lake and build a graph to explore relationships, run analytics, iterate on nodes and edges, and refine queries in an interactive loop. When the investigation is complete, you can discard the graph or save the graph in your tenant. 
A saved graph persists in the graph database and allows you to run graph analytics and visualization on a continuous basis. You can schedule an automatic refresh of the graph at regular intervals, for example daily or hourly. An authorized team member can query a graph using a variety of tools including MCP tools, the Graph Explorer user interface, the graph APIs or using Sentinel interactive notebooks.


<!-- ## Ad-hoc custom graphs

Ad-hoc custom graphs are designed for one-time investigations that require quick pattern examination and rapidly changing, large-scale data that doesn't justify saving and reuse. Pull data from the Microsoft Sentinel data lake and build a graph to explore relationships, run analytics, iterate on nodes and edges, and refine queries in an interactive loop. When the investigation is complete, the graph is discarded.

In a typical SOC investigation, events like brute-force attempts or privilege escalations often appear as isolated incidents. In reality, attackers move laterally through interconnected credentials and resources, and these connections are only visible through graph traversal.

Consider a scenario where a service account used by a legacy database is compromised. The account holds group membership in *DataOps-Admins*, which shares access with *Engineering-All*. A developer reuses their personal access token across staging and production clusters. Individually, these facts seem harmless. Together, they form a multihop credential exposure chain that can only be detected through graph traversal. -->

### Ad-hoc custom graphs

The following scenarios demonstrate how ad-hoc custom graphs can expose hidden patterns:

- **Sign-in anomaly hunting**: An analyst graphs user logins against source IPs and timestamps to identify unusual patterns, like a single IP connecting to many accounts. By iterating on the graph—filtering nodes and adding context like geolocation—they can spot suspicious login clusters or a credential theft scenario.

- **TTP (Tactics, Techniques, Procedures) investigation**: For a specific threat, such as a known APT's techniques, the hunter might use a graph template to map related events. Microsoft Sentinel can provide hunting notebook templates for scenarios like investigating lateral movement or scanning logs for leaked credentials, allowing analysts to quickly construct a graph of relevant evidence.

- **Audit log pattern discovery**: By graphing Office 365 activity logs or admin audit logs, defenders can apply advanced graph algorithms, like betweenness centrality, to find outliers. For example, an account that intermediates many rare file access relationships might indicate insider abuse.

### Detect gradual privilege overlap using persisting graphs in your tenant

A persisted graph is saved in the graph database and can be refreshed on a regular basis. A persisted custom graph can help detect the gradual buildup of privilege overlap — when identities that were once isolated begin to share access paths through evolving group memberships, role assignments, or inherited permissions. Over weeks or months, these subtle shifts expand the blast radius of any single compromise.

For example, a developer might have access to a staging environment and, through group membership changes, gradually gain access to production resources. Individually, each change seems innocuous. However, when visualized in a graph over time, defenders can see the emerging connections and intervene before a compromise escalates.


### Build and maintain identity graphs

Organizations can build their own identity graphs and materialize them using Microsoft Sentinel. These materialized custom graphs continuously map relationships across Azure AD Domain Services, Microsoft Entra ID, AWS IAM, SaaS platforms, and custom applications, updating daily or hourly to reflect the organization's true security topology.

Query these graphs and run advanced graph algorithms to understand choke points, blast radius, attack paths.


## Building custom graphs in Microsoft Sentinel

Use the Jupyter pyspark notebooks in the Microsoft Sentinel Visual Studio Code extension to create custom graphs with your Microsoft Sentinel data. Work with the [graph builder Python library](./graph-builder-api-reference.md) to define nodes and edges, and use [Graph Query Language (GQL)](./graph-query-language.md) to query and analyze your graphs. Materialize your custom graphs in your tenant for continuous monitoring and detection of systemic threats, and leverage built-in graph algorithms for deeper insights.

The following table summarizes the steps to build custom graphs in Microsoft Sentinel:

| Step | Description |
|------|-------------|
| **1. Create and investigate a ephemeral graph** | - Jupyter notebooks in Sentinel provide an interactive environment for exploring and analyzing data in Sentinel Lake.<br>- The Microsoft Sentinel extension includes a graph builder Python library.<br>- Use the Jupyter notebook in Sentinel to define nodes and edges with Lake data, and create ephemeral graphs.<br>- The graph builder library allows you to query a ephemeral graph using Graph Query Language (GQL) in the Jupyter graph notebook. |
| **2. Materialize custom graphs in tenant** | - Materialize a ephemeral graph in your tenant for continued detection and collaboration.<br>- Use Sentinel jobs to tailor how often you want to refresh a materialized graph with Lake data.<br>- Query and visualize materialized graphs in the Sentinel VSCE extension. |
| **3. Run advanced graph algorithms** | - Use built-in support for Graph Frames analytics and graph traversal functions.<br>- Leverage purpose-built Sentinel graph algorithms for common security use cases. |

For detailed instructions on how to build custom graphs in Microsoft Sentinel, see [Custom graphs in Microsoft Sentinel](./create-custom-graphs.md).