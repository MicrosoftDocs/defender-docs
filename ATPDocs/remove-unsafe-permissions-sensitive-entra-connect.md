---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: 'Security assessment: Remove unsafe permissions on sensitive Microsoft Entra Connect accounts'
description: This report lists any sensitive AD DS Connector (MSOL_) accounts or Microsoft Entra Seamless SSO computer account (AZUREADSSOACC) with unsafe permissions.
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     03/16/2025
ms.reviewer: LiorShapiraa
---

# Security assessment: Remove unsafe permissions on sensitive Entra Connect accounts

This article describes Microsoft Defender for Identity's Microsoft Entra Connect accounts unsafe permissions security posture assessment report.

> [!NOTE]
> This security assessment will be available only if Microsoft Defender for Identity sensor is installed on servers running Microsoft Entra Connect services and Sign on method as part of Microsoft Entra Connect configuration is set to single sign-on and the SSO computer account exists. Learn more about Microsoft Entra seamless sign-on **[here](/entra/identity/hybrid/connect/how-to-connect-sso)**.

## How can unsafe permissions on Microsoft Entra Connect accounts expose your hybrid identity to risk?

Microsoft Entra Connect accounts like AD DS Connector account (also known as MSOL_) and Microsoft Entra Seamless SSO computer account (AZUREADSSOACC) have powerful privileges, including replication and password reset rights. If these accounts are granted unsafe permissions, attackers could exploit them to gain unauthorized access, escalate privileges, or take control of hybrid identity infrastructure. This could lead to account takeovers, unauthorized directory modifications, and a broader compromise of both on-premises and cloud environments.

## How do I use this security assessment to improve my hybrid organizational security posture?

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.

1. Review the recommended action at[ https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Remove unsafe permissions on sensitive Entra Connect accounts.

1. Review the list of exposed entities to identify accounts with unsafe permissions. For example:

    :::image type="content" source="media/remove-unsafe-permissions-sensitive-entra-connect/screenshot-of-exposed-entities.png" alt-text="Screenshot of exposed entities" lightbox="media/remove-unsafe-permissions-sensitive-entra-connect/screenshot-of-exposed-entities.png":::

1. If you click on "Click to expend" you can find more details about the granted permissions. For example:  

    :::image type="content" source="media/remove-unsafe-permissions-sensitive-entra-connect/screenshot-of-excessive-permissions.png" alt-text="Screenshot of excessive permissions" lightbox="media/remove-unsafe-permissions-sensitive-entra-connect/screenshot-of-excessive-permissions.png":::

1. For each exposed account, remove problematic permissions that allow unprivileged accounts to takeover critical hybrid assets.


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

- [Learn more about Defender for Identity Sensor for Microsoft Entra Connect](https://aka.ms/MdiSensorForMicrosoftEntraConnectInstallation)

