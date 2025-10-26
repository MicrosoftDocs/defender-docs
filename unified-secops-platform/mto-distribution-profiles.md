---
title: Content distribution using distribution profiles in multitenant management
description: Learn about content distribution across tenants in the Microsoft Defender multitenant portal.
ms.service: microsoft-defender
ms.subservice: unified-security-operations
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection: 
- m365-security
- highpri
- tier1
ms.topic: concept-article
ms.date: 07/31/2025
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Content distribution in multitenant management

Content distribution in the Microsoft Defender multitenant portal helps you organize and manage content at scale across your tenants, based on categories like business groups or locations. Create distribution profiles to copy existing content, like custom detection rules, from the source tenant to the target tenants. The distributed content then runs on any relevant device or device groups that you set in the distribution profile scope.

## Supported content for distribution

Create distribution profiles to distribute the following types of content across multiple tenants:

- Custom detection rules
- Endpoint security policies, supported for Microsoft Defender for Endpoint customers only

## Requirements

The following table lists the requirements for using content distribution in the Microsoft Defender multitenant portal.

| Requirement | Description |
|:---|:---|
|**Licensing requirements** | Your organization must have a subscription to Microsoft 365 E5 or Office E5.|
|**Permissions** | Users must be assigned the correct roles and permission at the individual tenant level to view and manage the associated data in multitenant management. <br/> Access to content distribution is granted through the Security settings (manage) or Security Data Basic (read) permission in [Microsoft 365 Defender Unified role-based access control (URBAC)](/defender-xdr/manage-rbac). By default, both of these roles are assigned to the **Security Administrator** and **Security Reader** Microsoft Entra built-in roles.|
|**Delegate access** |Delegated access via [Azure B2B](/entra/external-id/add-users-administrator) or [GDAP (CSP Parters only)](/microsoft-365/lighthouse/m365-lighthouse-setup-gdap) must be obtained for at least one other tenant.|

## Create distribution profiles

To create a new distribution profile:

1. In the Microsoft Defender multitenant portal, go to the [**Multi-tenant management > Content distribution**](https://mto.security.microsoft.com/contentdistribution) page.

1. Select **Create** to open the **Create content distribution profile** wizard. In the wizard, enter the following details, selecting **Next** as needed to navigate through the tabs. Some tabs are only relevant if you've selected that type of content to distribute.
   
   |Tab  |Instructions  |
   |---------|---------|
   |**Details**     | Enter a name and optional description for your content distribution profile.        |
   |**Assign tenants**     |    Select **Add tenant** to see a list of available tenants that you can add to your distribution profile, select the tenants you want to add, and then select **Add**.     |
   |**Select content type**     | Content types are all selected by default. Verify that the selection matches the content you want to distribute in this distribution profile.      |
   |**Custom detection rules**     | Relevant only if you'd selected **Custom detection rules** in the **Select content type** page. <br><br>1. Select **Add content**.<br>2. In the **Select detection rules** side pane, select the rules that you want to add to the distribution profile, and then select **Add to distribution profile**.    |
   |**Endpoint security policies**     | Relevant only if you'd selected **Endpoint security policies** in the **Select content type page**. <br><br>1. Select **Add content**. <br>2. In the **Select security policies** side pane, select the policies that you want to add to the distribution profile, and then select **Add to distribution profile**.         |

   At this point, you'll reach either the **Device groups** sub-page or the **Endpoint security policies** subpage, where you define the devices or device groups that need to be in your tenant's scope. Distribution profiles support a single scope for the entire profile, or separate scopes per rule. 

   Select **Single scope** or **Scope per rule** to toggle between these options, and **Edit scope** to make changes as needed. 

1. In the **Summary** tab, review the details of the distribution profile you created. If you want to sync all authorized tenants now, leave the **Sync all authorized tenants** option checked. If you want to sync later, uncheck it.

1. Select **Submit** to finish your distribution profile creation.

If you chose to **Sync all authorized tenants**, all the tenants and scope within the tenants you have permission automatically syncs.

Your newly created distribution profile appears in the distribution profiles page after creation.

:::image type="content" source="media/mto-tenantgroups/distribution-profiles.png" alt-text="Screenshot of the Content distribution page with content distribution profiles created." lightbox="media/mto-tenantgroups/distribution-profiles.png":::

Select a distribution profile from the list to add or remove content, add, edit, or remove tenants, or sync the distribution profile. Use the toolbar options at the top of the page to edit, remove, or sync distribution profiles.

If you're syncing the profiles, check the sync results under the **Last sync result** column. If the result is *partially successful* or *failed*, select the result to investigate the cause. When selecting the result, a side pane containing the errors, recommendations, and impacted assets appears. For example:

:::image type="content" source="media/mto-tenantgroups/mto-sync-results.png" alt-text="Screenshot of sync results side pane." lightbox="media/mto-tenantgroups/mto-sync-results.png":::

> [!NOTE]
> The maximum number of published items per publish operation is 9,500. Published items are calculated as the number of tenants multiplied by the number of templates. For example, if you publish 10 distribution profiles with 10 target tenants and 95 content templates, then the published items equals to 9,500.

## Syncing content among distribution profiles

To sync content across distribution profiles for the tenants you have permission for:

1. On the **Multi-tenant management > [Content distribution](https://mto.security.microsoft.com/contentdistribution)** page, select any distribution profiles you want to sync, and then select **Sync**.

1. At the prompt, select **Sync** again to confirm the sync operation. Once the sync is completed, you see one of the following statuses:

   - Success
   - Partially successful
   - Failure

1. If you experience a partial success or failure, select the value in the **Last sync result** column to investigate the cause.  

Sync results show the number of synced tenants and content. Synced tenants indicate how many tenants had custom detection rules applied successfully.

For example, if all rules are applied in 3 out of 3 tenants, the count is **3**; if only 2 tenants succeed, the count is **2**. Synced content represents the total custom detection rules synced across all target tenants.

## Troubleshooting and error handling

Common reasons for a sync to fail include:

- User doesn't have permission to create custom detection rules on the target tenant.
- User doesn't have permission to read custom detection rules from **content source**.
- User doesn't have permission for the target device scope.

If the issue is with the target tenant, try creating an identical custom detection rule for further diagnosis. If the issue is with accessing the source data, try accessing the custom detection.

A known issue exists with distribution profile errors. In some scenarios, such as when a user without the required permissions selects **See the assignment** on a policy error, an indefinite loading state might be shown without a clear error message. Users might also encounter generic or unclear error messages if Microsoft Entra is temporarily unavailable. In such cases, close the error message and verify your permissions and Microsoft Entra availability.

## Related content

- [Create and manage custom detections rules](/defender-xdr/custom-detection-rules)
- [Add Microsoft Entra B2B collaboration users in the Microsoft Entra admin center](/entra/external-id/add-users-administrator)
- [Set up GDAP for your customers in Microsoft 365 Lighthouse](/microsoft-365/lighthouse/m365-lighthouse-setup-gdap)
