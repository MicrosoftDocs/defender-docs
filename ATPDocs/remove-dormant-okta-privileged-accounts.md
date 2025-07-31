---
title: 'Security assessment: Remove dormant Okta privileged accounts'
description: Microsoft Defender for Identity security posture assessment on Okta. In this assessment, we recommend customers remove dormant Okta privileged user accounts not accessed for over 60 days.
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 07/14/2025 
ms.reviewer: Himanch
---

# Security assessment: Remove dormant Okta privileged accounts

This article describes the security risks associated with dormant Okta privileged accounts and provides recommendations for mitigating these risks.

## Prerequisites

To use this security assessment, you must first connect your Okta instance in the Microsoft Defender portal.  
For setup instructions, see [Connect your Okta instance](/defender-for-identity/okta-integration#connect-okta-to-defender-for-identity).


## Why is a dormant privileged account a security risk?

Dormant privileged accounts represent a significant security risk, as they can become targets for unauthorized access or misuse without detection. Deactivating or removing unused privileged accounts ensures that only active, monitored users have access to critical administrative capabilities.

## Remediation steps

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Remove dormant Okta privileged accounts" security assessment.
1. Review the list of exposed entities to identify Okta privileged user accounts not used in the last 90 days. This inactivity indicates that the account might be a dormant account or no longer needed.
1. If the account is no longer required, deactivate or remove it to eliminate unnecessary exposure.

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
