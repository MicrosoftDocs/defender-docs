---
title: Explore devices in the device inventory
description: Learn how to view, customize, and manage devices in the Microsoft Defender for Endpoint device inventory.
keywords: device inventory, explore devices, view devices, filter devices, device list, device management, device details
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.reviewer: yongrhee
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
ms.topic: how-to
search.appverid: met150
ms.date: 02/25/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Vulnerability Management

---

# Explore devices in the device inventory

The **Device inventory** is the authoritative source for all devices visible to Microsoft Defender for Endpoint. It shows devices that are onboarded (with the full agent installed) and devices discovered on your network through [device discovery](device-discovery.md).

This article explains how to view, customize, and manage devices in your device inventory.

To understand how devices appear in the inventory through onboarding and discovery, including IoT/OT devices and discovery sources, see [Devices in Microsoft Defender for Endpoint](devices-overview.md).

## View devices in the device inventory

Access the device inventory and review the devices in your environment.

### Navigate to the device inventory

In the Defender portal, go to **Assets** \> **Devices** or, to go directly to the **Device inventory** page, use <https://security.microsoft.com/machines>.

### Review device information and counts

The device inventory opens on the **All devices** tab. You can see information such as device name, domain, risk level, exposure level, OS platform, criticality level, onboarding status, sensor health state, mitigation status, and other details for easy identification of devices most at risk.

> [!NOTE]
> The device inventory is available in Microsoft Defender services. The available information might differ depending on your license. To get the most complete set of capabilities, use [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md).
>
> Risk Level, which can influence enforcement of Conditional Access and other security policies in Microsoft Intune, is available for Windows devices.

When you open the device inventory, you can:

- **View device categories**: Switch between tabs (All devices, Computers & mobile, Network devices, IoT/OT, Uncategorized) to focus on specific device types.
- **Review device counts**: Check the count pills at the top of each tab (total, critical assets, high risk, high exposure, not onboarded, newly discovered) to prioritize your work.
- **View special cards**: Classify critical assets or check for attack path warnings.
- **Check device details**: View columns like risk level, exposure level, onboarding status, sensor health, managed by, tags, and more for each device.

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

1. Select :::image type="icon" source="media/m365-cc-sc-customize-icon.png" border="false"::: **Customize columns** at the top of the device inventory.
1. Select or clear the checkboxes for columns you want to show or hide. The changes apply immediately.

Default columns vary by tab.

> [!TIP]
> To see all columns, you likely need to do one or more of the following steps:
>
> - Horizontally scroll in your web browser.
> - Narrow the width of appropriate columns.
> - Zoom out in your web browser.

### Apply filters

Use filters to narrow down the list of devices and focus on specific device categories.

1. Select the **Filter** icon at the top-right of the device inventory.
1. In the filter panel, select a filter category (for example, **Risk level**, **Onboarding status**, **Tags**).
1. Select or enter the values you want to filter by.
1. Select **Apply**. Active filters appear as pills at the top of the device inventory. Select the **X** on a pill to remove that specific filter, or select **Clear all filters** in the filter panel to reset.

> [!NOTE]
> If you're not seeing some devices, try clearing your filters.
>
> To clear your filters, navigate to the top-right of the **Devices list** and select the  **Filter** icon. On the flight-out pane, select the **Clear all filters** button.

Here are a few common filter scenarios to get you started:

- Filter by **Risk level** > **High** to find devices that need immediate investigation.
- Filter by **Onboarding status** > **Can be onboarded** to find discovered devices ready for agent deployment.
- Filter by **Tags** to scope the view to a specific business group (for example, `Finance` or `HQ-Building-A`).
- Filter by **Managed by** > **Unknown** to identify unmanaged devices.

### Sort devices

1. Select any column header to sort devices by that column. Select the header again to reverse the sort order.
1. To sort by multiple columns, hold **Shift** and select additional column headers.

### Export device list

1. Select **Export** at the top of the device inventory.
1. Wait for the export to complete. For large organizations, this process might take time.
1. Download the CSV file containing all devices in your organization.

> [!NOTE]
> The exported CSV contains unfiltered data for all devices in the organization, regardless of any filters applied in the UI.
>
> Antivirus status shows as `Not-Supported` in the export. For antivirus status, use the [Microsoft Defender Antivirus health report](device-health-microsoft-defender-antivirus-health.md) instead.

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

- **[Manage device scope and relevance](manage-device-scope-relevance.md)**: Control which devices are relevant to your security operations
- **[Create and manage device tags](machine-tags.md)**: Add business context and organize devices into groups
- **[Create and manage device tags and target devices](machine-tags.md)**: Use tags to apply security actions at scale
- **[Investigate devices](investigate-machines.md)**: Deep-dive into specific devices for incident response
