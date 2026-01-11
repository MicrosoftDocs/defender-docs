---
title: 'Security assessments for cloud identities'
description: Microsoft Defender for Identity security posture assessment on Okta. In this assessment, we recommend customers review their cloud identities for potential security risks.
ms.service: microsoft-defender-for-identity
ms.topic: article
# ms.prod:   microsoft-defender-for-identity
ms.date: 07/14/2025
ms.reviewer: Himanch
---

# Security assessments for cloud identities

This article describes the various security assessments available in Microsoft Defender for Identity related to cloud identities, specifically Okta. Each assessment highlights potential security risks and provides recommendations for mitigating these risks.

## Prerequisites

To use these security assessments, you must first connect your Okta instance in the Microsoft Defender portal.  
For setup instructions, see [Connect your Okta instance](/defender-for-identity/okta-integration#connect-okta-to-defender-for-identity).

## Assign multifactor authentication to Okta privileged user accounts

**Description**

This report lists any Okta privileged accounts that don't have any multifactor authentication (MFA) methods assigned. 

All privileged accounts should have multifactor authentication (MFA) enabled to strengthen security. By ensuring that privileged accounts such as Super Admin or Org Admin roles are secured with MFA, organizations can significantly reduce the risk of unauthorized access from compromised credentials. This strategy helps prevent attackers from gaining elevated access, safeguarding sensitive resources and protecting critical administrative functions from abuse.


**Implementation**


1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Assign multifactor authentication for Okta privileged user accounts" security assessment.
1. Review the list of exposed entities to discover which of your Okta privileged user accounts don't have any MFA method assigned.
1. Assign and enforce a multifactor authentication (MFA) method to the privileged accounts.


## Change password for Okta privileged User accounts

**Description**

This recommendation lists any Okta privileged accounts that use outdated passwords that were last set over 180 days ago.  

**Impact**

Privileged accounts with old passwords create a significant security risk, as older credentials are more likely to be exposed through data breaches or other attack vectors. Enforcing regular password updates for privileged accounts reduces the likelihood of unauthorized access and strengthens overall security. Applying stringent password policies to accounts with elevated privileges protects sensitive resources and lowers the risk of exploitation.

**Implementation**


1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Change password for Okta privileged User accounts" security assessment.
1. Review the list of exposed entities to discover which of your Okta privileged user accounts have an old password.
1. Take appropriate action on those accounts by resetting their password. 



## High number of Okta accounts with privileged role assigned


This article describes the security risks associated with having a high number of Okta accounts with privileged roles assigned and provides recommendations for mitigating these risks.

**Description**

This report lists Okta accounts with administrator roles - excluding Super Administrator, where the number of accounts assigned to these roles is greater than 25.  

**User impact**

A high number of users with privileged roles increases the risk of misuse or unauthorized access to critical systems. By reducing the number of users assigned to roles such as Super Admin or Org Admin, organizations can better limit access to sensitive resources and reduce the attack surface. Maintaining a smaller, set of privileged accounts ensures more effective governance and minimizes potential security vulnerabilities.

**Implementation**


1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "High number of Okta accounts with privileged role assigned" security assessment.
1. Review the list of exposed entities to discover which of your Okta accounts have privileged roles assigned.
1. Reduce the number of users assigned to administrator roles (other than Super-Admin) to the minimum necessary to ensure better control and align with least privilege best practices. 



## Highly privileged Okta API token

**Description**

Okta’s API tokens inherit the permissions of the user who creates them. If a user with sensitive permissions generates an API token, it carries those permissions. Any API token created by a Super Admin has the same level of access as the Super Admin account. This can expose sensitive data and functionality to unauthorized users. If the token is stolen, it can grant the attacker access equivalent to the original user.

**Implementation**


1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Highly privileged Okta API token" security assessment.
1. Review the list of exposed entities to discover which of your Okta API tokens are highly privileged.
1. If the API token is no longer required, delete it to eliminate unnecessary exposure.



## Limit the number of Okta Super Admin accounts

**Description**

This report lists Okta accounts with Super Administrator role, where the number of users assigned to this role is greater than 5.

**User impact**

A high number of users with privileged roles increases the risk of misuse or unauthorized access to critical systems. By reducing the number of users assigned to roles such as Super Admin or Org Admin, organizations can better limit access to sensitive resources and reduce the attack surface. Maintaining a smaller, set of privileged accounts ensures more effective governance and minimizes potential security vulnerabilities.

**Implementation**

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Limit the number of Okta Super Admin accounts" security assessment.
1. Review the list of exposed entities to discover which of your Okta accounts have Super Admin role assigned.
1. Limit Super Administrator access to the minimum number of users necessary to maintain control over highest level of privileged access.



##  Remove dormant Okta privileged accounts

**Description**

This assessment describes the security risks associated with dormant Okta privileged accounts and provides recommendations for mitigating these risks.

**User impact**

Dormant privileged accounts represent a significant security risk, as they can become targets for unauthorized access or misuse without detection. Deactivating or removing unused privileged accounts ensures that only active, monitored users have access to critical administrative capabilities.

**Implementation**

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for the "Remove dormant Okta privileged accounts" security assessment.
1. Review the list of exposed entities to identify Okta privileged user accounts not used in the last 90 days. This inactivity indicates that the account might be a dormant account or no longer needed.
1. If the account is no longer required, deactivate or remove it to eliminate unnecessary exposure.

