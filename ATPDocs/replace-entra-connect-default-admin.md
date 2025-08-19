---
title:       'Security assessment: Replace Enterprise or Domain Admin account for Entra Connect AD DS Connector account'
description: 'This report lists any Entra Connect AD DS Connector account that is an Enterprise Administrator or Domain Administrator.'
author:      LiorShapiraa # GitHub alias
ms.author:   Liorshapira # Microsoft alias
# ms.prod:   microsoft-defender-for-identity
ms.topic:    article
ms.date:     03/16/2025
ms.reviewer: LiorShapiraa
---

# Security assessment: Replace Enterprise or Domain Admin account for Entra Connect AD DS Connector account

This article describes Microsoft Defender for Identity's Microsoft Entra Connect AD DS Connector account default admin security posture assessment report.

> [!NOTE]
> This security assessment will be available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services.

## Why might using an Enterprise or Domain Admin account for the Microsoft Entra Connect AD DS Connector be a risk?

Smart attackers often target Microsoft Entra Connect in on-premises environments due to the elevated privileges associated with its AD DS Connector account (typically created in Active Directory with the MSOL_ prefix). Using an **Enterprise Admin** or **Domain Admin** account for this purpose significantly increases the attack surface, as these accounts have broad control over the directory.

Starting with [Entra Connect build 1.4.###.#](/entra/identity/hybrid/connect/reference-connect-accounts-permissions), Enterprise Admin and Domain Admin accounts can no longer be used as the AD DS Connector account. This best practice prevents over-privileging the connector account, reducing the risk of domain-wide compromise if the account is targeted by attackers. Organizations must now create or assign a lower-privileged account specifically for directory synchronization, ensuring better adherence to the principle of least privilege and protecting critical admin accounts.

## How do I use this security assessment to improve my hybrid organizational security posture?

1. Review the recommended action at[ https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Replace Enterprise or Domain Admin account for Entra Connect AD DS Connector account.

1. Review the exposed accounts and their group memberships. The list contains members of Domain/Enterprise Admins through direct and recursive membership.

1. Perform one of the following actions:

   - Remove MSOL_ user account user from privileged groups, ensuring it retains the necessary permissions to function as the Entra Connect Connector account.
   
   - Change the Entra Connect AD DS Connector account (MSOL_) to a lower-privileged account. 
   
> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.

## Next steps

- Learn more about [Microsoft Secure score]().

- Learn more about [Defender for Identity Sensor for Microsoft Entra Connect](https://aka.ms/MdiSensorForMicrosoftEntraConnectInstallation)

