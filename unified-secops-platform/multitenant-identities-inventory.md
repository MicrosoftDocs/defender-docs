---
# Required metadata
# For more information, see https://learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata
# For valid values of ms.service, ms.prod, and ms.topic, see https://learn.microsoft.com/en-us/help/platform/metadata-taxonomies

title: Multitenant identities
description: A multi-tenant identity inventory
author: LiorShapiraa
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 06/29/2025
---

# Identities

The **Identities** page in multitenant management enables you to quickly manage tenants and identities.

## Identity inventory

The Identity inventory page lists all the identities in each tenant that you have access to. The page is like the [Defender for Identity inventory](/defender-for-identity/identity-inventory) with the addition of the **Tenant name** column and filter. 

You can navigate to the identity inventory page by selecting **Assets > Identities** in Microsoft Defender XDR's navigation menu.

:::image type="content" source="media/multitenant-identities-inventory/screenshot-of-inventory.png" alt-text="Screenshot of inventory." lightbox="media/multitenant-identities-inventory/screenshot-of-inventory.png":::
   
At the top of the page, the following identities counts are available for all tenants:

**Total**: The total number of identities.

**Critical:** The number of your critical assets.

**Disabled:** The number of all disabled identities in your organization.

**Services:** The number of all service accounts both on-premises and cloud.

You can use this information to help you prioritize identities for security posture improvements.

Highly privileged identities card helps you investigate in Advanced hunting all sensitive accounts in your organization, including Microsoft Entra ID security administrators and Global admin users.

There are several options you can choose from to customize the identities list view. On the top navigation you can:

- Add or remove columns.

- Apply filters.

- Search for an identity by name or full UPN, SID, and Object ID.

- Export the list to a CSV file.

- Copy list link with the included filters configured.

> [!NOTE]
> When exporting the identities list to a CSV file, a maximum of 5,000 identities are displayed.

To view full identity details, select a specific identity from the list. Tenant ID and Tenant name are available in the identity side panel and page:

:::image type="content" source="media/multitenant-identities-inventory/screenshot-of-tenant-details-on-identity.png" alt-text="Screenshot of tenant details on identity.":::



