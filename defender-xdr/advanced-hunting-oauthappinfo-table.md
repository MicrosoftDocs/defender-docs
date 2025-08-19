---
title: OAuthAppInfo table in the advanced hunting schema
description: Learn about the OAuthAppInfo table which contains information about Microsoft 365-connected OAuth applications registered with Microsoft Entra ID and available in the Defender for Cloud Apps app governance capability.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: 
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: reference
ms.date: 05/23/2025
---

# OAuthAppInfo (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `OAuthAppInfo` table in the advanced hunting schema contains information about Microsoft 365-connected OAuth applications in the organization that are registered with Microsoft Entra ID and available in the Microsoft Defender for Cloud Apps app governance capability. 

The `OAuthAppInfo` table might not include all the app or service principal-related properties that are available on Entra ID. It also doesn't include data related to Microsoft first-party apps or apps without any OAuth consents. The coverage of the table is based on the existing scope of Microsoft 365-connected apps covered by app governance. 

## Prerequisites

This advanced hunting table is populated by app governance records from Microsoft Defender for Cloud Apps. 

You need to turn on app governance to view the `OAuthAppInfo` table in advanced hunting. To turn on app governance, follow the steps in [Turn on app governance](/defender-cloud-apps/app-governance-get-started).


## Schema
For information on other tables in the advanced hunting schema, see [the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `ReportId` | `string` | Unique identifier for the record|
| `Timestamp` | `string` | Date and time when the record was created|
| `OAuthAppId` | `string` | The unique  identifier for the app as assigned by Microsoft Entra ID|
| `ServicePrincipalId` | `string` | The unique identifier for the service principal instance of the application in the tenant|
| `AppName` | `string` | The application's display name as exposed by the associated service principal|
| `AddedOnTime` | `datetime` | Date and time when the application was registered|
| `LastModifiedTime` | `datetime` | Timestamp when the app was last modified|
| `AppStatus` | `string` | Status of the app; can be: Enabled, DisabledByMicrosoft, DisabledByAppGovernancePolicy, DisabledByUser, Deleted (information for apps with Deleted status is only available for 30 days since the app was deleted)|
| `VerifiedPublisher` | `dynamic` | Specifies details about the verified publisher of the application which this service principal represents. It includes information such as: DisplayName, VerifiedPublisherId, AddedDateTime|
| `PrivilegeLevel` | `string` | The privilege level of the app based on the highest classified permission granted to the app|
| `Permissions` | `dynamic` | Contains an array of permission objects; each permission object includes PermissionName, TargetAppId, TargetAppDisplayName, PermissionType, PrivilegeLevel, UsageStatus|
| `ConsentedUsersCount` | `integer` | Count of users who have consented to the app; this information is only available when the app isn't admin consented|
| `IsAdminConsented` | `boolean` | Value is True if a user has provided admin consent to the app on behalf of all the users in the org, otherwise the value is False|
| `AppOrigin` | `string` | Specifies whether the app is internal to the organization or registered in an external tenant|
| `LastUsedTime` | `datetime` | Date and time when the app was last used|
| `AppOwnerTenantId` | `string` |Specifies the ID of the tenant where the app was registered|


The `OAuthAppInfo` table updates information on an hourly basis to record any changes in metadata or insights for OAuth apps based on data from Defender for Cloud Apps app governance. 

Additionally, to ensure that `OAuthAppInfo` table retains data for the covered apps, a complete snapshot of all OAuth apps is sent twice a month.




## Related topics

- [Proactively hunt for threats](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)


[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]