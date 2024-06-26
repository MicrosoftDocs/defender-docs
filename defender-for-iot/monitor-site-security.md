---
title: Monitor site security for Microsoft Defender for IoT in the Defender portal
description: Read this article to get an overview of monitoring site security for Microsoft Defender for IoT in Microsoft Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: reference
---

# Site security monitoring

The **Site security** page in Microsoft Defender for IoT in the Microsoft Defender portal offers an overview of the security state of your entire OT/IoT network. Your organization's security team can use this page to regularly monitor the security status of your production sites.

In this article, you gain an understanding of different site security features, so your security team can decide how to prioritize and assign security issues to other team members.

Learn more about the [site security benefits and use cases](site-security-overview.md).

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Site security page

The Site security page gives you an overview of the security status of your network and is divided into two main sections:

- The top **How protected are your sites** section displays a general overview of your entire network, including sites with the highest number of devices that are exposed or at risk.
- The rest of the page lists security information for each site.

The data displayed in the **Site security** page is the total aggregated data for the entire network, and might include data for sites that you don't have access to. When you select numbers in the site list columns (see [Site list](#site-list)), you can only view data you can access. For example, if you don't have access to a site, you won't see that data in the device inventory.

## "How protected are your sites?" section

The top **How protected are your sites** section displays the following network wide security information to guide your security decisions:

|Type |Description |Available actions |
|----|----|----|
|**Monitored OT sites** |The number of monitored sites. |Select **Get more sites** to add more sites. |
|**Total devices** |The number of total OT devices monitored across the entire network. |Select **View inventory** to access the Device inventory. |
|**Top vendors** |The number of OT devices in your network according to the vendor that produces them. |Select **View all** to access the view the devices and vendor information in the **Device Inventory** page. |
|**High risk devices** |The number of high risk OT devices for the top three sites. |You can access this data in the Device inventory. |
|**High exposure devices** |The number of highly exposed OT devices for the top three sites. |You can access this data in the Device inventory. |

## Site list

The rest of the **Site security** page lists each site and displays the following site specific security data:

|Column | Description|Available actions |
|----|----|----|
|**Site name** |The site name and description. |- Select the **Site name** to open the **Insights** panel. This panel displays site details, such as total devices, site location, and site owners. You can also select **Edit site** to make changes to the site.<br>- Select the ellipsis (:::image type="icon" source="media/menu-ellipsis.png" alt-text="menu vertical ellipsis button":::) to the left of the **Total devices** column to [manage the site](manage-sites.md).
|**Critical** |The number of critical devices at a site. |Select the number to open the **Device Inventory** page, filtered according to the site name and criticality level. |
|**Highly-exposed devices** |The number of highly exposed devices at this site. |Select the number to opens the **Device Inventory** page, filtered according to the site name and high exposure level. |
|**Devices with high risk** |The number of high risk devices at this site. |Select the number to open the **Device Inventory** page, filtered according to the site name and high risk level. |