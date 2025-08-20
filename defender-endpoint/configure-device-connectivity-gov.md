---
title: Onboarding devices using streamlined connectivity for Microsoft Defender for Endpoint government customers 
description: Learn how to use a streamlined domain or static IP ranges during onboarding when connecting devices to Microsoft Defender for Endpoint as a government customer.         
author: limwainstein
ms.author: lwainstein
manager: orspodek 
ms.topic: how-to
ms.service: defender-endpoint
ms.subservice: onboard
ms.localizationpriority: medium 
ms.collection: 
- m365-security
- tier1
ms.reviewer: pahuijbr
search.appverid: MET150
audience: ITPro
ms.date: 08/20/2025
---

# Onboarding devices using streamlined connectivity for Microsoft Defender Endpoint US government environments

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

Microsoft Defender for Endpoint devices in GCC, GCC High, and DoD environments can use streamlined connectivity to simplify endpoint configuration. This reduces the number of required service endpoints and supports improved performance and reliability.

This article describes the streamlined device connectivity method for US government environments, the prerequisites and provides additional information for verifying connectivity using the new destination(s).

To simplify network configuration and management, you now have the option of onboarding new devices to Defender for Endpoint using a reduced URL set or static IP ranges. For more information on migrating previously onboarded devices, see [Migrating devices to streamlined connectivity](migrate-devices-streamlined.md). 

The Defender for Endpoint-recognized simplified domain: `*.endpoint.security.microsoft.com` consolidates connectivity to the following core Defender for Endpoint services:

- Cloud-delivered protection
- Malware sample submission storage
- Auto-IR sample storage
- Defender for Endpoint command & control
- Defender for Endpoint cyber and diagnostic data

> [!NOTE] 
> - The streamlined connectivity method will **not change how Microsoft Defender for Endpoint functions on a device nor will it change the end-user experience**. Only the URLs or IPs that a device uses to connect to the service will change.
> - There currently is no plan to deprecate the old, consolidated service URLs. Devices onboarded with "standard" connectivity will continue to function. It is important to ensure connectivity to `*.endpoint.security.microsoft.com` is and remains possible, as future services will require it. This new URL is included in all required URL lists.
> - Connections to the service leverage certificate pinning and TLS. It is not supported to "break and inspect" traffic. In addition, connections are initiated from a device context, not a user context. Enforcing proxy (user) authentication will disallow (break) connectivity in most cases.

## Before you begin 

Devices must meet specific prerequisites to use the streamlined connectivity method for Defender for Endpoint. Ensure the prerequisites are met before proceeding with onboarding.
 
### Prerequisites

**License:**

- Microsoft Defender for Endpoint Plan 1
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender for Business
- Microsoft Defender Vulnerability Management

**Minimum KB update (Windows)**

- SENSE version: 10.8040.*/ March 8, 2022 or higher (see table)

**Microsoft Defender Antivirus versions (Windows)**

- **Antimalware Client:** `4.18.2211.5` 
- **Engine:** `1.1.19900.2` 
- **Antivirus (Security Intelligence):** `1.391.345.0`

**Defender Antivirus versions (macOS/Linux)**

- [macOS supported versions](microsoft-defender-endpoint-mac.md) with MDE product version 101.24022.*+
- [Linux supported versions](microsoft-defender-endpoint-linux.md) with MDE product version 101.24022.*+

**Supported Operating Systems**

- Windows 10 version 1809 or later. Windows 10 versions 1607, 1703, 1709, 1803 are supported on the streamlined onboarding package but require a different URL list, see [streamlined URL sheet](https://aka.ms/MDE-streamlined-urls)
- Windows 11
- Windows Server 2025
- Windows Server 2022
- Windows Server 2019
- Windows Server 2012 R2 or Windows Server 2016, fully updated running Defender for Endpoint modern unified solution (installation through MSI).
- [macOS supported versions](microsoft-defender-endpoint-mac.md) with MDE product version 101.24022.*+
- [Linux supported versions](microsoft-defender-endpoint-linux.md) with MDE product version 101.24022.*+

> [!IMPORTANT]
> - **Devices running on MMA agent are not supported** on the streamlined connectivity method and will need to continue using the standard URL set (Windows 7, Windows 8.1, Windows Server 2008 R2 MMA, Server 2012 & 2016 not upgraded to modern unified agent). 
> - Windows Server 2012 R2 and Server 2016 will need to upgrade to unified agent to leverage the new method. <br/>
> - Windows 10 1607, 1703, 1709, 1803 can leverage the new onboarding option but will use a longer list. For more information, see the [streamlined URL sheet](https://aka.ms/MDE-streamlined-urls).

| Windows   OS    |     Minimum   KB Required (March 8, 2022)    |
|:---|:---|
|     Windows 11    |     KB5011493   (March 8, 2022)    |
|     Windows 10 1809,   Windows Server 2019    |     KB5011503  (March 8, 2022)    |
|     Windows 10 19H2   (1909)    |     KB5011485   (March 8, 2022)    |
|     Windows 10 20H2,   21H2    |     KB5011487   (March 8, 2022)    |
|     Windows 10 22H2    |     KB5020953 (October   28, 2022)    |
|     Windows 10 1803*    |     < end of   service >     |
|     Windows 10 1709*    |     < end of   service >     |
|     Windows Server   2022    |     KB5011497   (March 8, 2022)    |
|     Windows Server   2012 R2, 2016*    |     Unified Agent    |

## Enable streamlined connectivity for US government environments

To enable streamlined connectivity for US government environments:

1. Ensure your tenant is enrolled in a supported government cloud.
1. Validate that required endpoints listed in the [connectivity settings](gov.md#required-connectivity-settings) are accessible.
1. Use the [onboarding script](configure-endpoints-script.md) with the `-UseStreamlinedConnectivity` flag.