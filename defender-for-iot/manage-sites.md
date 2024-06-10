---
title: Manage sites for Microsoft Defender for IoT in XDR Defender portal
description: Read this article to get an overview of managing site information in the new Site Security feature.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Manage sites

Once a site is in use, you might need to edit or delete the site information listed in the Site security table.
Microsoft Defender for IoT uses *sites* to group Operational Technology (OT) devices located at a specific physical location, such as an office or factory building. The Site security dashboard allows the security site management team an at-a-glance view of the most important security issues affecting your network to make quick, highly informed decisions about which security problems need of an immediate response.

## Prerequisites

- Review [the general prerequisites needed for Microsoft Defender for IoT](prerequisites.md).
- OT Security Admin with MDE P2/E5. For more information, see [Microsoft Defender for Endpoint subscriptions settings](/defender-endpoint/defender-endpoint-subscription-settings.md).

## Edit site

1. Select **Site security** in the Microsoft Defender menu.
1. In the site listings, press the :::image type="icon" source="media/menu-ellipsis.png" alt-text="menu vertical ellipsis button"::: menu and select **Edit site**.
1. The Site details pane opens allowing you to make changes. For more information, see [Site details](set-up-sites.md).

:::image type="content" source="media/site-security-edit-devices.png" alt-text="Screenshot showing the edit device and delete device menu option for a site listed in the Site security page of Microsoft Defender for IoT in the Microsoft Defender portal.":::

## Delete site

1. Select **Site security** in the Microsoft Defender menu.
1. In the site listings, press the :::image type="icon" source="media/menu-ellipsis.png" alt-text="menu vertical ellipsis button"::: menu and select **Delete site**.
1. The Site is removed from the table.

## Add Device group

Create a device group based on a site location to restrict access to a specific site or group of sites. Access and permission controls can be set for groups of users. It's important that the correct users have access to a site.

For more information, see [add a device group](set-up-sites.md#add-device-group).

To get the full benefit of the Device group, you might need to create roles and permission settings. For more information, see [role based access control in Microsoft Defender for Endpoint](/defender-endpoint/rbac.md).
Also see [create and manage roles in Microsoft Defender for Endpoint](/defender-endpoint/user-roles.md).

## Next steps

What should go here?
