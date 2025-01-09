---
# required metadata

title: Advanced Threat Analytics update to 1.9.2 migration guide
description: Procedure to update ATA to version 1.9.2
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

# ATA version 1.9.2

We’re happy to announce the availability of Microsoft Advanced Threat Analytics 1.9 Update 2.

This article describes issues fixed in Update 2 of Microsoft Advanced Threat Analytics (ATA) version 1.9. The build number of this update is 1.9.7478.

## Improvements included in this update

This update includes Windows Server 2019 (Including Core versions but not Nano) as a supported operating system for both the Center, Gateway and Lightweight gateway components.

This update also includes performance and stability improvements along with fixes for issues reported by customers.

## Fixed issues included in this update

- Fixes an issue in which directory data display shows direct manager and recursive memberships.
- Fixes an issue in which the ATA Center URL configuration does not always show local IPs or the local machine name.
- Fixes a health alert download issue when the health alert contains a non-existent gateway.
- Fixes translation issues.
- Fixes an issue in which the MongoDB database version was not updated.
- Fixes a rare scenario in which high memory issues occurred during Active Directory sync.
- Fixes a rare scenario in which the console only allowed selection of an unsupported certificate.
- Fixes a rare scenario in which a false positive instance of the “Suspicion of identity theft based on abnormal behavior” message was received.
- Fixes a rare case in which timeline jumping occurred when alerts were auto-updated.

## Get this update

To get the stand-alone package for this update, go to the Microsoft Download Center website:
[Download the ATA 1.9.2 package now](https://www.microsoft.com/en-us/download/details.aspx?id=56725).

### Prerequisites

To install this update, you must have one of the following versions of ATA already installed: 
- Update 1 for ATA 1.9 (version 1.9.7412)
- ATA 1.9 (version 1.9.7312)
- Update 1 for ATA 1.8 (version 1.8.6765)
- ATA 1.8 (version 1.8.6645)

### Restart requirement

Your computer may require a restart after applying this update.

### Update replacement information

This update replaces ATA version 1.9.1 (1.9.7412).


## See also

- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
- [ATA versions](ata-versions.md)
