---
title: Mobile threat defense capabilities in Microsoft Defender for Business
description: Get an overview of mobile threat defense in Defender for Business. Learn what mobile threat defense includes and how to onboard devices.
author: chrisda
ms.author: chrisda
ms.date: 09/25/2025
ms.topic: article
ms.service: defender-business
ms.localizationpriority: medium
ms.collection:
- SMB
- m365-security
- m365-initiative-defender-business
- tier1
ms.reviewer: nehabha
search.appverid: MET150
f1.keywords: NOCSH
audience: Admin
---

# Mobile threat defense capabilities in Microsoft Defender for Business

Microsoft Defender for Business provides advanced threat protection capabilities for devices, such as Windows and Mac clients. Defender for Business also includes mobile threat defense. Mobile threat defense capabilities help protect Android and iOS devices, without requiring you to use Microsoft Intune to onboard mobile devices.

In addition, mobile threat defense capabilities integrate with [Microsoft 365 Lighthouse](/microsoft-365/lighthouse/m365-lighthouse-overview), where Cloud Solution Providers (CSPs) can view information about vulnerable devices and help mitigate detected threats.

## What does mobile threat defense include?

The following table summarizes the capabilities that are included in mobile threat defense in Defender for Business:

|Capability|Android|iOS|
|---|---|---|
|**Web Protection** <br/> Anti-phishing, blocking unsafe network connections, and support for custom indicators. <br/> Web protection is turned on by default with [web content filtering](mdb-web-content-filtering.md).|:::image type="icon" source="media/feature-present-icon.png" border="false":::|:::image type="icon" source="media/feature-present-icon.png" border="false":::|
|**Malware protection** <br/> Scanning for malicious apps (system apps included).|:::image type="icon" source="media/feature-present-icon.png" border="false":::|:::image type="icon" source="media/feature-absent-icon.png" border="false":::|
|**Jailbreak detection** <br/> Detection of jailbroken devices.|:::image type="icon" source="media/feature-absent-icon.png" border="false":::|:::image type="icon" source="media/feature-present-icon.png" border="false":::|
|**Microsoft Defender Vulnerability Management**<br/>Vulnerability assessment of onboarded mobile devices. Includes vulnerability assessments for operating systems and apps for Android and iOS. <br/> For more information, see [Use your vulnerability management dashboard in Microsoft Defender for Business](mdb-view-tvm-dashboard.md).|:::image type="icon" source="media/feature-present-icon.png" border="false":::|:::image type="icon" source="media/feature-present-icon.png" border="false":::¹|
|**Network Protection** <br/> Protection against rogue Wi-Fi related threats and rogue certificates. <br/> Network protection is turned on by default with [next-generation protection](mdb-next-generation-protection.md). <br/> As part of mobile threat defense, network protection also includes the ability to allow root certification authority and private root certification authority certificates in Intune. It also establishes trust with endpoints.|:::image type="icon" source="media/feature-present-icon.png" border="false":::²|:::image type="icon" source="media/feature-present-icon.png" border="false":::²|
|**Unified alerting** <br/> Alerts from all platforms are listed in the unified Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)). In the navigation pane, choose **Incidents**). <br/> For more information, see [View and manage incidents in Microsoft Defender for Business](mdb-view-manage-incidents.md)|:::image type="icon" source="media/feature-present-icon.png" border="false":::|:::image type="icon" source="media/feature-present-icon.png" border="false":::|
|**Conditional Access** and **conditional launch** <br/> [Conditional Access](/intune/intune-service/protect/conditional-access) and [conditional launch](/intune/intune-service/apps/app-protection-policies-access-actions) block risky devices from accessing corporate resources. <ul><li>Conditional Access policies require certain criteria to be met before a user can access company data on their mobile device.</li><li>Conditional launch policies enable your security team to block access or wipe devices that don't meet certain criteria.</li><li>Defender for Business risk signals can also be added to app protection policies.</li></ul>|:::image type="icon" source="media/feature-absent-icon.png" border="false":::³|:::image type="icon" source="media/feature-absent-icon.png" border="false":::³|
|**Privacy controls** <br/> Configure privacy in threat reports by controlling the data sent by Defender for Business. Privacy controls are available for admin and end users, and for both enrolled and unenrolled devices.|:::image type="icon" source="media/feature-absent-icon.png" border="false":::³|:::image type="icon" source="media/feature-absent-icon.png" border="false":::³|
|**Integration with Microsoft Tunnel** <br/> Integration with [Microsoft Tunnel](/intune/intune-service/protect/microsoft-tunnel-overview), a VPN gateway solution for Microsoft Intune.|:::image type="icon" source="media/feature-absent-icon.png" border="false":::⁴|:::image type="icon" source="media/feature-absent-icon.png" border="false":::⁴|

- ¹ Operating system vulnerabilities are included. Software/app vulnerabilities require Microsoft Intune.
- ² You can manage an allowlist of root certification authority certificates and private root certification authority certificates in Microsoft Intune.
- ³ Requires Microsoft Intune.
- ⁴ Requires Microsoft Intune. For more information, see [Prerequisites for the Microsoft Tunnel in Intune](/intune/intune-service/protect/microsoft-tunnel-prerequisites).

## How to get mobile threat defense capabilities

Mobile threat defense capabilities are now generally available to [Defender for Business](get-defender-business.md) customers. Here's how to get these capabilities for your organization:

1. Make sure that Defender for Business finished provisioning. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Assets** \> **Devices**.
   - The message, "Hang on! We're preparing new spaces for your data and connecting them" means Defender for Business isn't finished provisioning. The process can take up to 24 hours to complete.
   - If you see a list of devices, or you're prompted to onboard devices, it means Defender for Business provisioning is complete.

2. Review, and if necessary, edit your [next-generation protection policies](mdb-next-generation-protection.md).

3. Review, and if necessary, edit your [firewall policies and custom rules](mdb-firewall.md).

4. Review, and if necessary, edit your [web content filtering](mdb-web-content-filtering.md) policy.

5. To onboard mobile devices, see the "Use the Microsoft Defender app" procedures in [Onboard devices to Microsoft Defender for Business](mdb-onboard-devices.md).

## See also

- [Set up and configure Microsoft Defender for Business](mdb-setup-configuration.md)
- [View and edit security policies and settings in Microsoft Defender for Business](mdb-configure-security-settings.md)
- [What's new in Microsoft 365 Business Premium and Microsoft Defender for Business](/microsoft-365/business-premium/m365bp-mdb-whats-new)
