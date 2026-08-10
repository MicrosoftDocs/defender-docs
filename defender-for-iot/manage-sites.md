---
title: Manage sites for Microsoft Defender for IoT in the Microsoft Defender portal
description: Learn how to manage site information in the Site security page, including updating device site associations, editing or deleting sites, and adding device groups in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 07/02/2026
ms.topic: how-to
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted
---

# Manage sites in Microsoft Defender for IoT

Microsoft Defender for IoT in the Microsoft Defender portal includes the **Site security** page, which allows you to see the up-to-date security state of your production sites. Learn more about the [site security benefits and use cases](site-security-overview.md) or how to [monitor site security](monitor-site-security.md).

When you manage a site, you might need to edit or delete the site information listed in the **Site security** page. Use the **Site security** page to update device site associations, edit or delete a site, and add a device group in the Microsoft Defender portal.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Manually update device site association

Security admininstrators can manually assign or modify the site location for a device. Manually assigning a site overrides the automatic site association created when making the site.

To quickly update a group of devices, select multiple devices from the inventory and set the site for all of the selected devices simulataneously.

**To change the site associated with a device**:

1. Select **Assets -> Devices** to open the **Device Inventory**.

1. Select the device, or group of devices, to update. A list of action buttons appear at the top of the Device Inventory table.

1. Select **Set site**. The **Set site** pane opens.

    :::image type="content" source="media/manage-sites/set-site-from-inventory-boxed.png" alt-text="Screenshot of the set site button in the device inventory table for changing the site location setting" lightbox="media/manage-sites/set-site-from-inventory-boxed.png":::

1. In **Set site manually**, open the **Select site** drop down list and select the site to associate with this device. If you want to leave a device unassociated with a specific site, select **Unassigned**.

    :::image type="content" source="media/manage-sites/device-set-site-manually.png" alt-text="Screenshot of the set site manually drop down list for changing the site location setting" lightbox="media/manage-sites/device-set-site-manually.png":::

1. Select **Save and close**.

1. The Set site confirmation box appears. Select **Confirm** to finalize the change. Finalizing the change prevents automatic site reassignment based on existing site security rules. The manual site assignment remains until the device is reset manually.

>[!Note]
>
>For managing an entire site, instead of manually changing each individual device to a new site, it is recommended to go to **Site security** and use the **Edit site** wizard to more efficiently manage the site and the devices associated to it. For more information, see [Monitor site security](monitor-site-security.md).

## Edit or delete a site

To edit or delete a site:

1. In the [Microsoft Defender portal](https://security.microsoft.com/machines) menu, select **Operational technology** > **Site security**.
1. Select the ellipsis (:::image type="icon" source="media/manage-sites/menu-ellipsis.png" alt-text="menu vertical ellipsis button":::) to the right of the site name.
1. Select one of the following:

    - Select **Edit site** to open the **Site details** pane, where you can make changes to the site. For more information, see [Site details](set-up-sites.md).
    - Select **Delete site** to remove a site from the site list.

        > [!WARNING]
        > Deleting a site removes all site-related information for the associated devices. This action can't be undone.

<a name="add-device-group"></a>
## Add a device group to a site

You can create a device group based on a site location to restrict access to a specific site or group of sites, and verify that the correct users have access to your site.

You can set up a device group at different stages:

- To set up a device group as part of the site setup, see [Add a device group](set-up-sites.md#add-device-group).
- To set up a device group after you set up a site, see [Create and manage device groups](/defender-endpoint/machine-groups).

To get the full benefit of a site-based device group, you might need to create roles and permission settings. For more information, see:

- [Role based access control in Microsoft Defender for Endpoint](/defender-endpoint/rbac) 
- [Create and manage roles in Microsoft Defender for Endpoint](/defender-endpoint/user-roles)
