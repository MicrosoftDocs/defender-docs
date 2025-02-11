---
title: DataSecurityEvents table in the advanced hunting schema
description: Learn about the DataSecurityBehaviors table of the advanced hunting schema, which contains information about user activities that violate customer defined or default policies in Microsoft Purview suite of solutions.
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
ms.topic: reference
ms.date: 02/11/2025
---

# DataSecurityEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender XDR
- Microsoft Purview



> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The `DataSecurityBehaviors` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about user activities that violate customer defined or default policies in Microsoft Purview suite of solutions. Each record represents a single user activity enriched with proprietary Microsoft detections (like sensitive info types) and customer-defined enrichment labels like domain categories, sensitivity labels, and the like.

Use this reference to construct queries that return information from this table.

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
|`Application`|	`string`|Application that performed the recorded action|
|`DeviceId`|	`string`|	Device ID provided by Microsoft Defender for Endpoint|
|`DeviceName`|	`string`|	Fully Qualified Domain Name(FQDN) of the device|
|`AadDeviceId`|	`guid`|	Unique identifier for the device in the Azure Active Directory on which the activity was performed|
|`IsManagedDevice`|	`bool`|	 Indicates if the device is managed by the organization|
|`DlpPolicyMatchInfo`|	`string`|	Information around the list of DLP policies matching this event; displayed in JSON array format|
|`DLPPolicyEnforcementMode`|	`int`|	Indicates whether the DLP enforcement mode is one of audit/warn(block with override)/block/allow(audit without alerts)|
|`DlpPolicyRuleMatchInfo`|	`string`|	Details of DLP policy rules that matched with this event; displayed in JSON array format|
|`FileRenameInfo`|`string`|	Details of the file prior to this event|
|`PreviousFileName` |`string`|Details of the file prior to this event|
|`PrevioudFileExtension`|`string`| Extension of the file prior to this event|
|`PhysicalAccessPointId`|	`string`|	Unique identifier for the Physical access point|
|`PhysicalAccessPointName`|	`string`|	Name of the Physical access point|
|`PhysicalAccessStatus`	|`string`|	The status of physical access whether it succeeded or failed|
|`PhysicalAssetTag`|`string`	|The tag assigned to the asset as per the config defined in Microsoft Insider Risk Management global settings|
|`RemovableMediaManufacturer`|`string`|	The manufacturer name of the removable device|
|`RemovableMediaModel`|	`string`|	The model name of the removable device|
|`RemovableMediaSerialNumber`|	`string`|The serial number of the removable device|
|`TeamsChannelName`|`string`|	Name of the teams channel|
|`TeamsChannelType`|	`string`g|	Type of the teams channel|
|`TeamsTeamName`|	`string`	|Name of the team|
|`UserAlternateEmails`|	`string`|	Comma separated string of alternate mails or aliases of user|
|`AccountUpn`|	`string`|	User principal name (UPN) of the account|
|`AccountObjectId`|	`string`|	Unique identifier for the account in Microsoft Entra ID|
|`Department`|`string`|	Department of the user/actor|
|`SourceCodeInfo`|	`string`|	Captures the details of the source code in related activities|
|`CcPolicyMatchInfo`|	JSON object | xxx	
|`IPAddress`|	`string`|	Comma separated string of IP Addresses of the clients on which the activity was performed. This can contain multiple IPs if the activity is related to MCAS alerts.|
|`Timestamp`|	`datetime`|	Time stamp of the event|
|DeviceSourceLocationType|	`int`|	Type of the source location for endpoint signals. Represented by a resolved enum value|
|`DeviceDestinationLocationType`|	Int|	Destination location of the activity. Represented by a resolved enum value|
|`IrmPolicyMatchInfo`|	JSON Object| xxx |	
|`UnallowedUrlDomains`|	`string`|	List of websites, service URLs involved in this event that are configured as Unallowed in IRM Global settings|
|`ExternalUrlDomains`|	`string`|	List of websites, service URLs involved in this event that are classified as external in IRM Global settings|
|`UrlDomainInfo`|	`string`|	List of websites, service URLs in the behavior involved in the behavior|
|`SourceUrlDomain`|	`string`|	Originating domain for the endpoint and email signals|
|`TargetUrlDomain`|	`string`|	Details of the target domain that content is shared with or user has browsed to|
|`EmailAttachmentCount`|`int`|  xxx	|
|`EmailAttachmentInfo`|	Array<JSON Object>|	Details of email attachments|
|`InternetMessageId`|`string`	|The internet message id of the entity related to email or teams message. This field is relevant to exchange infra |
|`NetworkMessageId`|	`guid`|	The network message id of the entity related to email. This field is relevant to exchange infra |
|`EmailSubject`|	`string`|	Subject of the email|
|`ObjectId`|	`string`	|File full path (URL). For SharePoint and OneDrive for Business activity, the full path name of the file or folder accessed by the user. For MCAS alerts it is the alert id. For emails it is internet message id.|
|`ObjectName`|	`string`|	Name on the item on which the activity was done. In case of files it includes the extension also.|
|`ObjectType`|	`string`|	A unique enumeration value indicates type included in the activity.|
|`ObjectSize`|	`int`|	Size of the item in bytes.|
|`IsHidden`|	`bool`|	Indicates whether the user marks the content as hidden.
|`Id`	|`guid`|	Unique id of the activity log|
|`ActionType`|`string`|	This field gives a more verbose context around the type of activity done as per the audit operation and some specific fields (in case of few specific operation). This is a comma separated list which might have multiple activity description for some particular activities like for FileCreated operation it can be "Hidden File Created" or "Sensitive File Created" or both.|
|`SensitiveInfoTypeInfo`|	Array<JSON Object>|	Information regarding the DLP sensitive information.|
|`SensitivtyLabelIds`|`string`|	The current MIP sensitivity label ID associated with the item.|
|`SharepointSiteSensitivityLabelIds`|`string`|	The MIP sensitivity label ID assigned to the parent site of the item related to SharePoint activities.|
|`PreviousSensitivityLabelId`|	`string`|	The old MIP sensitivity label Id for the item in case of activities where sensitive label was changed like SpoFileLabelDowngraded, SpoFileLabelRemoved, SpoSiteLabelRemoved.|
|`Operation`|	`string`|	The name of the admin activity.|
|`RecipientEmailAddress`|	`string`|	Comma separated list of recipients for the corresponding activity. It could be the recipients of email, SharePoint shared items, teams message, teams channel member addition action etc.|
|`SiteUrl`|	`string` | xxx |	
|`SourceRelativeUrl`|	`string`| xxx |	
|`TargetFilePath`|	`string`|	Target file path for end point activities.|
|`PrinterName`|	`string`|	List of printers involved in the behavior|
|`Workload`|`string`|	The Microsoft 365 service where the activity occurred.|
|`IrmActionCategory`|	`enum`|	A unique enumeration value indicating the activity category in Microsoft Purview Insider risk management.|
|`SequenceCorrelationId`|	xx	|Details of the sequence activity|


## Related articles

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)


[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
