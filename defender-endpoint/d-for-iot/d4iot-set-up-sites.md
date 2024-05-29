---
title: Set up Site security for Microsoft Defender for IoT in XDR Defender portal
description: Read this article to get an overview of setting up the new Site Security feature.
search.appverid: met150
ms.service: defender-endpoint
author: siosulli
ms.author: siosulli
ms.localizationpriority: medium
ms.date: 05/19/2024
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: How-to
ms.subservice: onboard
---
follow how to 
# Setting up a Site

In this article you learn how to 

reason for doing this - link devices to a physcal location.

To set up a site that tracks the devices.

There are three stages to setting up a site.

First, enter the site details and the owners of the site.

Second, using the IP/MAC addresses of known OT devices, associate OT devices to the site. This allows Microsoft Defender for IoT in the XDR portal <!-- what do we call the 'system'?? site security/ XDR/  DforIoT --> to search for other OT devices that are at the same location and presents a list of suggested devices at the same site - or is it presents a list of other OT devices at the site? OR suggesting which site is yours based on the list? Is the list of suggested sites, different actual sites, why are there more devices in some of the suggestions? To help you choose the correct site, XDR also presents the  enhances the tracking and management capabilities of Microsoft Defender . <!-- AMIT!! -->

Finally review the site details before creating the site. Once the site is created, you can also make a device group to 

Are there any prerequisites??
link to main prereq article....general , license, etc

## Create a new site

1. In the Site security dashboard, select **Create new site** or **Create Your First Site**. 

1. Enter the following details:

- Site name - a name for the site, for example, San Franscico Main office.
- Location - the physical location of the office.
- Site description - describe the purpose of the site, what activities occur there, the types of devices used, and other important information about the site.
- Owners - the contact emails of any users administering the site, who must be contacted when problems occur.

1. When completed, select **Next**.

## Associate devices

OT devices are associated with the site which allows Microsoft Defender to correctly identify other OT/IoT devicesat the same site.

1. In the Search bar, type either a public IP address or the IP/MAC address for a specific OT device that is located at this site. Choose the option/suggestion that best fit your site. <!-- AMIT!! I can only choose one of these correct? What happens if i choose 2? -->
1. A site, with a list of OT devices at that location, is suggested. Check that these devices exist at your site.
    1. If you don't know any of the OT device addresses, select **Show all suggested sites**. <!-- - or does this update automatically --><!-- AMIT!! -->
    1. Microsoft Defender shows a list of OT devices per site that it identifies as located together. Review the devices and select the appropriate site. There might be several sets to choose from.<!-- what am i choosing, the site or the devices? AMIT!! -->
1. Select **Next**.

## Review site details

1. Review that information for the site you want to create.
    1. If you want to review the selected OT devices, select **Edit devices** and you return to the **Associate devices** screen.
1. Select **Complete**.

## Add device group

It is important that the correct users have access to their site. Access and permission controls can be set for groups to restrict access a specific site or group of sites. Create a **Device group** and set the access per user.

1. Select **Create device group**. The Settings > Endpoints > Device groups page opens.
1. Select **Add device group**.
1. Type a **Device grup name**.
1. Select the **Remediation level**.
1. Type a **Description**.
1. Select **Next**. The Devices page opens.
1. Type the value for the **Tag** condition. Type the term **Site:** and then the name of the site. For example, Site:SanFrancisco.
1. Select **Next**. The Preview devices page opens.

in my org, some users will see data - vulnerablities , alerts, etc for a specific site only.

<!-- AMIT!! how does Preview devices work.-->
<!-- AMIT!! how does User access work. and ranking-->
look for the documentation for this
MDE documentation for rank in the endpoint device group page.

Site security and RBAC - Mia

Information about ranking

1. Select **Close**.

Your site should now appear in the Site security page.

What next!
