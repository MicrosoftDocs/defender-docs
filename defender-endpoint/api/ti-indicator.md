---
title: Indicator resource type
description: Specify the entity details and define the expiration of the indicator using Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
ms.date: 12/11/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Indicator resource type

## Properties

|Property|Type|Description|
|---|---|---|
|ID|String|Identity of the [Indicator](ti-indicator.md) entity.|
|indicatorValue|String|The value of the [Indicator](ti-indicator.md).|
|indicatorType|Enum|Type of the indicator. Possible values are: `FileSha1`, `FileSha256`, `FileMd5`, `CertificateThumbprint`, `IpAddress`, `DomainName`, and `Url`.|
|application|String|The application associated with the indicator.|
|action|Enum|The action that is taken if the indicator is discovered in the organization. Possible values are: `Warn`, `Block`, `Audit`, `Alert`, `AlertAndBlock`, `BlockAndRemediate`, and `Allowed`.|
|externalID|String|ID the customer can submit in the request for custom correlation.|
|sourceType|Enum|`User` in case the Indicator created by a user (for example, from the portal), `AadApp` in case it submitted using automated application via the API.|
|createdBySource|string|The name of the user/application that submitted the indicator.|
|createdBy|String|Unique identity of the user/application that submitted the indicator.|
|lastUpdatedBy|String|Identity of the user/application that last updated the indicator.|
|creationTimeDateTimeUtc|DateTimeOffset|The date and time when the indicator was created.|
|expirationTime|DateTimeOffset|The expiration time of the indicator.|
|lastUpdateTime|DateTimeOffset|The last time the indicator was updated.|
|severity|Enum|The severity of the indicator. Possible values are: `Informational`, `Low`, `Medium`, and `High`.|
|title|String|Indicator title.|
|description|String|Description of the indicator.|
|recommendedActions|String|Recommended actions for the indicator.|
|rbacGroupNames|List of strings|RBAC device group names where the indicator is exposed and active. Empty list in case it exposed to all devices.|
|rbacGroupIds|List of strings|RBAC device group IDs where the indicator is exposed and active. Empty list in case it exposed to all devices.|
|generateAlert|Enum|**True** if alert generation is required, **False** if this indicator shouldn't generate an alert.|

## Indicator Types

The indicator action types supported by the API are:

- Allowed
- Audit
- Block
- BlockAndRemediate
- Warn (Defender for Cloud Apps only)

For more information on the description of the response action types, see [Create indicators](../indicators-overview.md).

> [!NOTE]
>
> AlertAndBlock and Alert are legacy response actions that were supported only until January 2022.


## Json representation

```json
{
    "id": "994",
    "indicatorValue": "881c0f10c75e64ec39d257a131fcd531f47dd2cff2070ae94baa347d375126fd",
    "indicatorType": "FileSha256",
    "action": "BlockAndRemediate",
    "application": null,
    "source": "user@contoso.onmicrosoft.com",
    "sourceType": "User",
    "createdBy": "user@contoso.onmicrosoft.com",
    "severity": "Informational",
    "title": "Michael test",
    "description": "test",
    "recommendedActions": "nothing",
    "creationTimeDateTimeUtc": "2019-12-19T09:09:46.9139216Z",
    "expirationTime": null,
    "lastUpdateTime": "2019-12-19T09:09:47.3358111Z",
    "lastUpdatedBy": null,
    "rbacGroupNames": ["team1"]
}
```
