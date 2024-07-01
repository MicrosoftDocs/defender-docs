---
title: Manage sites for Microsoft Defender for IoT in the Microsoft Defender portal
description: Read this article to get an overview of managing site information in the Site security page of the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 06/25/2024
ms.topic: how-to
---

# Manage sites

Microsoft Defender for IoT in the Microsoft Defender portal includes the **Site security** page, which allows you to see the up-to-date security state of your production sites. Learn more about the [site security benefits and use cases](site-security-overview.md) or the [**Site security** page](monitor-site-security.md).

When you manage a site, you might need to edit or delete the site information listed in the **Site security** page.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Edit or delete a site

To edit or delete a site:

1. In the [Microsoft Defender portal](https://security.microsoft.com/machines) menu, select **Operational technology** > **Site security**.
1. Select the ellipsis (:::image type="icon" source="media/manage-sites/menu-ellipsis.png" alt-text="menu vertical ellipsis button":::) to the right of the site name.
1. Select one of the following:

    - Select **Edit site** to open the **Site details** pane, where you can make changes to the site. For more information, see [Site details](set-up-sites.md).
    - Select **Delete site** to remove a site from the site list. This deletes all site-related information for the associated devices.

## Add device group

You can create a device group based on a site location to restrict access to a specific site or group of sites, and verify that the correct users have access to your site.

You can set up a device group at different stages:

- To set up a device group as part of the site setup, see [Add a device group](set-up-sites.md#add-device-group).
- To set up a device group after you set up a site, see [Create and manage device groups](/defender-endpoint/machine-groups).

To get the full benefit of the device group, you might need to create roles and permission settings. For more information, see:

- [Role based access control in Microsoft Defender for Endpoint](/defender-endpoint/rbac) 
- [Create and manage roles in Microsoft Defender for Endpoint](/defender-endpoint/user-roles)
