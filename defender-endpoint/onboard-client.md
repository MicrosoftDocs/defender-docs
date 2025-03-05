---
title: Onboard client devices (Windows or Mac) to Microsoft Defender for Endpoint
description: Find out how to onboard client devices, such as Windows and Mac PCs to Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
ms.reviewer: pahuijbr
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 12/12/2024
---

# Onboard Windows and Mac client devices to Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

You can choose from several options to onboard client devices running Windows or Mac. Make sure to review the [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md), and then select a deployment method in the following table:

|Operating system | Deployment method |
|---|---|
| Windows 11<br/>Windows 10 <br/>Windows 365| [Local script (up to 10 devices)](configure-endpoints-script.md) <br/>[Microsoft Intune / Mobile Device Management](configure-endpoints-mdm.md) <br/> [Microsoft Configuration Manager](configure-endpoints-sccm.md)<br/>[Group Policy](configure-endpoints-gp.md)<br/> [VDI scripts](configure-endpoints-vdi.md)|
| Windows 8.1 Enterprise or Pro<br/>Windows 7 SP1 Enterprise or Pro| [Microsoft Monitoring Agent](update-agent-mma-windows.md) |
|Mac<br/>(see [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md))|[Local script](mac-install-manually.md) (also referred to as manual deployment) <br/> [Microsoft Intune](mac-install-with-intune.md) <br/> [JAMF Pro](mac-install-with-jamf.md) <br/> [Mobile Device Management](mac-install-with-other-mdm.md)|

## See also

- [Microsoft Defender for Endpoint - Mobile Threat Defense](mtd.md) (for iOS and Android devices)
- [Onboard servers to Microsoft Defender for Endpoint](onboard-server.md)
