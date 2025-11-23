---
title: Custom graphs in Microsoft Sentinel- Overview
description: Learn how to create and manage custom graphs in Microsoft Sentinel to model attack patterns, investigate threats, and run advanced graph algorithms.
author: EdB-MSFT
ms.author: edbaynash
ms.date: 11/17/2025
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

#customer intent: As a security researcher, I want to create custom graphs in my tenant so that I can continuously monitor and detect systemic threats.





Sourin Paul

11/14/2025

DRAFT – Do NOT publish



- Note: Do not publish documentation in production. These will be shared with customers as PDF and hosted internally in **aka.ms/customgraphs (TBD)**

# Summary 

*\[Content for\] In Microsoft Sentinel graph overview (*[link](https://learn.microsoft.com/en-us/azure/sentinel/datalake/sentinel-graph-overview?tabs=defender)*)-\>(after Pricing) add a new section called “Custom Graphs in Microsoft Sentinel”*
---



# Custom Graph Overview

Custom graphs in Microsoft Sentinel extend the graph platform capabilities of Microsoft Sentinel. Defenders and security researchers can now create and customize new graphs, visualize interconnected assets, activities, or threat intelligence across multiple sources and from their suite of security tools.

Using the Jupyter notebooks in Microsoft Sentinel Visual Studio Code extension, you can do the following:

| Step | Description |
|------|-------------|
| **1. Create and investigate a temporary graph** | - Jupyter notebooks in Sentinel provide an interactive environment for exploring and analyzing data in Sentinel Lake.<br>- The Microsoft Sentinel extension includes a graph builder Python library.<br>- Use the Jupyter notebook in Sentinel to define nodes and edges with Lake data, and create temporary graphs.<br>- The graph builder library allows you to query a temporary graph using Graph Query Language (GQL) in the Jupyter graph notebook. |
| **2. Materialize custom graphs in tenant** | - Materialize a temporary graph in your tenant for continued detection and collaboration.<br>- Use Sentinel jobs to tailor how often you want to refresh a materialized graph with Lake data.<br>- Query and visualize materialized graphs in the Sentinel VSCE extension. |
| **3. Run advanced graph algorithms** | - Use built-in support for Graph Frames analytics and graph traversal functions.<br>- Leverage purpose-built Sentinel graph algorithms for common security use cases. |

<<<<<<<<<\<Drawing\>>>>>>>>>>
