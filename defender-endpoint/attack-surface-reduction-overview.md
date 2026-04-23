---
title: Attack surface reduction overview in Microsoft Defender for Endpoint
description: Reduce your organization's attack surface with Microsoft Defender for Endpoint capabilities, including ASR rules, exploit protection, network protection, and controlled folder access.
author: chrisda
ms.author: chrisda
ms.service: defender-endpoint
ms.subservice: asr
ms.topic: concept-article
ms.collection:
  - m365-security
  - tier2
  - mde-asr
ms.custom: msecd-doc-authoring-1012
ms.date: 04/17/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

#customer intent: As a security administrator, I want to understand the attack surface reduction capabilities in Microsoft Defender for Endpoint so that I can determine which features to enable to protect my organization.

---

# Attack surface reduction capabilities in Microsoft Defender for Endpoint

Attack surface reduction is a set of capabilities in Microsoft Defender for Endpoint that eliminate risky or unnecessary behaviors on devices and networks, reducing the opportunities that attackers have to compromise your organization. Attack surfaces are all the places where your organization is vulnerable to cyberthreats. By hardening these surfaces, you can prevent attacks from happening in the first place.

These capabilities block risky software behaviors, prevent connections to malicious sites, and protect data from unauthorized access or exfiltration. Together, they form a layered defense that complements the detection and response features in Defender for Endpoint.

## Attack surface reduction capabilities

Attack surface reduction in Defender for Endpoint includes the following capabilities:

- **Attack surface reduction (ASR) rules in Windows** constrain risky software behaviors that attackers exploit, such as launching executables that attempt to download files, running obfuscated scripts, or performing actions that apps don't normally initiate during day-to-day work. For more information, see [Attack surface reduction rules overview](attack-surface-reduction-rules-overview.md).

- **Controlled folder access in Windows** protects valuable data from malicious apps and threats like ransomware. It checks apps against a list of known, trusted apps and prevents untrusted apps from modifying files in protected folders. For more information, see [Protect important folders with controlled folder access](controlled-folders.md).

- **Exploit protection in Windows** applies exploit mitigation techniques to operating system processes and apps automatically. It builds on the protections that were available in the Enhanced Mitigation Experience Toolkit (EMET) and integrates with Defender for Endpoint for reporting and alerting. For more information, see [Protect devices from exploits](exploit-protection.md).

- **Network protection** prevents connections to malicious or suspicious domains and IP addresses. It extends Microsoft Defender SmartScreen protection to block all outbound HTTP(S) traffic that attempts to connect to low-reputation sources. For more information, see [Network protection](network-protection.md).

- **Web protection** secures devices against web threats and helps regulate unwanted content. Web protection includes web threat protection, web content filtering, and custom indicators. For more information, see [Web protection](web-protection-overview.md).

- **Web content filtering** tracks and regulates access to websites based on their content categories, allowing you to block categories that violate compliance regulations or organizational policies. For more information, see [Web content filtering](web-content-filtering.md).

- **Device control** determines whether users can install and use peripheral devices like USB drives, printers, and Bluetooth devices on their computers. Device control helps prevent data loss and malware from removable media. For more information, see [Device control in Microsoft Defender for Endpoint](device-control-overview.md).

- **Network firewall reporting** integrates with Windows Firewall to provide centralized visibility into firewall events in the Microsoft Defender portal. For more information, see [Host firewall reporting](host-firewall-reporting.md).

The availability of these features is summarized in the following table:

|Feature|Windows│macOS│Linux│
|---|:---:|:---:|:---:|
│ASR rules|Y|N|N|
│Controlled folder access|Y|N|N|
│Exploit protection│Y|N|N|
│Network protection│Y|Y|Y<sup>\*</sup>|
│Web protection│Y|Y|Y<sup>\*</sup>|
|Web content filtering│Y|Y|Y|
│Device control│Y|Y|N|
│Firewall reporting│Y|N|N|

<sup>\*</sup> Currently in Preview.

### Related Windows security features

The following Windows security features complement attack surface reduction in Defender for Endpoint, but are configured and managed separately:

- **Microsoft Defender Application Guard** provides hardware-based isolation for Microsoft Edge, opening untrusted sites in a container to protect your organization. For more information, see [Microsoft Defender Application Guard overview](/windows/security/threat-protection/microsoft-defender-application-guard/md-app-guard-overview).
- **Windows Defender Application Control (WDAC)** ensures that only trusted applications run on your devices. For more information, see [Application control for Windows](/windows/security/threat-protection/windows-defender-application-control/windows-defender-application-control).
- **Windows Firewall** controls inbound and outbound network traffic on devices. For more information, see [Windows Firewall with advanced security](/windows/security/threat-protection/windows-firewall/windows-firewall-with-advanced-security).

## How attack surface reduction fits into Defender for Endpoint

Attack surface reduction complements other Defender for Endpoint capabilities that detect and respond to threats after they occur. While next-generation protection and endpoint detection and response focus on identifying and remediating active threats, attack surface reduction prevents threats from gaining a foothold.

Each capability addresses a different part of the attack surface:

- **Risky software behavior**: ASR rules limit how applications and scripts can behave, blocking common techniques that attackers use to deliver malware or steal credentials.
- **Network connections**: Network protection and web protection block access to known malicious or inappropriate sites before content reaches the device.
- **Data and file access**: Controlled folder access and device control limit which applications and hardware can access or modify sensitive files.
- **Application vulnerabilities**: Exploit protection applies mitigations that make it harder for attackers to exploit vulnerabilities in operating system processes and applications.

## Audit mode

Audit mode helps you evaluate the impact of attack surface reduction features on your environment without affecting productivity. The following capabilities support audit mode:

- [ASR rules](attack-surface-reduction-rules-deployment-test.md#step-1-test-attack-surface-reduction-rules-using-audit)
- [Controlled folder access](enable-controlled-folders.md).
- [Exploit protection](defender-endpoint/enable-exploit-protection.md)
- [Network protection](enable-network-protection.md)

In audit mode, the features don't block apps, scripts, or connections. Instead, the Windows Event Log records events as if the features were active. You can review event logs and use advanced hunting in the Microsoft Defender portal to understand how each feature would affect your line-of-business applications. For more information about the data in Windows Event Viewer, see [View attack surface reduction events in Windows Event Viewer](attack-surface-reduction-windows-events.md).

You can also use advanced hunting in the Microsoft Defender portal to understand how each feature would affect your line-of-business applications.

## Management tools

You can configure attack surface reduction capabilities by using several management tools. The following tools are commonly used:

- Microsoft Intune
- Microsoft Configuration Manager
- Group Policy
- PowerShell cmdlets

The right tool depends on your organization's infrastructure and management preferences. For detailed configuration guidance, see the individual feature articles linked in the [Attack surface reduction capabilities](#attack-surface-reduction-capabilities) section.

## Related content

- [Attack surface reduction rules overview](attack-surface-reduction-rules-overview.md)
- [Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md)
- [Attack surface reduction events in Windows Event Viewer](attack-surface-reduction-windows-events.md)
- [Protect important folders with controlled folder access](controlled-folders.md)
- [Protect devices from exploits](exploit-protection.md)
- [Network protection](network-protection.md)
- [Web protection](web-protection-overview.md)
- [Device control in Microsoft Defender for Endpoint](device-control-overview.md)
