---
title: Onboard client devices (Windows or Mac) to Microsoft Defender for Endpoint
description: Find out how to onboard client devices, such as Windows and Mac PCs to Defender for Endpoint.
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: deniseb
ms.reviewer: pahuijbr
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: install-set-up-deploy
ms.subservice: onboard
search.appverid: met150
ms.date: 04/16/2025
---

# Onboard client devices running Windows or macOS to Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Endpoint data loss prevention (DLP)](/microsoft-365/compliance/endpoint-dlp-learn-about)
- [Insider risk management](/microsoft-365/compliance/insider-risk-management)

## Overview of onboarding client devices

To onboard client devices running Windows or macOS, follow this general process:

1. Make sure to review the [Minimum requirements for Defender for Endpoint](minimum-requirements.md).

2. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints**, and then, under **Device management**, select **Onboarding**.

   :::image type="content" source="media/mde-device-onboarding-ui.png" alt-text="Screenshot showing device onboarding in the Microsoft Defender portal for Defender for Endpoint.":::

3. Under **Select operating system to start onboarding process**, select the operating system for the device.

4. Under **Connectivity type**, select either **Streamlined** or **Standard**. (See [prerequisites for streamlined connectivity](/defender-endpoint/configure-device-connectivity#prerequisites).)

5. Under **Deployment method**, select an option. Then download the onboarding package (and installation package, if there is one available). Follow the instructions to onboard your devices. The following table lists available deployment methods:

   |Operating system | Deployment method |
   |---|---|
   | Windows 11<br/>Windows 10 <br/>Windows 365| [Local script (up to 10 devices)](configure-endpoints-script.md) <br/>[Microsoft Intune / Mobile Device Management](configure-endpoints-mdm.md) <br/> [Microsoft Configuration Manager](configure-endpoints-sccm.md)<br/>[Group Policy](configure-endpoints-gp.md)<br/> [VDI scripts](configure-endpoints-vdi.md)|
   | Windows 8.1 Enterprise or Pro<br/>Windows 7 SP1 Enterprise or Pro| [Microsoft Monitoring Agent](update-agent-mma-windows.md) |
   |Mac<br/>(see [Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md))|[Local script](mac-install-manually.md) (also referred to as manual deployment) <br/> [Microsoft Intune](mac-install-with-intune.md) <br/> [JAMF Pro](mac-install-with-jamf.md) <br/> [Mobile Device Management](mac-install-with-other-mdm.md)|

[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]

## See also

- [Microsoft Defender for Endpoint - Mobile Threat Defense](mtd.md) (for iOS and Android devices)
- [Onboard servers to Microsoft Defender for Endpoint](onboard-server.md)
