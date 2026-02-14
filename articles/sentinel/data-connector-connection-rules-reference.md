---
title: RestApiPoller data connector reference for the Codeless Connector Framework
titleSuffix: Microsoft Sentinel
description: This article provides reference JSON fields and properties to create the RestApiPoller data connector type and its data connection rules for the Codeless Connector Framework.
services: sentinel
author: EdB-MSFT
ms.topic: reference
ms.date: 9/30/2024
ms.author: edbaynash

#Customer intent: As a security engineer, I want to reference paging, authentication and payload options to create and configure RestApiPoller data connectors using the Codeless Connector Framework so that I can integrate a specific data source into Microsoft Sentinel without writing custom code.

---

# RestApiPoller data connector reference for the Codeless Connector Framework

You can create a `RestApiPoller` data connector with the Codeless Connector Framework (CCF) by using this article as a supplement to the [Microsoft Sentinel REST API for data connectors](/rest/api/securityinsights/data-connectors) docs.

Each data connector represents a specific *connection* of a Microsoft Sentinel data connector. One data connector might have multiple connections, which fetch data from different endpoints. You can complete the deployment template for the CCF data connector by using the JSON configuration that you build with this article.

For more information, see [Create a codeless connector for Microsoft Sentinel](create-codeless-connector.md#create-the-deployment-template).

## Create or update data connectors

Find the latest stable or preview API version by referencing the [`create` or `update`](/rest/api/securityinsights/data-connectors/create-or-update) operations in the REST API docs. The difference between the `create` and `update` operations is that `update` requires the `etag` value.

**PUT** method:

```http
https://management.azure.com/subscriptions/{{subscriptionId}}/resourceGroups/{{resourceGroupName}}/providers/Microsoft.OperationalInsights/workspaces/{{workspaceName}}/providers/Microsoft.SecurityInsights/dataConnectors/{{dataConnectorId}}?api-version={{apiVersion}}
```

## URI parameters

For more information about the latest API version, see [Data connectors: create or update URI parameters](/rest/api/securityinsights/data-connectors/create-or-update#uri-parameters).

|Name  | Description  |
|---------|---------|
| `dataConnectorId` | The data connector ID must be a unique name. It's same as the `name` parameter in the [request body](#request-body).|
| `resourceGroupName` | The name of the resource group, not case sensitive.  |
| `subscriptionId` | The ID of the target subscription. |
| `workspaceName` | The *name* of the workspace, not the ID.<br>Regex pattern: `^[A-Za-z0-9][A-Za-z0-9-]+[A-Za-z0-9]$` |
| `api-version` | The API version to use for this operation. |

## Request body

The request body for a `RestApiPoller` CCF data connector has the following structure:

```json
{
   "name": "{{dataConnectorId}}",
   "kind": "RestApiPoller",
   "etag": "",
   "properties": {
        "connectorDefinitionName": "",
        "auth": {},
        "request": {},
        "response": {},
        "paging": "",
        "dcrConfig": ""
   }
}

```

### RestApiPoller

`RestApiPoller` is an API Poller CCF data connector that you can use to customize paging, authorization, and request/response payloads for your data source.

| Name | Required | Type | Description |
| ---- | ---- | ---- | ---- |
| `name` | True | string | The unique name of the connection that matches the URI parameter. |
| `kind` | True | string | Must be `RestApiPoller`. |
| `etag` |  | GUID | Leave empty for new connector creation. For update operations, `etag` must match the existing connector `etag` (GUID). |
| `properties.connectorDefinitionName` |  | string | The name of the `DataConnectorDefinition` resource that defines the UI configuration of the data connector. For more information, see [Data Connector Definition](create-codeless-connector.md#data-connector-user-interface). |
| properties.**auth**	| True | Nested JSON | Describes the authentication properties for polling the data. For more information, see [authentication configuration](#authentication-configuration). |
| properties.**request** | True | Nested JSON | Describes the request payload for polling the data, such as the API endpoint. For more information, see [request configuration](#request-configuration). |
| properties.**response** | True | Nested JSON | Describes the response object and nested message the API returns when it polls the data. For more information, see [response configuration](#response-configuration). |
| properties.**paging** |  | Nested JSON | Describes the pagination payload when polling the data. For more information, see [paging configuration](#paging-configuration). |
| properties.**dcrConfig** |  | Nested JSON | Required parameters when the data is sent to a Data Collection Rule (DCR). For more information, see [DCR configuration](#dcr-configuration). |

## Authentication configuration

The CCF supports the following authentication types:

- [Basic](#basic-auth)
- [APIKey](#apikey)
- [OAuth2](#oauth2)
- [JWT](#jwt)

> [!NOTE]
> CCF OAuth2 implementation doesn't support client certificate credentials.

As a best practice, use parameters in the auth section instead of hard-coding credentials. For more information, see [Secure confidential input](create-codeless-connector.md#secure-confidential-input).

To create the deployment template, which also uses parameters, you need to escape the parameters in this section with an extra starting `[`. This step allows the parameters to assign a value based on the user interaction with the connector. For more information, see [Template expressions escape characters](../azure-resource-manager/templates/template-expressions.md#escape-characters).

To enable the credentials to be entered from the UI, the `connectorUIConfig` section requires you enter the desired parameters in `instructions`. For more information, see [Data connector definitions reference for the Codeless Connector Framework](data-connector-ui-definitions-reference.md#instructions).

#### Basic auth

| Field | Required | Type |
| ---- | ---- | ---- |
| `UserName` | True | string |
| `Password` | True | string |

Example basic auth using parameters defined in `connectorUIconfig`:

```json
"auth": {
    "type": "Basic",
    "UserName": "[[parameters('username')]",
    "Password": "[[parameters('password')]"
}
```

#### API key

| Field | Required | Type | Description | Default value |
| ---- | ---- | ---- | ---- | ---- |
| `ApiKey` | True | string | User secret key | |
| `ApiKeyName` | | string | Name of the URI header that contains the `ApiKey` value. | `Authorization` | 
| `ApiKeyIdentifier` | | string | String value to prepend the token. | `token` |
| `IsApiKeyInPostPayload` | | boolean | Send secret in `POST` body instead of header. | `false` |

`APIKey` auth examples:

```json
"auth": {
    "type": "APIKey",
    "ApiKey": "[[parameters('apikey')]",
    "ApiKeyName": "X-MyApp-Auth-Header",
    "ApiKeyIdentifier": "Bearer"
}
```

The result of this example is the secret defined from the user input sent in the following header: `X-MyApp-Auth-Header`: `Bearer apikey`.

```json
"auth": { 
    "type": "APIKey",
    "ApiKey": "123123123",
}
```

This example uses the default values and results in the following header: Authorization: `token 123123123`.

```json
"auth": { 
    "type": "APIKey",
    "ApiKey": "123123123",
    "ApiKeyName": ""
}
```

Since `ApiKeyName` is explicitly set to `""`, the result is the following header: Authorization: `123123123`.

#### OAuth2

The Codeless Connector Framework supports OAuth 2.0 authorization code grant and client credentials. The **Authorization Code** grant type is used by confidential and public clients to exchange an authorization code for an access token.

After the user returns to the client via the redirect URL, the application will get the authorization code from the URL and use it to request an access token.

|Field | Required | Type | Description |
| ---- | ---- | ---- | ---- | 
| `ClientId` | True	| String | The client ID |
| `ClientSecret`	| True | String | The client secret |
| `AuthorizationCode` | True when grantType = `authorization_code` |	String | If the grant type is `authorization_code` this field value is the authorization code returned from the auth serve. |
| `Scope` | True for `authorization_code` grant type<br> optional for `client_credentials` grant type| String | A space-separated list of scopes for user consent. For more information, see [OAuth2 scopes and permissions](/entra/identity-platform/scopes-oidc). |
| `RedirectUri` | True when grantType = `authorization_code` | String | URL for redirect must be `https://portal.azure.com/TokenAuthorize/ExtensionName/Microsoft_Azure_Security_Insights`. |
| `GrantType` | True | String | `authorization_code` or `client_credentials` |
| `TokenEndpoint` | True | String | URL to exchange code with valid token in `authorization_code` grant or client ID and secret with valid token in `client_credentials` grant. |
| `TokenEndpointHeaders` |  | Object | An optional key/value object to send custom headers to token server. |
| `TokenEndpointQueryParameters` |  | Object | An optional key/value object to send custom query params to token server. |
| `AuthorizationEndpoint`	| True | String | URL for user consent for `authorization_code` flow. |
| `AuthorizationEndpointHeaders` |	 | Object | An optional key/value object to send custom headers to auth server. |
| `AuthorizationEndpointQueryParameters`	|  | Object | An optional key/value pair used in OAuth2 authorization code flow request. |

Auth code flow is for fetching data on behalf of a user's permissions and client credentials is for fetching data with application permissions. The data server grants access to the application. Since there's no user in client credentials flow, no authorization endpoint is needed, only a token endpoint.

Example:
OAuth2 `authorization_code` grant type

```json
"auth": {
    "type": "OAuth2",
    "ClientId": "[[parameters('appId')]",
    "ClientSecret": "[[parameters('appSecret')]",
    "tokenEndpoint": "https://login.microsoftonline.com/{{tenantId}}/oauth2/v2.0/token",
    "authorizationEndpoint": "https://login.microsoftonline.com/{{tenantId}}/oauth2/v2.0/authorize",
    "authorizationEndpointHeaders": {},
    "authorizationEndpointQueryParameters": {
        "prompt": "consent"
    },
    "redirectUri": "https://portal.azure.com/TokenAuthorize/ExtensionName/Microsoft_Azure_Security_Insights",
    "tokenEndpointHeaders": {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
    },
    "TokenEndpointQueryParameters": {},
    "scope": "openid offline_access some_scope",
    "grantType": "authorization_code"
}
```

Example:
OAuth2 `client_credentials` grant type

```json
"auth": {
    "type": "OAuth2",
    "ClientId": "[[parameters('appId')]",
    "ClientSecret": "[[parameters('appSecret')]",
    "tokenEndpoint": "https://login.microsoftonline.com/{{tenantId}}/oauth2/v2.0/token",
    "tokenEndpointHeaders": {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
    },
    "TokenEndpointQueryParameters": {},
    "scope": "openid offline_access some_scope",
    "grantType": "client_credentials"
}
```

#### JWT

JSON Web Token (JWT) authentication supports obtaining tokens via username and password credentials and using them for API requests.

##### Basic Example

```json
"auth": {
    "type": "JwtToken",
    "userName": {
        "key": "username",
        "value": "[[parameters('UserName')]"
    },
    "password": {
        "key": "password", 
        "value": "[[parameters('Password')]"
    },
    "TokenEndpoint": "https://token_endpoint.contoso.com",
    "IsJsonRequest": true,
    "JwtTokenJsonPath": "$.access_token"
}
```

##### Credentials in POST body (default)

```json
"auth": {
    "type": "JwtToken",
    "userName": {
        "key": "username",
        "value": "[[parameters('UserName')]"
    },
    "password": {
        "key": "password",
        "value": "[[parameters('Password')]"
    },
    "TokenEndpoint": "https://api.example.com/token",
    "Headers": {
        "Accept": "application/json",
        "Content-Type": "application/json"
    },
    "IsCredentialsInHeaders": false,
    "IsJsonRequest": true,
    "JwtTokenJsonPath": "$.access_token"
}
```

##### Credentials in headers (basic auth)

```json
"auth": {
    "type": "JwtToken",
    "userName": {
        "key": "client_id",
        "value": "[[parameters('ClientId')]"
    },
    "password": {
        "key": "client_secret",
        "value": "[[parameters('ClientSecret')]"
    },
    "TokenEndpoint": "https://api.example.com/oauth/token",
    "Headers": {
        "Accept": "application/json"
    },
    "IsCredentialsInHeaders": true,
    "IsJsonRequest": true,
    "JwtTokenJsonPath": "$.access_token",
    "RequestTimeoutInSeconds": 30
}
```

##### Credentials in headers (user token)

```json
"auth": {
    "type": "JwtToken",
    "UserToken": "[[parameters('userToken')]",
    "UserTokenPrepend": "Bearer",
    "TokenEndpoint": "https://api.example.com/oauth/token",
    "Headers": {
        "Accept": "application/json"
    },
    "TokenEndpointHttpMethod": "GET",
    "NoAccessTokenPrepend": true,
    "JwtTokenJsonPath": "$.systemToken"
}
```

Authentication flow:

1. Send credentials to `TokenEndpoint` to obtain JWT token.

   - If `IsCredentialsInHeaders: true`: Sends Basic Auth header with `username:password`.
   - If `IsCredentialsInHeaders: false`: Sends credentials in POST body.

2. Extract token by using `JwtTokenJsonPath` or from response header.

3. Use token in subsequent API requests with the `ApiKeyName` header.

**Properties:**

|Field |Required |Type |Description	|
| ---- | ---- | ---- | ---- |
| `type`                      | True      | String   | Must be `JwtToken` |
| `userName`                  | True (if `userToken` isn't used)      | Object   | Key/value pair for username credential. If `userName` and `password` are sent in header request, specify the `value` property with the username. If `userName` and `password` sent in body request, specify `Key` and `Value`. |
| `password`                  | True (if `userToken` isn't used)     | Object   | Key/value pair for password credential. If `userName` and `password` are sent in header request, specify the `value` property with the username. If `userName` and `password` sent in body request, specify `Key` and `Value`. |
| `userToken`                  | True (if `userName` isn't used)     | String   | User token generated by the client to get system token for authentication. |
| `UserTokenPrepend`                  | False     | String   | Prepend text before the token. Example: `Bearer`. |
| `NoAccessTokenPrepend`                  | False     | Boolean   | Access flag to indicate token shouldn't prepend anything. |
| `TokenEndpointHttpMethod`                  | False     | String   | HTTP method to token endpoint. Can be `Get` or `Post`. Default: `Post`. |
| `TokenEndpoint`             | True      | String   | URL endpoint to obtain the JWT token. |
| `IsCredentialsInHeaders`    |           | Boolean  | Send credentials as Basic Auth header (`true`) vs POST body (`false`). Default: `false`. |
| `IsJsonRequest`             |           | Boolean  | Send request as JSON (header `Content-Type = application/json`) vs form-encoded (header `Content-Type = application/x-www-form-urlencoded`). Default: `false`. |
| `JwtTokenJsonPath`          |           | String   | JSONPath to extract the token from response (like "`$.access_token`"). |
| `JwtTokenInResponseHeader`  |           | Boolean  | Extract token from the response header vs body. Default: `false`. |
| `JwtTokenHeaderName`.        |           | String   | Header name when token is in the response header. Default: "`Authorization`" |
| `JwtTokenIdentifier`        |           | String   | Identifier used to extract the JWT from a prefixed token string. |
| `QueryParameters`           |           | Object   | Custom query parameters to include when sending the request to the token endpoint. |
| `Headers`                   |           | Object   | Custom headers to include when sending the request to the token endpoint. |
| `RequestTimeoutInSeconds`   |           | Integer  | Request timeout in seconds. Default: `100`, Max `180`. |

Authentication Flow:

1. Send credentials to `TokenEndpoint` to obtain JWT token

   - If `IsCredentialsInHeaders: true`: Sends Basic Auth header with `username:password`.
   - If `IsCredentialsInHeaders: false`: Sends credentials in POST body.

2. Extract token using `JwtTokenJsonPath` or from response header.

3. Use token in subsequent API requests with `ApiKeyName` header.

> [!NOTE]
> Limitations
>
> - Requires username and password authentication for token acquisition.
> - Doesn't support API key-based token requests.
> - Custom header authentication (without username and password) isn't supported.

## Request configuration

The request section defines how the CCF data connector sends requests to your data source (for example, the API endpoint and how often to poll that endpoint).

|Field |Required |Type |Description	|
| ---- | ---- | ---- | ---- |
| `ApiEndpoint` | True | String | URL for remote server. Defines the endpoint from which to pull data. |
| `RateLimitQPS` |  | Integer | Defines the number of calls or queries allowed in a second. |
| `RateLimitConfig` |  | Object | Defines the rate-limit configuration for the RESTful API. See [example](#ratelimitconfig-example). |
| `QueryWindowInMin` |  | Integer | Defines the available query window in minutes. Minimum is 1 minute. The default is 5 minutes.|
| `HttpMethod` |  | String | Defines the API method: `GET`(default) or `POST` |
| `QueryTimeFormat` |  | String | Defines the date and time format the endpoint (remote server) expects. The CCF uses the current date and time wherever this variable is used. Possible values are the constants: `UnixTimestamp`, `UnixTimestampInMills`, or any other valid representation of date and time, for example: `yyyy-MM-dd`, `MM/dd/yyyy HH:mm:ss`.<br> The default is `ISO 8601 UTC`. |
| `RetryCount` |  | Integer (1...6) | Defines that values of `1` to `6` retries are allowed to recover from a failure. The default value is `3`. |
| `TimeoutInSeconds` |  | Integer (1...180) | Defines the request timeout in seconds. The default value is `20`. |
| `IsPostPayloadJson` |  | Boolean | Determines whether the POST payload is in JSON format. The default value is `false`. |
| `Headers` |  | Object | Key/value pairs that define the request headers. |
| `QueryParameters` |  | Object | Key/value pairs that define the request query parameters. |
| `StartTimeAttributeName` | True when the `EndTimeAttributeName` value is set. | String | Defines the query parameter name for query start time. See [example](#starttimeattributename-example). |
| `EndTimeAttributeName` | True when `StartTimeAttributeName` is set. | String | Defines the query parameter name for query end time. |
| `QueryTimeIntervalAttributeName` |  | String | If the endpoint requires a specialized format for querying the data on a timeframe, use this property with the `QueryTimeIntervalPrepend` and the `QueryTimeIntervalDelimiter` parameters. See [example](#querytimeintervalattributename-example). |
| `QueryTimeIntervalPrepend` | True when `QueryTimeIntervalAttributeName` is set. | String | See `QueryTimeIntervalAttributeName`. |
| `QueryTimeIntervalDelimiter` |  True when `QueryTimeIntervalAttributeName` is set. | String | See `QueryTimeIntervalAttributeName`. |
| `QueryParametersTemplate` |  | String | Query template to use when passing parameters in advanced scenarios.<br>br>For example: `"queryParametersTemplate": "{'cid': 1234567, 'cmd': 'reporting', 'format': 'siem', 'data': { 'from': '{_QueryWindowStartTime}', 'to': '{_QueryWindowEndTime}'}, '{_APIKeyName}': '{_APIKey}'}"`. |

When the API requires complex parameters, use the `queryParameters` or `queryParametersTemplate`, which include some built-in variables.

| Built-in variable | For use in `queryParameters` | For use in `queryParametersTemplate` |
| ---- | ---- | ---- |
| `_QueryWindowStartTime` | yes | yes |
| `_QueryWindowEndTime` | yes | yes |
| `_APIKeyName` | no | yes |
| `_APIKey` | no | yes |

### StartTimeAttributeName example

Consider this example:

- `StartTimeAttributeName` = `from`
- `EndTimeAttributeName` = `until`
- `ApiEndpoint` = `https://www.example.com`

The query sent to the remote server is: `https://www.example.com?from={QueryTimeFormat}&until={QueryTimeFormat + QueryWindowInMin}`

### QueryTimeIntervalAttributeName example

Consider this example:

- `QueryTimeIntervalAttributeName` = `interval`
- `QueryTimeIntervalPrepend` = `time:`
- `QueryTimeIntervalDelimiter` = `..`
- `ApiEndpoint` = `https://www.example.com`

The query sent to the remote server is: `https://www.example.com?interval=time:{QueryTimeFormat}..{QueryTimeFormat + QueryWindowInMin}`

### RateLimitConfig example

Consider this example:

- `ApiEndpoint` = `https://www.example.com`

```json
"rateLimitConfig": {
  "evaluation": {
    "checkMode": "OnlyWhen429"
  },
  "extraction": {
    "source": "CustomHeaders",
    "headers": {
      "limit": {
        "name": "X-RateLimit-Limit",
        "format": "Integer"
      },
      "remaining": {
        "name": "X-RateLimit-Remaining",
        "format": "Integer"
      },
      "reset": {
        "name": "X-RateLimit-RetryAfter",
        "format": "UnixTimeSeconds"
      }
    }
  },
  "retryStrategy": {
    "useResetOrRetryAfterHeaders": true
  }
}
```

When the response includes rate limit headers, the connector can use this information to adjust its request rate.

### Request examples that use Microsoft Graph as data source API

This example queries messages with a filter query parameter. For more information, see [Microsoft Graph API query parameters](/graph/use-the-api#query-parameters).

```json
"request": {
  "apiEndpoint": "https://graph.microsoft.com/v1.0/me/messages",
  "httpMethod": "Get",
  "queryTimeFormat": "yyyy-MM-ddTHH:mm:ssZ",
  "queryWindowInMin": 10,
  "retryCount": 3,
  "rateLimitQPS": 20,
  "headers": {
    "Accept": "application/json",
    "User-Agent": "Example-app-agent"
  },
  "QueryTimeIntervalAttributeName": "filter",
  "QueryTimeIntervalPrepend": "receivedDateTime gt ",
  "QueryTimeIntervalDelimiter": " and receivedDateTime lt "
}
```

The previous example sends a `GET` request to `https://graph.microsoft.com/v1.0/me/messages?filter=receivedDateTime gt {time of request} and receivedDateTime lt 2019-09-01T17:00:00.0000000`. The timestamp updates for each `queryWindowInMin` time.

You achieve the same results with this example:

```json
"request": {
  "apiEndpoint": "https://graph.microsoft.com/v1.0/me/messages",
  "httpMethod": "Get",
  "queryTimeFormat": "yyyy-MM-ddTHH:mm:ssZ",
  "queryWindowInMin": 10,
  "retryCount": 3,
  "rateLimitQPS": 20,
  "headers": {
    "Accept": "application/json",
  },
  "queryParameters": {
    "filter": "receivedDateTime gt {_QueryWindowStartTime} and receivedDateTime lt {_QueryWindowEndTime}"
  }
}
```

Another option is when the data source expects two query parameters, one for start time and one for end time.

Example:

```json
"request": {
  "apiEndpoint": "https://graph.microsoft.com/v1.0/me/calendarView",
  "httpMethod": "Get",
  "queryTimeFormat": "yyyy-MM-ddTHH:mm:ssZ",
  "queryWindowInMin": 10,
  "retryCount": 3,
  "rateLimitQPS": 20,
  "headers": {
    "Accept": "application/json",
  },
  "StartTimeAttributeName": "startDateTime",
  "EndTimeAttributeName": "endDateTime",
}
```

This option sends a `GET` request to `https://graph.microsoft.com/me/calendarView?startDateTime=2019-09-01T09:00:00.0000000&endDateTime=2019-09-01T17:00:00.0000000`.

For complex queries, use `QueryParametersTemplate`. This example sends a `POST` request with parameters in the body:

```json
"request": {
  "apiEndpoint": "https://graph.microsoft.com/v1.0/me/messages",
  "httpMethod": "POST",
  "queryTimeFormat": "yyyy-MM-ddTHH:mm:ssZ",
  "queryWindowInMin": 10,
  "retryCount": 3,
  "rateLimitQPS": 20,
  "headers": {
    "Accept": "application/json",
  },
  "isPostPayloadJson": true,
  "queryParametersTemplate": "{\"query":"TableName | where createdTimestamp between (datetime({_QueryWindowStartTime}) .. datetime({_QueryWindowEndTime}))\"}"
}
```

## Response configuration

Define how your data connector handles responses with the following parameters:

| Field | Required | Type | Description |
|----|----|----|----|
| `EventsJsonPaths` | True | List of strings | Defines the path to the message in the response JSON. A JSON path expression specifies a path to an element, or a set of elements, in a JSON structure. |
| `SuccessStatusJsonPath` |  | String | Defines the path to the success message in the response JSON. When this parameter is defined, the `SuccessStatusValue` parameter should also be defined. |
| `SuccessStatusValue` |  | String | Defines the path to the success message value in the response JSON. |
| `IsGzipCompressed` |  | Boolean | Determines whether the response is compressed in a GZIP file.	|
| `format` | True | String | `json`, `csv`, or `xml` |
| `CompressionAlgo` |  | String | The compressions algorithm, either `multi-gzip` or `deflate`. For the GZIP compression algorithm, just configure `IsGzipCompressed` to `True` instead of setting a value for this parameter. |
| `CsvDelimiter` |  | String | If the response format is CSV and you want to change the default CSV delimiter of `","`. |
| `HasCsvBoundary` |  | Boolean | Indicates if the CSV data has a boundary. |
| `HasCsvHeader` |  | Boolean | Indicates if the CSV data has a header. The default is `True`. |
| `CsvEscape` |  | String | Escape character for a field boundary. The default is `"`<br><br>For example, a CSV with headers `id,name,avg` and a row of data containing spaces like `1,"my name",5.5` requires the `"` field boundary. |
| `ConvertChildPropertiesToArray` |  | Boolean | Special case in which the remote server returns an object instead of a list of events where each property has data in it. |

> [!NOTE]
> CSV format type is parsed by the [`RFC4180`](https://www.rfc-editor.org/rfc/rfc4180) specification.

### Response configuration examples

A server response in JSON format is expected, with the requested data in the property *value*. The response property *status* indicates to ingest the data only if the value is `success`.

```json
"response": {
  "EventsJsonPaths ": ["$.value"],
  "format": "json",
  "SuccessStatusJsonPath": "$.status",
  "SuccessStatusValue": "success",
  "IsGzipCompressed": true
 }
```

The expected response in this example prepares for a CSV with no header.

```json
"response": {
  "EventsJsonPaths ": ["$"],
  "format": "csv",
  "HasCsvHeader": false
 }
```

## Paging configuration

When the data source can't send the entire response payload all at once, the CCF data connector needs to know how to receive portions of the data in response *pages*. The paging types to choose from are:

| Paging type | Decision factor |
|----|----|
| <ul><li>[`LinkHeader`](#configure-linkheader-or-persistentlinkheader)</li><li>[`PersistentLinkHeader`](#configure-linkheader-or-persistentlinkheader)</li><li>[`NextPageUrl`](#configure-nextpageurl)</li></ul> | Does the API response have links to the next and previous pages? |
| <ul><li>[`NextPageToken`](#configure-nextpagetoken-or-persistenttoken)</li><li>[`PersistentToken`](#configure-nextpagetoken-or-persistenttoken)</li> | Does the API response have a token or cursor for the next and previous pages? |
| <ul><li>[`Offset`](#configure-offset)</li></ul> | Does the API response support a parameter for the number of objects to skip when paging? |
| <ul><li>[`CountBasedPaging`](#configure-countbasedpaging)</li></ul> | Does the API response support a parameter for the number of objects to return? |

#### Configure LinkHeader or PersistentLinkHeader

The most common paging type is when a server data source API provides URLs to the next and previous pages of data. For more information on the *Link Header* specification, see [`RFC 5988`](https://www.rfc-editor.org/rfc/rfc5988#section-5).

`LinkHeader` paging means the API response includes either:

- The `Link` HTTP response header.
- A JSON path to retrieve the link from the response body.

`PersistentLinkHeader`-type paging has the same properties as `LinkHeader`, except the link header persists in backend storage. This option enables paging links across query windows. For example, some APIs don't support query start times or end times. Instead, they support a server side *cursor*. You can use persistent page types to remember the server side *cursor*. For more information, see [What is a cursor?](/office/client-developer/access/desktop-database-reference/what-is-a-cursor).

> [!NOTE]
> Only one query for the connector can run with `PersistentLinkHeader` to avoid race conditions on the server side *cursor*. This issue might affect latency.

| Field | Required | Type | Description |
|----|----|----|----|
| `LinkHeaderTokenJsonPath` | False | String | Use this property to indicate where to get the value in the response body.<br><br>For example, if the data source returns the following JSON: `{ nextPage: "foo", value: [{data}]}`, the `LinkHeaderTokenJsonPath` value is `$.nextPage`. |
| `PageSize` | False | Integer | Number of events per page. |
| `PageSizeParameterName` | False | String | Query parameter name for the page size. |
| `PagingInfoPlacement` | False | String | How paging info is populated. Accepts either `QueryString` or `RequestBody`. |
| `PagingQueryParamOnly` | False | Boolean | If set to true, it omits all other query parameters except paging query parameters. |

Here are some examples:

```json
"paging": {
  "pagingType": "LinkHeader",
  "linkHeaderTokenJsonPath" : "$.metadata.links.next"
}
```

```json
"paging": {
 "pagingType" : "PersistentLinkHeader", 
 "pageSizeParameterName" : "limit", 
 "pageSize" : 500 
}
```

#### Configure NextPageUrl

`NextPageUrl`-type paging means the API response includes a complex link in the response body similar to `LinkHeader`, but the URL is included in the response body instead of the header.

| Field | Required | Type | Description |
|----|----|----|----|
| `PageSize` | False | Integer | Number of events per page. |
| `PageSizeParameterName` | False | String | Query parameter name for the page size. |
| `NextPageUrl` | False | String | Only if the connector is for the Coralogix API. |
| `NextPageUrlQueryParameters` | False | Object key/value pairs that add a custom query parameter to each request for the next page. |
| `NextPageParaName` | False | String | Determines the next page name in the request. |
| `HasNextFlagJsonPath` | False | String | Defines the path to the `HasNextPage` flag attribute. |
| `NextPageRequestHeader` | False | String | Determines the next page header name in the request. |
| `NextPageUrlQueryParametersTemplate` | False | String | Only if the connector is for the Coralogix API. |
| `PagingInfoPlacement` | False | String | How paging info is populated. Accepts either `QueryString` or `RequestBody`. |
| `PagingQueryParamOnly` | False | Boolean | If set to true, it omits all other query parameters except paging query parameters. |

Example:

```json
"paging": {
 "pagingType" : "NextPageUrl", 
  "nextPageTokenJsonPath" : "$.data.repository.pageInfo.endCursor", 
  "hasNextFlagJsonPath" : "$.data.repository.pageInfo.hasNextPage", 
  "nextPageUrl" : "https://api.github.com/graphql", 
  "nextPageUrlQueryParametersTemplate" : "{'query':'query{repository(owner:\"xyz\")}" 
}
```

#### Configure NextPageToken or PersistentToken

`NextPageToken`-type pagination uses a token (a hash or a cursor) that represents the state of the current page. The token is included in the API response and the client appends it to the next request to fetch the next page. This method is often used when the server needs to maintain the exact state between requests.

`PersistentToken` pagination uses a token that persists server side. The server remembers the last token the client retrieved client and provides the next token in subsequent requests. The client continues where it left off even if it makes new requests later.

| Field | Required | Type | Description |
|----|----|----|----|
| `PageSize` | False | Integer | Number of events per page. |
| `PageSizeParameterName` | False | string | Query parameter name for the page size. |
| `NextPageTokenJsonPath` | False | string | JSON path for the next page token in the response body. |
| `NextPageTokenResponseHeader` | False | string | If `NextPageTokenJsonPath` is empty, use the token in this header name for the next page. |
| `NextPageParaName` | False | string | Determines the next page name in the request. |
| `HasNextFlagJsonPath` | False | string | Defines the path to a `HasNextPage` flag attribute when determining if more pages are left in the response. |
| `NextPageRequestHeader` | False | string | Determines the next page header name in the request. |
| `PagingInfoPlacement` | False | String | How paging info is populated. Accepts either `QueryString` or `RequestBody`. |
| `PagingQueryParamOnly` | False | Boolean | If set to true, it omits all other query parameters except paging query parameters. |

Examples:

```json
"paging": {
 "pagingType" : "NextPageToken", 
 "nextPageRequestHeader" : "ETag", 
 "nextPageTokenResponseHeader" : "ETag" 
}
```

```json
"paging": {
 "pagingType" : "PersistentToken", 
    "nextPageParaName" : "gta", 
    "nextPageTokenJsonPath" : "$.alerts[-1:]._id" 
}
```

#### Configure Offset

`Offset`-type pagination specifies the number of pages to skip and a limit on the number of events to retrieve per page in the request. Clients fetch a specific range of items from the data set.

| Field | Required | Type | Description |
|----|----|----|----|
| `PageSize` | False | Integer | Number of events per page. |
| `PageSizeParameterName` | False | String | Query parameter name for the page size. |
| `OffsetParaName` | False | String | The next request query parameter name. The CCF calculates the offset value for each request (all events ingested + 1). |
| `PagingInfoPlacement` | False | String | How paging info is populated. Accepts either `QueryString` or `RequestBody` |
| `PagingQueryParamOnly` | False | Boolean | If set to true, it omits all other query parameters except paging query parameters. |

Example:

```json
"paging": {
  "pagingType": "Offset", 
  "offsetParaName": "offset",
  "pageSize": 50,
  "pagingQueryParamOnly": true,
  "pagingInfoPlacement": "QueryString"
}
```

#### Configure CountBasedPaging

`CountBasedPaging`-type pagination allows the client to specify the number of items to return in the response. This ability is useful for APIs that support pagination based on a count parameter as part of the response payload.

| Field | Required | Type | Description |
|----|----|----|----|
| `pageNumberParaName` | True | String | Parameter name of page number in HTTP request. |
| `PageSize` | False | Integer | Number of events per page. |
| `ZeroBasedIndexing` | False | Boolean | Flag that indicates count is zero based. |
| `HasNextFlagJsonPath` | False | String | JSON path of flag in the HTTP response payload that indicates there are more pages. |
| `TotalResultsJsonPath` | False | String | JSON path of total number of results in the HTTP response payload. |
| `PageNumberJsonPath` | False | String | Required if `totalResultsJsonPath` is provided. JSON path of the page number in the HTTP response payload. |
| `PageCountJsonPath` | False | String | Required if `totalResultsJsonPath` is provided. JSON path of the page count in the HTTP response payload. |
| `PagingInfoPlacement` | False | String | How paging info is populated. Accepts either `QueryString` or `RequestBody`. |
| `PagingQueryParamOnly` | False | Boolean | If set to true, it omits all other query parameters except paging query parameters. |

Example:

```json
"paging": {
 "pagingType" : "CountBasedPaging", 
 "pageNumberParaName" : "page", 
 "pageSize" : 10, 
 "zeroBasedIndexing" : true, 
 "hasNextFlagJsonPath" : "$.hasNext", 
 "totalResultsJsonPath" : "$.totalResults", 
 "pageNumberJsonPath" : "$.pageNumber", 
 "pageCountJsonPath" : "$.pageCount"
}
```

## DCR configuration

| Field | Required | Type | Description |
|----|----|----|----|
| `DataCollectionEndpoint` | True | String | Data collection endpoint (DCE). For example: `https://example.ingest.monitor.azure.com`. |
| `DataCollectionRuleImmutableId` | True | String | The DCR immutable ID. Find it by viewing the DCR creation response or using the [DCR API](/rest/api/monitor/data-collection-rules/get). |
| `StreamName` | True | string | This value is the `streamDeclaration` defined in the DCR. The prefix must begin with *Custom-*). |

## Example CCF data connector

Here's an example of all the components of the CCF data connector JSON:

```json
{
   "kind": "RestApiPoller",
   "properties": {
      "connectorDefinitionName": "ConnectorDefinitionExample",
      "dcrConfig": {
           "streamName": "Custom-ExampleConnectorInput",
           "dataCollectionEndpoint": "https://example-dce-sbsr.location.ingest.monitor.azure.com",
           "dataCollectionRuleImmutableId": "dcr-32_character_hexadecimal_id"
            },
      "dataType": "ExampleLogs",
      "auth": {
         "type": "Basic",
         "password": "[[parameters('username')]",
         "userName": "[[parameters('password')]"
      },
      "request": {
         "apiEndpoint": "https://rest.contoso.com/example",
         "rateLimitQPS": 10,
         "rateLimitConfig": {
            "evaluation": {
              "checkMode": "OnlyWhen429"
            },
            "extraction": {
              "source": "CustomHeaders",
              "headers": {
                "limit": {
                  "name": "X-RateLimit-Limit",
                  "format": "Integer"
                },
                "remaining": {
                  "name": "X-RateLimit-Remaining",
                  "format": "Integer"
                },
                "reset": {
                  "name": "X-RateLimit-RetryAfter",
                  "format": "UnixTimeSeconds"
                }
              }
            },
            "retryStrategy": {
              "useResetOrRetryAfterHeaders": true
            }
         },
         "queryWindowInMin": 5,
         "httpMethod": "POST",
         "queryTimeFormat": "UnixTimestamp",
         "startTimeAttributeName": "t0",
         "endTimeAttributeName": "t1",
         "retryCount": 3,
         "timeoutInSeconds": 60,
         "headers": {
            "Accept": "application/json",
            "User-Agent": "Example-app-agent"
         } 
      },
      "paging": {
         "pagingType": "LinkHeader",
         "pagingInfoPlacement": "RequestBody",
         "pagingQueryParamOnly": true
      },
      "response": {
         "eventsJsonPaths": ["$"]
      }
   }
}
```
