---
title: Set up a new site for Site security for Microsoft Defender for IoT in XDR Defender portal
description: This article describes the set up procedure for a new site in the Site security feature of Microsoft Defender for IoT in XDR Defender portal
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Set up a new site for Site security/ Defender for IoT?

In this article you learn how to set up a new site in the Site security feature. Microsoft Defender for IoT uses *sites* to group Operational Technology (OT) devices located at a specific physical location, such as an office or factory building.

## Prerequisites

Are these correct, are there other items needed here? What level of roles are needed?
What do we need here?

- OT Security Admin with MDE P2/E5. For more information, see [Microsoft Defender for Endpoint subscriptions settings](defender-endpoint/defender-endpoint-subscription-settings.md).
- Microsoft Defender for IoT license with at least one site license available. For more information, see [Microsoft Defender for IoT subscriptions settings](license-admin-center.md).
- You might also need IP or MAC address details of at least one OT device at the site.

For more information, see [the general prerequisites needed for Microsoft Defender for IoT](prerequisites.md).

## Three stages of setup

Defender for IoT works by connecting to the OT devices on your network and use the MDE agent to identify and locate other OT and IoT devices at the same location and adds them to the Device inventory. Before setting up a Defender for IoT site, OT devices listed in the Device inventory show minimal data. Once the OT devices are associated with a site, they show the full range of security related data available, including risk and exposure data.

There are three stages to setting up a site. <!-- not sure to keep this or not, or move to a concept intro article -->

First, enter the site details and the owners of the site.

Second, associate OT devices located at a specific physical location to this new site. This allows Microsoft Defender for IoT in the XDR portal to suggest a list of other OT devices it identifies at the same location. You might need to choose more than one suggested list of OT devices. The list also shows the number of total IoT devices Defender for IoT predicts are at the site, which helps you identify if the location matches the known number of devices there. If the numbers are significantly different this indicates that this isn't part of your site.

Finally review the site details before creating the site. Once the site is created, you can also make a device group to give access permissions to users of this site. For more details, see [RBAC and user permissions in XDR](/defender-endpoint/user-roles.md). <!-- what link goes here? -->

## Create a new site

1. In the Site security dashboard, select **Create new site** or **Create Your First Site**.

1. Enter the following details:

- Site name - a name for the site, for example, San Franscico Main office.
- Location - the physical location of the office.
- Site description - describe the purpose of the site, what activities occur there, the types and number of devices used, and other important information about the site.
- Owners - the contact emails of any users administering the site, who must be contacted when problems occur.

    :::image type="content" source="media/site-security-set-up-details.png" alt-text="Screenshot showing the details for a new site in the Site security page of Microsoft Defender for IoT in the Microsoft Defender portal.":::

1. When completed, select **Next**.

## Associate devices

OT devices are associated with the site allowing Microsoft Defender for IoT to correctly identify other OT/IoT devices at the same site.

1. In the Search bar, type either a public IP address or the IP/MAC address for a specific OT device that is located at this site. A list of suggested sites appears in the table.
    1. If you don't know any of the OT device addresses, select **Show all suggested sites**, and a list of all possible sites appears in the table.

    Each row in the table is a group of OT devices at the same specific location. Open the drop-down list of OT devices, and check to see which devices exist at your site. You should include any row that has your OT devices listed in it, as Defender for IoT might suggest several groups of devices for your location. You can't edit the list of devices at a location.

    1. Review the devices and select the rows to be added to your site. You might need to choose more than one item.

    :::image type="content" source="media/site-security-associate-devices.png" alt-text="Screenshot showing the associate devices screen and the suggested list of OT devices per location in the site set up page of Microsoft Defender for IoT in the Microsoft Defender portal.":::

1. Select **Next**.

## Review site details

1. Review that information for the site you want to create.

    If you want to review the selected OT devices, select **Edit devices** and you return to the **Associate devices** screen.

1. Select **Complete**.

The site is now set up and appears in the Site security page.

:::image type="content" source="media/site-security-dashboard-with-new-site.png" alt-text="Screenshot showing the newly added site in the Site security dashboard of Microsoft Defender for IoT in the Microsoft Defender portal.":::

## Add device group

Create a device group based on a site location to restrict users to that specific site.<!-- OR -->

It's important that only the correct users have access to the site. Access and permission controls can be set for groups of users to restrict access a specific site or group of sites. Create a **Device group** and set the access per user. <!-- should device group be bolded? -->

1. Select **Create device group**. The Settings > Endpoints > Device groups page opens.
1. Select **Add device group**.
1. Type a **Device group name**.
1. Select the **Remediation level**.
1. Type a **Description**.<!-- optional -->
1. Select **Next**. The Devices page opens.
1. Type the value for the **Tag** condition. Type the term **Site:** and then the name of the site. For example, Site: San Francisco.
1. Select **Next**. The Preview devices page opens.
1. The Preview devices page displays a list of devices so that you can ensure you're creating the correct group. Select **Next**. The User access page opens.
1. Filter the user groups or choose the user groups to add to the device group.
1. Select **Submit**. The device group is created.
1. Select **Done**.
<!-- do we need an image of any of the above stages? -->
Your device group is now set up and appears in the Device group list.
<!-- not sure how to deal with the rank detail. could use a note, or just a normal line and then have the click here line lower down. -->
For more information, see [create and manage roles in Microsoft Defender for Endpoint](../defender-endpoint/user-roles.md).

NOTE: Move the groups up or down to make the group with the highest rank list higher than the other groups. For more information, see [ranking device groups in Microsoft Defender for Endpoint](../defender-endpoint/machine-groups.md).

For more information, see [role based access control in Microsoft Defender for Endpoint](../defender-endpoint/rbac.md).<!-- Or this link /defender-endpoint/user-roles.md , which is better? Site security and RBAC - Mia -->

For more information, see [ranking device groups in Microsoft Defender for Endpoint](../defender-endpoint/machine-groups.md).

Information about ranking and RBAC. - look for the documentation for this - MDE documentation for rank in the endpoint device group page.

Next step or related content.

Information about ranking
