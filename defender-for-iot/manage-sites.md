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

When managing a site, you might need to edit or delete the site information listed in the Site security table.

Microsoft Defender for IoT uses *sites* for grouping devices that are located in an operation environment at a particular physical location, such as a factory building. <!--The Site security page allows the security team an overview of the most important security issues affecting your network to make quick, highly informed decisions when responding to security problems.   - to remove this and others? -->

## Edit site

1. Select **Site security** in the Microsoft Defender menu.
1. In the site listings, press the :::image type="icon" source="media/menu-ellipsis.png" alt-text="menu vertical ellipsis button"::: menu and select **Edit site**.
1. The Site details pane opens allowing you to make changes. For more information, see [Site details](set-up-sites.md).

## Delete site

1. Select **Site security** in the Microsoft Defender menu.
1. In the site listings, press the :::image type="icon" source="media/menu-ellipsis.png" alt-text="menu vertical ellipsis button"::: menu and select **Delete site**.
1. The Site is removed from the table.

## Add Device group

Create a device group based on a site location to restrict access to a specific site or group of sites. Access and permission controls can be set for groups of users. It's important that the correct users have access to a site.

For more information, see [add a device group](set-up-sites.md#add-device-group).

To get the full benefit of the Device group, you might need to create roles and permission settings. For more information, see [role based access control in Microsoft Defender for Endpoint](/defender-endpoint/rbac.md). Also see [create and manage roles in Microsoft Defender for Endpoint](/defender-endpoint/user-roles.md).
