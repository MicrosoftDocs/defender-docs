---
title: 'Security Assessment: Unmonitored Microsoft Entra Connect servers'
description: 'Detect unmonitored Microsoft Entra Connect servers and deploy Defender for Identity sensors to protect your hybrid identity infrastructure from privilege escalation.'
author: LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     07/06/2025
ms.reviewer: LiorShapiraa
---


# Security Assessment: Unmonitored Microsoft Entra Connect servers

This article describes the Microsoft Defender for Identity's unmonitored Microsoft Entra Connect servers security posture assessment report.

## What risk do unmonitored Microsoft Entra Connect servers pose to an organization? 

Unmonitored Microsoft Entra Connect servers (formerly Azure AD Connect) pose a significant security risk in hybrid identity environments. These servers synchronize identities between on-premises Active Directory and Entra ID. They can introduce, modify, or remove accounts and attributes that directly affect cloud access.

If an attacker compromises a Microsoft Entra Connect server, they can inject shadow admins, manipulate group memberships, or sync malicious changes into the cloud without triggering traditional alerts.

These servers operate at the intersection of on-premises and cloud identity, making them a prime target for privilege escalation and stealthy persistence. Without monitoring, such attacks can go undetected. Deploying Microsoft Defender for Identity version 2.0 sensors on Microsoft Entra Connect servers is critical. These sensors help detect suspicious activity in real time, protect the integrity of your hybrid identity bridge, and prevent full-domain compromise from a single point of failure.

> [!NOTE]
> This security assessment is only available if Microsoft Defender for Endpoint detects eligible Microsoft Entra Connect servers in the environment.

## How do I use this security assessment? 

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your Microsoft Entra Connect servers are unmonitored.

    :::image type="content" source="media/unmonitored-entra-connect-servers/recommended-actions-unmonitored-entra-connect-server.png" alt-text="Screenshot that shows the recommended actions for an unmonitored Entra Connect server." lightbox="media/unmonitored-entra-connect-servers/recommended-actions-unmonitored-entra-connect-server.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/defender-for-identity/deploy/active-directory-federation-services).

> [!NOTE]
> Assessment details are updated in near real time. However, scores and statuses are refreshed every 24 hours. The list of impacted entities is updated within a few minutes of implementing recommendations, but the overall status might take longer to show as completed.

## Next steps

Learn more about [Microsoft Secure Score](/defender-xdr/microsoft-secure-score).