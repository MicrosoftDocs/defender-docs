---
title: How Microsoft Defender for Identity protects your CyberArk identity accounts
description: Learn how Microsoft Defender for Identity protect your CyberArk accounts and what the integration enables.
ms.date: 02/15/2026
ms.topic: overview
ms.reviewer: himanch
# customer-intent: As a security administrator, I want to understand what happens when I connect CyberArk to Microsoft Defender for Identity, so that I can decide whether to enable the integration.
---

# How Microsoft Defender for Identity protects your CyberArk identity accounts (Preview)

CyberArk Identity is a SaaS-based privileged access management (PAM) solution that manages privileged accounts across cloud and enterprise environments.

When you connect CyberArk Identity with Microsoft Defender for Identity, identity data from CyberArk Identity is added to the identity inventory and correlated with identities from on-premises Active Directory and Microsoft Entra ID. Accounts that are managed by CyberArk Identity as PAM accounts are tagged in the inventory.


## What you can do after connecting CyberArk Identity to Microsoft Defender for Identity


After you connect CyberArk Identity, Microsoft Defender for Identity provides the following capabilities:

| Capability | Description |
|------------|------------|
| View CyberArk accounts in the identity inventory | Active Directory accounts that are managed by CyberArk Identity as PAM accounts are tagged in the inventory. <br> This applies only to AD accounts where the platform type in CyberArk Identity is a Windows Domain Account. |
| Improve CyberArk security posture | Evaluates CyberArk Identity accounts for security risks such as stale privileged accounts and excessive privileged role assignments, and generates posture recommendations. Example recommendations include: <br> - Change password for CyberArk Identity privileged user accounts<br>- Remove stale CyberArk Identity privileged accounts <br>- Limit the number of CyberArk Identity accounts with system admin role <br>- High number of CyberArk Identity accounts with a privileged role assigned |
| Use advanced hunting to investigate CyberArk identities and their related activities | Captures CyberArk Identity inventory The [IdentityInfo](/defender-xdr/advanced-hunting-identityinfo-table) table includes account metadata such as privilege level, group membership, and identity source. |
| Take remediation actions | If an identity is determined to be at risk, the following remediation actions can be taken from within the MicrosoftDefender portal: <br>- Disable user in CyberArk Identity <br> - Enable user in CyberArk Identity  |
| Reset password for PAM account in CyberArk Identity| If a privileged account is determined to be at risk, you can reset the password for the account from within the Microsoft Defender portal. This action will trigger a password reset in CyberArk Identity. |

## Next steps

- [Connect CyberArk Identity to Microsoft Defender for Identity](connect-cyber-ark.md)
