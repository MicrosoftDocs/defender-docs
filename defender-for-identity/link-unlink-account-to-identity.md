---
title: Link/Unlink an account to an identity
description: This article explains how to link or unlink an account to an identity in Microsoft Defender for Identity.
ms.date: 09/01/2025
ms.topic: how-to
ms.service: microsoft-defender-for-identity
ms.reviewer: Almog Omrad
#customer intent: As a SOC analyst, I want to view all accounts linked to an identity so that I can gain a complete and accurate understanding of the identity’s footprint across the organization and validate accounts correlated are correct. 
---

# Link or Unlink an Account to an Identity (Preview)

## Overview

In enterprise environments, identity data is often fragmented. A single user might have multiple accounts across systems, including personal, privileged, legacy, or cloud-based accounts. These accounts can cover on-premises Active Directory, Microsoft Entra ID, or third-party identity providers such as Okta and Ping. Users may also maintain multiple accounts within the same system, such as a standard business account (john@acme.com) and a privileged administrative account (john_adm@acme.com). This fragmentation makes it difficult to maintain a unified view of identity across the organization. The **Manual link or unlink accounts** feature in Microsoft Defender for Identity helps you correlate accounts with identities to build a complete identity footprint.

Consider a user named John Doe who has an Azure Active Directory account, an Okta account, and a Ping account. By manually linking these accounts to John’s identity in Microsoft Defender for Identity, you can create a consolidated view that supports identity-centric protection and investigation.

## Why use manual linking

Manual linking helps organizations:

- Correlate identity components across different systems
- Improve protection by creating a complete identity context
- Support investigations and response actions with unified identity views

### Scenarios and examples 

- **Personal and privileged accounts**: A user might have two accounts, one for everyday work and another with elevated permissions for administrative tasks.  
  **Example**  
  - john.smith@company.com (regular account)  
  - john.smith.admin@company.com (privileged account)  

- **Multiple domains**: Large organizations often manage several domains. Linking accounts across these domains provides full visibility into a user’s activity.  
  **Example**  
  - user@acme.com  
  - user@contoso.com  

- **Personal and service accounts**: A user may have both a personal account and a service account they own or manage. Linking them helps connect ownership and responsibility to the same identity.  
  **Example**  
  - david.lee@company.com (personal account)  
  - backup.service@company.com (service account)  

- **Legacy accounts**: A user might still have an active account in a legacy system. Linking it ensures the account is monitored and tied back to the correct identity.  
  **Example**  
  - sarah.jones@company.com (current account)  
  - sjones@oldsystem.local (legacy account)  



## Prerequisites

- You must have [Unified role-based access control (URBAC)](/defender-for-identity/role-groups) roles: Global Administrator or Security Data (Manage)

## How to Manually Link or Unlink Accounts to an Identity

Follow these steps to manually link accounts to a selected identity.

1. Navigate to **Assets** > **Identity Inventory**.
1. Select an **Identity** from the list.

      :::image type="content" source="media/identity-inventory/inventory-page.png" alt-text="Screenshot of the identity inventory page in the Microsoft Defender portal." lightbox="media/identity-inventory/inventory-page.png":::

1. Select the **Observed in organization** tab.
1. Open the **Accounts** tab.

    :::image type="content" source="media/link-unlink-account-to-identity/accounts-observed-in-organization.png" alt-text="Screenshot that shows the accounts observed in an organization." lightbox="media/link-unlink-account-to-identity/accounts-observed-in-organization.png":::

1. Select the **Link** button.
1. You can search by:
    - Display name
    - User principal name (UPN)
    - Security identifier (SID)
    - Source provider account
1. Select one account from the table.

    :::image type="content" source="media/link-unlink-account-to-identity/select-accounts.png" alt-text="Screenshot that shows a list of accounts that you can link. " lightbox="media/link-unlink-account-to-identity/select-accounts.png":::

1. Select **Next**.
1. Enter a short justification comment explaining why you're linking these accounts.
1. Your justification must:
    - Be between 1 and 50 characters
    - Use only letters, numbers, spaces, @, and _
    - If your input includes invalid characters or exceeds the limit, an error message will appear.

    :::image type="content" source="media/link-unlink-account-to-identity/enter-justification.png" alt-text="Screenshot that shows where to enter the justification for why you are linking the accounts." lightbox="media/link-unlink-account-to-identity/enter-justification.png":::

1. Select **Next**.
1. Review the selected accounts and your justification.

    :::image type="content" source="media/link-unlink-account-to-identity/review-and-finish.png" alt-text="Screenshot that shows the review of the selected accounts and the justification." lightbox="media/link-unlink-account-to-identity/review-and-finish.png":::

1. Confirm that the accounts listed are correct.
1. The account list refreshes automatically.

## Unlink accounts from an identity

Follow these steps to manually unlink accounts from a selected identity.

1. Go to **Identity Inventory > Observed in organization**.
1. Open the **Accounts** tab.
1. Select one account set from the table.
1. Select **Unlink account**.
1. A confirmation dialog appears with the identity name.
1. Review the message and select **Unlink accounts** to confirm.


## What to expect after linking or unlinking an account

- The selected accounts are linked or unlinked immediately.
- The system updates the identity context and refreshes the account list.
- All actions are recorded in the unified audit system, including the justification and the user who performed the action.

## See also

- [Investigate users](/microsoft-365/security/defender/investigate-users)
- [Investigate assets](/defender-for-identity/investigate-assets)
