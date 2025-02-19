---
title: Microsoft Defender XDR frequently asked questions
description: Get answers to the most commonly asked questions about topics and issues related to Microsoft Defender XDR.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: dansimp
author: dansimp
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
search.appverid: 
  - MOE150
  - MET150
ms.date: 01/17/2025
appliesto:
- Microsoft Defender XDR
---

# Microsoft Defender XDR frequently asked questions

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


Read responses to the most commonly asked questions about [Microsoft Defender XDR](microsoft-365-defender.md), including required licenses and permissions, deploying support services, initial settings, and feedback.

For instructions on how to turn on the service, [read Turn on Microsoft Defender XDR](m365d-enable.md).

## I don't have a Microsoft 365 E5 license. Can I still use Microsoft Defender XDR?

Customers with the following non-E5 licenses can use Microsoft Defender XDR:

- Microsoft Defender for Endpoint
- Microsoft Defender for Identity
- Microsoft Defender for Cloud Apps
- Defender for Office 365 (Plan 2)

For a full list of supported licenses, [read the licensing requirements](prerequisites.md#licensing-requirements).

<a name='do-i-need-to-install-or-deploy-anything-to-start-using-microsoft-365-defender'></a>

## Do I need to install or deploy anything to start using Microsoft Defender XDR?

No, Microsoft Defender XDR consolidates data from Microsoft 365 security services that you have already deployed. Once you turn it on, incident, automation, and hunting experiences will start working within the scope of the deployed products. If none of these products are properly deployed, Microsoft Defender XDR will not display any data and is unable to take any action.

To optimize your Microsoft Defender XDR experiences, we recommend deploying *all* supported [Microsoft 365 security products and services](deploy-supported-services.md).

<a name='where-does-microsoft-365-defender-process-and-store-my-data'></a>

## Where does Microsoft Defender XDR process and store my data?

Microsoft Defender XDR automatically selects an optimal location for the data center where consolidated data is processed and stored. If you have Microsoft Defender for Endpoint, it selects the same location used by Defender for Endpoint.

> [!NOTE]
> Microsoft Defender for Endpoint automatically provisions in European Union (EU) data centers when turned on through Microsoft Defender for Cloud. Microsoft Defender XDR will automatically provision in the same EU data center for customers who have provisioned Microsoft Defender for Endpoint in this manner.

The data center location is shown before and after the service is provisioned in the settings page for Microsoft Defender XDR (**Settings > Microsoft Defender XDR**). If you prefer to use another data center location, select **Need help?** in the Microsoft Defender portal to contact Microsoft support.

<a name='where-can-i-access-microsoft-365-defender'></a>

## Where can I access Microsoft Defender XDR?

Microsoft Defender XDR is available at: <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank"><https://security.microsoft.com></a>.

<a name='what-permissions-do-i-need-to-access-microsoft-365-defender'></a>

## What permissions do I need to access Microsoft Defender XDR?

Accounts assigned the following Microsoft Entra roles can access Microsoft Defender XDR functionality and data:

- Global administrator
- Security administrator
- Security Operator
- Global Reader
- Security Reader
- Compliance Administrator
- Compliance Data Administrator
- Application Administrator
- Cloud Application Administrator

> [!NOTE]
> Role-based access control settings in Microsoft Defender for Endpoint influence access to data. For more information, read about [managing access to Microsoft Defender XDR](m365d-permissions.md).
>
> If you are running the Microsoft Defender XDR preview program you can now also experience the new Microsoft Defender 365 role-based access control (RBAC) model. For more information, see [Microsoft Defender XDR role-based access control (RBAC) model](./manage-rbac.md).

<a name='what-time-zone-does-microsoft-365-defender-default-to'></a>

## What time zone does Microsoft Defender XDR default to?

By default, Microsoft Defender XDR displays time information in the UTC time zone. You can also change this setting to use your local time zone.

To change time zone, sign in to the Microsoft Defender portal then go to **System > Settings > Microsoft Defender portal** and select your preferred time zone. Refresh your browser to ensure that changes are applied immediately.

The time zone settings is applied to the dates and times displayed in incidents, automated investigation and remediation, and advanced hunting.

<a name='how-can-i-learn-about-new-microsoft-365-defender-feature-and-ui-updates'></a>

## How can I learn about new Microsoft Defender XDR feature and UI updates?

Microsoft regularly provides information through the various channels, including:

- Blog posts in the [Microsoft Defender XDR Blog](https://techcommunity.microsoft.com/category/microsoft-defender-xdr/blog/microsoftthreatprotectionblog)
- Go to [Defender monthly news](https://aka.ms/defendernews)
- The [message center](/Microsoft-365/admin/manage/message-center) in Microsoft 365 admin center

Get the latest publicly available experiences by turning on [preview features](preview.md).

<a name='how-can-i-provide-feedback-or-suggestions-for-microsoft-365-defender'></a>

## How can I provide feedback or suggestions for Microsoft Defender XDR?

Your feedback helps us get better at protecting your environment from advanced attacks. Share your experience, impressions, and requests by providing feedback.

In the Microsoft Defender portal, select the feedback icon on the top right and provide your feedback.

![Screenshot of the portal menu, highlighting the feedback icon](/defender/media/portal-feedback.png)

Rate your experience and provide details on what you liked or where improvements can be made. You can also choose to be contacted about the feedback.

## Related topics

- [Microsoft Defender XDR overview](microsoft-365-defender.md)
- [Turn on Microsoft Defender XDR](m365d-enable.md).
- [Licensing requirements and other prerequisites](prerequisites.md)
- [Deploy supported services](deploy-supported-services.md)
- [Setup guides for Microsoft Defender XDR](deploy-configure-m365-defender.md)
- [Turn on preview features](preview.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
