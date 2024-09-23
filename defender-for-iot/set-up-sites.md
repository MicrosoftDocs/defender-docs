---
title: Set up and create sites for site security with Microsoft Defender for IoT in the Defender portal
description: This article describes how to set up and create a site as part of the site security feature included in Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 08/26/2024
ms.topic: how-to
---

# Set up sites

Microsoft Defender for IoT in the Microsoft Defender portal includes the **Site security** page, which offers an overview of the security state of your entire operational technology (OT) environment. Your organization's security team use this page to regularly monitor the security status of your production sites.

In this article, you learn how to set up a site in the **Site security** page.

Learn more about the [site security benefits and use cases](site-security-overview.md).

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Prerequisites

- Review [the general prerequisites for Microsoft Defender for IoT](prerequisites.md).
- Review the required site security permissions according to [RBAC requirements](set-up-rbac.md).
- Get a Microsoft Defender for IoT trial license. For more information, see [Microsoft Defender for IoT subscriptions settings](get-started.md).
- We recommend you have IP or MAC address details of at least one OT device at the site that is discovered by Microsoft Defender for Endpoint.

## Create a site

To set up a site and associate the OT devices in your network to it:

1. In the [Microsoft Defender portal](https://security.microsoft.com/machines) menu, select **Operational technology** > **Site security**.
1. In the **Site security** page, select **Create new site** or **Create Your First Site**.
1. Type the following details:

    - **Site name**: A name for the site, for example, San Francisco.
    - **Location**: The physical location of the production site.
    - **Site description**: Describe the purpose of the site, what activities occur there, the types and number of devices used, and other important information about the site.
    - **Owners**: The contact emails of any users administering the site who must be contacted when problems occur.

    :::image type="content" source="media/set-up-sites/site-security-set-up-details-new.png" alt-text="Screenshot showing the details for creating a new site in the Site security page of Microsoft Defender for IoT in the Microsoft Defender portal.":::

1. When completed, select **Next** to associate devices to the site.

## Associate devices

In this stage, you configure Defender for IoT to associate OT devices to the site, so it can correctly identify and associate all types of devices at the same site.

1. In the search bar, type either a public IP address or the IP/MAC address for a specific OT device that is located at this site.

    A list of suggested sites appears in the table.

1. If you don't know any of the OT device addresses:

    1. Select **Show all suggested sites**.

        A list of all possible sites appears in the table. Each row in the table represents a suggested site location based on the OT devices in that location.

    1. Open the location and check that at least one of these devices exists at your site.

        Check each location, because Defender for IoT might list your OT devices in more than one suggested location. If this happens, select all of the suggested locations that include an identified OT device. You can select any number of locations. However, you can't edit the list of devices that appear at a specific location.

1. Review the devices and select the suggested sites to associate with the site. You might need to select more than one suggested site.

    Use the **Group** column to check the ID for each suggested site. Sites with the same ID indicate that the devices are likely located at the same physical location. As these suggested sites are expected to belong to the same site, review and confirm that the devices listed are correct before making your selections and associating the suggested sites.

    :::image type="content" source="media/set-up-sites/site-security-associate-group.png" alt-text="Screenshot showing the associate devices screen and the suggested list of OT devices per location with the Group column in the site set-up page of Microsoft Defender for IoT in the Microsoft Defender portal." lightbox="media/set-up-sites/site-security-associate-group.png":::
  
1. Select **Next** to review the site details.

[!INCLUDE [defender-iot-site-association](includes/site-association.md)]

## Review site details

Review that information for the site you want to create:

1. Review the selected OT devices. If needed, select **Edit devices** to return to the **Associate devices** screen.
1. Select **Complete**.

    The site is now set up and appears in the **Site security** page.

    Regarding device data:

    - The site data in the **Device Inventory** under **Site tag** and **Site attribute** starts to appear after each OT device performs network activity and contacts the Defender portal. For some devices, this happens quickly, but for other devices, the data takes time to appear in the inventory. When the site tag and attribute data appears, the device is protected by Defender for IoT, including all of the security value, such as alerts, vulnerabilities, and more.
    - Any new devices that are added to the network are automatically detected and added to the **Device Inventory**. If a device is moved to a different or new location within the network, these changes are automatically made to the network.

1. Select **Create device group** to [create a device group](#add-device-group) now, or select **Close** and [set up a device group at a later stage](/defender-endpoint/machine-groups).

## Add device group

Use a device group to make sure that the correct users have access to the site. To create a device group:

1. Select **Create device group**.

    The **Settings > Endpoints > Device groups** page opens.

1. Select **Add device group** and type a device group name.
1. Select the remediation level, type a description, and select **Next**.

    The **Devices** page opens.

1. Type the value for the **Tag** condition in the format: *Site: \<Site name\>*. For example, *Site: San Francisco*.
1. Select **Next**.

    The **Preview devices** page opens with a list of devices in the group.

1. Select **Next**.

    The **User access** page opens.

1. Filter the user groups or select the user groups to add to the device group.
1. Select **Submit** and select **Done**.

    Your device group is now set up and appears in the device groups list.

## Rank device groups

If a device group lists different preferences for the same user, you need to rank the importance of each device group.

To move a group up or down, drag the row to the correct position in the list. For more information, see [ranking device groups in Microsoft Defender for Endpoint](/defender-endpoint/machine-groups).

## Assign device group roles and permissions

To get the full benefit of the Device group, you might need to create roles and permission settings. For more information, see [role based access control in Microsoft Defender for Endpoint](/defender-endpoint/rbac), and [create and manage roles in Microsoft Defender for Endpoint](/defender-endpoint/user-roles).

## Next steps

[Monitor site security](monitor-site-security.md)