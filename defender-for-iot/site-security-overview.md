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

# Site security

The Site security page in the Defender portal offers an overview of the security state of your entire OT/IoT network. Site security is based on creating a **site** that represents a specific physical location in your organization, for example, a manufacturing facility. The Site security page gives the security team management tools to effectively understand and analyze the state of each site. Site security also provides a unified view of all operational sites across your entire organization. Together this enables the security team to make better informed decisions when dealing with security issues.

Using Microsoft Defender for Endpoint agents already installed on your network, Site security then detects all of the devices at that location and adds them to the site. This set up allows you to:

- proactively track and gain security insights for the site
- analyze the data for your network
- explore ways to mitigate and reduce risks

Site Security is currently in public preview.

The CISO and security site manager can use this dashboard to identify the most critical areas to work on to prevent or respond to advanced threats.

To help save time for security management and site managers the dashboard lists each site and the number and type of threats that could affect it. This allows the user to make quick and highly informed decisions about which security problems are higher priority and in need of an immediate response.

The aggregated view shows data for sites with the highest exposure and incident levels, which also helps in making fast decisions to protect your network.

The Site security features include:

- Speedy set up: Defender for IoT identifies all OT/IoT devices it can at a specific physical location and assigns them to a **Site**. Defender for IoT uses Microsoft for Endpoint agents already on your network to identify all of the OT devices and automatically add them to the site. This enables the faster and more accurate onboarding of devices into the XDR portal, which means your network starts to be secured and monitored without the need to add new equipment or a lengthy process of logging each of your OT devices.
- Associate OT devices: You can add specific OT devices to the site, which then identify other devices to be added to the device inventory.
- Authorized users: Device group's can restrict a specific group of users based on site access or security policies and can apply across the entire Defender portal. [A device group is a collection of devices that share common attributes or security policies.]
- Seemless site and device management: The Site security dashboard enables administrators to easily add and manage new sites and devices to the existing network set up.
- Quick response to risks: The data and links from the dashboard take the user to other relevant areas in the XDR portal, helping to swiftly deal with security risks and complete tasks.

## Key scenarios and users

The Site security page assists the following user:

- **Chief Security Information Officers (CISOs)** and **Security Decision Makers**: develop and improve the organization's overall security strategy giving insights into risk and exposure.  
- **OT Security Manager**: develop and implement OT security initiatives across multiple sites or the entire organization.
- **Site Manager**: oversee daily operations at a specific site, ensuring smooth production and implementation of security measures.
- **OT Security Engineers**: design, implement, and maintain security solutions that are aligned with the Security Program of the site or with the overall organizational security.

- SOC analyst to get a view of the most important security issues affecting your network. <!-- what do we do with this? Is it included in the above titles?-->
<!-- the following seems less important now?-->
This dashboard is especially important for two positions in your company.

The CISO managers who need to see a high level view of the security status of their systems and sites.

Also, for the OT security admin users/SOCs in charge of security implementation who need to be able to make quick and highly informed decisions about which security problems are higher priority and in need of immediate responses.

## Site security dashboard

In the Defender for IoT, all your devices are associated with a site. OT devices use Microsoft Defender for Endpoints agents to identify, scan, and assess the status of the devices on your network, which is displayed in the Site security dashboard.  

The Site security dashboard gives an outline of the security status for each site that you create in the XDR portal. The information shows how secure your site is, by displaying the pre breach, **Exposure** data and post breach, **Risk**, data. This information helps you classify and assign security related actions to your security team.

The dashboard also shows how many critical devices each site has. A critical device is a self assigned device that has extra importance to your business or system, such as a server that contains confidential data. As such, you must protect these devices more than devices of lesser importance. Knowing which sites have more critical devices should also be a factor in prioritizing security issues.

:::image type="content" source="media/site-security-associate-devices.png" alt-text="Screenshot of the Microsoft Defender for IoT Security sites dashboard in the Microsoft Defender portal.":::

Summarized data for a specific site can be displayed on the dashboard allowing further analysis without having to filter through the more detailed device inventory.  
