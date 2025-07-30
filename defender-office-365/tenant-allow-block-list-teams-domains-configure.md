---
title: Block domains in Microsoft Teams using the Tenant Allow/Block List
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
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
ms.date: 07/29/2025
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
  - **Teams and Skype for Business users in external organizations** must be one of the following values:
    - **Allow all external domains**
    - **Block only specific external domains**
  - **Allow my security team to manage blocked domains** must be :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

- Block entries for domains in Teams never expire.

- An entry should be active within 5 minutes.

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>, **Security Administrator**, **Global Reader**, or **Security Reader** roles gives users the required permissions *and* permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft recommends that you use roles with the fewest permissions. Using lower permissioned accounts helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

## Create block entries for domains in Teams in the Tenant Allow/Block List

   > [!TIP]
   > See the requirements in the [What do you need to know before you begin?](#what-do-you-need-to-know-before-you-begin) section to managed blocked domains in Teams in the Tenant Allow/Block list. You don't get a **Teams domains** tab on the **Tenant Allow/Block Lists** page if you don't meet the requirements.

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

2. On the **Tenant Allow/Block Lists** page, select the **Teams domains** tab.

3. On the **Teams domains** tab, select :::image type="icon" source="media/m365-cc-sc-create-icon.png" border="false"::: **Add**, and then select **Block**.

4. In the **Block external domains in Teams** flyout that opens, configure the following settings:

   - **Add domains**: Enter one domain per line, up to a maximum of 20.

5. When you're finished in the **Block external domains in Teams** flyout, select **Add**.

Back on the **Teams domains** tab, the entry is listed. After a few minutes, the blocked domain also appears on the **Organization settings** tab of the **External access** page in the Microsoft Teams admin center at <https://admin.teams.microsoft.com/company-wide-settings/external-communications>.

## View block entries for domains in Teams in the Tenant Allow/Block List

In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Tenant Allow/Block Lists** in the **Rules** section. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

On the **Teams domains** tab, select the **Teams domains**.

On the **Teams domains** tab, you can sort the entries by clicking on an available column header. The following columns are available:

- **Value**: The domain or email address.

Use the :::image type="icon" source="media/m365-cc-sc-search-icon.png" border="false"::: **Search** box and a corresponding value to find specific entries.

### Remove block entries for domains in Teams in the Tenant Allow/Block List

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

2. On the **Tenant Allow/Block Lists** page, select the **Teams domains** tab.

3. On **Teams domains** tab, select the entry from the list by selecting the check box next to the first column, and then select the :::image type="icon" source="media/m365-cc-sc-delete-icon.png" border="false"::: **Delete** action that appears.

   > [!TIP]
   > - You can select multiple entries by selecting each check box, or select all entries by selecting the check box next to the **Value** column header.

4. In the warning dialog that opens, select **Delete**.

Back on the **Teams domains** tab, the entry is no longer listed. After a few minutes, the blocked domain disappears from the **Organization settings** tab of the **External access** page in the Microsoft Teams admin center at <https://admin.teams.microsoft.com/company-wide-settings/external-communications>.

## Related articles

- [Managing external access in Teams admin center](/microsoftteams/trusted-organizations-external-meetings-chat?tabs=organization-settings#specify-trusted-microsoft-365-organizations)
- [Report false positives and false negatives in Teams](submissions-teams.md)
- [Allow or block files in the Tenant Allow/Block List](tenant-allow-block-list-files-configure.md)
- [Allow or block URLs in the Tenant Allow/Block List](tenant-allow-block-list-urls-configure.md)