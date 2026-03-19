---
title: Microsoft Sentinel custom connector wizard - Getting started guide
description: Learn how to create and deploy custom codeless connectors for Microsoft Sentinel through the connector wizard.
author: EdB-MSFT
ms.service: microsoft-sentinel
ms.author: edbaynash
ms.topic: how-to
ms.date: 3/23/2026
# customer intent: As a security engineer or ISV partner, I want to understand how to build a simple REST API custom connector in the wizard so I can send real-time data from my application to Microsoft Sentinel.
---

# Getting started with the Microsoft Sentinel connector wizard (preview)

This guide helps you understand, build, and deploy custom codeless connectors for Microsoft Sentinel using the connector wizard.

## What is the Microsoft Sentinel connector wizard?

The Microsoft Sentinel connector wizard simplifies the process of creating and deploying a custom codeless connector. It handles ARM template formatting and deployment so you can focus on defining the desired behavior of the data connector.

The wizard's custom connector drafts are autosaved in your browser cache. To access your drafts in another browser or to store them for version control, use the draft manager pane to export your drafts into JSON files. Drafts saved in this way can be imported into the tool again later.

## Prerequisites

Before building a connector, it's important to understand the shape of your data stream and the fields you want to include in the output table. Reference your data source documentation or analyze sufficient output examples.

Research the following components and verify support for them in the [Data Connector API reference](data-connector-connection-rules-reference.md):

- HTTP request and response structure to the data source

- Authentication required by the data source.<br>For example, if your data source requires a token signed with a certificate, the data connector API reference specifies cert authentication isn't supported.

- Pagination options to the data source

## How to use the Microsoft Sentinel Connector Wizard

Visit the Defender portal's [Sentinel Data Connectors experience](https://security.microsoft.com/sentinel/connectors)

Open the draft manager using the action button labeled **Create custom connector**. From within the draft manager, you can choose to start a new custom connector draft or to import a draft. You can also edit, delete, or export existing drafts currently stored in the browser cache.

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-drafts.png" alt-text="Screenshot of Draft manager interface with options to create a new custom connector or import a draft.":::

The following sections walk you through using the Microsoft Sentinel connector wizard.

### Basics
  
Name your custom data connector and provide:

- **Connector name:** Display name of your data connector
- **Author:** Provider of your data connector (your name, email, or organization)
- **Description:** Description of your custom data connector. This field supports Markdown formatting.
- **Version:** If you want to use a different major and minor version other than the default "1.0," change it here. The patch version isn't configurable, as we construct it from the datetime of the most recent update to the data connector draft.

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-basics.png" alt-text="Screenshot of the Name tab in the custom connector wizard showing fields for Connector name, Author, Description, and Version.":::

### Authentication

Define the authentication flow for your data connector:

1. Select one of the following supported auth types:

    - **Basic:** Username and password
    - **API key:** API key
    - **OAuth2:** OAuth2 style auth

1. For API key or OAuth2, provide further auth details. If using basic authentication, no further auth details are necessary.

    - For **API key**, provide:

      - **Header name:** Name of the HTTP header that should carry the API key, for example "Authorization" or "x-api-key"
      - **Prefix:** Prefix identifier of the API key, such as "Bearer" if the header value should be of the format "Bearer {{apiKey}}"
      - **(Optional) Is API key in POST payload?** Indicate if the API key should be transmitted in a POST payload rather than in HTTP headers.

    - For **OAuth2**:

      1. Select either `client_credentials` or `authorization_code` grant type. Default is `client_credentials`
      1. If using `authorization_code` grant type, provide
          - **Authorization endpoint:** URL of the authorization endpoint in the OAuth2 flow
          - **(Optional) Authorization endpoint headers:** HTTP headers to include in the request to the authorization endpoint
          - **(Optional) Authorization endpoint query parameters:** URL query parameters to include in the request to the authorization endpoint
      1. Be sure to provide
          - **Token endpoint:** URL of the token endpoint in the OAuth2 flow
          - **(Optional) Token endpoint headers:** HTTP headers to include in the request to the token endpoint
          - **(Optional) Token endpoint query parameters:** URL query parameters to include in the request to the token endpoint
          - **(Optional) Scope:** Scope to include in the OAuth2 flow
          - **(Semi-optional) Include redirect URI?** Indicate if a redirect URI must be included for the OAuth2 flow. This field must be configured to "yes" when using the `authorization_code` grant type.

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-authentication.png" alt-text="Screenshot of the Authentication tab in the custom connector wizard showing options for Basic, API key, and OAuth2 authentication.":::

### Request

To configure the HTTP request structure for your data connector, provide the following information:

- **API endpoint:** URL of the API endpoint from which to fetch data.
- **HTTP method:** GET or POST
- **(if GET) Query parameters:** URL query parameters of the HTTP GET request
- **(if POST) Payload:** Content of the HTTP POST request body
- **(Optional) Headers:** HTTP headers to include in the request
- **Query window:** Time window size in minutes. This field determines how frequently the data connector polls your API.
- **(Optional) Query window delay:** Number of minutes by which to delay the query window. Use this field to accommodate ingestion delays on an API, for example if it takes 30 minutes after event time for the API to surface new event data.
- Other fields as described within the wizard. For more information, see the [CCF request configuration docs](data-connector-connection-rules-reference.md#request-configuration).

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-request.png" alt-text="Screenshot of the Request tab in the custom connector wizard showing fields for API endpoint, HTTP method, query parameters, payload, headers, and query window.":::

### Response

Supply a sample response from the API and design a JSONPath expression that extracts the response's relevant data.

1. Supply a sample response from your REST API.
1. Provide a JSONPath expression that extracts the response's relevant data. If your JSONPath expression is correct, the preview table in this step of the wizard should display rows that represent individual events from the sample API response.

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-response.png" alt-text="Screenshot of the Response tab in the custom connector wizard showing fields for sample JSON data and JSONPath expression, along with a preview table.":::

### DCR configuration

Configure the mapping between attributes from API response and columns of the custom Log Analytics table where your data gets stored:

1. Name the custom Log Analytics table where your data gets stored. The wizard automatically appends the suffix "_CL" to the table name.
1. Use the **Auto populate from sample data** button to automatically generate Log Analytics table fields from the information entered in the [Response](#response) step. Be sure to manually correct any validation issues in the generated fields, such as column names that might be too long or disallowed.
1. Add, edit, or delete fields from the table schema as you see fit.
1. If using a custom KQL transformation rather than a mapping between the source attribute and the output field, be sure to supply correct KQL syntax.
      - Access top-level attributes with brackets. For example, given the attribute "unixTimeStamp" use `(['unixTimestamp'] * 1ms) + datetime(1970-01-01)` instead of `(unixTimestamp * 1ms) + datetime(1970-01-01)`.
      - If an attribute is nested, for example some `event.timestamp`, bracket syntax isn't necessary.

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-configuration.png" alt-text="Screenshot of the DCR configuration tab in the custom connector wizard showing fields for table name, auto-populated table schema, and KQL transformation.":::

### Paging

If your API supports pagination, configure the pagination style to be used in your data connector.

1. Select one of the supported pagination styles. See the [CCF paging configuration docs](data-connector-connection-rules-reference.md#paging-configuration) and your API's references for guidance.

    - **LinkHeader**
    - **PersistentLinkHeader**
    - **NextPageToken**
    - **PersistentToken**
    - **NextPageUrl**
    - **CountBasedPaging**
    - **Offset**

1. Provide paging details as necessary for your selected paging type.

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-paging.png" alt-text="Screenshot of the Paging tab in the custom connector wizard showing options for pagination style and related details.":::

### Connector details

Customize the UI content and provide helpful instructions for the end-user:

1. Provide

    - **Title:** Title of your instruction step.
    - **Description:** Description body of your instruction step. This field accepts Markdown.

1. Edit the individual instructions for your data connector. This section should contain auth fields and any other fields that should be supplied by the end-user of the data connector. Usage of field syntax `{{fieldName}}` in previous steps introduces the fields available in the connector details.

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-details.png" alt-text="Screenshot of the Connector details tab in the custom connector wizard showing fields for instruction title, description, and individual instructions.":::

### Review

Review your data connector. Deploy the generated ARM template to your current Sentinel workspace, or download the ARM template if you wish to make modifications that the wizard doesn't support.

:::image type="content" source="./media/create-custom-connector-wizard/custom-connector-review.png" alt-text="Screenshot of the Review tab in the custom connector wizard showing a summary of the connector configuration and options to deploy or download the ARM template.":::

## After completing the wizard workflow

If you deployed the custom data connector in the final step of the wizard, you can proceed to enable the data connector. If you downloaded the ARM template to make your own modifications, you can deploy the template manually and then enable it.

### Enable the data connector

After deploying the solution package, refresh the Sentinel Data Connectors page to view the newly deployed data connector. Then, open the connector details and enable the connector to provision resources and generate credentials.

1. Navigate to / refresh your Microsoft Sentinel in the browser.
1. Go to **Configuration** > **Data connectors**
1. Select your data connector.
1. In the details panel, select **Open connector page**.
1. Provide the information required by the data connector, including credentials for authentication.
1. Use the **Connect** button and wait for the connection to complete.

### (Optional) Manual ARM template deployment

If you downloaded an ARM template from the wizard, it can be manually deployed through the ARM template deployment workflow in Azure portal. See the following steps.

1. In the Azure portal, search for **Deploy a custom template**
1. Select **Build your own template in the editor**
1. Select **Load file** and select your ARM template
1. Select **Save**
1. Fill in the deployment parameters:
    - **Subscription:** Your Azure subscription
    - **Resource Group:** The resource group containing your Sentinel workspace
    - **Region:** Same region as your Sentinel workspace
    - **Workspace:** Your Log Analytics workspace name
1. Select **Review + create**, then **Create**

This deployment makes the connector available in your Microsoft Sentinel data connectors gallery.

For detailed steps, see [Quickstart: Create and deploy ARM templates by using the Azure portal](/azure/azure-resource-manager/templates/quickstart-create-templates-use-the-portal).

## More resources

### CCF documentation

- [Create a codeless connector (CCF Pull)](/azure/sentinel/create-codeless-connector) - Polling-based connectors.
- [Data Connector Definitions API reference](/rest/api/securityinsights/data-connector-definitions) - UI configuration guide.
- [Data connector connection rules reference](/azure/sentinel/create-codeless-connector) - Connection rules for polling connectors.

### Azure Monitor and data collection

- [Azure Monitor Logs Ingestion API](/azure/azure-monitor/logs/logs-ingestion-api-overview) - Core API for sending data.
- [Data collection rules in Azure Monitor](/azure/azure-monitor/essentials/data-collection-rule-overview) - Understanding DCRs.
- [Structure of a data collection rule](/azure/azure-monitor/essentials/data-collection-rule-structure) - DCR structure details.
- [Data collection endpoints in Azure Monitor](/azure/azure-monitor/essentials/data-collection-endpoint-overview) - DCE configuration.
- [Tutorial: Send data to Azure Monitor Logs with Logs ingestion API](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal) - Step-by-step tutorial.
- [Create a custom table](/azure/azure-monitor/logs/create-custom-table) - Custom table creation guide.

### Authentication and security

- [OAuth 2.0 client credentials flow](/entra/identity-platform/v2-oauth2-client-creds-grant-flow) - How app-to-service authentication works.
- [Microsoft identity platform access tokens](/entra/identity-platform/access-tokens) - Understanding OAuth tokens.
- [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app) - How to register an application in Microsoft Entra ID.
- [Best practices for Azure AD application registration](/entra/identity-platform/security-best-practices-for-app-registration) - Entra app security.
- [Assign Azure roles using Azure Resource Manager (ARM) templates](/azure/role-based-access-control/role-assignments-template) - Assign roles using templates.
- [ARM template security recommendations](/azure/azure-resource-manager/templates/best-practices#security-recommendations-for-parameters) - Securing deployment templates.
- [Azure Monitor service limits](/azure/azure-monitor/service-limits) - Rate limits and quotas.

### Microsoft Sentinel

- [About Microsoft Sentinel solutions](/azure/sentinel/sentinel-solutions) - Packaging connectors as solutions.
- [Monitor the health of your data connectors](/azure/sentinel/monitor-data-connector-health) - Health monitoring.
- [ARM template reference for data connectors](/rest/api/securityinsights/data-connectors) - Complete API reference.

## Get help

- For ISV partners building integrations, contact: <azuresentinelpartner@microsoft.com>
- For technical questions, use [Microsoft Q&A](/answers/topics/azure-sentinel.html) with the tag 'azure-sentinel'
