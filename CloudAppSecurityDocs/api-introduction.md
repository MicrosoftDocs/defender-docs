---
title: REST API
description: This article describes how to interact with Defender for Cloud Apps over HTTPS.
ms.date: 01/29/2023
ms.topic: reference
---
# Defender for Cloud Apps REST API



This article describes how to interact with Defender for Cloud Apps over HTTPS.

The Microsoft Defender for Cloud Apps API provides programmatic access to Defender for Cloud Apps through REST API endpoints. Applications can use the API to perform read and update operations on Defender for Cloud Apps data and objects. For example, the Defender for Cloud Apps API supports the following common operations for a user object:

- Upload log files for cloud discovery
- Generate block scripts
- List activities and alerts
- Dismiss or resolve alerts

## API URL structure

To use the Defender for Cloud Apps API, you must first obtain the API URL from your tenant. The API URL uses the following format: `https://<portal_url>/api/<endpoint>`.

To obtain the Defender for Cloud Apps API URL for your tenant, do the following steps:

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.  Under **System**, select **About**.
1. In the Defender for Cloud Apps about screen, you can see the API url.

    ![View your data center.](media/api-url.png)

Once you have the API url, add the `/api` suffix to it to obtain your API URL. For example, if your portal's URL is `https://mytenant.us2.contoso.com`, then your API URL is `https://mytenant.us2.portal.cloudappsecurity.com/api`.

## API tokens

Defender for Cloud Apps requires an API token in the header of all API requests to the server, such as the following:

```http
Authorization: Token <your_token_key>
```

Where `<your_token_key>` is your personal API token.

For more information about API tokens, see [Managing API tokens](api-authentication.md).

### API tokens - example

```rest
curl -XGET -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/example-endpoint"
```

## What actions are supported?

The following table describes the actions supported:

|Resource|HTTP verbs|URI routes|
|---|---|---|
|Activities|GET or POST|/api/v1/activities/|
|Alerts|GET or POST|/api/v1/alerts/|
|Data Enrichment|GET, POST, or DELETE|/api/subnet/|
|Entities|GET or POST|/api/v1/entities/|
|Files|GET or POST|/api/v1/files/|

Where **Resource** represents a group of related entities.

## What field types are supported?

The following table describes the supported field types:

|Field|Description|
|---|---|
|string|A textual string|
|boolean|A boolean value representing true/false|
|integer|32-bit signed integer|
|timestamp|Milliseconds since epoch|

### Timestamps

Mentions of timestamps in the Defender for Cloud Apps API refer to the Unix timestamp in milliseconds. This timestamp is determined by the number of milliseconds since 1970-01-01 0:00:00. You can use the [get-date](/powershell/module/microsoft.powershell.utility/get-date) PowerShell cmdlet to convert dates to timestamps.

## Limits

You can choose to limit your requests by providing a limit parameter in the request.

The following methods are supported for providing the limit parameter:

- URL-encoded (with `Content-Type: application/x-www-form-urlencoded` header)
- Form data
- JSON body (with `Content-Type: multipart/form-data` and an appropriate boundary header)

> [!NOTE]
>
> - If no limit is provided, a default of 100 will be set.
> - Responses for all requests made with the API token are limited to a maximum of 100 items.
> - The throttle limit for all API requests is 30 requests per minute per tenant.

## Filters

When you have a large number of results, you'll find it useful to fine-tune requests using filters. This section describes the structure of, and operators that can be used with, filters.

### Structure

Some of our API endpoints support filters when performing queries. In their relevant sections, you will find a reference listing all available filterable fields and supported operators for that resource.

Most filters support multiple values to provide you with powerful queries. When combining filters and operators we use AND as the logical operator between the filters.

### Filters - example

```rest
curl -XGET -H "Authorization:Token <your_token_key>" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/example-endpoint" -d '{
  "filters": {
    "some.field": {
      "eq": ["value1", "value2"],
      "isset": true
    },
    "some.field2": {
      "gte": 5
    }
  },
  "skip": 5,
  "limit": 10
}'
```

### Operators

> [!NOTE]
> Not all operators are compatible with all filters.

The following table describes the supported operators:

| Operator | Response type | Description |
| --- | --- | --- |
| contains | list of strings | Returns all relevant records containing one of the provided strings |
| deq | list of values | Returns all records who contain one value that does not equal one the provided values |
| descendantof | list of values | Returns all relevant records matching values or descendants of them |
| doesnotstartwith | list of strings | Returns all relevant records not starting with each of the provided strings |
| endswith | list of strings | Returns all relevant records ending with one of the provided strings |
| eq | list of values | Returns all relevant records containing one of the provided values |
| gt | single value | Returns all records whose value is greater than the provided value |
| gte | single value | Returns all records whose value is greater than or equal to the provided value |
| gte_ndays | number | Returns all records with date later than N days ago |
| isnotset | boolean | When set to "true", returns all relevant records that don't have a value in the specified field |
| isset | boolean | When set to "true", returns all relevant records that have a value in the specified field |
| lt | single value | Returns all records whose value is less than the provided value |
| lte | single value | Returns all records whose value is less than or equal to the provided value |
| lte_ndays | number | Returns all records with date earlier than N days ago |
| ncontains | list of strings | Returns all relevant records not containing one of the provided strings |
| ndescendantof | list of values | Returns all relevant records not matching values or descendants of them |
| neq | list of values | Returns all relevant records not containing all the provided values |
| range | list of objects containing "start" and "end" fields | Returns all records within one of the provided ranges |
| startswith | list of strings | Returns all relevant records starting with one of the provided strings |
| startswithsingle | string | Returns all relevant records starting with the provided string |
| text | string | Performs a full-text search of all records |

## Next steps

> [!div class="nextstepaction"]
> [API authentication](api-authentication.md)

[!INCLUDE [Open support ticket](includes/support.md)]
