---
title: Get started with Microsoft Sentinel MCP server
titleSuffix: Microsoft Security  
description: Learn how to set up and use Microsoft Sentinel's Model Context Protocol (MCP) collection of security tools to enable natural language queries and AI-powered security investigations 
author: poliveria
ms.topic: get-started
ms.date: 09/30/2025
ms.author: pauloliveria
ms.service: microsoft-sentinel

#customer intent: As a security analyst, I want to configure Microsoft Sentinel MCP server so that I can use natural language to query security data and accelerate investigations.
---

# Get started with Microsoft Sentinel MCP server (preview)

> [!IMPORTANT]
> Microsoft Sentinel MCP server is currently in preview.
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

This article shows you how to set up and use Microsoft Sentinel's Model Context Protocol (MCP) collection of security tools to enable natural language queries against your security data. Sentinel's support for MCP enables security teams to bring AI into their security operations by allowing AI models to access security data in a standard way. 

Sentinel's [collection](sentinel-mcp-tools-overview.md) of security tools works with multiple clients and automation platforms. You can use these tools to: 
- Search for relevant tables
- Retrieve data
- Analyze entities
- Create Security Copilot agents
- Triage incidents
- Hunt for threats

## Prerequisites

To use Microsoft Sentinel MCP server and access its collection of tools, you need to be onboarded to at least one of the following products:
- [Microsoft Sentinel data lake](sentinel-lake-onboarding.md)
- [Microsoft Sentinel in Microsoft Defender portal](/unified-secops/microsoft-sentinel-onboard)
- [Microsoft Defender XDR or Microsoft Defender for Endpoint](/unified-secops/overview-deploy)

For more information about a tool collection's specific product prerequisites, see their respective articles. 


You also need the **Security reader** role to list and invoke Sentinel's collection of MCP tools. The [triage tool collection](sentinel-mcp-triage-tool.md) lets you use any tool your existing permissions grant you.

### Supported code editors and agent platforms

Microsoft Sentinel's support for MCP tools works with several AI-powered code editors and agent-building platforms. The following table lists the compatible platforms and the type of agents we recommend that you add to these platforms.

| Agent-building platform | Type of AI agents best suited for |  
|----------|----------|
| Visual Studio Code| ? |
| [Security Copilot](/copilot/security/microsoft-security-copilot) | Agents doing Security Operations Center (SOC) tasks and other security work |
| [Copilot Studio](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio) | ? |
| [Azure AI Foundry](/azure/ai-foundry/what-is-azure-ai-foundry) | Agents doing software development |

## Add Microsoft Sentinel's collection of MCP tools
This section provides instructions on how to add Microsoft Sentinel's collection of MCP tools in the following platforms:
- [Visual Studio Code](#visual-studio-code)
- [Security Copilot](#security-copilot)
- [Copilot Studio](#copilot-studio)
- [Azure AI Foundry](#azure-ai-foundry)


### Visual Studio Code

To add an MCP tool collection in Visual Studio Code, follow these steps:

1.	**Add MCP server:**
    1. Press **Ctrl** + **Shift** + **P** then type or choose `MCP: Add Server`.

        :::image type="content" source="media/sentinel-mcp/mcp-get-started-add-server.png" alt-text="Screenshot of Visual Studio Code with Add server highlighted." lightbox="media/sentinel-mcp/mcp-get-started-add-server.png":::

    1. Choose **HTTP (HTTP or Server-Sent Events)**.

        :::image type="content" source="media/sentinel-mcp/mcp-get-started-http.png" alt-text="Screenshot of Visual Studio Code with HTTP or Server-Sent Events highlighted." lightbox="media/sentinel-mcp/mcp-get-started-http.png":::

    1. Enter the URL of the [MCP server](sentinel-mcp-tools-overview.md#available-collections) you want to access then press **Enter**.
    
    1. Assign a friendly **Server ID** (for example, `Microsoft Sentinel MCP server`)
    1. Choose whether to make the server available in all Visual Studio Code workspaces or just the current one.
 
1.	**Allow authentication.** When prompted, select **Allow** to authenticate using an account with at least a Security reader role.

    :::image type="content" source="media/sentinel-mcp/mcp-get-started-authenticate.png" alt-text="Screenshot of a Visual Studio Code dialog box prompting the user to authenticate." lightbox="media/sentinel-mcp/mcp-get-started-authenticate.png"::: 

1. **Open Visual Studio Code's chat.** Select **View** > **Chat**, select the **Toggle Chat** icon :::image type="icon" source="media/sentinel-mcp/mcp-chat-icon.png"::: beside the search bar, or press **Ctrl** + **Alt** + **I**.
    
1. **Verify connection.** Set the chat to Agent mode then confirm by selecting the **Configure Tools** icon :::image type="icon" source="media/sentinel-mcp/mcp-tools-icon.png"::: that you see added under the MCP server.

    :::image type="content" source="media/sentinel-mcp/mcp-get-started-04.png" alt-text="Screenshot of a Visual Studio Code Agent menu with the Agent mode and tool icon highlighted." lightbox="media/sentinel-mcp/mcp-get-started-04.png":::

### Security Copilot

>[!IMPORTANT]
>You need to build your own custom Security Copilot agent before you can add Sentinel's collection of MCP tools. For more information, see [Build an agent from scratch using the lite experience](/copilot/security/developer/create-agent-dev#steps-to-create-your-custom-agent).

To add Microsoft Sentinel's collection of MCP tools during custom agent building:

1. Select **Add tool** to open the Tools catalog modal.
1.	In the **Add a tool** modal, search for and select the tools you want to add from Microsoft Sentinel's collection of MCP tools. For example, search for "data exploration" to find the data exploration tool.
1.	Select **Add selected** to add the tools to your agent.

### Copilot Studio

To add an MCP tool collection in Microsoft Copilot Studio, follow these steps:

1. Go to Microsoft Copilot Studio.
1. Create a new agent by entering a prompt in the prompt bar, or by going to **Agents** and selecting **+ New agent**.
    >[!NOTE]
    >If you want to add a tool to an existing agent, go directly to step 4.
1. Enter a name, description, and instructions for your agent, then select **Create**.
1. On your agent's **Overview** page, go to **Tools** and select **Add tool** to ground your agent instructions with relevant security data.
1. On the **Add tool** pop-up window, search for `Sentinel` and choose any [available collection](sentinel-mcp-tools-overview.md) (for example, `Microsoft Sentinel – Data exploration`).
1. Use your Microsoft Entra credentials as the **Connection** to authenticate and authorize the tool, then select **Add to agent**.

### Azure AI Foundry

To add an MCP tool collection in Azure AI Foundry, follow these steps:

1. Go to [Azure AI Foundry's agent builder](https://go.microsoft.com/fwlink/?linkid=2340185) then select **Build** > **Agent**.
1. Enter a name and a description for your agent.
1. On the **Tools** panel, select **Add a new tool** to ground your agent instructions with relevant security data from Microsoft Sentinel. 
1. On the **Select a tool** pop-up window, search for `Sentinel` and choose any [available collection](sentinel-mcp-tools-overview.md) (for example, `Microsoft Sentinel – Data exploration`).
1. Use `OAuth Identity Passthrough` as your **Authentication** to let Azure AI Foundry leverage your Microsoft Entra credentials when authenticating and authorizing calls.
1. Select **Connect**.

**(Optional)** To add a tool to one of your existing AI agents:
1. Go to **Tools**.
1. Search for Sentinel tools and select the one you want to use.
1. Select **Connect** to authenticate and authorize the tool.
1. Select **Use in agent** then select the agent you want to use tool with.


## Test your added tools with sample prompts

After adding Microsoft Sentinel's collection of tools, use the following sample prompts to interact with data in your Microsoft Sentinel data lake. 


- Find the top three users that are at risk and explain why they are at risk.
- Find sign-in failures in the last 24 hours and give me a brief summary of key findings.
- Identify devices that showed an outstanding number of outgoing network connections.
- Help me understand if the user <user object ID\> is compromised.
- Investigate users with a password spray alert in the last seven days and tell me if any of them are compromised.
- Find all the URL IOCs from <threat analytics report\> and analyze them to tell me everything Microsoft knows about them.

To understand how agents invoke our tools to answer these prompts, see [How Microsoft Sentinel MCP tools work alongside your agent](sentinel-mcp-data-exploration-tool.md#how-microsoft-sentinel-mcp-tools-work-alongside-your-agent).

## Next step
- [Tool collection in Microsoft Sentinel MCP server](sentinel-mcp-tools-overview.md)
