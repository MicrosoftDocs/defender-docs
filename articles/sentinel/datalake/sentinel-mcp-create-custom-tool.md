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

This article shows how you can enable agents to retrieve and reason over knowledge from your library of saved Kusto Query Language (KQL) queries in [advanced hunting](/defender-xdr/advanced-hunting-microsoft-defender?toc=%2Fazure%2Fsentinel%2FTOC.json&bc=%2Fazure%2Fsentinel%2Fbreadcrumb%2Ftoc.json) and Sentinel data lake by creating custom MCP tools. 

## Prerequisites
To create custom Microsoft Sentinel MCP tools, you need the following prerequisites:
- Microsoft Sentinel data lake and Microsoft Defender licenses
- **Security Operator**, **Security Admin**, or **Global Admin** role to create, update, or delete custom tools
- **Security reader** or **Global reader** role to list and invoke custom tools

## Create custom tools with KQL queries

You can use advanced hunting queries in Microsoft Defender portal and KQL queries in Microsoft Sentinel data lake to find and discover security data that you can use in agentic workflows. This approach lets you control the type and amount of information your agents can reason over. When you verify that a query retrieves the data you want your agent to reason with, save it as a custom MCP tool.

To save a KQL  query as an MCP tool, follow these steps:

1. In the **Advanced hunting** page in Microsoft Defender, find and discover from your manually authored KQL queries or from your library of saved queries the security data you want to use in your agentic flows, then open it in the query window.
1. Select **Save as tool** from any of the following Defender portal experiences:
    - Context menu of a query

        :::image type="content" source="media/sentinel-mcp/custom-tool-save-context-menu.png" alt-text="Screenshot of the Save as tool option in the context menu of a KQL query." lightbox="media/sentinel-mcp/custom-tool-save-context-menu.png":::

    - View details flyout panel of a saved query

        :::image type="content" source="media/sentinel-mcp/custom-tool-save-panel.png" alt-text="Screenshot of the Save as tool option in the flyout panel of a KQL query." lightbox="media/sentinel-mcp/custom-tool-save-panel.png":::

    - KQL query box menu of a query
        
        :::image type="content" source="media/sentinel-mcp/custom-tool-save-kql-box.png" alt-text="Screenshot of the Save as tool option in a KQL query box." lightbox="media/sentinel-mcp/custom-tool-save-kql-box.png":::

    - Context menu in tool collection

        :::image type="content" source="media/sentinel-mcp/custom-tool-save-context-collection.png" alt-text="Screenshot of the Save as tool option in the context menu of the tool collection." lightbox="media/sentinel-mcp/custom-tool-save-context-collection.png":::

1. In the MCP Custom Tool flyout panel that appears, enter the following details:
    - **Tool name:** The name you want to call the tool. Provide a discoverable tool name that helps AI models correctly identify and select the tool for specific tasks.
   - **Description:** The description of the tool. Similar to the tool name, make sure that the description helps the AI models to correctly identify and select the tool. Consider providing detailed examples that clearly illustrate the tool's purpose and intended use.
   - **Collection:** Choose whether you want to add the tool an existing tool collection or create a new one by selecting **Create new collection**. Each collection should be purpose-built for your agent with no overlapping tools to allow your agent to pick the right tool for the task at hand.
    - **Workspace:** The default workspace you want your agent to use as a hint whenever a prompt doesn't specify any workspaces. For example, if your prompt asks `What Defender alerts came in today?`, your agent runs the tool against the default workspace. If your prompt asks, `What Defender alerts came in my Sentinel-1 workspace?`, the agent runs your tool against the `Sentinel-1` workspace.
    - **Parameters (optional):** The customizable inputs the tool supports. You can convert some of the values in your KQL query into parameters following the `{ParamaterName}` format, then add their **Parameter name** and **Description** so that the agent has a good understanding on how to populate them based on available conversation context.

    :::image type="content" source="media/sentinel-mcp/custom-tool-save-panel.png" alt-text="Screenshot of the MCP custom tool flyout panel in advanced hunting." lightbox="media/sentinel-mcp/custom-tool-save-panel.png":::

    :::image type="content" source="media/sentinel-mcp/custom-tool-parameters.png" alt-text="Screenshot of a KQL query with certain values converted into parameters." lightbox="media/sentinel-mcp/custom-tool-parameters.png":::

1. Select **Save**.

### View saved custom MCP tools

To view the custom MCP tools you saved from advanced hunting queries, go to the **Tools** tab in the **Advanced hunting** page.

## Add custom tools in your security agents

This section provides instructions on how to add your custom tool collection in the following platforms:
- [Visual Studio Code](#visual-studio-code)
- [Security Copilot](#security-copilot)
- [Copilot Studio](#copilot-studio)
- [Azure AI Foundry](#azure-ai-foundry)

### Visual Studio Code
To add your custom tool collection in Visual Studio Code, see the steps outlined in [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md#visual-studio-code).

### Security Copilot
To add your custom tool collection in Security Copilot, follow these steps:

#### Step 1: Create a YAML file for your tool collection 
Use the following YAML file template to create and save your plugin. Specify which tools from your custom tool collection you want to add.

```yaml
Descriptor:
  Name: <Name of the collection>
  DisplayName: <Friendly name for the collection>
  Description: <Friendly description for the collection>
  DescriptionForModel: <Detailed description of the collection to help with AI selection>
SkillGroups:
- Format: MCP
  Settings:
    Endpoint: <Enter custom tool URL>
    TokenScope: 4500ebfb-89b6-4b14-a480-7f749797bfcd/.default
    UseStreamableHttp: true
    AllowedTools: <Comma-separated list of tool names to add>
    TimeoutInSeconds: 120
```

For more information about all the parameters you can add and configure in your YAML file, see [here].

#### Step 2: Add the YAML file as a custom plugin
1. Go to the [Security Copilot standalone portal](https://securitycopilot.microsoft.com/) and select the **Security Copilot sources** icon.
1. In **Manage plugins**, scroll down to the **Custom** section then select **Add plugin**.
1. From the drop-down options, specify if you want to make the plugin available to just yourself or anyone in the organization. 
1. Select **Security Copilot plugin**, choose the YAML file you created previously, then select **Add**.

    :::image type="content" source="media/sentinel-mcp/custom-copilot-add-plugin.png" alt-text="Screenshot of Add plugin pop-up window in Security Copilot with Security Copilot plugin and Add options highlighted." lightbox="media/sentinel-mcp/custom-copilot-add-plugin.png":::

1. Finish the setup. Once your plugin is visible in the **Custom** section, you can turn the toggle on or off.

    :::image type="content" source="media/sentinel-mcp/custom-copilot-toggle-plugin.png" alt-text="Screenshot of Custom plugin option in Security Copilot with the added plugin visible." lightbox="media/sentinel-mcp/custom-copilot-toggle-plugin.png":::

#### Step 3: Build an agent using the saved plugin
1. Go to https://securitycopilot.microsoft.com/builder and select **Start from Scratch** or open an existing custom agent.
1. In your agent skill, select **Add a tool** and find the custom plugin you saved previously.

    :::image type="content" source="media/sentinel-mcp/custom-copilot-add-tool.png" alt-text="Screenshot of Add a tool option in Security Copilot." lightbox="media/sentinel-mcp/custom-copilot-add-tool.png":::

    :::image type="content" source="media/sentinel-mcp/custom-copilot-search-tool.png" alt-text="Screenshot of Add a tool option in Security Copilot with the added plugin visible." lightbox="media/sentinel-mcp/custom-copilot-search-tool.png":::

1. Add the plugin to your agent.
 


### Copilot Studio
To add your custom tool collection in Copilot Studio, follow these steps:

>[!TIP]
>For the best performance with Sentinel MCP tools, use GPT-5 or a later version with a higher context window. 
>
>Open two browser tabs or windows because you'll switch between your tenant's [Azure portal](https://portal.azure.com) and your Copilot Studio page.

#### Step 1: Register an app in Azure portal
1.	Open your tenant's Azure portal, then go to **App registrations** > **New registration**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-new-reg.png" alt-text="Screenshot of Azure portal with New registration option highlighted." lightbox="media/sentinel-mcp/custom-azure-new-reg.png":::

1.	On the **Register an application** page, enter a friendly user-facing **Name** for the app, then select **Register**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-register.png" alt-text="Screenshot of the new application registration page in Azure portal." lightbox="media/sentinel-mcp/custom-azure-register.png":::
 
1.	On your newly registered app's page, go to **Manage** > **API permissions**, then select **Add a permission**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-permissions.png" alt-text="Screenshot of the API permissions page and flyout panel in Azure portal." lightbox="media/sentinel-mcp/custom-azure-permissions.png":::
 
1.	On the flyout panel that appears, go to the **APIs my organization uses** tab and search for `Sentinel Platform Services`.

    :::image type="content" source="media/sentinel-mcp/custom-azure-api-reg.png" alt-text="Screenshot of the APIs my organization uses tab in the Request API permissions panel in Azure portal." lightbox="media/sentinel-mcp/custom-azure-api-reg.png":::

1.	Choose **SentinelPlatform.DelegatedAccess**, then select **Add permissions**.
 
     :::image type="content" source="media/sentinel-mcp/custom-azure-permissions.png" alt-text="Screenshot of the Request API permissions panel in Azure portal with permissions selected." lightbox="media/sentinel-mcp/custom-azure-permissions.png":::

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

#### Step 2: Add your custom MCP tool to an agent

1.	Open Copilot Studio and select the agent where you want to add your custom tool. From the agent's **Overview** page, go to the **Tools** section and select **+ Add tool**.

1. On the pop-up window that appears, select **+ New tool**.

     :::image type="content" source="media/sentinel-mcp/custom-studio-add-tool.png" alt-text="Screenshot of Copilot Studio with the Add tool modal open." lightbox="media/sentinel-mcp/custom-studio-add-tool.png":::


1.	Select **Model Context Protocol** and add your custom tool collection’s details. Make sure that you add the following OAuth settings properly:
    - **Type:** Manual
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

     :::image type="content" source="media/sentinel-mcp/custom-studio-mcp-details.png" alt-text="Screenshot of the MCP details in Copilot Studio Add tool setup." lightbox="media/sentinel-mcp/custom-studio-mcp-details.png":::
     
1. Select **Create**. Your tool is created successfully and a redirect URL is generated. Copy and save this URL and leave the pop-up window open for now.

     :::image type="content" source="media/sentinel-mcp/custom-studio-redirect.png" alt-text="Screenshot of the URL redirect details in Copilot Studio Add tool setup." lightbox="media/sentinel-mcp/custom-studio-redirect.png":::

#### Step 3: Authenticate Copilot Studio to use your custom tool
 
1. Go back to your tenant's Azure portal and into the app you just added then select **Add a redirect URI**.
 
1. Select **+ Add a platform** > **Web**.

     :::image type="content" source="media/sentinel-mcp/custom-azure-add-platform.png" alt-text="Screenshot of the Authentication page in Azure portal." lightbox="media/sentinel-mcp/custom-azure-add-platform.png":::


1. In the **Redirect URIs** text box, add the redirect URL you copied then select **Configure**. 

1. Go back to the Copilot Studio pop-window window and select **Next**.


1. Select **Create new connection**. If the tool connects successfully, a green check mark appears beside the connection. 


     :::image type="content" source="media/sentinel-mcp/custom-studio-new-connection.png" alt-text="Screenshot of the connection details in Copilot Studio Add tool setup." lightbox="media/sentinel-mcp/custom-studio-new-connection.png":::

1.	Select **Add and configure**.
 

### Azure AI Foundry
To add your custom tool collection in Azure AI Foundry, follow these steps:

#### Step 1: Register an app in Azure portal
1.	Open your tenant's [Azure portal](https://portal.azure.com) then go to **App registrations** > **New registration**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-new-reg.png" alt-text="Screenshot of Azure portal with New registration option highlighted." lightbox="media/sentinel-mcp/custom-azure-new-reg.png":::

1.	On the **Register an application** page, enter a friendly user-facing **Name** for the app, then select **Register**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-register.png" alt-text="Screenshot of the new application registration page in Azure portal." lightbox="media/sentinel-mcp/custom-azure-register.png":::
 
1.	On your newly registered app's page, go to **Manage** > **API permissions**, then select **Add a permission**.

    :::image type="content" source="media/sentinel-mcp/custom-azure-permissions.png" alt-text="Screenshot of the API permissions page and flyout panel in Azure portal." lightbox="media/sentinel-mcp/custom-azure-permissions.png":::
 
1.	On the flyout panel that appears, go to the **APIs my organization uses** tab and search for `Sentinel Platform Services`.

    :::image type="content" source="media/sentinel-mcp/custom-azure-api-reg.png" alt-text="Screenshot of the APIs my organization uses tab in the Request API permissions panel in Azure portal." lightbox="media/sentinel-mcp/custom-azure-api-reg.png":::

1.	Choose **SentinelPlatform.DelegatedAccess**, then select **Add permissions**.
 
     :::image type="content" source="media/sentinel-mcp/custom-azure-permissions.png" alt-text="Screenshot of the Request API permissions panel in Azure portal with permissions selected." lightbox="media/sentinel-mcp/custom-azure-permissions.png":::

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

#### Step 2: Add your custom MCP tool

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
- [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md)
- [Tool collection in Microsoft Sentinel MCP server](sentinel-mcp-tools-overview.md)