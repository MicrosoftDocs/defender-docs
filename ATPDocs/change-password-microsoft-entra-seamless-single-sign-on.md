---
title: 'Change password for Microsoft Entra seamless SSO account '
description: This report lists all Microsoft Entra seamless SSO computer accounts with password last set over 90 days ago.
author:      LiorShapiraa # GitHub alias
ms.author:  liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     08/22/2024
---

# Security Assessment: Change password for Microsoft Entra seamless SSO account

This article describes Microsoft Defender for Identity's Microsoft Entra Seamless Single sign-on (SSO) account password change security posture assessment report.

> [!NOTE]
> This security assessment will be available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services and Sign on method as part of Microsoft Entra Connect configuration is set to single sign-on and the SSO computer account exists. Learn more about Microsoft Entra seamless sign-on [here](/entra/identity/hybrid/connect/how-to-connect-sso).
## Why might the Microsoft Entra seamless SSO computer account old password be a risk?

Microsoft Entra seamless SSO automatically signs in users when they're using their corporate desktops that are connected to your corporate network. Seamless SSO provides your users with easy access to your cloud-based applications without using any other on-premises components. When setting up Microsoft Entra Seamless SSO, a computer account named AZUREADSSOACC is created in Active Directory. By default, the password for this Azure SSO computer account is not automatically updated every 30 days. This password functions as a shared secret between AD and Microsoft Entra, enabling Microsoft Entra to decrypt Kerberos tickets used in the seamless SSO process between Active Directory and Microsoft Entra ID. If an attacker gains control of this account, they can generate service tickets for the AZUREADSSOACC account on behalf of any user and impersonate any user within the Microsoft Entra tenant that has been synchronized from Active Directory. This could allow an attacker to move laterally from Active Directory into Microsoft Entra ID.

## How do I use this security assessment to improve my hybrid organizational security posture?

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for __Change password for Microsoft Entra seamless SSO account.__

1. Review the list of exposed entities to discover which of your Microsoft Entra SSO computer accounts have a password more than 90 days old.

1. Take appropriate action on those accounts by following the steps described in [how to roll over the Entra SSO account password](https://aka.ms/RollOverAzureadssoAccount) article. 

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as __Completed__.
## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

- [Learn more about Defender for Identity Sensor for Microsoft Entra Connect](https://go.microsoft.com/fwlink/?linkid=2283653)

