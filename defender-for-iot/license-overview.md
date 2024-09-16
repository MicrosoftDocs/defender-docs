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

# The site-based license model

Our site-based license model streamlines your licensing needs by covering entire sites instead of individual devices. With this model, you can purchase annual licenses for your operational sites where Operational Technology (OT) devices are deployed. This ensures comprehensive security coverage for all devices within each site.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Sites in Defender for IoT

A site refers to a logical grouping of devices within your organization. It represents a specific physical location, such as a manufacturing facility, campus, office building, hospital, rig, or any other relevant site.

## OT site-based licenses

Licenses come in five different sizes, based on the number of devices at the site. The licenses range from the smallest tier that covers up to 100 devices per site, to the largest tier, which secures up to 5000 devices per site. For more information, see [license sizing details](https://www.microsoft.com/en-us/security/business/endpoint-security/microsoft-defender-iot-pricing#xfb84a030eec341cb84a6165f393e928a).

The size of a site is determined by the maximum number of devices per site. Billing is based on the license tier, regardless of the number of devices actually discovered.

## Adjust the number of devices for a site

Once a license is purchased, the number of devices can only be adjusted at the renewal period. During the annual license renewal, you can change to a different license tier for a site based on your updated discovered device count.

## Assess the number of devices at a site

There are two methods for assessing the number of devices at your site. You could either utilize your OT network monitoring tools to detect and count the devices per site, or use previous knowledge of the number of devices at the site and update the license during the annual license renewal if needed.

> [!Note]
> The license should cover all types of devices identified on your site, including both OT and IT devices. This includes endpoints managed by Microsoft Defender for Endpoint.

## Next steps

[Manage your license](manage-license.md)