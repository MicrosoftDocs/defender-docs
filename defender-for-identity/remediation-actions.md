---
title: Remediation actions
description: Learn how to respond to compromised users with remediation actions in Microsoft Defender for Identity
ms.date: 02/23/2026
ms.topic: how-to
---

# Remediation actions in Microsoft Defender for Identity

Applies to:

- Microsoft Defender for Identity
- Microsoft Defender XDR

Microsoft Defender for Identity allows you to respond to compromised users by disabling their accounts or resetting their password. After taking action on users, you can check on the activity details in the action center.

The response actions on users are available directly from the user page, the user side panel, the advanced hunting page, or in the action center.

Watch the following video to learn more about remediation actions in Defender for Identity:


> [!VIDEO https://www.youtube.com/embed/tpTJiJCgdck?si=prONSe2wj_KZBcKl]

## How remediation actions work

Remediation actions are authorized using RBAC and performed by the identity system managing the identity—Active Directory, Microsoft Entra ID, or a supported non-Microsoft identity provider (IDP).

### Active Directory

- The remediation action is executed by the Defender for Identity sensor, impersonating the LocalSystem account on the domain controller.
- The activity is logged in Active Directory and surfaced in Microsoft Defender audit logs.

### Microsoft Entra ID

- Defender for Identity creates a Microsoft Entra ID enterprise application in the tenant used only to execute remediation actions.
  - Enterprise application name: **Microsoft Defender for Identity**  
  - Application ID: `60ca1954-583c-4d1f-86de-39d835f3e452`
- The remediation action is executed by a user in the application, and authorized based on the user’s assigned roles.
- The activity is recorded in Microsoft Entra ID and Microsoft Defender audit logs.

### Non-Microsoft Identity Providers (IdPs)

- The remediation action is executed using source IDP APIs and authorized using configured credentials (API keys, OAuth tokens, scopes).
- The activity is logged by the source IdP and surfaced in Microsoft Defender.

## Prerequisites

To perform any of the [supported actions](#supported-actions), you need to:

- Sign in to Microsoft Defender with the user performing the actions.
- Ensure the account used by Microsoft Defender for Identity has the required permissions. Authorization is enforced through Microsoft Entra ID roles. If built‑in roles don’t meet the requirement, create a custom role using Microsoft Defender XDR Unified RBAC with Response (Manage) permissions. For more information, see [Create custom roles with Microsoft Defender XDR Unified RBAC](/microsoft-365/security/defender/create-custom-rbac-roles).

## Supported actions

The following Defender for Identity actions can be performed on Identities. Depending on your Microsoft Entra ID roles, you might see additional Microsoft Entra ID actions, such as requiring users to sign in again and confirming a user as compromised. For more information, see [Remediate risks and unblock users](/entra/id-protection/howto-identity-protection-remediate-unblock).

| Remediation Action | Description | Scope |
| ------------------ | ----------- | ------ |
| Disable | You can choose to disable **all accounts linked to an identity** or **only one of them**. Disabling an identity prevents sign-in and access to network resources until the accounts are re-enabled. This action doesn’t delete the identity profile or associated data such as documents, calendar events, or email messages. | Active Directory, Microsoft Entra ID, and Okta |
| Enable | Re-enables accounts that were previously disabled for the selected identity. | Active Directory, Microsoft Entra ID, and Okta|
| Revoke session | Revoke an identity's active session. | Microsoft Entra ID and Okta|
| Mark as compromised | Marks all accounts linked to the selected identity as compromised in Microsoft Entra ID. | Microsoft Entra ID |
| Force password change | Force a password change for one or more accounts linked to the selected identity. This prompts the identity to change their password on the next logon, ensuring that this account can't be used for further impersonation attempts. | Active Directory |
| Deactivate | This action can be used when a non-legit malicious account was detected, to deactivate the account permanently | Okta |
| Set account risk to High/Medium/Low |Set account risk scoring to one of the defined levels. This action is only available if the [Risk Scoring](https://help.okta.com/en-us/Content/Topics/Security/Security_Risk_Scoring.htm) feature is enabled. | Okta |

## Roles and Permissions

This table lists the remediation actions supported by Defender for Identity and the roles required to initiate each action.

| Remediation Action | Active Directory |Microsoft Entra ID | Okta |
| ---- | ---- | ---- | ---- |
|Disable | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Microsoft Entra Roles: <br> - Global Administrator <br> - User Administrator <br> - Authentication Administrator <br> - Privileged Authentication Administrator <br> - Directory Writers | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Enable | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Microsoft Entra Roles: <br> - Global Administrator <br> - User Administrator <br> - Authentication Administrator <br> - Privileged Authentication Administrator <br> - Directory Writers | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Revoke session |N\A | Microsoft Entra Roles: <br> - Global Administrator <br> - User Administrator <br> - Authentication Administrator <br> - Privileged Authentication Administrator <br> - Directory Writers <br> - Helpdesk Administrator | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Mark as compromised |N\A |  Microsoft Entra Roles: <br> - Global Administrator <br> -Security Administrator <br> - Security Operator | N/A |
| Force password change| Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | N\A | N\A
| Deactivate | N\A | N\A | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator
| Set identity risk to High/Medium/Low | N\A | N\A | A custom role defined with permissions for Response (manage) or One of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |

> [!NOTE]
> There are some limitations for Microsoft Entra ID when performing certain actions on other roles. For more information, see the [Graph API documentation](/graph/api/resources/users?view=graph-rest-1.0&preserve-view=true).


## Related videos

[Remediation actions in Defender for Identity](https://learn-video.azurefd.net/vod/player?id=adc6068b-225c-457d-b053-db6b64dedb79)

## See also

[Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md)
