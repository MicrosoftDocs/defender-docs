---
title: Monitor site security and investigate recommendations for Microsoft Defender for IoT in XDR Defender portal
description: Read this article to get an overview of Monitor site security and investigate recommendations of the new Site Security feature.
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

# Monitor site security and investigate recommendations

The security site management team/ SOC admin or other users with access <!-- name/ title?--> will regularly check the information presented in the **Site security** dashboard to see the up-to-date security state of their network. Understanding the different features here guides the SOC to decide how to prioritize security issues for the rest of the security team.

## Monitoring

The dashboard gives you an overview of the security status of your network and is divided into two main sections.

The top of the page displays the Cross site panel which gives a general overview of your entire network, showing you the sites with the highest number of exposed or at risk devices.
The rest of the page displays a list of security information for each site.

Review all areas of the page
what are the steps of going through the dashboard. ask amit what you will do? How will you take action from this point?  the journey of moving through the site. - there isnt one

## Aggregated site data view - The Cross site panel - what to name this?

The top blue <!-- doesnt have a name??--> panel contains network wide security information. It lists the:

1. Number of monitored sites.
1. Number of total devices monitored.
1. Top vendor devices used across the network.
1. Three top sites with high risk, post breach, devices.
1. Three top sites with high exposure, pre breach, devices.

### Monitored OT sites

To add more sites, select **Get more sites** for more information. <!--at the moment this leads to the overview page, which i think is the wrong page, too highlevel, it should go to the documentation page on adding licenses or the page for actually making hte purchase. Maybe this is just a placeholder unti lour documentation is ready?? -->

### Total devices

To see the list of all devices for your network, select **See in inventory**, which opens the Device inventory page.

### Top vendors

This shows the number of devices in your network according to the vendor that produces them.

Select the vendor name on the circle, which opens the Device inventory filtered according to the vendor??<!-- when i tried this it filtered by the site name not the vendor -->

### High risk devices

Data for up to three sites displays the number of high risk devices at the site.

Select **View in inventory** which opens the Device inventory filtered according to the site and high risk level. <!-- check this will appear correctly, when there is test data to use -->

### High exposure devices

Data for up to three sites displays the number of highly exposed devices at the site.

Select **View in inventory** which opens the Device inventory filtered according to the site and high exposure level.

## Site list security data

The rest of the dashboard lists each site and displays site specific security data.

### Site name
<!-- these arent steps but options. i have used bullets, not numbers because of that. but I dont really think bullets are proper either! -->
- Select the Site name to open the Site insight panel.
- Select the Site name menu to manage the site. For more information, see [manage site](manage-sites.md).

### Critical

This shows the number of critical devices at this site.

Select the number in the column which opens the Device inventory filtered according to the site name and criticality level. <!-- is criticality level the correct filter name? check this will appear correctly, when there is test data to use -->

### Highly-exposed devices

This shows the number of highly exposed devices at this site and the change that has occurred in the past 24 hours.

Select the number in the column which opens the Device inventory filtered according to the site name and high exposure level.<!-- check this will appear correctly, when there is test data to use -->

### Devices with high risk

This shows the number of high risk devices at this site and the change that has occurred in the past 24 hours.

Select the number in the column which opens the Device inventory filtered according to the site name and high risk level. <!-- check this will appear correctly, when there is test data to use -->

### View recommendations
