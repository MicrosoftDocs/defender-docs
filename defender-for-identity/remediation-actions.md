---
title: Remediation actions for compromised users in Microsoft Defender for Identity
description: Learn how to respond to compromised users with remediation actions in Microsoft Defender for Identity
ms.date: 06/15/2026
ms.topic: how-to
ms.custom: sfi-ga-blocked, msecd-doc-authoring-1014
ai-usage: ai-assisted
---

# Remediation actions in Microsoft Defender for Identity

Applies to:

- Microsoft Defender for Identity
- Microsoft Defender

Microsoft Defender for Identity lets you respond to compromised users with remediation actions that work consistently across your connected identity sources. The actions available for an identity depend on the connector that manages the account, and they span on-premises Active Directory and Microsoft Entra ID, identity providers such as Okta, CyberArk Identity, and SailPoint Identity Security Cloud, and applications connected through Microsoft Defender for Cloud Apps such as Google Workspace, Salesforce, and Box.

The response actions on users are available directly from the identity page, the identity side panel, the advanced hunting page, or in the action center. After you take action on a user, you can review the activity details in the action center.

## How remediation actions work

Remediation actions are initiated by a user in the Microsoft Defender portal and are authorized using role-based access control (RBAC) based on Microsoft Entra ID roles. If the initiating user isn’t authorized, the action is blocked before execution.

After authorization, the action is executed by the identity system that manages the affected account:

- **Active Directory**
  Actions are executed by the Microsoft Defender for Identity sensor on the domain controller. Only sensors installed on domain controllers perform remediation actions; sensors on AD FS, AD CS, or Microsoft Entra Connect servers don't perform remediation actions. The sensor uses the domain controller's local system account to perform the action.

  > [!IMPORTANT]
  > Make sure the **Automatically use the sensor's local system account** option is selected. This is required for sensor v3.x and recommended for all environments, including mixed (v2.x and v3.x) deployments. To verify, in the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Identities** > **Microsoft Defender for Identity** > **Manage action accounts**.

- **Microsoft Entra ID**
  Microsoft Defender for Identity creates and uses a Microsoft‑managed enterprise application to execute remediation actions in Entra ID.  
  - **Application name:** *Microsoft Defender for Identity*. In older tenants, the application might appear with the name *Radius Aad Syncer*.
  - **Application ID:** `60ca1954-583c-4d1f-86de-39d835f3e452`

- **Supported non‑Microsoft identity sources and connected apps**
  Actions are executed through the source's connector — including identity provider connectors and Microsoft Defender for Cloud Apps app connectors — using the credentials configured for the integration.

Remediation actions are recorded by the identity system where the action is executed and are visible in Microsoft Defender audit logs.

## Remediation actions in Automatic Attack Disruption

Remediation actions can also be applied automatically by Microsoft Defender's automatic attack disruption. When an active attack is detected, attack disruption uses Defender for Identity remediation capabilities to contain the threat without manual intervention. For details, see [automatic attack disruption](/defender-xdr/automatic-attack-disruption).

## Supported actions

The following Defender for Identity actions can be performed on Identities.

Depending on your Microsoft Entra ID roles, you might see additional Microsoft Entra ID actions, such as requiring users to sign in again and confirming a user as compromised. For more information, see [Remediate risks and unblock users](/entra/id-protection/howto-identity-protection-remediate-unblock).

| Remediation action | Description | Supported identity sources |
| ------------------ | ----------- | ------ |
| Disable | Disables all accounts linked to an identity or a specific account. Disabling prevents sign-in and access to network resources until the accounts are re-enabled. This action doesn't delete the identity profile or associated data such as documents, calendar events, or email messages. | Active Directory, Microsoft Entra ID, Okta, CyberArk Identity, SailPoint Identity Security Cloud, Google Workspace, Salesforce, Box |
| Enable | Re-enables accounts that were previously disabled for the selected identity. | Active Directory, Microsoft Entra ID, Okta, CyberArk Identity, SailPoint Identity Security Cloud, Salesforce |
| Revoke session | Revokes active sessions for the selected identity. | Microsoft Entra ID, Okta |
| Mark as compromised | Marks all accounts linked to the selected identity as compromised in Microsoft Entra ID. | Microsoft Entra ID |
| Force password change | Forces a password change for one or more accounts linked to the selected identity. The user must change their password at next sign-in, which prevents further use of compromised credentials. | Active Directory, Microsoft Entra ID |

## Roles and permissions

The following table lists the remediation actions supported by Defender for Identity and the roles required to initiate each action.

| Remediation Action | Active Directory | Microsoft Entra ID | Okta, SailPoint, CyberArk | Supported SaaS apps |
| ---- | ---- | ---- | ---- | ---- |
| Disable | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Global Administrator, User Administrator, Authentication Administrator, Privileged Authentication Administrator, Directory Writers, SOC Identity Responder | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Global Administrator, Security Administrator, Cloud App Security Administrator |
| Enable | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Global Administrator, User Administrator, Authentication Administrator, Privileged Authentication Administrator, Directory Writers | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Global Administrator, Security Administrator, Cloud App Security Administrator |
| Revoke session | N/A | Global Administrator, User Administrator, Authentication Administrator, Privileged Authentication Administrator, Directory Writers, Helpdesk Administrator, SOC Identity Responder | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | N/A |
| Mark as compromised | N/A | Global Administrator, Security Administrator, Security Operator, SOC Identity Responder | N/A | N/A |
| Force password change | See [Required permissions Defender for Identity in Microsoft Defender XDR](/defender-for-identity/role-groups#required-permissions-defender-for-identity-in-microsoft-defender-xdr) | Global Administrator, Privileged Authentication Administrator, Authentication Administrator, User Administrator, Password Administrator, Helpdesk Administrator, SOC Identity Responder | N/A | N/A |

> [!NOTE]
> There are some limitations for Microsoft Entra ID when performing certain actions on other roles. For more information, see the [Graph API documentation](/graph/api/resources/users?view=graph-rest-1.0&preserve-view=true).

## Prerequisites

To perform any of the [supported actions](#supported-actions), you need to:

- **Configure the account that Microsoft Defender for Identity uses to perform actions.** Make sure the **Automatically use the sensor's local system account** option is selected. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Identities** > **Microsoft Defender for Identity** > **Manage action accounts**. This setting is required if any of your sensors are v3.x. For more information, see [Manage action accounts](deploy/manage-action-accounts.md).
- **Sign in to the Microsoft Defender portal with the required permissions.** For Defender for Identity actions, you'll need a custom role with **Response (manage)** permissions. For more information, see [Create custom roles with Microsoft Defender unified RBAC](/microsoft-365/security/defender/create-custom-rbac-roles). For details on the specific roles required for each action, see [Roles and permissions](#roles-and-permissions).

To apply a remediation action to an identity, perform the following steps:

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to one of the following locations:
    - **Identity page**: Go to **Assets** > **Identities**, and select the identity you want to act on.
    - **Advanced hunting page**: Go to **Hunting** > **Advanced hunting**, and identify a result that includes an identity entity.
    - **Action center**: Go to **Actions & submissions** > **Action center** to review and manage pending or completed actions.

1. Select **Actions** or right-click the identity to open the actions menu.

1. Select the remediation action you want to apply, such as **Disable**, **Revoke session**, or **Force password change**.

1. Confirm the action when prompted.

The action is submitted and executed by the relevant identity system. You can track the status in the **Action center**.

<a name="related-video"></a>
## Video: Defender for Identity remediation actions

- [Remediation actions in Microsoft Defender for Identity](https://learn-video.azurefd.net/vod/id/adc6068b-225c-457d-b053-db6b64dedb79)

## See also

[Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md)
