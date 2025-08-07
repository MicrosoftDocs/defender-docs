---
title: How Microsoft Defender for Identity protects your Okta accounts
description: Learn how Microsoft Defender for Identity helps protect your Okta accounts and what the integration enables.
ms.date: 08/07/2025
ms.topic: overview
ms. reviewer: himanch
# customer-intent: As a security administrator, I want to understand what happens when I connect Okta to Microsoft Defender for Identity, so that I can decide whether to enable the integration.
---

# How Microsoft Defender for Identity protects your Okta accounts

Okta is a cloud-based identity and access management (IAM) platform that helps organizations control how users and administrators sign in and access enterprise applications. Okta manages high-value identities, including privileged accounts and API tokens. As a result, it’s a frequent target for misuse or attack. Many organizations use Okta alongside on-premises systems like Active Directory and cloud services like Microsoft Entra ID. This hybrid model can make it harder to monitor identity activity and detect threats consistently across platforms.

When you connect Okta to Microsoft Defender for Identity, you can extend your identity threat detection and investigation capabilities to include Okta-managed users. Defender for Identity ingests user and activity data from Okta and correlates it with identity data from Active Directory and Microsoft Entra ID. This integration gives you a centralized view of user activity, posture risks, and suspicious behavior across your identity infrastructure and take the necessary remediation actions.

## What you can do after connecting Okta

With Okta connected, Defender for Identity provides the following capabilities:

**View Okta accounts in the Identity Inventory**

Okta users are added to the identity inventory in the Microsoft Defender portal. These accounts are correlated with matching identities from Active Directory or Microsoft Entra ID, allowing unified tracking across platforms.

**Improve Okta security posture**

Defender for Identity evaluates identity configuration in Okta and surfaces posture recommendations in Microsoft Secure Score. Example recommendations include:

- [Assign multifactor authentication to Okta privileged user accounts](assign-multi-factor-authentication-okta-privileged-user-accounts.md)
- [Change password for Okta privileged User accounts](change-okta-password-privileged-user-accounts.md)
- [High number of Okta accounts with privileged role assigned](high-number-of-okta-accounts-with-privileged-role-assigned.md)
- [Highly privileged Okta API token](highly-privileged-okta-api-token.md)
- [Limit the number of Okta Super Admin accounts](limit-number-okta-super-admin-accounts.md)
- [Remove dormant Okta privileged accounts](remove-dormant-okta-privileged-accounts.md)


**Get alerts on suspicious Okta activity**

Defender for Identity alerts you when it detects high-risk behavior in Okta, including anonymous sign-ins, privileged role assignments, or token abuse. These alerts are available in Microsoft Defender XDR. When connected, Defender for Identity can raise the following alerts based on Okta activity:

- Okta anonymous user access
- Privileged API token created
- Privileged API token updated
- Privileged Role assignment to Application
- Suspicious privileged role assignment

For a full list of supported alerts, see: [Defender for Identity XDR alerts](/defender-for-identity/alerts-xdr#initial-access-alerts)

**Use advanced hunting to investigate Okta activity**

You can use advanced hunting to investigate identity activity across various services including Okta, Active Directory, and Microsoft Entra ID. The IdentityInfo table includes account metadata such as privilege level, group membership, and identity source.

To explore the full schema and build your own queries, see [IdentityInfo ](/defender-xdr/advanced-hunting-identityinfo-table) and [IdentityEvents(Preview)](/defender-xdr/advanced-hunting-identityevents-table?branch=pr-en-us-4691).

## Next steps  

- [Connect Okta to Microsoft Defender for Identity](okta-integration.md)
