---
# required metadata

title: Advanced Threat Analytics update to 1.9.3 migration guide
description: Procedure to update ATA to version 1.9.3
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

# ATA version 1.9.3

We're happy to announce the availability of Microsoft Advanced Threat Analytics 1.9 Update 3.

This article describes issues fixed in Update 3 of Microsoft Advanced Threat Analytics (ATA) version 1.9. The build number of this update is 1.9.7576.

## Improvements included in this update

- Upgraded MongoDB to version 3.6.18 for improved supportability and security updates.
- Upgraded BootStrap and jQuery npm packages to version 3.4.1 for security updates.
- Portal accessibility features improved.
- Increased advance notice for Center certificate expiration to three months prior to expiration (previously three weeks). Additionally, the notice now provides a clearer description of the severity of failing to renew the certificate.
- Improved details provided with credential verification errors when testing Directory Services connections.
- Error log now contains more detailed information if there are Performance Counter related issues.
- Deployment log now contains more detailed information regarding connection issues during Gateway deployment.
- General performance improvements.

## Fixed issues included in this update

- Fixes an issue in which the Security log permissions are not set correctly for some deployments.
- Fixes an issue in which some translations are missing for some languages.
- Fixes an issue in which an error message might appear when you browse an account profile page.
- Fixes an issue in which some accessibility features don't work correctly.

## How to get this update

Updates for Microsoft ATA are available from Microsoft Update or by manual download.

### Microsoft Update

This update is available on Microsoft Update. For more information about how to use Microsoft Update, see [How to get an update through Windows Update](https://support.microsoft.com/help/3067639).

### Microsoft Download Center

To get the stand-alone package for this update, go to the Microsoft Download Center website: [Download the ATA 1.9.3 package now](https://www.microsoft.com/download).

### Prerequisites

To install this update, you must have one of the following versions of ATA already installed:

- Update 2 for ATA 1.9 (version 1.9.7478)
- Update 2 for ATA 1.9 (version 1.9.7475)
- Update 1 for ATA 1.9 (version 1.9.7412)
- ATA 1.9 (version 1.9.7312)
- Update 1 for ATA 1.8 (version 1.8.6765)
- ATA 1.8 (version 1.8.6645)

### Restart requirement

Your computer may require a restart after applying this update.

### Update replacement information

This update replaces Update 2 for ATA 1.9 (version 1.9.7478).

## See also

- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
- [ATA versions](ata-versions.md)
