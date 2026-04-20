---
title: Microsoft Defender for Endpoint on macOS Prerequisites
ms.reviewer: joshbregman
description: Learn how to install, and configure Microsoft Defender for Endpoint on macOS.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: article
ms.subservice: macos
ms.date: 06/19/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals
---

# Microsoft Defender for Endpoint on macOS prerequisites

This article lists the prerequisites for installing and configuring Microsoft Defender for Endpoint on macOS. It also includes links to additional resources for more information.

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

## Prerequisites, installation, and configuration instructions

### Prerequisites

- A [Defender for Endpoint subscription](microsoft-defender-endpoint-mac-prerequisites.md#licensing-requirements) and access to the Microsoft Defender portal
- Beginner-level experience in macOS and BASH scripting
- For [manual deployments](#manual-deployment-requirements), administrative privileges on the device
- For [enterprise deployments](#enterprise-deployment-requirements), a Mobile Device Management (MDM) solution such as Microsoft Intune
- [Network connectivity](#network-connectivity) to the Microsoft Defender for Endpoint service.

### System requirements

These three most recent major releases of macOS are supported:

- 26 (Tahoe)
- 15.0.1 (Sequoia)
- 14 (Sonoma)

> [!NOTE]
> Beta versions of macOS aren't supported, but new releases of macOS are supported from day 1.

- Supported processors: x64 and ARM64
- Disk space: 1 GB

> [!CAUTION]
> We recommend that you keep [System Integrity Protection](https://support.apple.com/HT204899) (SIP) enabled on client devices. SIP is a built-in macOS security feature that prevents low-level tampering with the OS, and is enabled by default.

### System extensions

Microsoft Defender for Endpoint on macOS uses two system extensions:

|Extension  |Function  |
|---------|---------|
|Endpoint Security Extension (com.microsoft.wdav.epsext)     |Real-time protection—monitors file, process, and system events |
|Network Extension (com.microsoft.wdav.netext)     |Network content inspection—enables Network Protection, Web Content Filtering, and custom indicators |

Starting with macOS Big Sur (11), system extensions require explicit approval before they can run. During manual installation, macOS prompts you to approve the extensions in **System Settings > Privacy & Security**. For enterprise deployments, you can preapprove these extensions using MDM configuration profiles.

For installation instructions, see your deployment method:

[Microsoft Intune](mac-install-with-intune.md)
[JAMF Pro](mac-install-with-jamf.md)
[Other MDM solutions](mac-install-with-other-mdm.md)
[Manual deployment](mac-install-manually.md#application-installation-macos-13-and-newer-versions)

For troubleshooting, see [Troubleshoot system extension issues](mac-support-sys-ext.md).

### Enterprise deployment requirements

There are several methods and deployment tools that you can use to centrally install and configure Defender for Endpoint on macOS across your devices:

- [Microsoft Intune-based deployment](mac-install-with-intune.md)
- <a href="/intune/intune-service/protect/mde-security-integration" target="_blank" rel="noopener noreferrer">Security Settings Management</a>
- Non-Microsoft management tools:

  [Other Mobile Device Management products (including JAMF)](mac-install-with-other-mdm.md)

### Manual deployment requirements

You can also configure Defender for Endpoint on macOS locally

- Command-line tool: [Manual deployment](mac-install-manually.md)

### Licensing requirements

Microsoft Defender for Endpoint on macOS requires one of the following Microsoft Volume Licensing offers:

- Microsoft 365 E5
- Microsoft Defender Suite
- Microsoft 365 A5
- Windows 10 Enterprise E5
- Microsoft 365 Business Premium
- Windows 11 Enterprise E5
- Microsoft Defender for Endpoint P2 (included in Microsoft 365 E5 and E5 Security)
- Microsoft Defender for Endpoint P1 (included in [Microsoft 365 E3](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/microsoft-defender-for-endpoint-plan-1-now-included-in-m365-e3/ba-p/3060639))

> [!NOTE]
> Licensed users can use Microsoft Defender for Endpoint on up to five concurrent devices.
> Microsoft Defender for Endpoint is also available for purchase from a Cloud Solution Provider (CSP). When purchased via a CSP, it doesn't require Microsoft Volume Licensing offers listed.

### Network connectivity

Ensure that your devices can connect to Microsoft Defender for Endpoint cloud services. To prepare your environment, see [STEP 1: Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md).

Microsoft Defender for Endpoint can connect through a proxy server by using the following methods:

- Proxy autoconfig (PAC)
- Web Proxy Autodiscovery Protocol (WPAD)
- Manual static proxy configuration

If a proxy or firewall is blocking anonymous traffic, make sure that anonymous traffic is permitted in the previously listed URLs.

> [!WARNING]
> Authenticated proxies aren't supported. Ensure that only PAC, WPAD, or a static proxy is being used.
> For security reasons, SSL inspection and intercepting proxies aren't supported. Configure an exception for SSL inspection and your proxy server to directly pass through data from Microsoft Defender for Endpoint on macOS to the relevant URLs without interception. Adding your interception certificate to the global store doesn't allow for interception.

## Next steps

### Onboard client devices to Microsoft Defender for Endpoint

To onboard Microsoft Defender for Endpoint for macOS, complete the following steps:

- First, ensure that the device meets the [system requirements](#system-requirements) and [network connectivity](#network-connectivity) requirements.
- Next, install the .pkg file containing the software.
- Next, install the required system extensions.
- Finally, onboard the device to Microsoft Defender for Endpoint.

For more information, see [Onboard client devices running macOS to Microsoft Defender for Endpoint](onboard-client.md).

#### Test network connectivity

To test that a connection isn't blocked, open `https://x.cp.wd.microsoft.com/api/report` and `https://cdn.x.cp.wd.microsoft.com/ping` in a browser.

If you prefer the command line, you can also check the connection by running the following command in Terminal:

```bash
curl -w ' %{url_effective}\n' 'https://x.cp.wd.microsoft.com/api/report' 'https://cdn.x.cp.wd.microsoft.com/ping'
```

The output from this command should be similar to the following:

 `OK https://x.cp.wd.microsoft.com/api/report`

 `OK https://cdn.x.cp.wd.microsoft.com/ping`

After you install Microsoft Defender for Endpoint, you can validate connectivity by running the following command in Terminal:

```bash
mdatp connectivity test
```

## Related content

- For more information about logging, uninstalling, or other articles, see [Resources for Microsoft Defender for Endpoint on macOS](mac-resources.md).
- [Privacy for Microsoft Defender for Endpoint on macOS](mac-privacy.md).



