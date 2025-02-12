---
title: Download the sensor | Microsoft Defender for Identity
description: Learn how to download the Microsoft Defender for Identity sensors for your domain controllers.
ms.date: 06/13/2023
ms.topic: how-to
---

# Download the Microsoft Defender for Identity sensor

This article describes how to download the Microsoft Defender for Identity sensor for your domain controllers or AD CS / AD FS servers. 

## Add a sensor and download sensor software

1. In [Microsoft Defender XDR](https://security.microsoft.com), go to **System > Settings** > **Identities**.

1. Select the **Sensors** tab, which displays all of your Defender for Identity sensors. For example:

    [![Screenshot of the Sensors tab.](../media//sensor-page.png)](../media/sensor-page.png#lightbox)

1. Select **Add sensor**. Then, in the **Add a new sensor** pane, select **Download installer** and save the installation package locally. The downloaded zip file includes the following files:

    - The Defender for Identity sensor installer

    - The configuration setting file with the required information to connect to the Defender for Identity cloud service

    - [Npcap OEM version 1.0](https://npcap.com/), which is automatically installed by the sensor installation if it's not found to be already installed

1. In the **Add a new sensor** pane, copy the **Access key** value and save it to a secured location. This access key is a one-time password for use when deploying the sensor, after which communication is performed using certificates for authentication and TLS encryption.

    > [!TIP]
    > It is recommended to regenerate the access key using the **Regenerate key** button on a regular basis. It won't affect any previously deployed sensors, because it's only used for initial registration of the sensor.

1. Copy the downloaded installation package to the dedicated server or domain controller where you're installing the Defender for Identity sensor.

## Next step

> [!div class="step-by-step"]
> [Install the Microsoft Defender for Identity sensor »](install-sensor.md)
