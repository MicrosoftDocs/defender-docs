---
title: Monitor site security for Microsoft Defender for IoT in XDR Defender portal
description: Read this article to get an overview of Monitor site security of the new Site Security feature.
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
ms.topic: how-to
---

# Monitor site security

The security site management team/ SOC admin or other users with access <!-- name/ title?--> regularly checks the information presented in the **Site security** dashboard to see the up-to-date security state of their network. Understanding the different features here guides the SOC to decide how to prioritize security issues for the rest of the security team.

## Monitoring

The dashboard gives you an overview of the security status of your network and is divided into two main sections.

The top of the page displays the Cross site panel, which gives a general overview of your entire network, including sites with the highest number of exposed or at risk devices.
The rest of the page displays a list of security information for each site.

## Aggregated site data panel

The top metrics panel contains network wide security information to guide your security decisions.

### Monitored OT sites

This displays the number of monitored sites.

To add more sites, select **Get more sites** for more information.

### Total devices

This displays the number of total devices monitored.

To see the list of all devices for your network, select **See in inventory**, which opens the Device inventory page.

### Top vendors

This shows the number of devices in your network according to the vendor that produces them.

Select the vendor name on the circle, which opens the Device inventory filtered according to the vendor.<!-- when i tried this it filtered by the site name not the vendor -->

### High risk devices

This displays the number of high risk devices for the top three sites.

Select **View in inventory** which opens the Device inventory filtered according to the site and high risk level.<!-- check this will appear correctly, when there is test data to use -->

### High exposure devices

This displays the number of highly exposed devices for the top three sites.

Select **View in inventory** which opens the Device inventory filtered according to the site and high exposure level.

## Site list security data

The dashboard lists each site and displays site specific security data.

### Site name

- Select the **Site name** to open the **Site insight** panel.
- Select the :::image type="icon" source="media/menu-ellipsis.png" alt-text="menu vertical ellipsis button"::: menu to manage the site. For more information, see [manage sites](manage-sites.md).

### Critical

This displays the number of critical devices at a site.

Select the number in the column, which opens the Device inventory filtered according to the site name and criticality level. <!-- is criticality level the correct filter name? check this will appear correctly, when there is test data to use -->

### Highly-exposed devices

This displays the number of highly exposed devices at this site and the change that occurred in the past 24 hours.

Select the number in the column, which opens the Device inventory filtered according to the site name and high exposure level.<!-- check this will appear correctly, when there is test data to use -->

### Devices with high risk

This displays the number of high risk devices at this site and the change that occurred in the past 24 hours.

Select the number in the column, which opens the Device inventory filtered according to the site name and high risk level. <!-- check this will appear correctly, when there is test data to use -->

### View security recommendations
<!-- recommendations arent being released yet!! should change the heading - Amit will this be in general -->
To view the security recommendations for a site:

1. Select Assets > Devices in the menu to open the Device inventory.
1. Filter the device list.
1. Select the device.
1. Select the **Security recommendations** tab.
1. Follow the actions listed.

## What next?
