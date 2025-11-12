---
title: Create and use custom Microsoft Sentinel MCP tools (preview)
titleSuffix: Microsoft Security  
description: Learn how to set up and use custom Microsoft Sentinel Model Context Protocol (MCP) tools using saved KQL queries in advanced hunting 
author: poliveria
ms.topic: get-started
ms.date: 09/30/2025
ms.author: pauloliveria
ms.service: microsoft-sentinel

#customer intent: As a security analyst, I want to create a custom Microsoft Sentinel Model Context Protocol (MCP) tool using saved KQL queries in advanced hunting so I can have granular control over the data accessible to my AI agents.
---

# Create and use custom Microsoft Sentinel MCP tools (preview)

Security agents built with Microsoft Sentinel's collection of Model Context Protocol (MCP) tools can effectively reason over data in Microsoft Sentinel. You can create custom Sentinel MCP tools so you can have granular control over the data accessible to your security agents and create deterministic agentic workflows. 

This article shows how you can enable agents to retrieve and reason over knowledge from your library of saved Kusto Query Language (KQL) queries in [advanced hunting](/defender-xdr/advanced-hunting-microsoft-defender?toc=%2Fazure%2Fsentinel%2FTOC.json&bc=%2Fazure%2Fsentinel%2Fbreadcrumb%2Ftoc.json) by using custom MCP tools. 

## Prerequisites
To create custom Microsoft Sentinel MCP tools, you need the following prerequisites:
- Microsoft Sentinel data lake and Microsoft Defender licenses
- **Security Operator**, **Security Admin**, or **Global Admin** role to create, update, or delete custom tools
- **Security reader** or **Global reader** role to list and invoke custom tools

## Create custom tools with KQL queries

You can use advanced hunting queries in Microsoft Defender portal and KQL queries in Microsoft Sentinel data lake to find and discover security data that you can use in agentic workflows. This approach lets you control the type and amount of information your agents can reason over. When you verify that a query retrieves the data you want your agent to reason with, save it as a custom MCP tool.

For more information, see [Work with advanced hunting query results](/defender-xdr/advanced-hunting-query-results?toc=/azure/sentinel/TOC.json&bc=/azure/sentinel/breadcrumb/toc.json).

## Add custom tools in your security agents

To add your saved custom tool, copy your tool's MCP server URL. Then, follow the steps for the following supported agent building platforms:
- [Visual Studio Code](sentinel-mcp-get-started.md#visual-studio-code)
- [Security Copilot](sentinel-mcp-get-started.md#security-copilot)


## Related content
- [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md)
- [Tool collection in Microsoft Sentinel MCP server](sentinel-mcp-tools-overview.md)