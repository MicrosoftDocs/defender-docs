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

# How the site-based license model works

The site-based license model offers a simplified approach to licensing by providing coverage for entire sites rather than individual devices. Customers can purchase annual licenses for their operational sites where Operational Technology (OT) devices are deployed, and receive security coverage for all devices within the site.  

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## What defines a site?

A site refers to a logical grouping of devices within your organization. It represents a specific physical location, such as a manufacturing facility, campus, office building, hospital, rig, or any other relevant site.

## What are the different OT site-based licenses?

Licenses come in five different sizes, based on the number of devices at the site. The licenses range from the smallest tier that covers up to 100 devices per site, to the largest tier, which secures up to 5000 devices per site. For more information, see [license sizing details](https://www.microsoft.com/en-us/security/business/endpoint-security/microsoft-defender-iot-pricing#xfb84a030eec341cb84a6165f393e928a).

The size of a site is determined by the maximum number of devices per site. Billing is based on the license tier, regardless of the number of devices actually discovered.

## What if I need to change the number of devices for a site after making a purchase?  

Once a license is purchased, the number of devices cannot be adjusted until the renewal period. During the annual license renewal, you change to a different license tier for a site based on your updated discovered device count.

## How to choose a license and assess the number of devices on-site?

There are two methods for assessing the number of devices at your site. You could either utilize your OT network monitoring tools to detect and count the devices per site, or use previous knowledge of the number of devices at the site and update the license during the annual license renewal if needed.

> [!Note]
> All types of devices, both OT and IT, identified on your site should be included in the license. This includes endpoints managed by Microsoft Defender for Endpoint and devices detected by the Microsoft Defender for IoT sensors.

## Next steps

[Manage your license](manage-license.md)