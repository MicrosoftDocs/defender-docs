---
title: Data Enrichment API
description: This article provides information about using the Data Enrichment API.
ms.date: 01/29/2023
ms.topic: reference
---
# Data Enrichment API



The Data Enrichment API enables you to manage identifiable IP address ranges, such as your physical office IP addresses. IP address ranges allow you to tag, categorize, and customize the way logs and alerts are displayed and investigated. For more information, see [Working with IP ranges and tags](ip-tags.md).

The following lists the supported requests:

- [List IP address ranges](api-data-enrichment-list.md)
- [Create IP address range](api-data-enrichment-create.md)
- [Update IP address range](api-data-enrichment-update.md)
- [Delete IP address range](api-data-enrichment-delete.md)

## Properties

The response object defines the following properties.

| Property | Type | Description |
| --- | --- | --- |
| total | int | Total number of record |
| hasNext | bool | Indicates whether there are additional records |
| data | list | List of the existing records |
| _id | string | Unique id of the IP range |
| name | string | The unique name of the range |
| subnets | list | An array of masks, IP addresses (IPv4 / IPv6), and original strings |
| location | string | An object including the location name, latitude, longitude, country code, and country name |
| organization | string | The registered ISP |
| tags| list | An array of new or existing objects including the tag name, id, description, name template, and tenant id |
| category | int | The category of the IP range. Providing a category helps you easily recognize activities from interesting IP addresses. Possible values include:<br /><br />**1**: Corporate<br />**2**: Administrative<br />**3**: Risky<br />**4**: VPN<br />**5**: Cloud provider<br />**6**: Other |
| lastModified | long | [Timestamp](api-introduction.md#timestamps) of the last rule changed |

## Filters

For information about how filters work, see [Filters](api-introduction.md#filters).

The following table describes the supported filters:

| Filter | Type | Operators | Description |
| --- | --- | --- | --- |
| category | integer | eq, neq | Filter IP ranges by category. Possible values include:<br /><br />**1**: Corporate<br />**2**: Administrative<br />**3**: Risky<br />**4**: VPN<br />**5**: Cloud provider<br />**6**: Other |
| tags | string | eq, neq | Filter IP ranges by tag IDs |
| builtIn | bool | eq | Filter IP ranges by type. Possible values include: **true** (built-in) or **false** (custom) |

[!INCLUDE [Open support ticket](includes/support.md)]
