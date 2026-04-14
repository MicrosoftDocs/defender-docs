---
title: Device inventory field reference
description: Explore all columns, filters, and field values in the Microsoft Defender for Endpoint device inventory to understand your device data and take action.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: reference
search.appverid: met150
ms.date: 04/14/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Vulnerability Management

---

# Device inventory field reference

This article provides detailed descriptions of every column, filter, and field value available in the [device inventory](machines-view-overview.md). Use this reference to quickly look up what each field means, what values to expect, and what actions to take based on your device data.

## Device categories

The device inventory organizes devices into tabs based on their category. Each tab shows a specific type of device and displays different default columns.

| Tab | What it contains | Examples | How devices get classified |
|-----|-----------------|----------|---------------------------|
| **All devices** | Every device visible to Defender for Endpoint, across all categories | All of the following | Automatic; this tab aggregates all other tabs |
| **Computers & mobile** | Enterprise endpoints: workstations, servers, laptops, and mobile devices | Windows 10 laptops, Linux servers, iPhones, Android phones | Classified by operating system (Windows, macOS, Linux, iOS, Android) |
| **Network devices** | Routers, switches, firewalls, and other network infrastructure | Cisco routers, Juniper switches, Palo Alto firewalls | Discovered through [network device discovery](network-devices.md) scans using SNMP authentication |
| **IoT/OT devices** | Enterprise IoT devices and operational technology (OT) devices | Printers, IP cameras, HVAC controllers, PLCs, industrial control systems | Discovered by [Microsoft Defender for IoT](/defender-for-iot/microsoft-defender-iot) or classified by device fingerprinting |
| **Uncategorized devices** | Devices that Defender for Endpoint discovered but couldn't classify into a specific category | Unknown devices that responded to discovery probes but lack enough identifying information | Default when discovery can't determine the device type |

## Device counts and cards

At the top of each device inventory tab, summary counts show your device population at a glance.

| Count | Description | Available on tabs |
|-------|-------------|-------------------|
| **Total** | Total number of devices on the current tab. | All tabs |
| **Critical assets** | Number of devices classified as business critical through [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management). | All devices, Computers & mobile |
| **High risk** | Devices with a **High** risk level based on active alerts and threat signals. | All tabs |
| **High exposure** | Devices with a **High** exposure level based on unresolved security recommendations. | All tabs |
| **Not onboarded** | Devices that don't have the Defender for Endpoint agent installed. | All devices, Computers & mobile |
| **Newly discovered** | Devices first seen within the last 7 days. | All tabs except Computers & mobile |

Below the counts, the inventory might display special cards:

- **Classify critical assets**: Define device groups as business critical to prioritize protection. Configured through [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management).
- **Attack path warning**: Examine whether any assets are part of an attack path. Requires [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management).

## Columns reference

The following tables list all available columns, organized by tab. Columns marked with **Default** appear in the inventory view by default. You can add or remove columns using **Customize columns**.

### All devices tab

| Column | Default | Description | Example values |
|--------|---------|-------------|----------------|
| **Name** | Yes | The hostname or device name as reported by the device or discovered on the network. For discovered devices, this might be empty or show an IP-based name. | `DESKTOP-ABC123`, `server-prod-01` |
| **IP** | Yes | The most recently observed IP address of the device. A device can have multiple IPs over time; this shows the latest. | `10.0.1.50`, `192.168.1.100` |
| **MAC address** | No | The physical hardware address of the network interface. Used to uniquely identify devices when IP addresses change. | `00:1A:2B:3C:4D:5E` |
| **Criticality level** | Yes | The business criticality assigned to the device by your organization. Higher criticality means the device is more important to protect. Configured through [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management). | Very high, High, Medium, Low, None |
| **Device category** | Yes | The broad classification of the device. Determines which tab the device appears on. | Computers and Mobile, Network Device, IoT, OT, BMS, Medical, Unknown |
| **Device type** | Yes | A more specific classification within the device category. Particularly relevant for IoT/OT devices. | Workstation, Server, Printer, Camera, Router, PLC |
| **Domain** | Yes | The Active Directory domain the device is joined to. Empty for non-domain-joined or discovered-only devices. | `contoso.com`, `corp.fabrikam.com` |
| **Device AAD ID** | Yes | The Microsoft Entra ID (formerly Azure AD) object ID for the device. Empty for devices not registered with Microsoft Entra. | GUID format |
| **Risk level** | Yes | An assessment of how risky the device is based on active alerts, alert severity, and other threat intelligence signals. Use this to prioritize investigation. See [Risk level values](#risk-level-values). | High, Medium, Low, Informational, No known risks |
| **Exposure level** | Yes | How exposed the device is based on the number and severity of pending security recommendations. Use this to prioritize patching and configuration changes. See [Exposure level values](#exposure-level-values). | High, Medium, Low, No data available |
| **OS platform** | Yes | The operating system family running on the device. | Windows, macOS, Linux, iOS, Android |
| **OS version** | Yes | The specific version of the operating system. | `22H2 (Build 22621.1105)`, `14.2` |
| **Sensor health state** | Yes | The current health status of the Defender for Endpoint sensor on onboarded devices. Empty for discovered (non-onboarded) devices. See [Sensor health state values](#sensor-health-state-values). | Active, Inactive, No sensor data, Impaired communications, Misconfigured |
| **Onboarding status** | Yes | Whether the device has the Defender for Endpoint agent installed and reporting. This field is key to understanding how a device got into the inventory. See [Onboarding status values](#onboarding-status-values). | Onboarded, Can be onboarded, Unsupported, Insufficient info |
| **Discovery sources** | Yes | How the device was found and added to the inventory. Tells you the method or integration that detected the device. See [Discovery sources values](#discovery-sources-values). | MDE, Microsoft Defender for IoT, MDATP |
| **Last device update** | Yes | The timestamp of the most recent data update from the device. For onboarded devices, this updates frequently as telemetry arrives. For discovered devices, this updates when the device is re-observed. | `2/24/2026 3:45 PM` |
| **Tags** | Yes | Labels applied to the device for grouping and filtering. Tags can be set manually, through rules, or automatically by the system (for example, `internet-facing`). See [Create and manage device tags](machine-tags.md). | `Finance`, `Critical-Server`, `internet-facing` |
| **Device role** | Yes | The functional role of the device in your organization, determined by [predefined classification rules](/security-exposure-management/predefined-classification-rules-and-levels). | Domain Controller, DNS Server, Exchange Server |
| **Security operations** | Yes | The level of security operations access for the device. | Restricted, Full |
| **Managed by** | Yes | The management tool that controls the device. Helps you understand which team or system is responsible for the device. See [Managed by values](#managed-by-values). | Intune, ConfigMgr, MDE, Unknown |
| **Managed by status** | Yes | The compliance or management status as reported by the management tool. | Managed, Pending, Not managed |
| **Mitigation status** | Yes | Whether a response action (containment or isolation) is currently applied to the device. | Contained, Isolated, (empty if none) |
| **Cloud platforms** | Yes | Cloud environments where the device runs. Empty for on-premises devices. | Azure, AWS, GCP, Arc, None |
| **Device subtype** | No | A more granular classification within the device type. Especially useful for IoT/OT devices. | Video conference, Smart TV, VoIP phone |
| **Firmware version** | No | The firmware version running on the device. Primarily relevant for network and IoT/OT devices. | `1.2.3.4`, `IOS 15.2(4)` |
| **First seen** | No | The date and time the device was first observed in your environment. Useful for identifying newly appearing devices. | `1/15/2026 10:30 AM` |
| **Exclusion state** | No | Whether the device is excluded from Microsoft Defender Vulnerability Management assessments. Excluded devices don't contribute to your organization's exposure score. See [Manage device scope and relevance](manage-device-scope-relevance.md). | Not excluded, Excluded |
| **Device value** | No | The priority value you assigned to the device. Devices marked **High** receive priority treatment in exposure score calculations. | High, Low |
| **OS distribution** | No | The specific distribution or edition of the OS. | Windows 11 Enterprise, Ubuntu 22.04, Red Hat 9 |
| **Site** | No | The Defender for IoT site that the device belongs to. Requires a Defender for IoT license. | `Building-A`, `Factory-Floor-1` |

### Network devices tab

The Network devices tab shows columns relevant to network infrastructure. Default columns include: **IP**, **Vendor**, **Model**, **Name**, **Discovery sources**, **Risk level**, **Exposure level**, **OS distribution**, **OS version**, **Last device update**, **Tags**.

Additional columns such as **Device subtype**, **Firmware version**, **First seen**, and **Site** are available through **Customize columns**.

### IoT/OT devices tab

The IoT/OT devices tab shows columns relevant to IoT and OT devices. Default columns include: **IP**, **MAC address**, **Name**, **Device type**, **Device subtype**, **Vendor**, **Model**, **Risk level**, **Exposure level**, **Discovery sources**, **OS distribution**, **OS version**, **Last device update**, **Tags**.

Additional columns such as **Firmware version**, **First seen**, **Site**, and **Exclusion state** are available through **Customize columns**.

### Computers & Mobile tab

The Computers & Mobile tab shows columns relevant to enterprise endpoints. Default columns include: **Name**, **Domain**, **Device AAD ID**, **Risk level**, **Exposure level**, **OS platform**, **Windows version**, **Criticality level**, **Sensor health state**, **Onboarding status**, **Discovery sources**, **Last device update**, **Tags**, **Device role**, **Security operations**, **Managed by**, **Managed by status**, **Mitigation status**, **Cloud platforms**.

Additional columns such as **IP**, **MAC address**, **Device subtype**, **Firmware version**, **First seen**, **Exclusion state**, **Device value**, **OS distribution**, and **Site** are available through **Customize columns**.

### Uncategorized devices tab

The Uncategorized devices tab shows columns for devices that couldn't be classified into a specific category. Default columns include: **Name**, **Vendor**, **IP**, **OS distribution**, **OS version**, **Last device update**, **Tags**.

Additional columns such as **MAC address**, **Device type**, **Device subtype**, **Risk level**, **Exposure level**, **First seen**, and **Exclusion state** are available through **Customize columns**.

## Filters reference

Use filters to narrow the device inventory to specific device subsets. The following table provides detailed descriptions of each filter, its possible values, and guidance on when to use it.

| Filter | Available on tabs | Description | Values | When to use |
|--------|-------------------|-------------|--------|-------------|
| **Cloud platforms** | All devices, Computers & mobile | The cloud environment where the device runs. Devices can be hosted in Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), connected through Azure Arc, or running on-premises (None). | Azure, AWS, GCP, Arc, None | Filter to see only cloud-hosted devices, or use **None** to find on-premises devices. Useful for teams responsible for specific cloud environments. |
| **Criticality level** | All devices, Computers & mobile | The business criticality assigned through [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management). **Very high** indicates a business-critical asset. | Very high, High, Medium, Low, None | Focus on your most important assets. Use **Very high** to review business-critical devices that need the strongest protections. |
| **Device category** | All devices | The broad classification of the device — equivalent to the tab the device appears on. | BMS, Computers and Mobile, IoT, Medical, Network Device, OT, Unknown | Use on the **All devices** tab to narrow to a specific device type without switching tabs. Useful when combining with other filters. |
| **Device subtype** | All devices, IoT/OT | A granular classification within the device type. Especially relevant for IoT/OT devices where "Printer" or "Camera" alone isn't specific enough. | Free text entry or select from discovered values (for example, Video conference, Smart TV, VoIP Phone) | Drill down into specific kinds of IoT/OT devices. For example, find all video conferencing systems to assess firmware update status. |
| **Device type** | All devices, IoT/OT | The specific type of device within a category. For computers and mobile, this is typically Workstation or Server. For IoT, categories like Printer, Camera, and Router are common. | Free text entry or select from discovered values (for example, Audio and Video, Printer, Router) | Find all devices of a particular type. For example, filter for all printers to check their security posture. |
| **Device role** | All | The functional role assigned to the device through [predefined classification rules](/security-exposure-management/predefined-classification-rules-and-levels) in Security Exposure Management. Roles include Domain Controller, DNS Server, Exchange Server, and others. | See [Predefined classifications](/security-exposure-management/predefined-classification-rules-and-levels) | Identify critical infrastructure devices. For example, find all Domain Controllers to verify they have the latest patches. |
| **Device value** | All | The priority value you assigned to the device. **High**-value devices are weighted more heavily in exposure score calculations. | High, Low | Review which devices you marked as high priority, or find low-value devices that might not need the same level of attention. |
| **Discovery sources** | All | The mechanism that detected the device and added it to the inventory. This field directly answers the question "how did this device get here?" | Various sources including MDE, Microsoft Defender for IoT, MDATP, Network scan | Understand how devices were found. Filter for non-MDE sources to see devices discovered through network scanning or IoT integration. |
| **Exclusion state** | All | Whether the device is excluded from [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) assessments. Excluded devices don't affect your exposure score or generate security recommendations. | Not excluded, Excluded | Review your exclusion list periodically. Find excluded devices to determine if any should be brought back into vulnerability management scope. See [Manage device scope and relevance](manage-device-scope-relevance.md). |
| **Exposure level** | All | How vulnerable the device is based on the number and severity of unresolved security recommendations. See [Exposure level values](#exposure-level-values). | High, Medium, Low, No data available | Prioritize remediation. Filter for **High** exposure to find devices that need immediate patching or configuration changes. |
| **First seen** | All tabs except Network devices | When the device first appeared in your inventory. The actual date the sensor or discovery mechanism originally detected the device. | Last 7 days, Over 7 days ago | Find newly discovered devices that might need investigation or onboarding. Use **Last 7 days** to see recent additions. |
| **Group** | All devices, Computers & mobile, Network devices | The device group the device belongs to, as configured in [device groups](machine-groups.md). Device groups control role-based access (RBAC) — security analysts only see devices in their assigned groups. | Free text entry matching configured group names | Scope your view to devices in a specific group. Useful when you manage a subset of devices (for example, a regional group or business unit). |
| **Internet facing** | All devices, Computers & mobile | Whether the device has been identified as accessible from the internet. Internet-facing devices are at higher risk because they can be directly targeted by external attackers. | Yes, No | Find internet-facing devices that need hardened configurations, additional monitoring, or reduced attack surface. See [Internet facing devices](investigate-machines.md#investigate-internet-facing-devices). |
| **Managed by** | All devices, Computers & mobile | The management or security tool responsible for the device. See [Managed by values](#managed-by-values). | Intune, ConfigMgr, MDE, Unknown | Identify unmanaged devices (**Unknown**) that should be brought under management tool coverage. Verify consistent management across your environment. |
| **Mitigation status** | All devices, Computers & mobile | Whether a response action is currently applied to the device. **Contained** means the device's network access is restricted by Defender for Endpoint. **Isolated** means the device is fully isolated from the network. | Contained, Isolated | During incident response, find all devices that are currently isolated or contained. Verify that response actions are applied to the right devices. |
| **Model** | All devices | The hardware model of the device, as reported by the device or discovered through probing. Primarily useful for network and IoT/OT devices. | Free text entry or select from discovered values | Find devices from a specific model that might be affected by a vendor advisory or firmware vulnerability. |
| **Onboarding status** | All devices, Computers & mobile | Whether the device has the Defender for Endpoint agent installed and reporting telemetry. See [Onboarding status values](#onboarding-status-values). | Onboarded, Can be onboarded, Unsupported, Insufficient info | Track your onboarding progress. Filter for **Can be onboarded** to find discovered devices that should be prioritized for agent deployment. |
| **OS distribution** | All devices, Computers & mobile | The specific edition or distribution of the OS. More granular than OS Platform. | Windows 11, Windows 10, Windows Server, Linux, macOS, iOS, Android, Other | Find devices running a specific OS version that needs patches or has known vulnerabilities. |
| **OS Platform** | All devices, Computers & mobile | The operating system family. Use this for broad OS-level filtering; use **OS distribution** for more specific results. | Windows, macOS, Linux, iOS, Android | Scope your view to a specific OS family. For example, find all Linux servers for a security review. |
| **OS version** | All devices | The specific version of the operating system. | Free text entry or select from discovered values | Find devices running a particular OS build or version number. |
| **Risk level** | All | The overall risk of the device based on active alerts and threat signals. See [Risk level values](#risk-level-values). | High, Medium, Low, Informational, No known risks | Prioritize investigation. Filter for **High** risk to find devices with active, high-severity alerts that need immediate attention. |
| **Sensor health state** | All devices, Computers & mobile | The health status of the Defender for Endpoint agent on onboarded devices. See [Sensor health state values](#sensor-health-state-values). | Active, Inactive, No sensor data, Impaired communications, Misconfigured | Monitor sensor health. Filter for **Inactive**, **No sensor data**, **Impaired communications**, or **Misconfigured** to find devices that aren't properly reporting to the service. Follow [Fix unhealthy sensors](fix-unhealthy-sensors.md). |
| **Security operations** | All devices, Computers & mobile | The level of security operations access for the device, based on device group assignment. | Restricted, Full | Identify devices with restricted security operations access that might need group reassignment. |
| **Firmware version** | All devices | The firmware version running on the device. Primarily relevant for network and IoT/OT devices. | Free text entry or select from discovered values | Find devices running a specific firmware version, for example to check for a known firmware vulnerability. |
| **Site** | All devices, IoT/OT | The Defender for IoT site that the device belongs to. Sites represent physical locations or network segments defined in your Defender for IoT configuration. This filter is only visible when a Defender for IoT license is active. | Various site names from your configuration | Scope your view to a specific physical site or location. Useful for facility-specific security reviews. |
| **Tags** | All | Custom labels applied to devices for grouping, filtering, and targeting. Tags can be set manually on individual devices, applied through dynamic tagging rules, or added automatically by the system (for example, `internet-facing`). | Free text entry matching tag names | Filter for a specific business context. For example, find all devices tagged `Finance` or `HQ-Building-A`. See [Create and manage device tags](machine-tags.md). |
| **Transient device** | All | Whether the device appears intermittently on the network. Transient devices connect briefly and disappear — common with personal devices, guest devices, or devices used temporarily. These devices can add noise to your inventory. | Yes, No | Reduce noise in your inventory. Filter for **No** to focus on persistent devices. Review transient devices periodically. See [Manage device scope and relevance](manage-device-scope-relevance.md). |
| **Vendor** | All devices | The manufacturer of the device hardware, as reported by the device or discovered by Defender for Endpoint. Primarily useful for network and IoT/OT devices. | Free text entry or select from discovered values (for example, Cisco, HP, Dell) | Find all devices from a specific vendor, for example to assess impact of a vendor-specific vulnerability or firmware update. |
| **Windows version** | Computers & mobile | The specific Windows version running on the device. Only relevant on the **Computers & mobile** tab. | Various Windows versions (for example, 22H2, 21H2, 1809) | Find devices running an outdated or end-of-support Windows version that needs to be upgraded. |

> [!NOTE]
> The **Exposure level** filter value of **No data available** can occur when:
>
> - The device is inactive (stopped reporting for more than 30 days).
> - The OS on the device isn't supported. For more information, see [minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).
> - The agent software on the device is stale (unlikely).

## Key field values explained

The following sections explain the most important field values in detail. Understanding these values helps you interpret device inventory data and decide what actions to take.

### Onboarding status values

The **Onboarding status** tells you whether a device has the Defender for Endpoint agent installed. This field is key to understanding why a device appears in your inventory and what level of security data is available.

| Value | What it means | What to do |
|-------|--------------|------------|
| **Onboarded** | The device has the Defender for Endpoint sensor installed and is actively reporting security telemetry. Full threat protection, vulnerability assessment, and response actions are available. | No action needed. Monitor sensor health to make sure the device continues reporting. |
| **Can be onboarded** | The device was discovered on your network and runs a supported operating system, but doesn't have the Defender for Endpoint agent installed yet. This is the most common status for discovered (unmanaged) devices. | Prioritize onboarding this device. Deploy the Defender for Endpoint agent to gain full visibility and protection. See [Onboard devices](onboarding.md). |
| **Unsupported** | The device was discovered but runs an operating system or platform that Defender for Endpoint doesn't support for onboarding. | You can't install the Defender for Endpoint agent on this device. Consider compensating controls such as network segmentation or monitoring through Defender for IoT. See [minimum requirements](minimum-requirements.md). |
| **Insufficient info** | The device was discovered but Defender for Endpoint couldn't gather enough information to determine onboarding eligibility. This can happen when a device is only briefly seen on the network or responds minimally to discovery probes. | Wait for additional data from subsequent discovery cycles, or investigate the device manually. The status might update over time as more information is collected. |

### Sensor health state values

The **Sensor health state** indicates whether the Defender for Endpoint agent on an onboarded device is working correctly. This field only applies to onboarded devices.

> [!NOTE]
> In the portal filter, **Impaired communications** and **No sensor data** appear as sub-values under **Misconfigured**. All three represent unhealthy sensor states that need investigation.

| Value | What it means | What to do |
|-------|--------------|------------|
| **Active** | The sensor is functioning correctly and regularly sending telemetry to the Defender for Endpoint service. The device is fully protected and monitored. | No action needed. |
| **Inactive** | The device has the sensor installed but hasn't communicated with the Defender for Endpoint service recently (typically 7 or more days). This can happen when a device is turned off, disconnected from the network, or has a connectivity issue. | Investigate the device. It might be offline, decommissioned, or experiencing network connectivity problems. See [Fix unhealthy sensors](fix-unhealthy-sensors.md). |
| **No sensor data** | The device hasn't sent any sensor data to the Defender for Endpoint service. This can occur when a device is newly onboarded and hasn't started reporting yet, or when there's a fundamental connectivity issue preventing data transmission. | Verify the device is powered on and connected to the network. Confirm the onboarding process completed successfully. See [Fix unhealthy sensors](fix-unhealthy-sensors.md). |
| **Impaired communications** | The device is communicating with the service but with degraded or intermittent connectivity. The sensor might be sending partial telemetry or experiencing periodic communication failures. | Check network connectivity, proxy settings, and firewall rules. The device might have restricted access to Defender for Endpoint service URLs. See [Fix unhealthy sensors](fix-unhealthy-sensors.md). |
| **Misconfigured** | The sensor is partially or improperly configured. The device might be communicating with the service but not sending complete telemetry. Specific configuration issues can include missing prerequisites, incorrect proxy settings, or outdated sensor versions. | Review and fix the sensor configuration. See [Fix unhealthy sensors](fix-unhealthy-sensors.md) for troubleshooting steps. |

### Risk level values

The **Risk level** represents the overall threat risk of a device, based on a combination of factors including active alerts, alert severity, and unresolved alert history.

| Value | What it means | What to do |
|-------|--------------|------------|
| **High** | The device has active high-severity alerts or multiple unresolved alerts. It represents a significant security risk that requires immediate attention. | Investigate immediately. Review active alerts on the device page and take response actions as needed. |
| **Medium** | The device has medium-severity alerts or a moderate number of unresolved alerts. | Investigate soon. Review alerts and remediate issues before they escalate. |
| **Low** | The device has low-severity alerts. Risk is present but limited. | Monitor and address when resources allow. |
| **Informational** | The device has informational-level alerts that don't indicate a significant threat. | Review alerts for awareness. No urgent action required. |
| **No known risks** | No active alerts or known threats on this device. | No action needed. The device is in a healthy state from a threat perspective. |

### Exposure level values

The **Exposure level** reflects the device's vulnerability posture based on pending security recommendations from [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management).

| Value | What it means | What to do |
|-------|--------------|------------|
| **High** | The device has many or critical unresolved security recommendations. Software might be unpatched, configurations might be insecure, or known vulnerabilities haven't been addressed. | Prioritize remediation. Review security recommendations on the device page and address the most critical items first. |
| **Medium** | The device has a moderate number of unresolved security recommendations. | Plan remediation. Schedule patching or configuration changes during next maintenance window. |
| **Low** | The device has few or no significant unresolved security recommendations. It's in a relatively secure state. | Continue monitoring. The device is well-maintained from a vulnerability perspective. |
| **No data available** | Defender for Endpoint doesn't have enough information to calculate an exposure level. This occurs when the device is inactive (not reporting for over 30 days), runs an unsupported OS, or has a stale agent. | Investigate why data isn't available. The device might need to be reconnected or have its agent updated. See [minimum requirements](minimum-requirements.md). |

### Managed by values

The **Managed by** field indicates which management or security tool is responsible for the device.

| Value | What it means |
|-------|--------------|
| **Intune** | The device is managed by Microsoft Intune, meaning it receives policies, compliance checks, and configuration profiles through Intune. |
| **ConfigMgr** | The device is managed by Microsoft Configuration Manager (formerly SCCM). Configuration Manager handles patching, software deployment, and compliance. |
| **MDE** | The device is managed directly by Microsoft Defender for Endpoint. The MDE agent is the primary security management tool on this device. |
| **Unknown** | Defender for Endpoint can't determine the management tool responsible for the device. This is common for discovered (non-onboarded) devices or devices not enrolled in any management platform. Devices with **Unknown** management should be evaluated for enrollment in your management and security tools. |

### Discovery sources values

The **Discovery sources** field tells you how a device was found and added to the device inventory. This directly answers the question "how did this device get here?"

| Value | What it means |
|-------|--------------|
| **MDE** | The device was discovered by the Microsoft Defender for Endpoint sensor running on onboarded devices. This includes both passive observation of network traffic and active probing (depending on your [discovery mode](configure-device-discovery.md)). |
| **Microsoft Defender for IoT** | The device was discovered by the Defender for IoT integration. Typically an IoT or OT device identified through specialized device fingerprinting. |
| **MDATP** | Legacy discovery source label for devices found by Defender for Endpoint. Functionally equivalent to **MDE**. |
| **Network scan** | The device was found through a network scan configured in device discovery settings. This applies to network devices (routers, switches) discovered using SNMP authentication. See [Network devices](network-devices.md). |
| **Manual** | The device was manually added or registered. |

> [!NOTE]
> A device can have multiple discovery sources if it was found by more than one mechanism. For example, a printer might show both **MDE** (discovered by the sensor) and **Microsoft Defender for IoT** (identified by the IoT integration).

## Related articles

- [Explore devices in the device inventory](machines-view-overview.md)
- [Device discovery overview](device-discovery.md)
- [Manage device scope and relevance](manage-device-scope-relevance.md)
- [Investigate devices](investigate-machines.md)
- [Create and manage device tags](machine-tags.md)
