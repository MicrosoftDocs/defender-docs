---
title: Onboarding devices using streamlined connectivity for Microsoft Defender for Endpoint 
description: Learn how to use a streamlined domain or static IP ranges during onboarding when connecting devices to Microsoft Defender for Endpoint.         
author: paulinbar
ms.author: painbar
ms.date: 09/29/2025
ms.topic: how-to
ms.service: defender-endpoint
ms.subservice: onboard
ms.localizationpriority: medium 
ms.collection: 
- m365-security
- tier1
ms.reviewer: pahuijbr
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Vulnerability Management

---

# Onboarding devices using streamlined connectivity for Microsoft Defender for Endpoint 


[!INCLUDE [Prerelease information](../includes/prerelease.md)]

The Defender for Endpoint client might require the use of proxied connections to relevant cloud services. This article describes the streamlined device connectivity method, the prerequisites and provides additional information for verifying connectivity using the new destination(s).

To simplify network configuration and management, you can now onboard new devices to Defender for Endpoint using a reduced URL set or static IP ranges. For more information, see [Migrating devices to streamlined connectivity](migrate-devices-streamlined.md).

## Defender for Endpoint-recognized simplified domain

The Defender for Endpoint-recognized simplified domain `*.endpoint.security.microsoft.com` (for commercial devices) or `*.endpoint.security.microsoft.us` (for US government devices - Preview) consolidates connectivity to the following core Defender for Endpoint services:

- Cloud-delivered protection
- Malware sample submission storage
- Auto-IR sample storage
- Defender for Endpoint command & control
- Defender for Endpoint cyber and diagnostic data

For more information on preparing your environment and the updated list of destinations, see [STEP 1: Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md).

To support network devices without hostname resolution or wildcard support, you can alternatively configure connectivity using dedicated Defender for Endpoint static IP ranges. For more information, see [Configure connectivity using static IP ranges](#option-2-configure-connectivity-using-static-ip-ranges).

> [!NOTE]
>
> - The streamlined connectivity method **doesn't change Defender for Endpoint functionality or end-user experience**. Only the URLs or IPs used for service connectivity have changed.
> - There are no plans to deprecate old service URLs. Devices onboarded with standard connectivity continue to function. Ensure ongoing connectivity to `*.endpoint.security.microsoft.com` (for commercial devices) or `*.endpoint.security.microsoft.us` (for US government devices - Preview) for future services.
> - Service connections use certificate pinning and TLS. Traffic inspection is not supported. Connections are device-initiated, not user-initiated. Enforcing proxy (user) authentication breaks connectivity.

## Prerequisites

Devices must meet specific prerequisites to use the streamlined connectivity method for Defender for Endpoint. Ensure the prerequisites are met before proceeding with onboarding.

**Minimum KB update (Windows)**

- SENSE version: 10.8040.*/ March 8, 2022 or higher (see table)

**Microsoft Defender Antivirus versions (Windows)**

- **Antimalware Client:** `4.18.2211.5` 
- **Engine:** `1.1.19900.2` 
- **Antivirus (Security Intelligence):** `1.391.345.0`

### Supported operating systems

- Windows 10 version 1809 or later. 
- Windows 10 versions 1607, 1703, 1709, 1803 are supported on the streamlined onboarding package but require a different URL list, see [Microsoft Defender for Endpoint streamlined connectivity URLs - commercial](streamlined-device-connectivity-urls-commercial.md)
- Windows 11
- Windows Server 2019 and later
- Windows Server 2012 R2 or Windows Server 2016, fully updated running Defender for Endpoint modern unified solution (installation through MSI).
- [macOS supported versions](microsoft-defender-endpoint-mac.md) with MDE product version 101.24022.*+
- [Linux supported versions](microsoft-defender-endpoint-linux.md) with MDE product version 101.24022.*+
- Azure Stack HCI OS, version 23H2 and later.

> [!IMPORTANT]
>
> - **Devices running on MMA agent are not supported** on the streamlined connectivity method and will need to continue using the standard URL set (Windows 7, Windows 8.1, Windows Server 2008 R2 MMA, Server 2012 & 2016 not upgraded to modern unified agent). 
> - Windows Server 2012 R2 and Server 2016 will need to upgrade to unified agent to leverage the new method. <br/>
> - Windows 10 1607, 1703, 1709, 1803 can leverage the new onboarding option but will use a longer list. For more information, see the [Microsoft Defender for Endpoint streamlined connectivity URLs - commercial](streamlined-device-connectivity-urls-commercial.md)

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

## Streamlined connectivity process

The following illustration shows the streamlined connectivity process and the corresponding stages:

:::image type="content" source="media/streamlined-connectivity-process.png" alt-text="Illustration of  streamlined connectivity process":::

### Stage 1. Configure your network environment for cloud connectivity 

Once you confirm prerequisites are met, ensure your network environment is properly configured to support the streamlined connectivity method. Follow the steps outlined in [Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md). 

Defender for Endpoint service URLs consolidated under simplified domain should no longer be required for connectivity. However, some URLs aren't included in the consolidation. 

Streamlined connectivity allows you to use the following option to configure cloud connectivity:

- [Option 1: Use the simplified domain](#option-1-configure-connectivity-using-the-simplified-domain)
- [Option 2: Use static IP ranges](#option-2-configure-connectivity-using-static-ip-ranges)

#### Option 1: Configure connectivity using the simplified domain

Configure your environment to allow connections to the simplified Defender for Endpoint domain:

- For commercial devices: `*.endpoint.security.microsoft.com`
- For US government devices (Preview): `*.endpoint.security.microsoft.us`

For more information, see [Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md).

You must maintain connectivity with remaining required services listed under the [Microsoft Defender for Endpoint standard connectivity URLs - commercial](standard-device-connectivity-urls-commercial.md) or [Microsoft Defender for Endpoint standard connectivity URLs - US government](standard-device-connectivity-urls-gov.md). For example, the certification revocation list, Windows Update, SmartScreen services may also need to be accessible dependent on your current networking infrastructure and patching approach.

#### Option 2: Configure connectivity using static IP ranges 

With streamlined connectivity, IP-based solutions can be used as an alternative to URLs. These IPs cover the following services:

- MAPS
- Malware Sample Submission Storage
- Auto-IR Sample Storage
- Defender for Endpoint Command and Control

> [!IMPORTANT]
> The EDR Cyber data service (OneDsCollector) *must* be configured separately if you are using the IP method (this service is only consolidated on a URL level).You must also maintain connectivity with other required services including SmartScreen, CRL, Windows Update, and other services.<br/>

In order to stay up to date on IP ranges, it's recommended to refer to the following Azure service tags for Microsoft Defender for Endpoint services. The latest IP ranges are found in the service tag. For more information, see [Azure IP ranges](https://azureipranges.azurewebsites.net/).

| Service tag name    |    Defender for Endpoint services included   |
|:---|:---|
| `MicrosoftDefenderForEndpoint` | Cloud-delivered protection, malware sample submission storage, Auto-IR sample storage,  Defender for Endpoint command and control. |
| `OneDsCollector` | Defender for Endpoint cyber and diagnostic data <br/><br/> Note: The traffic under this service tag isn't limited to Defender for Endpoint and can include diagnostic data traffic for other Microsoft services. |

For latest service tags list, refer to the [Azure service tags](/azure/virtual-network/service-tags-overview) documentation.

> [!IMPORTANT]
> In compliance with Defender for Endpoint security and compliance standards, your data will be processed and stored in accordance with your tenant's physical location. Based on client location, traffic may flow through any of these IP regions (which correspond to Azure datacenter regions). For more information, see [Data storage and privacy](data-storage-privacy.md).  

### Stage 2. Configure your devices to connect to Defender for Endpoint service

Configure devices to communicate through your connectivity infrastructure. Ensure devices meet prerequisites and have updated sensor and Microsoft Defender Antivirus versions.  For more information, see [Configure device proxy and Internet connection settings ](configure-proxy-internet.md).

### Stage 3. Verify client connectivity pre-onboarding

For more information, see [Verify client connectivity](verify-connectivity.md).

The following pre-onboarding checks can be run on both Windows and Xplat MDE Client analyzer: [Download the Microsoft Defender for Endpoint client analyzer](overview-client-analyzer.md).

To test streamlined connectivity for devices not yet onboarded to Defender for Endpoint, you can use the Client Analyzer for Windows using the following commands: 

- Run `mdeclientanalyzer.cmd -o <path to cmd file>`  from within the MDEClientAnalyzer folder. The command uses parameters from onboarding package to test connectivity.

- Run `mdeclientanalyzer.cmd -g <GW_US, GW_UK, GW_EU>` , where parameter is of GW_US, GW_EU, GW_UK. GW refers to the streamlined option. Run with applicable tenant geo.

As a supplementary check, you can also use the client analyzer to test whether a device meets prerequisites: [MDEClientAnalyzerPreview.zip](https://aka.ms/MDEClientAnalyzerPreview).
 

> [!NOTE]
> For devices not yet onboarded to Defender for Endpoint, client analyzer will test against standard set of URLs. To test the streamlined approach, you will need to run with the switches listed earlier in this article. 

### Stage 4. Apply the new onboarding package required for streamlined connectivity

Once you configure your network to communicate with the full list of services, you can begin onboarding devices using the streamlined method. 

Before proceeding, confirm devices meet the [prerequisites](#prerequisites) and have updated sensor and Microsoft Defender Antivirus versions. 


1. To get the new package, in Microsoft Defender XDR, select **Settings > Endpoints > Device management> Onboarding**.

1. Select the applicable operating system and choose "Streamlined" from the Connectivity type dropdown menu.

1. For new devices (not onboarded to Defender for Endpoint) supported under this method, follow onboarding steps from previous sections using the updated onboarded package with your preferred deployment method:

   - [Onboard to Microsoft Defender for Endpoint](onboarding.md)
   - [Onboard client devices running Windows or macOS](onboard-client.md)
   - [Onboard servers through Microsoft Defender for Endpoint's onboarding experience](onboard-server.md)
   - [Run a detection test on a device to verify it has been properly onboarded to Microsoft Defender for Endpoint](run-detection-test.md)

1. Exclude devices from any existing onboarding policies that use the standard onboarding package.

For migrating devices already onboarded to Defender for Endpoint, see [Migrating devices to the streamlined connectivity](migrate-devices-streamlined.md). You must reboot your device and follow specific guidance here.
