---
# required metadata

title: Advanced Threat Analytics personal data policy
description: Provides links to information about how to delete private information and personal data from ATA.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 1b2d185c-62cd-45f0-b0dd-687b51317f32

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: ophirp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# ATA data security and privacy

[!INCLUDE [Banner for top of topics](includes/banner.md)]

[!INCLUDE [Handle personal data](../includes/gdpr-intro-sentence.md)]

## Searching for and identifying personal data

All data in ATA that relates to entities is derived from Active Directory (AD) and replicated to ATA from there. When searching for personal data, the first place you should consider searching is AD.

From the ATA Center, use the search bar to view the identifiable personal data that is stored in the database. Users can search for a specific user or device. Selecting the entity will open the user or device profile page. The profile provides you with the comprehensive details about the entity, it's history, and related network activity derived from AD.

## Updating personal data

Personal data about users and entities in ATA is derived from the user's object in your organization's AD. Because of this, any changes made to the user profile in AD are reflected in ATA.

## Deleting personal data

Although data in ATA is replicated and always updated from AD, when an entity is deleted in AD, the entity's data in ATA is maintained for purposes of security investigation.

To permanently delete user-related data from the ATA database, follow this procedure:

1. [Download](https://aka.ms/ata-gdpr-script) the MongoDB script (gdpr.js).  

1. Copy the script into the ATA folder (located at `"C:\Program Files\Microsoft Advanced Threat Analytics\Center\MongoDB`) and run the following command from the ATA Center machine:

Use the ATA GDPR database script to delete entities and delete entity activity data, as described in the following sections.

### Delete entities

This action permanently deletes an entity from the ATA database. To run this command, provide the command name `deleteAccount`, and the `SamName`, `UpnName` or `GUID` of the computer or username you wish to delete. For example:

`"C:\Program Files\Microsoft Advanced Threat Analytics\Center\MongoDB\bin\mongo.exe" ATA --eval "var params='deleteAccount,admin1@contoso.com';" GDPR.js`

Running this completely removes the entity with the UPN admin1@contoso.com from the database along with all the activities and security alerts associated with the entity.

### Delete entity activity data

This action permanently deletes an entity's activities data from the ATA database. All entities will are unchanged but the activities and security alerts related to them for the specified timeframe are deleted.

To run this command, provide the command name `deleteOldData`, and the number of days of data you want to keep in the database.

For example:

`"C:\Program Files\Microsoft Advanced Threat Analytics\Center\MongoDB\bin\mongo.exe" ATA --eval "var params='deleteOldData,30';" GDPR.js`

This script removes all data for all entity activities and security alerts from the database that are older than 30 days. You will retain only the last 30 days of data.

## Exporting personal data

Because the data related to entities in ATA is derived from AD, only a subset of that data is stored in the ATA database. For this reason, you should export entity-related data from AD.

ATA enables you to export to Excel all security-related information, which might include personal data.

## Opt-out of system-generated logs

ATA collects anonymized system-generated logs about each deployment and transmits this data over HTTPS to Microsoft servers. This data is used by Microsoft to help improve future versions of ATA.

For more information, see [Manage system-generated logs](manage-telemetry-settings.md).

To disable data collection:

1. Log in to the ATA Console, select the three dots in the toolbar and select **About**.
1. Uncheck the box for **Send us usage information to help improve your customer experience in the future**.

## Additional resources

- For information about ATA trust and compliance, see the [Service Trust portal](https://servicetrust.microsoft.com/ViewPage/GDPRGetStarted) and the [Microsoft 365 Enterprise GDPR Compliance site](/compliance/regulatory/gdpr).
