---
title: 'Security assessment: Rotate password for Microsoft Entra Connect connector account '
description: Microsoft Defender for Identity security posture assessment on Microsoft Entra Connect. In this assessment we recommend customers change the password of MSOL accounts with password last set over 90 days ago.
author:      LiorShapiraa # GitHub alias
ms.author:   liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     08/12/2024
---

# Security assessment: Rotate password for Microsoft Entra Connect AD DS Connector account

This article describes Microsoft Defender for Identity's Microsoft Entra Connect AD DS Connector account password rotation security posture assessment report.

> [!NOTE]
> This security assessment will be available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services. 
## Why might the Microsoft Entra Connect Connector account old password be a risk?

Smart attackers are likely to target Microsoft Entra Connect in on-premises environments, and for good reason. The Microsoft Entra Connect server can be a prime target, especially based on the permissions assigned to the AD DS Connector account (created in on-premises AD with the MSOL_ prefix).

This report lists all MSOL accounts in your organization with password last set over 90 days ago. It's important to change the password of MSOL accounts every 90 days to prevent attackers from allowing use of the high privileges that the connector account typically holds - replication permissions, reset password and so on.

##   How do I use this security assessment to improve my hybrid organizational security posture?

1. Review the recommended action at[ https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for **Rotate password for Microsoft Entra Connect AD DS Connector account.  

1. Review the list of exposed entities to discover which of your AD DS Connector accounts have a password more than 90 days old.

1. Take appropriate action on those accounts by following the steps on [how to change the AD DS Connector account password](https://aka.ms/MicrosoftEntraIdPasswordChangeSyncService).

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.
## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

- [Learn more about Defender for Identity Sensor for Microsoft Entra Connect](https://aka.ms/MdiSensorForMicrosoftEntraConnectInstallation)

