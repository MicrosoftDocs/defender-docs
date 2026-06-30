---
title: How Microsoft Defender for Identity protects your Okta accounts
description: Learn how Microsoft Defender for Identity protect your Okta accounts and what the integration enables.
ms.date: 08/07/2025
ms.topic: overview
ms.reviewer: himanch
# customer-intent: As a security administrator, I want to understand what happens when I connect Okta to Microsoft Defender for Identity, so that I can decide whether to enable the integration.
---

# How Microsoft Defender for Identity protects your Okta accounts

Okta is a cloud-based identity and access management (IAM) platform that helps organizations control how users and administrators sign in and access enterprise applications. Okta manages high-value identities, including privileged accounts and API tokens. As a result, it’s a frequent target for misuse or attack. Many organizations use Okta alongside on-premises systems like Active Directory and cloud services like Microsoft Entra ID. This hybrid model can make it harder to monitor identity activity and detect threats consistently across platforms.

When you connect Okta to Microsoft Defender for Identity, you can extend your identity threat detection and investigation capabilities to include Okta-managed users. Defender for Identity ingests user and activity data from Okta and correlates it with identity data from Active Directory and Microsoft Entra ID. This integration gives you a centralized view of user activity, posture risks, and suspicious behavior across your identity infrastructure, and you can take the necessary remediation actions.


> [!NOTE]
> The **Identity details** page in the Microsoft Defender portal shows the **Okta user risk score** only if the **Identity Threat Protection with Okta AI** feature is enabled. For more information, see [Risk scoring (Okta Identity Engine)](https://help.okta.com/oie/en-us/content/topics/security/security_risk_scoring.htm).

## What you can do after connecting Okta

With Okta connected, Defender for Identity provides the following capabilities:


|Capability  |Description  |
|---------|---------|
|View Okta accounts in the Identity Inventory    |  Defender for Identity adds Okta users to the identity inventory in the Microsoft Defender portal. These accounts correlate with matching identities from Active Directory or Microsoft Entra ID, to allow unified tracking across platforms.       |
|Improve Okta security posture    |   Defender for Identity evaluates identity configuration in Okta and surfaces posture recommendations in Microsoft Secure Score. Example recommendations include: <br> - [Assign multifactor authentication to Okta privileged user accounts](/defender-for-identity/security-posture-assessments/cloud-identities#assign-multifactor-authentication-to-okta-privileged-user-accounts)  <br> - [Change password for Okta privileged user accounts](/defender-for-identity/security-posture-assessments/cloud-identities#change-okta-password-privileged-user-accounts.md)  <br> - [High number of Okta accounts with privileged role assigned](/defender-for-identity/security-posture-assessments/cloud-identities#high-number-of-okta-accounts-with-privileged-role-assigned.md)  <br> - [Highly privileged Okta API token](/defender-for-identity/security-posture-assessments/cloud-identities#highly-privileged-okta-api-token)  <br> - [Limit the number of Okta Super Admin accounts](/defender-for-identity/security-posture-assessments/cloud-identities#limit-number-okta-super-admin-accounts.md)  <br> - [Remove dormant Okta privileged accounts](/defender-for-identity/security-posture-assessments/cloud-identities#remove-dormant-okta-privileged-accounts.md)      |
|Get alerts on suspicious Okta activity   |  Defender for Identity alerts you when it detects high-risk behavior in Okta, including anonymous sign-ins, privileged role assignments, and token abuse. These alerts are available in Microsoft Defender. When connected, Defender for Identity raises the following alerts based on Okta activity:  <br> - Okta anonymous user access  <br> - Privileged API token created  <br> - Privileged API token updated  <br> - Privileged Role assignment to Application  <br> - Suspicious privileged role assignment  <br> For a full list of supported alerts, see: [Defender for Identity Defender alerts](/defender-for-identity/alerts-xdr#initial-access-alerts).       |
|Use advanced hunting to investigate Okta activity    |  Advanced hunting lets you investigate identity activity across different services including Okta, Active Directory, and Microsoft Entra ID. <br> The **IdentityInfo** table includes account metadata such as privilege level, group membership, and identity source. <br> The **IdentityEvents** table includes events related to those identities, such as sign-ins, authentication attempts, and identity-related alerts across supported identity providers.  <br> To explore the full schema and build your own queries, see:  <br> -  [IdentityInfo ](/defender-xdr/advanced-hunting-identityinfo-table)  <br> -  [IdentityEvents(Preview)](/defender-xdr/advanced-hunting-identityevents-table).       |
|Take remediation actions      |  When Microsoft Defender for Identity identifies an identity as at risk, you can take the following remediation actions directly from the Defender portal to update the user's status in Okta.  <br> - Revoke all user's sessions  <br> - Deactivate user in Okta  <br> - Set user risk in Okta  <br> For more information, see: [Remediation actions in Microsoft Defender for Identity](remediation-actions.md#roles-and-permissions).       |


## Next steps

- [Connect Okta to Microsoft Defender for Identity](okta-integration.md)

