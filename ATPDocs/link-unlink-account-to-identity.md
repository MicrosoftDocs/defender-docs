---
title: Link/Unlink an account to an identity
description: This article explains how to link or unlink an account to an identity in Microsoft Defender for Identity.
ms.date: 09/01/2025
ms.topic: how-to
ms.service: microsoft-defender-for-identity
ms.reviewer: Almog Omrad
#customer intent: As a SOC analyst, I want to view all accounts linked to an identity so that I can gain a complete and accurate understanding of the identity’s footprint across the organization and validate accounts correlated are correct. 
---

# Link or Unlink an Account to an Identity

## Overview

In complex enterprise environments, identity data is often fragmented. A single user might have multiple accounts across systems, such as personal, privileged, legacy, or cloud-based accounts. This fragmentation makes it difficult to maintain a unified view of identity across the organization. The Manual Link or Unlink Accounts feature in Microsoft Defender for Identity helps you correlate accounts to identities.

For example, let's say you have a user named John Doe. John has an Azure Active Directory account, a Ping account, and an Okta account. By manually linking these accounts to John's identity in Defender for Identity, you can create a comprehensive view of his identity footprint across the organization.

## Why use manual linking

Manual linking helps organizations:

- Correlate identity components across different systems
- Improve protection by creating a complete identity context
- Support investigations and response actions with unified identity views

## Prerequisites

- You must have [Unified role-based access control (URBAC)](/defender-for-identity/role-groups) roles: Global Administrator or Security Data (Manage)

## How to Manually Link or Unlink Accounts to an Identity

Follow these steps to manually link accounts to a selected identity.

1. Go to **Identity Inventory**.
1. Select the **Observed in organization** tab.
1. Open the **Accounts** tab.
1. Select one or more accounts from the table. You must select at least one account to continue.
1. You can search by:
    - Display name
    - User principal name (UPN)
    - Security identifier (SID)
    - Source provider account
1. Select **Next**.
1. Enter a short justification comment explaining why you're linking these accounts.
1. Your justification must:
    - Be between 1 and 50 characters
    - Use only letters, numbers, spaces, @, and _
    - If your input includes invalid characters or exceeds the limit, an error message will appear.
1. Select **Next**.
1. Review the selected accounts and your justification.
1. Confirm that the accounts listed are correct.
1. The account list refreshes automatically.

## Unlink accounts from an identity

Follow these steps to manually unlink accounts from a selected identity.

1. Go to **Identity Inventory > Observed in organization**
1. Open the **Accounts** tab.
1. Select one or more account groups.
1. Select **Unlink account**.
1. A confirmation dialog appears with the identity name.
1. Review the message and select **Unlink accounts** to confirm.


## What to expect after linking or unlinking

- The selected accounts are linked or unlinked immediately.
- The system updates the identity context and refreshes the account list.
- All actions are recorded in the unified audit system, including the justification and the user who performed the action.

## See also

- [Investigate users](/microsoft-365/security/defender/investigate-users)
- [Investigate assets](/defender-for-identity/investigate-assets)