---
title: Explore devices in the device inventory
description: Learn how to view, customize, and manage devices in the Microsoft Defender for Endpoint device inventory.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.reviewer: yongrhee
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: how-to
search.appverid: met150
ms.date: 02/03/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Vulnerability Management

---

# Explore devices in the device inventory

The **Device inventory** is the authoritative source for all devices visible to Microsoft Defender for Endpoint. It shows devices that are onboarded (with the full agent installed) and devices discovered on your network through device discovery.

This article explains how to view, customize, and manage devices in your device inventory.

## View devices in the device inventory

Access the device inventory and review the devices in your environment.

### Navigate to the device inventory

In the Defender portal at <https://security.microsoft.com>, go to **Assets** \> **Devices**. Or, to go directly to the **Device inventory** page, use <https://security.microsoft.com/machines>.

### Review device information and counts

The device inventory opens on the **All devices** tab. You can see information such as device name, domain, risk level, exposure level, OS platform, criticality level, onboarding status, sensor health state, mitigation status, and other details for easy identification of devices most at risk.

> [!NOTE]
> The device inventory is available in Microsoft Defender services. The available information might differ depending on your license. To get the most complete set of capabilities, use [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md).
>
> Risk Level, which can influence enforcement of Conditional Access and other security policies in Microsoft Intune, is available for Windows devices.

| What you can do | Details |
|-----------------|---------|
| **View device categories** | The device inventory has the following tabs:<br>• **All devices**: All devices in your environment<br>• **Computers & mobile**: Enterprise endpoints (workstations, servers, and mobile devices)<br>• **Network devices**: Routers and switches<br>• **IoT/OT devices**: Enterprise IoT devices (printers, cameras) and OT devices (industrial control systems)<br>• **Uncategorized devices**: Devices that couldn't be properly classified |
| **Review device counts** | At the top of each tab, view these counts:<br>• **Total**: Total number of devices<br>• **Critical assets**: Number of business critical assets (**All devices** tab only)<br>• **High risk**: Devices identified as higher risk to your organization<br>• **High exposure**: Devices with high exposure<br>• **Not onboarded**: Devices not yet onboarded (**All devices** and **Computers & mobile** tabs only)<br>• **Newly discovered**: Newly discovered devices within the last 7 days (all tabs except **Computers & mobile**)<br><br>Use this information to prioritize devices for security posture improvements. |
| **View special cards** | • **Classify critical assets**: Define device groups as business critical<br>• **Attack path warning**: Examine if any assets are part of an attack path (requires Microsoft Security Exposure Management) |
| **Check device details** | For each device, view information including:<br>• Device name, domain, and device ID<br>• Risk level, exposure level, criticality level<br>• OS platform, distribution, and version<br>• Onboarding status and sensor health state<br>• Last device update and first seen time<br>• Tags, exclusion state, and device role<br>• Managed by (Intune, ConfigMgr, MDE, or Unknown)<br>• Mitigation status (Contained, Isolated)<br>• Cloud platforms (Azure, AWS, GCP, Arc, None)<br><br>For **Network devices** and **IoT/OT devices** tabs, also view vendor, model, device type, and device subtype. |

> [!NOTE]
> Device discovery integration with [Microsoft Defender for IoT in the Defender portal (Preview)](/defender-for-iot/microsoft-defender-iot) is available to help locate, identify, and secure your complete OT/IOT asset inventory. Devices discovered with this integration appear on the **IoT/OT devices** tab.
>
> With Defender for IoT, you can also view and manage Enterprise IoT devices (like printers, smart TVs, and conferencing systems) as part of enterprise IoT monitoring. For more information, see [Enable Enterprise IoT security with Defender for Endpoint](/azure/defender-for-iot/organizations/eiot-defender-for-endpoint/).

## Customize device inventory views

Customize how you view devices in the inventory by adding or removing columns, applying filters, searching, and exporting data.

### Search for devices

| Task | Steps |
|------|-------|
| **Search by device name** | Use the search box at the top of the device inventory to find a device by name. |
| **Search by IP address** | Search for a device by the most recently used IP address or IP address prefix. |
| **Search by MAC address** | Search for a device by its MAC address. |

### Customize columns

Choose which columns to display in your device inventory view.

| Task | Steps |
|------|-------|
| **Add or remove columns** | 1. Select :::image type="icon" source="media/m365-cc-sc-customize-icon.png" border="false"::: **Customize columns** at the top of the device inventory<br>2. Select or clear the checkboxes for columns you want to show or hide<br>3. The changes apply immediately to your view |
| **View default columns** | The default columns (marked with <sup>*</sup>) vary by tab:<br>• **All devices**: Name, IP, MAC address, Criticality level, Device category, Device type, Domain, Device AAD id, Risk level, Exposure level, OS platform, OS version, Sensor health state, Onboarding status, Discovery sources, Last device update, Tags, Device role, Managed by, Managed by status, Mitigation status, Cloud platforms<br>• **Computers & mobile**: Name, Domain, Device AAD id, Risk level, Exposure level, OS platform, Windows version, Sensor health state, Onboarding status, Discovery sources, Last device update, Tags, Device role, Managed by, Managed by status, Cloud platforms, Criticality level<br>• **Network devices**: IP, MAC address, Vendor, Model, Name, Discovery sources, Risk level, Exposure level, OS distribution, OS version, Last device update, Tags<br>• **IoT/OT devices**: IP, MAC address, Name, Device type, Device subtype, Vendor, Model, Risk level, Exposure level, OS distribution, OS version, Last device update, Tags<br>• **Uncategorized devices**: Name, Vendor, IP, Risk level, Exposure level, OS distribution, OS version, Last device update, Tags |
| **View all available columns** | Additional columns not shown by default include:<br>• Device subtype, Firmware version, First seen, Exclusion state, Device value, Discovery sources, Site (for IoT/OT devices), and others depending on the tab |

> [!TIP]
> To see all columns, you likely need to do one or more of the following steps:
>
> - Horizontally scroll in your web browser.
> - Narrow the width of appropriate columns.
> - Zoom out in your web browser.

### Apply filters

Use filters to narrow down the list of devices and focus on specific device categories.

| Task | Steps |
|------|-------|
| **Open filters** | Select the **Filter** icon at the top-right of the device inventory. |
| **Apply a filter** | 1. In the filter panel, select a filter category (for example, **Risk level**, **Onboarding status**, **Tags**)<br>2. Select or enter the values you want to filter by<br>3. Select **Apply** |
| **Clear filters** | Select **Clear all filters** in the filter panel to remove all active filters. |
| **View active filters** | Active filters appear as pills at the top of the device inventory. Select the **X** on a filter pill to remove that specific filter. |

> [!NOTE]
> If you're not seeing some devices, try clearing your filters.
>
> To clear your filters, navigate to the top-right of the **Devices list** and select the  **Filter** icon. On the flight-out pane, select the **Clear all filters** button.

The following table lists available filters by device inventory tab:

| Filter | Available on tabs | Description | Values |
|--------|-------------------|-------------|--------|
| **Cloud platforms** | All devices, Computers & mobile | The cloud platform that the device belongs to | Azure, AWS, GCP, Arc, None |
| **Criticality level** | All devices, Computers & mobile | The criticality level assigned to the device | Very high (business critical asset), High, Medium, Low, None |
| **Device category** | All devices | The category assigned to the device | BMS, Computers and Mobile, IoT, Medical, Network Device, OT, Unknown |
| **Device subtype** | All devices, IoT/OT | The subtype assigned to the device | Enter a value or select an available value (for example, Video conference) |
| **Device type** | All devices, IoT/OT | The type assigned to the device | Enter a value or select an available value (for example, Audio and Video) |
| **Device role** | All | The specific role of the device within the organization | See [Predefined classifications](/security-exposure-management/predefined-classification-rules-and-levels) |
| **Device value** | All | The assigned value of the device | High, Low |
| **Discovery sources** | All | The source reporting on the device | Various discovery sources |
| **Exclusion state** | All | Whether the device is excluded from vulnerability management | Not excluded, Excluded |
| **Exposure level** | All | The exposure level based on pending security recommendations | High, Medium, Low (less vulnerable), No data available |
| **First seen** | All tabs except Network devices | When the device was first seen on the network or reported by the sensor | Last 7 days, Over 7 days ago |
| **Group** | All devices, Computers & mobile, Network devices | Device groups | Enter a value in the box |
| **Internet facing** | All devices, Computers & mobile | Whether the device is internet facing | Yes, No |
| **Managed by** | All devices, Computers & mobile | How the device is being managed | Intune, ConfigMgr, MDE, Unknown |
| **Mitigation status** | All devices, Computers & mobile | The mitigation status of the device | Contained, Isolated |
| **Model** | All devices | The model of the device | Enter a value or select from available values |
| **Onboarding status** | All devices, Computers & mobile | Whether the device is onboarded in Defender for Endpoint | Onboarded, Can be onboarded, Unsupported, Insufficient info |
| **OS distribution** | All devices, Computers & mobile | The distribution of the operating system | Windows 11, Windows 10, Windows Server, Linux, macOS, iOS, Android, Other |
| **OS Platform** | All devices, Computers & mobile | The operating system on the device | Various OS platforms |
| **Risk level** | All | The overall risk assessment of the device | High, Medium, Low, Informational, No known risk |
| **Sensor health state** | All devices, Computers & mobile | The health state of the sensor for onboarded devices | Active, Inactive, Misconfigured |
| **Site** | All devices, IoT/OT | Used for Defender for IoT site security (requires Defender for IoT license) | Various sites |
| **Tags** | All | Tags added to devices for organization and targeting | Enter tag names |
| **Transient device** | All | Devices that appear intermittently on the network | Yes, No |
| **Vendor** | All devices | The vendor of the device | Enter a value or select from available values |
| **Windows version** | Computers & mobile | The version of Windows | Various Windows versions |

> [!NOTE]
> The **Exposure level** filter value of **No data available** can occur when:
> - The device is inactive (stopped reporting for more than 30 days)
> - The OS on the device isn't supported (see [minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md))
> - The agent software on the device is stale (unlikely)

### Sort devices

| Task | Steps |
|------|-------|
| **Sort by column** | Select any column header to sort devices by that column in ascending or descending order. |
| **Multi-column sorting** | Hold **Shift** and select multiple column headers to sort by multiple columns. |

### Export device list

| Task | Steps |
|------|-------|
| **Export to CSV** | 1. Select **Export** at the top of the device inventory<br>2. Wait for the export to complete (might take time for large organizations)<br>3. Download the CSV file containing all devices in your organization |

> [!NOTE]
> If you export the devices list, it contains every device in your organization. It might take a significant amount of time to download, depending on how large your organization is.
>
> When you export the devices list, the antivirus status shows as `Not-Supported`. For antivirus status, use the recently released [Microsoft Defender Antivirus health report](device-health-microsoft-defender-antivirus-health.md) instead. This report allows you to export even more details.
>
> The exported CSV contains unfiltered data for all devices in the organization, regardless of any filters applied in the UI.

> [!TIP]
> The API, UI, export, and AH interfaces all draw from a single authoritative data source. However, because each is powered by separate backend systems with different update frequencies, slight variations may appear across views—especially in short-term queries or recently reactivated devices. Each interface is optimized for its specific use case: export for large data retrieval, UI for fast interactive tasks like tag management, and AH for tracking device update history over time.

## Common device inventory tasks

Use the device inventory to perform common security tasks.

| Task | Description | Steps |
|------|-------------|-------|
| **Identify high-risk devices** | Find devices with active alerts or high risk levels | 1. Sort by **Risk level** column (descending)<br>2. Or use **Risk level** filter to show only High risk devices<br>3. Review devices and take appropriate actions |
| **Track onboarding progress** | Monitor which devices are onboarded vs. discovered | 1. Use **Onboarding status** filter<br>2. Select **Can be onboarded** to see discovered devices that should be onboarded<br>3. Initiate onboarding for high-priority devices |
| **Find devices needing attention** | Identify devices with security configuration issues | 1. Sort by **Exposure level** column (descending)<br>2. Review devices with High exposure<br>3. Check security recommendations on device pages |
| **Monitor sensor health** | Check which devices have healthy sensors | 1. Use **Sensor health state** filter<br>2. Select **Inactive** or **Misconfigured** to find problem devices<br>3. Follow [Fix unhealthy sensors](fix-unhealthy-sensors.md) guidance |
| **View internet-facing devices** | Identify devices exposed to the internet | 1. Use **Tags** column or filter to find devices with "internet-facing" tag<br>2. Or use **Internet facing** filter (if available)<br>3. Review these devices for additional security measures |
| **Manage transient devices** | View or hide devices that appear intermittently | 1. Use **Transient device** filter<br>2. Select **Yes** to view only transient devices<br>3. Select **No** to exclude them from view<br>4. See [Manage device scope and relevance](manage-device-scope-relevance.md) |
| **Review excluded devices** | Check which devices are excluded from vulnerability management | 1. Use **Exclusion state** filter<br>2. Select **Excluded** to view excluded devices<br>3. Review exclusion details and stop exclusion if needed |
| **Organize devices by tags** | Group and filter devices using custom tags | 1. Use **Tags** filter to view devices with specific tags<br>2. Add **Tags** column to see all device tags<br>3. See [Create and manage device tags](machine-tags.md) |
| **Focus on critical assets** | View only business critical devices | 1. Use **Criticality level** filter<br>2. Select **Very high** to see business critical assets<br>3. Review critical asset counts at the top of the tab |
| **Filter by management method** | View devices managed by specific tools | 1. Use **Managed by** filter<br>2. Select Intune, ConfigMgr, MDE, or Unknown<br>3. Review management status for compliance |

## Next steps

Now that you understand how to explore the device inventory, continue through the device lifecycle:

- [Manage device scope and relevance](manage-device-scope-relevance.md): Control which devices are relevant to your security operations
- [Create and manage device tags](machine-tags.md): Add business context and organize devices into groups
- [Target devices with device groups and tags](targeting-devices.md): Use tags to apply security actions at scale
- [Investigate devices](investigate-machines.md): Deep-dive into specific devices for incident response

## Next steps

Now that you understand your device inventory, continue through the device lifecycle:

- **[Manage device scope and relevance](manage-device-scope-relevance.md)**: Control which devices are relevant to your security operations
- **[Create and manage device tags](machine-tags.md)**: Add business context and organize devices into groups
- **[Target devices with device groups and tags](targeting-devices.md)**: Use tags to apply security actions at scale
- **[Investigate devices](investigate-machines.md)**: Deep-dive into specific devices for incident response