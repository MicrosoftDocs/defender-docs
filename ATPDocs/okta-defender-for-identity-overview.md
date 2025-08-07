---
title: How Microsoft Defender for Identity helps protect your Okta accounts
description: 
ms.date: 08/07/2025
ms.topic: overview
ms. reviewer: himanch
# customer-intent: As a security administrator, I want to understand what happens when I connect Okta to Microsoft Defender for Identity, so that I can decide whether to enable the integration.
---
---

## How Microsoft Defender for Identity helps protect your Okta accounts

Okta is a cloud-based identity and access management (IAM) platform that helps organizations control how users and administrators sign in and access enterprise applications. Because Okta manages high-value identities, including privileged accounts and API tokens, it’s a frequent target for misuse or attack. Many organizations use Okta alongside on-premises systems like Active Directory and cloud services like Microsoft Entra ID. This hybrid model can make it harder to monitor identity activity and detect threats consistently across platforms.

When you connect Okta to Microsoft Defender for Identity, you can extend your identity threat detection and investigation capabilities to include Okta-managed users. Defender for Identity collects user and activity data from Okta and correlates it with identity data from Active Directory and Entra ID. This integration gives you a centralized view of user activity, posture risks, and suspicious behavior across your identity infrastructure.

## What the integration enables

With Okta connected, Defender for Identity provides the following capabilities:

**View Okta accounts in the Identity Inventory**

Okta users are added to the identity inventory in the Microsoft Defender portal. These accounts are correlated with matching identities from Active Directory or Entra ID, allowing unified tracking across platforms.

**Security Posture Management**

Defender for Identity evaluates identity configuration in Okta and surfaces posture recommendations in Microsoft Secure Score. Example recommendations include:

- [Security assessment: Assign multifactor authentication to Okta privileged user accounts](assign-multi-factor-authentication-okta-privileged-user-accounts.md)
- [Security assessment: Change password for Okta privileged User accounts](change-okta-password-privileged-user-accounts.md)
- [Security assessment: High number of Okta accounts with privileged role assigned](high-number-of-okta-accounts-with-privileged-role-assigned.md)
- [Security assessment: Highly privileged Okta API token](highly-privileged-okta-api-token.md)
- [Security assessment: Limit the number of Okta Super Admin accounts](limit-number-okta-super-admin-accounts.md)
- [Security assessment: Remove dormant Okta privileged accounts](remove-dormant-okta-privileged-accounts.md)


**Alerts**

Defender for Identity generates alerts based on Okta activity. These alerts can be correlated with other data in Microsoft Defender XDR. Examples include:

- Okta anonymous user access
- Privileged API token created
- Privileged API token updated
- Privileged Role assignment to Application
- Suspicious privileged role assignment

For a full list of supported alerts see: [Defender for Identity XDR alerts](/defender-for-identity/alerts-xdr#initial-access-alerts)

## Advanced hunting

Data from Okta is available in advanced hunting tables in Microsoft Defender XDR:

[IdentityInfo ](/defender-xdr/advanced-hunting-identityinfo-table)


# Next steps 

- [Connect Okta to Microsoft Defender for Identity](okta-integration.md)
