---
author: EdB-MSFT
ms.author: edbaynash
ms.topic: include
ms.date: 08/04/2026

# This file is auto-generated. Do not edit manually. Changes will be overwritten.
---

<a name="deprecated-auth0-logs-using-azure-function-using-azure-functions"></a><details><summary>**[Deprecated] Auth0 Logs (using Azure Function) (using Azure Functions)**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

The [Auth0 Logs (using Azure Function)](https://auth0.com/access-management) data connector provides the capability to ingest [Auth0 log events](https://auth0.com/docs/api/management/v2/#!/Logs/get_logs) into Microsoft Sentinel

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`Auth0AM_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **Microsoft.Web/sites permissions**: Read and write permissions to Azure Functions to create a Function App is required. For more information, see [Azure Functions](/azure/azure-functions/).
- **REST API Credentials/permissions**: **API token** is required. For more information, see [API token](https://auth0.com/docs/secure/tokens/access-tokens/get-management-api-access-tokens-for-production)

**Setup Instructions:**

 >**NOTE:** This connector uses Azure Functions to connect to the Auth0 Management APIs to pull its logs into Microsoft Sentinel. This might result in additional data ingestion costs. Check the [Azure Functions pricing page](https://azure.microsoft.com/pricing/details/functions/) for details.

**(Optional Step)** Securely store workspace and API authorization key(s) or token(s) in Azure Key Vault. Azure Key Vault provides a secure mechanism to store and retrieve key values. [Follow these instructions](/azure/app-service/app-service-key-vault-references) to use Azure Key Vault with an Azure Function App.

STEP 1 - Configuration steps for the Auth0 Management API

 Follow the instructions to obtain the credentials.

1. In Auth0 Dashboard, go to **Applications > Applications**.
2. Select your Application. This should be a "Machine-to-Machine" Application configured with at least **read:logs and read:logs_users** permissions.
3. Copy **Domain, ClientID, Client Secret**

STEP 2 - Choose ONE from the following two deployment options to deploy the connector and the associated Azure Function

>**IMPORTANT:** Before deploying the Auth0 Access Management data connector, have the Workspace ID and Workspace Primary Key (can be copied from the following).

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the Auth0 Access Management data connector using an ARM Template.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-Auth0AccessManagement-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Location**. 
> **NOTE:** Within the same resource group, you can't mix Windows and Linux apps in the same region. Select existing resource group without Windows apps in it or create new resource group.
3. Enter the ****Domain, ClientID, Client Secret**, AzureSentinelWorkspaceId, AzureSentinelSharedKey**. 
4. Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5. Click **Purchase** to deploy.

**Option 2 - Manual Deployment of Azure Functions**

Use the following step-by-step instructions to deploy the Auth0 Access Management data connector manually with Azure Functions (Deployment via Visual Studio Code).

1. Deploy a Function App

> **NOTE:** You will need to [prepare VS code](/azure/azure-functions/functions-create-first-function-python#prerequisites) for Azure function development.

1. Download the [Azure Function App](https://aka.ms/sentinel-Auth0AccessManagement-azuredeploy) file. Extract archive to your local development computer.
2. Start VS Code. Choose File in the main menu and select Open Folder.
3. Select the top level folder from extracted files.
4. Choose the Azure icon in the Activity bar, then in the **Azure: Functions area, choose the Deploy to function app** button.
If you aren't already signed in, choose the Azure icon in the Activity bar, then in the **Azure: Functions area, choose Sign in to Azure**
If you're already signed in, go to the next step.
5. Provide the following information at the prompts:

	a. **Select folder:** Choose a folder from your workspace or browse to one that contains your function app.

	b. **Select Subscription:** Choose the subscription to use.

	c. Select **Create new Function App in Azure** (Don't choose the Advanced option)

	d. **Enter a globally unique name for the function app:** Type a name that is valid in a URL path. The name you type is validated to make sure that it's unique in Azure Functions. (e.g. Auth0AMXXXXX).

	e. **Select a runtime:** Choose Python 3.11.

	f. Select a location for new resources. For better performance and lower costs choose the same [region](https://azure.microsoft.com/regions/) where Microsoft Sentinel is located.

6. Deployment will begin. A notification is displayed after your function app is created and the deployment package is applied.
7. Go to Azure Portal for the Function App configuration.

2. Configure the Function App

1. In the Function App, select the Function App Name and select **Configuration**.
2. In the **Application settings tab, select  New application setting**.
3. Add each of the following application settings individually, with their respective string values (case-sensitive): 
		DOMAIN
		CLIENT_ID
		CLIENT_SECRET
		WorkspaceID
		WorkspaceKey
		logAnalyticsUri (optional)
 - Use logAnalyticsUri to override the log analytics API endpoint for dedicated cloud. For example, for public cloud, leave the value empty; for Azure GovUS cloud environment, specify the value in the following format: `https://<CustomerId>.ods.opinsights.azure.us`.
4. Once all application settings have been entered, click **Save**.

<br><br>
</details> 

 ---
   
<a name="deprecated-box-events-using-azure-function-using-azure-functions"></a><details><summary>**[Deprecated] Box Events (using Azure Function) (using Azure Functions)**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

The Box data connector provides the capability to ingest [Box enterprise's events](https://developer.box.com/guides/events/#admin-events) into Microsoft Sentinel using the Box REST API. Refer to [Box  documentation](https://developer.box.com/guides/events/enterprise-events/for-enterprise/) for more information.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`BoxEvents_CL`|No|No|

**Data collection rule support:** Not currently supported

**Prerequisites:**

- **Microsoft.Web/sites permissions**: Read and write permissions to Azure Functions to create a Function App is required. For more information, see [Azure Functions](/azure/azure-functions/).
- **Box API Credentials**: Box config JSON file is required for Box REST API JWT authentication. For more information, see [JWT authentication](https://developer.box.com/guides/authentication/jwt/).

**Setup Instructions:**

 >**NOTE:** This connector uses Azure Functions to connect to the Box REST API to pull logs into Microsoft Sentinel. This might result in additional data ingestion costs. Check the [Azure Functions pricing page](https://azure.microsoft.com/pricing/details/functions/) for details.

**(Optional Step)** Securely store workspace and API authorization key(s) or token(s) in Azure Key Vault. Azure Key Vault provides a secure mechanism to store and retrieve key values. [Follow these instructions](/azure/app-service/app-service-key-vault-references) to use Azure Key Vault with an Azure Function App.

>**NOTE:** This connector depends on a parser based on Kusto Function to work as expected [**BoxEvents**](https://aka.ms/sentinel-BoxDataConnector-parser) which is deployed with the Microsoft Sentinel Solution.

STEP 1 - Configuration of the Box events collection

See documentation to [setup JWT authentication](https://developer.box.com/guides/authentication/jwt/jwt-setup/) and [obtain JSON file with credentials](https://developer.box.com/guides/authentication/jwt/with-sdk/#prerequisites).

STEP 2 - Choose ONE from the following two deployment options to deploy the connector and the associated Azure Function

>**IMPORTANT:** Before deploying the Box data connector, have the Workspace ID and Workspace Primary Key (can be copied from the following), as well as the Box JSON configuration file, readily available.

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the Box data connector using an ARM Tempate.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-BoxDataConnector-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. Enter the **AzureSentinelWorkspaceId, AzureSentinelSharedKey, BoxConfigJSON**
4. Mark the checkbox labeled **I agree to the terms and conditions stated above**.
5. Click **Purchase** to deploy.

**Option 2 - Manual Deployment of Azure Functions**

Use the following step-by-step instructions to deploy the Box data connector manually with Azure Functions (Deployment via Visual Studio Code).

**Step 1 - Deploy a Function App**

1. Download the [Azure Function App](https://aka.ms/sentinel-BoxDataConnector-functionapp) file. Extract archive to your local development computer.
2. Follow the [function app manual deployment instructions](https://github.com/Azure/Azure-Sentinel/blob/master/DataConnectors/AzureFunctionsManualDeployment.md#function-app-manual-deployment-instructions) to deploy the Azure Functions app using VSCode.
3. After successful deployment of the function app, follow next steps for configuring it.

**Step 2 - Configure the Function App**

1. Go to Azure Portal for the Function App configuration.
2. In the Function App, select the Function App Name and select **Configuration**.
3. In the **Application settings tab, select + New application setting**.
4. Add each of the following application settings individually, with their respective string values (case-sensitive): 
		AzureSentinelWorkspaceId
		AzureSentinelSharedKey
		BOX_CONFIG_JSON
		logAnalyticsUri (optional)
 - Use logAnalyticsUri to override the log analytics API endpoint for dedicated cloud. For example, for public cloud, leave the value empty; for Azure GovUS cloud environment, specify the value in the following format: `https://<CustomerId>.ods.opinsights.azure.us`.
5. Once all application settings have been entered, click **Save**.



<br><br>
</details> 

 ---
   
<a name="deprecated-github-enterprise-audit-log"></a><details><summary>**[Deprecated] GitHub Enterprise Audit Log**</summary>

**Supported by:** [Microsoft Corporation](https://azure.microsoft.com/support/options/)

The GitHub audit log connector provides the capability to ingest GitHub logs into Microsoft Sentinel. By connecting GitHub audit logs into Microsoft Sentinel, you can view this data in workbooks, use it to create custom alerts, and improve your investigation process. 

 **Note:** If you intended to ingest GitHub subscribed events into Microsoft Sentinel, please refer to GitHub (using Webhooks) Connector from "**Data Connectors**" gallery.

<p>NOTE: This data connector has been deprecated, consider moving to the CCF data connector available in the solution which replaces ingestion via the <a href='/azure/azure-monitor/logs/custom-logs-migrate' >deprecated HTTP Data Collector API</a>.</p>

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`GitHubAuditLogPolling_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **GitHub API personal access token**: You need a GitHub personal access token to enable polling for the organization audit log. You may use either a classic token with 'read:org' scope OR a fine-grained token with 'Administration: Read-only' scope.
- **GitHub Enterprise type**: This connector will only function with GitHub Enterprise Cloud; it will not support GitHub Enterprise Server. 

**Setup Instructions:**

 **Connect the GitHub Enterprise Organization-level Audit Log to Microsoft Sentinel**

Enable GitHub audit logs. 
 Follow [this guide](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) to create or find your personal access token.


<br><br>
</details> 

 ---
   
<a name="deprecated-infoblox-soc-insight-data-connector-via-legacy-agent"></a><details><summary>**[Deprecated] Infoblox SOC Insight Data Connector via Legacy Agent**</summary>

**Supported by:** [Infoblox](https://support.infoblox.com/)

The Infoblox SOC Insight Data Connector allows you to easily connect your Infoblox BloxOne SOC Insight data with Microsoft Sentinel. By connecting your logs to Microsoft Sentinel, you can take advantage of search & correlation, alerting, and threat intelligence enrichment for each log. 

This data connector ingests Infoblox SOC Insight CDC logs into your Log Analytics Workspace using the legacy Log Analytics agent.

**Microsoft recommends installation of Infoblox SOC Insight Data Connector via AMA Connector.** The legacy connector uses the Log Analytics agent which is about to be deprecated by **Aug 31, 2024,** and should only be installed where AMA is not supported.

 Using MMA and AMA on the same machine can cause log duplication and extra ingestion cost. [More details](/azure/sentinel/ama-migrate).

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|[`CommonSecurityLog`](/azure/azure-monitor/reference/tables/CommonSecurityLog)|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Setup Instructions:**

 **Workspace Keys**

In order to use the playbooks as part of this solution, find your **Workspace ID and Workspace Primary Key** below for your convenience.

  - **Workspace ID**: <variable value provided at install time>
  - **Workspace Key**: <variable value provided at install time>

**Parsers**

This data connector depends on a parser based on a Kusto Function to work as expected called [**InfobloxCDC_SOCInsights**](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/Infoblox%20SOC%20Insights/Parsers/InfobloxCDC_SOCInsights.yaml) which is deployed with the Microsoft Sentinel Solution.

**SOC Insights**

This data connector assumes you have access to Infoblox BloxOne Threat Defense SOC Insights. You can find more information about SOC Insights [**here**](https://docs.infoblox.com/space/BloxOneThreatDefense/501514252/SOC+Insights). 

**Infoblox Cloud Data Connector**

This data connector assumes an Infoblox Data Connector host has already been created and configured in the Infoblox Cloud Services Portal (CSP). As the [**Infoblox Data Connector**](https://docs.infoblox.com/display/BloxOneThreatDefense/Deploying+the+Data+Connector+Solution) is a feature of BloxOne Threat Defense, access to an appropriate BloxOne Threat Defense subscription is required. See this [**quick-start guide**](https://www.infoblox.com/wp-content/uploads/infoblox-deployment-guide-data-connector.pdf) for more information and licensing requirements.

**1. Linux Syslog agent configuration**

Install and configure the Linux agent to collect your Common Event Format (CEF) Syslog messages and forward them to Microsoft Sentinel.

 Notice that the data from all regions will be stored in the selected workspace

**1.1 Select or create a Linux machine**

Select or create a Linux machine that Microsoft Sentinel will use as the proxy between your security solution and Microsoft Sentinel this machine can be on your on-prem environment, Azure or other clouds.

**1.2 Install the CEF collector on the Linux machine**

Install the Microsoft Monitoring Agent on your Linux machine and configure the machine to listen on the necessary port and forward messages to your Microsoft Sentinel workspace. The CEF collector collects CEF messages on port 514 TCP.

 1. Make sure that you have Python on your machine using the following command: python -version.

 2. You must have elevated permissions (sudo) on your machine.

  - **Run the following command to install and apply the CEF collector:**: <variable value provided at install time>

**2. Within the Infoblox Cloud Services Portal, configure Infoblox BloxOne to send CEF Syslog data to the Infoblox Cloud Data Connector to forward to the Syslog agent**

Follow the steps below to configure the Infoblox CDC to send BloxOne data to Microsoft Sentinel via the Linux Syslog agent.
1. Navigate to **Manage > Data Connector**.
2. Click the **Destination Configuration** tab at the top.
3. Click **Create > Syslog**. 
 - **Name: Give the new Destination a meaningful name, such as Microsoft-Sentinel-Destination**.
 - **Description: Optionally give it a meaningful description**.
 - **State: Set the state to Enabled**.
 - **Format: Set the format to CEF**.
 - **FQDN/IP**: Enter the IP address of the Linux device on which the Linux agent is installed.
 - **Port: Leave the port number at 514**.
 - **Protocol**: Select desired protocol and CA certificate if applicable.
 - Click **Save & Close**.
4. Click the **Traffic Flow Configuration** tab at the top.
5. Click **Create**.
 - **Name: Give the new Traffic Flow a meaningful name, such as Microsoft-Sentinel-Flow**.
 - **Description: Optionally give it a meaningful description**. 
 - **State: Set the state to Enabled**. 
 - Expand the **Service Instance** section. 
- **Service Instance**: Select your desired Service Instance for which the Data Connector service is enabled. 
 - Expand the **Source Configuration** section.  
- **Source: Select BloxOne Cloud Source**. 
- Select the **Internal Notifications** Log Type.
 - Expand the **Destination Configuration** section.  
- Select the **Destination** you just created. 
 - Click **Save & Close**. 
6. Allow the configuration some time to activate.

**3. Validate connection**

Follow the instructions to validate your connectivity:

Open Log Analytics to check if the logs are received using the CommonSecurityLog schema.

It may take about 20 minutes until the connection streams data to your workspace.

If the logs are not received, run the following connectivity validation script:

 1. Make sure that you have Python on your machine using the following command: python -version

2. You must have elevated permissions (sudo) on your machine

  - **Run the following command to validate your connectivity:**: <variable value provided at install time>

**4. Secure your machine **

Make sure to configure the machine's security according to your organization's security policy

[Learn more >](https://aka.ms/SecureCEF)

<br><br>
</details> 

 ---
   
<a name="deprecated-ionix-security-logs-push"></a><details><summary>**[Deprecated] IONIX Security Logs (Push)**</summary>

**Supported by:** [IONIX](https://ionix.io/)

⚠️ **This connector is deprecated and will be removed in June 2026.** Please use the new 'IONIX Security Logs (via Codeless Connector Framework)' connector instead, which provides automatic daily polling without requiring manual configuration in the IONIX portal.

---

The IONIX Security Logs data connector ingests logs from the IONIX system directly into Sentinel. The connector allows users to visualize their data, create alerts and incidents and improve security investigations.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`CyberpionActionItems_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **IONIX Subscription**: A subscription and account is required for IONIX logs. [One can be acquired here.](https://azuremarketplace.microsoft.com/en/marketplace/apps/cyberpion1597832716616.cyberpion)

**Setup Instructions:**

 Follow the [instructions](https://www.ionix.io/integrations/azure-sentinel/) to integrate IONIX Security Alerts into Sentinel.

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

<br><br>
</details> 

 ---
   
<a name="deprecated-lookout"></a><details><summary>**[Deprecated] Lookout**</summary>

**Supported by:** [Lookout](https://www.lookout.com/support)

The [Lookout](https://lookout.com) data connector provides the capability to ingest [Lookout](https://esupport.lookout.com/s/article/Mobile-Risk-API-V2-Guide#commoneventfields) events into Microsoft Sentinel through the Mobile Risk API. Refer to [API documentation](https://esupport.lookout.com/s/article/Mobile-Risk-API-V2-Guide) for more information. The [Lookout](https://lookout.com) data connector provides ability to get events which helps to examine potential security risks and more.

<p>NOTE: This data connector has been deprecated, consider moving to the CCF data connector available in the solution which replaces ingestion via the <a href='/azure/azure-monitor/logs/custom-logs-migrate' >deprecated HTTP Data Collector API</a>.</p>

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`Lookout_CL`|No|No|

**Data collection rule support:** Not currently supported

**Prerequisites:**

- **Microsoft.Web/sites permissions**: Read and write permissions to Azure Functions to create a Function App is required. For more information, see [Azure Functions](/azure/azure-functions/).
- **Mobile Risk API Credentials/permissions**: **EnterpriseName** & **ApiKey** are required for Mobile Risk API. For more information, see [API](https://esupport.lookout.com/s/article/Mobile-Risk-API-V2-Guide). Check all [requirements and follow  the instructions](https://esupport.lookout.com/s/article/Mobile-Risk-API-V2-Guide#authenticatingwiththemobileriskapi) for obtaining credentials.

**Setup Instructions:**

 >**NOTE:** This [Lookout](https://lookout.com) data connector uses Azure Functions to connect to the Mobile Risk API to pull its events into Microsoft Sentinel. This might result in additional data ingestion costs. Check the [Azure Functions pricing page](https://azure.microsoft.com/pricing/details/functions/) for details.

>**NOTE:** This data connector depends on a parser based on a Kusto Function to work as expected [**LookoutEvents**](https://aka.ms/sentinel-lookoutapi-parser) which is deployed with the Microsoft Sentinel Solution.

STEP 1 - Configuration steps for the Mobile Risk API

 [Follow the instructions](https://esupport.lookout.com/s/article/Mobile-Risk-API-V2-Guide#authenticatingwiththemobileriskapi) to obtain the credentials. 


STEP 2 - Follow below mentioned instructions to deploy the [Lookout](https://lookout.com) data connector and the associated Azure Function

>**IMPORTANT:** Before starting the deployment of the [Lookout](https://lookout.com) data connector, make sure to have the Workspace ID and Workspace Key ready (can be copied from the following).

  - **Workspace ID**: <variable value provided at install time>
  - **Workspace Key**: <variable value provided at install time>

**Azure Resource Manager (ARM) Template**

Follow below steps for automated deployment of the [Lookout](https://lookout.com) data connector using an ARM Template.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-lookoutapi-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Region**. 
> **NOTE:** Within the same resource group, you can't mix Windows and Linux apps in the same region. Select existing resource group without Windows apps in it or create new resource group.
3. Enter the **Function Name, Workspace ID**,**Workspace Key**,**Enterprise Name & Api Key** and deploy. 
4. Click **Create** to deploy.

<br><br>
</details> 

 ---
   
<a name="deprecated-microsoft-exchange-logs-and-events"></a><details><summary>**[Deprecated] Microsoft Exchange Logs and Events**</summary>

**Supported by:** [Community](https://github.com/Azure/Azure-Sentinel/issues)

Deprecated, use the 'ESI-Opt' dataconnectors. You can stream all Exchange Audit events, IIS Logs, HTTP Proxy logs and Security Event logs from the Windows machines connected to your Microsoft Sentinel workspace using the Windows agent. This connection enables you to view dashboards, create custom alerts, and improve investigation. This is used by Microsoft Exchange Security Workbooks to provide security insights of your On-Premises Exchange environment

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|[`Event`](/azure/azure-monitor/reference/tables/Event)|Yes|No|
|[`SecurityEvent`](/azure/azure-monitor/reference/tables/SecurityEvent)|Yes|Yes|
|[`W3CIISLog`](/azure/azure-monitor/reference/tables/W3CIISLog)|Yes|No|
|`MessageTrackingLog_CL`|Yes|Yes|
|`ExchangeHttpProxy_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- Azure Log Analytics will be deprecated, to collect data from non-Azure VMs, Azure Arc is recommended. [Learn more](/azure/azure-monitor/agents/azure-monitor-agent-install?tabs=ARMAgentPowerShell,PowerShellWindows,PowerShellWindowsArc,CLIWindows,CLIWindowsArc)
- **Detailed documentation**: >**NOTE:** Detailed documentation on Installation procedure and usage can be found [here](https://aka.ms/MicrosoftExchangeSecurityGithub)

**Setup Instructions:**

 >**NOTE:** This solution is based on options. This allows you to choose which data will be ingest as some options can generate a very high volume of data. Depending on what you want to collect, track in your Workbooks, Analytics Rules, Hunting capabilities you will choose the option(s) you will deploy. Each options are independant for one from the other. To learn more about each option: ['Microsoft Exchange Security' wiki](https://aka.ms/ESI_DataConnectorOptions)

**1.  Download and install the agents needed to collect logs for Microsoft Sentinel**

Type of servers (Exchange Servers, Domain Controllers linked to Exchange Servers or all Domain Controllers) depends on the option you want to deploy.

**Deploy Monitor Agents**

This step is required only if it's the first time you onboard your Exchange Servers/Domain Controllers

  **Select which agent you want to install in your servers to collect logs:**

**[Prefered] Azure Monitor Agent via Azure Arc**

Deploy the Azure Arc Agent
 [Learn more](/azure/azure-monitor/agents/azure-monitor-agent-install?tabs=ARMAgentPowerShell,PowerShellWindows,PowerShellWindowsArc,CLIWindows,CLIWindowsArc)

**Install Azure Log Analytics Agent (Deprecated on 31/08/2024)**

1. Download the Azure Log Analytics Agent and choose the deployment method in the below link.

  - Install Agent: <variable value provided at install time>



**2.  Deploy log injestion following choosed options**

**[Option 1] MS Exchange Management Log collection**

Select how to stream MS Exchange Admin Audit event logs

  **MS Exchange Admin Audit event logs**

**Data Collection Rules - When Azure Monitor Agent is used**

Enable data collection rule
  Microsoft Exchange Admin Audit Events logs are collected only from **Windows** agents.

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the DCR.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ESI-DCROption1-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. Enter the **Workspace Name** 'and/or Other required fields'.
4.  Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5.  Click **Purchase** to deploy.

**Option 2 - Manual Deployment of Azure Automation**

Use the following step-by-step instructions to deploy manually a Data Collection Rule.

**A. Create DCR, Type Event log**

1.  From the Azure Portal, navigate to [Azure Data collection rules](https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionRules).
2. Click **+ Create** at the top.
3. In the **Basics** tab, fill the required fields, Select Windows as platform type and give a name to the DCR. 
4. In the **Resources** tab, enter you Exchange Servers.
5. In 'Collect and deliver', add a Data Source type 'Windows Event logs' and select 'Custom' option, enter 'MSExchange Management' as expression and Add it.
6. 'Make other preferable configuration changes', if needed, then click **Create**.


**Assign the DCR to all Exchange Servers**

Add all your Exchange Servers to the DCR


**Data Collection Rules - When the legacy Azure Log Analytics Agent is used**

Configure the logs to be collected

Configure the Events you want to collect and their severities.

1.  Under workspace **Legacy agents management, select Windows Event logs**.
2.  Click **Add Windows event log and enter MSExchange Management** as log name.
3.  Collect Error, Warning and Information types
4.  Click **Save**.

  - Install Agent: <variable value provided at install time>


**[Option 2] Security/Application/System logs of Exchange Servers**

Select how to stream Security/Application/System logs of Exchange Servers

  **Security Event log collection**

**Data Collection Rules - Security Event logs**

Enable data collection rule for Security Logs
Security Events logs are collected only from **Windows** agents.
1. Add Exchange Servers on *Resources* tab.
2. Select Security log level

  **Common level** is the minimum required. Please select 'Common' or 'All Security Events' on DCR definition.

  - Install Agent: <variable value provided at install time>

  **Application and System Event log collection**

**Data Collection Rules - When Azure Monitor Agent is used**

Enable data collection rule
  Application and System Events logs are collected only from **Windows** agents.

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the DCR.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ESI-DCROption2-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. Enter the **Workspace Name** 'and/or Other required fields'.
4.  Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5.  Click **Purchase** to deploy.

**Option 2 - Manual Deployment of Azure Automation**

Use the following step-by-step instructions to deploy manually a Data Collection Rule.

**A. Create DCR, Type Event log**

1.  From the Azure Portal, navigate to [Azure Data collection rules](https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionRules).
2. Click **+ Create** at the top.
3. In the **Basics** tab, fill the required fields, Select Windows as platform type and give a name to the DCR. 
4. In the **Resources** tab, enter you Exchange Servers.
5. In 'Collect and deliver', add a Data Source type 'Windows Event logs' and select 'Basic' option.
6. For Application, select 'Critical', 'Error' and 'Warning'. For System, select Critical/Error/Warning/Information. 
7. 'Make other preferable configuration changes', if needed, then click **Create**.


**Assign the DCR to all Exchange Servers**

Add all your Exchange Servers to the DCR


**Data Collection Rules - When the legacy Azure Log Analytics Agent is used**

Configure the logs to be collected

Configure the Events you want to collect and their severities.

1.  Under workspace advanced settings **Configuration, select Data and then Windows Event logs**.
2.  Click **Add Windows event log and search Application** as log name.
3.  Click **Add Windows event log and search System** as log name.
4.  Collect Error (for all), Warning (for all) and Information (for System) types
5.  Click **Save**.

  - Install Agent: <variable value provided at install time>


**[Option 3 and 4] Security logs of Domain Controllers**

Select how to stream Security logs of Domain Controllers. If you want to implement Option 3, you just need to select DC on same site as Exchange Servers. If you want to implement Option 4, you can select all DCs of your forest.

**[Option 3] List only Domain Controllers on the same site as Exchange Servers for next step**

This limits the quantity of data injested but some incident can't be detected.

**[Option 4] List all Domain Controllers of your Active-Directory Forest for next step**

This allows collecting all security events

  **Security Event log collection**

**Data Collection Rules - Security Event logs**

Enable data collection rule for Security Logs
Security Events logs are collected only from **Windows** agents.
1. Add chosen DCs on *Resources* tab.
2. Select Security log level

  **Common level** is the minimum required. Please select 'Common' or 'All Security Events' on DCR definition.

  - Install Agent: <variable value provided at install time>


**[Option 5] IIS logs of Exchange Servers**

Select how to stream IIS logs of Exchange Servers

**Data Collection Rules - When Azure Monitor Agent is used**

Enable data collection rule
 IIS logs are collected only from **Windows** agents.

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the DCE and DCR.

**A. Create DCE (If not already created for Exchange Servers)**

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ESI-DCEExchangeServers)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. You can change the proposed name of the DCE.
5.  Click **Create** to deploy.

**B. Deploy Data Connection Rule**

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ESI-DCROption5-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. Enter the **Workspace ID** 'and/or Other required fields'.
4.  Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5.  Click **Purchase** to deploy.


**Option 2 - Manual Deployment of Azure Automation**

Use the following step-by-step instructions to deploy manually a Data Collection Rule.

**A. Create DCE (If not already created for Exchange Servers)**

1.  From the Azure Portal, navigate to [Azure Data collection Endpoint](https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionEndpoints).
2. Click **+ Create** at the top.
3. In the **Basics** tab, fill the required fields and give a name to the DCE. 
3. 'Make other preferable configuration changes', if needed, then click **Create**.

**B. Create DCR, Type IIS log**

1.  From the Azure Portal, navigate to [Azure Data collection rules](https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionRules).
2. Click **+ Create** at the top.
3. In the **Basics** tab, fill the required fields, Select Windows as platform type and give a name to the DCR. Select the created DCE. 
4. In the **Resources** tab, enter you Exchange Servers.
5. In 'Collect and deliver', add a Data Source type 'IIS logs' (Do not enter a path if IIS Logs path is configured by default). Click on 'Add data source'
6. 'Make other preferable configuration changes', if needed, then click **Create**.


**Assign the DCR to all Exchange Servers**

Add all your Exchange Servers to the DCR


**Data Collection Rules - When the legacy Azure Log Analytics Agent is used**

Configure the logs to be collected

Configure the Events you want to collect and their severities.

1.  Under workspace advanced settings **Configuration, select Data and then IIS Logs**.
2. Check **Collect W3C format IIS log files**
5.  Click **Save**.

  - Install Agent: <variable value provided at install time>


**[Option 6] Message Tracking of Exchange Servers**

Select how to stream Message Tracking of Exchange Servers

**Data Collection Rules - When Azure Monitor Agent is used**

Enable data collection rule
 Message Tracking are collected only from **Windows** agents.

  > Note: **Attention**, Custom logs in Monitor Agent is in Preview. The deployment doesn't work as expected for the moment (March 2023).

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the DCE and DCR.

**A. Create DCE (If not already created for Exchange Servers)**

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ESI-DCEExchangeServers)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. You can change the proposed name of the DCE.
5.  Click **Create** to deploy.

**B. Deploy Data Connection Rule and Custom Table**

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ESI-DCROption6-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. Enter the **Workspace ID** 'and/or Other required fields'.
4.  Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5.  Click **Purchase** to deploy.


**Option 2 - Manual Deployment of Azure Automation**

Use the following step-by-step instructions to deploy manually a Data Collection Rule.

**A. Create DCE (If not already created for Exchange Servers)**

1.  From the Azure Portal, navigate to [Azure Data collection Endpoint](https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionEndpoints).
2. Click **+ Create** at the top.
3. In the **Basics** tab, fill the required fields and give a name to the DCE, like ESI-ExchangeServers. 
3. 'Make other preferable configuration changes', if needed, then click **Create**.

**B. Create Custom DCR Table**

1. Download the Example file from [Microsoft Sentinel GitHub](https://aka.ms/Sentinel-Sample-ESI-MessageTrackingExampleFile).
2.  From the Azure Portal, navigate to [Workspace Analytics](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.OperationalInsights%2Fworkspaces) and select your target Workspace.
3. Click in 'Tables', click **+ Create at the top and select New Custom log (DCR-Based)**.
4. In the **Basics tab, enter MessageTrackingLog on the Table name, create a Data Collection rule with the name DCR-Option6-MessageTrackingLogs** (for example) and select the previously created Data collection Endpoint.
5. In the **Schema and Transformation tab, choose the downloaded sample file and click on Transformation Editor**.
6. In the transformation field, enter the following KQL request :
*source
| extend TimeGenerated = todatetime(['date-time'])
| extend
    clientHostname = ['client-hostname'],
    clientIP = ['client-ip'],
    connectorId = ['connector-id'],
    customData = ['custom-data'],
    eventId = ['event-id'],
    internalMessageId = ['internal-message-id'],
    logId = ['log-id'],
    messageId = ['message-id'],
    messageInfo = ['message-info'],
    messageSubject = ['message-subject'],
    networkMessageId = ['network-message-id'],
    originalClientIp =  ['original-client-ip'],
    originalServerIp = ['original-server-ip'],
    recipientAddress= ['recipient-address'],
    recipientCount= ['recipient-count'],
    recipientStatus= ['recipient-status'],
    relatedRecipientAddress= ['related-recipient-address'],
    returnPath= ['return-path'],
    senderAddress= ['sender-address'],
    senderHostname= ['server-hostname'],
    serverIp= ['server-ip'],
    sourceContext= ['source-context'],
    schemaVersion=['schema-version'],
    messageTrackingTenantId = ['tenant-id'],
    totalBytes = ['total-bytes'],
    transportTrafficType = ['transport-traffic-type']
| project-away
    ['client-ip'],
    ['client-hostname'],
    ['connector-id'],
    ['custom-data'],
    ['date-time'],
    ['event-id'],
    ['internal-message-id'],
    ['log-id'],
    ['message-id'],
    ['message-info'],
    ['message-subject'],
    ['network-message-id'],
    ['original-client-ip'],
    ['original-server-ip'],
    ['recipient-address'],
    ['recipient-count'],
    ['recipient-status'],
    ['related-recipient-address'],
    ['return-path'],
    ['sender-address'],
    ['server-hostname'],
    ['server-ip'],
    ['source-context'],
    ['schema-version'],
    ['tenant-id'],
    ['total-bytes'],
    ['transport-traffic-type']*

8. Click 'Run' and after 'Apply'.
9. Click **Next, then click Create**.

**C. Modify the created DCR, Type Custom log**

1.  From the Azure Portal, navigate to [Azure Data collection rules](https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionRules).
2. Select the previously created DCR, like **DCR-Option6-MessageTrackingLogs**.
3. In the **Resources** tab, enter you Exchange Servers.
4. In **Data Sources**, add a Data Source type 'Custom Text logs' and enter 'C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Logs\MessageTracking\*.log' in file pattern, 'MessageTrackingLog_CL' in Table Name.
6.in Transform field, enter the following KQL request :
*source
| extend TimeGenerated = todatetime(['date-time'])
| extend
    clientHostname = ['client-hostname'],
    clientIP = ['client-ip'],
    connectorId = ['connector-id'],
    customData = ['custom-data'],
    eventId = ['event-id'],
    internalMessageId = ['internal-message-id'],
    logId = ['log-id'],
    messageId = ['message-id'],
    messageInfo = ['message-info'],
    messageSubject = ['message-subject'],
    networkMessageId = ['network-message-id'],
    originalClientIp =  ['original-client-ip'],
    originalServerIp = ['original-server-ip'],
    recipientAddress= ['recipient-address'],
    recipientCount= ['recipient-count'],
    recipientStatus= ['recipient-status'],
    relatedRecipientAddress= ['related-recipient-address'],
    returnPath= ['return-path'],
    senderAddress= ['sender-address'],
    senderHostname= ['server-hostname'],
    serverIp= ['server-ip'],
    sourceContext= ['source-context'],
    schemaVersion=['schema-version'],
    messageTrackingTenantId = ['tenant-id'],
    totalBytes = ['total-bytes'],
    transportTrafficType = ['transport-traffic-type']
| project-away
    ['client-ip'],
    ['client-hostname'],
    ['connector-id'],
    ['custom-data'],
    ['date-time'],
    ['event-id'],
    ['internal-message-id'],
    ['log-id'],
    ['message-id'],
    ['message-info'],
    ['message-subject'],
    ['network-message-id'],
    ['original-client-ip'],
    ['original-server-ip'],
    ['recipient-address'],
    ['recipient-count'],
    ['recipient-status'],
    ['related-recipient-address'],
    ['return-path'],
    ['sender-address'],
    ['server-hostname'],
    ['server-ip'],
    ['source-context'],
    ['schema-version'],
    ['tenant-id'],
    ['total-bytes'],
    ['transport-traffic-type']* 
7. Click on 'Add data source'.


**Assign the DCR to all Exchange Servers**

Add all your Exchange Servers to the DCR


**Data Collection Rules - When the legacy Azure Log Analytics Agent is used**

Configure the logs to be collected

1.  Under workspace **Settings part, select Tables, click + Create and click on New custom log (MMA-Based)**.
2.  Select Sample file **[MessageTracking Sample](https://aka.ms/Sentinel-Sample-ESI-MessageTrackingLogsSampleCSV)** and click Next
3. Select type **Windows and enter the path C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Logs\MessageTracking\*.log**. Click Next.
4. Enter **MessageTrackingLog** as Table name and click Next.
5.  Click **Save**.

  - Install Agent: <variable value provided at install time>


**[Option 7] HTTP Proxy of Exchange Servers**

Select how to stream HTTP Proxy of Exchange Servers

**Data Collection Rules - When Azure Monitor Agent is used**

Enable data collection rule
 Message Tracking are collected only from **Windows** agents.

  > Note: **Attention**, Custom logs in Monitor Agent is in Preview. The deployment doesn't work as expected for the moment (March 2023).

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the DCE and DCR.

**A. Create DCE (If not already created for Exchange Servers)**

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ESI-DCEExchangeServers)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. You can change the proposed name of the DCE.
5.  Click **Create** to deploy.

**B. Deploy Data Connection Rule**

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ESI-DCROption7-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. Enter the **Workspace ID** 'and/or Other required fields'.
4.  Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5.  Click **Purchase** to deploy.


**Option 2 - Manual Deployment of Azure Automation**

Use the following step-by-step instructions to deploy manually a Data Collection Rule.

**A. Create DCE (If not already created for Exchange Servers)**

1.  From the Azure Portal, navigate to [Azure Data collection Endpoint](https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionEndpoints).
2. Click **+ Create** at the top.
3. In the **Basics** tab, fill the required fields and give a name to the DCE. 
3. 'Make other preferable configuration changes', if needed, then click **Create**.

**B. Create Custom DCR Table**

1. Download the Example file from [Microsoft Sentinel GitHub](https://aka.ms/Sentinel-Sample-ESI-HTTPProxyExampleFile).
2.  From the Azure Portal, navigate to [Workspace Analytics](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.OperationalInsights%2Fworkspaces) and select your target Workspace.
3. Click in 'Tables', click **+ Create at the top and select New Custom log (DCR-Based)**.
4. In the **Basics tab, enter ExchangeHttpProxy on the Table name, create a Data Collection rule with the name DCR-Option7-HTTPProxyLogs** (for example) and select the previously created Data collection Endpoint.
5. In the **Schema and Transformation tab, choose the downloaded sample file and click on Transformation Editor**.
6. In the transformation field, enter the following KQL request :
*source
| extend TimeGenerated = todatetime(DateTime)
| project-away DateTime
*

8. Click 'Run' and after 'Apply'.
9. Click **Next, then click Create**.

**C. Modify the created DCR, Type Custom log**

1.  From the Azure Portal, navigate to [Azure Data collection rules](https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionRules).
2. Select the previously created DCR, like **DCR-Option7-HTTPProxyLogs**.
3. In the **Resources** tab, enter you Exchange Servers.
4. In **Data Sources**, add a Data Source type 'Custom Text logs' and enter 'C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Autodiscover\*.log' in file pattern, 'ExchangeHttpProxy_CL' in Table Name.
6.in Transform field, enter the following KQL request :
*source
| extend TimeGenerated = todatetime(DateTime)
| project-away DateTime* 
7. Click on 'Add data source'.


**Assign the DCR to all Exchange Servers**

Add all your Exchange Servers to the DCR


**Data Collection Rules - When the legacy Azure Log Analytics Agent is used**

Configure the logs to be collected

1.  Under workspace **Settings part, select Tables, click + Create and click on New custom log (MMA-Based)**.
2.  Select Sample file **[MessageTracking Sample](https://aka.ms/Sentinel-Sample-ESI-HttpProxySampleCSV)** and click Next
3. Select type **Windows and enter all the following paths C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Autodiscover\*.log, C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Eas\*.log, C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Ecp\*.log, C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Ews\*.log, C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Mapi\*.log, C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Oab\*.log, C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Owa\*.log, C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\OwaCalendar\*.log, C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\PowerShell\*.log and C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\RpcHttp\*.log** . Click Next.
4. Enter **ExchangeHttpProxy** as Table name and click Next.
5.  Click **Save**.

  - Install Agent: <variable value provided at install time>



>**NOTE:** This data connector depends on a parser based on a Kusto Function to work as expected. Parsers are automatically deployed with the solution. Follow the steps to create the Kusto Functions alias : [**ExchangeAdminAuditLogs**](https://aka.ms/sentinel-ESI-ExchangeCollector-ExchangeAdminAuditLogs-parser)

  **Parsers are automatically deployed during Solution deployment. If you want to deploy manually, follow the steps below**

**Manual Parser Deployment**

**1. Download the Parser file**

The latest version of the file [**ExchangeAdminAuditLogs**](https://aka.ms/sentinel-ESI-ExchangeCollector-ExchangeAdminAuditLogs-parser)

**2. Create Parser **ExchangeAdminAuditLogs** function**

In 'Logs' explorer of your Microsoft Sentinel's log analytics, copy the content of the file to Log explorer

**3. Save Parser **ExchangeAdminAuditLogs** function**

Click on save button.
 No parameter is needed for this parser.
Click save again.



<br><br>
</details> 

 ---
   
<a name="deprecated-okta-single-sign-on-using-azure-function-using-azure-functions"></a><details><summary>**[Deprecated] Okta Single Sign-On (using Azure Function) (using Azure Functions)**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

The [Okta Single Sign-On (SSO) (using Azure Function)](https://www.okta.com/products/single-sign-on/) connector provides the capability to ingest audit and event logs from the Okta API into Microsoft Sentinel. The connector provides visibility into these log types in Microsoft Sentinel to view dashboards, create custom alerts, and to improve monitoring and investigation capabilities.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`Okta_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **Microsoft.Web/sites permissions**: Read and write permissions to Azure Functions to create a Function App is required. For more information, see [Azure Functions](/azure/azure-functions/).
- **Okta API Token**: An Okta API Token is required. See the documentation to learn more about the [Okta System Log API](https://developer.okta.com/docs/reference/api/system-log/).

**Setup Instructions:**

 >**NOTE:** This connector uses Azure Functions to connect to Okta SSO to pull its logs into Microsoft Sentinel. This might result in additional data ingestion costs. Check the [Azure Functions pricing page](https://azure.microsoft.com/pricing/details/functions/) for details.

>**NOTE:** This connector has been updated, if you have previously deployed an earlier version, and want to update, please delete the existing Okta Azure Function before redeploying this version.

**(Optional Step)** Securely store workspace and API authorization key(s) or token(s) in Azure Key Vault. Azure Key Vault provides a secure mechanism to store and retrieve key values. [Follow these instructions](/azure/app-service/app-service-key-vault-references) to use Azure Key Vault with an Azure Function App.

STEP 1 - Configuration steps for the Okta SSO API

 [Follow these instructions](https://developer.okta.com/docs/guides/create-an-api-token/create-the-token/) to create an API Token.

**Note - For more information on the rate limit restrictions enforced by Okta, please refer to the [documentation](https://developer.okta.com/docs/reference/rl-global-mgmt/)**.

STEP 2 - Choose ONE from the following two deployment options to deploy the connector and the associated Azure Function

>**IMPORTANT:** Before deploying the Okta SSO connector, have the Workspace ID and Workspace Primary Key (can be copied from the following), as well as the Okta SSO API Authorization Token, readily available.

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

**Option 1 - Azure Resource Manager (ARM) Template**

This method provides an automated deployment of the Okta SSO connector using an ARM Tempate.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentineloktaazuredeployv2-solution)  [aka.ms](https://aka.ms/sentineloktaazuredeployv2-solution-gov)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. Enter the **Workspace ID, Workspace Key, API Token and URI**. 
 - Use the following schema for the `uri` value: `https://<OktaDomain>/api/v1/logs?since=` Replace `<OktaDomain>` with your domain. [Click here](https://developer.okta.com/docs/reference/api-overview/#url-namespace) for further details on how to identify your Okta domain namespace. There is no need to add a time value to the URI, the Function App will dynamically append the inital start time of logs to UTC 0:00 for the current UTC date as time value to the URI in the proper format. 
 - Note: If using Azure Key Vault secrets for any of the values above, use the`@Microsoft.KeyVault(SecretUri={Security Identifier})`schema in place of the string values. Refer to [Key Vault references documentation](/azure/app-service/app-service-key-vault-references) for further details. 
4. Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5. Click **Purchase** to deploy.

**Option 2 - Manual Deployment of Azure Functions**

Use the following step-by-step instructions to deploy the Okta SSO connector manually with Azure Functions (Deployment via Visual Studio Code).

**Step 1 - Deploy a Function App**

1. Download the [Azure Function App](https://aka.ms/sentineloktaazurefunctioncodev2) file. Extract archive to your local development computer.
2. Follow the [function app manual deployment instructions](https://github.com/Azure/Azure-Sentinel/blob/master/DataConnectors/AzureFunctionsManualDeployment.md#function-app-manual-deployment-instructions) to deploy the Azure Functions app using VSCode.
3. After successful deployment of the function app, follow next steps for configuring it.

**Step 2 - Configure the Function App**

1. Go to Azure Portal for the Function App configuration.
2. In the Function App, select the Function App Name and select **Configuration**.
3. In the **Application settings tab, select + New application setting**.
4. Add each of the following five (5) application settings individually, with their respective string values (case-sensitive): 
		apiToken
		workspaceID
		workspaceKey
		uri
		logAnalyticsUri (optional)
 - Use the following schema for the `uri` value: `https://<OktaDomain>/api/v1/logs?since=` Replace `<OktaDomain>` with your domain. [Click here](https://developer.okta.com/docs/reference/api-overview/#url-namespace) for further details on how to identify your Okta domain namespace. There is no need to add a time value to the URI, the Function App will dynamically append the inital start time of logs to UTC 0:00 for the current UTC date as time value to the URI in the proper format.
 - Note: If using Azure Key Vault secrets for any of the values above, use the`@Microsoft.KeyVault(SecretUri={Security Identifier})`schema in place of the string values. Refer to [Key Vault references documentation](/azure/app-service/app-service-key-vault-references) for further details.
 - Use logAnalyticsUri to override the log analytics API endpoint for dedicated cloud. For example, for public cloud, leave the value empty; for Azure GovUS cloud environment, specify the value in the following format: https://<CustomerId>.ods.opinsights.azure.us. 
5. Once all application settings have been entered, click **Save**.



<br><br>
</details> 

 ---
   
<a name="deprecated-sentinelone-using-azure-function-using-azure-functions"></a><details><summary>**[Deprecated] SentinelOne (using Azure Function) (using Azure Functions)**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

The [SentinelOne](https://www.sentinelone.com/) data connector provides the capability to ingest common SentinelOne server objects such as Threats, Agents, Applications, Activities, Policies, Groups, and more events into Microsoft Sentinel through the REST API. Refer to API documentation: `https://<SOneInstanceDomain>.sentinelone.net/api-doc/overview` for more information. The connector enables event retrieval to assess potential security risks, monitor collaboration, and diagnose and troubleshoot configuration issues.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`SentinelOne_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **Microsoft.Web/sites permissions**: Read and write permissions to Azure Functions to create a Function App is required. For more information, see [Azure Functions](/azure/azure-functions/).
- **REST API Credentials/permissions**: **SentinelOneAPIToken** is required.  See the documentation to learn more about API on the `https://<SOneInstanceDomain>.sentinelone.net/api-doc/overview`.

**Setup Instructions:**

 >**NOTE:** This connector uses Azure Functions to connect to the SentinelOne API to pull its logs into Microsoft Sentinel. This might result in additional data ingestion costs. Check the [Azure Functions pricing page](https://azure.microsoft.com/pricing/details/functions/) for details.

**(Optional Step)** Securely store workspace and API authorization key(s) or token(s) in Azure Key Vault. Azure Key Vault provides a secure mechanism to store and retrieve key values. [Follow these instructions](/azure/app-service/app-service-key-vault-references) to use Azure Key Vault with an Azure Function App.

>**NOTE:** This data connector depends on a parser based on a Kusto Function to work as expected which is deployed as part of the solution. To view the function code in Log Analytics, open Log Analytics/Microsoft Sentinel Logs blade, click Functions and search for the alias SentinelOne and load the function code or click [here](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/SentinelOne/Parsers/SentinelOne.txt). The function usually takes 10-15 minutes to activate after solution installation/update.

STEP 1 - Configuration steps for the SentinelOne API

 Follow the instructions to obtain the credentials.

1. Log in to the SentinelOne Management Console with Admin user credentials.
2. In the Management Console, click **Settings**.
3. In the **SETTINGS view, click USERS**
4. Click **New User**.
5. Enter the information for the new console user.
5. In Role, select **Admin**.
6. Click **SAVE**
7. Save credentials of the new user for using in the data connector.

**NOTE :-** Admin access can be delegated using custom roles. Please review SentinelOne [documentation](https://www.sentinelone.com/blog/feature-spotlight-fully-custom-role-based-access-control/) to learn more about custom RBAC.

STEP 2 - Choose ONE from the following two deployment options to deploy the connector and the associated Azure Function

>**IMPORTANT:** Before deploying the SentinelOne data connector, have the Workspace ID and Workspace Primary Key (can be copied from the following).

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the SentinelOne Audit data connector using an ARM Tempate.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-SentinelOneAPI-azuredeploy) [aka.ms](https://aka.ms/sentinel-SentinelOneAPI-azuredeploy-gov)
2. Select the preferred **Subscription, Resource Group and Location**. 
> **NOTE:** Within the same resource group, you can't mix Windows and Linux apps in the same region. Select existing resource group without Windows apps in it or create new resource group.
3. Enter the **SentinelOneAPIToken, SentinelOneUrl** `(https://<SOneInstanceDomain>.sentinelone.net)` and deploy. 
4. Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5. Click **Purchase** to deploy.

**Option 2 - Manual Deployment of Azure Functions**

Use the following step-by-step instructions to deploy the SentinelOne Reports data connector manually with Azure Functions (Deployment via Visual Studio Code).

1. Deploy a Function App

> **NOTE:** You will need to [prepare VS code](/azure/azure-functions/functions-create-first-function-python#prerequisites) for Azure function development.

1. Download the [Azure Function App](https://aka.ms/sentinel-SentinelOneAPI-functionapp) file. Extract archive to your local development computer.
2. Start VS Code. Choose File in the main menu and select Open Folder.
3. Select the top level folder from extracted files.
4. Choose the Azure icon in the Activity bar, then in the **Azure: Functions area, choose the Deploy to function app** button.
If you aren't already signed in, choose the Azure icon in the Activity bar, then in the **Azure: Functions area, choose Sign in to Azure**
If you're already signed in, go to the next step.
5. Provide the following information at the prompts:

	a. **Select folder:** Choose a folder from your workspace or browse to one that contains your function app.

	b. **Select Subscription:** Choose the subscription to use.

	c. Select **Create new Function App in Azure** (Don't choose the Advanced option)

	d. **Enter a globally unique name for the function app:** Type a name that is valid in a URL path. The name you type is validated to make sure that it's unique in Azure Functions. (e.g. SOneXXXXX).

	e. **Select a runtime:** Choose Python 3.11.

	f. Select a location for new resources. For better performance and lower costs choose the same [region](https://azure.microsoft.com/regions/) where Microsoft Sentinel is located.

6. Deployment will begin. A notification is displayed after your function app is created and the deployment package is applied.
7. Go to Azure Portal for the Function App configuration.

2. Configure the Function App

 1. In the Function App, select the Function App Name and select **Configuration**.

 2. In the **Application settings tab, select  New application setting**.

 3. Add each of the following application settings individually, with their respective string values (case-sensitive): 
		 SentinelOneAPIToken
		 SentinelOneUrl
		 WorkspaceID
		 WorkspaceKey
		 logAnalyticsUri (optional)

 - Use logAnalyticsUri to override the log analytics API endpoint for dedicated cloud. For example, for public cloud, leave the value empty; for Azure GovUS cloud environment, specify the value in the following format: `https://<CustomerId>.ods.opinsights.azure.us`.

 4. Once all application settings have been entered, click **Save**.

<br><br>
</details> 

 ---
   
<a name="deprecated-sophos-endpoint-protection-using-azure-function-using-azure-functions"></a><details><summary>**[Deprecated] Sophos Endpoint Protection (using Azure Function) (using Azure Functions)**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

The [Sophos Endpoint Protection](https://www.sophos.com/en-us/products/endpoint-antivirus.aspx) data connector provides the capability to ingest [Sophos events](https://docs.sophos.com/central/Customer/help/en-us/central/Customer/common/concepts/Events.html) into Microsoft Sentinel. Refer to [Sophos Central Admin documentation](https://docs.sophos.com/central/Customer/help/en-us/central/Customer/concepts/Logs.html) for more information.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`SophosEP_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **Microsoft.Web/sites permissions**: Read and write permissions to Azure Functions to create a Function App is required. For more information, see [Azure Functions](/azure/azure-functions/).
- **REST API Credentials/permissions**: **API token** is required. For more information, see [API token](https://docs.sophos.com/central/Customer/help/en-us/central/Customer/concepts/ep_ApiTokenManagement.html)

**Setup Instructions:**

 >**NOTE:** This connector uses Azure Functions to connect to the Sophos Central APIs to pull its logs into Microsoft Sentinel. This might result in additional data ingestion costs. Check the [Azure Functions pricing page](https://azure.microsoft.com/pricing/details/functions/) for details.

**(Optional Step)** Securely store workspace and API authorization key(s) or token(s) in Azure Key Vault. Azure Key Vault provides a secure mechanism to store and retrieve key values. [Follow these instructions](/azure/app-service/app-service-key-vault-references) to use Azure Key Vault with an Azure Function App.

>**NOTE:** This data connector depends on a parser based on a Kusto Function to work as expected [**SophosEPEvent**](https://aka.ms/sentinel-SophosEP-parser) which is deployed with the Microsoft Sentinel Solution.

STEP 1 - Configuration steps for the Sophos Central API

 Follow the instructions to obtain the credentials.

1. In Sophos Central Admin, go to **Global Settings > API Token Management**.
2. To create a new token, click **Add token** from the top-right corner of the screen.
3. Select a **token name and click Save. The API Token Summary** for this token is displayed.
4. Click **Copy to copy your API Access URL + Headers from the API Token Summary** section into your clipboard.

STEP 2 - Choose ONE from the following two deployment options to deploy the connector and the associated Azure Function

>**IMPORTANT:** Before deploying the Sophos Endpoint Protection data connector, have the Workspace ID and Workspace Primary Key (can be copied from the following).

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the Sophos Endpoint Protection data connector using an ARM Tempate.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-SophosEP-azuredeploy)
2. Select the preferred **Subscription, Resource Group and Location**. 
> **NOTE:** Within the same resource group, you can't mix Windows and Linux apps in the same region. Select existing resource group without Windows apps in it or create new resource group.
3. Enter the **Sophos API Access URL and Headers, AzureSentinelWorkspaceId, AzureSentinelSharedKey**. 
4. Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5. Click **Purchase** to deploy.

**Option 2 - Manual Deployment of Azure Functions**

Use the following step-by-step instructions to deploy the Sophos Endpoint Protection data connector manually with Azure Functions (Deployment via Visual Studio Code).

**Step 1 - Deploy a Function App**

**NOTE:** You will need to [prepare VS code](/azure/azure-functions/functions-create-first-function-python#prerequisites) for Azure function development.

1. Download the [Azure Function App](https://aka.ms/sentinel-SophosEP-functionapp) file. Extract archive to your local development computer.
2. Follow the [function app manual deployment instructions](https://github.com/Azure/Azure-Sentinel/blob/master/DataConnectors/AzureFunctionsManualDeployment.md#function-app-manual-deployment-instructions) to deploy the Azure Functions app using VSCode.
3. After successful deployment of the function app, follow next steps for configuring it.

**Step 2 - Configure the Function App**

1. Go to Azure Portal for the Function App configuration.
2. In the Function App, select the Function App Name and select **Configuration**.
3. In the **Application settings tab, select New application setting**.
4. Add each of the following application settings individually, with their respective string values (case-sensitive): 
		SOPHOS_TOKEN
		WorkspaceID
		WorkspaceKey
		logAnalyticsUri (optional)
 - Use logAnalyticsUri to override the log analytics API endpoint for dedicated cloud. For example, for public cloud, leave the value empty; for Azure GovUS cloud environment, specify the value in the following format: `https://<CustomerId>.ods.opinsights.azure.us`.
5. Once all application settings have been entered, click **Save**.



<br><br>
</details> 

 ---
   
<a name="deprecated-vmware-carbon-black-cloud-using-azure-function-using-azure-functions"></a><details><summary>**[Deprecated] VMware Carbon Black Cloud (using Azure Function) (using Azure Functions)**</summary>

**Supported by:** [Microsoft](https://support.microsoft.com/)

The [VMware Carbon Black Cloud](https://www.broadcom.com/products/carbon-black/threat-prevention/carbon-black-cloud) connector provides the capability to ingest Carbon Black data into Microsoft Sentinel. The connector provides visibility into Audit, Notification and Event logs in Microsoft Sentinel to view dashboards, create custom alerts, and to improve monitoring and investigation capabilities.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`CarbonBlackEvents_CL`|No|No|
|`CarbonBlackNotifications_CL`|No|No|
|`CarbonBlackAuditLogs_CL`|No|No|

**Data collection rule support:** Not currently supported

**Prerequisites:**

- **Microsoft.Web/sites permissions**: Read and write permissions to Azure Functions to create a Function App is required. For more information, see [Azure Functions](/azure/azure-functions/).
- **VMware Carbon Black API Key(s)**: Carbon Black API and/or SIEM Level API Key(s) are required. See the documentation to learn more about the [Carbon Black API](https://developer.carbonblack.com/reference/carbon-black-cloud/cb-defense/latest/rest-api/).
 - A Carbon Black **API** access level API ID and Key is required for [Audit](https://developer.carbonblack.com/reference/carbon-black-cloud/cb-defense/latest/rest-api/#audit-log-events) and [Event](https://developer.carbonblack.com/reference/carbon-black-cloud/platform/latest/data-forwarder-config-api/) logs. 
 - A Carbon Black **SIEM** access level  API ID and Key is required for [Notification](https://developer.carbonblack.com/reference/carbon-black-cloud/cb-defense/latest/rest-api/#notifications) alerts.
- **Amazon S3 REST API Credentials/permissions**: **AWS Access Key Id**, **AWS Secret Access Key**, **AWS S3 Bucket Name**, **Folder Name in AWS S3 Bucket** are required for Amazon S3 REST API.

**Setup Instructions:**

 >**NOTE:** This connector uses Azure Functions to connect to VMware Carbon Black to pull its logs into Microsoft Sentinel. This might result in additional data ingestion costs. Check the [Azure Functions pricing page](https://azure.microsoft.com/pricing/details/functions/) for details.

**(Optional Step)** Securely store workspace and API authorization key(s) or token(s) in Azure Key Vault. Azure Key Vault provides a secure mechanism to store and retrieve key values. [Follow these instructions](/azure/app-service/app-service-key-vault-references) to use Azure Key Vault with an Azure Function App.

STEP 1 - Configuration steps for the VMware Carbon Black API

 [Follow these instructions](https://developer.carbonblack.com/reference/carbon-black-cloud/authentication/#creating-an-api-key) to create an API Key.

STEP 2 - Choose ONE from the following two deployment options to deploy the connector and the associated Azure Function

>**IMPORTANT:** Before deploying the VMware Carbon Black connector, have the Workspace ID and Workspace Primary Key (can be copied from the following), as well as the VMware Carbon Black API Authorization Key(s), readily available.

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

**Option 1 - Azure Resource Manager (ARM) Template**

This method provides an automated deployment of the VMware Carbon Black connector using an ARM Tempate.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinelcarbonblackazuredeploy) [aka.ms](https://aka.ms/sentinelcarbonblackazuredeploy-gov)
2. Select the preferred **Subscription, Resource Group and Location**. 
3. Enter the **Workspace ID, Workspace Key, Log Types, API ID(s), API Key(s), Carbon Black Org Key, S3 Bucket Name, AWS Access Key Id, AWS Secret Access Key, EventPrefixFolderName**,**AlertPrefixFolderName,  and validate the URI**.
 - Enter the URI that corresponds to your region. The complete list of API URLs can be [found here](https://community.carbonblack.com/t5/Knowledge-Base/PSC-What-URLs-are-used-to-access-the-APIs/ta-p/67346)
 - The default **Time Interval** is set to pull the last five (5) minutes of data. If the time interval needs to be modified, it is recommended to change the Function App Timer Trigger accordingly (in the function.json file, post deployment) to prevent overlapping data ingestion. 
 - Carbon Black requires a seperate set of API ID/Keys to ingest Notification alerts. Enter the SIEM API ID/Key values or leave blank, if not required. 
 - Note: If using Azure Key Vault secrets for any of the values above, use the`@Microsoft.KeyVault(SecretUri={Security Identifier})`schema in place of the string values. Refer to [Key Vault references documentation](/azure/app-service/app-service-key-vault-references) for further details. 
4. Mark the checkbox labeled **I agree to the terms and conditions stated above**. 
5. Click **Purchase** to deploy.

**Option 2 - Manual Deployment of Azure Functions**

Use the following step-by-step instructions to deploy the VMware Carbon Black connector manually with Azure Functions.

1. Create a Function App

1.  From the Azure Portal, navigate to [Function App](https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.Web%2Fsites/kind/functionapp), and select **+ Add**.
2. In the **Basics tab, ensure Runtime stack is set to Powershell Core**. 
3. In the **Hosting tab, ensure the Consumption (Serverless)** plan type is selected.
4. Make other preferrable configuration changes, if needed, then click **Create**.

2. Import Function App Code

1. In the newly created Function App, select **Functions on the left pane and click + Add**.
2. Select **Timer Trigger**.
3. Enter a unique Function **Name and modify the cron schedule, if needed. The default value is set to run the Function App every 5 minutes. (Note: the Timer trigger should match the `timeInterval` value below to prevent overlapping data), click Create**.
4. Click on **Code + Test** on the left pane. 
5. Copy the [Function App Code](https://aka.ms/sentinelcarbonblackazurefunctioncode) and paste into the Function App `run.ps1` editor.
5. Click **Save**.

3. Configure the Function App

1. In the Function App, select the Function App Name and select **Configuration**.
2. In the **Application settings tab, select + New application setting**.
3. Add each of the following thirteen to sixteen (13-16) application settings individually, with their respective string values (case-sensitive): 
		apiId
		apiKey
		workspaceID
		workspaceKey
		uri
		timeInterval
		CarbonBlackOrgKey
		CarbonBlackLogTypes 
		s3BucketName 
		EventPrefixFolderName 
		AlertPrefixFolderName 
		AWSAccessKeyId 
		AWSSecretAccessKey 
		SIEMapiId (Optional)
		SIEMapiKey (Optional)
		logAnalyticsUri (optional) 
 - Enter the URI that corresponds to your region. The complete list of API URLs can be [found here](https://community.carbonblack.com/t5/Knowledge-Base/PSC-What-URLs-are-used-to-access-the-APIs/ta-p/67346). The `uri` value must follow the following schema: `https://<API URL>.conferdeploy.net` - There is no need to add a time suffix to the URI, the Function App will dynamically append the Time Value to the URI in the proper format.
 - Set the `timeInterval` (in minutes) to the default value of `5` to correspond to the default Timer Trigger of every `5` minutes. If the time interval needs to be modified, it is recommended to change the Function App Timer Trigger accordingly to prevent overlapping data ingestion.
 - Carbon Black requires a seperate set of API ID/Keys to ingest Notification alerts. Enter the `SIEMapiId` and `SIEMapiKey` values, if needed, or omit, if not required. 
 - Note: If using Azure Key Vault, use the`@Microsoft.KeyVault(SecretUri={Security Identifier})`schema in place of the string values. Refer to [Key Vault references documentation](/azure/app-service/app-service-key-vault-references) for further details. 
 - Use logAnalyticsUri to override the log analytics API endpoint for dedicated cloud. For example, for public cloud, leave the value empty; for Azure GovUS cloud environment, specify the value in the following format: `https://<CustomerId>.ods.opinsights.azure.us`
4. Once all application settings have been entered, click **Save**.

<br><br>
</details> 

 ---
   
<a name="deprecated-zoom-reports-using-azure-functions"></a><details><summary>**[Deprecated] Zoom Reports (using Azure Functions)**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

The [Zoom](https://zoom.us/) Reports data connector provides the capability to ingest [Zoom Reports](https://developers.zoom.us/docs/api/rest/reference/zoom-api/methods/#tag/Reports) events into Microsoft Sentinel through the REST API. Refer to [API documentation](https://developers.zoom.us/docs/api/) for more information. The connector enables event retrieval to assess potential security risks, monitor collaboration, and diagnose and troubleshoot configuration issues.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`Zoom_CL`|No|No|

**Data collection rule support:** Not currently supported

**Prerequisites:**

- **Microsoft.Web/sites permissions**: Read and write permissions to Azure Functions to create a Function App is required. For more information, see [Azure Functions](/azure/azure-functions/).
- **REST API Credentials/permissions**: **AccountID**, **ClientID** and **ClientSecret** are required for Zoom API. For more information, see [Zoom API](https://developers.zoom.us/docs/internal-apps/create/). [Follow the instructions for Zoom API configurations](https://aka.ms/sentinel-zoomreports-readme).

**Setup Instructions:**

 >**NOTE:** This connector uses Azure Functions to connect to the Zoom API to pull its logs into Microsoft Sentinel. This might result in additional data ingestion costs. Check the [Azure Functions pricing page](https://azure.microsoft.com/pricing/details/functions/) for details.

**(Optional Step)** Securely store workspace and API authorization key(s) or token(s) in Azure Key Vault. Azure Key Vault provides a secure mechanism to store and retrieve key values. [Follow these instructions](/azure/app-service/app-service-key-vault-references) to use Azure Key Vault with an Azure Function App.

**NOTE:** This data connector depends on a parser based on a Kusto Function to work as expected which is deployed as part of the solution. To view the function code in Log Analytics, open Log Analytics/Microsoft Sentinel Logs blade, click Functions and search for the alias Zoom and load the function code or click [here](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/ZoomReports/Parsers/Zoom.yaml). The function usually takes 10-15 minutes to activate after solution installation/update.

STEP 1 - Configuration steps for the Zoom API

 [Follow the instructions](https://developers.zoom.us/docs/internal-apps/create/) to obtain the credentials. 


STEP 2 - Choose ONE from the following two deployment options to deploy the connector and the associated Azure Function

>**IMPORTANT:** Before deploying the Zoom Reports data connector, have the Workspace ID and Workspace Primary Key (can be copied from the following).

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

**Option 1 - Azure Resource Manager (ARM) Template**

Use this method for automated deployment of the Zoom Audit data connector using an ARM Tempate.

1. Click the **Deploy to Azure** button below. 

	[aka.ms](https://aka.ms/sentinel-ZoomAPI-azuredeployV2) [aka.ms](https://aka.ms/sentinel-ZoomAPI-azuredeployV2-gov)
2. Select the preferred **Subscription, Resource Group and Region**. 
> **NOTE:** Within the same resource group, you can't mix Windows and Linux apps in the same region. Select existing resource group without Windows apps in it or create new resource group.
3. Enter the **AccountID, ClientID, ClientSecret, WorkspaceID, WorkspaceKey, Function Name**  and click Review + create. 
4. Finally click **Create** to deploy.

**Option 2 - Manual Deployment of Azure Functions**

Use the following step-by-step instructions to deploy the Zoom Reports data connector manually with Azure Functions (Deployment via Visual Studio Code).

**Step 1 - Deploy a Function App**

**NOTE:** You will need to [prepare VS code](/azure/azure-functions/functions-create-first-function-python#prerequisites) for Azure function development.

1. Download the [Azure Function App](https://aka.ms/sentinel-ZoomAPI-functionapp) file. Extract archive to your local development computer.
2. Start VS Code. Choose File in the main menu and select Open Folder.
3. Select the top level folder from extracted files.
4. Choose the Azure icon in the Activity bar, then in the **Azure: Functions area, choose the Deploy to function app** button.
If you aren't already signed in, choose the Azure icon in the Activity bar, then in the **Azure: Functions area, choose Sign in to Azure**
If you're already signed in, go to the next step.
5. Provide the following information at the prompts:

	a. **Select folder:** Choose a folder from your workspace or browse to one that contains your function app.

	b. **Select Subscription:** Choose the subscription to use.

	c. Select **Create new Function App in Azure** (Don't choose the Advanced option)

	d. **Enter a globally unique name for the function app:** Type a name that is valid in a URL path. The name you type is validated to make sure that it's unique in Azure Functions. (e.g. ZoomXXXXX).

	e. **Select a runtime:** Choose Python 3.11.

	f. Select a location for new resources. For better performance and lower costs choose the same [region](https://azure.microsoft.com/regions/) where Microsoft Sentinel is located.

6. Deployment will begin. A notification is displayed after your function app is created and the deployment package is applied.
7. Go to Azure Portal for the Function App configuration

**Step 2 - Configure the Function App**

1. In the Function App, select the Function App Name and select **Configuration**.
2. In the **Application settings tab, select  New application setting**.
3. Add each of the following application settings individually, with their respective string values (case-sensitive): 
		AccountID
		ClientID
		ClientSecret
		WorkspaceID
		WorkspaceKey
		logAnalyticsUri (optional)
  Use logAnalyticsUri to override the log analytics API endpoint for dedicated cloud. For example, for public cloud, leave the value empty; for Azure GovUS cloud environment, specify the value in the following format: `https://<CustomerId>.ods.opinsights.azure.us`.
4. Once all application settings have been entered, click **Save**.



<br><br>
</details> 

 ---
   
<a name="darktrace-connector-for-microsoft-sentinel-rest-api-legacy"></a><details><summary>**Darktrace Connector for Microsoft Sentinel REST API (Legacy)**</summary>

**Supported by:** [Darktrace](https://darktrace.com/contact)

The Darktrace REST API connector pushes real-time events from Darktrace to Microsoft Sentinel and is designed to be used with the Darktrace Solution for Microsoft Sentinel. The connector writes logs to a custom log table titled "darktrace_model_alerts_CL"; Model Breaches, AI Analyst Incidents, System Alerts and Email Alerts can be ingested - additional filters can be set up on the Darktrace System Configuration page. Data is pushed to Microsoft Sentinel from Darktrace masters.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`darktrace_model_alerts_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **Darktrace Prerequisites**: To use this Data Connector a Darktrace master running v5.2+ is required.
 Data is sent to the [Azure Monitor HTTP Data Collector API](/azure/azure-monitor/logs/data-collector-api) over HTTPs from Darktrace masters, therefore outbound connectivity from the Darktrace master to Microsoft Sentinel REST API is required.
- **Filter Darktrace Data**: During configuration it is possible to set up additional filtering on the Darktrace System Configuration page to constrain the amount or types of data sent.
- **Try the Darktrace Sentinel Solution**: You can get the most out of this connector by installing the Darktrace Solution for Microsoft Sentinel. This will provide workbooks to visualise alert data and analytics rules to automatically create alerts and incidents from Darktrace Model Breaches and AI Analyst incidents.

**Setup Instructions:**

 1. Detailed setup instructions can be found on the Darktrace Customer Portal: https://customerportal.darktrace.com/product-guides/main/microsoft-sentinel-introduction
 2. Take note of the Workspace ID and the Primary key. You will need to enter these details on your Darktrace System Configuration page.
 

  - **Workspace ID**: <variable value provided at install time>
  - **Primary Key**: <variable value provided at install time>

**Darktrace Configuration**

1. Perform the following steps on the Darktrace System Configuration page:
 2. Navigate to the System Configuration Page (Main Menu > Admin > System Config)
 3. Go into Modules configuration and click on the "Microsoft Sentinel" configuration card
 4. Select "HTTPS (JSON)" and hit "New"
 5. Fill in the required details and select appropriate filters
 6. Click "Verify Alert Settings" to attempt authentication and send out a test alert
 7. Run a "Look for Test Alerts" sample query to validate that the test alert has been received

<br><br>
</details> 

 ---
   
<a name="island-enterprise-browser-admin-events-legacy"></a><details><summary>**Island Enterprise Browser Admin Events (Legacy)**</summary>

**Supported by:** [Island](https://www.island.io/contact-us)

This is a legacy connector and is no longer recommended. Please use the **Island Enterprise Browser V2 Data Connector** instead, which supports user, admin and system events within a single connector.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`Island_Admin_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **Island API Key**: An Island API key is required.

**Setup Instructions:**

 **Connect Island to Microsoft Sentinel**

This is a legacy connector. For full setup instructions, refer to the [official Island documentation](https://documentation.island.io/docs/configure-the-microsoft-sentinel-integration) (requires login to the Island Management Console).


<br><br>
</details> 

 ---
   
<a name="island-enterprise-browser-user-events-legacy"></a><details><summary>**Island Enterprise Browser User Events (Legacy)**</summary>

**Supported by:** [Island](https://www.island.io/contact-us)

This is a legacy connector and is no longer recommended. Please use the **Island Enterprise Browser V2 Data Connector** instead, which supports user, admin and system events within a single connector.

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|`Island_User_CL`|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)

**Prerequisites:**

- **Island API Key**: An Island API key is required.

**Setup Instructions:**

 **Connect Island to Microsoft Sentinel**

This is a legacy connector. For full setup instructions, refer to the [official Island documentation](https://documentation.island.io/docs/configure-the-microsoft-sentinel-integration) (requires login to the Island Management Console).


<br><br>
</details> 

 ---
   
<a name="security-events-via-legacy-agent"></a><details><summary>**Security Events via Legacy Agent**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

You can stream all security events from the Windows machines connected to your Microsoft Sentinel workspace using the Windows agent. This connection enables you to view dashboards, create custom alerts, and improve investigation. This gives you more insight into your organization’s network and improves your security operation capabilities. For more information, see the [Microsoft Sentinel documentation](https://go.microsoft.com/fwlink/p/?linkid=2220093&wt.mc_id=sentinel_dataconnectordocs_content_cnl_csasci).

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|[`SecurityEvent`](/azure/azure-monitor/reference/tables/SecurityEvent)|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)<br><br>
</details> 

 ---
   
<a name="subscription-based-microsoft-defender-for-cloud-legacy"></a><details><summary>**Subscription-based Microsoft Defender for Cloud (Legacy)**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

Microsoft Defender for Cloud is a security management tool that allows you to detect and quickly respond to threats across Azure, hybrid, and multi-cloud workloads. This connector allows you to stream your security alerts from Microsoft Defender for Cloud into Microsoft Sentinel, so you can view Defender data in workbooks, query it to produce alerts, and investigate and respond to incidents.

[For more information>](https://aka.ms/ASC-Connector)

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|[`SecurityAlert`](/azure/azure-monitor/reference/tables/SecurityAlert)|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)<br><br>
</details> 

 ---
   
<a name="syslog-via-legacy-agent"></a><details><summary>**Syslog via Legacy Agent**</summary>

**Supported by:** [Microsoft Corporation](https://support.microsoft.com/)

Syslog is an event logging protocol that is common to Linux. Applications will send messages that may be stored on the local machine or delivered to a Syslog collector. When the Agent for Linux is installed, it configures the local Syslog daemon to forward messages to the agent. The agent then sends the message to the workspace.

[Learn more >](https://aka.ms/sysLogInfo)

**Log Analytics table(s):**  

|Table|DCR support|Lake-only ingestion|
|---|---|---|
|[`Syslog`](/azure/azure-monitor/reference/tables/Syslog)|Yes|Yes|

**Data collection rule support:** [Workspace transform DCR](/azure/azure-monitor/logs/tutorial-workspace-transformations-portal)<br><br>
</details> 

 ---
   