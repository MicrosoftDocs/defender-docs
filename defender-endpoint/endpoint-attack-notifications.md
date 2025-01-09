---
title: Endpoint Attack Notifications
ms.reviewer:
description: Endpoint Attack Notifications provides proactive hunting for the most important threats to your network.
ms.service: defender-endpoint
ms.author: vpattnaik
author: vpattnai
ms.localizationpriority: medium
manager: dolmont
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-ean
ms.subservice: edr
search.appverid: met150
ms.date: 10/30/2024
---

# Endpoint Attack Notifications

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

> [!NOTE]
> This covers threat hunting on your Microsoft Defender for Endpoint service. However, if you're interested to explore the service beyond your current license, and proactively hunt threats not just on endpoints but also across Office 365, cloud applications, and identity, refer to [Microsoft Defender Experts for Hunting](/defender-xdr/defender-experts-for-hunting).

> [!NOTE]
> The intake of new customers to the Endpoint Attack Notifications service is currently on pause. For customers interested in a managed service, sign up the [Defender Experts service request form](https://aka.ms/IWantDefenderExperts).

Endpoint Attack Notifications (previously referred to as Microsoft Threat Experts - Targeted Attack Notification) provides proactive hunting for the most important threats to your network, including human adversary intrusions, hands-on-keyboard attacks, or advanced attacks like cyber-espionage. These notifications show up as a new alert. The managed hunting service includes:

- Threat monitoring and analysis, reducing dwell time and risk to the business
- Hunter-trained artificial intelligence to discover and prioritize both known and unknown attacks
- Identifying the most important risks, helping SOCs maximize time and energy
- Scope of compromise and as much context as can be quickly delivered to enable fast SOC response

![Screenshot of the Endpoint Attack Notifications alert](/defender/media/defender-endpoint/endpoint-attack-notification-alert.png)

## Apply for Endpoint Attack Notifications

If you're a Microsoft Defender for Endpoint customer, you can apply for Endpoint Attack Notifications. Go to **Settings** \> **Endpoints** \> **General** \> **Advanced features** \> **Endpoint Attack Notifications** to apply. Once accepted, you'll get the benefits of Endpoint Attack Notifications.

![How to enable Endpoint Attack Notifications in 365 Defender Portal](/defender/media/defender-endpoint/enable-endpoint-attack-notifications.png)

## Receive Endpoint Attack notifications

Endpoint Attack Notifications are alerts that have been hand crafted by Microsoft's managed hunting service based on suspicious activity in your environment. They can be viewed through several mediums:

- The alerts queue in the Microsoft Defender portal
- Using the [API](api/get-alerts.md)
- [DeviceAlertEvents](/defender-xdr/advanced-hunting-migrate-from-mde#map-devicealertevents-table) table in Advanced hunting
- Your email if you [configure an email notifications](configure-vulnerability-email-notifications.md) rule

Endpoint Attack Notifications can be identified by:

- Have a tag named **Endpoint Attack Notification**
- Have a service source of **Microsoft Defender for Endpoint** \> **Microsoft Defender Experts**

> [!NOTE]
> If you have enrolled for Endpoint Attack Notifications but are not seeing any alerts from the service, it indicates that you have a strong security posture and are less prone to attacks.

## Create an email notification rule

You can create rules to send email notifications for notification recipients. See [Configure alert notifications](/defender-xdr/configure-email-notifications) to create, edit, delete, or troubleshoot email notification, for details.

## Next steps

- To proactively hunt threats across endpoints, Office 365, cloud applications, and identity, refer to [Microsoft Defender Experts for Hunting](/defender-xdr/defender-experts-for-hunting).
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
