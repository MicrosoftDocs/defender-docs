---
title: Defender for Endpoint onboarding Windows Client
description: Onboard Windows Client devices to Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 12/31/2024
---

# Defender for Endpoint onboarding Windows client devices

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Endpoint data loss prevention (DLP)](/microsoft-365/compliance/endpoint-dlp-learn-about)
- [Insider risk management](/microsoft-365/compliance/insider-risk-management)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

To onboard Windows client devices, follow the onboarding steps in the [Microsoft Defender portal](https://security.microsoft.com) (Go to **Settings** > **Endpoints** > **Onboarding**). You can onboard any of the supported devices. Depending on the particular device, you're guided with the appropriate steps according to the management and deployment tool options suitable for the device.

Devices in your organization must be configured so that the Defender for Endpoint service can get sensor data from them. There are various methods and deployment tools that you can use to configure the devices in your organization. In general, you identify the client you're onboarding, then follow the corresponding tool appropriate to the device or your environment.

:::image type="content" source="media/onboarddevices.png" alt-text="Onboard devices" lightbox="media/onboarddevices.png":::

[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]

## Related articles

- [Onboard Windows devices using Microsoft Intune](configure-endpoints-mdm.md)
- [Onboard Windows devices using Group Policy](configure-endpoints-gp.md)
- [Onboard Windows devices using a local script](configure-endpoints-script.md)
- [Onboard non-persistent virtual desktop infrastructure (VDI) devices](configure-endpoints-vdi.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
