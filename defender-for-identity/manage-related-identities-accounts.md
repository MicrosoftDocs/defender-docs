---
title: Link/Unlink an account to an identity
description: This article explains how to link or unlink accounts to and from identities in Microsoft Defender for Identity, including legacy, orphaned, or unused accounts.
ms.date: 01/28/2026
ms.topic: how-to
ms.service: microsoft-defender-for-identity
ms.reviewer: Almog Omrad
#customer intent: As a SOC analyst, I want to view all accounts linked to an identity so that I can gain a complete and accurate understanding of the identity's footprint across the organization, validate accounts correlated are correct, and remove any unused, legacy, or orphaned accounts from the identity.
---

# Manage related identities and accounts in Microsoft Defender for Identity 

In enterprise environments, identities are often fragmented. A single user might have multiple accounts across systems, including personal, privileged, legacy, cloud-based, or orphaned accounts. These accounts can cover on-premises Active Directory, Microsoft Entra ID, or non-Microsoft identity providers such as Okta and Ping.

Fragmentation makes it difficult to maintain a unified view of identity across the organization. Manually linking or unlinking related accounts in Microsoft Defender for Identity helps you:

- Correlate identity components across different systems.
- Improve protection by creating a complete identity context.
- Support investigations and response actions with unified identity views.

For example:

- **Personal and privileged accounts**: A user might have two accounts, one for everyday work and another with elevated permissions for administrative tasks. For example:
  - `rick.hofer@contoso.onmicrosoft.com` (regular account)
  - `rhofer@contoso.onmicrosoft.com` (privileged account)
- **Multiple domains**: Large organizations often manage several domains. Linking accounts across these domains provides full visibility into a user's activity. For example:
  - `chris@fabrikam.com`
  - `chris@contoso.com`
- **Personal and service accounts**: A user might have both a personal account and a service account they own or manage. Linking those accounts helps connect ownership and responsibility to the same identity. For example:
  - `valeria.barrios@contoso.com`
  - `backup.service@contoso.com`
- **Legacy accounts**: A user might still have an active account in a legacy system. Linking accounts ensures the legacy account is monitored and tied back to the correct identity. For example:
  - `gabriela.laureano@contoso.com`
  - `glaureano@contosolegacy.local`
- **Accounts in multiple services**: A user might have a Microsoft Entra ID account, an Okta account, and a Ping account. Manually linking these accounts to the user's identity creates a consolidated view that supports identity-centric protection and investigation.

Use the procedures in this article to manually link accounts to identities, and to manually unlink unused, legacy, or orphaned accounts from identities in Defender for Identity.

> [!TIP]
> To automatically correlate accounts using naming conventions or employee IDs, see [Create custom account correlation rules](custom-account-correlation-rules.md).

## Prerequisites

- You must have [Unified role-based access control (URBAC)](/defender-for-identity/role-groups) roles: Global Administrator or Security Data (Manage).

## Manually link accounts to an identity in Defender for Identity

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Assets** \> **Identities**. Or, to go directly to the **Identity Inventory** page, use <https://security.microsoft.com/identity-inventory>.

   :::image type="content" source="media/identity-inventory/identity-inventory-page.png" alt-text="Screenshot of the identity inventory page in the Microsoft Defender portal." lightbox="media/identity-inventory/identity-inventory-page.png":::

1. On the **Identities** tab of the **Identity Inventory** page, select an identity from the list by clicking on the **Display name** value.

1. On the identity details page that opens, select the **Observed in organization** tab, and verify the **Accounts** tab is selected.

    :::image type="content" source="media/link-unlink-account-to-identity/accounts-observed-in-organization.png" alt-text="Screenshot that shows the accounts observed in an organization." lightbox="media/link-unlink-account-to-identity/accounts-observed-in-organization.png":::

1. On the **Accounts** tab, select :::image type="icon" source="media/link-accounts.png" border="false"::: **Link**.

1. The **Link accounts** wizard opens. On the **Select accounts** page, use the search box to find an account. You can search by:
   - Display name
   - User principal name (UPN)
   - Security identifier (SID)
   - Source provider account

   Select one account by selecting the check box next to the **Display name** column, and then select **Next**.

   :::image type="content" source="media/link-unlink-account-to-identity/select-accounts.png" alt-text="Screenshot that shows a list of accounts that you can link. " lightbox="media/link-unlink-account-to-identity/select-accounts.png":::

1. On the **Enter justification** page, enter a short explanation why you're linking these accounts. A valid explanation includes:
   - Up to 50 characters.
   - Letters, numbers, spaces, `@`, or `_`.

   Select **Next**.

   :::image type="content" source="media/link-unlink-account-to-identity/enter-justification.png" alt-text="Screenshot that shows where to enter the justification for why you're linking the accounts." lightbox="media/link-unlink-account-to-identity/enter-justification.png":::

1. On the **Review and finish** page, review the information, and select **Back** to make changes. When you're finished, select **Submit**.

    :::image type="content" source="media/link-unlink-account-to-identity/review-and-finish.png" alt-text="Screenshot that shows the review of the selected accounts and the justification." lightbox="media/link-unlink-account-to-identity/review-and-finish.png":::

   After the account is successfully linked, select **Done**

## Manually unlink legacy, orphaned, or unused accounts from an identity in Defender for Identity

1. On the **Identities** tab of the **Identity Inventory** page at <https://security.microsoft.com/identity-inventory>, select an **Identity** from the list by clicking on the **Display name** value.
1. On the identity details page that opens, select the **Observed in organization** tab, and verify the **Accounts** tab is selected.
1. On the **Accounts** tab, select the account you want to unlink from the identity by selecting the check box next to the **Display name** column, and then select :::image type="icon" source="media/unlink-accounts.png" border="false"::: **Unlink**.
1. In the **Unlink accounts from ...** confirmation dialog that opens, read the information, and then select **Unlink accounts**.

## What to expect after linking or unlinking an account in Defender for Identity

- The selected accounts are linked or unlinked immediately.
- The system updates the identity context and refreshes the account list.

## See also

- [Investigate users](/microsoft-365/security/defender/investigate-users)
- [Investigate assets](/defender-for-identity/investigate-assets)
