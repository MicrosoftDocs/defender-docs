---
title: 'Security assessment: Assign multifactor authentication to Okta privileged user accounts'
description: Microsoft Defender for Identity security posture assessment on Okta. In this assessment, we recommend customers assign multifactor authentication (MFA) to Okta privileged user accounts.
ms.service: microsoft-defender-for-identity
ms.topic: article
# ms.prod:   microsoft-defender-for-identity
ms.date: 07/14/2025 
ms.reviewer: Himanch
---

# Security assessment: Assign multifactor authentication to Okta privileged user accounts

This report lists any Okta privileged accounts that don't have any multifactor authentication (MFA) methods assigned. 

## Prerequisites

To use this security assessment, you must first connect your Okta instance in the Microsoft Defender portal.  
For setup instructions, see [Connect your Okta instance](/defender-for-identity/okta-integration#connect-okta-to-defender-for-identity).

## Why is a privileged account without MFA a security risk?

All privileged accounts should have multifactor authentication (MFA) enabled to strengthen security. By ensuring that privileged accounts such as Super Admin or Org Admin roles are secured with MFA, organizations can significantly reduce the risk of unauthorized access from compromised credentials. This strategy helps prevent attackers from gaining elevated access, safeguarding sensitive resources and protecting critical administrative functions from abuse.


## Remediation steps

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Assign multifactor authentication for Okta privileged user accounts" security assessment.
1. Review the list of exposed entities to discover which of your Okta privileged user accounts don't have any MFA method assigned.
1. Assign and enforce a multifactor authentication (MFA) method to the privileged accounts.

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
