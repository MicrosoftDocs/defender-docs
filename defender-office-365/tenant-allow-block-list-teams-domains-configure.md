---
title: Block domains in Microsoft Teams using the Tenant Allow/Block List
f1.keywords:
  - NOCSH
author: chrisda
ms.author: chrisda
manager: bagol
audience: ITPro
ms.topic: how-to
ms.localizationpriority: medium
search.appverid:
  - MET150
ms.collection:
  - m365-security
  - tier1
description: Admins can learn how to block domains in Microsoft Teams using the Tenant Allow/Block List.
ms.service: defender-office-365
ms.date: 10/15/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Block domains in Microsoft Teams using the Tenant Allow/Block List

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In all organizations with Microsoft Teams and cloud mailboxes, admins can create and manage block entries for domains in Microsoft Teams using the Tenant Allow/Block List. These blocked domain entries also appear on the **Organization settings** tab of the **External access** page in the Microsoft Teams admin center at <https://admin.teams.microsoft.com/company-wide-settings/external-communications> in the **Teams and Skype for Business users in external organizations** section:

:::image type="content" source="media/tenant-allow-block-list-teams-domains.png" alt-text="Screenshot of the External access page in the Microsoft Teams admin center showing blocked domains." lightbox="media/tenant-allow-block-list-teams-domains.png":::

For more information about the Tenant Allow/Block List, see [Manage allows and blocks in the Tenant Allow/Block List](tenant-allow-block-list-about.md).

This article describes how security admins can manage entries for blocked domains in Teams admin center using the Microsoft Defender portal.

## What do you need to know before you begin?

- You open the Microsoft Defender portal at <https://security.microsoft.com>. To go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>. Then, go to the **Teams domains** tab.

- After you add the block entry for the domain in Teams, all new Teams communication from that organization is blocked. Block communication includes new Teams meetings, chats, channels, and calls. Existing Teams meetings, chats, channels, and calls are deleted.

- On the **Organization settings** tab of the **External access** page in the Microsoft Teams admin center at <https://admin.teams.microsoft.com/company-wide-settings/external-communications>, the following settings are required to create and manage block entries for domains in Teams using the Tenant Allow/Block List:
  - **Teams and Skype for Business users in external organizations** must be **Allow all external domains** or **Block only specific external domains**.
  - **Allow my security team to manage blocked domains** must be :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

- The maximum number of domain block entries for Microsoft Teams is 4,000.

- Block entries for domains in Teams never expire.

- An entry should be active within 24 hours.

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in these roles gives users the required permissions _and_ permissions for other features in Microsoft 365:
    - _Add, modify, and delete entries_: Membership in the **Global Administrator**<sup>\*</sup>, **Teams Administrator**, **Security Administrator**, or **Security Operator** roles.
    - _Read-only access to entries_: **Global Reader**, or **Security Reader** roles.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

## Create block entries for domains in Teams in the Tenant Allow/Block List

   > [!TIP]
   > See the requirements in the [What do you need to know before you begin?](#what-do-you-need-to-know-before-you-begin) section to managed blocked domains in Teams in the Tenant Allow/Block list. You don't get a **Teams domains** tab on the **Tenant Allow/Block Lists** page if you don't meet the requirements.

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Email & collaboration** \> **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

2. On the **Tenant Allow/Block Lists** page, select the **Teams domains** tab.

3. On the **Teams domains** tab, select :::image type="icon" source="media/m365-cc-sc-create-icon.png" border="false"::: **Block**.

4. In the **Block external domains in Teams** flyout that opens, enter up to 20 domains separated by commas or line breaks, and then select **Add**.

   Back on the **Teams domains** tab, the domain block entries are listed. After a few minutes, the blocked domains also appear on the **Organization settings** tab of the **External access** page in the Microsoft Teams admin center at <https://admin.teams.microsoft.com/company-wide-settings/external-communications>.

## View block entries for domains in Teams in the Tenant Allow/Block List

In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Tenant Allow/Block Lists** in the **Rules** section. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

On the **Teams domains** tab, select the **Teams domains**.

On the **Teams domains** tab, you can sort the entries by clicking on an available column header. The following columns are available:

- **Value**: The domain or email address.

Use the :::image type="icon" source="media/m365-cc-sc-search-icon.png" border="false"::: **Search** box and a corresponding value to find specific entries.

### Remove block entries for domains in Teams in the Tenant Allow/Block List

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Email & collaboration** \> **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

2. On the **Tenant Allow/Block Lists** page, select the **Teams domains** tab.

3. On **Teams domains** tab, select the entry from the list by selecting the check box next to the first column, and then select the :::image type="icon" source="media/m365-cc-sc-delete-icon.png" border="false"::: **Delete** action that appears.

   > [!TIP]
   > You can select multiple entries by selecting each check box, or select all entries by selecting the check box next to the **Value** column header.

4. In the warning dialog that opens, select **Delete**.

   Back on the **Teams domains** tab, the entry is no longer listed. After a few minutes, the blocked domain disappears from the **Organization settings** tab of the **External access** page in the Microsoft Teams admin center at <https://admin.teams.microsoft.com/company-wide-settings/external-communications>.

## Related articles

- [Managing external access in Teams admin center](/microsoftteams/trusted-organizations-external-meetings-chat?tabs=organization-settings#specify-trusted-microsoft-365-organizations)
- [Report false positives and false negatives in Teams](submissions-teams.md)
- [Allow or block files in the Tenant Allow/Block List](tenant-allow-block-list-files-configure.md)
- [Allow or block URLs in the Tenant Allow/Block List](tenant-allow-block-list-urls-configure.md)
