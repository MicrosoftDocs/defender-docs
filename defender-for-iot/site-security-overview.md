---
title: Site security overview 
description: Read this article to get an overview of benefits of the new Site Security features in Defender for IoT.
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
ms.topic: concept-article
---

# Site Security

The Site security page in the Defender portal is a dashboard that offers an <!--high level -->overview of the security state of your entire OT/IoT network. The CISO and security site manager can use this dashboard to identify the most critical areas to work on and prevent and respond to advanced threats.

## Site security features and benefits

The Site security dashboard allows the CISO and SOC analyst an at-a-glance view of the most important security issues affecting your network. To help save time for security management and site managers the dashboard lists each site and the number and type of threats that could affect it. This allows the user to make quick and highly informed decisions about which security problems are higher priority and in need of an immediate response.

The aggregated view shows data for sites with the highest exposure and incident levels, which also helps in making fast decisions to protect your network.

The Site security features include:

- Speedy set up: Defender for IoT identifies all OT/IoT devices it can identify at a specific physical location and assigns them to a **Site**. Defender for IoT uses Microsoft for Endpoint agents already on your network to identify all of the OT devices and automatically add them to the site. This enables the faster and more accurate onboarding of devices into the XDR portal, which means your network starts to be secured and monitored without the need to add new equipment or a lengthy process of logging each of your OT devices.
- Associate OT devices: You can add specific OT devices to the site, which then identify other devices to be added to the device inventory.
- Authorized users: Device group's can restrict a specific group of users based on site access or security policies and can apply across the entire XDR portal. [A device group is a collection of devices that share common attributes or security policies.]

## Site security dashboard

In the Defender for IoT, all your devices are associated with a site. OT devices use Microsoft Defender for Endpoints agents to identify, scan, and assess the status of the devices on your network, which is displayed in the Site security dashboard.  

The Site security dashboard gives an outline of the security status for each site that you create in the XDR portal. The information shows how secure your site is, by displaying the pre breach, **Exposure** data and post breach, **Risk**, data. This information helps you classify and assign security related actions to your security team.

The dashboard also shows how many critical devices each site has. A critical device is a self assigned device that has extra importance to your business or system, such as a server that contains confidential data. As such, you must protect these devices more than devices of lesser importance. Knowing which sites have more critical devices should also be a factor in prioritizing security issues.

:::image type="content" source="media/site-security-associate-devices.png" alt-text="Screenshot of the Microsoft Defender for IoT Security sites dashboard in the Microsoft Defender portal.":::

This dashboard is especially important for two positions in your company. The CISO managers, who need to see a high level view of the security status of their systems and sites. Also for the OT security admin users/SOCs in charge of security implementation who needs to be able to make quick and highly informed decisions about which security problems are higher priority and in need of immediate responses.  

Summarized data for a specific site can be displayed on the dashboard allowing further analysis without having to filter through the more detailed device inventory.  

## Next Steps

- [Set up sites in Defender for IoT](set-up-sites.md)
- [Manage sites](manage-sites.md)

<!-- do i need any of this, i think it has all be written above 
Defender for IoT uses the MDE agent to identify and locate other OT and IoT devices at the same location and adds them to the Device inventory. Before setting up a Defender for IoT site, OT devices listed in the Device inventory show minimal data. Once the OT devices are associated with a site, they show the full range of security related data available, including risk and exposure data.

There are three stages to setting up a site. <!-- not sure to keep this or not, or move to a concept intro article -->
<!--
First, enter the site details and the owners of the site.

Second, associate OT devices located at a specific physical location to this new site. This allows Microsoft Defender for IoT in the XDR portal to suggest a list of other OT devices it identifies at the same location. You might need to choose more than one suggested list of OT devices. The list also shows the number of total IoT devices Defender for IoT predicts are at the site, which helps you identify if the location matches the known number of devices there. If the numbers are significantly different this indicates that this isn't part of your site.

Finally review the site details before creating the site. Once the site is created, you can also make a device group to give access permissions to users of this site. For more details, see [RBAC and user permissions in XDR](/defender-endpoint/user-roles.md). <!-- what link goes here? -->