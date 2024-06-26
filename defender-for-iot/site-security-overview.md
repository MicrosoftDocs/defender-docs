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

The Site security page in the Defender portal offers an overview of the security state of your entire OT and non-OT network. Site security is based on creating a **site** that represents a specific physical location in your organization, for example, a manufacturing facility. This site based view of your orgnaisation allows you to clearly differentiate security issues by location and identify points which are better protected or areas that need security improvements.

The Site security page gives the security team management tools to effectively understand and analyze the state of each site. Site security also provides a unified view of all operational sites across your entire organization. Together this enables the security team to make better informed decisions when dealing with security issues.

Using the Microsoft Defender for Endpoint agents already installed on your network, Site security detects all of the devices at that location and adds them to the site. This set up allows you to:

- proactively track and gain security insights for the site
- analyze the data for your network
- explore ways to mitigate and reduce risks

Site Security is currently in public preview.

The security team can use the Site security page to identify the most critical areas to work on to prevent or respond to advanced threats. The Site security page lists each site and the number and type of threats that could affect it. This allows the user to make quick and highly informed decisions about which security problems are higher priority and in need of an immediate response. The Site security page also has an aggregated view that shows data for sites with the highest exposure and incident levels, to assist in deciding which security issues to prioritize.

**Site security features**

**Visualize and manage your physical sites**

- Create and manage operational sites and devices with ease using automatic suggestions from your inventory.
- Utilize the site creation wizard for seamless setup and to group devices by physical proximity for better organization.

**Gain comprehensive insights and analytics**

- Access a unified view of all operational sites, complete with security insights to understand their importance and prioritize responses.
- Monitor site-specific discovery, posture, and threat detection to identify and address exposure, risks, and business impact.

**Take Action to Reduce Risks**

- Dive into dedicated site-based views for detailed insights on inventory, vulnerabilities, and incidents.
- Leverage context-driven guidance within the Defender portal to effectively remediate risks and enhance site security.

|**Visualize and manage your physical sites**| - Create and manage operational sites and devices with ease using automatic suggestions from your inventory.<br>- Utilize the site creation wizard for seamless setup and to group devices by physical proximity for better organization.|
|**Gain comprehensive insights and analytics**|- Access a unified view of all operational sites, complete with security insights to understand their importance and prioritize responses.<br>- Monitor site-specific discovery, posture, and threat detection to identify and address exposure, risks, and business impact.|
|**Take Action to Reduce Risks**|- Dive into dedicated site-based views for detailed insights on inventory, vulnerabilities, and incidents.<br>- Leverage context-driven guidance within the Defender portal to effectively remediate risks and enhance site security.|

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
