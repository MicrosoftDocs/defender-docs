---
title: 'Security Assessment: Unmonitored ADCS servers'
description: 'Detect unmonitored ADCS servers and deploy Defender for Identity sensors to help prevent unauthorized certificate issuance and privilege escalation.'
author: LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     07/06/2025
ms.reviewer: LiorShapiraa
---

# Security Assessment: Unmonitored ADCS servers

This article describes Microsoft Defender for Identity's unmonitored Active Directory Certificate Services (ADCS) servers security posture assessment report.


## What risk do unmonitored ADCS servers pose to an organization?

Unmonitored Active Directory Certificate Services (AD CS) servers pose a significant risk to an organization’s identity infrastructure. As the backbone of certificate issuance and trust, AD CS is a high-value target for attackers aiming to escalate privileges or forge credentials. Without proper monitoring, these servers can be exploited to issue unauthorized certificates, enabling stealthy lateral movement and persistent access. Deploying Microsoft Defender for Identity version 2.0 sensors on all AD CS servers helps mitigate this risk by providing real-time visibility into suspicious activity, detecting advanced threats, and generating actionable alerts based on security events and network behavior.

> [!NOTE]
>  This security assessment is only available if Microsoft Defender for Endpoint detected an eligible ADCS server in the environment.

## How do I use this security assessment?

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your AD CS servers are unmonitored.

    :::image type="content" source="media/unmonitored-adcs-servers/recommended-actions-unmonitored-active-directory-certificate-services-servers.png" alt-text="Screenshot that shows the recommended actions for an unmonitored AD CS server." lightbox="media/unmonitored-adcs-servers/recommended-actions-unmonitored-active-directory-certificate-services-servers.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/defender-for-identity/deploy/active-directory-federation-services).

> [!NOTE]
> Assessment details are updated in near real time. However, scores and statuses are refreshed every 24 hours. The list of impacted entities is updated within a few minutes of implementing recommendations, but the overall status might take longer to show as Completed.

## Next steps

Learn more about [Microsoft Secure Score](/defender-xdr/microsoft-secure-score).