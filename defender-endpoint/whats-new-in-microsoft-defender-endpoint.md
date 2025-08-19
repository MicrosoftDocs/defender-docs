---
title: What's new in Microsoft Defender for Endpoint
description: Learn about the latest Microsoft Defender for Endpoint preview and generally available (GA) features, and security features in Windows 10 and Windows Server.
search.appverid: met150
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.reviewer: noamhadash, pahuijbr, yongrhee
ms.localizationpriority: medium
ms.date: 08/19/2025
manager: orspodek
audience: ITPro
ms.collection:
- m365-security
- tier1
ms.topic: whats-new
---

# What's new in Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

The following features are in preview or generally available (GA) in the latest release of Microsoft Defender for Endpoint. Learn more about [preview features](/defender-xdr/preview).

See [what's new in Microsoft Defender for Endpoint on other operating systems and services](#whats-new-in-defender-for-endpoint-on-other-operating-systems-and-services).

## July 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Microsoft Defender Core service](/defender-endpoint/microsoft-defender-core-service-overview)     |GA         |- Microsoft Defender Core service, now in GA, helps with the stability and performance of Microsoft Defender Antivirus.<br>- Support for Azure Stack HCI OS is rolling out across commercial and government clouds.|

## April 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Contain IP addresses of undiscovered devices](respond-machine-alerts.md#contain-ip-addresses-of-undiscovered-devices) |Preview     |Containing an IP address prevents attackers from spreading attacks to other non-compromised devices. |
|Attack Surface Reduction (ASR) Rules |GA         |Two new ASR rules are now generally available:<br>  - [Block rebooting machine in Safe Mode](/defender-endpoint/attack-surface-reduction-rules-reference): Prevents the execution of commands to restart machines in Safe Mode.<br>  - [Block use of copied or impersonated system tools](/defender-endpoint/attack-surface-reduction-rules-reference): Blocks the use of executable files that are identified as copies of Windows system tools. These files are either duplicates or impostors of the original system tools. |
|ARM64-based Linux server support |GA  |- ARM64-based Linux servers are now supported across various Linux distributions, including Ubuntu, RHEL, Debian, SUSE Linux, Amazon Linux, and Oracle Linux.<br>- All product capabilities that are supported on AMD64 devices are now supported on ARM64-based Linux servers. <br><br>For more information, see:<br>  - [Tech Community Blog: Defender for Endpoint extends support to ARM-based Linux servers](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/defender-for-endpoint-extends-support-to-arm-based-linux-servers/4364066)<br>  - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md) |

## February 2025

- (GA) **Aggregated reporting in Microsoft Defender for Endpoint** is now generally available. For more information, see [Aggregated reporting in Microsoft Defender for Endpoint](aggregated-reporting.md).

## January 2025

- (Preview) **Aggregated reporting in Microsoft Defender for Endpoint**: Aggregated reporting extends signal reporting intervals to significantly reduce the size of reported events while preserving essential event properties. This feature is available for Microsoft Defender for Endpoint Plan 2. For more information, see [Aggregated reporting in Microsoft Defender for Endpoint](aggregated-reporting.md).

## November-December 2024

- [Five new demonstration scenarios](defender-endpoint-demonstrations.md) were added:
   - [AMSI demos](mde-demonstration-amsi.md)
   - [Cloud protection demo](/defender-endpoint/defender-endpoint-demonstration-cloud-delivered-protection)
   - [Controlled folder access (block ransomware) demo](/defender-endpoint/defender-endpoint-demonstration-controlled-folder-access)
   - [Endpoint detection and response (EDR) detection test](/defender-endpoint/edr-detection)
   - [URL reputation (SmartScreen) demo](/defender-endpoint/defender-endpoint-demonstration-smartscreen-url-reputation)

## August 2024

- **Network Protection feature is enabled by default** in Microsoft Defender for Endpoint on Android. As a result, users are able to see a network protection card in the Defender for Endpoint app, along with App Protection and Web Protection. Users are also required to provide location permission to complete the setup process. Admins can change the default value for network protection if they decide not to use it via the Intune App Configuration policies. This feature was already enabled by default earlier on Microsoft Defender for Endpoint on iOS. For more information, see [network protection](/defender-endpoint/android-configure#network-protection).

## What's new in Defender for Endpoint on other operating systems and services

|Platform/service  |Link  |
|------------------|------|
|Windows           |[What's new in Defender for Endpoint on Windows](windows-whatsnew.md)|
|macOS             |[What's new in Defender for Endpoint on macOS](mac-whatsnew.md)|
|Linux             |[What's new in Defender for Endpoint on Linux](linux-whatsnew.md)|
|Android           |[What's new in Defender for Endpoint on Android](android-whatsnew.md)|
|iOS               |[What's new in Defender for Endpoint on iOS](ios-whatsnew.md)|
|Microsoft Defender XDR |[What's new in Microsoft Defender XDR](/defender-xdr/whats-new)|
|Microsoft Defender for Office 365 |[What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)|
|Microsoft Defender for Identity |[What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)|
|Microsoft Defender for Cloud Apps |[What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)|
|Microsoft Defender Vulnerability Management |[What's new in Microsoft Defender Vulnerability Management](/defender-vulnerability-management/whats-new-in-microsoft-defender-vulnerability-management)|