---
title: Onboard non-Windows devices to the Microsoft Defender for Endpoint service
description: Configure non-Windows devices so that they can send sensor data to the Microsoft Defender for Endpoint service.
search.appverid: met150
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: conceptual
ms.subservice: onboard
ms.date: 06/25/2024
---

# Onboard non-Windows devices

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)

**Platforms**
- macOS
- Linux

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Defender for Endpoint provides a centralized security operations experience for Windows and non-Windows platforms. You'll be able to see alerts from various supported operating systems (OS) in Microsoft Defender XDR and better protect your organization's network.

You'll need to know the exact Linux distros and macOS versions that are compatible with Defender for Endpoint for the integration to work. For more information, see:

- [Microsoft Defender for Endpoint on Linux system requirements](microsoft-defender-endpoint-linux.md#system-requirements)
- [Microsoft Defender for Endpoint on macOS system requirements](microsoft-defender-endpoint-mac.md#system-requirements).

## Onboarding non-Windows devices

You can choose to onboard non-Windows devices through Microsoft Defender for Endpoint or through a third-party (non-Microsoft) solution.

- To onboard macOS devices using Microsoft Defender for Endpoint, see [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md).

- To onboard Linux devices using Microsoft Defender for Endpoint, see [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md).

- To onboard non-windows devices using a non-Microsoft solution:

   1. In the navigation pane, select **Partners and APIs** > **Connected Applications**. Make sure the non-Microsoft solution is listed.
      
   2. In the **Connected Applications** page, select the partner that supports your non-Windows devices.
      
   3. Select **View** to open the partner's page. Follow the instructions provided on the page.
      
   4. After creating an account or subscribing to the partner solution, you should get to a stage where an administrator (such as a tenant administrator) is asked to accept a permission request from the partner application. Read the permission request carefully to make sure that it's aligned with the service that you require.

      > [!IMPORTANT]
      > Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.


[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]

## Offboard non-Windows devices

For macOS and Linux devices, you can choose to offboard through Microsoft Defender for Endpoint. In the navigation pane, select **Settings** > **Offboard** > **Select Operating System to start the offboarding Process**.

For details on offboarding Microsoft Defender on macOS, see [Uninstalling Microsoft Defender for macOS](mac-resources.md).

You can also offboard non-Windows devices by disabling the third-party integration. Enable coverage for devices running non-Windows platforms by [integrating third-party solutions](https://security.microsoft.com/interoperability/partners).

## Related topics

- [Onboard Windows devices](onboard-windows-client.md)
- [Onboard servers](configure-server-endpoints.md)
- [Configure proxy and Internet connectivity settings](configure-proxy-internet.md)
- [Troubleshooting Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

