---
title: Create pull codeless data connectors using nested API polling
description: Learn how to build a Microsoft Sentinel Codeless Connector Framework (CCF) pull connector that uses nested API polling to chain REST API calls.
ms.author: edbaynash
author: EdB-MSFT
ms.topic: how-to
ms.date: 08/24/2026
ms.service: microsoft-sentinel
ms.subservice: sentinel-siem
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
# customer intent: As a security engineer or ISV, I want to create a CCF pull connector that uses nested API polling so that I can ingest data from APIs where one request depends on the response from another request.
---

# Create pull codeless data connectors using nested API polling

Some REST APIs require sequential calls, where the response from one endpoint provides input that must be passed to another endpoint. The Microsoft Sentinel Codeless Connector Framework (CCF) supports this pattern through nested API polling for `RestApiPoller` connectors.

> [!IMPORTANT]
> Nested API polling is currently in public preview. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include more legal terms that apply to Azure features in beta, preview, or otherwise not yet released into general availability.

Use nested API polling when a parent API call returns identifiers, cursors, or other values that are required by one or more child API calls. CCF extracts the required values from the parent response, substitutes them into the child request, and sends the child responses to the configured destination table.

Configure nested API polling in a CCF pull connector by defining the nesting logic in the `RestApiPoller` connection rules.

For the end-to-end process to create and package a CCF connector, see [Create a codeless connector for Microsoft Sentinel](create-codeless-connector.md). You can also use the Microsoft Sentinel extension for Visual Studio Code to implement and test nested API polling workflows. For setup and usage information, see [Build custom connectors with AI in Microsoft Sentinel](create-custom-connector-builder-agent.md). For the standard `RestApiPoller` request, response, authentication, paging, and DCR properties, see [RestApiPoller data connector connection rules reference](../data-connector-connection-rules-reference.md).

> [!NOTE]
> If you're an Independent Software Vendor (ISV) building a Microsoft Sentinel integration using the Codeless Connector Framework, the Microsoft App Assure team may be able to assist. To engage the App Assure team, send an email to [azuresentinelpartner@microsoft.com](mailto:azuresentinelpartner@microsoft.com).

## Prerequisites

Before you configure nested API polling, make sure you understand:

- The API endpoints that the connector needs to call.
- Which response values from the parent API call are required by the child API call.
- The output schema for the destination table.
- How to create a standard CCF `RestApiPoller` connector.

A complete CCF connector includes the following components:

- **Table**: The Log Analytics custom table where ingested data is stored.
- **DCR**: The data collection rule that defines the ingestion transformation.
- **Connector UI**: The data connector definition that appears in the Microsoft Sentinel content hub.
- **Data connection rules**: The connector configuration that fetches data from the source API.

Nested API polling is configured in the data connection rules for a `RestApiPoller` connector.

## What is nested API polling?

Nested API polling is a CCF polling pattern that chains REST API calls. The first API call, called the parent step, returns values that are required by later API calls, called child steps.

For example, an API might use this pattern:

1. `GET /incidents` returns a list of incident IDs.
1. `GET /incidents/{incidentId}/details` returns the full incident record for each ID.

A single API call doesn't return the complete data. The connector must call the list endpoint, extract each `incidentId`, and then call the details endpoint once for every ID.

Use nested API polling when:

- A list endpoint returns resource IDs, and a details endpoint requires each ID in the URL path or query string.
- A parent response returns a cursor, session token, query ID, or reference ID that a child request needs.
- A response contains an array of values that must each be passed individually to another endpoint.
- The parent response contains fields you want to keep, and the child response adds enrichment data that should be joined into the same output row.

If a single API call returns all the data you need, nested API polling isn't required. Use the standard `eventsJsonPaths` property to extract records from the response.

## How nested API polling works

Nested API polling is configured with these sections:

| Section | Location | Purpose |
|---|---|---|
| `request` | Parent step | Defines the parent API request. Time-window properties are configured here. |
| `response` | Parent step | Defines how records are extracted from the parent response. |
| `stepInfo` | Parent step | Enables nested polling and defines the child steps to run next. |
| `stepCollectorConfigs` | Parent step | Defines each child step, including the child request and response handling. |
| `shouldJoinNestedData` | Child step | Defines whether the child response replaces the parent output or is joined to the parent record. |

The nested polling flow works as follows:

1. The parent request runs.
1. The parent response is split into records using `response.eventsJsonPaths`.
1. `stepPlaceholdersParsingKql` extracts placeholder values from each parent record.
1. CCF substitutes the placeholders into the child step configuration.
1. CCF runs the child requests.
1. The child response is either sent as the output row or joined to the parent record, depending on the value of `shouldJoinNestedData`.

## Nested polling configuration skeleton

The following example shows the structure of a nested `RestApiPoller` connector. Standard CCF properties are abbreviated with `...`.

```json
{
  "kind": "RestApiPoller",
  "properties": {
    "connectorDefinitionName": "...",
    "dcrConfig": { },
    "dataType": "...",
    "auth": { },
    "request": {
      "apiEndpoint": "https://api.example.com/incidents",
      "httpMethod": "GET",
      "queryWindowInMin": 60,
      "queryTimeFormat": "yyyy-MM-ddTHH:mm:ssZ",
      "startTimeAttributeName": "startTime",
      "endTimeAttributeName": "endTime"
    },
    "response": {
      "eventsJsonPaths": [ "$.incidents" ],
      "format": "json"
    },
    "stepInfo": {
      "stepType": "Nested",
      "nextSteps": [
        {
          "stepId": "fetchIncidentDetails",
          "stepPlaceholdersParsingKql": "source | project res = parse_json(data) | project incidentId = res.incidentId"
        }
      ]
    },
    "stepCollectorConfigs": {
      "fetchIncidentDetails": {
        "shouldJoinNestedData": false,
        "request": {
          "httpMethod": "GET",
          "apiEndpoint": "https://api.example.com/incidents/$incidentId$/details"
        },
        "response": {
          "eventsJsonPaths": [ "$" ],
          "format": "json"
        }
      }
    }
  }
}
```

## Nested polling properties

| Property | Location | Description |
|---|---|---|
| `stepInfo.stepType` | Parent step | Must be set to `Nested` to enable nested API polling. |
| `stepInfo.nextSteps[].stepId` | Parent step | The child step name. This value must match a key in `stepCollectorConfigs`. |
| `stepInfo.nextSteps[].stepPlaceholdersParsingKql` | Parent step | KQL that extracts values from the parent response. The query runs against `source`, where the `data` column contains each parent record as a raw JSON string. Each projected column becomes a placeholder. |
| `stepCollectorConfigs` | Parent step | A map of child step definitions, keyed by the `stepId` values declared in `stepInfo.nextSteps`. |
| `shouldJoinNestedData` | Child step | Controls how the child response is delivered to the stream. Set to `false` when the child response contains the full output record. Set to `true` when you need fields from both the parent and child responses in the same output row. |
| `joinedDataStepName` | Child step | The name of the `dynamic` column that stores the joined child response when `shouldJoinNestedData` is `true`. Not used when `shouldJoinNestedData` is `false`. |

## Placeholder substitution

Placeholders are extracted by `stepPlaceholdersParsingKql` and referenced with `$placeholderName$` syntax.

For example, this KQL creates a placeholder named `incidentId`:

```kusto
source
| project res = parse_json(data)
| project incidentId = res.incidentId
```

The child step can then reference the placeholder as `$incidentId$`:

```json
"apiEndpoint": "https://api.example.com/incidents/$incidentId$/details"
```

Placeholder substitution is supported across the child step configuration, including the child request `apiEndpoint`, `headers`, `queryParameters`, and `queryParametersTemplate`.

## Configure child request properties

The `request` block inside a child step supports the common request properties used for API polling.

Common child request properties include:

| Property | Description |
|---|---|
| `apiEndpoint` | The child API endpoint. You can include placeholders such as `$incidentId$`. |
| `httpMethod` | The HTTP method for the child request, such as `GET` or `POST`. |
| `headers` | Request headers for the child API call. Placeholder substitution is supported. |
| `queryParameters` | Query string parameters for the child API call. Placeholder substitution is supported. |
| `queryParametersTemplate` | Template used for request body or query payload scenarios. Placeholder substitution is supported. |
| `isPostPayloadJson` | Set to `true` when the POST payload should be sent as JSON. |
| `rateLimitQPS` | The maximum number of requests per second. |
| `rateLimitConfig` | Rate-limit configuration that can use rate-limit headers returned by the API. |
| `retryCount` | Number of retry attempts. Default: `3`. Supported range: `1` to `6`. |
| `timeoutInSeconds` | Request timeout in seconds. Default: `20`. Supported range: `1` to `180`. |

The parent request controls the polling time window. Configure time-window properties such as `queryWindowInMin`, `queryTimeFormat`, `startTimeAttributeName`, and `endTimeAttributeName` on the parent request only. Child steps are usually driven by placeholder values extracted from the parent response.

## Configure child request parallelism

`maxParallelism` controls how many child calls can run concurrently. The default value is `15`.

`maxParallelism` isn't part of the standard parent connector configuration and can't be set on the parent step. Because child steps are passed through without field-name translation, you can set `maxParallelism` inside a child step's `request` block if adjustment is needed.

```json
"stepCollectorConfigs": {
  "fetchIncidentDetails": {
    "shouldJoinNestedData": false,
    "request": {
      "httpMethod": "GET",
      "apiEndpoint": "https://api.contoso.com/incidents/$incidentId$/details",
      "maxParallelism": 15
    },
    "response": {
      "eventsJsonPaths": [ "$" ],
      "format": "json"
    }
  }
}
```

## Choose whether to join parent and child data

Use `shouldJoinNestedData` to control how child responses are delivered to the stream.

### Use `shouldJoinNestedData: false`

Set `shouldJoinNestedData` to `false` when the parent response only provides values required for the child request, and the child response contains the full record you want to ingest.

For example, use `false` when:

- The parent call returns only incident IDs.
- The child call returns the full incident records.
- You don't need to preserve any parent fields in the destination row.

```json
"stepCollectorConfigs": {
  "fetchIncidentDetails": {
    "shouldJoinNestedData": false,
    "request": {
      "httpMethod": "GET",
      "apiEndpoint": "https://api.contoso.com/incidents/$incidentId$/details"
    },
    "response": {
      "eventsJsonPaths": [ "$" ],
      "format": "json"
    }
  }
}
```

### Use `shouldJoinNestedData: true`

Set `shouldJoinNestedData` to `true` when you need fields from both the parent response and the child response in the same destination row.

For example, use `true` when:

- The parent call returns alert fields such as alert ID, severity, and detection time.
- The child call returns enrichment fields such as affected user, source IP, or geolocation.
- The DCR transform needs to map both parent and child fields into the destination table.

When `shouldJoinNestedData` is `true`, set `joinedDataStepName` to the name of the `dynamic` column that stores the child response.

```json
"stepCollectorConfigs": {
  "fetchAlertEnrichment": {
    "shouldJoinNestedData": true,
    "joinedDataStepName": "enrichment",
    "request": {
      "httpMethod": "GET",
      "apiEndpoint": "https://api.contoso.com/alerts/$alertId$/enrichment"
    },
    "response": {
      "eventsJsonPaths": [ "$" ],
      "format": "json"
    }
  }
}
```

## Example: GET child request

This example uses a two-step Contoso incident API:

1. The parent request calls `GET /incidents` and receives a list of incident IDs.
1. `stepPlaceholdersParsingKql` extracts `incidentId` from each parent record.
1. The child request calls `GET /incidents/$incidentId$/details` once per incident ID.
1. The child responses are sent to the stream as flat records.

### Parent response

```json
{
  "incidents": [
    { "incidentId": "INC-001" },
    { "incidentId": "INC-002" },
    { "incidentId": "INC-003" }
  ]
}
```

### Child response

```json
{
  "incidentId": "INC-001",
  "title": "Suspicious login attempt",
  "severity": "High",
  "status": "Active",
  "createdAt": "2026-05-30T14:22:00Z",
  "affectedUser": "alice@contoso.com",
  "sourceIp": "198.51.100.42"
}
```

### Polling configuration

```json
{
  "kind": "RestApiPoller",
  "properties": {
    "connectorDefinitionName": "ContosoIncidentsConnector",
    "dcrConfig": {
      "dataCollectionEndpoint": "{{dataCollectionEndpoint}}",
      "dataCollectionRuleImmutableId": "{{dataCollectionRuleImmutableId}}",
      "streamName": "Custom-ContosoIncidents_CL"
    },
    "dataType": "ContosoIncidents_CL",
    "auth": {
      "type": "APIKey",
      "ApiKey": "{{apiKey}}",
      "ApiKeyName": "x-functions-key"
    },
    "request": {
      "apiEndpoint": "https://api.contoso.com/incidents",
      "httpMethod": "GET",
      "queryWindowInMin": 60,
      "queryTimeFormat": "yyyy-MM-ddTHH:mm:ssZ",
      "startTimeAttributeName": "startTime",
      "endTimeAttributeName": "endTime",
      "headers": {
        "Accept": "application/json"
      }
    },
    "response": {
      "eventsJsonPaths": [ "$.incidents" ],
      "format": "json"
    },
    "stepInfo": {
      "stepType": "Nested",
      "nextSteps": [
        {
          "stepId": "fetchIncidentDetails",
          "stepPlaceholdersParsingKql": "source | project res = parse_json(data) | project incidentId = res.incidentId"
        }
      ]
    },
    "stepCollectorConfigs": {
      "fetchIncidentDetails": {
        "shouldJoinNestedData": false,
        "request": {
          "httpMethod": "GET",
          "apiEndpoint": "https://api.contoso.com/incidents/$incidentId$/details",
          "headers": {
            "Accept": "application/json"
          },
          "retryCount": 3,
          "timeoutInSeconds": 60
        },
        "response": {
          "eventsJsonPaths": [ "$" ],
          "format": "json"
        }
      }
    }
  }
}
```

## Example: POST child request with a JSON body

Some APIs require identifiers from the parent response to be sent in a POST body instead of the URL path or query string. Use `queryParametersTemplate` with `isPostPayloadJson` for this pattern.

In this example, the parent response returns an `incidentId`, and the child request sends that value in a JSON POST body.

```json
"stepCollectorConfigs": {
  "fetchIncidentDetails": {
    "shouldJoinNestedData": false,
    "request": {
      "httpMethod": "POST",
      "apiEndpoint": "https://api.contoso.com/incidents/details:batchGet",
      "headers": {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      "queryParametersTemplate": "{'ids': ['$incidentId$']}",
      "isPostPayloadJson": true,
      "retryCount": 3,
      "timeoutInSeconds": 60
    },
    "response": {
      "eventsJsonPaths": [ "$.items" ],
      "format": "json"
    }
  }
}
```

## Example: Join child enrichment data to the parent record

This example uses a Contoso alert API where the parent response contains fields that should be preserved, and the child response contains enrichment data.

### Parent response

```json
{
  "alerts": [
    {
      "alertId": "ALT-001",
      "severity": "High",
      "detectedAt": "2026-05-30T14:22:00Z",
      "riskScore": 92
    }
  ]
}
```

### Child response

```json
{
  "alertId": "ALT-001",
  "affectedUser": "bob@contoso.com",
  "sourceIp": "198.51.100.77",
  "geolocation": "US/Virginia",
  "relatedIncidentId": "INC-042"
}
```

### Polling configuration

```json
{
  "kind": "RestApiPoller",
  "properties": {
    "connectorDefinitionName": "ContosoAlertsConnector",
    "dcrConfig": {
      "dataCollectionEndpoint": "{{dataCollectionEndpoint}}",
      "dataCollectionRuleImmutableId": "{{dataCollectionRuleImmutableId}}",
      "streamName": "Custom-ContosoAlerts_CL"
    },
    "dataType": "ContosoAlerts_CL",
    "auth": {
      "type": "APIKey",
      "ApiKey": "{{apiKey}}",
      "ApiKeyName": "x-functions-key"
    },
    "request": {
      "apiEndpoint": "https://api.contoso.com/alerts",
      "httpMethod": "GET",
      "queryWindowInMin": 60,
      "queryTimeFormat": "yyyy-MM-ddTHH:mm:ssZ",
      "startTimeAttributeName": "startTime",
      "endTimeAttributeName": "endTime"
    },
    "response": {
      "eventsJsonPaths": [ "$.alerts" ],
      "format": "json"
    },
    "stepInfo": {
      "stepType": "Nested",
      "nextSteps": [
        {
          "stepId": "fetchAlertEnrichment",
          "stepPlaceholdersParsingKql": "source | project res = parse_json(data) | project alertId = res.alertId"
        }
      ]
    },
    "stepCollectorConfigs": {
      "fetchAlertEnrichment": {
        "shouldJoinNestedData": true,
        "joinedDataStepName": "enrichment",
        "request": {
          "httpMethod": "GET",
          "apiEndpoint": "https://api.contoso.com/alerts/$alertId$/enrichment"
        },
        "response": {
          "eventsJsonPaths": [ "$" ],
          "format": "json"
        }
      }
    }
  }
}
```

The DCR transform can then project fields from both the parent record and the joined child response.

For example:

```kusto
source
| extend enrichment = todynamic(enrichment)
| project
    TimeGenerated = todatetime(detectedAt),
    AlertId = tostring(alertId),
    Severity = tostring(severity),
    RiskScore = toint(riskScore),
    AffectedUser = tostring(enrichment.affectedUser),
    SourceIp = tostring(enrichment.sourceIp),
    Geolocation = tostring(enrichment.geolocation),
    RelatedIncidentId = tostring(enrichment.relatedIncidentId)
```

## Child step authentication and paging field names

Field name translation applies to the parent step only. Each entry in `stepCollectorConfigs` is passed through verbatim and isn't remapped. As a result, any `auth` or `paging` block inside a child step must use the child step field names shown in the following tables.

### Auth fields

| Parent step field name | Child step field name |
|---|---|
| `type` | `AuthType` |
| `apiKey` | `APIKey` |
| `apiKeyName` | `APIKeyName` |
| `redirectUri` for OAuth2 | `RedirectionEndpoint` |
| `isCredentialsInHeaders` for OAuth2 or JWT | `IsClientSecretInHeader` |
| `grantType` for OAuth2 | `FlowName` |
| `queryParameters` for JWT | `TokenEndpointQueryParameters` |
| `isJsonRequest` for JWT | `IsTokenEndpointPostPayloadJson` |
| `userName` / `password` key-value pairs for JWT or session auth | `UsernameAttributeName` and `UsernameAttributeValue` / `PasswordAttributeName` and `PasswordAttributeValue` |

For OAuth2, the `FlowName` value is also transformed. For example, use `ClientCredentials` instead of `client_credentials`, and `AuthCode` instead of `authorization_code`.

### Paging fields

| Parent step field name | Child step field name |
|---|---|
| `pageSizeParameterName` | `pageSizeParaName` |

All other paging and response field names are the same for parent and child steps.

## Limits

Nested API polling has the following limits:

| Limit | Description |
|---|---|
| Child steps in `stepCollectorConfigs` | A nested configuration supports up to four entries in `stepCollectorConfigs`. |
| Entries in `stepInfo.nextSteps` | `stepInfo.nextSteps` supports up to three entries. |
| Circular references | Circular step references aren't supported and are rejected during validation. |

## Complete the connector

After you configure the nested `RestApiPoller` connection rules, complete the remaining CCF connector components:

- Create or update the destination table.
- Create the DCR and transformation.
- Create the connector UI definition.
- Package the connector in an ARM deployment template.
- Deploy and test the connector.

For the end-to-end process, see [Create a codeless connector for Microsoft Sentinel](create-codeless-connector.md).

## Related content

- [Create a codeless connector for Microsoft Sentinel](create-codeless-connector.md)
- [RestApiPoller data connector connection rules reference](../data-connector-connection-rules-reference.md)
- [Data connector UI definitions reference](../data-connector-ui-definitions-reference.md)
