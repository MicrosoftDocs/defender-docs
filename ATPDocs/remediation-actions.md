---
title: Remediation actions
description: Learn how to respond to compromised users with remediation actions in Microsoft Defender for Identity
ms.date: 08/28/2023
ms.topic: how-to
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

- Configure the account that Microsoft Defender for Identity will use to perform them. By default, the Microsoft Defender for Identity sensor installed on a domain controller will impersonate the *LocalSystem* account of the domain controller and perform the above actions. However, you can change this default behavior by [setting up a gMSA account](manage-action-accounts.md) and scope the permissions as you need.

- Be signed into Microsoft Defender XDR to with relevant permissions. For Defender for Identity actions, you'll need a custom role with **Response (manage)** permissions. For more information, see [Create custom roles with Microsoft Defender XDR Unified RBAC](/microsoft-365/security/defender/create-custom-rbac-roles).

## Supported actions

The following Defender for Identity actions can be performed on Identities:

| Remediation Action  | Description     |          Scope                        | 
| ------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
|Disable user                 | This temporarily prevents a user from signing in. This can help prevent compromised users from moving laterally and attempting to exfiltrate data or further compromise the network. | Active Directory, Entra ID and Okta
|Enable user              | Enable a user to sign in. | Active Directory, Entra ID and Okta
|Revoke all Users' sessions       | Revoke a user's active sessions. | Entra ID and Okta
|Confirm user compromised      | The user's risk level is set to High | Entra ID
| Reset user password| This prompts the user to change their password on the next logon, ensuring that this account can't be used for further impersonation attempts| Active Directory
|Deactivate user in Okta | This action can be used when a non-legit malicious account was detected, to deactivate the account permanently | Okta
| Set user risk to High/Medium/Low |Set one user risk scoring to one of the defined levels. This action will only be available if [Risk Scoring](https://help.okta.com/en-us/Content/Topics/Security/Security_Risk_Scoring.htm) feature is enabled | Okta


Depending on your Microsoft Entra ID roles, you might see additional Microsoft Entra ID actions, such as requiring users to sign in again and confirming a user as compromised. For more information, see [Remediate risks and unblock users](/entra/id-protection/howto-identity-protection-remediate-unblock).

## Roles and Permissions

| Remediation Action | Active Directory  |Entra ID   | Okta  |
|--|--|--|--|
| Disable user | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Global Administrator   | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Enable user | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Global Administrator | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Revoke all Users' sessions |N\A  | Global Administrator | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Confirm user compromised |N\A  |  - Global Administrator <br> -Security Administrator | N/A|
| Reset user password | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | N\A | N\A
| Deactivate user in Okta  | N\A | N\A | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator
|  Set User risk to High/Medium/Low  | N\A | N\A | A custom role defined with permissions for Response (manage) or One of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator

## Related videos

[Remediation actions in Defender for Identity](https://learn-video.azurefd.net/vod/player?id=adc6068b-225c-457d-b053-db6b64dedb79)

## See also

[Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md)
