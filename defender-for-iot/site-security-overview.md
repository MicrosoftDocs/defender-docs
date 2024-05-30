---
title: Site security for Microsoft Defender for IoT in XDR Defender portal
description: Read this article to get an overview of benefits of the new Site Security features in the XDR portal.
ms.service: defender-iot
author: tarTech23
ms.author: tarTech23
ms.localizationpriority: medium
ms.date: 05/19/2024
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: concept-article
ms.subservice: onboard
---

# Site Security in the XDR portal

Site security is part of Defender for IoT in the Defender XDR portal and offers a high level overview of the security state of your entire OT/IoT network, allowing key SOCs and administrators identify the most critical areas to work on and prevent and respond to advanced threats. <!--to including exposure to potential security threats and risks.  enterprise OT/IoT security platform designed to help enterprise networks prevent, detect, investigate, and respond to advanced threats. -->

## Prerequisites

Are these correct, are there other items needed here? What level of roles are needed?
What do we need this for?

- OT Security Admin with MDE P2/E5. For more information, see [Microsoft Defender for Endpoint subscriptions settings](defender-endpoint/defender-endpoint-subscription-settings.md).
- Microsoft Defender for IoT license with at least one site license available. For more information, see [Microsoft Defender for IoT subscriptions settings](license-admin-senter.md).<!-- is this really a prereq at this stage? You can buy the site license later? -but i think it is probably best to keep. -->

For more information, see [the general prerequisites needed for Microsoft Defender for IoT](prerequisites.md).

## Site security dashboard

Site security is a dashboard giving an outline of the security status for each of the sites that you create in the XDR portal. This shows how secure your site is, by displaying the pre breach, **Exposure** data and post breach, **Risk**, data. You can also see how many critical devices each site has.

This dashboard is especially important for two positions in your company. The CISO managers, who need to see a high level view of the security status of their systems and sites. Also, the OT security admin users in charge of security implementation and need to be able to make quick and highly informed decisions about which security problems are higher priority and in need of immediate responses.  

The summarized data for a specific site can also be displayed on this dashboard to allow further analysis without having to filter through the more detailed data contained in the device inventory.  

In Defender, all your devices are associated with a site. OT devices use Microsoft Defender for Endpoints agents to identify, scan, and assess the status of the devices on your network.  

:::image type="content" source="{../media/site-security-dashbaord.png}" alt-text="{Screenshot of the Microsoft Defender for IoT Security sites dashboard in the Microsoft Defender portal.}":::

## Site security features

The OT Security admin sets up and controls these Site security features:

- Create site: You can create a site with a name, location, and associate a set of OT devices to it.
- Edit site: You can edit the site name, location, and description of your devices.
- Delete site: You can delete a site and all its associated devices from the inventory.
- Associate OT devices: You can add specific OT devices to the site, which then identify other devices to be added to the device inventory.
- Create a device group: You can create a device group for a site that restricts site access to a specific group of users. [A device group is a collection of devices that share common attributes or security policies.]

What Next!
