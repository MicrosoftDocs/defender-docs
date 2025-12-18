---
title: Microsoft Sentinel CCF Push Connectors - Getting Started Guide
description: Learn how to create and deploy push-based codeless connectors for Microsoft Sentinel that sends data in real-time.
author: edbaynash
ms.author: edbaynash
ms.topic: how-to
ms.date: 11/21/2025
#customer intent: As a security engineer or ISV partner, I want to understand how CCF Push connectors work and how to build one so I can send real-time data from my application to Microsoft Sentinel.
---

# Microsoft Sentinel CCF Push Connectors - Getting Started Guide

This guide helps you understand, build, and deploy push-based codeless connectors for Microsoft Sentinel using the Codeless Connector Framework (CCF) Push.

## What is CCF Push?

CCF Push connectors enable your applications to send security events directly to Microsoft Sentinel in real-time. Unlike traditional polling-based connectors that periodically fetch data from APIs, push connectors let you push data to Sentinel as events occur in your system.

## Key Benefits

- **Application-controlled data flow:** Your application controls when and how to send data, enabling intelligent batching strategies and optimized network usage
- **Real-time ingestion:** Send data immediately as events happen, without waiting for polling intervals
- **Simplified architecture:** No need to maintain API endpoints for Sentinel to poll
- **Template-based provisioning:** Deployment creates ARM templates for DCRs, custom tables, Entra application registration, and client secrets - you receive the connection details to configure in your sending application
- **Secure authentication:** Uses Microsoft Entra applications with OAuth 2.0 for secure data submission

## How CCF Push Works

### The Push Model vs Pull Model

Understanding the difference between push and pull data ingestion models helps you choose the right connector type for your scenario.

**CCF Pull Connectors (Polling-Based):**

In the pull model, Microsoft Sentinel periodically polls your API to retrieve data:

- Microsoft Sentinel initiates connections to your data source API on a configured schedule
- Data arrives at regular polling intervals (for example, every 5 minutes)
- You must maintain a publicly accessible API endpoint
- Sentinel's polling infrastructure manages the data collection process

**CCF Push Connectors (Event-Driven):**

In the push model, your application sends data directly to Microsoft Sentinel:

- Your application initiates data submission when events occur
- Data arrives in near real-time as events are generated
- No API endpoint maintenance required on your side
- Your application controls batching, timing, and data flow optimization
### The Push Data Flow

1. **User deploys the connector in Microsoft Sentinel**

   Azure automatically creates:
   - Microsoft Entra application with credentials
   - Data Collection Rule (DCR) - defines how to process your data
   - Data Collection Endpoint (DCE) - the URL where you send data
   - Custom log table - where your data is stored
   - Role assignments - permissions for the Entra app

1. **User receives connection details:**
   - Tenant ID
   - Application (Client) ID
   - Client Secret
   - DCE URI (endpoint URL)
   - DCR Immutable ID
   - Stream Name

1. **Your application sends data:**
   - Gets an OAuth 2.0 token using the CCF generated Entra app credentials (see [OAuth 2.0 client credentials flow](/entra/identity-platform/v2-oauth2-client-creds-grant-flow))
   - Formats events as JSON matching your table schema
   - POSTs data to the DCE endpoint

1. **Azure processes and stores data:**
   - DCR transforms the data (optional KQL transformations)
   - Data lands in the custom table in Log Analytics
   - Available for queries, analytics, and alerts in Sentinel

## CCF Push Artifacts

A CCF Push connector solution consists of four main components:

### 1. Custom Table Definition

**What it is:** The schema that defines the structure of your data in Log Analytics.

**Key requirements:**
- Table name must end with `_CL` (custom log suffix)
- Must include a `TimeGenerated` column (datetime type)
- Column types: string, int, long, real, bool, datetime, dynamic, guid
- Use API version 2021-03-01-privatepreview or later
- For more information, see [Create a custom table in Azure Monitor Logs](/azure/azure-monitor/logs/create-custom-table)

**Example:**

```json
{
  "name": "ContosoSecurityAlerts_CL",
  "type": "Microsoft.OperationalInsights/workspaces/tables",
  "apiVersion": "2021-03-01-privatepreview",
  "properties": {
    "schema": {
      "name": "ContosoSecurityAlerts_CL",
      "columns": [
        {
          "name": "TimeGenerated",
          "type": "datetime"
        },
        {
          "name": "EventSeverity",
          "type": "string"
        },
        {
          "name": "EventType",
          "type": "string"
        },
        {
          "name": "UserName",
          "type": "string"
        },
        {
          "name": "SourceIP",
          "type": "string"
        },
        {
          "name": "DeviceId",
          "type": "string"
        },
        {
          "name": "AlertMessage",
          "type": "string"
        }
      ]
    }
  }
}
```


### 2. Data Collection Rule (DCR)

**What it is:** Defines how Azure Monitor ingests and processes your data. For more information, see [Data collection rules in Azure Monitor](/azure/azure-monitor/essentials/data-collection-rule-overview).

**What it does:**
- Specifies the input stream name (what your app uses when sending data)
- Defines optional KQL transformations to shape/enrich data
- Routes data to the destination table
- Links to the Data Collection Endpoint (DCE)

**Key components:**
- `streamDeclarations`: Defines the structure of incoming data (must match what your app sends)
- `destinations`: Where the data goes (your Log Analytics workspace)
- `dataFlows`: The transformation pipeline from input stream to output table
- `dataCollectionEndpointId`: Links to the DCE for data ingestion

**Example:**

```json
{
  "name": "ContosoSecurityAlertsPushDCR",
  "apiVersion": "2021-09-01-preview",
  "type": "Microsoft.Insights/dataCollectionRules",
  "location": "[parameters('workspace-location')]",
  "properties": {
    "streamDeclarations": {
      "Custom-ContosoSecurityAlerts": {
        "columns": [
          {
            "name": "EventSeverity",
            "type": "string"
          },
          {
            "name": "EventType",
            "type": "string"
          },
          {
            "name": "UserName",
            "type": "string"
          },
          {
            "name": "SourceIP",
            "type": "string"
          },
          {
            "name": "DeviceId",
            "type": "string"
          },
          {
            "name": "AlertMessage",
            "type": "string"
          }
        ]
      }
    },
    "destinations": {
      "logAnalytics": [
        {
          "workspaceResourceId": "[variables('workspaceResourceId')]",
          "name": "clv2ws1"
        }
      ]
    },
    "dataFlows": [
      {
        "streams": [
          "Custom-ContosoSecurityAlerts"
        ],
        "destinations": [
          "clv2ws1"
        ],
        "transformKql": "source | extend TimeGenerated = now()",
        "outputStream": "Custom-ContosoSecurityAlerts_CL"
      }
    ],
    "dataCollectionEndpointId": "[concat('/subscriptions/',parameters('subscription'),'/resourceGroups/',parameters('resourceGroupName'),'/providers/Microsoft.Insights/dataCollectionEndpoints/',parameters('workspace'))]"
  }
}
```

**Important notes:**
- Stream name must start with `Custom-` prefix
- The `transformKql` can be simply `"source"` for pass-through, or include KQL logic for data transformation
- `outputStream` must match your table name with `Custom-` prefix and `_CL` suffix

### 3. Connector Definition (UI)

**What it is:** Defines how the connector appears in the Microsoft Sentinel data connector gallery. For more information, see [Data Connector Definitions API reference](/rest/api/securityinsights/data-connector-definitions).

**What it includes:**
- Connector title, description, and branding
- Prerequisites and permissions required (workspace access, Entra permissions)
- Instruction steps for deployment
- UI controls for displaying connection details to users

**Key UI elements:**
- `DeployPushConnectorButton`: Triggers automated resource deployment
- `CopyableLabel`: Displays connection details after deployment (uses `fillWith` parameter)
- `Markdown`: Provides formatted instructions and context
- `IsConnectedQuery`: Validates connector connectivity based on recent data

**Example structure (abbreviated for clarity):**

```json
{
  "name": "ContosoSecurityAlertsPush",
  "apiVersion": "2022-09-01-preview",
  "type": "Microsoft.SecurityInsights/dataConnectorDefinitions",
  // ... Full connector definition JSON (abbreviated for clarity) ...
}
```

```json
{
  "name": "ContosoSecurityAlertsPush",
  "apiVersion": "2022-09-01-preview",
  "type": "Microsoft.SecurityInsights/dataConnectorDefinitions",
  // ... Full connector definition JSON (abbreviated for clarity) ...
}
```

Step 6: Create Solution Metadata Files
Step 6A: Solution_ContosoSecurityAlerts.json
In the Data folder, create Solution_ContosoSecurityAlerts.json with your solution details:

```json
{
    "Name": "ContosoSecurityAlerts",
    "Author": "Contoso Corporation - support@contoso.com",
    "Logo": "<svg width=\"75px\" height=\"75px\" viewBox=\"0 0 75 75\" xmlns=\"http://www.w3.org/2000/svg\"><rect width=\"75\" height=\"75\" fill=\"#FF6B35\"/><text x=\"37.5\" y=\"45\" font-family=\"Arial\" font-size=\"18\" fill=\"white\" text-anchor=\"middle\" font-weight=\"bold\">CONTOSO</text></svg>",
    "Description": "The Contoso Security Alerts solution provides real-time security alert ingestion from your Contoso application into Microsoft Sentinel using the Codeless Connector Framework (CCF) Push pattern. Your application pushes alert severity, event types, user information, and network details directly to Azure Monitor for analysis, alerting, and visualization.",
    "Data Connectors": [
        "Data Connectors/ContosoSecurityAlerts_ccf/connectorDefinition.json"
    ],
    "BasePath": "C:\\GitHub\\Azure-Sentinel\\Solutions\\ContosoSecurityAlerts",
    "Version": "1.0.0",
    "Metadata": "SolutionMetadata.json",
    "TemplateSpec": true,
    "Is1PConnector": false
}
```


Critical field requirements: - BasePath: Update to your actual local path to the Azure-Sentinel repository - Metadata: Must reference "SolutionMetadata.json" (created in Step 6B) - Version: Semantic versioning (e.g., "3.0.0") - TemplateSpec: Always true for Content Hub solutions - Is1Pconnector: Set to false for partner/custom connectors - publisherId / offerId: Unique identifiers for your solution - Data Connectors: Array of relative paths to connector definition files

Step 6B: Create SolutionMetadata.json at Solution Root
In the ContosoSecurityAlerts folder, create SolutionMetadata.json at the solution root directory (same level as Data folder):
```json
{
  "publisherId": "contoso",
  "offerId": "contoso-security-alerts",
  "firstPublishDate": "2025-01-01",
  "lastPublishDate": "2025-01-01",
  "providers": [
    "Contoso"
  ],
  "categories": {
    "domains": [
      "Security - Threat Protection",
      "Security - Cloud Security"
    ]
  },
  "support": {
    "name": "Contoso Corporation",
    "tier": "Partner",
    "link": "https://www.contoso.com/support"
  }
}
```

**Why this file is required:**
- The packaging tool expects this file at the solution root
- It contains marketplace metadata for Content Hub distribution

#### Step 6C: Create ReleaseNotes.md at Solution Root
| **Version** | **Date Modified (DD-MM-YYYY)** | **Change History**                          |
|-------------|--------------------------------|---------------------------------------------|
| 3.0.0       | DD-MM-YYYY                     | Example solution                            |

### Validation Checklist

Before proceeding to Step 7, verify:

- Folder name has NO spaces (e.g., ContosoSecurityAlerts)
- Name field in Solution_ContosoSecurityAlerts.json matches folder name exactly
- SolutionMetadata.json exists at solution root (not in Data folder)
- BasePath points to your actual local Azure-Sentinel repository path
- Metadata field references "SolutionMetadata.json"
- publisherId and offerId match between both files

### Step 7: Verify Your Solution Structure
Confirm your folder structure matches the required layout with all files in place:

```text
Azure-Sentinel/
└── Solutions/
    └── ContosoSecurityAlerts/                         Folder name (no spaces)
        ├── Data/
        │   └── Solution_ContosoSecurityAlerts.json    From Step 6A
        ├── SolutionMetadata.json                      From Step 6B (at root)
        ├── ReleaseNotes.md                            From Step 6C
        └── Data Connectors/
            └── ContosoSecurityAlerts_ccf/
                ├── table.json                         From Step 2
                ├── DCR.json                           From Step 3
                ├── connectorDefinition.json           From Step 4
                └── dataConnector.json                 From Step 5
```     

### Step 8: Package Your Solution

Use the createSolutionV3.ps1 packaging tool to generate the ARM deployment template.

```powershell
# Navigate to the packaging tools directory (from Azure-Sentinel repository root)
cd Tools/Create-Azure-Sentinel-Solution/V3

# Run the packaging tool
# When prompted for "Enter solution data folder path:", provide:
# <REPO_ROOT>Solutions/ContosoSecurityAlerts/Data (Note! This path is absolute)
.\createSolutionV3.ps1
```

The script automatically:
- Validates your Data/ folder structure
- Processes connector artifacts

**Expected output:**

The packaging script shows a failed arm-ttk (Azure Resource Manager Template Toolkit) validation. This is expected and normal for CCF Push connectors:

```console
Failed arm-ttk (Test-AzTemplate): Package
Failed arm-ttk (Test-AzTemplate) on solutions: Package
************Validating if Package Json files are valid or not***************
File Solutions\ContosoSecurityAlerts\Package\createUiDefinition.json is a valid Json file!
File Solutions\ContosoSecurityAlerts\Package\mainTemplate.json is a valid Json file!
File Solutions\ContosoSecurityAlerts\Package\testParameters.json is a valid Json file!
```
As long as you see the three JSON validation messages confirming valid files, the packaging succeeded. The arm-ttk failure can be ignored for CCF Push connectors.

For more information, see the [Azure-Sentinel Solutions Tools documentation](https://github.com/Azure/Azure-Sentinel/tree/master/Tools/Create-Azure-Sentinel-Solution).

### Step 9: Deploy the Solution Package

Deploy the generated ARM template (Package/mainTemplate.json) to your Azure subscription.

1. In the Azure Portal, search for **Deploy a custom template**
1. Click **Build your own template in the editor**
1. Click **Load file** and select `Package/mainTemplate.json` from your output folder
1. Click **Save**
1. Fill in the deployment parameters:
   - **Subscription:** Your Azure subscription
   - **Resource Group:** The resource group containing your Sentinel workspace
   - **Region:** Same region as your Sentinel workspace
   - **Workspace:** Your Log Analytics workspace name
1. Click **Review + create**, then **Create**

This makes the connector available in your Microsoft Sentinel data connectors gallery.

For detailed steps, see [Quickstart: Create and deploy ARM templates by using the Azure portal](/azure/azure-resource-manager/templates/quickstart-create-templates-use-the-portal).

### Step 10: Enable the Data Connector

After deploying the solution package, enable the connector to provision resources and generate credentials.

1. In the Azure Portal, navigate to your Microsoft Sentinel workspace
1. Go to **Configuration** > **Data connectors**
1. Search for and select **Contoso Security Alerts (Push)**
1. Click **Open connector page**
1. Click the **Deploy Contoso Security Alerts connector** button
1. Wait for deployment to complete (creates custom table, DCR, DCE, Entra application with credentials)
1. Copy the connection details that appear:
   - Tenant ID
   - Application (Client) ID
   - Client Secret
   - Data Collection Endpoint URI
   - Data Collection Rule Immutable ID
   - Stream Name: `Custom-ContosoSecurityAlerts`

### Step 11: Configure Your Application
Update your application code with the credentials and resource details from Step 10. The code uses the OAuth 2.0 client credentials flow to authenticate with Azure Monitor.

[!CAUTION] Protect your credentials: Never hardcode credentials (Tenant ID, Application ID, Client Secret) directly in your application code or commit them to source control. Use secure credential storage solutions such as: - Azure Key Vault for production applications - Environment variables or configuration files (excluded from source control) - Managed identities where applicable - Secrets management tools that encrypt credentials at rest

The examples below use placeholder values (<Your-Tenant-ID>) to emphasize that you must replace them with secure references to your actual credentials.

Python Example Application Code:

import requests
import json
from datetime import datetime, timezone

**Connection details from Step 10**

```json
tenant_id = "<Your-Tenant-ID>"
app_id = "<Your-Application-ID>"
app_secret = "<Your-Client-Secret>"
dce_uri = "<Your-DCE-URI>"
dcr_immutable_id = "<Your-DCR-Immutable-ID>"
stream_name = "Custom-ContosoSecurityAlerts"
```

**Get OAuth token**

```
token_url = f"https://login.microsoftonline.com/{tenant_id}/oauth2/v2.0/token"
token_data = {
    "client_id": app_id,
    "scope": "https://monitor.azure.com//.default",
    "client_secret": app_secret,
    "grant_type": "client_credentials"
}
token_response = requests.post(token_url, data=token_data)
access_token = token_response.json()["access_token"]
```

**Create event matching your table schema**

```
event = [{
    "TimeGenerated": datetime.now(timezone.utc).isoformat(),
    "EventSeverity": "Medium",
    "EventType": "LoginAlert",
    "UserName": "alice@contoso.com",
    "SourceIP": "192.168.1.100",
    "DeviceId": "device-12345",
    "AlertMessage": "Multiple failed login attempts detected"
}]
```

**Send to Sentinel**

```
headers = {
    "Authorization": f"Bearer {access_token}",
    "Content-Type": "application/json"
}
upload_url = f"{dce_uri}/dataCollectionRules/{dcr_immutable_id}/streams/{stream_name}?api-version=2023-01-01"
response = requests.post(upload_url, headers=headers, json=event)

print(f"Status: {response.status_code}")
print("Security alert sent to Sentinel!")
```

### Step 12: Query Your Data

After sending alerts (allow 5-10 minutes for first ingestion), query in Sentinel:

```kusto
// View all recent alerts
ContosoSecurityAlerts_CL
| where TimeGenerated > ago(1h)
| order by TimeGenerated desc

// High severity alerts
ContosoSecurityAlerts_CL
| where EventSeverity == "High"
| project TimeGenerated, EventType, UserName, SourceIP, AlertMessage

// Alert summary by severity
ContosoSecurityAlerts_CL
| where TimeGenerated > ago(7d)
| summarize Count=count() by EventSeverity
```
## Next Steps

Now that you understand CCF Push connectors:

1. **Design your data schema** - Identify the events you want to send and their fields
1. **Create connector artifacts** - Build the four JSON files (table, DCR, connector definition, data connector)
1. **Organize solution structure** - Set up Data/ and Data Connectors/ folders with proper naming
1. **Package your solution** - Use createSolutionV3.ps1 to generate deployment templates
1. **Deploy and test** - Deploy to your Sentinel workspace and validate data flow
1. **Integrate with your application** - Add code to send events in real-time
1. **Create alerts and workbooks** - Use your data for security monitoring

## Additional Resources

### CCF Documentation

- [Create a codeless connector (CCF Pull)](/azure/sentinel/create-codeless-connector) - Polling-based connectors
- [Data Connector Definitions API reference](/rest/api/securityinsights/data-connector-definitions) - UI configuration guide
- [Data connector connection rules reference](/azure/sentinel/create-codeless-connector) - Connection rules for polling connectors

### Azure Monitor and Data Collection

- [Azure Monitor Logs Ingestion API](/azure/azure-monitor/logs/logs-ingestion-api-overview) - Core API for sending data
- [Data collection rules in Azure Monitor](/azure/azure-monitor/essentials/data-collection-rule-overview) - Understanding DCRs
- [Structure of a data collection rule](/azure/azure-monitor/essentials/data-collection-rule-structure) - DCR structure details
- [Data collection endpoints in Azure Monitor](/azure/azure-monitor/essentials/data-collection-endpoint-overview) - DCE configuration
- [Tutorial: Send data to Azure Monitor Logs with Logs ingestion API](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal) - Step-by-step tutorial
- [Create a custom table](/azure/azure-monitor/logs/create-custom-table) - Custom table creation guide

### Authentication and Security

- [OAuth 2.0 client credentials flow](/entra/identity-platform/v2-oauth2-client-creds-grant-flow) - How app-to-service authentication works
- [Microsoft identity platform access tokens](/entra/identity-platform/access-tokens) - Understanding OAuth tokens
- [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app) - How to register an application in Microsoft Entra ID
- [Best practices for Azure AD application registration](/entra/identity-platform/security-best-practices-for-app-registration) - Entra app security
- [Assign Azure roles using Azure Resource Manager (ARM) templates](/azure/role-based-access-control/role-assignments-template) - Assign roles using templates
- [ARM template security recommendations](/azure/azure-resource-manager/templates/best-practices#security-recommendations-for-parameters) - Securing deployment templates
- [Azure Monitor service limits](/azure/azure-monitor/service-limits) - Rate limits and quotas

### Microsoft Sentinel

- [About Microsoft Sentinel solutions](/azure/sentinel/sentinel-solutions) - Packaging connectors as solutions
- [Monitor the health of your data connectors](/azure/sentinel/monitor-data-connector-health) - Health monitoring
- [ARM template reference for data connectors](/rest/api/securityinsights/data-connectors) - Complete API reference

## Getting Help

- For ISV partners building integrations, contact: azuresentinelpartner@microsoft.com
- For technical questions, use [Microsoft Q&A](/answers/topics/azure-sentinel.html) with the tag 'azure-sentinel'