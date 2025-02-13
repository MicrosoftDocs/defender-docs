---
title: Remediation actions
description: Learn how to respond to compromised users with remediation actions in Microsoft Defender for Identity
ms.date: 08/28/2023
ms.topic: conceptual
---

# Remediation actions in Microsoft Defender for Identity

Applies to:

- Microsoft Defender for Identity
- Microsoft Defender XDR

Microsoft Defender for Identity allows you to respond to compromised users by disabling their accounts or resetting their password. After taking action on users, you can check on the activity details in the action center.

The response actions on users are available directly from the user page, the user side panel, the advanced hunting page, or in the action center.

Watch the following video to learn more about remediation actions in Defender for Identity:

<br>

> [!VIDEO https://www.youtube.com/embed/tpTJiJCgdck?si=prONSe2wj_KZBcKl]


## Prerequisites

To perform any of the [supported actions](#supported-actions), you need to:

- Configure the account that Microsoft Defender for Identity will use to perform them.  By default, the Microsoft Defender for Identity sensor installed on a domain controller will impersonate the *LocalSystem* account of the domain controller and perform the above actions. However, you can change this default behavior by [setting up a gMSA account](manage-action-accounts.md) and scope the permissions as you need.

- Be signed into Microsoft Defender XDR to with relevant permissions. For Defender for Identity actions, you'll need a custom role with **Response (manage)** permissions. For more information, see [Create custom roles with Microsoft Defender XDR Unified RBAC](/microsoft-365/security/defender/create-custom-rbac-roles).

## Supported actions

The following Defender for Identity actions can be performed directly on your on-premises identities:

- **Disable user in Active Directory**: This will temporarily prevent a user from signing in to the on-premises network. This can help prevent compromised users from moving laterally and attempting to exfiltrate data or further compromise the network.

- **Reset user password** – This will prompt the user to change their password on the next logon, ensuring that this account can't be used for further impersonation attempts.

Depending on your Microsoft Entra ID roles, you might see additional Microsoft Entra ID actions, such as requiring users to sign in again and confirming a user as compromised. For more information, see [Remediate risks and unblock users](/entra/id-protection/howto-identity-protection-remediate-unblock).


## Related videos

[Remediation actions in Defender for Identity](https://learn-video.azurefd.net/vod/player?id=adc6068b-225c-457d-b053-db6b64dedb79)

## See also

[Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md)
