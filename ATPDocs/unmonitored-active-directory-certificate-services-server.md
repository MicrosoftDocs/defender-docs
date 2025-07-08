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

This article describes the security posture assessment report for unmonitored Active Directory Certificate Services (AD CS) servers by Microsoft Defender for Identity.


## What risk do unmonitored ADCS servers pose to an organization?

Unmonitored Active Directory Certificate Services (AD CS) servers pose a significant risk to your organization’s identity infrastructure. AD CS, the backbone of certificate issuance and trust, is a high-value target for attackers aiming to escalate privileges or forge credentials. Without proper monitoring, attackers can exploit these servers to issue unauthorized certificates, enabling stealthy lateral movement and persistent access. Deploy Microsoft Defender for Identity version 2.0 sensors on all AD CS servers to mitigate this risk. These sensors provide real-time visibility into suspicious activity, detect advanced threats, and generate actionable alerts based on security events and network behavior.

> [!NOTE]
>  This security assessment is available only if Microsoft Defender for Endpoint detects an eligible AD CS server in the environment.

## How do I use this security assessment?

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your AD CS servers are unmonitored.

    :::image type="content" source="media/unmonitored-adcs-servers/recommended-actions-unmonitored-active-directory-certificate-services-servers.png" alt-text="Screenshot that shows the recommended actions for an unmonitored AD CS server." lightbox="media/unmonitored-adcs-servers/recommended-actions-unmonitored-active-directory-certificate-services-servers.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/defender-for-identity/deploy/active-directory-federation-services).

> [!NOTE]
> Assessment details update in near real time. However, scores and statuses refresh every 24 hours. The list of impacted entities updates within a few minutes of implementing recommendations, but the overall status might take longer to show as Completed.

## Next steps

Learn more about [Microsoft Secure Score](/defender-xdr/microsoft-secure-score).