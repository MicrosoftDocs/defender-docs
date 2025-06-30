---
title: Activate the Windows Server sensor v3.x on a domain controller 
description: Learn about how to activate the Microsoft Defender for Identity sensor on domain controllers.
ms.date: 06/18/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Activate the Windows Server sensor v3.x on a domain controller (Preview)

For complete protection of your on-premises deployment, we recommend activating the Defender for Identity sensor on all applicable servers.

This article describes onboarding for new domain controllers running Windows Server 2019 or later. For domain controllers running older operating systems, we recommend [deploying the classic Defender for Identity sensor](install-sensor.md).

## Prerequisites
See [Microsoft Defender for Identity sensor v3.x prerequisites](prerequisites-sensor-version-3.md) for all system requirements before proceeding with activating the sensor.

## Check the Activation State

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **System** > **Settings** > **Identities** > **Activation**.
1. The **Activation** page contains an **activation state** for each domain controller. See the **activation state** to let you know what you need to do to onboard the domain controller to Defender for Identity.

|Activation State  |Next steps  |
|---------|---------|
|Install classic sensor|[Deploy the classic Defender for Identity sensor](install-sensor.md) from the **Sensors page**.|
|Needs OS update     |This domain controller is running an unsupported operating system version for the new sensor. Update the server to Windows Server 2019 or later to use the new sensor. |
|Activate new sensor |The domain controller is already onboarded to Defender for Endpoint. [Activate the sensor](#activate-the-defender-for-identity-sensor).|
|Download the onboarding package     |[Onboard the domain controller to Defender for Endpoint](#onboard-the-domain-controller-to-defender-for-endpoint), and then [activate the sensor](#activate-the-defender-for-identity-sensor). |
 
## Onboard the domain controller to Defender for Endpoint

This step is only required if your domain controller is not already onboard to Defender for Endpoint. The Defender for Identity sensor uses Defender for Endpoint URL endpoints for communication, including streamlined URLs. 

If the domain controller has not been onboarded to Defender for Endpoint, follow these steps to activate the sensor.

### Configure Defender for Endpoint streamlined URLs

1. [Configure your network environment to ensure connectivity with Defender for Endpoint](/microsoft-365/security/defender-endpoint/configure-environment##enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server)
1. [Configure connectivity using streamlined connection](/microsoft-365/security/defender-endpoint/configure-device-connectivity#option-1-configure-connectivity-using-the-simplified-domain).

### Download the Defender for Identity onboarding package

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **System** > **Settings** > **Identities** > **Activation**.

2. Select **Download onboarding package**, and save the file in a location you can access from your domain controller.

   [![Screenshot that shows how to onboard the new sensor.](media/activate-capabilities/screenshot-that-shows-how-to-onboard-the-new-sensor.png)](media/activate-capabilities/screenshot-that-shows-how-to-onboard-the-new-sensor.png#lightbox)
   
3. From the domain controller, extract the zip file you downloaded from the Microsoft Defender portal.
1. Run the `DefenderForIdentityOnlyOnboardingScript.cmd` script as an administrator.

   [![screenshot that shows the onboarding script.](media/activate-capabilities/screenshot-2025-06-04-170500.png)](media/activate-capabilities/screenshot-2025-06-04-170500.png#lightbox)

## Activate the Defender for Identity sensor

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **System** > **Settings** > **Identities** > **Activation**.

   The **Activation Page** displays all servers from your device inventory, and the server's activation state. You can choose to activate eligible domain controllers either automatically, where Defender for Identity activates them as soon as they're discovered, or manually, by selecting specific domain controllers from the list of eligible servers.

1. Select the domain controller where you want to activate Defender for Identity, and select **Activate**. Confirm your selection when prompted. 

   [![Screenshot that shows how to activate the new sensor.](media/activate-capabilities/1.jpg)](media/activate-capabilities/1.jpg#lightbox)

1. When the activation is complete, a green success banner shows. In the banner, select **Click here to see the onboarded servers**. This takes you to the **Sensors** page, where you can check your sensor health.

    [![Screenshot that shows how to see the onboarded servers.](media/activate-capabilities/2.jpg)](media/activate-capabilities/2.jpg#lightbox)

## Confirm onboarding 

To confirm the sensor is working: 

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **System** > **Settings** > **Identities** > **Sensors**.
1. Check that the onboarded domain controller is listed. 

> [!NOTE]
> The first time you activate the Defender for Identity sensor on your domain controller, it might take up to an hour for the first sensor to show as **Running** on the **Sensors** page. Subsequent activations are shown within five minutes. The activation doesn't require a restart/reboot. 

## Next steps
- [Manage and update Microsoft Defender for Identity sensors](../sensor-settings.md).
