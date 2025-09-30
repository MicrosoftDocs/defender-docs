---
title: 'Security assessment: High number of Okta accounts with privileged role assigned'
description: Microsoft Defender for Identity security posture assessment on Okta. In this assessment, we recommend customers limit the number of Okta accounts with privileged roles assigned to the minimum required for their organization.
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 07/14/2025 
ms.reviewer: Himanch
---

# Security assessment: High number of Okta accounts with privileged role assigned

This article describes the security risks associated with having a high number of Okta accounts with privileged roles assigned and provides recommendations for mitigating these risks.

> [!NOTE]
> This report lists Okta accounts with administrator roles - excluding Super Administrator, where the number of accounts assigned to these roles is greater than 25.  

## Prerequisites

To use this security assessment, you must first connect your Okta instance in the Microsoft Defender portal.  
For setup instructions, see [Connect your Okta instance](/defender-for-identity/okta-integration#connect-okta-to-defender-for-identity).


## Why is a high number of Okta accounts with privileged roles considered a security risk?

A high number of users with privileged roles increases the risk of misuse or unauthorized access to critical systems. By reducing the number of users assigned to roles such as Super Admin or Org Admin, organizations can better limit access to sensitive resources and reduce the attack surface. Maintaining a smaller, set of privileged accounts ensures more effective governance and minimizes potential security vulnerabilities.

## Remediation steps

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "High number of Okta accounts with privileged role assigned" security assessment.
1. Review the list of exposed entities to discover which of your Okta accounts have privileged roles assigned.
1. Reduce the number of users assigned to administrator roles (other than Super-Admin) to the minimum necessary to ensure better control and align with least privilege best practices.

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
