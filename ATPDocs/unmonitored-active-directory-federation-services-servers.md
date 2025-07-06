---
title: 'Security Assessment: Unmonitored ADFS servers'
description: 'This recommendation indicates whether there are unmonitored ADFS servers in your environment. The goal is to ensure that all ADFS servers are monitored by Microsoft Defender for Identity.'
author: LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     07/06/2025
ms.reviewer: LiorShapiraa
---

# Security Assessment: Unmonitored ADFS servers

This article describes Microsoft Defender for Identity's unmonitored Active Directory Federation Services (ADFS) servers security posture assessment report.

> [!NOTE]
>  This security assessment is only available if Microsoft Defender for Endpoint detected an eligible ADFS server in the environment.

## What risk do unmonitored ADFS servers pose to an organization?

Unmonitored Active Directory Federation Services (ADFS) servers represent a high-impact security blind spot. As the gateway for federated authentication and single sign-on, ADFS holds the keys to accessing cloud and on-premises resources. If compromised, attackers can issue forged tokens and impersonate any user—including privileged accounts—without triggering traditional alerts. This effectively bypasses MFA, conditional access, and other downstream controls. Without visibility into ADFS activity, these attacks can remain undetected for extended periods. Deploying Microsoft Defender for Identity sensors on ADFS servers enables real-time detection of suspicious behavior, helping to prevent token forgery, abuse of trust relationships, and stealthy lateral movement.

## How do I use this security assessment?

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your ADFS servers are unmonitored.

    :::image type="content" source="media/unmonitored-adfs-server/recommended-actions-unmonitored-active-directory-federation-services-server.png" alt-text="Screenshot that shows the recommended actions for an unmonitored ADFS server." lightbox="media/unmonitored-adfs-server/recommended-actions-unmonitored-active-directory-federation-services-server.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/defender-for-identity/deploy/active-directory-federation-services).

> [!NOTE]
> Assessment details are updated in near real time. However, scores and statuses are refreshed every 24 hours. The list of impacted entities is updated within a few minutes of implementing recommendations, but the overall status might take longer to show as Completed.

## Next steps

Learn more about [Microsoft Secure Score](/defender-xdr/microsoft-secure-score).