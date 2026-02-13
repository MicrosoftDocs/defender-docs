---
title: CloudStorageAggregatedEvents table in the advanced hunting schema
description: Learn about the CloudStorageAggregatedEvents table in the advanced hunting schema, which contains information about storage activity and related events.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords:
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
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
ms.date: 08/05/2025
---

# CloudStorageAggregatedEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The `CloudStorageAggregatedEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about storage activity and related events. Use this reference to construct queries that return information from this table.

> [!IMPORTANT]
> Some information relates to prereleased product, which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

This advanced hunting table is populated by records from [Microsoft Defender for Cloud](/azure/defender-for-cloud/concept-integration-365#advanced-hunting-in-xdr). If your organization doesn't have Microsoft Defender for Cloud, queries that use the table aren’t going to work or return any results. For more information about prerequisites in integrating Defender for Cloud with Defender XDR, read [Microsoft Defender XDR integration](/azure/defender-for-cloud/concept-integration-365).


For information on other tables in the advanced hunting schema, see the [advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `DataAggregationStartTime` | `datetime` | The start time during which the data was aggregated |
| `DataAggregationEndTime` | `datetime` | The end time during which the data was aggregated |
| `DataSource` | `string` | The source of the aggregated logs |
| `SubscriptionId` | `string` | Unique identifier assigned to the Azure subscription |
| `ResourceGroup` | `string` | Name of the resource group where the storage account resides |
| `StorageAccount` | `string` | The identifier for the storage account |
| `StorageContainer` | `string` | The identifier for the storage container | 	
| `StorageFileShare` | `string` | The identifier for the storage file share | 	 
| `ServiceType` | `string` | Specifies the type of storage service (for example, Blob, ADLS Gen2, Files.REST, Files.SMB) | 	 
| `IpAddress` | `string` | The IP addresses from which the storage was accessed |  	 
| `UserAgentHeader` | `string` | Details of the user agent accessing the storage (for example, browser or application) | 	 
| `OperationNamesList` | `object` | A list of storage operations performed (for example, CreateContainer, DeleteContainer) | 	 
| `AuthenticationType` | `string` | The authentication method used to access the storage (for example, AccountKey, SAS, Oauth) | 	 
| `AccountObjectId` | `string` | The unique identifier of the object is making the storage access | 	 
| `AccountTenantId` | `long` | The unique identifier of the Azure tenant | 	 
| `AccountApplicationId` | `string` | The application ID associated with the storage access | 	 
| `AccountUpn` | `string` | The user principal name of the accessing user | 	 
| `AccountType` | `long` | The account type used | 	 
| `OperationsCount` | `int` | The total number of storage operations performed | 	 
| `SuccessfulOperationsCount` | `int` | The count of successful storage operations | 	 
| `FailedOperationsCount` | `int` | The count of failed storage operations | 	 
| `FirstEventTimestamp` | `datetime` | The timestamp of the first observed operation in the aggregation period	| 	 
| `LastEventTimestamp` | `datetime` | The timestamp of the last observed operation in the aggregation period | 	 
| `TotalResponseLength` | `int` | The total response length of all GET operations during the aggregation period |
| `SuccessfulReadOperations` | `int` | The count of successful read operations | 
| `DistinctGetOperations` | `int` | The count of distinct GET operations performed | 
| `AnonymousSuccessfulOperations` | `int` | The count of successful anonymous operations | 
| `HasAnonymousResourceNotFoundFailures` | `bool` | Indicates whether anonymous resource not found failures occurred | 
| `CountryName` | `string` | The name of the country from where the storage was accessed | 
| `CityName` | `string` | The name of the city from where the storage was accessed | 
| `ProvinceName` | `string` | The name of the province or state from where the storage was accessed | 
| `ClientSystemServiceName` | `string` | The name of the system service is in the data center | 
| `ClientCloudPlatformName` | `string` | The name of the cloud platform where the data center is located | 
| `IsTorExitNode` | `bool` | Indicates whether the IP address is a Tor exit node | 
| `IsKnownSuspiciousIp` | `bool` | Indicates whether the IP address is known to be suspicious | 
| `IsPrivateIp` | `bool` | Indicates whether the IP address is private | 
| `SuspiciousUserAgentName` | `string` | The name of the suspicious user agent accessing the storage | 
| `HashReputationMd5List` | `object` | A list of MD5 hash reputations for the accessed resources | 
| `AzureResourceId` | `string` | The Azure Resource ID of the storage account | 
| `Location` | `string` | The location of the storage account (region) | 
| `Timestamp` | `datetime` | Indicate the time when the record was generated | 
| `ReportId` | `string` | GUID to identify the record in the specific table | 
| `ActionType` | `string` | Type of action (aggregated logs) | 
| `AdditionalFields` | `dynamic` | Additional information about the event in JSON array format | 


## Sample queries

To detect failed anonymous authentication attempts:

```kusto
CloudStorageAggregatedEvents
| where FailedOperationsCount > 0
| where AuthenticationType == "Anonymous"
| project StorageAccount, FailedOperationsCount, OperationNamesList, AdditionalFields
```

To list unusual authentication methods used: 

```kusto
// Define a list of expected authentication types
let ExpectedAuthTypes = dynamic(["AccountKey", "SAS", "Oauth"]);
CloudStorageAggregatedEvents
| where DataAggregationEndTime >= ago(7d)
| where not(AuthenticationType in (ExpectedAuthTypes))
| summarize TotalOperations = sum(OperationsCount) by StorageAccount, AuthenticationType
```
To find storage accounts with a high number of failed operations: 

```kusto
CloudStorageAggregatedEvents
| where DataAggregationEndTime >= ago(7d)
| summarize TotalFailedOperations = sum(FailedOperationsCount) by StorageAccount
| where TotalFailedOperations > 100
| order by TotalFailedOperations desc
```

To monitor anonymous successful operations: 

```kusto
CloudStorageAggregatedEvents
| where DataAggregationEndTime >= ago(7d)
| where AuthenticationType == "Anonymous" and SuccessfulOperationsCount > 0
| project StorageAccount, SuccessfulOperationsCount, OperationNamesList, AdditionalFields
```

To detect access to sensitive containers or file shares:

```kusto
CloudStorageAggregatedEvents
| where DataAggregationEndTime >= ago(7d)
| where AuthenticationType == "Anonymous" and SuccessfulOperationsCount > 0
| project StorageAccount, SuccessfulOperationsCount, OperationNamesList, AdditionalFields
```

To detect suspicious file uploads with known malicious hashes:

```kusto
CloudStorageAggregatedEvents
| where DataAggregationEndTime >= ago(7d)
| where isnotempty(Md5Hashes)
| mv-expand HashReputation = Md5Hashes
| extend HashDetails = parse_json(HashReputation)
| project StorageAccount, AccountUpn, OperationNamesList, HashMd5 = HashDetails.md5Hash, ResourcePath = HashDetails.resourcePath, OperationType = HashDetails.operationType, ETag = HashDetails.etag
```

## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)

