---
title: Monitor site security for Microsoft Defender for IoT in Microsoft Defender portal
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
ms.topic: how-to
---

# Monitor site security

The security team regularly checks the information presented in the **Site security** page of Microsoft Defender for IoT in the Defender portal to see the up-to-date security state of the sites. Understanding the different features here guides the security team to decide how to prioritize and assign security issues to other team members.

## Prerequisites

- Review [the general prerequisites needed for Microsoft Defender for IoT](prerequisites.md).
- Site security permissions according to RBAC requirements. For more information, see [RBAC permissions for Defender for IoT](prerequisites.md#permissions).

## Monitoring with the site security page

The Site security page gives you an overview of the security status of your network and is divided into two main sections.

The top of the page displays a general overview of your entire network, including sites with the highest number of exposed or at risk devices.
The rest of the page lists security information for each site.

## Cross site metrics panel

The top metrics panel contains network wide security information to guide your security decisions. The following table describes the features in the panel.

| Type| Description|
|----|----|
| Monitored OT sites | The number of monitored sites. You can add extra sites from here.|
| Total devices | The number of total OT devices monitored across the entire network. You can access this data in the Device inventory from here.|
| Top vendors | The number of OT devices in your network according to the vendor that produces them. You can access this data in the Device inventory.|
| High risk devices | The number of high risk OT devices for the top three sites. You can access this data in the Device inventory.|
| High exposure devices | The number of highly exposed OT devices for the top three sites. You can access this data in the Device inventory.|

## Site list

The rest of the Site security page lists each site and displays site specific security data.

The following table describes the features for each site.

| Name | Description|
|----|----|
| Site name | - Select the **Site name** to open the **Site insight** panel.<br>- Select the :::image type="icon" source="media/menu-ellipsis.png" alt-text="menu vertical ellipsis button"::: menu to manage the site. For more information, see [manage sites](manage-sites.md).|
| Critical | The number of critical devices at a site. <br> Select the number in the column, which opens the Device inventory filtered according to the site name and criticality level. <!-- is criticality level the correct filter name? check this will appear correctly, when there is test data to use -->|
| Highly-exposed devices | The number of highly exposed devices at this site.<br>Select the number in the column, which opens the Device inventory filtered according to the site name and high exposure level.|
| Devices with high risk | The number of high risk devices at this site.<br>Select the number in the column, which opens the Device inventory filtered according to the site name and high risk level.|

>[!Note]
> The data shown in the Site security page is the total aggregated data for the entire network, and might include data for sites that you don't have permissions access to. This means that when you click on numbers in the panels, they'll open up to lists that only display the data you have access to, for example, in the device inventory,and not all of the data referenced.
