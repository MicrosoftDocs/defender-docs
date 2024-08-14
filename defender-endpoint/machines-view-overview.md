---
title: Device inventory
description: Learn about the available features that you can use from the Devices list such as sorting, filtering, and exporting the list to enhance investigations.
ms.service: defender-endpoint
ms.author: siosulli
author: siosulli
ms.reviewer: yongrhee
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
search.appverid: met150
ms.date: 07/08/2024
---

# Device inventory

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-machinesview-abovefoldlink)

The **Device inventory** shows a list of the devices in your network where alerts were generated. By default, the queue displays devices seen in the last 30 days. At a glance, you see information such as domain, risk level, OS platform, and other details for easy identification of devices most at risk.

> [!NOTE]
> The device inventory is available in Microsoft Defender XDR services. The information that's available to you can differ depending on your license. To get the most complete set of capabilities, use [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md).
> 
> Risk Level, which can influence enforcement of Conditional Access and other security policies in Microsoft Intune, is now available for Windows devices.

There are several options you can choose from to customize the devices list view. On the top navigation you can:

- Add or remove columns
- Export the entire list in CSV format
- Select the number of items to show per page
- Apply filters

During the onboarding process, the **Devices list** is gradually populated with devices as they begin to report sensor data. Use this view to track your onboarded endpoints as they come online, or download the complete endpoint list as a CSV file for offline analysis.

> [!NOTE]
> 
> If you export the devices list, it contains every device in your organization. It might take a significant amount of time to download, depending on how large your organization is. Exporting the list in CSV format displays the data in an unfiltered manner. The CSV file includes all devices in the organization, regardless of any filtering applied in the view itself.
> 
> In addition, when you export the devices list, the antivirus status shows as `Not-Supported`. For antivirus status, use the recently released [Microsoft Defender Antivirus health report](device-health-microsoft-defender-antivirus-health.md) instead. This report allows you to export even more details.

The following image depicts the devices list:

:::image type="content" source="media/device-inventory.png" alt-text="The list of devices" lightbox="media/device-inventory.png":::

## Sort and filter the device list

You can apply the following filters to limit the list of alerts and get a more focused view.

### Device name

During the Microsoft Defender for Endpoint onboarding process, devices onboarded to Defender for Endpoint are gradually populated into the device inventory as they begin to report sensor data. Following this, the device inventory is populated by devices that are discovered in your network through the device discovery process. The device inventory has three tabs that list devices by:

- **Computers and Mobile**: Enterprise endpoints (workstations, servers, and mobile devices)
- **Network devices**: Devices like routers and switches
- **IoT/OT devices**: OT devices like servers or packaging systems, and enterprise IoT devices like printers and cameras
- **Uncategorized devices**: Devices that couldn't be properly classified

## Navigate to the Device inventory page

Access the device inventory page by selecting **Devices** from the **Assets** navigation menu in the [Microsoft Defender portal](https://security.microsoft.com/machines).

## Device inventory overview

The device inventory opens on the **Computers and Mobile** tab. You can see at a glance information such as device name, domain, risk level, exposure level, OS platform, criticality level, onboarding status, sensor health state, mitigation status and other details for easy identification of devices most at risk.

The **Classify critical assets** card allows you to define device groups as business critical. You might also see the **Attack path warning** card, which takes you to Attack paths to examine if any of your assets are part of an attack path. For more information, see [Overview of attack paths](/security-exposure-management/work-attack-paths-overview).

> [!NOTE]
> Classify critical assets and attack path information is part of Microsoft Security Exposure Management, which is currently in public preview.

Use the **Onboarding Status** column to sort and filter by discovered devices, and devices that are already onboarded to Microsoft Defender for Endpoint.

:::image type="content" alt-text="Image of devices list with list of devices." source="media/device-inventory.png" lightbox="media/device-inventory.png":::

From the **Network devices** and **IoT/OT devices** tabs, you'll also see information such as vendor, model, and device type:

:::image type="content" alt-text="Image of network devices list." source="media/device-inventory-networkdevices.png" lightbox="media/device-inventory-networkdevices.png":::

> [!NOTE]
> Device discovery integration with [Microsoft Defender for IoT in the Defender portal (Preview)](/defender-for-iot/microsoft-defender-iot)  is available to help locate, identify, and secure your complete OT/IOT asset inventory. Devices discovered with this integration appear on the **IoT/OT devices** tab.
>
> With Defender for IoT, you can also view and manage Enterprise IoT devices (like printers, smart TVs, and conferencing systems) as part of enterprise IoT monitoring. For more information, see [Enable Enterprise IoT security with Defender for Endpoint](/azure/defender-for-iot/organizations/eiot-defender-for-endpoint/).

At the top of each device inventory tab, you can see:

- The total number of devices.
- The number of devices that are identified as a higher risk to your organization.
- The number of your business critical assets.
- The number of devices that aren't yet onboarded.
- The number of devices with high exposure.
- The number of newly discovered devices.

You can use this information to help you prioritize devices for security posture improvements.

The **Newly discovered** device count for network devices and **IoT/OT** tabs, shows the number of new devices discovered, in the last 7 days, listed in the current view.

:::image type="content" alt-text="Image of new discovered device count." source="media/new-discovered-devices.png":::

## Explore the device inventory

There are several options you can choose from to customize the device inventory view. On the top navigation for each tab you can:

- Search for a device by name
- Search for a device by the most recently used IP or Mac address or IP address prefix
- Add or remove columns
- Export the entire list in CSV format for offline analysis
- Select the date range to display
- Apply filters

> [!NOTE]
> If you export the device list, it will contain every device in your organization. It might take a significant amount of time to download, depending on how large your organization is. Exporting the list in CSV format displays the data in an unfiltered manner. The CSV file will include all devices in the organization, regardless of any filtering applied in the view itself.

You can use the sort and filter functionality available on each device inventory tab to get a more focused view, and to help you assess and manage the devices in your organization.

The counts on the top of each tab are updated based on the current view.

## Use filters to customize the device inventory views

Filter | Description
:---|:---
**Risk level** | The risk level reflects the overall risk assessment of the device based on a combination of factors, including the types and severity of active alerts on the device. Resolving active alerts, approving remediation activities, and suppressing subsequent alerts can lower the risk level.
**Exposure level** | The exposure level reflects the current exposure of the device based on the cumulative impact of its pending security recommendations. The possible levels are low, medium, and high. Low exposure means your devices are less vulnerable from exploitation.</br></br> If the exposure level says "No data available," there are a few reasons why:</br>- Device stopped reporting for more than 30 days. In that case it's considered inactive, and the exposure isn't computed.</br>- Device OS not supported - see [minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).</br>- Device with stale agent (unlikely).
**Criticality level** | The criticality level reflects how critical a device is for your organization. The possible levels are low, medium, high, or very high. Very high means that the device is considered a business critical asset. For more information, see [Overview of critical asset management](/security-exposure-management/critical-asset-management).
**Transient devices** | By default transient devices are filtered out of the device inventory to reduce inventory noise. You can turn transient device filtering off as needed. Learn more about [transient device filtering](transient-device-tagging.md).
**OS Platform** | Filter by the OS platforms you're interested in investigating </br></br>(_Computers and mobile and IoT/OT devices only_).
**OS Version** | Filter by the OS versions you're interested in investigating. Includes Windows versions. In the Computers and mobile tab, the **Windows version** filter is available instead of **OS version**. </br></br> (_All devices only_).
**Windows version** | Filter by the Windows versions you're interested in investigating. If 'future version' appears in the Windows version field, it can mean:</br></br> - This is a pre-release build for a future Windows release</br> - The build has no version name</br> - The build version name isn't yet supported </br></br> In all these scenarios, where available, the full OS version can be seen in the device details page.</br></br> (_Computers and mobile only_).
**Sensor health state** | Filter by the following sensor health states, for devices onboard to Microsoft Defender for Endpoint:</br> - **Active**: Devices that are actively reporting sensor data to the service.</br> - **Inactive**: Devices that stopped sending signals for more than seven days.</br> - **Misconfigured**: Devices that have impaired communications with service or are unable to send sensor data.</br> Misconfigured devices can further be classified to: </br>  - No sensor data </br>  - Impaired communications </br>  For more information on how to address issues on misconfigured devices, see, [Fix unhealthy sensors](fix-unhealthy-sensors.md).</br></br> (_Computers and mobile only_).
**Onboarding status** | Onboarding status indicates whether the device is currently onboarded to Microsoft Defender for Endpoint or not. Device discovery must be enabled for this filter to appear. You can filter by the following states: </br> - **Onboarded**: The endpoint is onboarded to Microsoft Defender for Endpoint.</br> - **Can be onboarded**: The endpoint was discovered in the network as a supported device, but isn't currently onboarded. Microsoft highly recommends onboarding these devices.</br> - **Unsupported**: The endpoint was discovered in the network, but isn't supported by Microsoft Defender for Endpoint.</br> - **Insufficient info**: The system couldn't determine the supportability of the device.</br></br> (_Computers and mobile only_).
**Antivirus status** | Filter the view based on whether the antivirus status is disabled, not updated or unknown.</br></br> (_Computers and mobile only_).
**First seen** | Filter your view based on when the device was first seen in the network or when it was first reported by the Microsoft Defender for Endpoint sensor.</br></br>(_Computers and mobile and IoT/OT devices only_).
**Tags** | Filter the list based on the grouping and tagging that you've added to individual devices. See [Create and manage device tags](machine-tags.md).
**Internet facing** | Filter the list based on whether the device is internet facing.
**Group** | Filter the list based on the group you're interested in investigating.</br></br> (_Computers and mobile only_).
**Device value** | Filter the list based on whether the device is marked as high value or low value.
**Exclusion state** | Filter the list based on whether the device is excluded or not. For more information, see [Exclude devices](exclude-devices.md).
**Managed by** | Managed by indicates how the device is being managed. You can filter by:</br> - Microsoft Defender for Endpoint</br> - Microsoft Intune, including co-management with Microsoft Configuration Manager via tenant attach</br>- Microsoft Configuration manager (ConfigMgr)</br> - Unknown: This issue could be due the running an outdated Windows version, GPO management, or another non-Microsoft MDM.</br></br> (_Computers and mobile only_)
**Device type** | Filter by the device type you're interested in investigating.</br></br> (_All devices and IoT/OT devices only_)
**Device subtype** | Filter by the device subtype you're interested in investigating.</br></br> (_All devices and IoT/OT devices only_)
**Device category** | Filter by the device category you're interested in investigating.</br></br> (_All devices and IoT/OT devices only_)
**Vendor** | Filter by the device vendor you're interested in investigating.</br></br> (_All devices only_)
**Model** | Filter by the device model you're interested in investigating.</br></br> (_All devices only_)
**Mitigation status** | Filter by isolation or containment status of a device.
**Site** | Filter by site name. Used for the Defender for IoT [site security](/defender-for-iot/site-security-overview) feature.</br></br> (_All devices and IoT/OT devices only, for customers with a Defender for IoT license._)

## Use columns to customize the device inventory views

You can add or remove columns from the view and sort the entries by clicking on an available column header.

On the **All devices** tab, select **Customize columns** to see the columns available. The default values are checked in the following image:

:::image type="content" alt-text="Image of all devices columns" source="media/alldevicescolumns_new.png":::

Firmware information for OT devices is displayed in the **OS version** and **Model** columns.

On the **Computer and Mobiles** tab, select **Customize columns** to see the columns available. The default values are checked in the following image:

:::image type="content" alt-text="Image of computers and mobiles columns" source="media/computerandmobilescolumns_new.png":::

On the **Network devices** tab, select **Customize columns** to see the columns available. The default values are checked in the following image:

:::image type="content" alt-text="Image of network device columns" source="media/networkdevicescolumns_new.png":::

On the **IoT/OT devices** tab, select **Customize columns** to see the columns available. The default values are checked in the following image:

:::image type="content" alt-text="Image of IoT device columns" source="media/iotdevicescolumns_new.png":::

## Related articles

[Investigate devices in the Microsoft Defender for Endpoint Devices list](investigate-machines.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
