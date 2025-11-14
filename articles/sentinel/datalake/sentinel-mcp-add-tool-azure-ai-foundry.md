---
title: Add an MCP tool to AI agents in Azure AI Foundry (preview)
titleSuffix: Microsoft Security  
description: Learn how to add Microsoft Sentinel's Model Context Protocol (MCP) collection of security tools or your own custom tool to AI agents in Azure AI Foundry 
author: poliveria
ms.topic: how-to
ms.date: 11/18/2025
ms.author: pauloliveria
ms.service: microsoft-sentinel

#customer intent: As a security analyst, I want to add MCP to my AI agents in Azure AI Foundry.
---

# Add an MCP tool in Azure AI Foundry (preview)

> [!IMPORTANT]
> Microsoft Sentinel MCP server is currently in preview.
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

This article shows you how to add Microsoft Sentinel's Model Context Protocol (MCP) [collection of security tools](sentinel-mcp-tools-overview.md#available-collections) or your own custom tools to your AI agents in [Azure AI Foundry](/azure/ai-foundry/what-is-azure-ai-foundry). 

For information about how to get started with MCP tools, see the following articles:
- [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md)
- [Create and use custom Microsoft Sentinel MCP tools](sentinel-mcp-create-custom-tool.md)

## Add a Microsoft Sentinel tool collection

To add a Microsoft Sentinel tool collection in Azure AI Foundry, follow these steps:

1. Go to [Azure AI Foundry's agent builder](https://go.microsoft.com/fwlink/?linkid=2340185) then select **Build** > **Agent**.

     :::image type="content" source="media/sentinel-mcp/get-started-foundry-build-agent.png" alt-text="Screenshot of Azure AI Foundry agent builder page with the build agent option highlighted." lightbox="media/sentinel-mcp/get-started-foundry-build-agent.png":::   

1. Enter a name and a description for your agent.

     :::image type="content" source="media/sentinel-mcp/get-started-foundry-create-agent.png" alt-text="Screenshot of the Create new agent pop-up window in Azure AI Foundry agent builder page." lightbox="media/sentinel-mcp/get-started-foundry-create-agent.png":::   

1. On the **Tools** panel, select **Add a new tool** to ground your agent instructions with relevant security data from Microsoft Sentinel. 

     :::image type="content" source="media/sentinel-mcp/get-started-foundry-add-tool.png" alt-text="Screenshot of an agent's page in Azure AI Foundry with add tool option highlighted." lightbox="media/sentinel-mcp/get-started-foundry-add-tool.png":::   

1. On the **Select a tool** pop-up window, search for `Sentinel` and choose any [available collection](sentinel-mcp-tools-overview.md) (for example, `Microsoft Sentinel – Data exploration`).

     :::image type="content" source="media/sentinel-mcp/get-started-foundry-select-tool.png" alt-text="Screenshot of the Select a tool pop-up window in Azure AI Foundry agent builder page with a Sentinel tool collection highlighted." lightbox="media/sentinel-mcp/get-started-foundry-select-tool.png":::   

1. Use `OAuth Identity Passthrough` as your **Authentication** to let Azure AI Foundry use your Microsoft Entra credentials when authenticating and authorizing calls.

     :::image type="content" source="media/sentinel-mcp/get-started-foundry-connect-tool.png" alt-text="Screenshot of the authentication step in the connect tool pop-up window." lightbox="media/sentinel-mcp/get-started-foundry-connect-tool.png":::   

1. Select **Connect**.

**(Optional)** To add a tool to one of your existing AI agents:
1. Go to **Tools**.
1. Search for Sentinel tools and select the one you want to use.
1. Select **Connect** to authenticate and authorize the tool.

    :::image type="content" source="media/sentinel-mcp/get-started-foundry-use-agent.png" alt-text="Screenshot of a tool's page in Azure AI Foundry page with Connect button highlighted." lightbox="media/sentinel-mcp/get-started-foundry-use-agent.png":::   

1. Select **Use in agent** then select the agent you want to use tool with.



## Add a custom tool collection

To add your custom tool collection in Azure AI Foundry, follow these steps:

### Step 1: Register an app in Azure portal
1.	Open your tenant's [Azure portal](https://portal.azure.com) then go to **App registrations** > **New registration**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-new-reg.png" alt-text="Screenshot of Azure portal with New registration option highlighted." lightbox="media/sentinel-mcp/custom-azure-new-reg.png":::

1.	On the **Register an application** page, enter a friendly user-facing **Name** for the app, then select **Register**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-register.png" alt-text="Screenshot of the new application registration page in Azure portal." lightbox="media/sentinel-mcp/custom-azure-register.png":::
 
1.	On your newly registered app's page, go to **Manage** > **API permissions**, then select **Add a permission**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-permissions.png" alt-text="Screenshot of the API permissions page and flyout panel in Azure portal." lightbox="media/sentinel-mcp/custom-azure-permissions.png":::
 
1.	On the flyout panel that appears, go to the **APIs my organization uses** tab and search for `Sentinel Platform Services`.

    :::image type="content" source="media/sentinel-mcp/custom-azure-api-reg.png" alt-text="Screenshot of the APIs my organization uses tab in the Request API permissions panel in Azure portal." lightbox="media/sentinel-mcp/custom-azure-api-reg.png":::

1.	Choose **SentinelPlatform.DelegatedAccess**, then select **Add permissions**.
 
     :::image type="content" source="media/sentinel-mcp/custom-azure-api-delegate.png" alt-text="Screenshot of the Request API permissions panel in Azure portal with permissions selected." lightbox="media/sentinel-mcp/custom-azure-api-delegate.png":::

1. Back on your app's page, go to **Manage** > **Certificates & secrets**, then select the **Client secrets** tab. 

1. Select **New client secret**. On the flyout panel that appears, add a **Description**, then select **Add**.

     :::image type="content" source="media/sentinel-mcp/custom-azure-secret.png" alt-text="Screenshot of the Certificates and secrets page in Azure portal." lightbox="media/sentinel-mcp/custom-azure-secret.png":::

    > [!TIP]
    > Create a single app for all Sentinel custom tools, but create separate client secrets for each custom collection you want to add to your agent.
 
    >[!IMPORTANT]
    > Once the client secret is added, copy and save its **Value**, which you use in the next steps.

1.	Go back to the Azure portal's **Overview** page and copy and save the following values for the next steps:
    - Application (client) ID
    - Directory (tenant) ID

     :::image type="content" source="media/sentinel-mcp/custom-azure-ids.png" alt-text="Screenshot of the Overview page in Azure portal." lightbox="media/sentinel-mcp/custom-azure-ids.png":::

### Step 2: Add your custom MCP tool

1. Go to Azure AI Foundry and select an existing agent or a newly created agent. 

1. On the agent's page, go to the **Tools** section then select **Add** > **+ Add a new tool**.
 
      :::image type="content" source="media/sentinel-mcp/custom-foundry-add-tool.png" alt-text="Screenshot of an agent's page in Azure AI Foundry with Add a new tool highlighted." lightbox="media/sentinel-mcp/custom-foundry-add-tool.png":::

1.	On the pop-up window that appears, select **Custom** > **Model Context Protocol (MCP)** then select **Create**.
 
       :::image type="content" source="media/sentinel-mcp/custom-foundry-mcp.png" alt-text="Screenshot of the add tool setup in Azure AI Foundry." lightbox="media/sentinel-mcp/custom-foundry-mcp.png":::

1. Add the following values then select **Connect**:
    - **Name:** Enter a friendly name for your tool
    - **Remote MCP server endpoint:** Paste the endpoint you copied from your custom tool collection
    - **Authentication:** OAuth Identity Passthrough
    - **Client ID:** Use the **Application (client) ID** value you saved previously
    - **Client secret:** Use the secret value you saved previously
    - **Authorization URL:** Use the following format and replace `<tenant ID>` with the **Directory (tenant) ID** value you saved previously:
        ```
        https://login.microsoftonline.com/<tenant ID>/oauth2/v2.0/authorize
        ```
    - **Token URL:** Use the following format and replace `<tenant ID>` with the **Directory (tenant) ID** value you saved previously:
        ```
        https://login.microsoftonline.com/<tenant ID>/oauth2/v2.0/token
        ```
    - **Scope:** Use the following:         
        ```
        4500ebfb-89b6-4b14-a480-7f749797bfcd/.default
        ```
       
       :::image type="content" source="media/sentinel-mcp/custom-foundry-mcp-details.png" alt-text="Screenshot of the MCP details in add tool setup in Azure AI Foundry." lightbox="media/sentinel-mcp/custom-foundry-mcp-details.png":::
 
1. Go back to your agent's page, select the three-dot menu next to your newly added tool, and select **Edit**.
 
    :::image type="content" source="media/sentinel-mcp/custom-foundry-edit-tool.png" alt-text="Screenshot of an agent's page in Azure AI Foundry with Edit option highlighted." lightbox="media/sentinel-mcp/custom-foundry-edit-tool.png":::

1. Add all the tools you want Azure AI Foundry to call, separated by commas.
 
    :::image type="content" source="media/sentinel-mcp/custom-foundry-configure.png" alt-text="Screenshot of the Configure custom tool window in Azure AI Foundry." lightbox="media/sentinel-mcp/custom-foundry-configure.png":::

## Related content
- [Tool collection in Microsoft Sentinel MCP server](sentinel-mcp-tools-overview.md)