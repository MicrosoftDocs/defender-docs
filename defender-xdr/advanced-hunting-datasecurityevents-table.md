---
title: DataSecurityEvents table in the advanced hunting schema
description: Learn about the DataSecurityEvents table of the advanced hunting schema, which contains information about user activities that violate user-defined or default policies in the Microsoft Purview suite of solutions. 
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
ms.date: 03/28/2025
---

# DataSecurityEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]




> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `DataSecurityEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about user activities that violate user-defined or default policies in the Microsoft Purview suite of solutions. Each log represents a single user activity enriched with proprietary Microsoft detections (like sensitive info types) and user-defined enrichment labels like domain categories, sensitivity labels, and others.

This advanced hunting table is populated by records from Microsoft Purview Insider Risk Management. If your organization hasn’t opted in to share insider risk alerts with Microsoft Defender XDR, queries that use the table aren’t going to work or return any results. For more information, read [Investigate insider risk threats](irm-investigate-alerts-defender.md).

Use this reference to construct queries that return information from this table. For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
|`ApplicationNames`|	`string`|List of application names used or related to the event|
|`DeviceId`|	`string`|	Unique identifier for the device in Microsoft Defender for Endpoint|
|`DeviceName`|	`string`|	Fully qualified domain name(FQDN) of the device|
|`AadDeviceId`|	`guid`|	Unique identifier for the device in Microsoft Entra ID|
|`IsManagedDevice`|	`bool`| Indicates if the device is managed by the organization (True) or not (False)|
|`DlpPolicyMatchInfo`|	`string`|	Information around the list of data loss prevention (DLP) policies matching this event|
|`DlpPolicyEnforcementMode`|	`int`|	Indicates the Data Loss Prevention policy that was enforced; value can be: 0 (None), 1 (Audit), 2 (Warn), 3 (Warn and bypass), 4 (Block), 5 (Allow)|
|`DlpPolicyRuleMatchInfo`|	`dynamic`|	Details of the data loss prevention (DLP)  rules that matched with this event; in JSON array format|
|`FileRenameInfo`|`string`|	Details of the file (file name and extension) before this event|
|`PhysicalAccessPointId`|	`string`|	Unique identifier for the physical access point|
|`PhysicalAccessPointName`|	`string`|	Name of the physical access point|
|`PhysicalAccessStatus`	|`string`|	Status of physical access, whether it succeeded or failed|
|`PhysicalAssetTag`|`string`	|Tag assigned to the asset as configured in Microsoft Insider Risk Management global settings|
|`RemovableMediaManufacturer`|`string`|	Manufacturer name of the removable device|
|`RemovableMediaModel`|	`string`|	Model name of the removable device|
|`RemovableMediaSerialNumber`|	`string`|Serial number of the removable device|
|`TeamsChannelName`|`string`|	Name of the Teams channel|
|`TeamsChannelType`|	`string`|	Type of the Teams channel|
|`TeamsTeamName`|	`string`	|Name of the Teams team |
|`UserAlternateEmails`|	`string`|	Alternate emails or aliases of the user|
|`AccountUpn`|	`string`|	User principal name (UPN) of the account|
|`AccountObjectId`|	`string`|	Unique identifier for the account in Microsoft Entra ID|
|`Department`|`string`|	Name of the department that the account user belongs to|
|`SourceCodeInfo`|	`string`|	Details of the source code repository involved in the event|
|`CcPolicyMatchInfo`|	`dynamic` | Details of the Communications Compliance policy matches for this event; in JSON array format |
|`IPAddress`|	`string`|	IP addresses of the clients on which the activity was performed; can contain multiple IPs if related to Microsoft Defender for Cloud Apps alerts|
|`Timestamp`|	`datetime`|	Date and time when the event was recorded|
|`DeviceSourceLocationType`|	`int`|	Indicates the type of location where the endpoint signals originated from; values can be: 0 (Unknown), 1 (Local), 2 (Remote), 3 (Removable), 4 (Cloud), 5 (File share)|
|`DeviceDestinationLocationType`|	`int`|	Indicates the type of location where the endpoint signals connected to; values can be: 0 (Unknown), 1 (Local), 2 (Remote), 3 (Removable), 4 (Cloud), 5 (File share)|
|`IrmPolicyMatchInfo`|	`dynamic`| Details of Insider Risk Management policy matches for the content involved in the event; in JSON array format |	
|`UnallowedUrlDomains`|	`string`|	Websites or service URLs involved in this event that is configured as Unallowed in Insider Risk Management global settings|
|`ExternalUrlDomains`|	`string`|	Websites or service URLs involved in this event that is classified as External in Insider Risk Management global settings|
|`UrlDomainInfo`|	`string`|	Details about the websites or service URLs involved in the event|
|`SourceUrlDomain`|	`string`|	Domain where the device and email signals originated|
|`TargetUrlDomain`|	`string`|	Domain where the content was shared with or the user has browsed to|
|`EmailAttachmentCount`|`int`| Number of email attachments	|
|`EmailAttachmentInfo`|	`dynamic`|	Details of email attachments; in JSON array format|
|`InternetMessageId`|`string`	|Public-facing identifier for the email or Teams message that is set by the sending email system |
|`NetworkMessageId`|	`guid`|	Unique identifier for the email, generated by Microsoft 365 |
|`EmailSubject`|	`string`|	Subject of the email|
|`ObjectId`|	`string`	|Unique identifier of the object that the recorded action was applied to, in case of files, it includes the extension|
|`ObjectName`|	`string`|	Name of the object that the recorded action was applied to, in case of files, it includes the extension|
|`ObjectType`|	`string`|	Type of object, such as a file or a folder, that the recorded action was applied to|
|`ObjectSize`|	`int`|	Size of the object in bytes|
|`IsHidden`|	`bool`|	Indicates whether the user has marked the content as hidden (True) or not (False) |
|`ActivityId`	|`guid`|	Unique identifier of the activity log|
|`ActionType`|`string`|	Type of activity that triggered the event|
|`SensitiveInfoTypeInfo`|	`dynamic`|	Details of Data Loss Prevention sensitive info types detected in the impacted asset|
|`SensitivityLabelId`|`string`|The current Microsoft Information Protection sensitivity label ID associated with the item|
|`SharepointSiteSensitivityLabelIds`|`string`|	The current Microsoft Information Protection sensitivity label ID assigned to the parent site of the item related to SharePoint activities |
|`PreviousSensitivityLabelId`|	`string`|The previous Microsoft Information Protection sensitivity label ID associated with the item in case of activities where the sensitivity label was changed|
|`Operation`|	`string`|	Name of the admin activity|
|`RecipientEmailAddress`|	`string`|	Email address of the recipient, or email address of the recipient after distribution list expansion|
|`SiteUrl`|	`string` | The URL of the site where the file or folder accessed by the user is located |	
|`SourceRelativeUrl`|	`string`| The URL of the folder that contains the file accessed by the user |	
|`TargetFilePath`|	`string`|	Target file path of endpoint activities|
|`PrinterName`|	`string`|	List of printers involved in the behavior|
|`Workload`|`string`|	The Microsoft 365 service where the event occurred|
|`IrmActionCategory`|	`enum`|	A unique enumeration value indicating the activity category in Microsoft Purview Insider Risk Management|
|`SequenceCorrelationId`|`string`	|Details of the sequence activity|
|`CloudAppAlertId`|`string`	| Unique identifier for the alert in Microsoft Defender for Cloud Apps |


## Related articles

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)


[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
