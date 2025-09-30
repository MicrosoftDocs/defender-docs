---
title: List continuous report categories - cloud discovery API
description: This article describes the list continuous report categories request in the Defender for Cloud Apps cloud discovery API.
ms.date: 01/29/2023
ms.topic: reference
---
# List continuous report categories - cloud discovery API



Run the POST request to fetch a list of categories associated with a continuous report.

## HTTP request

```rest
POST api/v1/discovery/discovered_apps/categories/
```

## Request BODY parameters

| Parameter | Description |
| --- | --- |
| filters (*optional*) | Filter objects with all the search filters for the request by category id |
| sortDirection (*optional*) | The sorting direction. Possible values are: `asc` and `desc` |
| sortField (*optional*) | Fields used to sort entities. Possible values are:<br />- **score**: The total number of apps in this category |
| skip (*optional*) | Skips the specified number of records |
| limit (*optional*) | Maximum number of records returned by the request |
| streamId | Filter records by continuous report ID |
| timeFrame (*optional*) | Filter records by the number of days since the continuous report was last used |

## Example

### Request

Here is an example of the request.

```rest
curl -XPOST -H "Authorization:Token <your_token_key>" -H "Content-Type: application/json" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/discovery/discovered_apps/categories/" -d '{
  "filters": {
    // some filters
  },
  "skip": 5,
  "limit": 10,
  "streamId": <continuous_report_id>
}'
```

### Response

Returns a list of app tags in JSON format.

```json
[
  {
    "id": "SAASDB_CATEGORY_PRODUCT_DESIGN",
    "total": 2
  }
]
```

The response object defines the following properties.

| Field name | Field type | Field description |
|--|--|--|
| id | string | The id of the category |
| total | int | The total number of services in the category |
## Supported log types

The following category IDs are currently supported:

| ID | Name |
|--|--|
| SAASDB_CATEGORY_ACCOUNTING_AND_FINANCE | Accounting and finance |
| SAASDB_CATEGORY_ADVERTISING | Advertising |
| SAASDB_CATEGORY_ALL | All categories |
| SAASDB_CATEGORY_BUSINESS_INTELLIGENCE | Business intelligence |
| SAASDB_CATEGORY_BUSINESS_MANAGEMENT | Business management |
| SAASDB_CATEGORY_CLOUD_COMPUTING_PLATFORM | Cloud computing platform |
| SAASDB_CATEGORY_CLOUD_STORAGE | Cloud storage |
| SAASDB_CATEGORY_CODE_HOSTING | Code hosting |
| SAASDB_CATEGORY_COLLABORATION | Collaboration |
| SAASDB_CATEGORY_COMMUNICATIONS | Communications |
| SAASDB_CATEGORY_CONSUMER | Consumer |
| SAASDB_CATEGORY_CONTENT_MANAGEMENT | Content management |
| SAASDB_CATEGORY_CONTENT_SHARING | Content sharing |
| SAASDB_CATEGORY_CRM | CRM |
| SAASDB_CATEGORY_CUSTOMER_SUPPORT | Customer support |
| SAASDB_CATEGORY_DATA_ANALYTICS | Data analytics |
| SAASDB_CATEGORY_DEVELOPMENT_TOOLS | Development tools |
| SAASDB_CATEGORY_ECOMMERCE | E-commerce |
| SAASDB_CATEGORY_EDUCATION | Education |
| SAASDB_CATEGORY_FORUMS | Forums |
| SAASDB_CATEGORY_HEALTH | Health |
| SAASDB_CATEGORY_HOSTING_SERVICES | Hosting services |
| SAASDB_CATEGORY_HUMAN_RESOURCE_MANAGEMENT | Human-resource management |
| SAASDB_CATEGORY_INTERNET_OF_THINGS | Internet of Things |
| SAASDB_CATEGORY_IT_SERVICES | IT services |
| SAASDB_CATEGORY_MARKETING | Marketing |
| SAASDB_CATEGORY_MEDIA | Media |
| SAASDB_CATEGORY_NEWS_AND_ENTERTAINMENT | News and entertainment |
| SAASDB_CATEGORY_ONLINE_MEETINGS | Online meetings |
| SAASDB_CATEGORY_OPERATIONS_MANAGEMENT | Operations management |
| SAASDB_CATEGORY_PERSONAL_INSTANT_MESSAGING | Personal instant messaging |
| SAASDB_CATEGORY_PRODUCT_DESIGN | Product design |
| SAASDB_CATEGORY_PRODUCTIVITY | Productivity |
| SAASDB_CATEGORY_PROJECT_MANAGEMENT | Project management |
| SAASDB_CATEGORY_PROPERTY_MANAGEMENT | Property management |
| SAASDB_CATEGORY_SALES | Sales |
| SAASDB_CATEGORY_SECURITY | Security |
| SAASDB_CATEGORY_SOCIAL_NETWORK | Social network |
| SAASDB_CATEGORY_SUPLLY_CHAIN_AND_LOGISTICS | Supply chain and logistics |
| SAASDB_CATEGORY_TIME_TRACKING | Time tracking |
| SAASDB_CATEGORY_TRANSPORTATION_AND_TRAVEL | Transportation and travel |
| SAASDB_CATEGORY_UNCLASSIFIED | Unclassified |
| SAASDB_CATEGORY_VENDOR_MANAGEMENT_SYSTEM | Vendor management system |
| SAASDB_CATEGORY_WEB_ANALYTICS | Web analytics |
| SAASDB_CATEGORY_WEBMAIL | Webmail |
| SAASDB_CATEGORY_WEBSITE_MONITORING | Website monitoring |
| SAASDB_SUBCATEGORY_INSURANCE_AND_INVESTMENTS | Accounting and finance |

[!INCLUDE [Open support ticket](includes/support.md)]
