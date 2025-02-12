---
title: 'Security assessment: Remove unnecessary replication permissions for Microsoft Entra Connect connector account'
description: 'Security assessment: Remove unnecessary replication permissions for Microsoft Entra Connect connector account'
author:      LiorShapiraa # GitHub alias
ms.author:   liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     08/12/2024
---

# Security Assessment: Remove unnecessary replication permissions for Microsoft Entra Connect AD DS Connector account

This article describes Microsoft Defender for Identity's unnecessary replication permissions for Microsoft Entra Connect (also known as Azure AD Connect) AD DS Connector account security posture assessment report.

> [!NOTE]
> This security assessment will be available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services.
> 
> Additionally, if the Password Hash Sync (PHS) sign-on method is set up, AD DS Connector accounts with replication permissions won't be affected because those permissions are necessary.

## Why might the Microsoft Entra Connect AD DS Connector account with unnecessary replication permissions be a risk?

Smart attackers are likely to target Microsoft Entra Connect in on-premises environments, and for good reason. The Microsoft Entra Connect server can be a prime target, especially based on the permissions assigned to the AD DS Connector account (created in on-premises AD with the MSOL_ prefix). In the default 'express' installation of Microsoft Entra Connect, the connector service account is granted replication permissions, among others, to ensure proper synchronization. If Password Hash Sync isn’t configured, it’s important to remove unnecessary permissions to minimize the potential attack surface.

## How do I use this security assessment to improve my hybrid organizational security posture?

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Remove unnecessary replication permissions for __Microsoft Entra Connect AD DS Connector account.__

1. Review the list of exposed entities to discover which of your AD DS Connector accounts have unnecessary replication permissions.

1. Take appropriate action on those accounts and remove their 'Replication Directory Changes' and 'Replication Directory Changes All' permissions by unchecking the following permissions:  
  
![Screenshot of the replication permissions.](media/remove-replication-permissions-microsoft-entra-connect/permissions.png)

> [!IMPORTANT]
> For environments with multiple Microsoft Entra Connect servers, it’s crucial to install sensors on each server to ensure Microsoft Defender for Identity can fully monitor your setup. It has been detected that your Microsoft Entra Connect configuration does not utilize Password Hash Sync, which means that replication permissions are not necessary for the accounts in the Exposed Entities list. Additionally, it’s important to ensure that each exposed MSOL account is not required for Replication Permissions by any other applications.

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as __Completed__.
>

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Learn more about Defender for Identity Sensor for Microsoft Entra Connect](https://aka.ms/MdiSensorForMicrosoftEntraConnectInstallation)


