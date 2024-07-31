---
title: Microsoft Defender for Cloud Apps in the Microsoft Defender portal
description: Learn about using Microsoft Defender for Cloud Apps in the Microsoft Defender portal.ms.service: defender-xdr
ms.localizationpriority: medium
f1.keywords:
- NOCSH
ms.author: bagol
author: batamig
manager: raynew
ms.date: 07/31/2024
audience: ITPro
ms.topic: conceptual
search.appverid: 
- MOE150
- MET150
ms.collection: 
- m365-security 
- tier2
ms.custom: admindeeplinkDEFENDER
---

# Microsoft Defender for Cloud Apps in the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Microsoft Defender for Cloud Apps](/defender-cloud-apps/)

Microsoft Defender for Cloud Apps is available inside the Microsoft Defender portal. The Defender portal is the home for monitoring and managing security across your Microsoft identities, data, devices, apps, and infrastructure, allowing security admins to perform their security tasks in one location, across multiple Microsoft Defender services.

SOC analysts can triage, investigate, and hunt across all Microsoft Defender XDR workloads, including cloud apps.

Take a look in Microsoft Defender XDR at <https://security.microsoft.com>.

Learn more about the benefits: [Overview of Microsoft Defender XDR](microsoft-365-defender.md).

## Perform cloud app security tasks

Find Defender for Cloud Apps functionality in the Microsoft Defender portal under **Cloud Apps**. For example:

:::image type="content" source="media/defender-for-cloud-apps/cloud-apps.png" alt-text="Screenshot of the Defender for Cloud Apps Cloud discovery page.":::

## Investigate cloud app alerts

Defender for Cloud Apps alerts show in the Defender portal's incident and alerts queues, with relevant content inside alert pages for each type of a alert. For more information, see [Investigate incidents in Microsoft Defender XDR](investigate-incidents.md).

## Global search for your connected cloud apps

Use the Microsoft Defender portal's global search bar at the top of the page to search for connected apps in Defender for Cloud Apps.

:::image type="content" source="../defender/media/global-search-apps.png" alt-text="Screenshot of searching for connected apps.":::

### Assets and identities

Use the **Assets > Identities** page to find comprehensive details about entities pulled from connected cloud applications, including a users's activity history and security alerts related to the user. For example:

:::image type="content" source="media/defender-for-cloud-apps/dashboard-top-users.png" alt-text="Screenshot of cloud app entities in the Identities page.":::

<a name='redirection-from-the-classic-microsoft-defender-for-cloud-apps-portal-to-microsoft-365-defender'></a>

### Redirection from the classic Microsoft Defender for Cloud Apps portal to Microsoft Defender XDR

The Defender for Cloud Apps experience in the Microsoft Defender portal is generally available, and the automatic redirection from the classic portal is on by default for all customers. Customers using preview features with the classic portal have no option to switch back. If you're not using preview features, admins can still update the redirect setting as needed to continue using the classic Defender for Cloud Apps portal.

Starting June 16, 2024, the redirection toggle will no longer be available for any customers. From then on, all users accessing the classic Microsoft Defender for Cloud Apps portal will be automatically rerouted to the Microsoft Defender portal, with no option to opt out.

To prepare for this change, we recommend that any customers still using the classic portal move operations to the Microsoft Defender portal.

> [!NOTE]
> If something isn't working for you or if there's anything you're unable to complete using the Microsoft Defender portal, we want to hear about it. If you've encountered any issues with redirection, we encourage you to let us know by using the **Give feedback** submission form.
>

**To revert to the former Microsoft Defender for Cloud Apps portal**:

1. Sign in to <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender XDR</a> as a Global administrator, Security administrator, or Cloud App Security administrator in Azure Active directory, or a local global admin in Microsoft Defender for Cloud Apps.

1. Make sure that you don't have Preview features turned on for your tenant. For more information, see [Microsoft Defender XDR preview features](preview.md).

1. Navigate to **Settings** > **Cloud Apps** > **System** > **Redirection to Microsoft Defender XDR** or [go directly to the Redirection setting](https://security.microsoft.com/cloudapps/settings?tabid=autoRedirection).

1. Toggle the **Automatic redirection** setting to **Off**.

Once toggled off, accounts are no longer routed to *security.microsoft.com*. Active user sessions aren't terminated, and the updates are applied only after the user ends their current session or opens a new tab.

The update might take effect almost immediately in some accounts, but may take longer to propagate to every account in your organization. This setting can be turned back on again at any time.


## Related videos

Learn how to protect your cloud apps in Microsoft Defender XDR:

**Protecting cloud apps in Microsoft Defender XDR**:<br>

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE59yVU title="Protecting cloud apps in Microsoft Defender XDR"]

<br>

**Defender for Cloud Apps in Microsoft Defender XDR for customers migrating from the classic portal**<br>

> [!VIDEO https://learn.microsoft.com/_themes/docs.theme/master/en-us/_themes/global/video-embed.html?id=2105e5c9-23bf-41fb-a61d-0f0fae8ef05f title="Defender for Cloud Apps in Microsoft Defender XDR for customers migrating from the classic portal"]


## Related information

- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Contact support](/defender-cloud-apps/support-and-ts)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
