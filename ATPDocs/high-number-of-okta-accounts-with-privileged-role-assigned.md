---
title: 'Security assessment: High number of Okta accounts with privileged role assigned'
description: Microsoft Defender for Identity security posture assessment on Okta. In this assessment, we recommend customers limit the number of Okta accounts with privileged roles assigned to the minimum required for their organization.
author:  izauer-bit  # GitHub alias
ms.author:   itaizauer
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 07/14/2025 
ms.reviewer: Itai Zauer
---

# Security assessment: High number of Okta accounts with privileged role assigned

This article describes the security risks associated with having a high number of Okta accounts with privileged roles assigned and provides recommendations for mitigating these risks.

> [!NOTE]
> This report lists Okta accounts with administrator roles - excluding Super Administrator, where the number of accounts assigned to these roles is higher than 25.  

## Why is a high number of Okta accounts with privileged roles considered a security risk?

A high number of users with privileged roles increases the risk of misuse or unauthorized access to critical systems. By reducing the number of users assigned to roles such as Super Admin or Org Admin, organizations can better limit access to sensitive resources and reduce the attack surface. Maintaining a smaller, set of privileged accounts ensures more effective governance and minimizes potential security vulnerabilities.   

## Remediation steps

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Highly privileged Okta API token" security assessment.
1. Review the list of exposed entities to discover which of your Okta accounts have privileged roles assigned.
1. Reduce the number of users assigned to privileged roles to meet the recommended best practices and ensure better control.

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)