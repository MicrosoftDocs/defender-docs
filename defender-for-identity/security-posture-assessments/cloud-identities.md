---
title: 'Cloud identity assessments in Microsoft Defender for Identity'
description: Learn how Microsoft Defender for Identity assesses cloud identities in Okta, CyberArk Identity, and SailPoint Identity Security Cloud for security risks.
ms.service: microsoft-defender-for-identity
ms.topic: article
# ms.prod:   microsoft-defender-for-identity
ms.date: 07/30/2026
ms.reviewer: Himanch
ms.custom: msecd-doc-authoring-1015
ai-usage: ai-assisted
#customer intent: As a security admin, I want to review security assessments for cloud identities so that I can reduce risks in connected identity platforms.
---

# Microsoft Defender for Identity security assessments for cloud identities

Microsoft Defender for Identity provides security assessments for cloud identities in Okta, CyberArk Identity, and SailPoint Identity Security Cloud. Use these assessments to identify potential security risks and review recommended remediation actions.

## Prerequisites

Before you use these security assessments, connect your Okta, CyberArk Identity, or SailPoint Identity Security Cloud instance in the Microsoft Defender portal.

For setup instructions, see:

- [Connect your Okta instance](/defender-for-identity/okta-integration#connect-okta-to-defender-for-identity)
- [Connect your CyberArk Identity instance](/defender-for-identity/connect-cyber-ark)
- [Connect your SailPoint Identity Security Cloud instance](/defender-for-identity/connect-sail-point)

## Assign multifactor authentication to Okta privileged user accounts

**Description**:

This assessment identifies Okta privileged accounts that don't have a multifactor authentication (MFA) method assigned.

Enable MFA for all privileged accounts to reduce the risk of unauthorized access from compromised credentials. Securing accounts with roles such as Super Admin or Org Admin helps prevent attackers from gaining elevated access to sensitive resources and critical administrative functions.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Assign multifactor authentication for Okta privileged user accounts" security assessment.
1. Review the exposed entities to identify Okta privileged user accounts that don't have an MFA method assigned.
1. Assign and enforce an MFA method for the privileged accounts.

## Change password for Okta privileged User accounts

**Description**:

This assessment identifies Okta privileged accounts with passwords that were last set more than 180 days ago.

**Impact**:

Old passwords for privileged accounts increase the risk of unauthorized access because the credentials might have been exposed in a data breach or by another attack method. Regularly updating passwords for privileged accounts helps protect sensitive resources.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Change password for Okta privileged User accounts" security assessment.
1. Review the exposed entities to identify Okta privileged user accounts with old passwords.
1. Reset the passwords for those accounts.

## High number of Okta accounts with privileged role assigned

**Description**:

This assessment identifies Okta accounts assigned administrator roles, excluding Super Administrator, when more than 25 accounts have these roles.

**User impact**:

Many users with privileged roles increase the risk of misuse or unauthorized access to critical systems. Reducing the number of users assigned roles such as Super Admin or Org Admin limits access to sensitive resources and reduces the attack surface.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "High number of Okta accounts with privileged role assigned" security assessment.
1. Review the exposed entities to identify Okta accounts with privileged roles.
1. Reduce the number of users assigned administrator roles, other than Super Administrator, to the minimum needed to follow the principle of least privilege.

## Highly privileged Okta API token

**Description**:

Okta API tokens inherit the permissions of the user who creates them. An API token created by a Super Admin has the same access as the Super Admin account. A stolen highly privileged token can give an attacker access to sensitive data and features.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Highly privileged Okta API token" security assessment.
1. Review the exposed entities to identify highly privileged Okta API tokens.
1. Delete API tokens that are no longer needed.

## Limit the number of Okta Super Admin accounts

**Description**:

This assessment identifies Okta accounts with the Super Administrator role when more than five users have this role.

**User impact**:

Many users with the Super Administrator role increase the risk of misuse or unauthorized access to critical systems. Reducing the number of users with this role limits access to sensitive resources and reduces the attack surface.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Limit the number of Okta Super Admin accounts" security assessment.
1. Review the exposed entities to identify Okta accounts with the Super Administrator role.
1. Limit Super Administrator access to the minimum number of users needed to manage the highest level of privileged access.

## Remove dormant Okta privileged accounts

**Description**:

This assessment identifies Okta privileged accounts that haven't been used in the last 90 days.

**User impact**:

Dormant privileged accounts can become targets for undetected unauthorized access or misuse. Deactivating or removing unused privileged accounts helps ensure that only active, monitored users have critical administrative access.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Remove dormant Okta privileged accounts" security assessment.
1. Review the exposed entities to identify Okta privileged user accounts that haven't been used in the last 90 days.
1. Deactivate or remove accounts that are no longer needed.

## Change password for CyberArk Identity privileged user accounts

**Description**:

This assessment identifies CyberArk Identity privileged accounts with passwords that were last set more than 180 days ago.

**Impact**:

Old passwords for privileged accounts increase the risk of unauthorized access because the credentials might have been exposed in a data breach or by another attack method. Regularly updating passwords for privileged accounts helps protect sensitive resources.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Change password for CyberArk Identity privileged user accounts" security assessment.
1. Review the exposed entities to identify CyberArk Identity privileged user accounts with old passwords.
1. Reset the passwords for those accounts.

## Remove stale CyberArk Identity privileged accounts

**Description**:

This assessment identifies CyberArk Identity privileged accounts that are inactive or haven't been used for an extended period.

**Impact**:

Stale privileged accounts retain elevated access without active oversight. Removing or deactivating unused privileged accounts reduces the attack surface and helps maintain least-privilege access.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Remove stale CyberArk Identity privileged accounts" security assessment.
1. Review the exposed entities to identify inactive CyberArk Identity privileged accounts.
1. Remove or deactivate stale privileged accounts that are no longer needed.

## Limit the number of CyberArk Identity accounts with system admin role

**Description**:

This assessment identifies CyberArk Identity accounts with the system admin role.

**Impact**:

Many system admin accounts increase the risk of unauthorized access and misuse of privileged permissions. Limiting the number of accounts with this role strengthens governance and reduces the attack surface.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Limit the number of CyberArk Identity accounts with system admin role" security assessment.
1. Review the exposed entities to identify CyberArk Identity accounts with the system admin role.
1. Remove unnecessary system admin role assignments and keep the number of accounts to the minimum needed.

## High number of CyberArk Identity accounts with a privileged role assigned

**Description**:

This assessment identifies CyberArk Identity accounts with one or more privileged roles when the number of accounts exceeds the recommended threshold.

**Impact**:

Too many accounts with privileged roles increase the risk of misuse or unauthorized access to critical systems. Reducing the number of accounts with elevated privileges supports the principle of least privilege and improves security posture.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "High number of CyberArk Identity accounts with a privileged role assigned" security assessment.
1. Review the exposed entities to identify CyberArk Identity accounts with privileged roles.
1. Reduce the number of privileged role assignments to the minimum necessary.

## Change password for SailPoint Identity Security Cloud privileged user accounts

**Description**:

This assessment identifies SailPoint Identity Security Cloud privileged accounts with passwords that were last set more than 180 days ago.

**Impact**:

Old passwords for privileged accounts increase the risk of unauthorized access because the credentials might have been exposed in a data breach or by another attack method. Regularly updating passwords for privileged accounts helps protect sensitive resources.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Change password for SailPoint Identity Security Cloud privileged user accounts" security assessment.
1. Review the exposed entities to identify SailPoint Identity Security Cloud privileged user accounts with old passwords.
1. Reset the passwords for those accounts.

## Remove stale SailPoint Identity Security Cloud privileged accounts

**Description**:

This assessment identifies SailPoint Identity Security Cloud privileged accounts that are inactive or haven't been used for an extended period.

**Impact**:

Stale privileged accounts retain elevated access without active oversight. Removing or deactivating unused privileged accounts reduces the attack surface and helps maintain least-privilege access.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Remove stale SailPoint Identity Security Cloud privileged accounts" security assessment.
1. Review the exposed entities to identify inactive SailPoint Identity Security Cloud privileged accounts.
1. Remove or deactivate stale privileged accounts that are no longer needed.

## Limit the number of SailPoint Identity Security Cloud accounts with system admin role

**Description**:

This assessment identifies SailPoint Identity Security Cloud accounts with the system admin role.

**Impact**:

Many system admin accounts increase the risk of unauthorized access and misuse of privileged permissions. Limiting the number of accounts with this role strengthens governance and reduces the attack surface.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Limit the number of SailPoint Identity Security Cloud accounts with system admin role" security assessment.
1. Review the exposed entities to identify SailPoint Identity Security Cloud accounts with the system admin role.
1. Remove unnecessary system admin role assignments and keep the number of accounts to the minimum needed.

## High number of SailPoint Identity Security Cloud accounts with a privileged role assigned

**Description**:

This assessment identifies SailPoint Identity Security Cloud accounts with one or more privileged roles when the number of accounts exceeds the recommended threshold.

**Impact**:

Too many accounts with privileged roles increase the risk of misuse or unauthorized access to critical systems. Reducing the number of accounts with elevated privileges supports the principle of least privilege and improves security posture.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "High number of SailPoint Identity Security Cloud accounts with a privileged role assigned" security assessment.
1. Review the exposed entities to identify SailPoint Identity Security Cloud accounts with privileged roles.
1. Reduce the number of privileged role assignments to the minimum necessary.

## Assign multifactor authentication for SailPoint privileged user accounts

**Description**:

This assessment identifies SailPoint Identity Security Cloud privileged accounts that don't have an MFA method assigned.

**Impact**:

Enable MFA for all privileged accounts to reduce the risk of unauthorized access from compromised credentials.

**Implementation**:

To address this assessment, take the following actions:

1. On the **Recommended actions** page in Microsoft Secure Score at <https://security.microsoft.com/securescore?viewid=actions>, select the "Assign multifactor authentication for SailPoint privileged user accounts" security assessment.
1. Review the exposed entities to identify SailPoint Identity Security Cloud privileged user accounts that don't have an MFA method assigned.
1. Assign and enforce an MFA method for those privileged accounts.
