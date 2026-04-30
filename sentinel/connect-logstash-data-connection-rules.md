---
title: Stream Logs to Microsoft Sentinel via Logstash and DCR-Based API
description: Learn how to configure the Logstash output plugin with Data Collection Rules to stream logs into custom or standard tables in Microsoft Sentinel.
author: EdB-MSFT
ms.author: edbaynash
ms.service: microsoft-sentinel
ms.subservice: sentinel-siem
ms.topic: how-to
ms.date: 04/28/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012
#customer intent: As a security engineer, I want to configure the Logstash output plugin with DCRs so that I can stream external log data into Microsoft Sentinel with full control over the output schema.
---

# Stream logs to Microsoft Sentinel with Logstash and DCR-based API

> [!IMPORTANT]
> Data ingestion using the Logstash output plugin with Data Collection Rules (DCRs) is currently in public preview. This feature is provided without a service level agreement. For more information, see [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

Microsoft Sentinel's Logstash output plugin supports pipeline transformations and advanced configuration via Data Collection Rules (DCRs). The plugin forwards logs from external data sources into custom or standard tables in Log Analytics or Microsoft Sentinel.

In this article, learn how to set up the Logstash plugin to stream data into Log Analytics or Microsoft Sentinel using DCRs, with full control over the output schema.

> [!NOTE]
> A [previous version of the Logstash plugin](connect-logstash) allows you to connect data sources through Logstash via the Data Collection API.

With the plugin, you can:

- Control the configuration of the column names and types.
- Perform ingestion-time transformations like filtering or enrichment.
- Ingest custom logs into a custom table, or ingest a Syslog input stream into the Log Analytics Syslog table.

Ingestion into standard tables is limited only to [standard tables supported for custom logs ingestion](/azure/azure-monitor/logs/logs-ingestion-api-overview#supported-tables).

To learn more about working with the Logstash data collection engine, see [Getting started with Logstash](https://www.elastic.co/guide/en/logstash/current/getting-started-with-logstash.html).

## Architecture overview

:::image type="content" source="media/connect-logstash-data-collection-rules/logstash-data-collection-rule-architecture.png" alt-text="Diagram of the Logstash architecture showing input, filter, and output plugin stages sending data to Log Analytics via the Logs Ingestion API." lightbox="media/connect-logstash-data-collection-rules/logstash-data-collection-rule-architecture.png":::

The Logstash engine is composed of three components:

- Input plugins: Customized collection of data from various sources.
- Filter plugins: Manipulation and normalization of data according to specified criteria.
- Output plugins: Customized sending of collected and processed data to various destinations.

> [!NOTE]
> - Microsoft supports only the Microsoft Sentinel-provided Logstash output plugin discussed here. The current plugin is **[microsoft-sentinel-log-analytics-logstash-output-plugin](https://github.com/Azure/Azure-Sentinel/tree/master/DataConnectors/microsoft-sentinel-log-analytics-logstash-output-plugin)**, v2.1.0. You can [open a support ticket](https://portal.azure.com/#create/Microsoft.Support) for any issues regarding the output plugin.
> - Microsoft does not support third-party Logstash output plugins for Microsoft Sentinel, or any other Logstash plugin or component of any type.
> - See the prerequisites for the plugin's Logstash version support.

The plugin sends JSON-formatted data to your Log Analytics workspace using the Logs Ingestion API. The data is ingested into custom logs or a standard table.

- Learn more about the [Logs ingestion API](/azure/azure-monitor/logs/logs-ingestion-api-overview).

## Deploy the Microsoft Sentinel output plugin in Logstash

To set up the plugin, follow these steps:

- Review the prerequisites
- Install the plugin
- Create a sample file
- Create the required DCR-related resources
- Configure Logstash configuration file
- Restart Logstash
- View incoming logs in Microsoft Sentinel
- Monitor output plugin audit logs

### Logstash plugin prerequisites

- Install a supported version of Logstash. The plugin supports the following Logstash versions:

    - 7.0 - 7.17.13
    - 8.0 - 8.9
    - 8.11 - 8.15
    - 8.19.2
    - 9.0.8
    - 9.1.10
    - 9.2.4 - 9.2.5

    > [!NOTE]
    > If you use Logstash 8, we recommended that you [disable ECS in the pipeline](https://www.elastic.co/guide/en/logstash/8.4/ecs-ls.html).
- Verify that you have a Log Analytics workspace with at least contributor rights.
- Verify that you have permissions to create DCR objects in the workspace.

### Install the plugin

The Microsoft Sentinel output plugin is available in the [Logstash collection on RubyGems](https://rubygems.org/gems/microsoft-sentinel-log-analytics-logstash-output-plugin/versions/2.1.0-java).

- Follow the instructions in the Logstash [Working with plugins](https://www.elastic.co/guide/en/logstash/current/working-with-plugins.html) document to install the **[microsoft-sentinel-log-analytics-logstash-output-plugin](https://github.com/Azure/Azure-Sentinel/tree/master/DataConnectors/microsoft-sentinel-log-analytics-logstash-output-plugin)** plugin. To install to an existing Logstash installation, run the following command:

    ```bash
    logstash-plugin install microsoft-sentinel-log-analytics-logstash-output-plugin
    ```

- If your Logstash system doesn't have internet access, follow the instructions in the Logstash [Offline Plugin Management](https://www.elastic.co/guide/en/logstash/current/offline-plugins.html) document to prepare and use an offline plugin pack. (This requires building another Logstash system with internet access.)

### Create a sample file

In this section, you create a sample file in one of these scenarios:

- Create a sample file for custom logs
- Create a sample file to ingest logs into the Syslog table

#### Create a sample file for custom logs

In this scenario, you configure the Logstash input plugin to send events to Microsoft Sentinel. This example uses the generator input plugin to simulate events. You can use any other input plugin.

In this example, the Logstash configuration file looks like this:

```ruby
input {
      generator {
            lines => [
                 "This is a test log message"
            ]
           count => 10
      }
}
```

To create the sample file, follow these steps:

1. Copy the output plugin configuration below to your Logstash configuration file.

    ```ruby
    output {
        microsoft-sentinel-log-analytics-logstash-output-plugin {
          create_sample_file => true
          sample_file_path => "<enter the path to the file in which the sample data will be written>" #for example: "c:\\temp" (for windows) or "/tmp" for Linux. 
        }
    }
    ```
1. Make sure the referenced file path already exists, then start Logstash.

    The plugin writes ten records to a sample file named `sampleFile<epoch seconds>.json` in the configured path once there are 10 events to sample or when the Logstash process exits gracefully. For example: *c:\temp\sampleFile1648453501.json*. Here is part of a sample file that the plugin creates:

    ```json
    [
            {
                "host": "logstashMachine",
                "sequence": 0,
                "message": "This is a test log message",
                "ls_timestamp": "2022-03-28T17:45:01.690Z",
                "ls_version": "1"
            },
            {
                "host": "logstashMachine",
                "sequence": 1
        ...
    
        ]    
    ```

    The plugin automatically adds these properties to every record:

    - `ls_timestamp`: The time when the record is received from the input plugin
    - `ls_version`: The Logstash pipeline version.

    You can remove these fields when you create the DCR.

#### Create a sample file to ingest logs into the Syslog table

In this scenario, you configure the Logstash input plugin to send syslog events to Microsoft Sentinel.

1. If you don't already have syslog messages forwarded into your Logstash machine, you can use the logger command to generate messages. For example (for Linux):

    ```bash
    logger -p local4.warn --rfc3164 --tcp -t CEF "0|Microsoft|Device|cef-test|example|data|1|here is some more data for the example" -P 514 -d -n 127.0.0.1
    ```

    Here is an example for the Logstash input plugin:

    ```ruby
    input {
         syslog {
             port => 514
        }
    }
    ```
2. Copy the output plugin configuration below to your Logstash configuration file.

    ```ruby
    output {
        microsoft-sentinel-log-analytics-logstash-output-plugin {
          create_sample_file => true
          sample_file_path => "<enter the path to the file in which the sample data will be written>" #for example: "c:\\temp" (for windows) or "/tmp" for Linux. 
        }
    }
    ```
1. Make sure the file path already exists, then start Logstash.

    The plugin writes ten records to a sample file named `sampleFile<epoch seconds>.json` in the configured path once there are 10 events to sample or when the Logstash process exits gracefully. For example: *c:\temp\sampleFile1648453501.json*. Here is part of a sample file that the plugin creates:

    ```json
    [
            {
                "logsource": "logstashMachine",
                "facility": 20,
                "severity_label": "Warning",
                "severity": 4,
                "timestamp": "Apr  7 08:26:04",
                "program": "CEF:",
                "host": "127.0.0.1",
                "facility_label": "local4",
                "priority": 164,
                "message": "0|Microsoft|Device|cef-test|example|data|1|here is some more data for the example",
                "ls_timestamp": "2022-04-07T08:26:04.000Z",
                "ls_version": "1"
            }
    ]    
    
    ```

    The plugin automatically adds these properties to every record:

    - `ls_timestamp`: The time when the record is received from the input plugin
    - `ls_version`: The Logstash pipeline version.

    You can remove these fields when you create the DCR.

### Create the required DCR resources

To configure the Microsoft Sentinel DCR-based Logstash plugin, first create the DCR-related resources.

In this section, you create resources to use for your DCR, in one of these scenarios:

- Create DCR resources for ingestion into a custom table
- Create DCR resources for ingestion into a standard table

#### Create DCR resources for ingestion into a custom table

To ingest the data to a custom table, follow these steps (based on the [Send data to Azure Monitor Logs using REST API (Azure portal) tutorial](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal)):

1. Review the [prerequisites](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal#prerequisites).
2. [Configure the application](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal#create-azure-ad-application).
3. [Add a custom log table](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal#create-new-table-in-log-analytics-workspace).
4. [Parse and filter sample data](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal#parse-and-filter-sample-data) using the sample file you created in the previous section.
5. [Collect information from the DCR](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal#collect-information-from-the-dcr).
6. [Assign permissions to the DCR](/azure/azure-monitor/logs/tutorial-logs-ingestion-portal#assign-permissions-to-the-dcr).

    Skip the Send sample data step.

If you come across any issues, see the [troubleshooting steps](/azure/azure-monitor/logs/tutorial-logs-ingestion-code#troubleshooting).

#### Create DCR resources for ingestion into a standard table

To ingest the data to a standard table like Syslog or CommonSecurityLog, you use a process based on the [Send data to Azure Monitor Logs using REST API (Resource Manager templates) tutorial](/azure/azure-monitor/logs/tutorial-logs-ingestion-api). While the tutorial explains how to ingest data into a custom table, you can easily adjust the process to ingest data into a standard table. The steps below indicate relevant changes in the steps.

1. Review the [prerequisites](/azure/azure-monitor/logs/tutorial-logs-ingestion-api#prerequisites).
2. [Collect workspace details](/azure/azure-monitor/logs/tutorial-logs-ingestion-api#collect-workspace-details).
3. [Configure an application](/azure/azure-monitor/logs/tutorial-logs-ingestion-api#create-azure-ad-application).

    Skip the Create new table in Log Analytics workspace step. This step isn't relevant when ingesting data into a standard table, because the table is already defined in Log Analytics.
4. [Create the DCR](/azure/azure-monitor/logs/tutorial-logs-ingestion-api#create-data-collection-rule). In this step:

    - Provide the sample file you created in the previous section.
    - Use the sample file you created to define the `streamDeclarations` property. Each of the fields in the sample file should have a corresponding column with the same name and the appropriate type (see the example below).
    - Configure the value of the `outputStream` property with the name of the standard table instead of the custom table. Unlike custom tables, standard table names don't have the `_CL` suffix.
    - The prefix of the table name should be `Microsoft-` instead of `Custom-`. In this example, the `outputStream` property value is `Microsoft-Syslog`.
5. [Assign permissions to a DCR](/azure/azure-monitor/logs/tutorial-logs-ingestion-api#assign-permissions-to-a-dcr).

    Skip the Send sample data step.

If you come across any issues, see the [troubleshooting steps](/azure/azure-monitor/logs/tutorial-logs-ingestion-code#troubleshooting).

##### Example: DCR that ingests data into the Syslog table

Keep these points in mind:

- The `streamDeclarations` column names and types should be the same as the sample file fields, but you don't have to specify all of them. For example, in the DCR below, the `PRI`, `type` and `ls_version` fields are omitted from the `streamDeclarations` column.
- The `dataflows` property transforms the input to the Syslog table format, and sets the `outputStream` to `Microsoft-Syslog`.

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "dataCollectionRuleName": {
      "type": "String",
      "metadata": {
        "description": "Specifies the name of the Data Collection Rule to create."
      }
    },
    "location": {
      "defaultValue": "[resourceGroup().location]",
      "type": "String",
      "metadata": {
        "description": "Specifies the location in which to create the Data Collection Rule."
      }
    },
    "workspaceResourceId": {
      "type": "String",
      "metadata": {
        "description": "Specifies the Azure resource ID of the Log Analytics workspace to use."
      }
    }
  },
  "resources": [
    {
      "type": "Microsoft.Insights/dataCollectionRules",
      "apiVersion": "2021-09-01-preview",
      "name": "[parameters('dataCollectionRuleName')]",
      "location": "[parameters('location')]",
      "properties": {
        "streamDeclarations": {
          "Custom-SyslogStream": {
            "columns": [
              { "name": "ls_timestamp", "type": "datetime" },
              { "name": "timestamp", "type": "datetime" },
              { "name": "message", "type": "string" },
              { "name": "facility_label", "type": "string" },
              { "name": "severity_label", "type": "string" },
              { "name": "host", "type": "string" },
              { "name": "logsource", "type": "string" }
            ]
          }
        },
        "destinations": {
          "logAnalytics": [
            {
              "workspaceResourceId": "[parameters('workspaceResourceId')]",
              "name": "clv2ws1"
            }
          ]
        },
        "dataFlows": [
          {
            "streams": ["Custom-SyslogStream"],
            "destinations": ["clv2ws1"],
            "transformKql": "source | project TimeGenerated = ls_timestamp, EventTime = todatetime(timestamp), Computer = logsource, HostName = logsource, HostIP = host, SyslogMessage = message, Facility = facility_label, SeverityLevel = severity_label",
            "outputStream": "Microsoft-Syslog"
          }
        ]
      }
    }
  ],
  "outputs": {
    "dataCollectionRuleId": {
      "type": "String",
      "value": "[resourceId('Microsoft.Insights/dataCollectionRules', parameters('dataCollectionRuleName'))]"
    }
  }
}
```

### Configure Logstash configuration file

The plugin supports two authentication methods: **service principal** (client credentials) and **managed identity** (passwordless). Choose the method that suits your environment.

#### Service principal authentication

To configure the Logstash configuration file to ingest the logs into a custom table using service principal authentication, retrieve these values:

| Field | How to retrieve |
| --- | --- |
| `client_app_Id` | The `Application (client) ID` value you create in step 3 when you create the DCR resources, according to the tutorial you used in this section. |
| `client_app_secret` | The client secret value you create in step 5 when you create the DCR resources, according to the tutorial you used in this section. |
| `tenant_id` | Your subscription's tenant ID. You can find the tenant ID under **Home > Microsoft Entra ID > Overview > Basic Information**. |
| `data_collection_endpoint` | The value of the `logsIngestion` URI in step 3 when you create the DCR resources, according to the tutorial you used in this section. |
| `dcr_immutable_id` | The value of the DCR `immutableId` in step 6 when you create the DCR resources, according to the tutorial you used in this section. |
| `dcr_stream_name` | For custom tables, as explained in step 6 when you create the DCR resources, go to the JSON view of the DCR, and copy the `dataFlows` > `streams` property. See the `dcr_stream_name` in the example below. For standard tables, the value is `Custom-SyslogStream`. |

After you retrieve the required values:

1. Replace the output section of the Logstash configuration file you created in the previous step with the example below.
1. Replace the placeholder strings in the example below with the values you retrieved.
1. Make sure you change the `create_sample_file` attribute to `false`.

##### Example: Service principal output plugin configuration

```ruby
output {
    microsoft-sentinel-log-analytics-logstash-output-plugin {
      client_app_Id => "<enter your client_app_id value here>"
      client_app_secret => "<enter your client_app_secret value here>"
      tenant_id => "<enter your tenant id here>"
      data_collection_endpoint => "<enter your logsIngestion URI here>"
      dcr_immutable_id => "<enter your DCR immutableId here>"
      dcr_stream_name => "<enter your stream name here>"
      create_sample_file=> false
      sample_file_path => "c:\\temp"
    }
}
```

#### Managed identity authentication (passwordless)

When `managed_identity` is set to `true`, the plugin authenticates without a client secret. The plugin automatically detects the appropriate identity mechanism at runtime in the following order:

1. **AKS Workload Identity** — If the environment variables `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, and `AZURE_FEDERATED_TOKEN_FILE` are present (set automatically by AKS), the plugin performs an OIDC token exchange.
2. **Azure Arc** — If the Azure Connected Machine Agent (`azcmagent`) is detected on the host, the plugin uses the Azure Arc managed identity endpoint for hybrid and on-premises servers.
3. **IMDS** — Otherwise, the plugin falls back to the Azure Instance Metadata Service (IMDS) for Azure VMs and VMSS.

Required configuration for managed identity:

| Field | Description |
| --- | --- |
| `managed_identity` | Boolean, `false` by default. Set to `true` to enable passwordless authentication. |
| `data_collection_endpoint` | String. The logsIngestion URI for your DCE. |
| `dcr_immutable_id` | String. The DCR immutableId. |
| `dcr_stream_name` | String. The name of the data stream. |
| `managed_identity_object_id` | Optional. String, empty by default. The object ID of a user-assigned managed identity. Required when the VM has multiple user-assigned identities. Omit for system-assigned managed identity. |

##### Example: System-assigned managed identity

```ruby
output {
    microsoft-sentinel-log-analytics-logstash-output-plugin {
      managed_identity => true
      data_collection_endpoint => "<enter your DCE logsIngestion URI here>"
      dcr_immutable_id => "<enter your DCR immutableId here>"
      dcr_stream_name => "<enter your stream name here>"
    }
}
```

##### Example: User-assigned managed identity

```ruby
output {
    microsoft-sentinel-log-analytics-logstash-output-plugin {
      managed_identity => true
      managed_identity_object_id => "<enter the object ID of your user-assigned identity>"
      data_collection_endpoint => "<enter your DCE logsIngestion URI here>"
      dcr_immutable_id => "<enter your DCR immutableId here>"
      dcr_stream_name => "<enter your stream name here>"
    }
}
```

> [!NOTE]
> - When using Azure Arc, the Logstash process must run as a user that is a member of the `himds` group to read the challenge token. For more information, see [Azure Arc managed identity documentation](/azure/azure-arc/servers/managed-identity-authentication).
> - For security reasons, don't implicitly state sensitive configuration values such as `client_app_secret` in your Logstash configuration file. Store sensitive information in a [Logstash KeyStore](https://www.elastic.co/guide/en/logstash/current/keystore.html#keystore).
> - When you set an empty string as a value for a proxy setting, it unsets any system-wide proxy setting.

#### Optional configuration

| Field | Description | Default value |
| --- | --- | --- |
| `azure_cloud` | Used to specify the name of the Azure cloud that is being used. Available values are: `AzureCloud`, `AzureChinaCloud`, and `AzureUSGovernment`. | `AzureCloud` |
| `key_names` | An array of strings. Provide this field if you want to send a subset of the columns to Log Analytics. | None (field is empty) |
| `plugin_flush_interval` | Defines the maximal time difference (in seconds) between sending two messages to Log Analytics. | `5` |
| `retransmission_time` | Sets the amount of time in seconds for retransmitting messages once sending failed. | `10` |
| `retransmission_delay` | The delay in seconds between each retry attempt when sending log data fails. Increase this value to reduce request rate during throttling (HTTP 429) scenarios. | `2` |
| `compress_data` | When this field is `True`, the event data is compressed before using the API. Recommended for high throughput pipelines. | `False` |
| `proxy` | Specify which proxy URL to use for all API calls. | None (field is empty) |
| `proxy_aad` | Specify which proxy URL to use for API calls to Microsoft Entra ID. Overrides the `proxy` setting. | None (field is empty) |
| `proxy_endpoint` | Specify which proxy URL to use for API calls to the Data Collection Endpoint. Overrides the `proxy` setting. | None (field is empty) |

### Restart Logstash

Restart Logstash with the updated output plugin configuration. Verify that data is ingested into the correct table according to your DCR configuration.

### View incoming logs in Microsoft Sentinel

To verify that log data reaches your workspace, follow these steps:

1. Verify that messages are being sent to the output plugin.
1. From the Microsoft Sentinel navigation menu, select **Logs**. Under the **Tables** heading, expand the **Custom Logs** category. Find and select the name of the table you specified (with a `_CL` suffix) in the configuration.

    :::image type="content" source="media/connect-logstash/logstash-custom-logs-menu.png" alt-text="Screenshot of the Microsoft Sentinel Logs page showing the Custom Logs category expanded with a Logstash custom table selected.":::
1. To see records in the table, query the table by using the table name as the schema.

    :::image type="content" source="media/connect-logstash/logstash-custom-logs-query.png" alt-text="Screenshot of a Logstash custom logs query.":::

## Monitor output plugin audit logs

To monitor the connectivity and activity of the Microsoft Sentinel output plugin, enable the appropriate Logstash log file. See the [Logstash Directory Layout](https://www.elastic.co/guide/en/logstash/current/dir-layout.html#dir-layout) document for the log file location.

If you aren't seeing any data in this log file, generate and send some events locally through the input and filter plugins to make sure the output plugin is receiving data. Microsoft Sentinel supports only issues related to the output plugin.

## Network security

Define network settings and enable network isolation for the Microsoft Sentinel Logstash output plugin.

### Virtual network service tags

Microsoft Sentinel output plugin supports [Azure virtual network service tags](/azure/virtual-network/service-tags-overview). Both *AzureMonitor* and *AzureActiveDirectory* tags are required.

Azure Virtual Network service tags can be used to define network access controls on [network security groups](/azure/virtual-network/network-security-groups-overview#security-rules), [Azure Firewall](/azure/firewall/service-tags), and user-defined routes. Use service tags instead of specific IP addresses when you create security rules and routes. For scenarios where Azure Virtual Network service tags can't be used, the firewall requirements are given below.

### Firewall requirements

The following table lists the firewall requirements for scenarios where Azure virtual network service tags can't be used.

| Cloud | Endpoint | Purpose | Port | Direction | Bypass HTTPS inspection |
| --- | --- | --- | --- | --- | --- |
| Azure Commercial | `https://login.microsoftonline.com` | Authorization server (the Microsoft identity platform) | Port 443 | Outbound | Yes |
| Azure Commercial | `https://<data collection endpoint name>.<Azure cloud region>.ingest.monitor.azure.com` | Data collection Endpoint | Port 443 | Outbound | Yes |
| Azure Government | `https://login.microsoftonline.us` | Authorization server (the Microsoft identity platform) | Port 443 | Outbound | Yes |
| Azure Government | Replace '.com' above with '.us' | Data collection Endpoint | Port 443 | Outbound | Yes |
| Microsoft Azure operated by 21Vianet | `https://login.chinacloudapi.cn` | Authorization server (the Microsoft identity platform) | Port 443 | Outbound | Yes |
| Microsoft Azure operated by 21Vianet | Replace '.com' above with '.cn' | Data collection Endpoint | Port 443 | Outbound | Yes |

## Plugin version history

### 2.1.0

- Fixed event normalization.

### 2.0.0

- Refactored the plugin from Ruby to Java.
- Added ManagedIdentity authentication.
- Moved codebase from GitHub to Azure DevOps.
- Closed codebase.

### 1.2.0

- Adds managed identity authentication support for Azure VMs/VMSS (system-assigned and user-assigned via IMDS).
- Adds AKS workload identity support via OIDC token exchange.
- Adds Azure Arc managed identity support for hybrid and on-premises servers.
- Auto-detects authentication method at runtime based on environment (workload identity env vars, Arc agent, or IMDS fallback).
- Migrates HTTP client from `excon` to `rest-client` for improved JRuby and Logstash plugin ecosystem compatibility.
- Renames Azure Active Directory references to Microsoft Entra ID.

### 1.1.4

- Limits `excon` library version to lower than 1.0.0 to ensure the port is always used when using a proxy.

### 1.1.3

- Replaces the `rest-client` library used for connecting to Azure with the `excon` library.

### 1.1.1

- Adds support for Azure US Government cloud and Microsoft Azure operated by 21Vianet in China.

### 1.1.0

- Allows setting different proxy values for API connections.
- Upgrades version for logs ingestion API to 2023-01-01.
- Renames the plugin to microsoft-sentinel-log-analytics-logstash-output-plugin.

### 1.0.0

- The initial release for the Logstash output plugin for Microsoft Sentinel. This plugin uses Data Collection Rules (DCRs) with Azure Monitor's Logs Ingestion API.

## Known issues

When using Logstash installed on a Docker image of Lite Ubuntu, the following warning may appear:

```
java.lang.RuntimeException: getprotobyname_r failed
```

To resolve this error, install the *netbase* package in your Dockerfile:

```bash
USER root
RUN apt install netbase -y
```

For more information, see [JNR regression in Logstash 7.17.0 (Docker)](https://github.com/elastic/logstash/issues/13703).

If your environment's event rate is low, increase the value of *plugin_flush_interval* to 60 or more. You can monitor the ingestion payload using [DCR metrics](/azure/azure-monitor/essentials/data-collection-monitor#dcr-metrics). For more information on *plugin_flush_interval*, see the [Optional configuration](#optional-configuration) table.

## Limitations

- Ingestion into standard tables is limited only to [standard tables supported for custom logs ingestion](/azure/azure-monitor/logs/logs-ingestion-api-overview#supported-tables).

- The columns of the input stream in the `streamDeclarations` property must start with a letter. If you start a column with other characters (for example `@` or `_`), the operation fails.
- The `TimeGenerated` datetime field is required. You must include this field in the KQL transform.
- For additional possible issues, review the [troubleshooting section](/azure/azure-monitor/logs/tutorial-logs-ingestion-code#troubleshooting) in the tutorial.
