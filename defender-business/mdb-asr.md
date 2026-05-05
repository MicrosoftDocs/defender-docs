---
title: Attack surface reduction in Microsoft Defender for Business
description: Learn about attack surface reduction capabilities in Microsoft Defender for Business, including ASR rules, controlled folder access, and firewall protection.
author: chrisda
ms.author: chrisda
ms.date: 05/04/2026
ms.topic: concept
ms.service: defender-business
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier1
ms.reviewer: efratka
ms.custom: msecd-doc-authoring-1012
ai-usage: ai-assisted
#customer intent: As an admin, I want to understand the attack surface reduction capabilities in Defender for Business so that I can protect my organization's devices.
---

# Attack surface reduction in Microsoft Defender for Business

_Attack surfaces_ are all the places and ways the network and devices in your organization are vulnerable to attacks. For example:

- Unsecured devices.
- Unrestricted access to URLs on company devices.
- Unrestricted running of apps or scripts on company devices.

To help protect your network and devices, Microsoft Defender for Business includes several attack surface reduction capabilities. These capabilities include _attack surface reduction (ASR) rules_ as described in the following table:

|Capability|Description|
|---|---|
|**[Attack surface reduction (ASR) rules](/defender-endpoint/attack-surface-reduction-rules-overview)**|Prevent specific actions commonly associated with malicious activity from running on Windows devices.|
|**[Controlled folder access](/defender-endpoint/controlled-folders)**|Allow only trusted apps to access protected folders on Windows devices. Think of this capability as ransomware mitigation.|
|**[Firewall protection](mdb-firewall.md)**|Determines which network traffic can flow to or from your organization's devices.|
|**[Network protection](/defender-endpoint/network-protection)**|Prevent users from accessing dangerous domains through applications on their Windows and Mac devices. Network protection is also a key component of [web content filtering](mdb-web-content-filtering.md).|
|**[Web protection](/defender-endpoint/web-protection-overview)**|Integrates with web browsers and works with network protection to protect against web threats and unwanted content. Web protection includes [web threat protection](/defender-endpoint/web-threat-protection), [web content filtering](/defender-endpoint/web-content-filtering), and [custom indicators](/defender-endpoint/indicators-overview).|

## Configure attack surface reduction features

- **Attack surface reduction (ASR) rules**: For more information, see [Deployment and configuration methods for ASR rules](/defender-endpoint/attack-surface-reduction-rules-overview#deployment-and-configuration-methods-for-asr-rules) and [ASR rules deployment guide](/defender-endpoint/attack-surface-reduction-rules-deployment).

  Microsoft 365 Business Premium includes Microsoft Intune Plan 1, which is the recommended method to configure and deploy ASR rules on devices. Standalone Defender for Business doesn't include Intune, so you need to use another configuration method (for example, Group Policy or PowerShell locally on devices).

- **Controlled folder access**: [Set up controlled folder access policy in Microsoft Defender for Business](mdb-controlled-folder-access.md).

- **Firewall protection**: Enabled by default when devices are onboarded to Defender for Business and [firewall policies in Defender for Business](mdb-firewall.md) are applied.

- **Network protection**: Enabled by default when devices are onboarded to Defender for Business and [next-generation protection policies](mdb-next-generation-protection.md) are applied. Default policies are configured with the recommended security settings.

- **Web protection**: [Set up web content filtering in Microsoft Defender for Business](mdb-web-content-filtering.md).

## Monitor attack surface reduction features

You can monitor how attack surface reduction features are working in your organization by using the following reports in the Microsoft Defender portal:

- **ASR rules**: [Attack surface reduction (ASR) rules report](/defender-endpoint/attack-surface-reduction-rules-report)
- **Controlled folder access**: [Review controlled folder access events in the Microsoft Defender portal](/defender-endpoint/controlled-folders#review-controlled-folder-access-events-in-the-microsoft-defender-portal)
- **Network and web protection**: [Web protection monitoring report](/defender-endpoint/web-protection-monitoring)
- **Firewall**: [Host firewall reporting](/defender-endpoint/host-firewall-reporting)

## Related content

- [Review settings for advanced features and the Microsoft Defender portal](mdb-portal-advanced-feature-settings.md)
- [Use your vulnerability management dashboard](mdb-view-tvm-dashboard.md)
- [View and manage incidents](mdb-view-manage-incidents.md)
- [View reports](mdb-reports.md)
