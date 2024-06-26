---
title: Set up a new site for Site security for Microsoft Defender for IoT in the Microsoft Defender portal
description: This article describes the set-up procedure for a new site in the Site security feature of Microsoft Defender for IoT in the Microsoft Defender portal
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Set up a site


In this article, you learn how to set up a site in the Site security page. Microsoft Defender for IoT in the Defender portal uses *sites* as the basis for grouping devices that are located in an operation environment at a particular physical location, such as a factory building. Defender for IoT uses the Microsoft Defender for Endpoints agent to identify and locate operational technology (OT) devices and all other devices at the same physical location. Defender for IoT adds these devices to the Device inventory, so we recommend that you know the IP address of at least one OT device that is discovered by the Defender for Endpoints agent.

The Site security page gives the security team an overview of the most important security issues affecting your network and their business impact. This information lets the security team make quick, highly informed decisions to prioritize and organize their response to security problems more effectively.

## Prerequisites

- Review [the general prerequisites needed for Microsoft Defender for IoT](prerequisites.md).

- Site security permissions according to RBAC requirements. For more information, see [RBAC permissions for Defender for IoT](prerequisites.md#permissions).
- Microsoft Defender for IoT trial license. For more information, see [Microsoft Defender for IoT subscriptions settings](get-started.md).
- We recommend you have IP or MAC address details of at least one OT device at the site that is discovered by Microsoft Defender for Endpoints.


## Create a site

To set up a site and associate the OT devices in your network to it:

1. Log into Microsoft Defender portal.
1. Select **Operational Technology** in the side menu bar.
1. Select **Site security**.
1. In the Site security dashboard, select **Create new site** or **Create Your First Site**.

1. Enter the following details:

    - Site name - a name for the site, for example, San Franscico.
    - Location - the physical location of the production site. <!-- manufacturing site? -->
    - Site description - describe the purpose of the site, what activities occur there, the types and number of devices used, and other important information about the site.
    - Owners - the contact emails of any users administering the site, who must be contacted when problems occur.

    :::image type="content" source="media/site-security-set-up-details.png" alt-text="Screenshot showing the details for a new site in the Site security page of Microsoft Defender for IoT in the Microsoft Defender portal." lightbox="media/site-security-set-up-details.png" :::

1. When completed, select **Next** to associate devices to the site.

## Associate devices

OT devices are associated with the site allowing Microsoft Defender for IoT to correctly identify other OT/IoT devices at the same site.

1. In the Search bar, type either a public IP address or the IP/MAC address for a specific OT device that is located at this site. A list of suggested sites appears in the table.
    1. If you don't know any of the OT device addresses, select **Show all suggested sites**, and a list of all possible sites appears in the table.

        Each row in the table is a suggested site location based on the OT devices found there. Open the location to see the list of OT devices identified there, and check that at least one <!--some -->of these devices exists at your site. You should look through each location, as Defender for IoT could list your OT devices in more than one suggested location. If this happens, you should tick all of the suggested locations that contain an identified OT device. There's no limit to the number of locations you can choose. However, you can't edit the list of devices that appear at a specific location.

    1. Review the devices and select the rows to be added to your site. You might need to choose more than one item.

    :::image type="content" source="media/site-security-associate-devices.png" alt-text="Screenshot showing the associate devices screen and the suggested list of OT devices per location in the site set-up page of Microsoft Defender for IoT in the Microsoft Defender portal.":::

1. Select **Next** to review the site details.

## Review site details

1. Review that information for the site you want to create.

    If you want to review the selected OT devices, select **Edit devices** and you return to the **Associate devices** screen.

    You could create a Device group now or finish the site set-up. A Device group can also be set up at a later stage or a different team member might create it. For more information, see [add a device group](#add-device-group).

1. Select **Complete**.

The site is now set up and appears in the Site security page.

When the site is created data starts to appear once each OT device performs a network activity and contacts the Defender portal. For some devices this happens quickly, but other devices might only connect to the portal after intervals of days or weeks, in which case the data takes time to appear in the inventory. The data appears in the device inventory under **Site tag** and **site attribute**.
<!-- OR Once the site is created, the data in the device inventory starts to update and include data for the **Site tag** and **site attribute**. However, the data update only occurs the next time a device performs a network activity and contacts the Defender portal, for some devices this happens quite quickly. However, other devices might only connect to the portal with interbals of days or weeks, in which case data takes time to appear in the inventory.-->

Once this connection is made and the site tag and attribute data appears, the OT device is protected and all of the security value provided by Defender for IoT are available, such as alerts, vulnerabilities and more.

>[!NOTE]
> Once the site is created any new devices added to the network will automatically be detected and added to the device inventory. Also, if a device is moved to a different or new location within the network, these changes are automatically made to the network.

## Add device group

A device group can be made using the link at the end of the Site set up process, or set up at another time.

Create a device group based on a site location to restrict users to that specific site. <!-- [ OR ] -->

It's important that only the correct users have access to the site. Access and permission controls can be set for groups of users to restrict access to a specific site or group of sites. Create a **Device group** and set the access per user.

1. Select **Create device group**. The Settings > Endpoints > Device groups page opens.
1. Select **Add device group**.
1. Type a **Device group name**.
1. Select the **Remediation level**.
1. Type a **Description**.
1. Select **Next**. The Devices page opens.
1. Type the value for the **Tag** condition. Type the term **Site:** and then the name of the site. For example, Site: San Francisco.
1. Select **Next**. The Preview devices page opens.
1. The Preview devices page displays a list of devices so that you can ensure you're creating the correct group. Select **Next**. The User access page opens.
1. Filter the user groups or choose the user groups to add to the device group.
1. Select **Submit**. The device group is created.
1. Select **Done**.

Your device group is now set up and appears in the Device group list.

## Rank device groups

Device groups might list different preferences for the same user, in which case you need to rank the importance of each Device group.

To move a group up or down, drag that row to the correct position in the list. For more information, see [ranking device groups in Microsoft Defender for Endpoint](/defender-endpoint/machine-groups.md).

## Assign device group roles and permissions

To get the full benefit of the Device group, you might need to create roles and permission settings. For more information, see [role based access control in Microsoft Defender for Endpoint](/defender-endpoint/rbac.md), and [create and manage roles in Microsoft Defender for Endpoint](/defender-endpoint/user-roles.md).
