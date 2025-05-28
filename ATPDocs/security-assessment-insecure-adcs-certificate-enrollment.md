---
title: Identify insecure AD CS certificate enrollment IIS endpoints (ESC8)| Microsoft Defender for Identity
description: This article provides an overview of Microsoft Defender for Identity's 'Edit insecure ADCS certificate enrollment IIS endpoints (ESC8)' identity security posture assessment report.
ms.date: 03/04/2024
ms.topic: how-to
---

# Security assessment: Edit insecure ADCS certificate enrollment IIS endpoints (ESC8)

This article describes Microsoft Defender for Identity's **Edit insecure ADCS certificate enrollment IIS endpoints** identity security posture assessment report.

## What are insecure AD CS certificate enrollment IIS endpoints?

Active Directory Certificate Services (AD CS) supports certificate enrollment through various methods and protocols, including enrollment via HTTP using the Certificate Enrollment Service (CES) or the Web Enrollment interface (Certsrv).

If the IIS endpoint allows NTLM authentication without enforcing protocol signing (HTTPS) or without enforcing Extended Protection for Authentication (EPA), it becomes vulnerable to NTLM relay attacks (ESC8). Relay attacks can lead to complete domain takeover if an attacker manages to pull it off successfully.

## Prerequisites

This assessment is available only to customers who have installed a sensor on an AD CS server. For more information, see [Configuring sensors for AD FS and AD CS](deploy/active-directory-federation-services.md).

## How do I use this security assessment to improve my organizational security posture?

Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for insecure AD CS certificate enrollment IIS endpoints.

The assessment lists the problematic HTTP endpoints in your organization and guidance to configuring the endpoints securely.

Once handled, the ESC8 attack risk is mitigated, reducing your attack surface significantly.

[!INCLUDE [secure-score-note](../includes/secure-score-note.md)]


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
