---
title: 'Security assessment: Limit the number of Okta Super Admin accounts'
description: Microsoft Defender for Identity security posture assessment on Okta. In this assessment, we recommend customers limit the number of Super Admin accounts to the minimum required for their organization.
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 07/14/2025 
ms.reviewer: Himanch
---

# Security assessment: Limit the number of Okta Super Admin accounts

This report lists Okta accounts with Super Administrator role, where the number of users assigned to this role is greater than 5.

## Prerequisites

To use this security assessment, you must first connect your Okta instance in the Microsoft Defender portal.  
For setup instructions, see [Connect your Okta instance](/defender-for-identity/okta-integration#connect-okta-to-defender-for-identity).


## Why is having too many Super Admin accounts a security risk?

A high number of users with privileged roles increases the risk of misuse or unauthorized access to critical systems. By reducing the number of users assigned to roles such as Super Admin or Org Admin, organizations can better limit access to sensitive resources and reduce the attack surface. Maintaining a smaller, set of privileged accounts ensures more effective governance and minimizes potential security vulnerabilities.

## Remediation steps

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Limit the number of Okta Super Admin accounts" security assessment.
1. Review the list of exposed entities to discover which of your Okta accounts have Super Admin role assigned.
1. Limit Super Administrator access to the minimum number of users necessary to maintain control over highest level of privileged access.

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
