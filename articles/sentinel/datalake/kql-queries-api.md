---  
title: Run KQL queries on Microsoft Sentinel data lake using APIs
titleSuffix: Microsoft Security  
description: Learn how to run KQL queries against the Microsoft Sentinel data lake programmatically using REST APIs. Enable automation, intelligent agents, and scalable analytics.
author: EdB-MSFT  
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform  
ms.topic: how-to
ms.date: 03/17/2026
ms.author: edbaynash  
ms.collection: ms-security  
---  

# Run KQL queries on the Microsoft Sentinel data lake using APIs

As security data lakes become the backbone of modern analytics platforms, organizations need flexible programmatic access that enables automation, scale, and seamless integration. While interactive tools and portals support data exploration in the Defender portal, many real-world workflows require API-based query execution.

By running KQL (Kusto Query Language) queries on the Microsoft Sentinel data lake through APIs, you can embed analytics directly into automation workflows, background services, and intelligent agents without relying on manual query execution.

This article explains how to run KQL queries against the Microsoft Sentinel data lake using REST APIs, including authentication requirements, sample code, and key considerations.

## Why run KQL queries via API?

Traditional query experiences, such as dashboards and query editors, are optimized for human interaction. APIs, on the other hand, are optimized for systems.

Running KQL through an API enables:

- **Automation-first analytics** - Embed analytics into automated workflows and playbooks.
- **Repeatable and scheduled insights** - Run queries on a schedule without manual intervention.
- **Integration with external systems and agents** - Connect analytics to external applications, AI agents, and custom tooling.
- **Consistent query execution at scale** - Execute queries consistently across multiple environments.

## Common scenarios

The following scenarios demonstrate where API-based KQL queries add the most value.

### Automated monitoring and alerting

SOC teams often want to continuously analyze data in their lake to detect anomalies, trends, or policy violations.

With API-based KQL execution, you can:

- Run queries as part of automated workflows and playbooks.
- Evaluate query results programmatically.
- Trigger downstream actions such as alerts, tickets, or notifications.

This approach turns KQL into a signal engine, not just an exploration tool.

### Powering intelligent agents

AI agents require programmatic access to data lakes to retrieve timely, relevant context for decision making. Using KQL over an API allows agents to:

- Dynamically query the data lake based on user intent or system context.
- Retrieve aggregated or filtered results on demand.
- Combine analytical results with reasoning and decision logic.

In this model, KQL acts as the analytical retrieval layer, while the agent focuses on orchestration, reasoning, and action.

### Embedding analytics into business workflows

Organizations often want analytics embedded directly into CI/CD and operational pipelines. Instead of exporting data or duplicating logic, you can:

- Run KQL queries inline via API.
- Use results as inputs to other systems.
- Keep analytics logic centralized and consistent.

This approach reduces drift between analytics code and application code.

## Prerequisites

To run KQL queries against the Microsoft Sentinel data lake using APIs, you need:

- **A Microsoft Sentinel workspace onboarded to the data lake.** For more information, see [Onboarding to Microsoft Sentinel data lake](sentinel-lake-onboarding.md).
- **A user token or a service principal.** For more information on creating a service principal, see [Create a Microsoft Entra application and service principal that can access resources](/entra/identity-platform/howto-create-service-principal-portal).
- **Appropriate permissions** to execute queries on the Microsoft Sentinel data lake. Azure RBAC roles such as **Log Analytics Reader** or **Log Analytics Contributor** on the workspace are required.
- **Familiarity with KQL** and API-based query execution patterns. For more information on KQL syntax, see [Kusto Query Language (KQL) overview](/azure/data-explorer/kusto/query/).

## High-level flow

When you run a KQL query via API, the following steps occur:

1. A client authenticates to the Microsoft Sentinel data lake platform.
1. The client submits a KQL query via the REST API.
1. The query executes against data stored in the data lake.
1. Results are returned in a structured, machine-readable format.
1. The client processes or acts on the results.

## Authentication

To authenticate to the Microsoft Sentinel data lake API, you need to acquire a bearer token from Microsoft Entra ID. Use the Microsoft Authentication Library (MSAL) to acquire either a v1.0 or v2.0 access token. For more information on acquiring access tokens, see [Acquire and cache tokens with Microsoft Authentication Library](/entra/identity-platform/msal-acquire-cache-tokens).

### Create a service principal

If you're using a service principal for authentication, you need to register an application in Microsoft Entra ID:

1. Register the application with Microsoft Entra ID and create a service principal. For more information, see [Create a Microsoft Entra application and service principal that can access resources](/entra/identity-platform/howto-create-service-principal-portal).

1. Save the following values from your app registration:
   - **Tenant ID** - Your Microsoft Entra tenant ID.
   - **Client ID** - The application (client) ID of your registered application.
   - **Client secret** - The secret created for your application.

1. Assign the appropriate Azure RBAC role to the service principal to query the Microsoft Sentinel data lake. For more information, see [Assign Azure roles using the Azure portal](/azure/role-based-access-control/role-assignments-portal).

### Acquire an access token

Use MSAL to acquire an access token for the Sentinel data lake API. The scope for the data lake API is `4500ebfb-89b6-4b14-a480-7f749797bfcd/.default`.

For more information on acquiring tokens using MSAL, see [Microsoft Authentication Library (MSAL) overview](/entra/identity-platform/msal-overview).

## Run a KQL query using Python

The following Python example demonstrates how to authenticate using a service principal and execute a KQL query on the Sentinel data lake using the REST API.

```python
import requests
import msal

# Service principal / Entra app settings
TENANT_ID = "<your-tenant-id>"
CLIENT_ID = "<your-client-id>"
CLIENT_SECRET = "<your-client-secret>"

# Token authority
AUTHORITY = f"https://login.microsoftonline.com/{TENANT_ID}"

# API scope for Sentinel data lake
SCOPE = ["4500ebfb-89b6-4b14-a480-7f749797bfcd/.default"]

# KQL query payload
KQL_QUERY = {
    "csl": "SigninLogs | take 10",
    "db": "<workspace-name>-<workspace-id>",
    "properties": {
        "Options": {
            "servertimeout": "00:04:00",
            "queryconsistency": "strongconsistency",
            "query_language": "kql",
            "request_readonly": False,
            "request_readonly_hardline": False
        }
    }
}

# Acquire token using client credentials
app = msal.ConfidentialClientApplication(
    client_id=CLIENT_ID,
    authority=AUTHORITY,
    client_credential=CLIENT_SECRET
)

result = app.acquire_token_for_client(scopes=SCOPE)

if "access_token" not in result:
    raise RuntimeError(
        f"Token acquisition failed: {result.get('error')} - {result.get('error_description')}"
    )

access_token = result["access_token"]

# Call the KQL API
headers = {
    "Authorization": f"Bearer {access_token}",
    "Content-Type": "application/json"
}

url = "https://api.securityplatform.microsoft.com/lake/kql/v2/rest/query"
response = requests.post(url, headers=headers, json=KQL_QUERY)

if response.status_code == 200:
    print("Query Results:")
    print(response.json())
else:
    print(f"Error {response.status_code}: {response.text}")
```

Replace the following placeholders:

| Placeholder | Description |
|---|---|
| `<your-tenant-id>` | Your Microsoft Entra tenant ID. |
| `<your-client-id>` | The application (client) ID from your app registration. |
| `<your-client-secret>` | The client secret from your app registration. |
| `<workspace-name>-<workspace-id>` | Your workspace name and ID in the format `workspace1-12345678-abcd-abcd-1234-1234567890ab`. |

## Run a KQL query using an HTTP client

You can call the API directly using any HTTP client. The following example shows the REST API request format.

### Request

```http
POST https://api.securityplatform.microsoft.com/lake/kql/v2/rest/query
Authorization: Bearer <access_token>
Content-Type: application/json

{
    "db": "default",
    "csl": "EntraUsers | take 10"
}
```

### Request parameters

| Parameter | Value |
|---|---|
| **Request URI** | `https://api.securityplatform.microsoft.com/lake/kql/v2/rest/query` |
| **Method** | POST |
| **Authorization header** | `Bearer <access_token>` |
| **Content-Type** | `application/json` |

### Request payload

| Property | Description |
|---|---|
| `db` | The database identifier. Use `default` for the default workspace, or specify the workspace in the format `<workspace-name>-<workspace-id>`. |
| `csl` | The KQL query to execute. |
| `properties` | Optional. Query execution properties such as timeout and consistency settings. |

### Payload examples

**Query using default workspace:**

```json
{
    "db": "default",
    "csl": "EntraUsers | take 10"
}
```

**Query using a specific workspace:**

```json
{
    "csl": "SigninLogs | take 10",
    "db": "workspace1-12345678-abcd-abcd-1234-1234567890ab"
}
```

**Query with optional properties:**

```json
{
    "csl": "SigninLogs | take 10",
    "db": "workspace1-12345678-abcd-abcd-1234-1234567890ab",
    "properties": {
        "Options": {
            "servertimeout": "00:04:00",
            "queryconsistency": "strongconsistency",
            "query_language": "kql"
        }
    }
}
```

## Considerations and limitations

Consider the following points when planning to execute KQL queries on the data lake via API.

### Service principal permissions

When using a service principal, Azure RBAC roles can be assigned at the Sentinel workspace level. Entra ID roles or XDR unified RBAC roles aren't supported for this scenario. Alternatively, use user tokens with Entra ID roles.

### Latency and cost considerations

The data lake is optimized for cost-effective storage, and queries might be slower than queries executed in the analytics tier. Design frequent or automated queries carefully, considering the query and concurrency limits.

### Result size limits

Queries are subject to limits on execution time and response size. Review the [Microsoft Sentinel data lake service limits](sentinel-lake-service-limits.md) when designing your workflows.

### Query limits

For information on query execution limits, concurrency, and timeout values, see [Microsoft Sentinel data lake service limits](sentinel-lake-service-limits.md).

## Related content

- [Run KQL queries on the Microsoft Sentinel data lake](kql-queries.md)
- [Microsoft Sentinel data lake overview](sentinel-lake-overview.md)
- [Onboarding to Microsoft Sentinel data lake](sentinel-lake-onboarding.md)
- [Microsoft Sentinel data lake service limits](sentinel-lake-service-limits.md)
- [Create a Microsoft Entra application and service principal that can access resources](/entra/identity-platform/howto-create-service-principal-portal)
- [Microsoft Authentication Library (MSAL) overview](/entra/identity-platform/msal-overview)
- [Acquire and cache tokens with Microsoft Authentication Library](/entra/identity-platform/msal-acquire-cache-tokens)
