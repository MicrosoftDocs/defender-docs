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

Microsoft Defender for Identity enables security remediation actions to reduce risk and contain suspicious activity from the Microsoft Defender portal. These actions let you manage identity state and access, such as disabling or enabling accounts, ending active sessions, and marking identities as compromised.

You can initiate remediation actions from the **Identity** page, the **Advanced hunting** page, or the Action center.

## Supported actions

The following Defender for Identity actions can be performed on Identities. Depending on your Microsoft Entra ID roles, you might see additional Microsoft Entra ID actions, such as requiring users to sign in again and confirming a user as compromised. For more information, see [Remediate risks and unblock users](/entra/id-protection/howto-identity-protection-remediate-unblock).

| Remediation Action | Description | Scope |
| ------------------ | ----------- | ------ |
| Disable | Disables **all accounts linked to an identity** or **a specific account**. Disabling prevents sign-in and access to network resources until the accounts are re-enabled. This action doesn't delete the identity profile or associated data such as documents, calendar events, or email messages. | Active Directory, Microsoft Entra ID, and Okta |
| Enable | Re-enables accounts that were previously disabled for the selected identity. | Active Directory, Microsoft Entra ID, and Okta |
| Revoke session | Revokes active sessions for the selected identity. | Microsoft Entra ID and Okta |
| Mark as compromised | Marks all accounts linked to the selected identity as compromised in Microsoft Entra ID. | Microsoft Entra ID |
| Force password change | Forces a password change for one or more accounts linked to the selected identity. The user must change their password at next sign-in, which prevents further use of compromised credentials. | Active Directory |
| Deactivate | Permanently deactivates a non-legitimate malicious account. | Okta |
| Set account risk to High/Medium/Low | Sets account risk scoring to one of the defined levels. Available only when the [Risk Scoring](https://help.okta.com/en-us/Content/Topics/Security/Security_Risk_Scoring.htm) feature is enabled. | Okta |

## Roles and permissions

This table lists the remediation actions supported by Defender for Identity and the roles required to initiate each action.

| Remediation Action | Active Directory |Microsoft Entra ID | Okta |
| ---- | ---- | ---- | ---- |
|Disable | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Microsoft Entra Roles: <br> - Global Administrator <br> - User Administrator <br> - Authentication Administrator <br> - Privileged Authentication Administrator <br> - Directory Writers | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Enable | Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Microsoft Entra Roles: <br> - Global Administrator <br> - User Administrator <br> - Authentication Administrator <br> - Privileged Authentication Administrator <br> - Directory Writers | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Revoke session |N\A | Microsoft Entra Roles: <br> - Global Administrator <br> - User Administrator <br> - Authentication Administrator <br> - Privileged Authentication Administrator <br> - Directory Writers <br> - Helpdesk Administrator | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Mark as compromised |N\A |  Microsoft Entra Roles: <br> - Global Administrator <br> -Security Administrator <br> - Security Operator | N/A |
| Force password change| Refer to [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | N\A | N\A
| Deactivate | N\A | N\A | A custom role defined with permissions for Response (manage) or one of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |
| Set identity risk to High/Medium/Low | N\A | N\A | A custom role defined with permissions for Response (manage) or One of the following Microsoft Entra roles: <br> - Security Operator <br> - Security Administrator <br> - Global Administrator |

> [!NOTE]
> There are some limitations for Microsoft Entra ID when performing certain actions on other roles. For more information, see the [Graph API documentation](/graph/api/resources/users?view=graph-rest-1.0&preserve-view=true).

## Prerequisites

To perform remediation actions:

- Sign in to the Microsoft Defender portal with an account that has the required permissions.
- Authorization is enforced using Microsoft Entra ID roles.  
  If built-in roles don’t meet your needs, create a custom role using **Microsoft Defender XDR Unified RBAC** with **Response (Manage)** permissions.

## How remediation actions work

Remediation actions are initiated by a user in the Microsoft Defender portal and are authorized using role-based access control (RBAC) based on Microsoft Entra ID roles. If the initiating user isn’t authorized, the action is blocked before execution.

After authorization, the action is executed by the identity system that manages the affected account:

- **Active Directory**  
  Actions are executed by the Microsoft Defender for Identity sensor on the domain controller. The sensor impersonates the **LocalSystem** account to perform the action.

- **Microsoft Entra ID**  
  Microsoft Defender for Identity creates and uses a Microsoft‑managed enterprise application to execute remediation actions in Entra ID.  
  - **Application name:** *Microsoft Defender for Identity*  
  - **Application ID:** `60ca1954-583c-4d1f-86de-39d835f3e452`  
  - In older tenants, the same application ID may appear with the name *Radius Aad Syncer*.

- **Supported non‑Microsoft identity providers (IdPs)**  
  Actions are executed using the source IdP’s APIs based on the credentials configured for the integration.

Remediation actions are recorded by the identity system where the action is executed and are surfaced in Microsoft Defender audit logs.

## Automatic Attack Disruption

Automatic Attack Disruption in Microsoft Defender XDR uses Microsoft Defender for Identity remediation capabilities to respond to active attacks. During attack disruption, remediation actions are applied automatically. For details, see the Automatic Attack Disruption documentation in Microsoft Defender XDR.

## Related video

- **Remediation actions in Microsoft Defender for Identity**  
  https://learn-video.azurefd.net/vod/id/adc6068b-225c-457d-b053-db6b64dedb79

## See also

[Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md)
s