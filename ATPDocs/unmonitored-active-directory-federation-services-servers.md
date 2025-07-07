---
title: 'Security Assessment: Unmonitored ADFS servers'
description: 'Identify unmonitored ADFS servers and deploy Defender for Identity sensors to reduce risk.'
author: LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     07/06/2025
ms.reviewer: LiorShapiraa
---

# Security Assessment: Unmonitored ADFS servers

This article describes the Microsoft Defender for Identity's unmonitored Active Directory Federation Services (ADFS) servers security posture assessment report.

## What risk do unmonitored ADFS servers pose to an organization?

Unmonitored Active Directory Federation Services (ADFS) servers are a significant security risk to organizations. ADFS controls access to both cloud and on-premises resources as the gateway for federated authentication and single sign-on. If attackers compromise an ADFS server, they can issue forged tokens and impersonate any user, including privileged accounts. Such attacks might bypass multi-factor authentication (MFA), conditional access, and other downstream security controls, making them particularly dangerous. Without proper monitoring, suspicious activity on ADFS servers might go undetected for extended periods. Deploying Microsoft Defender for Identity version 2.0 sensors on ADFS servers is essential. These sensors enable real-time detection of suspicious behavior and help prevent token forgery, abuse of trust relationships, and stealthy lateral movement within the environment.

> [!NOTE]
> This security assessment is only available if Microsoft Defender for Endpoint detects an eligible ADFS server in the environment.


## How do I use this security assessment?

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your ADFS servers are unmonitored.

    :::image type="content" source="media/unmonitored-adfs-server/recommended-actions-unmonitored-active-directory-federation-services-server.png" alt-text="Screenshot that shows the recommended actions for an unmonitored ADFS server." lightbox="media/unmonitored-adfs-server/recommended-actions-unmonitored-active-directory-federation-services-server.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/defender-for-identity/deploy/active-directory-federation-services).

> [!NOTE]
> Assessment details are updated in near real time. However, scores and statuses are refreshed every 24 hours. The list of impacted entities is updated within a few minutes of implementing recommendations, but the overall status might take longer to show as Completed.

## Next steps

Learn more about [Microsoft Secure Score](/defender-xdr/microsoft-secure-score).