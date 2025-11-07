---
title: Build Azure Logic Apps with Microsoft Sentinel MCP server
titleSuffix: Microsoft Security  
description: Learn how to set up an Azure Logic App using Microsoft Sentinel's Model Context Protocol (MCP) server  
author: poliveria
ms.topic: get-started
ms.date: 09/30/2025
ms.author: pauloliveria
ms.service: microsoft-sentinel

#customer intent: As a security analyst, I want to build Azure Logic Apps using Microsoft Sentinel MCP server.
---

# Build Azure Logic Apps with Microsoft Sentinel MCP server (preview)

> [!IMPORTANT]
> Microsoft Sentinel MCP server is currently in preview.
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

You can access the value of Microsoft Sentinel Model Context Protocol (MCP) server in [Azure Logic Apps](../../logic-apps/logic-apps-overview.md), starting with the [entity analyzer tool](sentinel-mcp-data-exploration-tool.md). Security analysts and automation engineers often spend significant time creating complex strengths, opportunities, aspirations, and results (SOAR) analysis templates to enrich entities and reach verdicts.

The entity analyzer, built on Microsoft Sentinel data lake data, offers a single action that combines multiple data points to deliver a verdict for the entity. It supports user and URL entities, and you can easily access it through templates or integrate it into preexisting playbooks.

## Prerequisites
To build a new logic app and use the entity analyzer tool, you need the following prerequisites:
- An Azure subscription
- A Microsoft Sentinel data lake instance

**Required permissions:**
- Microsoft Sentinel Playbook Operator for running playbooks
- Logic App Contributor to create or edit playbooks

For specific cases that need additional permissions, see [Roles and permissions in the Microsoft Sentinel platform](../roles.md#additional-roles-for-specific-tasks).

1.	In your Azure portal, go to **Microsoft Sentinel** > your workspace.
1.	On the left pane, select **Automation** > **Create a new playbook** to go to the Logic App creation page.
1.	Enter the following details:
    - **Name** - For example, `Entity_enrichment`
    - **Region** - This region should be the same as your Sentinel workspace
    - **Plan type** - Choose **Consumption** (most common) or **Standard** (for advanced scenarios)
    - **Resource group** - Create a new resource group or choose an existing one
1.	Select **Review + Create**, then select **Create**.

## Add entity analyzer tool to a logic app

You have two options for adding the entity analyzer tool to your logic app:
- [Add to a preexisting logic app](#add-to-a-preexisting-logic-app)
- [Use the prexisting logic app template](#use-existing-logic-app-template)

### Add to a preexisting logic app

To add the entity analyzer tool by using a preexisting logic app:

1. Access your logic app.
1. Select **Add a new action** and then search for **New Action**. 
1. Search for `Entity Analyzer` and choose the action listed under **Microsoft Sentinel MCP tools connector**.
1. Provide the following required information: 
    - **Analyze Entity Request Workspace ID** - Sentinel data lake workspace ID (GUID) 
    - **Analyze Entity Request Look Back Days** - How far back this tool searches (depending on your use case)
    - **Analyze Entity Request Properties** - Any of the following options:
        - For URL entity:
            ```
            {
            "entityType": "Url",
            "url": "[URL]”
            }
            ```
        - For user entity 
            ```
            {
            "entityType": "User",
            "userId": "[User]”
            }
            ```
        You can enter these properties either manually or as dynamic values from previous actions.

The following screenshot is an example output you receive from the action in the logic app. For more information about the specific input and output in the Connector, see [link].
 
### Use existing logic app template 
You can use the following logic app template for an easy and quick implementation of the analyzer: [insert link]

This logic app template takes all users and URLs in an incident, enriches them by using the entity analyzer, then sends that analysis as a comment to the original incident.

The following sample output from the Incident Logic App shows entity analyzer insights within incident comments:


## Authenticate to the connector
Every logic app connector requires an authentication connection. This new action type supports Microsoft Entra ID, service principals, and managed identities. For more information on setting up managed identities or service principals, see [link].
 
