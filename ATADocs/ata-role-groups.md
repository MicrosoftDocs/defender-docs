---
# required metadata

title: Advanced Threat Analytics role groups for access management
description: Walks you through working with ATA role groups.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 3715b69e-e631-449b-9aed-144d0f9bcee7

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# ATA Role Groups


[!INCLUDE [Banner for top of topics](includes/banner.md)]

Role groups enable access management for ATA. Using role groups, you can segregate duties within your security team, and grant only the amount of access that users need to perform their jobs. This article explains access management and ATA role authorization, and helps you get up and running with role groups in ATA.

> [!NOTE]
> Any local administrator on the ATA Center is automatically a Microsoft Advanced Threat Analytics Administrator.

## Types of ATA Role Groups 

ATA introduces three types of Role group: ATA Administrators, ATA Users, and ATA Viewers. The following table describes the type of access in ATA available per role. Depending on which role you assign, various screens and menu options in ATA are not available, as follows:

|Activity |Microsoft Advanced Threat Analytics Administrators|Microsoft Advanced Threat Analytics Users|Microsoft Advanced Threat Analytics Viewers|
|----|----|----|----|
|Login|Available|Available|Available|
|Provide Input for Suspicious Activities|Available|Available|Not available|
|Change status of Suspicious Activities|Available|Available|Not available|
|Share/Export suspicious activity via email/get link|Available|Available|Not available|
|Change status of Health Alerts|Available|Available|Not available|
|Update ATA Configuration|Available|Not available|Not available|
|Gateway – Add|Available|Not available|Not available|
|Gateway – Delete |Available|Not available|Not available|
|Monitored DC – Add |Available|Not available|Not available|
|Monitored DC – Delete|Available|Not available|Not available|
|View alerts and suspicious activities|Available|Available|Available|


When users try to access a page that is not available for their role group, they are redirected to the ATA unauthorized page. 

## Add \ Remove users - ATA Role Groups 

ATA uses the local Windows groups as a basis for role groups. The role groups must be managed on the ATA Center server.
To add or remove users, use the **Local Users and Groups** MMC (Lusrmgr.msc). On a domain joined machine, you can add domain accounts as well as local accounts. 

