---
title: Microsoft Defender for Cloud Apps in Microsoft Defender XDR
description: Learn about changes from the Microsoft Defender for Cloud Apps to Microsoft Defender XDR.
ms.service: defender-xdr
ms.localizationpriority: medium
f1.keywords:
- NOCSH
ms.author: bagol
author: batamig
manager: raynew
ms.date: 06/18/2024
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

# Microsoft Defender for Cloud Apps in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Microsoft Defender for Cloud Apps](/defender-cloud-apps/)

Microsoft Defender for Cloud Apps is part of Microsoft Defender XDR, and uses the Microsoft Defender portal to allow security admins to perform their security tasks in one location. The Microsoft Defender portal simplifies workflows and combines functionality from other Microsoft Defender XDR services to Defender for Cloud Apps. 

The Microsoft Defender portal is the home for monitoring and managing security across your Microsoft identities, data, devices, apps, and infrastructure. SOC analysts can triage, investigate, and hunt across all Microsoft Defender XDR workloads, including cloud apps. For example, Defender for Cloud Apps alerts appear in Microsoft Defender XDR's incidents queue and alerts queue, with relevant content inside the alert pages, in a unified format with the proper adaptations to each alerts type. 

All users accessing the classic Microsoft Defender for Cloud Apps portal are automatically rerouted to the Microsoft Defender portal, with no option to opt out. This article is intended for customers moving from the classic Defender for Cloud Apps portal and want to learn more about where to find Defender for Cloud Apps content in the Microsoft Defender portal.

Take a look in Microsoft Defender XDR at <https://security.microsoft.com>.

Learn more about the benefits: [Overview of Microsoft Defender XDR](microsoft-365-defender.md).

## Quick reference

The images and the tables below list the changes in navigation between Microsoft Defender for Cloud Apps and Microsoft Defender XDR.

### Discover

> [!div class="mx-imgBorder"]
> :::image type="content" source="/defender/media/defender-cloud-apps-m365-defender-discover.png" alt-text="The new locations for Cloud Discovery features in the Microsoft Defender portal" lightbox="/defender/media/defender-cloud-apps-m365-defender-discover.png":::

| Defender for Cloud Apps | Microsoft Defender XDR |
|---------|---------|
| Cloud Discover dashboard | Cloud apps -> Cloud discovery |
| Discovered Apps | tab on Cloud Discovery page |
| Discovered resources | tab on Cloud Discovery page |
| IP addresses | tab on Cloud Discovery page |
| Users | tab on Cloud Discovery page |
| Devices | tab on Cloud Discovery page |
| Cloud app catalog |  Cloud apps -> Cloud app catalog |
| Create Cloud Discovery snapshot report | On the Cloud Discovery page, under Actions |

### Investigate

> [!div class="mx-imgBorder"]
> :::image type="content" source="/defender/media/defender-cloud-apps-m365-defender-investigate.png" alt-text="The new locations for Investigation features in the Microsoft Defender portal" lightbox="/defender/media/defender-cloud-apps-m365-defender-investigate.png":::

| Defender for Cloud Apps | Microsoft Defender XDR |
|---------|---------|
| Activity log | Cloud apps -> Activity log |
| Files | Cloud apps -> Files |
| Users and accounts | Assets -> Identities |
| Security configuration | available in [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction) |
| Identity security posture | [Microsoft Defender for Identity's identity security posture assessments](/defender-for-identity/isp-overview) |
| OAuth apps | Cloud apps -> OAuth apps |
| Connected apps | Settings -> Cloud apps -> Connected apps |

### Control

> [!div class="mx-imgBorder"]
> :::image type="content" source="/defender/media/defender-cloud-apps-m365-defender-control.png" alt-text="The new locations for Control features in the Microsoft Defender portal" lightbox="/defender/media/defender-cloud-apps-m365-defender-control.png":::

| Defender for Cloud Apps | Microsoft Defender XDR |
|---------|---------|
| Policies | Cloud apps -> Policy management. Note: Microsoft Entra ID Protection policies will be removed gradually from the Cloud apps policies list. To configure alerts from these policies, see [Configure Microsoft Entra IP alert service](investigate-alerts.md#configure-aad-ip-alert-service) |
| Templates | Cloud apps -> Policy templates |

### Settings

> [!div class="mx-imgBorder"]
> :::image type="content" source="/defender/media/defender-cloud-apps-m365-defender-settings.png" alt-text="The new locations for Settings in the Microsoft Defender portal" lightbox="/defender/media/defender-cloud-apps-m365-defender-settings.png":::

| Defender for Cloud Apps | Microsoft Defender XDR |
|---------|---------|
| Settings | Settings -> Cloud apps |
| Settings/Governance log | Cloud apps -> Governance log |
| Security extensions -> Playbooks | Settings -> Cloud apps |
| Security extensions -> SIEM  agents | Settings -> Cloud apps |
| Security extensions -> External  DLP | Settings -> Cloud apps |
| Security extensions -> API  tokens | Settings -> Cloud apps |
| Manage admin access -> Admin roles | Permissions-> Cloud apps-> Roles |
| Manage admin access -> Activity privacy permissions | Permissions-> Cloud apps-> Activity privacy permissions |
| Exported reports | Reports -> Cloud apps -> Exported reports |
| Scoped deployment and privacy | Settings -> Cloud Apps -> Scoped deployment and privacy |
| Connected Apps / App connectors | Settings -> Cloud Apps -> Connected apps -> App Connectors |
| Conditional Access App Control | Settings -> Cloud apps -> Connected apps -> Conditional Access App Control apps |
| IP address ranges              | Settings -> Cloud apps                                      |
| User groups                    | Settings -> Cloud apps                                      |

The capabilities on the following pages are fully integrated into Microsoft Defender XDR, and therefore don't have their own standalone experience in Microsoft Defender XDR:
  
- [Settings > Microsoft Entra ID Protection](investigate-alerts.md)
- [Settings > App Governance](/defender-cloud-apps/app-governance-get-started)
- [Settings > Microsoft Defender for Identity](/defender-for-identity/deploy-defender-identity)

## What's changed

Learn about the changes that have come with the integration of Defender for Cloud Apps and Microsoft Defender XDR.

### Global search

Use the Microsoft Defender portal's global search bar at the top of the page to search for connected apps in Defender for Cloud Apps.

:::image type="content" source="/defender/media/global-search-apps.png" alt-text="Search for connected apps.":::

### Assets and identities

As part of the creation of a dedicated **Assets** section that spans the entire Microsoft Defender XDR experience, the **Users and Accounts** section of Defender for Cloud Apps is rebranded as the **Identities** section. No changes to functionality are expected.

<a name='redirection-from-the-classic-microsoft-defender-for-cloud-apps-portal-to-microsoft-365-defender'></a>

## Related videos

Learn how to protect your cloud apps in Microsoft Defender XDR:

**Protecting cloud apps in Microsoft Defender XDR**:<br>

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE59yVU title="Protecting cloud apps in Microsoft Defender XDR"]

<br>

**Defender for Cloud Apps in Microsoft Defender XDR for customers migrating from the classic portal**<br>

> [!VIDEO https://learn.microsoft.com/_themes/docs.theme/master/en-us/_themes/global/video-embed.html?id=2105e5c9-23bf-41fb-a61d-0f0fae8ef05f title="Defender for Cloud Apps in Microsoft Defender XDR for customers migrating from the classic portal"]


## Related information

- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Investigate incidents in Microsoft Defender XDR](investigate-incidents.md)
- [Contact support](/defender-cloud-apps/support-and-ts)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
