---
title: Import user groups from connected apps
description: This article provides instructions for importing your user groups from connected apps into Defender for Cloud Apps.
ms.date: 01/29/2023
ms.topic: how-to
---

# Import user groups from connected apps



When you connect apps using API connectors, Microsoft Defender for Cloud Apps enables you to import user groups, for example from Microsoft 365 and Microsoft Entra ID. There are two types of user groups:

- **Automatic groups:** Automatic groups are created by default by Microsoft Defender for Cloud Apps. For example, there's an automatic user group called **External** that combines all users from all apps who are external to your organization and have access to files or were in user activities in your tenant. The following automatic groups exist in Defender for Cloud Apps:

  - External
  - Dropbox administrator
  - Microsoft 365 administrator
  - Google Workspace administrator
  - Box administrator
  - All Salesforce standard and custom profiles, for example, Salesforce System Administrator. See the full list [here](https://help.salesforce.com/s/articleView?id=sf.standard_profiles.htm).

- **Imported groups:** You can import any group from your connected apps. For example, you can import user groups from Microsoft 365 (Active Directory) and other connected apps. These groups enable you to look for threats in your org, not by looking at the whole org or at a specific user, but by looking at a specific group.

  Typical scenarios that use imported user groups include:

  - Investigating which docs the HR people look at.
  - Check if there's something unusual happening in the executive group.
  - Find if someone from the admin group performed an activity outside the US.

## Import user groups

1. In Microsoft Defender XDR, select **Settings > Cloud Apps > System > User groups > + Import user group**.

1. In the **Import user group** pane, select the app from which to import the user group. The apps shown depend on which connectors you've deployed.

1. Select the group you want to import. The list includes the first 50 groups from the existing user groups in the app. If you don't see your group, enter search text in the search field above the list.

   To add a new group to the list, do so in the app itself, and then return to the Microsoft Defender portal to view your new group in the list.

1. (Optional) Select to be notified by email when the import process is complete. 

1. Select **Import**.

After the import is complete, select your group from the **User groups** page to view a list of all group members. Select any group member to drill down further for more details, including the apps used and a summary of the account activities. Imported groups can also be selected as filters when investigating in the **Activity log** and when creating policies. Group members are automatically synchronized for imported groups, just as they are for Active Directory Connect.

> [!NOTE]
>
> - The maximum number of imported user groups is 500.
> - Only active users will be imported as part of the imported group. Any suspended, deleted, or disabled users will be ignored.
> - There may be a short delay until imported user groups are available in filters.
> - Only activities performed after importing a user group will be tagged as having been performed by a member of the user group.
> - After the initial sync, groups are usually updated every hour. However, due to various factors there could be times where this might take several hours.

For more information on using the User group filters, see [Activities](activity-filters.md).

## Next steps

> [!div class="nextstepaction"]
> [Set up cloud discovery](set-up-cloud-discovery.md)

[!INCLUDE [Open support ticket](includes/support.md)]
