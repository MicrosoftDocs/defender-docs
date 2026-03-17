---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: View the Identity inventory
description: The Identity Inventory provides a centralized location for customers to view and manage identity information across their environment, ensuring optimal visibility and a comprehensive experience. The updated Identities Inventory page is located under Assets in the Microsoft Defender portal.
author: AbbyMSFT
ms.author: abbyweisberg
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 01/25/2026
ms.reviewer: maelgami 
appliesto: 
- Microsoft Defender for Identity
- Microsoft Defender for Cloud Apps
- Microsoft Defender XDR
---

# View the Identity inventory

The **Identity inventory** provides a centralized view of all identities in your organization, so you can monitor and manage them efficiently. At a glance, see key details like the identity's type, domain, tags, and other attributes to quickly identify and manage identities that require attention.

The **Identities inventory** page includes tabs for:

- **Human identities**: Human identities discovered in your environment from Active Directory and Microsoft Entra ID.
- **Non-Human identities (Preview)**: Non-human identities discovered in your SaaS, Entra ID, and on-premises environments, including:
  - OAuth apps registered in:
    - Microsoft Entra ID
    - Google Workspace
    - Salesforce
  - On-premises service accounts from Active Directory.

From the top navigation:

- Add or remove columns.
- Apply filters.
- Sort the list by column values.
- Search for a specific identity.
- Export the list to a CSV file.
- Copy a link to the current filtered view.

> [!NOTE]
> When you export the identities list to a CSV file, only the first 5,000 identities are included in the export.

## Access the Identity inventory

:::image type="content" source="media/identity-inventory/identity-inventory-page.png" alt-text="Screenshot of the identity inventory page in the Microsoft Defender portal.":::

In the [Microsoft Defender portal](https://security.microsoft.com), select **Assets** > **Identities**.

## Identity inventory insights

The top section of the Identity inventory page gives you quick insights into your identity landscape through the following cards:

- The **Classify critical assets** card lets you define identity groups as business critical. For more information, see [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management).

- The **Highly privileged identities** card helps you investigate all sensitive accounts in your organization in Advanced hunting, including Microsoft Entra ID security administrators and Global admin users.

- The **Critical Active Directory service accounts** card helps you quickly identify all Active Directory accounts designated as critical, making it easier to focus on identities most at risk.

- The **Cloud application accounts** card connects you to your [Cloud application accounts](/defender-cloud-apps/accounts), including those from application connectors and third-party sources.

## The identity inventory lists

Select a tab to view details and available actions for each identity type.

## [Human identities](#tab/human-identities)

The **Human identities** tab consolidates all user identities from Active Directory and Microsoft Entra ID in one place, making it easier to view and manage user accounts. To investigate details about a specific user, see [Investigate users in Microsoft Defender XDR](/defender-xdr/investigate-users).

### Human identity statistics

These important statistics help you prioritize identities for security posture improvements:

| Name | Description |
| --------- | --------- |
| Total | The total number of identities. |
| Critical | The number of your critical assets. |
| Disabled | The number of all disabled identities in your organization. |

### Human identity details

The **Identities** list highlights key details for each non-human identity, including these columns by default:

| Column name | Description |
| --------- | --------- |
| Display name | The full name of the identity as shown in the directory. |
| Domain | The Active Directory domain to which the identity belongs. |
| Object ID | A unique identifier for the identity in Microsoft Entra ID. |
| UPN (User Principal Name) | The unique sign-in name of the identity in an email-like format. |
| Identity environment |  Indicates whether the identity is on-premises (originates from Active Directory), Cloud only (Entra ID) or Hybrid (synced from Azure Active Directory to Microsoft Entra ID). |
| Identity provider | The name of the identity provider. |
| Risk score | The risk score assigned to the identity. |
| Criticality level | The criticality level assigned to the identity. |
| Tags | Custom labels that help categorize identities considered high-value assets. For example, **Sensitive**, **Honeytoken**, or **Privileged Accounts** managed by a [Privileged Identity Management](/entra/id-governance/privileged-identity-management/pim-configure) (PIM) service. |
| SID | The Security Identifier, a unique value used to identify the identity in Active Directory. |
| Account status | Shows whether the identity is enabled or disabled. |
| Type | Specifies if the identity is a user account or service account. |
| Created time | The timestamp of when the identity was first created. |
| Last updated | The timestamp of the most recent update to the identity's attributes in Active Directory. |

Nondefault columns: Email, Microsoft Entra ID risk level, and Cloud ID.

## [Non-Human identities (Preview)](#tab/non-human-identities)

The **Non-Human identities** tab consolidates all non-human identities in one place, making it easier to check ownership and assess risk. To investigate details about a specific non-human identity, see [View a non-human identity](/defender-xdr/investigate-non-human-identities).

:::image type="content" source="media/identity-inventory/non-human-identities.png" alt-text="Screenshot of non-human identities tab in the Identity Inventory.":::

### Non-human identity stats

These statistics highlight non-human identities that might need prioritization. Select a statistic to get a filtered list of identities to investigate.

| Name | Description |
| --------- | --------- |
| Risky | The number of non-human identities with a high risk score. Risk scores are based on factors described in the [Risk score tab of the identity](/defender-xdr/investigate-non-human-identities.md#risk-score). |
| Highly privileged | The number of non-human identities with high-privilege permissions, such as admin consent or broad application permissions. |
| Overprivileged | The number of non-human identities with more permissions than they use. |
| Unused | The number of non-human identities with no recent sign-in activity. |
| External unverified publishers | The number of non-human identities from unverified external publishers. |
| New | The number of recently discovered non-human identities. |

### Non-human identity details

The Non-Human identities tab contains these sections:

- **Entra ID**: OAuth apps registered in Microsoft Entra ID.
- **Active Directory**: On-premises service accounts.
- **Salesforce**: OAuth apps registered in Salesforce.
- **Google Workspace**: OAuth apps registered in Google.

The **Identities** list highlights key details for each non-human identity, including these columns by default:

| Column name | Description |
| --------- | --------- |
| Display name | The full name of the identity as shown in the directory. |
| Status | Shows whether the identity is enabled or disabled, and if disabled, by whom. |
| Risk score | Shows the identity risk score (1-100). Higher values indicate greater risk. |
| Graph API access | Shows whether the identity has at least one Graph API permission. |
| Permission type | Shows whether the identity has application (app only), dedicated, or mixed permission. |
| Origin | Shows whether the identity originated in the tenant or is registered in an external tenant. |
| Content type | Shows whether the identity has admin or user-only consent. For identities with only user consent, the total consented users are shown. Identities with admin consent have broad access to all data, unless access policies and other restrictions limit that access. |
| Publisher | Publisher of the identity and their verification status. |
| Last used | Last time the identity signed in. This data is tracked only back to June 1, 2022. |

For Microsoft Entra ID identities, select **Create new policy** to set up a governance policy that automatically responds when high-risk apps appear. Use the built-in **New high risk app** template for a quick setup, or create a custom policy with risk score as a policy condition.

---

### Related articles

- [Investigate users in Microsoft Defender](/defender-xdr/investigate-users)
- [Investigate non-human identities in Microsoft Defender](/defender-xdr/investigate-users)
- [Investigate cloud application accounts](/defender-cloud-apps/accounts)
