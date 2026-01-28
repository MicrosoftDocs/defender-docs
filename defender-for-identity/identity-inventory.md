---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: Identity inventory
description: The Identity Inventory provides a centralized location for customers to view and manage identity information across their environment, ensuring optimal visibility and a comprehensive experience. The updated Identities Inventory page is located under Assets in the Microsoft Defender portal.
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 01/25/2026
ms.reviewer: rlitinsky
appliesto: 
- Microsoft Defender for Identity
- Microsoft Defender for Cloud Apps
- Microsoft Defender XDR
---

# Identity inventory


The **Identity inventory** gives you a centralized view of all identities in your organization, so you can monitor and manage them efficiently. At a glance, you can see key details such as Domain, Tags, Type, and other attributes, which help you quickly identify and manage identities that require attention.

The Identities inventory page includes the following tabs:

- **Identities**: A consolidated view of identities across Active Directory, and Microsoft Entra ID. This Identities tab highlights key details, including identity types, and user's information.

- **Cloud application accounts:** Displays a list of cloud application accounts, including those from application connectors and third-party sources (original available in the previous version based on Microsoft Defender for Cloud Apps). Learn more about [Cloud application accounts from connected apps.](/defender-cloud-apps/accounts)

There are several options you can choose from to customize the identities list view. On the top navigation you can:

- Add or remove columns.
- Apply filters.
- Search for an identity by name or full UPN, SID, and Object ID. 
- Export the list to a CSV file.

> [!NOTE]
> When you export the identities list to a CSV file, only the first 5,000 identities are included.

- Copy list link with the included filters configured. 



:::image type="content" source="media/identity-inventory/inventory-page.png" alt-text="Screenshot of the identity inventory page in the Microsoft Defender portal.":::

### Navigate to the Identity inventory page

In the [Microsoft Defender portal](https://security.microsoft.com), go to **Assets** > **Identities**. 


### Identity inventory insights 

The top section of the Identity inventory page provides you with quick insights into your identity landscape through the following cards:

- The **Classify critical assets** card allows you to define identity groups as business critical. For more information, see [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management). 

- The **Highly privileged identities** card helps you investigate in Advanced hunting all sensitive accounts in your organization, including Microsoft Entra ID security administrators and Global admin users.

- The **Critical Active Directory service accounts** card helps you quickly identify all Active Directory accounts designated as critical, making it easier to focus on identities most at risk.

At the top of the page, the following identities counts are available:

|Name  |Description  |
|---------|---------|
|**Total**    | The total number of identities. |
|**Critical**    | The number of your critical assets. |
|**Disabled**    | The number of all disabled identities in your organization. |
|**Services**    | The number of all service accounts both on-premises and cloud. |

You can use this information to help you prioritize identities for security posture improvements.

### Identity details 

The **Identities** list offers a consolidated view of identities across Active Directory and Microsoft Entra IDs. It highlights key details, including the following columns by default:

|Column name  |Description  |
|---------|---------|
|**Display name**  | The full name of the identity as shown in the directory.  |
|**SID**  |  The Security Identifier, a unique value used to identify the identity in Active Directory. |
|**Domain** | The Active Directory domain to which the identity belongs. |
|**Object ID**  |  A unique identifier for the identity in Microsoft Entra ID.|
|**Source** | Indicates whether the identity is on-premises (originate from Active Directory), Cloud only (Entra ID) or Hybrid (synced from Azure Active Directory to Microsoft Entra ID). |
|**Type** |  Specifies if the identity is a user account or service account. |
|**UPN (User Principal Name)**    | The unique login name of the identity in an email-like format.|
|**Tags**    |  Custom labels that help categorize identities that are considered high value assets. For example, **Sensitive**, **Honeytoken** or **Privileged Accounts** managed by a [Privileged Identity Management](/entra/id-governance/privileged-identity-management/pim-configure) (PIM) service. |
|**Created time** |  The timestamp when the identity was first created. |
|**Criticality level** |  Indicates the critical level of the identity. |
|**Account status** |  Shows whether the identity is enabled or disabled. |
|**Last updated** |  The timestamp of the most recent update to the identity's attributes in Active Directory.|

Nondefault columns: Email, Microsoft Entra ID risk level, and Cloud ID. 


### Sort and filter the Identities list

You can apply the following filters to limit the list of identities and get a more focused view:

- Domain
- Type
- Source
- Tags
- Criticality level
- Account status

Sort option applies to Display name, Domain, and Created time columns.

### Related Articles

- [Investigate cloud application accounts](/defender-cloud-apps/accounts)

- [Investigate users in Microsoft Defender XDR](/defender-xdr/investigate-users) 

- [Investigate assets in Microsoft Defender for Identity](/defender-for-identity/investigate-assets)

