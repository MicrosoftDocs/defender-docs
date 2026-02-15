---
title: How Microsoft Defender for Identity protects your CyberArk accounts
description: Learn how Microsoft Defender for Identity protect your CyberArk accounts and what the integration enables.
ms.date: 02/15/2026
ms.topic: overview
ms.reviewer: himanch
# customer-intent: As a security administrator, I want to understand what happens when I connect CyberArk to Microsoft Defender for Identity, so that I can decide whether to enable the integration.
---

# How Microsoft Defender for Identity protects your CyberArk accounts

As organizations increasingly adopt hybrid and multicloud environments, securing identities across platforms becomes critical. 

When you connect CyberArk Identity with Microsoft Defender for Identity (MDI), you can detect, investigate, and respond to identity-based threats across both cloud and on-premises infrastructures.

## What you can do after connecting CyberArk Identity to Microsoft Defender for Identity


After you connect CyberArk Identity, Microsoft Defender for Identity provides the following capabilities:

| Capability | Description |
|------------|------------|
| View CyberArk accounts in the identity inventory | Adds CyberArk Identity users into the identity inventory and correlates them with identities from on-premises, Active Directory and Microsoft Entra ID. |
| Improve CyberArk security posture | Evaluates CyberArk Identity accounts for security risks such as stale privileged accounts and excessive privileged role assignments, and generates posture recommendations. Example recommendations include: <br> - Change password for CyberArk Identity privileged user accounts<br>- Remove stale CyberArk Identity privileged accounts <br>- Limit the number of CyberArk Identity accounts with system admin role <br>- High number of CyberArk Identity accounts with a privileged role assigned |
| Use advanced hunting to investigate CyberArk activity | Captures CyberArk Identity inventory and events. The [IdentityInfo](/defender-xdr/advanced-hunting-identityinfo-table) table includes account metadata such as privilege level, group membership, and identity source. |
| Take remediation actions | If an identity is determined to be at risk, the following remediation actions can be taken from within the MicrosoftDefender portal: <br>- Disable user in CyberArk Identity <br> - Activate user in CyberArk Identity  |

## Next steps

- [Connect CyberArk Identity to Microsoft Defender for Identity](connect-cyberark.md)
