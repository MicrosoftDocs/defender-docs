---
title: Download the sensor | Microsoft Defender for Identity
description: Learn how to download the Microsoft Defender for Identity sensors for your domain controllers.
ms.date: 12/21/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Download the Microsoft Defender for Identity classic sensor

This article describes how to download the Microsoft Defender for Identity classic sensor for your domain controllers or Active Directory Federation Services (AD FS), Active Directory Certificate Services (AD CS), and Microsoft Entra Connect servers. 

## Add a sensor and download sensor software

1. In [Microsoft Defender XDR](https://security.microsoft.com), go to **System > Settings** > **Identities**.

1. Select the **Sensors** tab, which displays all of your Defender for Identity sensors. For example:

    :::image type="content" source="../media/download-sensor/sensor-page.png" alt-text="Screenshot that shows where to find the sensors page in the Microsoft Defender portal.":::


1. Select **Add sensor**. In the Add a new sensor pane, select **Continue with classic sensor**, and save the installation package locally. The downloaded zip file includes the following files:

    - The Defender for Identity sensor installer

    - The configuration setting file with the required information to connect to the Defender for Identity cloud service

    - [Npcap OEM version 1.0](https://npcap.com/), automatically installed during the sensor installation

     :::image type="content" source="../media/download-sensor/continue-with-classic-sensor.png" alt-text="Screenshot that shows how to install the classic sensor.":::

1. In the **Add a new sensor** pane, copy the **Access key** value and save it to a secured location. This access key is a one-time password for use when deploying the sensor, after which communication is performed using certificates for authentication and TLS encryption.

    > [!TIP]
    > We recommend regenerating the access key using the **Regenerate key** button regularly. It won't affect any previously deployed sensors, because it's only used for initial registration of the sensor.

1. Copy the downloaded installation package to the dedicated server or domain controller where you're installing the Defender for Identity sensor.

   > [!Note]
   > To download the installation package behind a firewall or proxy server, make sure you allow network traffic to the following FQDN through TCP/443.
   > 
   > sensorpackage-prd.mdi.securitycenter.microsoft.com
   > sensorpackage-fm.mdi.securitycenter.microsoft.us
   > sensorpackage-ff.mdi.securitycenter.microsoft.us

## Next step

- [Install the Microsoft Defender for Identity sensor »](install-sensor.md)
