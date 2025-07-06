---
title: 'Security Assessment: Unmonitored ADCS servers'
description: 'This recommendation indicates whether there are unmonitored ADCS servers in your environment. The goal is to ensure that all ADCS servers are monitored by Microsoft Defender for Identity.'
author: LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     07/06/2025
ms.reviewer: LiorShapiraa
---

# Security Assessment: Unmonitored ADCS servers

This article describes Microsoft Defender for Identity's unmonitored Active Directory Certificate Services (ADCS) servers security posture assessment report.

> [!NOTE]
>  This security assessment will only be available if Microsoft Defender for Endpoint has detected eligible ADCS servers in the environment.

## What risk do unmonitored ADCS servers pose to an organization?

Unmonitored Active Directory Certificate Services (AD CS) servers pose a significant risk to an organization’s identity infrastructure. As the backbone of certificate issuance and trust, AD CS is a high-value target for attackers aiming to escalate privileges or forge credentials. Without proper monitoring, these servers can be exploited to issue unauthorized certificates, enabling stealthy lateral movement and persistent access. Deploying Microsoft Defender for Identity version 2 sensors on all Active Directory Certificate Services (AD CS) servers helps mitigate this risk by providing real-time visibility into suspicious activity, detecting advanced threats, and generating actionable alerts based on security events and network behavior.

## How do I use this security assessment?

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions to discover which of your ADCS servers are unmonitored.

    :::image type="content" source="unmonitored-adcs-servers/recommended-actions-unmonitored-adcs-servers.png" alt-text="Screenshot that shows the recommended action for an ADCS server." lightbox="unmonitored-adcs-servers/recommended-actions-unmonitored-adcs-servers.png":::

1. Go to the **Microsoft Defender portal > Settings > Identities > Sensors**. You can view the already installed sensors in your environment and download the install package to deploy them on your remaining servers.
1. Take appropriate action on those servers by [configuring monitoring sensors](/deploy/active-directory-federation-services.md).

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours. The list of impacted entities is updated within a few minutes of you implementing the recommendations. The status might still take time until it's marked as Completed.

## Next steps

Learn more about [Microsoft Secure Score](/defender-xdr/microsoft-secure-score).