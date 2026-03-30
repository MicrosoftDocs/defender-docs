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

- Be signed into Microsoft Defender XDR to with relevant permissions. For Defender for Identity actions, you'll need a custom role with **Response (manage)** permissions. For more information, see [Create custom roles with Microsoft Defender unified RBAC](/microsoft-365/security/defender/create-custom-rbac-roles).

## Supported actions

The following Defender for Identity actions can be performed on Identities:

| Remediation Action  | Description     |          Scope                        | 
| ------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
|Disable                 | You can choose to disable **all accounts linked to an identity** or **only one of them**. Disabling an identity prevents sign-in and access to network resources until the accounts are re-enabled. This action doesn’t delete the identity profile or associated data such as documents, calendar events, or email messages. | Active Directory, Microsoft Entra ID, and Okta
|Enable              | Re-enables accounts that were previously disabled for the selected identity. | Active Directory, Microsoft Entra ID, and Okta
|Revoke session     | Revoke an identity's active session. | Microsoft Entra ID and Okta
|Mark as compromised     | Marks all accounts linked to the selected identity as compromised in Microsoft Entra ID. | Microsoft Entra ID
|Force password change| Force a password change for one or more accounts linked to the selected identity. This prompts the identity to change their password on the next logon, ensuring that this account can't be used for further impersonation attempts.| Active Directory
|Deactivate | This action can be used when a non-legit malicious account was detected, to deactivate the account permanently | Okta
|Set account risk to High/Medium/Low |Set account risk scoring to one of the defined levels. This action is only available if [Risk Scoring](https://help.okta.com/en-us/Content/Topics/Security/Security_Risk_Scoring.htm) feature is enabled | Okta


Depending on your Microsoft Entra ID roles, you might see additional Microsoft Entra ID actions, such as requiring users to sign in again and confirming a user as compromised. For more information, see [Remediate risks and unblock users](/entra/id-protection/howto-identity-protection-remediate-unblock).

## Roles and Permissions

| Remediation Action | Active Directory  |Microsoft Entra ID   | Okta  |
|--|--|--|--|
|Disable | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Microsoft Entra Roles: <br> - Global Administrator <br>  - User Administrator <br>  - Authentication Administrator <br>  - Privileged Authentication Administrator <br>  - Directory Writers <br>  | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Enable | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Microsoft Entra Roles: <br> - Global Administrator <br>  - User Administrator <br>  - Authentication Administrator <br>  - Privileged Authentication Administrator <br>  - Directory Writers <br>  | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Revoke session |N\A  | Microsoft Entra Roles: <br> - Global Administrator <br>  - User Administrator <br>  - Authentication Administrator <br>  - Privileged Authentication Administrator <br>  - Directory Writers <br> - Helpdesk Administrator <br>| A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Mark as compromised |N\A  |  Microsoft Entra Roles: <br> - Global Administrator <br> -Security Administrator <br> - Security Operator <br>  | N/A|
| Force password change| Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | N\A | N\A
| Deactivate | N\A | N\A | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator
| Set identity risk to High/Medium/Low  | N\A | N\A | A custom role defined with permissions for Response (manage) or One of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator

> [!NOTE]
> There are some limitations for Microsoft Entra ID when performing certain actions on other roles. For more information, see the [Graph API documentation](/graph/api/resources/users?view=graph-rest-1.0&preserve-view=true ).


## Related videos

[Remediation actions in Defender for Identity](https://learn-video.azurefd.net/vod/player?id=adc6068b-225c-457d-b053-db6b64dedb79)

## See also

[Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md)
