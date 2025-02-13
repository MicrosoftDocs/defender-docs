---
title: Microsoft Defender for Endpoint on Mac
ms.reviewer: joshbregman
description: Learn how to install, configure, update, and use Microsoft Defender for Endpoint on Mac.
ms.service: defender-endpoint
author: emmwalshh
ms.author: ewalsh
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: conceptual
ms.subservice: macos
search.appverid: met150
ms.date: 10/15/2024
---

# Microsoft Defender for Endpoint on Mac

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

This article describes how to install, configure, update, and use Defender for Endpoint on Mac.

> [!CAUTION]
> Running other non-Microsoft endpoint protection products alongside Microsoft Defender for Endpoint on Mac is likely to lead to performance problems and unpredictable side effects. If non-Microsoft endpoint protection is an absolute requirement in your environment, you can still safely take advantage of Defender for Endpoint on Mac EDR functionality after configuring the antivirus functionality to run in [Passive mode](mac-preferences.md#enforcement-level-for-antivirus-engine).

## What's new in the latest release

[What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md)

[What's new in Microsoft Defender for Endpoint on Mac](mac-whatsnew.md)

> [!TIP]
> If you have any feedback that you would like to share, submit it by opening Microsoft Defender for Endpoint on Mac on your device and navigating to **Help** \> **Send feedback**.

To get the latest features, including preview capabilities (such as endpoint detection and response for your Mac devices), configure your macOS device running Microsoft Defender for Endpoint to be a Beta channel (formerly Insider-Fast) device.

## How to install Microsoft Defender for Endpoint on Mac

### Prerequisites

- A Defender for Endpoint subscription and access to the Microsoft Defender portal
- Beginner-level experience in macOS and BASH scripting
- Administrative privileges on the device (in manual deployment)

### Installation instructions

There are several methods and deployment tools that you can use to install and configure Defender for Endpoint on Mac.

- [Microsoft Intune-based deployment](mac-install-with-intune.md)
- Non-Microsoft management tools:
    - [JAMF-based deployment](mac-install-with-jamf.md)
    - [Other MDM products](mac-install-with-other-mdm.md)
- Command-line tool: [Manual deployment](mac-install-manually.md)

### System requirements

These three most recent major releases of macOS are supported.
- 15.0.1 (Sequoia)
- 14 (Sonoma)
- 13 (Ventura)

- Supported processors: x64 and ARM64

- Disk space: 1GB

- Beta versions of macOS aren't supported.

> [!IMPORTANT]
> On macOS 11 (Large Sur) and later, Microsoft Defender for Endpoint requires more configuration profiles. If you're an existing customer upgrading from earlier versions of macOS, make sure to deploy the extra configuration profiles listed on [New configuration profiles for macOS Big Sur and newer versions of macOS](mac-sysext-policies.md) and detailed in [installation instructions](#installation-instructions).

After you've enabled the service, you might need to configure your network or firewall to allow outbound connections between it and your endpoints.

### Licensing requirements

Microsoft Defender for Endpoint on Mac requires one of the following Microsoft Volume Licensing offers:

- Microsoft 365 E5
- Microsoft 365 E5 Security
- Microsoft 365 A5
- Windows 10 Enterprise E5
- Microsoft 365 Business Premium
- Windows 11 Enterprise E5
- Microsoft Defender for Endpoint P2 (included in Microsoft 365 E5 and E5 Security)
- Microsoft Defender for Endpoint P1 (included in [Microsoft 365 E3](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/microsoft-defender-for-endpoint-plan-1-now-included-in-m365-e3/ba-p/3060639))

> [!NOTE]
> Eligible licensed users might use Microsoft Defender for Endpoint on up to five concurrent devices.
> Microsoft Defender for Endpoint is also available for purchase from a Cloud Solution Provider (CSP). When purchased via a CSP, it doesn't require Microsoft Volume Licensing offers listed.

### Configuring Exclusions

When adding exclusions, be mindful of [common exclusion mistakes for Microsoft Defender Antivirus](common-exclusion-mistakes-microsoft-defender-antivirus.md).

### Network connections

Ensure that connectivity is possible from your devices to Microsoft Defender for Endpoint cloud services. To prepare your environment, please reference [STEP 1: Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md).

Microsoft Defender for Endpoint can connect through a proxy server by using the following methods:

- Proxy autoconfig (PAC)
- Web Proxy Autodiscovery Protocol (WPAD)
- Manual static proxy configuration

If a proxy or firewall is blocking anonymous traffic, make sure that anonymous traffic is permitted in the previously listed URLs.

> [!WARNING]
> Authenticated proxies aren't supported. Ensure that only PAC, WPAD, or a static proxy is being used.
> SSL inspection and intercepting proxies are also not supported for security reasons. Configure an exception for SSL inspection and your proxy server to directly pass through data from Microsoft Defender for Endpoint on macOS to the relevant URLs without interception. Adding your interception certificate to the global store won't allow for interception.

#### Test network connectivity

To test that a connection isn't blocked, open `https://x.cp.wd.microsoft.com/api/report` and `https://cdn.x.cp.wd.microsoft.com/ping` in a browser.

If you prefer the command line, you can also check the connection by running the following command in Terminal:

```bash
curl -w ' %{url_effective}\n' 'https://x.cp.wd.microsoft.com/api/report' 'https://cdn.x.cp.wd.microsoft.com/ping'
```

The output from this command should be similar to the following:

 `OK https://x.cp.wd.microsoft.com/api/report`

 `OK https://cdn.x.cp.wd.microsoft.com/ping`

> [!CAUTION]
> We recommend that you keep [System Integrity Protection](https://support.apple.com/HT204899) (SIP) enabled on client devices. SIP is a built-in macOS security feature that prevents low-level tampering with the OS, and is enabled by default.

Once Microsoft Defender for Endpoint is installed, connectivity can be validated by running the following command in Terminal:

```bash
mdatp connectivity test
```

## How to update Microsoft Defender for Endpoint on Mac

Microsoft regularly publishes software updates to improve performance, security, and to deliver new features. To update Microsoft Defender for Endpoint on Mac, a program named Microsoft AutoUpdate (MAU) is used. To learn more, see [Deploy updates for Microsoft Defender for Endpoint on Mac](mac-updates.md).

## How to configure Microsoft Defender for Endpoint on Mac

Guidance for how to configure the product in enterprise environments is available in [Set preferences for Microsoft Defender for Endpoint on Mac](mac-preferences.md).

## macOS kernel and system extensions

Starting with macOS 11 (Significant Sur), Microsoft Defender for Endpoint has been fully migrated from kernel extension to system extensions. 

## Resources

- For more information about logging, uninstalling, or other articles, see [Resources for Microsoft Defender for Endpoint on Mac](mac-resources.md).
- [Privacy for Microsoft Defender for Endpoint on Mac](mac-privacy.md).
- [Turn on Network protection for macOS](network-protection-macos.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
