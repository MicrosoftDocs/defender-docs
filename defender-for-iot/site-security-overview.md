---
title: An overview of Site security in Microsoft Defender for IoT in the Microsoft Defender portal.  
description: Read this article to get an overview of benefits of the new Site Security features in Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: concept-article
---

# Site security

The Site security page in the Microsoft Defender portal offers an overview of the security state of your entire operational environment. The operational environment monitors all types of devices, OT and others. Site security enables you to create a **site** that represents a specific physical location in your organization, for example, a manufacturing facility. This site based view of your organization allows you to clearly differentiate security issues by location and identify points that are better protected or areas that need security improvements.

The Site security page gives the security team management tools to effectively understand and analyze the state of each site. Site security also provides a unified view of all operational sites across your entire organization. Together this enables the security team to make better informed decisions when dealing with security issues.

Site Security enables you to associate devices discovered by Microsoft Defender for Endpoint agents already installed on your network for a specific site using automatic site suggestions. This allows you to:

- Proactively track and gain security insights for the site
- Analyze the data for your network
- Explore ways to mitigate and reduce risks

Site Security is currently in public preview.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Site security features

| Feature | Description|
|----|----|
|**[Visualize and manage your physical sites](set-up-sites.md)**| - Create and manage operational sites and devices with ease using automatic suggestions from your inventory.<br>- Utilize the site creation wizard for seamless setup and to group devices by physical proximity for better organization.|
|**[Gain comprehensive insights and analytics](monitor-site-security.md)**|- Access a unified view of all operational sites, including security insights to understand their importance and prioritize responses.<br>- Monitor site-specific discovery, posture, and threat detection to identify and address exposure, risks, and business impact.|
|**[Take Action to Reduce Risks](monitor-site-security.md)**|- Dive into dedicated site-based views for detailed insights on inventory, vulnerabilities, and incidents.<br>- Leverage context-driven guidance within the Defender portal to effectively remediate risks and enhance site security.|

## Key scenarios and users

The Site security page is aimed to assist the following user:

- **Chief Security Information Officers (CISOs)** and **Security Decision Makers**: develop and improve the organization's overall security strategy giving insights into risk and exposure.  
- **OT Security Manager**: develop and implement OT security initiatives across multiple sites or the entire organization.
- **Site Manager**: oversee daily operations at a specific site, ensuring smooth production and implementation of security measures.
- **OT Security Engineers**: design, implement, and maintain security solutions that are aligned with the Security Program of the site or with the overall organizational security.

For more information on the site security page and it's features, see [monitor site security](monitor-site-security.md).
