---
title: Files API
description: This article provides information about using the Files API.
ms.date: 01/29/2023
ms.topic: reference
---
# Files API



> [!NOTE]
>
> - This API is not available for Microsoft 365 Cloud App Security.

The Files API provides you with metadata about the files and folders stored in your cloud apps, such as last modification date, ownership, and more.

The following lists the supported requests:

- [List files](api-files-list.md)
- [Fetch file](api-files-fetch.md)

## Filters

For information about how filters work, see [Filters](api-introduction.md#filters).

The following table describes the supported filters:

| Filter | Type | Operators | Description |
| --- | --- | --- | --- |
| service | integer | eq, neq | Filter files from specified app appID, for example: 11770 |
| instance | integer | eq, neq | Filter files from specified instances |
| fileType | integer | eq, neq | Filter files with the specified file type. Possible values include:<br /><br />**0**: Other<br />**1**: Document<br />**2**: Spreadsheet<br />**3**: Presentation<br />**4**: Text<br />**5**: Image<br />**6**: Folder |
| allowDeleted | boolean | eq | Possible values include:<br /><br />**true**: Returns deleted files<br />**false** or not set: Returns nondeleted (including trashed) files. This value is overridden by the *trashed* operator |
| policy | string | cabinetmatchedrulesequals, neq, isset, isnotset | Filter activities related to the specified policies |
| filename | string | eq | Filter files by filename |
| modifiedDate | timestamp | lte, gte, range, lte_ndays, gte_ndays | Filter files by the date they were last modified |
| createdDate | timestamp | lte, gte, range | Filter files by the date they were created |
| collaborators.entity | entity pk | eq, neq | Filter files shared with specified entities. Example: `[{ "id": "entity-id", "inst": 0 }]` |
| collaborators.domains | string | eq, neq | Filter files shared with specified domains |
| collaborators.groups | string | eq, neq | Filter files shared with specified groups |
| collaborators.withDomain | string | eq, neq, deq | Filter files shared with specified domains |
| owner.entity | entity pk | eq, neq | Filter files owned by specified entities. Example: `[{ "id": "entity-id", "saas": 11161, "inst": 0 }]` |
| owner.orgUnit | string | eq, neq | Filter files with owners from specified organizational units |
| sharing | integer | eq, neq | Filter files with the specified sharing levels. Possible values include:<br /><br />**4**: Public (Internet)<br />**3**: Public<br />**2**: External<br />**1**: Internal<br />**0**: Private |
| fileId | string | eq, neq | Filter files by file ID |
| fileLabels | string | eq, neq, isset, isnotset | Filter files containing the specified file labels (tags) IDs |
| fileScanLabels | string | eq, neq, isset, isnotset | Filter files containing the specified content inspection warnings (tags) IDs |
| extension | string | eq, neq | Filter files by a given file extension |
| mimeType | string | eq, neq | Filter files by a given MIME type, must be a single string |
| trashed | boolean | eq | Possible values include:<br /><br />**true**: Returns only trashed files<br />**false**: Returns nontrashed files |
| parentFolder | folder | eq, neq | Filter files contained in the specified folders |
| folder | boolean | eq | Possible values include:<br /><br />**true**: Returns only folders<br >**false**: Returns only files |
| quarantined | boolean | eq | Possible values include:<br /><br />**true**: Returns only quarantined files<br />**false**: Returns only nonquarantined files |
| snapshotLastModifiedDate | timestamp | lte, gte, range | Filter files by the date their snapshot was last modified |

[!INCLUDE [Open support ticket](includes/support.md)]
