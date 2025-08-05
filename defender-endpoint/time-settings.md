---
title: Microsoft Defender XDR time zone settings
description: Use the info contained here to configure the Microsoft Defender XDR time zone settings and view license information.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: article
ms.subservice: reference
search.appverid: met150
ms.date: 05/05/2025
---

# Microsoft Defender XDR time zone settings

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)


> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

This article describes time zone settings and options. You can use **Time zone** menu to configure the time zone and view license information.

:::image type="content" source="media/atp-time-zone.png" alt-text="The Time zone settings-1" lightbox="media/atp-time-zone.png":::

> [!NOTE]
> Changing the time zone setting in the [Microsoft Defender portal](https://security.microsoft.com) only affects how times are displayed. It doesn't affect the actual scheduling of operations, such as antivirus scans, which continue to follow the local system time or UTC settings, depending on how they're configured.

## Time zone settings

The aspect of time is important in the assessment and analysis of perceived and actual cyberattacks. Cyberforensic investigations often rely on time stamps to piece together the sequence of events. It's important that your system reflects the correct time zone settings. Defender for Endpoint can display either Coordinated Universal Time (UTC) or local time.

Your current time zone setting is shown in the **Timezone** menu in the Microsoft Defender portal.

:::image type="content" source="media/atp-time-zone-menu.png" alt-text="The Time zone settings-2" lightbox="media/atp-time-zone-menu.png":::

### UTC time zone

Defender for Endpoint uses UTC time by default. Keeping this time zone displays all system timestamps (alerts, events, and others) in UTC for all users. This configuration can help security analysts working in different locations across the globe to use the same time stamps while investigating events.

### Local time zone

You can choose to have Defender for Endpoint use local time zone settings instead of UTC. In this case, all alerts and events are displayed using your local time zone. Choosing this setting means that the timestamps displayed in the Microsoft Defender portal are aligned to local time for all Defender for Endpoint users. Analysts located in different global locations see alerts with time stamps according to their regional settings.

Choosing to use local time can be useful if the analysts are located in a single location. In this case, it might be easier to correlate events to local time, for example, when a local user clicked on a suspicious email link.

The local time zone is based on your device's regional settings. If you change your regional settings, the time zone used for Defender for Endpoint also change. 

### Set the time zone

The Defender for Endpoint time zone is set by default to UTC. Setting the time zone also changes the times for all Defender for Endpoint views.

To set the time zone:

1. Select the **Time zone** menu.

   :::image type="content" source="media/atp-time-zone.png" alt-text="The Time zone settings-3" lightbox="media/atp-time-zone.png":::

2. Select the **Timezone UTC** indicator.

3. Select **Timezone UTC** or your local time zone, for example `-7:00`.

### Regional settings

To apply different date formats for Defender for Endpoint, use regional settings for Microsoft Edge browser. If you're using another browser such as Google Chrome, follow the required steps to change the time and date settings for that browser. 

#### Microsoft Edge browser

Microsoft Edge uses the **Region** settings configured in the **Clocks, Language, and Region** option in the Control panel. 

#### Known issues with regional formats

##### Date and time formats

There are some known issues with the time and date formats. If you configure your regional settings to anything other than the supported formats, the Microsoft Defender portal might not correctly reflect your settings.

The following date and time formats are supported:

- Date format `MM/dd/yyyy`
- Date format `dd/MM/yyyy`
- Time format `hh:mm:ss` (12 hour format)

The following date and time formats are currently not supported:

- Date format `yyyy-MM-dd`
- Date format `dd-MMM-yy`
- Date format `dd/MM/yy`
- Date format `MM/dd/yy`
- Date format with `yy` only shows `yyyy`.
- Time format `HH:mm:ss` (24 hour format)

##### Decimal symbol used in numbers

Decimal symbol used is always a dot, even if a comma is selected in  the **Numbers** format settings in **Region** settings. For example, `15,5K` is displayed as `15.5K`.

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
