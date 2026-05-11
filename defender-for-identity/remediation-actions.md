---
title: Remediation actions
description: Learn how to respond to compromised users with remediation actions in Microsoft Defender for Identity
ms.date: 03/05/2026
ms.topic: how-to
---

# Remediation actions in Microsoft Defender for Identity

Applies to:

- Microsoft Defender for Identity
- Microsoft Defender XDR

Microsoft Defender for Identity allows you to respond to compromised users by disabling their accounts or resetting their password. After taking action on users, you can check on the activity details in the action center.

The response actions on users are available directly from the user page, the user side panel, the advanced hunting page, or in the action center.

## How remediation actions work

Remediation actions are initiated by a user in the Microsoft Defender portal and are authorized using role-based access control (RBAC) based on Microsoft Entra ID roles. If the initiating user isn’t authorized, the action is blocked before execution.

After authorization, the action is executed by the identity system that manages the affected account:

- **Active Directory**
  Actions are executed by the Microsoft Defender for Identity sensor on the domain controller. The sensor impersonates the **LocalSystem** account to perform the action.

- **Microsoft Entra ID**
  Microsoft Defender for Identity creates and uses a Microsoft‑managed enterprise application to execute remediation actions in Entra ID.  
  - **Application name:** *Microsoft Defender for Identity*. In older tenants, the application might appear with the name *Radius Aad Syncer*.
  - **Application ID:** `60ca1954-583c-4d1f-86de-39d835f3e452`

- **Supported non‑Microsoft identity providers (IdPs)**
  Actions are executed using the source IdP’s APIs based on the credentials configured for the integration.

Remediation actions are recorded by the identity system where the action is executed and are visible in Microsoft Defender audit logs.

## Remediation actions in Automatic Attack Disruption

Remediation actions can also be applied automatically by Microsoft Defender's automatic attack disruption. When an active attack is detected, attack disruption uses Defender for Identity remediation capabilities to contain the threat without manual intervention. For details, see [automatic attack disruption](/defender-xdr/automatic-attack-disruption).

## Supported actions

The following Defender for Identity actions can be performed on Identities.

Depending on your Microsoft Entra ID roles, you might see additional Microsoft Entra ID actions, such as requiring users to sign in again and confirming a user as compromised. For more information, see [Remediate risks and unblock users](/entra/id-protection/howto-identity-protection-remediate-unblock).

| Remediation Action | Description | Supported Identity systems |
| ------------------ | ----------- | ------ |
| Disable | Disables all accounts linked to an identity or a specific account. Disabling prevents sign-in and access to network resources until the accounts are re-enabled. This action doesn't delete the identity profile or associated data such as documents, calendar events, or email messages. | <ul><li>Active Directory</li><li>Microsoft Entra ID</li><li>Okta</li></ul> |
| Enable | Re-enables accounts that were previously disabled for the selected identity. | <ul><li>Active Directory</li><li>Microsoft Entra ID</li><li>Okta</li></ul> |
| Revoke session | Revokes active sessions for the selected identity. | <ul><li>Microsoft Entra ID</li><li>Okta</li></ul> |
| Mark as compromised | Marks all accounts linked to the selected identity as compromised in Microsoft Entra ID. | Microsoft Entra ID |
| Force password change | Forces a password change for one or more accounts linked to the selected identity. The user must change their password at next sign-in, which prevents further use of compromised credentials. | Active Directory |
| Deactivate | Permanently deactivates a non-legitimate malicious account. | Okta |
| Set account risk to High/Medium/Low | Sets account risk scoring to one of the defined levels. Available only when the [Risk Scoring](https://help.okta.com/en-us/Content/Topics/Security/Security_Risk_Scoring.htm) feature is enabled in Okta. | Okta |

## Roles and permissions

This table lists the remediation actions supported by Defender for Identity and the roles required to initiate each action.

| Remediation Action | Active Directory |Microsoft Entra ID | Okta |
| ---- | ---- | ---- | ---- |
| Disable | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | <ul><li>Global Administrator</li><li>User Administrator</li><li>Authentication Administrator</li><li>Privileged Authentication Administrator</li><li>Directory Writers</li></ul> | <ul><li>Security Operator</li><li>Security Administrator</li><li>Global Administrator</li></ul> |
| Enable | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) |<ul><li>Global Administrator</li><li>User Administrator</li><li>Authentication Administrator</li><li>Privileged Authentication Administrator</li><li>Directory Writers</li></ul> |<ul><li>Security Operator</li><li>Security Administrator</li><li>Global Administrator</li></ul> |
| Revoke session | N/A |<ul><li>Global Administrator</li><li>User Administrator</li><li>Authentication Administrator</li><li>Privileged Authentication Administrator</li><li>Directory Writers</li><li>Helpdesk Administrator</li></ul> |<ul><li>Security Operator</li><li>Security Administrator</li><li>Global Administrator</li></ul> |
| Mark as compromised | N/A |<ul><li>Global Administrator</li><li>Security Administrator</li><li>Security Operator</li></ul> | N/A |
| Force password change | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | N/A | N/A |
| Deactivate | N/A | N/A |<ul><li>Security Operator</li><li>Security Administrator</li><li>Global Administrator</li></ul> |
| Set identity risk to High/Medium/Low | N/A | N/A |<ul><li>Security Operator</li><li>Security Administrator</li><li>Global Administrator</li></ul> |

> [!NOTE]
> There are some limitations for Microsoft Entra ID when performing certain actions on other roles. For more information, see the [Graph API documentation](/graph/api/resources/users?view=graph-rest-1.0&preserve-view=true).

## Prerequisites

To perform any of the [supported actions](#supported-actions), you need to:

- **Configure the account that Microsoft Defender for Identity uses to perform actions.** By default, the Microsoft Defender for Identity sensor installed on a domain controller impersonates the **LocalSystem** account of the domain controller to perform Active Directory actions. For more information, see [Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md).
- **Sign in to the Microsoft Defender portal with the required permissions.** For Defender for Identity actions, you'll need a custom role with **Response (manage)** permissions. For more information, see [Create custom roles with Microsoft Defender unified RBAC](/microsoft-365/security/defender/create-custom-rbac-roles). For details on the specific roles required for each action, see [Roles and permissions](#roles-and-permissions).

To apply a remediation action to an identity:

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to one of the following locations:
    - **Identity page**: Go to **Assets** > **Identities**, and select the identity you want to act on.
    - **Advanced hunting page**: Go to **Hunting** > **Advanced hunting**, and identify a result that includes an identity entity.
    - **Action center**: Go to **Actions & submissions** > **Action center** to review and manage pending or completed actions.

1. Select **Actions** or right-click the identity to open the actions menu.

1. Select the remediation action you want to apply, such as **Disable**, **Revoke session**, or **Force password change**.

1. Confirm the action when prompted.

The action is submitted and executed by the relevant identity system. You can track the status in the **Action center**.

## Related video

- [Remediation actions in Microsoft Defender for Identity](https://learn-video.azurefd.net/vod/id/adc6068b-225c-457d-b053-db6b64dedb79)

## See also

[Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md)
