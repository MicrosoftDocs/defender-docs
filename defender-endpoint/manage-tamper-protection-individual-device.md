---
title: Manage tamper protection on an individual device
ms.reviewer: joshbregman, mattcall, pahuijbr, hayhov, oogunrinde
description: Turn tamper protection on or off for an individual device.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 10/20/2025
ms.topic: how-to
author: limwainstein
ms.author: lwainstein
ms.custom: 
- nextgen
- admindeeplinkDEFENDER
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender Antivirus

---
# Manage tamper protection on an individual device


[Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) helps protect certain [security settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on), such as virus and threat protection, from being disabled or changed.

If you're a home user, or you aren't subject to settings managed by a security team, you can use the Windows Security app to manage tamper protection on an individual Windows device. You must have appropriate admin permissions on your device to do change security settings, such as tamper protection.

## Prerequisites

### Supported operating systems

- Windows

## Turn tamper protection on or off

1. On a Windows device, select **Start**, and start typing *Security*. In the search results, select **Windows Security**.

1. Select **Virus & threat protection** \> **Virus & threat protection settings**.

1. Set **Tamper Protection** to **On** or **Off**.

    Here's what you see in the Windows Security app:
    
    :::image type="content" source="media/tamperprotectionturnedon.png" alt-text="Turn tamper protection turned on in Windows 10 Home" lightbox="media/tamperprotectionturnedon.png":::


    > [!NOTE]
    > Tamper protection blocks attempts to modify Microsoft Defender Antivirus settings through the registry. 
    >
    > To help ensure that tamper protection doesn't interfere with non-Microsoft security products or enterprise installation scripts that modify these settings, go to **Windows Security** and update **Security intelligence** to version 1.287.60.0 or later. (See [Security intelligence updates](https://www.microsoft.com/wdsi/defenderupdates).)
    >
    > After you've made this update, tamper protection continues to protect your registry settings, and logs attempts to modify them without returning errors.

## See also

- [Protect security settings with tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md)
- [Troubleshoot problems with tamper protection](troubleshoot-problems-with-tamper-protection.yml)



