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
ms.date: 05/15/2024
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

Microsoft Defender for Cloud Apps is now part of Microsoft Defender XDR. The Microsoft Defender portal allows security admins to perform their security tasks in one location. This simplifies workflows, and adds the functionality of the other Microsoft Defender XDR services. Microsoft Defender XDR is the home for monitoring and managing security across your Microsoft identities, data, devices, apps, and infrastructure.

SOC analysts can triage, investigate, and hunt across all Microsoft Defender XDR workloads, including cloud apps.

Defender for Cloud Apps **alerts** will continue to appear in Microsoft Defender XDR's incidents queue and alerts queue, but now with relevant content inside the alert pages available in the Microsoft Defender portal, in a unified format with the proper adaptations to each alerts type. For more information, see [Investigate incidents in Microsoft Defender XDR](investigate-incidents.md).

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
