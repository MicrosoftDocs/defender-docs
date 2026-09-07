---
title: Update SAP connector and DCR settings
titleSuffix: Microsoft Sentinel
description: Update Microsoft Sentinel SAP connector polling settings and data collection rules without disconnecting the connector.
ms.author: mapankra
author: MartinPankraz
ms.topic: how-to
ms.date: 08/10/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted
---

# Update SAP connector and DCR settings

Update the SAP data connector or its data collection rule (DCR) independently to tune collection settings without disconnecting SAP systems. You don't need to update both resources. This article shows one option for each resource: Azure API Playground for the connector and the Azure portal template experience for the DCR.

> [!IMPORTANT]
> Update the active `dataConnectors` resource, not the connector-definition resource. The DCR might be shared by multiple connectors, so review its impact before you deploy DCR changes.

> [!IMPORTANT]
> Changing polling frequency or other defaults can affect SAP and SAP Integration Suite performance, ingestion latency, and Microsoft Sentinel costs. A shorter interval might increase source-system load, while a longer interval might delay detections or create a backlog. Test changes on one connector first, monitor connector health and ingestion volume, and then roll out the change to other systems. For more guidance, see [Run the agentless SAP connector cost-efficiently](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/run-agentless-sap-connector-cost-efficiently/4464781).

## Update a data connector with API Playground

Several options are available for updating a data connector, including REST API clients and scripts. The following procedure shows one option using [Azure API Playground](https://portal.azure.com/?feature.customportal=false#view/Microsoft_Azure_Resources/ArmPlayground.ReactView).

### SAP BTP connector

1. Use the [Data Connectors - List](/rest/api/securityinsights/data-connectors/list) operation. Select the latest preview API version in the reference. For example:

    ```http
    GET /subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>/providers/Microsoft.SecurityInsights/dataConnectors?api-version=<api-version>-preview
    ```

1. In the response, locate the target connector in the `value` array. Copy its `id`.

1. Use the copied `id` as the URL for a `PUT` request. Use the existing connector properties as the starting point, and change only the settings you need.

    The following SAP BTP example changes the polling frequency. `queryWindowInMin` is the polling-frequency field.

    ```json
    {
      "id": "<connector-resource-id>",
      "name": "<connector-id>",
      "type": "Microsoft.SecurityInsights/dataConnectors",
      "kind": "RestApiPoller",
      "properties": {
        "dataType": "SAPBTPAuditLog_CL",
        "connectorDefinitionName": "SAPBTPAuditEvents",
        "addOnAttributes": {
          "SubaccountName": "<subaccount-name>"
        },
        "auth": {
          "ClientSecret": "<client-secret>",
          "ClientId": "<client-id>",
          "grantType": "client_credentials",
          "tokenEndpoint": "<token-endpoint>",
          "type": "OAuth2"
        },
        "request": {
          "apiEndpoint": "<api-endpoint>/auditlog/v2/auditlogrecords",
          "queryWindowInMin": 1
        }
      }
    }
    ```

    Retrieve `<client-id>`, `<client-secret>`, `<token-endpoint>`, and `<api-endpoint>` from the SAP BTP auditlog-management service key: `uaa.clientid`, `uaa.clientsecret`, `uaa.url`, and `url`. For details, see [Set up the BTP subaccount and solution](deploy-sap-btp-solution.md#set-up-the-btp-subaccount-and-solution). The list API response omits the client ID and client secret, so read them from your secure store and don't submit blank credential values.

1. Select **Send**. The update might take several minutes to become active.

### SAP applications agentless connector

The SAP BTP and SAP applications agentless connectors use different request properties. For the SAP applications agentless connector, use the existing connector `id` and include the SAPCC definition. If the RFC destination changes, update the `rfcDestinationName` header. For example:

```json
{
  "id": "<connector-resource-id>",
  "name": "<connector-id>",
  "type": "Microsoft.SecurityInsights/dataConnectors",
  "kind": "RestApiPoller",
  "properties": {
    "dataType": "SentinelHealth",
    "connectorDefinitionName": "SAPCC",
    "auth": {
      "GrantType": "client_credentials",
      "ClientSecret": "<client-secret>",
      "ClientId": "<client-id>",
      "tokenEndpoint": "<token-endpoint>?grant_type=client_credentials",
      "type": "OAuth2"
    },
    "request": {
      "apiEndpoint": "<integration-suite-endpoint>/http/microsoft/sentinel/sap-log-trigger",
      "rateLimitQPS": 2,
      "queryWindowInMin": 1,
      "queryTimeFormat": "yyyy-MM-ddTHH:mm:ss.000000+00:00",
      "retryCount": 1,
      "timeoutInSeconds": 180,
      "headers": {
        "rfcDestinationName": "<rfc-destination-name>"
      },
      "startTimeAttributeName": "startTimeUTC",
      "endTimeAttributeName": "endTimeUTC"
    }
  }
}
```

Keep the existing SAPCC properties unless you intend to change them. Use the full resource returned by the list operation as your starting point, and preserve any properties not shown in this minimal example.

Retrieve `<client-id>`, `<client-secret>`, `<token-endpoint>`, and `<integration-suite-endpoint>` from the SAP BTP Process Integration Runtime service key: `clientid`, `clientsecret`, `tokenurl`, and `url`. For details, see [Connect your agentless data connector](deploy-data-connector-agentless.md#connect-your-agentless-data-connector). The list API response omits the client ID and client secret, so read them from your secure store and don't submit blank credential values.

Keep `queryTimeFormat`, `startTimeAttributeName`, and `endTimeAttributeName` together. They define how the poller supplies the time window to the SAP Data Collector endpoint.

For the full SAP BTP field mapping, see the [SAP BTP polling configuration](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/SAP%20BTP/Data%20Connectors/SAPBTPPollerConnector/SAPBTP_PollingConfig.json). For the SAP applications agentless field mapping, see the [SAP Integration Suite tools](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/SAP/Tools/IntegrationSuite).

## Update the DCR with an exported template

Several options are available for updating a DCR, including REST API clients, scripts, and ARM templates. The following procedure shows one portal-based option using an exported template.

1. In the Azure portal, open the DCR and select **Automation** > **Export template**.
1. Select **Copy**, to store the well-formatted template JSON.
1. Select **Deploy**, then on the next screen select **Edit template** and paste the copied JSON into the editor.
1. Change only the required DCR properties (**streamDeclarations** and **dataFlows**) and keep the resource name unchanged.
1. Select **Review + create**, then select **Create**.

Wait for the deployment to complete and for the DCR change to take effect. Verify connector health and new data in the relevant SAP tables before relying on the update.

For more detail about selectively updating SAP-related DCR data flows, see the SAP community blog [Activating Advanced Security Information Model (ASIM) LogServ with Sentinel for SAP RISE](https://community.sap.com/t5/enterprise-resource-planning-blog-posts-by-members/activating-advanced-security-information-model-logserv-with-sentinel-for/ba-p/14454303).

## Automate updates at scale

For mass onboarding and updates, use the API and CLI-based approaches in [Deploy the Microsoft Sentinel solution for SAP BTP](deploy-sap-btp-solution.md#mass-onboard-sap-btp-subaccounts-at-scale) and [Connect your SAP system to Microsoft Sentinel](deploy-data-connector-agentless.md#mass-onboard-sap-systems-at-scale).

## Related content

- [Connect your SAP system to Microsoft Sentinel](deploy-data-connector-agentless.md)
- [Troubleshoot the Microsoft Sentinel solution for SAP applications](sap-deploy-troubleshoot.md)
- [Create data collection rules (DCRs) using JSON](/azure/azure-monitor/data-collection/data-collection-rule-create-edit)
- [Run the agentless SAP connector cost-efficiently](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/run-agentless-sap-connector-cost-efficiently/4464781) for implications of changing default connector settings
