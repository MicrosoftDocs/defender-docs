---
title: Microsoft Defender for Endpoint on macOS overview
ms.reviewer: joshbregman
description: An introducttion and overview of Microsoft Defender for Endpoint on macOS.
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
ms.date: 04/25/2025
---

# Microsoft Defender for Endpoint on macOS

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article provides an overview of Microsoft Defender for Endpoint on macOS, including its capabilities and features. It also includes links to additional resources for more information.

**Applies to:**
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Endpoint Plan 1 and Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)
- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

## What is Microsoft Defender for Endpoint on macOS?

Microsoft Defender for Endpoint on macOS is a unified endpoint security solution that provides advanced threat protection, detection, and response capabilities for macOS devices. It helps organizations protect their endpoints from a wide range of threats, including malware, ransomware, and other advanced persistent threats (APTs).

The following table describes capabilities in Defender for Endpoint on macOS:

|Capability|Description|
|---|---|
|Device Control| Control access to removable storage devices and peripherals. |
|Network Protection| Protect against web-based threats by blocking access to malicious websites and content. |
|Next-generation protection| Use machine learning and behavioral analysis to detect and block advanced threats. |
|Tamper Protection| Prevent unauthorized changes to security settings and configurations. |
|Web Protection| Protect against web-based threats by blocking access to malicious websites and content. |
|Advanced Hunting| Use advanced queries to search for and investigate potential threats across your environment. |
|Custom file indicators| Create custom indicators to detect specific files or file types. |
|Custom network indicators| Create custom indicators to detect specific network traffic patterns. |
|Passive Mode| Run Defender for Endpoint in passive mode to allow coexistence with other endpoint protection solutions. |
|Sense detection sensor| Collect and analyze telemetry data from endpoints to detect and respond to threats. |
|Vulnerability management| Identify and manage vulnerabilities across your environment. |
|Device response capabilities| Collect investigation packages, run antivirus scans, and isolate devices to respond to threats. |
|Device isolation| Isolate devices from the network to prevent the spread of threats. |
|Live response| Perform live response actions on devices to investigate and remediate threats. |

> [!CAUTION]
> Running other non-Microsoft endpoint protection products alongside Microsoft Defender for Endpoint on macOS is likely to lead to performance problems and unpredictable side effects. If non-Microsoft endpoint protection is an absolute requirement in your environment, you can still safely take advantage of Defender for Endpoint on macOS EDR functionality after configuring the antivirus functionality to run in [Passive mode](mac-preferences.md#enforcement-level-for-antivirus-engine).

## Resources

- For more information about logging, uninstalling, or other articles, see [Resources for Microsoft Defender for Endpoint on macOS](mac-resources.md).
- [Privacy for Microsoft Defender for Endpoint on macOS](mac-privacy.md).
- [Turn on Network protection for macOS](network-protection-macos.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
