---
title: Onboard Windows client devices to Microsoft Defender for Endpoint
description: Find out how to onboard Windows client devices to Defender for Endpoint.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.reviewer: pahuijbr
ms.collection:
- m365-security
- tier2
ms.topic: install-set-up-deploy
ms.subservice: onboard
ms.date: 11/17/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Onboard Windows client devices to Microsoft Defender for Endpoint

## Overview of onboarding client devices

[!INCLUDE [Microsoft Defender deployment tool preview](./includes/defender-deployment-tool-preview.md)]

To onboard Windows client devices, follow this general process:

1. Make sure to review the [Minimum requirements for Defender for Endpoint](minimum-requirements.md).

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **System** > **Settings** > **Endpoints**, and then, under **Device management**, select **Onboarding**.

   :::image type="content" source="media/mde-device-onboarding-ui.png" alt-text="Screenshot showing device onboarding in the Microsoft Defender portal for Defender for Endpoint." lightbox="media/mde-device-onboarding-ui.png":::

1. Under **Select operating system to start onboarding process**, select the operating system for the device.

1. Under **Connectivity type**, select either **Streamlined** or **Standard**. (See [prerequisites for streamlined connectivity](configure-device-connectivity.md#prerequisites).)

1. Under **Deployment method**, select an option. Then download the onboarding package (and installation package, if there's one available). Follow the instructions to onboard your devices. The following table lists available deployment methods:

   |Operating system | Deployment method |
   |---|---|
   | Windows 11<br/>Windows 10 <br/>Windows 365| [Local script (up to 10 devices)](configure-endpoints-script.md) <br/>[Microsoft Intune / Mobile Device Management](configure-endpoints-mdm.md) <br/> [Microsoft Configuration Manager](configure-endpoints-sccm.md)<br/>[Group Policy](configure-endpoints-gp.md)<br/> [VDI scripts](configure-endpoints-vdi.md)|
   | Windows 8.1 Enterprise or Pro<br/>Windows 7 SP1 Enterprise or Pro| [Microsoft Monitoring Agent](update-agent-mma-windows.md) |

[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]

## See also

- [Microsoft Defender for Endpoint - Mobile Threat Defense](mtd.md) (for iOS and Android devices)
- [Onboard servers to Microsoft Defender for Endpoint](onboard-server.md)

