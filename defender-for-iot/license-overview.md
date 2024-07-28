---
title: Overview of the permanent site license and how to choose one for Microsoft Defender for IoT in the Defender portal 
description: Learn about a permanent site license, how to upgrade and the different options available for Microsoft Defender for IoT in the Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 08/01/2024
ms.topic: overview
---

# How does the site-based license model work?

The site-based license model offers a simplified approach to licensing by providing coverage for entire sites rather than individual devices. Customers can purchase annual licenses for their operational sites, where OT devices are deployed, and receive security coverage for all devices within the site.  

What defines a site?  

A site refers to a logical grouping of devices within your organization. It represents a specific physical location, such as a manufacturing facility, campus, office building, hospital, rig, or any other relevant site.  

What are the different between OT site base licenses?

Licenses come in five different sizes, starting from the basic tier, which covers up to 100 devices per site, to the highest tier, which secures up to 5000 devices per site. You can find all the license options here: [Link](https://www.microsoft.com/en-us/security/business/endpoint-security/microsoft-defender-iot-pricing" \l "x57646dc8c92844039799522a9df7e776)

The size of a site is determined by the maximum number of devices per site.  Billing is based on the maximum number of devices in each license tier, regardless of the number of devices actually discovered.  

What if I need to change the number of devices for a site after making a purchase?  

Once a license is purchased, the number of devices cannot be adjusted until the renewal period.  
During the annual license renewal, you can true-up or down to a different license tier for a site based on your updated discovered device count.

How to choose a license and assess the number of devices on-site?

To determine the appropriate license size for your site, you can use several methods to assess the number of devices. You can utilize your OT network monitoring tools to detect and count devices on-site. You can also base your assessment on previous knowledge of the site’s devices and update license during the annual license renewal.  

Note: All devices detected on your sites should be counted as part of the license: OT/IT. include endpoints managed by MDE.

Note: All types of devices identified on your sites should be included in the license (OT/ IT). This includes endpoints managed by MDE and devices detected by the MD4IoT sensors.
