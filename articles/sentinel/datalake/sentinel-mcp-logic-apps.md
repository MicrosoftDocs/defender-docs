---
title: Build Azure Logic Apps with Microsoft Sentinel MCP tools
titleSuffix: Microsoft Security  
description: Learn how to set up an Azure Logic App using Microsoft Sentinel's collection of Model Context Protocol (MCP) tools  
author: poliveria
ms.topic: how-to
ms.date: 12/08/2025
ms.author: pauloliveria
ms.service: microsoft-sentinel

#customer intent: As a security analyst, I want to build Azure Logic Apps using Microsoft Sentinel MCP tools.
---

# Build logic apps with Microsoft Sentinel MCP tools (preview)

> [!IMPORTANT]
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

You can access the value of Microsoft Sentinel's collection of Model Context Protocol (MCP) tools in [Azure Logic Apps](../../logic-apps/logic-apps-overview.md), starting with the [entity analyzer tool](sentinel-mcp-data-exploration-tool.md#entity-analyzer-preview). Security analysts and automation engineers often spend significant time creating complex Security Orchestration, Automation, and Response (SOAR) templates to enrich entities and reach verdicts.

The entity analyzer tool, built on Microsoft Sentinel data lake data, offers a single action that combines multiple data points to deliver a verdict for the entity. It supports user and URL entities, and you can easily access it through templates or integrate it into preexisting playbooks.

## Prerequisites to building a logic app

If you're new to using logic apps, see [Automate Threat Response with Playbooks in Microsoft Sentinel](../automation/automate-responses-with-playbooks.md) to get started with building them before proceeding to adding the entity analyzer tool.


## Add entity analyzer tool to a logic app

You have two options for adding the entity analyzer tool to your logic app:
- [Use an existing logic app template](#use-an-existing-logic-app-template)
- [Add to an existing logic app](#add-to-an-existing-logic-app)

### Use an existing logic app template 
You can use the following logic app template for an easy and quick implementation of the entity analyzer tool: [Insert link]

This logic app template takes all users and URLs in an incident, enriches them by using the entity analyzer tool, and sends that analysis as a comment to the original incident.

:::image type="content" source="media/sentinel-mcp/logic-app-template.png" alt-text="Screenshot of the entity analyzer tool added to logic app template." lightbox="media/sentinel-mcp/logic-app-template.png":::

The following sample output from the Incident logic app shows entity analyzer tool insights within incident comments:

### Add to an existing logic app

To add the entity analyzer tool by using an existing logic app:

1. Access your logic app.
1. Select **Add a new action** and then search for **New Action**. 
1. Search for `entity analyzer` and choose the action listed under **Microsoft Sentinel MCP tools connector**.

    ![Screenshot of entity analyzer as listed under Microsoft Sentinel MCP tools connector.](media/sentinel-mcp/logic-app-existing.png)

1. Provide the following required information: 
    - **Analyze Entity Request Workspace ID** - Sentinel data lake workspace ID (GUID) 
    - **Analyze Entity Request Look Back Days** - How far back this tool searches (depending on your use case)
    - **Analyze Entity Request Properties** - Any of the following options:
        - For URL entity:
            ```
            {
            "entityType": "Url",
            "url": "[URL]"
            }
            ```
        - For user entity 
            ```
            {
            "entityType": "User",
            "userId": "[User]"
            }
            ```
        You can enter these properties either manually or as dynamic values from previous actions.

The following screenshot is an example output you receive from the action in the logic app:

For more information about the specific input and output in the Connector, see [Microsoft Sentinel MCP](/connectors/sentinelmcp/).

## Authenticate to the connector
Every logic app connector requires an authentication connection. This new action type supports Microsoft Entra ID, service principals, and managed identities. As is the case with the MCP server, the logic app's identity requires **Security reader** to operate.
 
## Related content
- [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md)
- [Tool collection in Microsoft Sentinel MCP server](sentinel-mcp-tools-overview.md)