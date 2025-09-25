---
title: 'Security assessment: Highly privileged Okta API token'
description: Microsoft Defender for Identity security posture assessment on Okta. In this assessment, we recommend customers limit the use of highly privileged API tokens.
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 07/14/2025 
ms.reviewer: Himanch
---

# Security assessment: Highly privileged Okta API token

This article describes the security risks associated with highly privileged Okta API tokens and provides recommendations for mitigating these risks.

## Prerequisites

To use this security assessment, you must first connect your Okta instance in the Microsoft Defender portal.  
For setup instructions, see [Connect your Okta instance](/defender-for-identity/okta-integration#connect-okta-to-defender-for-identity).


## Why is a highly privileged Okta API token a security risk?

Okta’s API tokens inherit the permissions of the user who creates them. If a user with sensitive permissions generates an API token, it carries those permissions. Any API token created by a Super Admin has the same level of access as the Super Admin account. This can expose sensitive data and functionality to unauthorized users. If the token is stolen, it can grant the attacker access equivalent to the original user.

## Remediation steps

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Highly privileged Okta API token" security assessment.
1. Review the list of exposed entities to discover which of your Okta API tokens are highly privileged.
1. If the API token is no longer required, delete it to eliminate unnecessary exposure.

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
