---
title: Minimum requirements for Microsoft Defender for Endpoint
description: Understand licensing and other requirements for onboarding devices to Defender for Endpoint
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.reviewer: pahuijbr
ms.localizationpriority: medium
ms.date: 06/10/2025
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: install-set-up-deploy
ms.subservice: onboard
search.appverid: met150
---

# Minimum requirements for Microsoft Defender for Endpoint

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

There are some minimum requirements for onboarding devices to Defender for Endpoint. This article describes licensing, hardware and software requirements, and other configuration settings needed to onboard devices.

> [!TIP]
> - For information about the latest enhancements in Defender for Endpoint, see [Defender for Endpoint Tech Community](https://techcommunity.microsoft.com/t5/Windows-Defender-Advanced-Threat/ct-p/WindowsDefenderAdvanced).
> - For information about how Defender for Endpoint demonstrates industry-leading optics and detection capabilities, see [Insights from the MITRE ATT&CK-based evaluation](https://cloudblogs.microsoft.com/microsoftsecure/2018/12/03/insights-from-the-mitre-attack-based-evaluation-of-windows-defender-atp/).
> - If you're looking for endpoint protection for small and medium-sized businesses, see [Microsoft Defender for Business](/defender-business/mdb-overview) and [Defender for Business requirements](/defender-business/mdb-requirements).

## Licensing requirements

- [Defender for Endpoint Plan 1 and Plan 2](microsoft-defender-endpoint.md) (standalone or as part of other Microsoft 365 plans)

- [Microsoft Defender for Business](/defender-business/mdb-overview) (for small and medium-sized businesses)

- To [onboard servers](onboard-windows-server.md) to Defender for Endpoint, server licenses are required. You can choose from:   

   - Microsoft Defender for Servers Plan 1 or Plan 2 (as part of the [Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction)) offering
   - Microsoft Defender for Endpoint Server
   - [Microsoft Defender for Business servers](/defender-business/get-defender-business) (for small and medium-sized businesses only)
 
For more detailed information about licensing requirements for Microsoft Defender for Endpoint, see [Microsoft Defender for Endpoint licensing information](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint).

For detailed licensing information, see the [Product Terms site](https://www.microsoft.com/licensing/terms/) and work with your account team to learn more about the terms and conditions.

## Browser requirements

Access Microsoft Defender for Endpoint and other [Microsoft Defender XDR](/defender-xdr/) experiences in the Microsoft Defender portal using Microsoft Edge, Internet Explorer 11, or any HTML 5 compliant web browser.

## Hardware and software requirements

Devices on your network must be running one of the operating systems listed in this article. New features or capabilities are typically provided only on vendor-supported operating systems. For more information, see [Supported Microsoft Defender for Endpoint capabilities by platform](supported-capabilities-by-platform.md). Microsoft recommends installing the latest available security patches for any operating system.

### Windows versions supported by Defender for Endpoint

> [!IMPORTANT]
> You may continue to use Microsoft Windows after OS support ends; however, it will no longer receive quality updates, new or updated features, or security updates for the operating system itself. However, devices protected by Microsoft Defender for Endpoint will continue to receive regular product updates through existing channels, keeping detection and protection capabilities current. 

- Windows 10 and 11 Enterprise, IoT Enterprise, Education, Pro, Pro Education including [Windows on Arm](/windows/arm/overview)

- [Windows Enterprise LTSC 2016 (and later)](/windows/whats-new/ltsc/)

- [Windows Enterprise multi-session](/azure/virtual-desktop/windows-multisession-faq)

- Windows Server
  - Windows Server 2012 R2
  - Windows Server 2016
  - Windows Server Semi-Annual Channel, version 1803 and above
    
  - Windows Server 2019 and later (including Core installation type)
    
- [Windows 365](/windows-365/) Cloud PCs and supported [Azure (Windows) Virtual Desktop](/azure/virtual-desktop/) machines running one of the previously listed operating systems/versions

- [Azure Local](/azure/azure-local) Nodes running Azure Stack HCI OS, version 23H2 and above

The following Windows operating systems work with Defender for Endpoint, provided you're using the [Log Analytics](/azure/azure-monitor/agents/log-analytics-agent) / [Microsoft Monitoring Agent](update-agent-mma-windows.md) (MMA):

- Windows 7 SP1 Pro, Enterprise

- Windows 8.1 Pro, Enterprise

- Windows Server 2008 R2 SP1

> [!NOTE]
> To avoid service interruptions, make sure to [stay up to date with the Microsoft Monitoring Agent](update-agent-mma-windows.md) (MMA, also known as the Log Analytics or Azure Monitor agent). 

To add anti-malware protection to these older operating systems, you can use [System Center Endpoint Protection](onboard-downlevel.md#configure-and-update-system-center-endpoint-protection-clients). 

### Other operating systems supported by Defender for Endpoint

- [Mac](microsoft-defender-endpoint-mac.md) (client devices)
- [Linux](microsoft-defender-endpoint-linux.md)
- [Windows Subsystem for Linux](mde-plugin-wsl.md)
- [Android](microsoft-defender-endpoint-android.md)
- [iOS](microsoft-defender-endpoint-ios.md)

> [!NOTE]
- Make sure to confirm that the Linux distributions and versions of Android, iOS, and macOS are compatible with Defender for Endpoint.
- Although Windows 10 IoT Enterprise is a supported OS in Microsoft Defender for Endpoint and enables OEMs/ODMs to distribute it as part of their product or solution, customers should follow the OEM/ODM's guidance around host-based installed software and supportability. 
- Endpoints running mobile versions of Windows (such as Windows CE and Windows 10 Mobile) aren't supported.
- Virtual Machines running Windows 10 Enterprise 2016 LTSB can encounter performance issues when used on non-Microsoft virtualization platforms.
- For virtual environments, we recommend using Windows 10 Enterprise LTSC 2019 or later.
- [Defender for Endpoint Plan 1 and Plan 2](microsoft-defender-endpoint.md) don't include server licenses. To onboard servers to those plans, you need another license, such as Microsoft Defender for Servers Plan 1 or Plan 2 (as part of the [Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction) offering). To learn more. see [Defender for Endpoint onboarding Windows Server](onboard-windows-server.md).
- If your organization is a small or medium-sized business, see [Microsoft Defender for Business requirements](/defender-business/mdb-requirements).
> - Windows 11 24H2 Home devices that have been upgraded to a supported edition might require you to run the following command before onboarding: `DISM /online /Add-Capability /CapabilityName:Microsoft.Windows.Sense.Client~~~~`
> For more information about edition upgrades and features, see ([Windows features](/windows-hardware/manufacture/desktop/windows-features?view=windows-11&preserve-view=true))
> 
### Hardware requirements

The minimum hardware requirements for Defender for Endpoint on Windows devices are the same as the requirements for the operating system itself (that is, they aren't in addition to the requirements for the operating system).

- Cores: 2 minimum, 4 preferred

- Memory: 1GB minimum, 4 GB preferred

### Network and data storage and configuration requirements

When you run the onboarding wizard for the first time, you must choose where your Microsoft Defender for Endpoint-related information is stored: in the European Union, the United Kingdom, or the United States datacenter.

> [!NOTE]
> - You can't change your data storage location after the first-time setup.
> - Review the [Microsoft Defender for Endpoint data storage and privacy](data-storage-privacy.md) for more information on where and how Microsoft stores your data.

#### IP stack

Internet Protocol Version 4 (IPv4) stack must be enabled on devices for communication to the Defender for Endpoint cloud service to work as expected.

Alternatively, if you must use an Internet Protocol Version 6 (IPv6) only configuration, consider adding dynamic IPv6/IPv4 transitional mechanisms, such as DNS64/NAT64 to ensure end-to-end IPv6 connectivity to Microsoft 365 without any other network reconfiguration.

#### Internet connectivity

Internet connectivity on devices is required either directly or through a proxy.

For more information on other proxy configuration settings, see [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md).

## Microsoft Defender Antivirus configuration requirement

The Defender for Endpoint agent depends on Microsoft Defender Antivirus to scan files and provide information about them.

Configure Security intelligence updates on the Defender for Endpoint devices whether Microsoft Defender Antivirus is the active anti-malware solution or not. For more information, see [Manage Microsoft Defender Antivirus updates and apply baselines](/windows/security/threat-protection/microsoft-defender-antivirus/manage-updates-baselines-microsoft-defender-antivirus).

When Microsoft Defender Antivirus isn't the active anti-malware in your organization and you use the Defender for Endpoint service, Microsoft Defender Antivirus goes into passive mode.

If your organization turns off Microsoft Defender Antivirus through Group Policy or other methods, devices that are onboarded must be excluded from the Group Policy.

If you're onboarding servers and Microsoft Defender Antivirus isn't the active anti-malware on your servers, configure Microsoft Defender Antivirus to run in passive mode or uninstall it. The configuration is dependent on the server version. For more information, see [Microsoft Defender Antivirus compatibility](microsoft-defender-antivirus-compatibility.md).

> [!NOTE]
> Your regular Group Policy doesn't apply to tamper protection, and changes to Microsoft Defender Antivirus settings are ignored when tamper protection is on. See [What happens when tamper protection is turned on](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on)?

## Microsoft Defender Antivirus Early Launch Antimalware (ELAM) driver is enabled

If you're running Microsoft Defender Antivirus as the primary anti-malware product on your devices, the Defender for Endpoint agent successfully onboards.

If you're running a non-Microsoft anti-malware client and use Mobile Device Management solutions or Microsoft Configuration Manager (current branch), you need to ensure the Microsoft Defender Antivirus ELAM driver is enabled. For more information, see [Ensure that Microsoft Defender Antivirus isn't disabled by policy](troubleshoot-onboarding.md#ensure-that-microsoft-defender-antivirus-is-not-disabled-by-a-policy).

## Related articles

- [Set up Microsoft Defender for Endpoint deployment](production-deployment.md)

- [Onboard devices](onboard-configure.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
