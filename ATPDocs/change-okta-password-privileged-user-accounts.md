---
title: 'Security assessment: Change password for Okta privileged User accounts'
description: Microsoft Defender for Identity security posture assessment on Okta. In this assessment, we recommend customers change the password of Okta privileged user accounts with password last set over 180 days ago.
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     07/14/2025 
ms.reviewer: Himanch
---

# Security assessment: Change password for Okta privileged User accounts

This recommendation lists any Okta privileged accounts that use outdated passwords that were last set over 180 days ago.  

## Prerequisites

To use this security assessment, you must first connect your Okta instance in the Microsoft Defender portal.  
For setup instructions, see [Connect your Okta instance](/defender-for-identity/okta-integration#connect-okta-to-defender-for-identity).

## Why is a privileged account with an old password a security risk?

Privileged accounts with old passwords create a significant security risk, as older credentials are more likely to be exposed through data breaches or other attack vectors. Enforcing regular password updates for privileged accounts reduces the likelihood of unauthorized access and strengthens overall security. Applying stringent password policies to accounts with elevated privileges protects sensitive resources and lowers the risk of exploitation.

## Remediation steps

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Change password for Okta privileged User accounts" security assessment.
1. Review the list of exposed entities to discover which of your Okta privileged user accounts have an old password.
1. Take appropriate action on those accounts by resetting their password.  

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
