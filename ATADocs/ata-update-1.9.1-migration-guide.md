---
# required metadata

title: Advanced Threat Analytics update to 1.9.1 migration guide
description: Procedure to update ATA to version 1.9.1
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 2946310a-8e4e-48fc-9450-fc9647efeb22

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: ort
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# ATA version 1.9.1

This article describes issues fixed in Update 1 for Microsoft Advanced Threat Analytics (ATA) version 1.9. The build number of this update is 1.9.7412.

## Fixed issues included in this update

- Possibility of migration failures between ATA version 1.8 to version 1.9 for large databases.
- When using the latest version of the Microsoft Edge browser, and switching users, the browser may hang.
- In some scenarios, the user profile page is missing Directory Data Information.
- When adding a user to the exclusion list for abnormal behavior detection, the exclusion isn't always applied. 
- Updated MongoDB database version.
- Inconsistent resync after an upgrade to version 1.9 of all Active Directory entities to ATA.
- Inconsistent exports of suspicious activities to Microsoft Excel. Occasional failure with error generation.  


## Improvements included in this update
- Changes required for Microsoft Accessibility Standards (MAS) certification.
- Includes additional performance and security fixes.

## Get this update

Updates for Microsoft Advanced Threat Analytics version 1.9 are available from Microsoft Update or by manual download.

### Microsoft Update
This update is available on Microsoft Update. For more information about how to use Microsoft Update, see [How to get an update through Windows Update](https://support.microsoft.com/help/3067639).

### Manual download
To get the stand-alone package for this update, go to the Microsoft Download Center website:
[Download the ATA 1.9 package now](https://www.microsoft.com/en-us/download/details.aspx?id=56725).

### Prerequisites
To install this update, you must have ATA version 1.9 (1.9.7312), Update 1 for ATA version 1.8 (1.8.6765), or ATA version 1.8 (1.8.6645) installed.

### Restart requirement
Your computer may require a restart after you apply this update.

### Update replacement information
This update replaces ATA version 1.9 (1.9.7312).


## See also

- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
- [ATA versions](ata-versions.md)
