---
title: Monitor site security for Microsoft Defender for IoT in the Defender portal
description: Learn how to monitor the site security for Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 06/25/2024
ms.topic: how-to
---

# Monitor site security

Microsoft Defender for IoT in the Microsoft Defender portal includes the **Site security** page, which offers an overview of the security state of your entire OT environment. Your organization's security team can use this page to regularly monitor the security status of your production sites.

In this article, you learn how to gain an overview of your site security, so your security team can decide how to prioritize and assign security issues.

Learn more about the [site security benefits and use cases](site-security-overview.md).

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Prerequisites

- Review [the general prerequisites needed for Microsoft Defender for IoT](prerequisites.md).
- Review site security permissions according to RBAC requirements. For more information, see [RBAC permissions for Defender for IoT](set-up-rbac.md).

## Review the Site security page

The **Site security** page gives you an overview of the security status of your network and is divided into two main sections:

- [Review the top **How protected are your sites** section](#review-site-protection-information) to get a general overview of your entire network, including sites with the highest number of devices that are exposed or at risk.
- [Review the site list](#review-the-site-list) to monitor specific security information for each site.

:::image type="content" source="media/monitor-site-security/site-security-page-blurred.png" alt-text="Screenshot showing the site security page with a list of sites." lightbox="media/monitor-site-security/site-security-page-blurred.png":::

The data displayed in the **Site security** page is the total aggregated data for the entire environment, and might include data for sites that you don't have access to. When you drill down into device data from the [site list](#review-the-site-list), the **Device Inventory** page only displays data for devices you can access.

## Review site protection information

Review the top **How protected are your sites** section to get the following information:

|Section |Description |Next steps |
|----|----|----|
|**Monitored OT sites** |The number of monitored sites. |Select **Get more sites** to add more sites. |
|**Total devices** |The number of total OT devices monitored across the entire network. |Select **View inventory** to access the Device inventory. |
|**Top vendors** |The number of OT devices in your network according to the vendor that produces them. |Select **View all** to view the devices and vendor information in the **Device Inventory** page. |
|**Top sites with high risk devices** |The number of high risk OT devices for the top three sites. This number indicates devices that might have been breached (post-breach). |Select the site name to open the **Device Inventory** page filtered to show devices in this site. |
|**Top sites with high exposure devices** |The number of highly exposed OT devices for the top three sites. This number indicates devices vulnerable to a breach (pre-breach). |Select the site name to open the **Device Inventory** page filtered to show devices in this site. |

## Review the site list

Review the site specific data in the sites list table.

Note that the data displayed in this table is the total aggregated data for the entire environment, and might include data for sites that you don't have access to. When you drill down into device data, the **Device Inventory** page only displays data for devices you can access.

|Column | Description|Next steps |
|----|----|----|
|**Site name** |The site name and description. |- Select the **Site name** to open the **Insights** panel. This panel displays site details, such as total devices, site location, and site owners. You can also select **Edit site** to make changes to the site.<br>- Select the ellipsis (:::image type="icon" source="media/monitor-site-security/menu-ellipsis.png" alt-text="menu vertical ellipsis button":::) to the right of the site name to [manage the site](manage-sites.md).
|**Critical devices** |The number of critical devices at this site. A critical device is a self assigned device that has extra importance to your business or system, such as a server that contains confidential data. |- Use this data to prioritize protection for sites with critical devices.<br>- Select the number to open the **Device Inventory** page, filtered according to the site name and criticality level. |
|**Highly-exposed devices** |The number of highly exposed devices at this site. |Select the number to open the **Device Inventory** page, filtered according to the site name and high exposure level. |
|**Devices with high risk** |The number of high risk devices at this site. |Select the number to open the **Device Inventory** page, filtered according to the site name and high risk level. |

When you select an individual site, the site specific pane open, with details and data about that site, for example:

:::image type="content" source="media/monitor-site-security/site-security-side-pane.png" alt-text="Screenshot showing the site security page with a list of sites and the site specific side pane open displaying details and data for that site." lightbox="media/monitor-site-security/site-security-side-pane.png":::
