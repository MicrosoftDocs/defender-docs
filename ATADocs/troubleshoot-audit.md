---
# required metadata

title: Working with ATA audit logs
description: This article describes how to work with ATA audit logs in the Windows Event Log.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 1d186a96-ef70-4787-aa64-c03d1db94ce0

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Working with ATA audit logs


[!INCLUDE [Banner for top of topics](includes/banner.md)]

The ATA audit logs are kept in the Windows Event Logs under **Applications and Services** and then **Microsoft ATA** both on the ATA Center and ATA Gateway machines.

The ATA Center audit log contains:
- Suspicious activity information
- Health alerts (health page)
- ATA Console logins
- All configuration changes*

The ATA Gateway audit log contains:
- Gateway configuration changes* 

(All ATA Gateway configuration changes are configured on the ATA Center but are still audited on the Gateway machine itself.)

*The configuration change audit log contains both the previous configuration and the new configuration.


## See Also
- [Working with suspicious activities](working-with-suspicious-activities.md)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
